<?php

namespace App\Controller;

use App\Entity\Products;
use App\Form\ProductsType;
use App\Repository\ProductsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

/**
 * @Route("/products")
 */
class ProductsController extends AbstractController
{
    /**
     * @Route("/", name="products_index", methods={"GET"})
     */
    public function index(ProductsRepository $productsRepository): Response
    {
        return $this->render('products/index.html.twig', [
            'products' => $productsRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="products_new", methods={"GET","POST"})
     * @param Request $request
     * @return Response
     */
    public function new(Request $request): Response
    {
        $product = new Products();
        // création du formulaire
        $form = $this->createForm(ProductsType::class, $product);
        // lecture du formulaire
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($product);
            $entityManager->flush();

        $this->addFlash(
            'success',
            'Produit ajouté avec succès !!'
        );

            return $this->redirectToRoute('products_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('products/new.html.twig', [
            'product' => $product,
            'form' => $form->createView(),
        ]);


    }

    /**
     * @Route("/{id}", name="products_show", methods={"GET"})
     */
    public function show(Products $product): Response
    {
        return $this->render('products/show.html.twig', [
            'product' => $product,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="products_edit", methods={"GET","POST"})
     * @param Request $request
     * @param Products $product
     * @return Response
     */
    public function edit(Request $request, Products $product): Response
    {
        // récupération de l'id du produit
        $idProduct = $product->getId();
        $form = $this->createForm(ProductsType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // récupération de la saisi sur l'upload
            $pictureFile = $form['picture2']->getData();
            $this->getDoctrine()->getManager()->flush();

            // vérification s'il y a un upload photo
            if ($pictureFile) {
                // renommage du fichier
                // nom du fichier + extension
                $newPicture = $idProduct . '.' . $pictureFile->guessExtension();
            // assignation de la valeur à la propriété picture à l'aide du setter
                $product->setPicture($newPicture);
                try {
                        // déplacement du fichier vers le répertoire de destination sur le serveur
                        $pictureFile->move(
                        $this->getParameter('photo_directory'),
                        $newPicture
                    );
                } catch (FileException $e) {
                    // gestion de l'erreur si le déplacement ne s'est pas effectué
                    echo "Fichier non valide ";
                }
            }

            return $this->redirectToRoute('products_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('products/edit.html.twig', [
            'product' => $product,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="products_delete", methods={"POST"})
     */
    public function delete(Request $request, Products $product): Response
    {
        if ($this->isCsrfTokenValid('delete'.$product->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($product);
            $entityManager->flush();
        }

        return $this->redirectToRoute('products_index', [], Response::HTTP_SEE_OTHER);
    }
}
