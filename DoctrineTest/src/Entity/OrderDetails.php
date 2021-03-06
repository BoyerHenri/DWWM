<?php

namespace App\Entity;

use App\Repository\OrderDetailsRepository;
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
     * @ORM\ManyToOne(targetEntity=Orders::class, inversedBy="OrdersGetOrdersDetails")
     */
    private $OrderID;

    /**
     * @ORM\ManyToOne(targetEntity=Products::class, inversedBy="ProductsGetOrderDetails")
     */
    private $ProductID;

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

    public function getProductID(): ?products
    {
        return $this->ProductID;
    }

    public function setProductID(?products $ProductID): self
    {
        $this->ProductID = $ProductID;

        return $this;
    }
}
