<?php
   namespace App\Controller;

   use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
   use Symfony\Component\Routing\Annotation\Route;
   
   use App\Entity\Product;
   
   class TestController extends AbstractController
   {
       /**
        * @Route("/test", name="test")
        */
       public function index()
       {
           $repo = $this->getDoctrine()->getRepository(Product::class);
           $obj = $repo->findAll();
           return $this->render('test/index.html.twig', [
               'objs' =>  $obj
           ]);

           $obj[0]->getSuppliers()->getName();

       }
   }
