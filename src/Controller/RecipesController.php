<?php

namespace App\Controller;

use App\Entity\Recipes;
use App\Form\RecipesType;
use App\Repository\RecipesRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Mime\MimeTypes;
use App\Entity\Comments;
use App\Form\CommentsType;

#[Route('/recipes')]
class RecipesController extends AbstractController
{
    #[Route('/', name: 'app_recipes_index', methods: ['GET'])]
    public function index(RecipesRepository $recipesRepository): Response
    {
        return $this->render('recipes/index.html.twig', [
            'recipes' => $recipesRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_recipes_new', methods: ['GET', 'POST'])]
public function new(Request $request, EntityManagerInterface $entityManager): Response
{
    $recipe = new Recipes();
    $form = $this->createForm(RecipesType::class, $recipe);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        $imageFile = $form['imagePath']->getData();

        if ($imageFile) {
            $mimeTypeGuesser = MimeTypes::getDefault();
            $extension = $mimeTypeGuesser->getExtensions($imageFile->getMimeType())[0] ?? 'bin';
            $newFilename = uniqid() . '.' . $extension;

            try {
                $imageFile->move(
                    $this->getParameter('images_directory'),
                    $newFilename
                );
                $recipe->setImagePath($newFilename);
            } catch (FileException $e) {
                // Gérer les exceptions liées au téléchargement du fichier
            }
        }

        // Récupérer l'utilisateur connecté
        $user = $this->getUser();

        // Assurer que l'utilisateur est connecté
        if ($user) {
            $recipe->setUserId($user);
            $recipe->setUsernameUser($user);
        }

        $entityManager->persist($recipe);
        $entityManager->flush();

        return $this->redirectToRoute('app_recipes_index', [], Response::HTTP_SEE_OTHER);
    }

    return $this->renderForm('recipes/new.html.twig', [
        'recipe' => $recipe,
        'form' => $form,
    ]);
}

    #[Route('/{id}', name: 'app_recipes_show', methods: ['GET'])]
    public function show(Recipes $recipe): Response
    {
        return $this->render('recipes/show.html.twig', [
            'recipe' => $recipe,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_recipes_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Recipes $recipe, EntityManagerInterface $entityManager): Response
{
    $form = $this->createForm(RecipesType::class, $recipe);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        $imageFile = $form['imagePath']->getData();

        // Vérifier s'il y a une nouvelle image
        if ($imageFile) {
            // Récupérer le chemin de l'ancienne image
            $oldImagePath = $recipe->getImagePath();

            // Supprimer l'ancienne image
            if ($oldImagePath) {
                $oldImagePath = $this->getParameter('images_directory') . '/' . $oldImagePath;
                if (file_exists($oldImagePath)) {
                    unlink($oldImagePath);
                }
            }

            // Uploader la nouvelle image
            $mimeTypeGuesser = MimeTypes::getDefault();
            $extension = $mimeTypeGuesser->getExtensions($imageFile->getMimeType())[0] ?? 'bin';
            $newFilename = uniqid() . '.' . $extension;

            try {
                $imageFile->move(
                    $this->getParameter('images_directory'),
                    $newFilename
                );
                $recipe->setImagePath($newFilename);
            } catch (FileException $e) {

            }
        }

        $entityManager->flush();

        return $this->redirectToRoute('app_recipes_index', [], Response::HTTP_SEE_OTHER);
    }

    return $this->renderForm('recipes/edit.html.twig', [
        'recipe' => $recipe,
        'form' => $form,
    ]);
}

    #[Route('/delete/{id}', name: 'app_recipes_delete', methods: ['POST'])]
public function delete(Request $request, Recipes $recipe, EntityManagerInterface $entityManager): Response
{
    if ($this->isCsrfTokenValid('delete'.$recipe->getId(), $request->request->get('_token'))) {
        // Récupérer le chemin complet de l'image
        $imagePath = $this->getParameter('images_directory') . '/' . $recipe->getImagePath();

        // Vérifier si le fichier image existe avant de le supprimer
        if (file_exists($imagePath)) {
            // Supprimer le fichier image
            unlink($imagePath);
        }

        // Supprimer l'entité post de la base de données
        $entityManager->remove($recipe);
        $entityManager->flush();
    }
    return $this->redirectToRoute('app_recipes_index', [], Response::HTTP_SEE_OTHER);

}


#[Route('/{id}/comment', name: 'app_recipes_comment', methods: ['GET', 'POST'])]
public function addComment(Request $request, Recipes $recipe, EntityManagerInterface $entityManager): Response
{
    $commentContent = $request->request->get('comment');

    if (!empty($commentContent)) {
        $user = $this->getUser();

        if ($user) {
            $comment = new Comments();
            $comment->setContent($commentContent);
            $comment->setUserId($user);
            $comment->setRecipeId($recipe);

            $entityManager->persist($comment);
            $entityManager->flush();


            return $this->redirectToRoute('app_recipes_show', ['id' => $recipe->getId()]);
        }
    }

    return $this->redirectToRoute('app_recipes_index');
}


#[Route('/comment/{id}/edit', name: 'app_comment_edit', methods: ['GET', 'POST'])]
public function editComment(Request $request, Comments $comment, EntityManagerInterface $entityManager): Response
{
    $recipeId = $comment->getRecipeId()->getId(); // Récupérer l'ID de la recette associée au commentaire

    $form = $this->createForm(CommentsType::class, $comment);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        $entityManager->flush();

        // Rediriger vers la route de visualisation de la recette avec l'ID de la recette
        return $this->redirectToRoute('app_recipes_show', ['id' => $recipeId]);
    }

    return $this->render('comment/edit.html.twig', [
        'comment' => $comment,
        'form' => $form->createView(),
    ]);
}


#[Route('/{id}', name: 'app_comment_confirm_delete', methods: ['POST'])]
    public function confirmDeleteComment(Request $request, Comments $comment, EntityManagerInterface $entityManager): Response
    {
            $recipeId = $comment->getRecipeId()->getId(); // Récupérer l'ID du post associé au commentaire

        if ($this->isCsrfTokenValid('delete'.$comment->getId(), $request->request->get('_token'))) {
            $entityManager->remove($comment);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_recipes_show', ['id' => $recipeId]);
    }


}
