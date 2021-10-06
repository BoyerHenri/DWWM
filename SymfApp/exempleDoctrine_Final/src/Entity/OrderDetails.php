<?php

namespace App\Entity;

use App\Repository\OrderDetailsRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=OrderDetailsRepository::class)
 */
class OrderDetails
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=4)
     */
    private $UnitPrice;

    /**
     * @ORM\Column(type="smallint")
     */
    private $Quantity;

    /**
     * @ORM\Column(type="float")
     */
    private $Discount;

    /**
     * @ORM\ManyToOne(targetEntity=orders::class, inversedBy="OrderDetOrdRelation")
     */
    private $OrderID;

    /**
     * @ORM\OneToMany(targetEntity=products::class, mappedBy="OrderDetProdRelation")
     */
    private $ProductID;

    public function __construct()
    {
        $this->ProductID = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
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

    public function getQuantity(): ?int
    {
        return $this->Quantity;
    }

    public function setQuantity(int $Quantity): self
    {
        $this->Quantity = $Quantity;

        return $this;
    }

    public function getDiscount(): ?float
    {
        return $this->Discount;
    }

    public function setDiscount(float $Discount): self
    {
        $this->Discount = $Discount;

        return $this;
    }

    public function getOrderID(): ?orders
    {
        return $this->OrderID;
    }

    public function setOrderID(?orders $OrderID): self
    {
        $this->OrderID = $OrderID;

        return $this;
    }

    /**
     * @return Collection|products[]
     */
    public function getProductID(): Collection
    {
        return $this->ProductID;
    }

    public function addProductID(products $productID): self
    {
        if (!$this->ProductID->contains($productID)) {
            $this->ProductID[] = $productID;
            $productID->setOrderDetProdRelation($this);
        }

        return $this;
    }

    public function removeProductID(products $productID): self
    {
        if ($this->ProductID->removeElement($productID)) {
            // set the owning side to null (unless already changed)
            if ($productID->getOrderDetProdRelation() === $this) {
                $productID->setOrderDetProdRelation(null);
            }
        }

        return $this;
    }
}
