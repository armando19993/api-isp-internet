/*
  Warnings:

  - Added the required column `invoice_discount_amount` to the `Invoice` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `invoice` ADD COLUMN `invoice_credit_aditional` BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN `invoice_credit_amount` DECIMAL(10, 2) NOT NULL DEFAULT 0,
    ADD COLUMN `invoice_discount` BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN `invoice_discount_amount` DECIMAL(10, 2) NOT NULL;

-- CreateTable
CREATE TABLE `Inventory` (
    `id` VARCHAR(191) NOT NULL,
    `publicId` INTEGER NOT NULL AUTO_INCREMENT,
    `type` ENUM('INGRESO', 'EGRESO') NOT NULL,
    `qty_old` INTEGER NOT NULL,
    `qty_new` INTEGER NOT NULL,
    `qty_inventory` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Inventory_publicId_key`(`publicId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Inventory` ADD CONSTRAINT `Inventory_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Inventory` ADD CONSTRAINT `Inventory_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
