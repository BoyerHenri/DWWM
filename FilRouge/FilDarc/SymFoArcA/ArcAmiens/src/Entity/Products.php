<?php

namespace App\Entity;

use App\Repository\ProductsRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ProductsRepository::class)
 */
class Products
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=40)
     */
    private $ProductName;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $CategoryID;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $QuantityPerUnit;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=4, nullable=false, options={"default":0.0000})
     */
    private $UnitPrice;

    /**
     * @ORM\Column(type="smallint", nullable=false, options={"default":0})
     */
    private $UnitsInStock;

    /**
     * @ORM\Column(type="smallint", nullable=false, options={"default":0})
     */
    private $UnitsOnOrder;

    /**
     * @ORM\Column(type="smallint", nullable=false, options={"default":0})
     */
    private $ReorderLevel;

    /**
     * @ORM\Column(type="boolean", nullable=false, options={"default":0})
     */
    private $Discontinued;

    /**
     * @ORM\ManyToOne(targetEntity=Suppliers::class, inversedBy="relationproducts")
     */
    private $SupplierID;

    /**
    * @ORM\Column(type="text", nullable=true)
    */
    private $picture;

    /**
     * @ORM\OneToMany(targetEntity=OrderDetails::class, mappedBy="ProductID", orphanRemoval=true)
     */
    private $relationproductsdetails;

    public function __construct()
    {
        $this->relationproductsdetails = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getProductName(): ?string
    {
        return $this->ProductName;
    }

    public function setProductName(string $ProductName): self
    {
        $this->ProductName = $ProductName;

        return $this;
    }

    public function getCategoryID(): ?int
    {
        return $this->CategoryID;
    }

    public function setCategoryID(?int $CategoryID): self
    {
        $this->CategoryID = $CategoryID;

        return $this;
    }

    public function getQuantityPerUnit(): ?string
    {
        return $this->QuantityPerUnit;
    }

    public function setQuantityPerUnit(?string $QuantityPerUnit): self
    {
        $this->QuantityPerUnit = $QuantityPerUnit;

        return $this;
    }

    public function getUnitPrice(): ?string
    {
        return $this->UnitPrice;
    }

    public function setUnitPrice(string $UnitPrice): self
    {
        $this->UnitPrice = $UnitPrice;

        return $this;
    }

    public function getUnitsInStock(): ?int
    {
        return $this->UnitsInStock;
    }

    public function setUnitsInStock(int $UnitsInStock): self
    {
        $this->UnitsInStock = $UnitsInStock;

        return $this;
    }

    public function getUnitsOnOrder(): ?int
    {
        return $this->UnitsOnOrder;
    }

    public function setUnitsOnOrder(int $UnitsOnOrder): self
    {
        $this->UnitsOnOrder = $UnitsOnOrder;

        return $this;
    }

    public function getReorderLevel(): ?int
    {
        return $this->ReorderLevel;
    }

    public function setReorderLevel(int $ReorderLevel): self
    {
        $this->ReorderLevel = $ReorderLevel;

        return $this;
    }

    public function getDiscontinued(): ?bool
    {
        return $this->Discontinued;
    }

    public function setDiscontinued(bool $Discontinued): self
    {
        $this->Discontinued = $Discontinued;

        return $this;
    }

    public function getSupplierID(): ?Suppliers
    {
        return $this->SupplierID;
    }

    public function setSupplierID(?Suppliers $SupplierID): self
    {
        $this->SupplierID = $SupplierID;

        return $this;
    }

    public function getPicture(): ?string
    {
        return $this->picture;
    }

    public function setPicture(?string $picture): self
    {
        $this->picture = $picture;

        return $this;
    }


    /**
     * @return Collection|OrderDetails[]
     */
    public function getRelationproductsdetails(): Collection
    {
        return $this->relationproductsdetails;
    }

    public function addRelationproductsdetail(OrderDetails $relationproductsdetail): self
    {
        if (!$this->relationproductsdetails->contains($relationproductsdetail)) {
            $this->relationproductsdetails[] = $relationproductsdetail;
            $relationproductsdetail->setProductID($this);
        }

        return $this;
    }

    public function removeRelationproductsdetail(OrderDetails $relationproductsdetail): self
    {
        if ($this->relationproductsdetails->removeElement($relationproductsdetail)) {
            // set the owning side to null (unless already changed)
            if ($relationproductsdetail->getProductID() === $this) {
                $relationproductsdetail->setProductID(null);
            }
        }

        return $this;
    }

}
