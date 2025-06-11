import { BadRequestException, Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import * as bcrypt from "bcryptjs";

@Injectable()
export class UserService {

  constructor(
    private prisma: PrismaService
  ) { }

  async create(createUserDto: CreateUserDto) {
    const validate = await this.prisma.user.findFirst({
      where: { user: createUserDto.user }
    });

    if (validate) {
      throw new BadRequestException("Este nombre de usuario ya existe, intenta con otro o restablece tu contraseña");
    }

    const hashedPassword = await bcrypt.hash(createUserDto.password, 10);

    const data = await this.prisma.user.create({
      data: {
        ...createUserDto,
        password: hashedPassword
      }
    });

    return {
      data: {
        ...data,
        password: undefined
      },
      message: 'Usuario creado con éxito'
    };
  }

  findAll() {
    return `This action returns all user`;
  }

  findOne(id: number) {
    return `This action returns a #${id} user`;
  }

  async update(id, updateUserDto: UpdateUserDto) {
    // Verificar si el usuario existe
    const user = await this.prisma.user.findUnique({
      where: { id }
    });

    if (!user) {
      throw new BadRequestException("Usuario no encontrado");
    }

    // Si se está actualizando la contraseña, encriptarla
    if (updateUserDto.password) {
      updateUserDto.password = await bcrypt.hash(updateUserDto.password, 10);
    }

    const updatedUser = await this.prisma.user.update({
      where: { id },
      data: updateUserDto
    });

    return {
      data: {
        ...updatedUser,
        password: undefined // No devolver la contraseña
      },
      message: 'Usuario actualizado con éxito'
    };
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
