<?php

namespace App\Form;

use App\Entity\Products;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\Regex;

class ProductsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            // ->add('ProductName')

            // Nom du produit
            ->add('ProductName', TextType::class, [
                'label' => 'Nom du produit',
                'help' => 'Entrez ici le nom complet du produit',
                'attr' => [
                    'placeholder' => 'Produit',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[A-Za-zéèàçâêûîôäëüïö\_\-\s]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                'help' => 'Vous devez rentrer le nom du produit ici',
                ]
            ])

            ->add('CategoryID')
            ->add('QuantityPerUnit')
            ->add('UnitPrice')
            ->add('UnitsInStock')
            ->add('UnitsOnOrder')
            ->add('ReorderLevel')
            ->add('Discontinued')
            ->add('SupplierID')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Products::class,
        ]);
    }
}

