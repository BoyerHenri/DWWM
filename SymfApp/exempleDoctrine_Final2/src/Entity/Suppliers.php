<?php

namespace App\Entity;

use App\Repository\SuppliersRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=SuppliersRepository::class)
 */
class Suppliers
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
    private $CompanyName;

    /**
     * @ORM\Column(type="string", length=30, nullable=true)
     */
    private $ContactName;

    /**
     * @ORM\Column(type="string", length=30, nullable=true)
     */
    private $ContactTitle;

    /**
     * @ORM\Column(type="string", length=60, nullable=true)
     */
    private $Address;

    /**
     * @ORM\Column(type="string", length=15, nullable=true)
     */
    private $City;

    /**
     * @ORM\Column(type="string", length=15, nullable=true)
     */
    private $Region;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $PostalCode;

    /**
     * @ORM\Column(type="string", length=15, nullable=true)
     */
    private $Country;

    /**
     * @ORM\Column(type="string", length=24, nullable=true)
     */
    private $Phone;

    /**
     * @ORM\Column(type="string", length=24, nullable=true)
     */
    private $Fax;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $HomePage;

    /**
     * @ORM\OneToMany(targetEntity=Products::class, mappedBy="SupplierID")
     */
    private $ProductsRelation;

    /**
     * @ORM\OneToMany(targetEntity=Products::class, mappedBy="SupplierID")
     */
    private $ProductRelation;

    public function __construct()
    {
        $this->ProductsRelation = new ArrayCollection();
        $this->ProductRelation = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCompanyName(): ?string
    {
        return $this->CompanyName;
    }

    public function setCompanyName(string $CompanyName): self
    {
        $this->CompanyName = $CompanyName;

        return $this;
    }

    public function getContactName(): ?string
    {
        return $this->ContactName;
    }

    public function setContactName(?string $ContactName): self
    {
        $this->ContactName = $ContactName;

        return $this;
    }

    public function getContactTitle(): ?string
    {
        return $this->ContactTitle;
    }

    public function setContactTitle(?string $ContactTitle): self
    {
        $this->ContactTitle = $ContactTitle;

        return $this;
    }

    public function getAddress(): ?string
    {
        return $this->Address;
    }

    public function setAddress(?string $Address): self
    {
        $this->Address = $Address;

        return $this;
    }

    public function getCity(): ?string
    {
        return $this->City;
    }

    public function setCity(?string $City): self
    {
        $this->City = $City;

        return $this;
    }

    public function getRegion(): ?string
    {
        return $this->Region;
    }

    public function setRegion(?string $Region): self
    {
        $this->Region = $Region;

        return $this;
    }

    public function getPostalCode(): ?string
    {
        return $this->PostalCode;
    }

    public function setPostalCode(?string $PostalCode): self
    {
        $this->PostalCode = $PostalCode;

        return $this;
    }

    public function getCountry(): ?string
    {
        return $this->Country;
    }

    public function setCountry(?string $Country): self
    {
        $this->Country = $Country;

        return $this;
    }

    public function getPhone(): ?string
    {
        return $this->Phone;
    }

    public function setPhone(?string $Phone): self
    {
        $this->Phone = $Phone;

        return $this;
    }

    public function getFax(): ?string
    {
        return $this->Fax;
    }

    public function setFax(?string $Fax): self
    {
        $this->Fax = $Fax;

        return $this;
    }

    public function getHomePage(): ?string
    {
        return $this->HomePage;
    }

    public function setHomePage(?string $HomePage): self
    {
        $this->HomePage = $HomePage;

        return $this;
    }

    /**
     * @return Collection|Products[]
     */
    public function getProductsRelation(): Collection
    {
        return $this->ProductsRelation;
    }

    public function addProductsRelation(Products $productsRelation): self
    {
        if (!$this->ProductsRelation->contains($productsRelation)) {
            $this->ProductsRelation[] = $productsRelation;
            $productsRelation->setSupplierID($this);
        }

        return $this;
    }

    public function removeProductsRelation(Products $productsRelation): self
    {
        if ($this->ProductsRelation->removeElement($productsRelation)) {
            // set the owning side to null (unless already changed)
            if ($productsRelation->getSupplierID() === $this) {
                $productsRelation->setSupplierID(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Products[]
     */
    public function getProductRelation(): Collection
    {
        return $this->ProductRelation;
    }

    public function addProductRelation(Products $productRelation): self
    {
        if (!$this->ProductRelation->contains($productRelation)) {
            $this->ProductRelation[] = $productRelation;
            $productRelation->setSupplierID($this);
        }

        return $this;
    }

    public function removeProductRelation(Products $productRelation): self
    {
        if ($this->ProductRelation->removeElement($productRelation)) {
            // set the owning side to null (unless already changed)
            if ($productRelation->getSupplierID() === $this) {
                $productRelation->setSupplierID(null);
            }
        }

        return $this;
    }
}
