<?php
    // Entity/Product.php
    namespace App\Entity;

    use Doctrine\ORM\Mapping as ORM;

    /**
     * @ORM\Entity
     * @ORM\Table(name="products")
     */
    class Product
    {
        /**
         * @ORM\Column(name="ProductId", type="integer", nullable=false)
         * @ORM\Id
         * @ORM\GeneratedValue(strategy="IDENTITY")
         */

        // ID
        private $id;
        public function getId(): ?int
        {
            return $this->id;
        }

        // Name
         /**
         * @ORM\Column(name="ProductName", type="string", length=40)
         */
        private $name;
        public function getName(): ?string
        {
            return $this->name;
        }

        public function setName(string $name): self
        {
            $this->name=$name;
            return $this;
        }

        
    }