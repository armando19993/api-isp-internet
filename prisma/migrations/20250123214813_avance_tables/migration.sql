-- AlterTable
ALTER TABLE `client` ADD COLUMN `conexion_mikrotik` VARCHAR(191) NULL,
    ADD COLUMN `factura` BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN `ip_mikrotik` VARCHAR(191) NULL,
    ADD COLUMN `password_mikrotik` VARCHAR(191) NULL,
    ADD COLUMN `user_mikrotik` VARCHAR(191) NULL,
    MODIFY `status` ENUM('CREADO', 'INSTALADO', 'ACTIVO', 'MOROSO', 'INACTIVO', 'BAJA', 'PLANIFICADO') NOT NULL DEFAULT 'CREADO';

-- CreateTable
CREATE TABLE `Product` (
    `id` VARCHAR(191) NOT NULL,
    `publicId` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `stock` BOOLEAN NOT NULL DEFAULT true,
    `stock_count` INTEGER NOT NULL,
    `status` ENUM('ACTIVO', 'INACTIVO') NOT NULL DEFAULT 'ACTIVO',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Product_publicId_key`(`publicId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Invoice` (
    `id` VARCHAR(191) NOT NULL,
    `publicId` INTEGER NOT NULL AUTO_INCREMENT,
    `invoice_credit` BOOLEAN NOT NULL DEFAULT false,
    `invoice_credit_quotes` INTEGER NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `status` ENUM('CREADA', 'FACTURADA', 'MOROSA', 'REFINANCIADA', 'PAGADA') NOT NULL DEFAULT 'CREADA',
    `clientId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Invoice_publicId_key`(`publicId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `InvoiceProducts` (
    `id` VARCHAR(191) NOT NULL,
    `publicId` INTEGER NOT NULL AUTO_INCREMENT,
    `quantity` INTEGER NOT NULL,
    `price_unit` DECIMAL(10, 2) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `invoiceId` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `InvoiceProducts_publicId_key`(`publicId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `InoviceQuotes` (
    `id` VARCHAR(191) NOT NULL,
    `publicId` INTEGER NOT NULL AUTO_INCREMENT,
    `num_quote` INTEGER NOT NULL,
    `status_quote` ENUM('CREADA', 'FACTURADA', 'MOROSA', 'REFINANCIADA', 'PAGADA') NOT NULL DEFAULT 'CREADA',
    `invoiceId` VARCHAR(191) NOT NULL,
    `invoiceFacturadaId` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `InoviceQuotes_publicId_key`(`publicId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PlanClient` (
    `id` VARCHAR(191) NOT NULL,
    `publicId` INTEGER NOT NULL AUTO_INCREMENT,
    `date_emision` DATE NOT NULL,
    `date_vencimiento` DATE NOT NULL,
    `status_service` ENUM('GENERADO', 'MOROSO', 'PAGADO') NOT NULL DEFAULT 'GENERADO',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `clientId` VARCHAR(191) NOT NULL,
    `plansId` VARCHAR(191) NOT NULL,
    `invoiceId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `PlanClient_publicId_key`(`publicId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `Client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InvoiceProducts` ADD CONSTRAINT `InvoiceProducts_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `Invoice`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InvoiceProducts` ADD CONSTRAINT `InvoiceProducts_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InoviceQuotes` ADD CONSTRAINT `InoviceQuotes_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `Invoice`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InoviceQuotes` ADD CONSTRAINT `InoviceQuotes_invoiceFacturadaId_fkey` FOREIGN KEY (`invoiceFacturadaId`) REFERENCES `Invoice`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PlanClient` ADD CONSTRAINT `PlanClient_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `Client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PlanClient` ADD CONSTRAINT `PlanClient_plansId_fkey` FOREIGN KEY (`plansId`) REFERENCES `Plans`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PlanClient` ADD CONSTRAINT `PlanClient_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `Invoice`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
