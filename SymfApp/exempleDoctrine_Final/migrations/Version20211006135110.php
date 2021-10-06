<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211006135110 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE order_details ADD order_id_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE order_details ADD CONSTRAINT FK_845CA2C1FCDAEAAA FOREIGN KEY (order_id_id) REFERENCES orders (id)');
        $this->addSql('CREATE INDEX IDX_845CA2C1FCDAEAAA ON order_details (order_id_id)');
        $this->addSql('ALTER TABLE products ADD order_det_prod_relation_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE products ADD CONSTRAINT FK_B3BA5A5AB92AFB8C FOREIGN KEY (order_det_prod_relation_id) REFERENCES order_details (id)');
        $this->addSql('CREATE INDEX IDX_B3BA5A5AB92AFB8C ON products (order_det_prod_relation_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE order_details DROP FOREIGN KEY FK_845CA2C1FCDAEAAA');
        $this->addSql('DROP INDEX IDX_845CA2C1FCDAEAAA ON order_details');
        $this->addSql('ALTER TABLE order_details DROP order_id_id');
        $this->addSql('ALTER TABLE products DROP FOREIGN KEY FK_B3BA5A5AB92AFB8C');
        $this->addSql('DROP INDEX IDX_B3BA5A5AB92AFB8C ON products');
        $this->addSql('ALTER TABLE products DROP order_det_prod_relation_id');
    }
}
