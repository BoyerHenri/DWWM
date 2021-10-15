<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211004145349 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Ajout De Relations';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE order_details ADD product_id_id INT NOT NULL');
        $this->addSql('ALTER TABLE order_details ADD CONSTRAINT FK_845CA2C1DE18E50B FOREIGN KEY (product_id_id) REFERENCES products (id)');
        $this->addSql('CREATE INDEX IDX_845CA2C1DE18E50B ON order_details (product_id_id)');
        $this->addSql('ALTER TABLE orders ADD relationorders_id INT NOT NULL');
        $this->addSql('ALTER TABLE orders ADD CONSTRAINT FK_E52FFDEEC625E50E FOREIGN KEY (relationorders_id) REFERENCES order_details (id)');
        $this->addSql('CREATE INDEX IDX_E52FFDEEC625E50E ON orders (relationorders_id)');
        $this->addSql('ALTER TABLE products ADD supplier_id_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE products ADD CONSTRAINT FK_B3BA5A5AA65F9C7D FOREIGN KEY (supplier_id_id) REFERENCES suppliers (id)');
        $this->addSql('CREATE INDEX IDX_B3BA5A5AA65F9C7D ON products (supplier_id_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE order_details DROP FOREIGN KEY FK_845CA2C1DE18E50B');
        $this->addSql('DROP INDEX IDX_845CA2C1DE18E50B ON order_details');
        $this->addSql('ALTER TABLE order_details DROP product_id_id');
        $this->addSql('ALTER TABLE orders DROP FOREIGN KEY FK_E52FFDEEC625E50E');
        $this->addSql('DROP INDEX IDX_E52FFDEEC625E50E ON orders');
        $this->addSql('ALTER TABLE orders DROP relationorders_id');
        $this->addSql('ALTER TABLE products DROP FOREIGN KEY FK_B3BA5A5AA65F9C7D');
        $this->addSql('DROP INDEX IDX_B3BA5A5AA65F9C7D ON products');
        $this->addSql('ALTER TABLE products DROP supplier_id_id');
    }
}
