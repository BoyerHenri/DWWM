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

        // SupplierID
         /**
         * @ORM\Column(name="SupplierID", type="integer", nullable=false)
         */
        private $supId;
        public function getSupId(): ?int
        {
            return $this->supId;
        }    

        // CategoryID
         /**
         * @ORM\Column(name="CategoryID", type="integer", nullable=false)
         */
        private $catId;
        public function getCatId(): ?int
        {
            return $this->catId;
        }    

         // QuantityPerUnit
         /**
         * @ORM\Column(name="QuantityPerUnit", type="string", length=40)
         */
        private $qttUnit;
        public function getQttUnit(): ?string
        {
            return $this->qttUnit;
        }

        public function setQttUnit(string $qttUnit): self
        {
            $this->qttUnit=$qttUnit;
            return $this;
        }

        //TO DO DECIMAL
         // UnitPrice
         /**
         * @ORM\Column(name="UnitPrice", type="integer", nullable=false)
         */
        private $unPrice;
        public function getUnPrice(): ?int
        {
            return $this->unPrice;
        }    
     
         // UnitsInStock
         /**
         * @ORM\Column(name="UnitsInStock", type="integer", nullable=false)
         */
        private $unStock;
        public function getUnStock(): ?int
        {
            return $this->unStock;
        }    

        // UnitsOnOrder
         /**
         * @ORM\Column(name="UnitsOnOrder", type="integer", nullable=false)
         */
        private $unOO;
        public function getUnOO(): ?int
        {
            return $this->unOO;
        }   

        // ReorderLevel
         /**
         * @ORM\Column(name="ReorderLevel", type="integer", nullable=false)
         */
        private $reorLvl;
        public function getReorLvl(): ?int
        {
            return $this->reorLvl;
        }   

         // Discontinued
         /**
         * @ORM\Column(name="Discontinued", type="integer", nullable=false)
         */
        private $disc;
        public function getDisc(): ?int
        {
            return $this->disc;
        } 


          /**
         * @var \Suppliers
         *
         * @ORM\ManyToOne(targetEntity="Supplier", inversedBy="products")
         * @ORM\JoinColumn(name="SupplierId", referencedColumnName="SupplierId")
         * 
         */
        private $suppliers;

        public function getSuppliers(): ?Suppliers
        {
            return $this->suppliers;
        }

        public function setSuppliers(?Suppliers $supplier): self
        {
            $this->suppliers = $suppliers;

            return $this;
        }
    }