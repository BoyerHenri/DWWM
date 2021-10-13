<?php

namespace App\Form;

// Rejoins Les Autres Entité //

use App\Entity\Products;
use App\Entity\Suppliers;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

// Contraintes De Validation //

use Symfony\Component\Validator\Constraints\NotBlank; // Vérifie si le champ est vide //
use Symfony\Component\Validator\Constraints\Regex; // Ajoute une regex au champ //
use Symfony\Component\Form\Extension\Core\Type\TextType; // Ajoute un TypeText au champ //
use Symfony\Bridge\Doctrine\Form\Type\EntityType; // Ajoute un EntityType au champ //
use Symfony\Component\Form\Extension\Core\Type\FileType; // Ajoute un FileType au champ Image // 
use Symfony\Component\Validator\Constraints\Image; // Ajoute Image au champ Image //


class ProductsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder

            // Champ Nom Du Produit //
            ->add('ProductName', TextType::class, [
                'label' => 'Nom du Produit',
                'help' => 'Indiquez ici le nom complet du produit',
                'attr' => [
                    'placeholder' => 'Produit',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9A-Za-zéèàçâêûîôäëüïö\_\-\s]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                    new NotBlank([
                        'message' => 'Veuillez saisir un nom de produit !'
                    ]),
                ]
            ])

            // Champ Nom Du Fournisseur //
            ->add('SupplierID', EntityType::class, [
                'label' => 'Nom du fournisseur',
                'class' => Suppliers::class,
                'choice_label' => 'CompanyName',
                'placeholder' => '',
                'constraints' => [
                    new NotBlank([
                      'message' => 'Veuillez choisir un nom de fournisseur !'
                    ]),
                ]
            ])

            // Champ Id De La Catégorie //
            ->add('CategoryID', TextType::class, [
                'label' => 'Id de la catégorie',
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Veuillez saisir une id de catégorie valide.'
                    ]),
                    new NotBlank([
                        'message' => 'Veuillez saisir une id de la catégorie !'
                    ]),
                ]
            ])

            // Champ Quantité Par Unité //
            ->add('QuantityPerUnit', TextType::class, [
                'label' => 'Description du lot',
                'attr' => [
                    'placeholder' => 'Quantité par unité',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9A-Za-zéèàçâêûîôäëüïö\_\-\s]+$/',
                        'message' => 'Veuillez saisir une description correcte.'
                    ]),
                    new NotBlank([
                        'message' => 'Veuillez saisir une quantité par unité !'
                    ]),
                ]
            ])

            // Champ Prix Unitaire //
            ->add('UnitPrice', TextType::class, [
                'label' => 'Prix Unitaire',
                'attr' => [
                    'placeholder' => 'Prix Unitaire',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9.]+$/',
                        'message' => 'Veuillez saisir un prix unitaire correct.'
                    ]),
                    new NotBlank([
                        'message' => 'Veuillez saisir un prix unitaire !'
                    ]),
                ]
            ])

            // Champ Quantité En Stock //
            ->add('UnitsInStock', TextType::class, [
                'label' => 'Quantité en stock',
                'attr' => [
                    'placeholder' => 'Stock',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Veuillez saisir une quantité en stock correct.'
                    ]),
                    new NotBlank([
                        'message' => 'Veuillez saisir une quantité en stock !'
                    ]),
                ]
            ])

            // Champ Quantité en commande //
            ->add('UnitsOnOrder', TextType::class, [
                'label' => 'Quantité en commande',
                'attr' => [
                    'placeholder' => 'Quantité en commande',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Veuillez saisir une quantité par commande correct.'
                    ]),
                    new NotBlank([
                        'message' => 'Veuillez saisir une quantité de commande !'
                    ]),
                ]
            ])

            // Champ Niveau D'alerte //
            ->add('ReorderLevel', TextType::class, [
                'label' => 'Niveau d\'alerte',
                'attr' => [
                    'placeholder' => 'Niveau d\'alerte',
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Veuillez saisir un niveau d\'alerte correct.'
                    ]),
                    new NotBlank([
                        'message' => 'Veuillez saisir un niveau d\'alerte !'
                    ]),
                ]
            ])


            // Champ Photo //
            ->add('picture2', FileType::class, [
                'label' => 'Photo de profil',
                //unmapped => fichier non associé à aucune propriété d'entité, validation impossible avec les annotations
                'mapped' => false,
                // pour éviter de recharger la photo lors de l'édition du profil
                'required' => false,
                'attr' => [
                    'placeholder' => 'Produit',
                    'value' => 'Image'
                ],
                'constraints' => [
                    new Image([
                        'maxSize' => '2000k',

                        'mimeTypesMessage' => 'Veuillez insérer une photo au format jpg, jpeg ou png'
                    ]),
                ]
            ])


            // Champ Discontinued //
            ->add('Discontinued', TextType::class, [
                'label' => 'Discontinued',
                'attr' => [
                    'placeholder' => '1',
                    'value' =>1
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-1]+$/',
                        'message' => 'Veuillez saisir un niveau d alerte correct.'
                    ]),
                    new NotBlank([
                        'message' => 'Veuillez saisir un discontinued !'
                    ]),
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
