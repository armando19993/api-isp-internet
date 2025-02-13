/*
  Warnings:

  - Added the required column `areaId` to the `Client` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `client` ADD COLUMN `areaId` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `Client` ADD CONSTRAINT `Client_areaId_fkey` FOREIGN KEY (`areaId`) REFERENCES `Area`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
