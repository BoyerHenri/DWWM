<?php

namespace App\Entity;

use App\Repository\OrdersRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=OrdersRepository::class)
 */
class Orders
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=5, nullable=true)
     */
    private $CustomerID;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $EmployeeID;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $OrderDate;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $RequireDate;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $ShippedDate;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $ShipVia;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=4, nullable=true)
     */
    private $Freight;

    /**
     * @ORM\Column(type="string", length=40, nullable=true)
     */
    private $ShipName;

    /**
     * @ORM\Column(type="string", length=60, nullable=true)
     */
    private $ShipAddress;

    /**
     * @ORM\Column(type="string", length=15)
     */
    private $ShipCity;

    /**
     * @ORM\Column(type="string", length=15, nullable=true)
     */
    private $string;

    /**
     * @ORM\Column(type="string", length=15, nullable=true)
     */
    private $ShipRegion;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $ShipPostalCode;

    /**
     * @ORM\Column(type="string", length=15, nullable=true)
     */
    private $ShipCountry;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCustomerID(): ?string
    {
        return $this->CustomerID;
    }

    public function setCustomerID(?string $CustomerID): self
    {
        $this->CustomerID = $CustomerID;

        return $this;
    }

    public function getEmployeeID(): ?int
    {
        return $this->EmployeeID;
    }

    public function setEmployeeID(?int $EmployeeID): self
    {
        $this->EmployeeID = $EmployeeID;

        return $this;
    }

    public function getOrderDate(): ?\DateTimeInterface
    {
        return $this->OrderDate;
    }

    public function setOrderDate(?\DateTimeInterface $OrderDate): self
    {
        $this->OrderDate = $OrderDate;

        return $this;
    }

    public function getRequireDate(): ?\DateTimeInterface
    {
        return $this->RequireDate;
    }

    public function setRequireDate(?\DateTimeInterface $RequireDate): self
    {
        $this->RequireDate = $RequireDate;

        return $this;
    }

    public function getShippedDate(): ?\DateTimeInterface
    {
        return $this->ShippedDate;
    }

    public function setShippedDate(?\DateTimeInterface $ShippedDate): self
    {
        $this->ShippedDate = $ShippedDate;

        return $this;
    }

    public function getShipVia(): ?int
    {
        return $this->ShipVia;
    }

    public function setShipVia(?int $ShipVia): self
    {
        $this->ShipVia = $ShipVia;

        return $this;
    }

    public function getFreight(): ?string
    {
        return $this->Freight;
    }

    public function setFreight(?string $Freight): self
    {
        $this->Freight = $Freight;

        return $this;
    }

    public function getShipName(): ?string
    {
        return $this->ShipName;
    }

    public function setShipName(?string $ShipName): self
    {
        $this->ShipName = $ShipName;

        return $this;
    }

    public function getShipAddress(): ?string
    {
        return $this->ShipAddress;
    }

    public function setShipAddress(?string $ShipAddress): self
    {
        $this->ShipAddress = $ShipAddress;

        return $this;
    }

    public function getShipCity(): ?string
    {
        return $this->ShipCity;
    }

    public function setShipCity(string $ShipCity): self
    {
        $this->ShipCity = $ShipCity;

        return $this;
    }

    public function getString(): ?string
    {
        return $this->string;
    }

    public function setString(?string $string): self
    {
        $this->string = $string;

        return $this;
    }

    public function getShipRegion(): ?string
    {
        return $this->ShipRegion;
    }

    public function setShipRegion(?string $ShipRegion): self
    {
        $this->ShipRegion = $ShipRegion;

        return $this;
    }

    public function getShipPostalCode(): ?string
    {
        return $this->ShipPostalCode;
    }

    public function setShipPostalCode(?string $ShipPostalCode): self
    {
        $this->ShipPostalCode = $ShipPostalCode;

        return $this;
    }

    public function getShipCountry(): ?string
    {
        return $this->ShipCountry;
    }

    public function setShipCountry(?string $ShipCountry): self
    {
        $this->ShipCountry = $ShipCountry;

        return $this;
    }
}
