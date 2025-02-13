const { PrismaClient, TYPE_USER } = require("@prisma/client");
const bcrypt = require("bcryptjs");

const prisma = new PrismaClient();

async function main() {
  // Hashear contraseña para el administrador
  const hashedPassword = await bcrypt.hash("admin", 10);

  // Crear el usuario admin
  const adminUser = await prisma.user.create({
    data: {
      name: "Administrator",
      user: "admin",
      password: hashedPassword,
      role: TYPE_USER.ADMIN,
    },
  });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
