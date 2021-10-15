<?php

namespace App\Entity;

use App\Repository\SuppliersRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

use Symfony\Component\Validator\Constraints as Assert;

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
     * @Assert\NotBlank(
     *     message="Veuillez renseigner le nom du fournisseur"
     * )
     * @Assert\Regex(
     *     pattern="/^[\s\w\#\_\-éèàçâêîôûùäaëïüö]+$/",
     *     message="Caratère(s) non valide(s)"
     * )
     */
    private $CompanyName;

    /**
     * @ORM\Column(type="string", length=30)
     * @Assert\NotBlank(
     *     message="Veuillez renseigner le nom du contact"
     * )
     * @Assert\Regex(
     *     pattern="/^[\s\w\#\_\-éèàçâêîôûùäaëïüö]+$/",
     *     message="Caratère(s) non valide(s)"
     * )
     */
    private $ContactName;

    /**
     * @ORM\Column(type="string", length=30, nullable=true)
     * @Assert\Regex(
     *     pattern="/^[\s\w\#\_\-éèàçâêîôûùäaëïüö]+$/",
     *     message="Caratère(s) non valide(s)"
     * )
     */
    private $ContactTitle;

    /**
     * @ORM\Column(type="string", length=60, nullable=true)
     * @Assert\Regex(
     *     pattern="/^[\s\w\#\_\-.éèàçâêîôûùäaëïüö]+$/",
     *     message="Caratère(s) non valide(s)"
     * )
     */
    private $Address;

    /**
     * @ORM\Column(type="string", length=15, nullable=true)
     * @Assert\Regex(
     *     pattern="/^[A-z\séèàçâêîôûùäaëïüö]+$/",
     *     message="Caratère(s) non valide(s)"
     * )
     */
    private $City;

    /**
     * @ORM\Column(type="string", length=15, nullable=true)
     * @Assert\Regex(
     *     pattern="/^[A-z\s]+$/",
     *     message="Caratère(s) non valide(s)"
     * )
     */
    private $Region;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     * @Assert\Regex(
     *     pattern="/^[0-9]+$/",
     *     message="Caratère(s) non valide(s)"
     * )
     */
    private $PostalCode;

    /**
     * @ORM\Column(type="string", length=15, nullable=true)
     * @Assert\Regex(
     *     pattern="/^[A-z]+$/",
     *     message="Caratère(s) non valide(s)"
     * )
     */
    private $Country;

    /**
     * @ORM\Column(type="string", length=24, nullable=true)
     * @Assert\Regex(
     *     pattern="/^[0-9()]+$/",
     *     message="Caratère(s) non valide(s)"
     * )
     */
    private $Phone;

    /**
     * @ORM\Column(type="string", length=24, nullable=true)
     * @Assert\Regex(
     *     pattern="/^[0-9()]+$/",
     *     message="Caratère(s) non valide(s)"
     * )
     */
    private $Fax;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Assert\Regex(
     *     pattern="/^[A-z0-9À-ž\s.,;:]+$/",
     *     message="Caratère(s) non valide(s)"
     * )
     */
    private $HomePage;

    /**
     * @ORM\OneToMany(targetEntity=Products::class, mappedBy="SupplierID")
     */
    private $relationproducts;

    public function __construct()
    {
        $this->relationproducts = new ArrayCollection();
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

    public function setContactName(string $ContactName): self
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
    public function getRelationproducts(): Collection
    {
        return $this->relationproducts;
    }

    public function addRelationproduct(Products $relationproduct): self
    {
        if (!$this->relationproducts->contains($relationproduct)) {
            $this->relationproducts[] = $relationproduct;
            $relationproduct->setSupplierID($this);
        }

        return $this;
    }

    public function removeRelationproduct(Products $relationproduct): self
    {
        if ($this->relationproducts->removeElement($relationproduct)) {
            // set the owning side to null (unless already changed)
            if ($relationproduct->getSupplierID() === $this) {
                $relationproduct->setSupplierID(null);
            }
        }

        return $this;
    }

    public function __toString()
    {
     return $this->CompanyName;
    }
}
