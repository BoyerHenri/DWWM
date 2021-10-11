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
     * @ORM\Column(type="decimal", precision=10, scale=4, nullable=false, options={"default":0.0000})
     */
    private $UnitPrice;

    /**
     * @ORM\Column(type="smallint", nullable=false, options={"default":1})
     */
    private $Quantity;

    /**
     * @ORM\Column(type="float", nullable=false, options={"default":0})
     */
    private $Discount;

    /**
     * @ORM\OneToMany(targetEntity=Orders::class, mappedBy="relationorders", orphanRemoval=true)
     */
    private $OrderID;

    /**
     * @ORM\ManyToOne(targetEntity=Products::class, inversedBy="relationproductsdetails")
     * @ORM\JoinColumn(nullable=false)
     */
    private $ProductID;

    public function __construct()
    {
        $this->OrderID = new ArrayCollection();
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

    /**
     * @return Collection|Orders[]
     */
    public function getOrderID(): Collection
    {
        return $this->OrderID;
    }

    public function addOrderID(Orders $orderID): self
    {
        if (!$this->OrderID->contains($orderID)) {
            $this->OrderID[] = $orderID;
            $orderID->setRelationorders($this);
        }

        return $this;
    }

    public function removeOrderID(Orders $orderID): self
    {
        if ($this->OrderID->removeElement($orderID)) {
            // set the owning side to null (unless already changed)
            if ($orderID->getRelationorders() === $this) {
                $orderID->setRelationorders(null);
            }
        }

        return $this;
    }

    public function getProductID(): ?Products
    {
        return $this->ProductID;
    }

    public function setProductID(?Products $ProductID): self
    {
        $this->ProductID = $ProductID;

        return $this;
    }
}
