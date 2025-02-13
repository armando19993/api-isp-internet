/*
  Warnings:

  - Added the required column `document` to the `Client` table without a default value. This is not possible if the table is not empty.
  - Added the required column `latitud` to the `Client` table without a default value. This is not possible if the table is not empty.
  - Added the required column `longitud` to the `Client` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type_document` to the `Client` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `client` ADD COLUMN `document` VARCHAR(191) NOT NULL,
    ADD COLUMN `latitud` VARCHAR(191) NOT NULL,
    ADD COLUMN `longitud` VARCHAR(191) NOT NULL,
    ADD COLUMN `type_document` ENUM('DNI', 'CUIT') NOT NULL,
    MODIFY `phone_whatsapp` VARCHAR(191) NULL,
    MODIFY `email` VARCHAR(191) NULL;

-- CreateTable
CREATE TABLE `Area` (
    `id` VARCHAR(191) NOT NULL,
    `publicId` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Area_publicId_key`(`publicId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Roadmap` (
    `id` VARCHAR(191) NOT NULL,
    `publicId` INTEGER NOT NULL AUTO_INCREMENT,
    `date` DATE NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Roadmap_publicId_key`(`publicId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RoadmapClients` (
    `id` VARCHAR(191) NOT NULL,
    `publicId` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `roadmapId` VARCHAR(191) NOT NULL,
    `clientId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `RoadmapClients_publicId_key`(`publicId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Roadmap` ADD CONSTRAINT `Roadmap_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RoadmapClients` ADD CONSTRAINT `RoadmapClients_roadmapId_fkey` FOREIGN KEY (`roadmapId`) REFERENCES `Roadmap`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RoadmapClients` ADD CONSTRAINT `RoadmapClients_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `Client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
