<?php

namespace App\Form;

use App\Entity\Products;
use App\Entity\Suppliers;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\RadioType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Validator\Constraints\Regex;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class ProductsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            // Nom du produit
            // ->add('ProductName')
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
                ]
            ])

            // Category ID
            // ->add('CategoryID')
            ->add('CategoryID', TextType::class, [
                'label' => 'Catégorie du produit',
                'help' => 'Entrez ici le code catégorie du produit',
                'attr' => [
                    'placeholder' => '0',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                'help' => 'Vous devez rentrer la catégorie du produit ici',
                ]
            ])
            
            // Quantity per unit
            // ->add('QuantityPerUnit')
            ->add('QuantityPerUnit', TextType::class, [
                'label' => 'Quantité',
                'help' => 'Entrez ici la quantité',
                'attr' => [
                    'placeholder' => '0',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                'help' => 'Nombre de produits',
                ]
            ])
            
            // Unit price
            // ->add('UnitPrice')
            ->add('UnitPrice', TextType::class, [
                'label' => 'Prix unitaire',
                'help' => 'Entrez ici le prix unitaire',
                'attr' => [
                    'placeholder' => '0',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                'help' => 'Prix unitaire',
                ]
            ])

            // Units en stock
            // ->add('UnitsInStock')
            ->add('UnitsInStock', TextType::class, [
                'label' => 'Quantité',
                'help' => 'Entrez ici la quantité EN STOCK',
                'attr' => [
                    'placeholder' => '0',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                'help' => 'Nombre de produits EN STOCK',
                ]
            ])

            // En commande
            // ->add('UnitsOnOrder')
            ->add('UnitsOnOrder', TextType::class, [
                'label' => 'Quantité',
                'help' => 'Entrez ici la quantité EN COMMANDE',
                'attr' => [
                    'placeholder' => '0',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                'help' => 'Nombre de produits',
                ]
            ])

            // Stock d'alerte
            // ->add('ReorderLevel')
            ->add('ReorderLevel', TextType::class, [
                'label' => 'Stock alerte',
                'help' => 'Stock alerte',
                'attr' => [
                    'placeholder' => '0',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                'help' => 'Nombre de produits',
                ]
            ])

           
            /*
            // Disponible ou non
            ->add('Discontinued')
            ->add('Discontinued', TextType::class, [
                'label' => 'Disponibilité',
                'help' => 'Disponibilité',
                'attr' => [
                    'placeholder' => '0',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-1]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                'help' => 'Disponibilité',
                ]
            ])
            */
            
            //
            // ->add('SupplierID')
            
            ->add('SupplierID', EntityType::class, [
                'label' => 'ID Fournisseur',
                'class' => Suppliers::class,
                'choice_label' => 'CompanyName',
                'help' => 'Fournisseur',
                'attr' => [
                    'placeholder' => '0',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                'help' => 'ID Fournisseur',
                ]
            ])
            
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Products::class,
        ]);
    }
}

