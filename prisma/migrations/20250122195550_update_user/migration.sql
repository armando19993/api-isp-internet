/*
  Warnings:

  - Added the required column `name` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `role` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `user` ADD COLUMN `name` VARCHAR(191) NOT NULL,
    ADD COLUMN `role` ENUM('ADMIN', 'OPERARIO_CAMPO', 'OPARARIO_OFICINA', 'SOPORTE') NOT NULL;
