<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211005091101 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE customers (id INT AUTO_INCREMENT NOT NULL, company_name VARCHAR(40) NOT NULL, contact_name VARCHAR(30) NOT NULL, contact_title VARCHAR(30) NOT NULL, address VARCHAR(60) DEFAULT NULL, city VARCHAR(15) DEFAULT NULL, region VARCHAR(15) DEFAULT NULL, postal_code VARCHAR(10) DEFAULT NULL, country VARCHAR(15) DEFAULT NULL, phone LONGTEXT NOT NULL COMMENT \'(DC2Type:simple_array)\', yes LONGTEXT NOT NULL, fax VARCHAR(24) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE orders ADD string VARCHAR(15) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE customers');
        $this->addSql('ALTER TABLE orders DROP string');
    }
}
