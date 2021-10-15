<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211004134259 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Création des tables et modifications';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE customers (id INT AUTO_INCREMENT NOT NULL, company_name VARCHAR(40) NOT NULL, contact_name VARCHAR(30) DEFAULT NULL, contact_title VARCHAR(30) DEFAULT NULL, address VARCHAR(60) DEFAULT NULL, city VARCHAR(15) DEFAULT NULL, region VARCHAR(15) DEFAULT NULL, postal_code VARCHAR(10) DEFAULT NULL, country VARCHAR(15) DEFAULT NULL, phone VARCHAR(24) DEFAULT NULL, fax VARCHAR(24) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE order_details (id INT AUTO_INCREMENT NOT NULL, unit_price NUMERIC(10, 4) DEFAULT \'0\' NOT NULL, quantity SMALLINT DEFAULT 1 NOT NULL, discount DOUBLE PRECISION DEFAULT \'0\' NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE orders (id INT AUTO_INCREMENT NOT NULL, employee_id INT DEFAULT NULL, order_date DATETIME DEFAULT NULL, required_date DATETIME DEFAULT NULL, shipped_date DATETIME DEFAULT NULL, ship_via INT DEFAULT NULL, freight NUMERIC(10, 4) DEFAULT \'0\' NOT NULL, ship_name VARCHAR(40) DEFAULT NULL, ship_address VARCHAR(60) DEFAULT NULL, ship_city VARCHAR(15) DEFAULT NULL, ship_region VARCHAR(15) DEFAULT NULL, ship_postal_code VARCHAR(10) DEFAULT NULL, ship_country VARCHAR(15) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE suppliers (id INT AUTO_INCREMENT NOT NULL, company_name VARCHAR(40) NOT NULL, contact_name VARCHAR(30) NOT NULL, contact_title VARCHAR(30) DEFAULT NULL, address VARCHAR(60) DEFAULT NULL, city VARCHAR(15) DEFAULT NULL, region VARCHAR(15) DEFAULT NULL, postal_code VARCHAR(10) DEFAULT NULL, country VARCHAR(15) DEFAULT NULL, phone VARCHAR(24) DEFAULT NULL, fax VARCHAR(24) DEFAULT NULL, home_page LONGTEXT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE products CHANGE category_id category_id INT DEFAULT NULL, CHANGE quantity_per_unit quantity_per_unit VARCHAR(20) DEFAULT NULL, CHANGE unit_price unit_price NUMERIC(10, 4) DEFAULT \'0\' NOT NULL, CHANGE units_in_stock units_in_stock SMALLINT DEFAULT 0 NOT NULL, CHANGE units_on_order units_on_order SMALLINT DEFAULT 0 NOT NULL, CHANGE reorder_level reorder_level SMALLINT DEFAULT 0 NOT NULL, CHANGE discontinued discontinued TINYINT(1) DEFAULT \'0\' NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE customers');
        $this->addSql('DROP TABLE order_details');
        $this->addSql('DROP TABLE orders');
        $this->addSql('DROP TABLE suppliers');
        $this->addSql('ALTER TABLE products CHANGE category_id category_id INT NOT NULL, CHANGE quantity_per_unit quantity_per_unit VARCHAR(20) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE unit_price unit_price NUMERIC(10, 4) NOT NULL, CHANGE units_in_stock units_in_stock SMALLINT NOT NULL, CHANGE units_on_order units_on_order SMALLINT NOT NULL, CHANGE reorder_level reorder_level SMALLINT NOT NULL, CHANGE discontinued discontinued TINYINT(1) NOT NULL');
    }
}
