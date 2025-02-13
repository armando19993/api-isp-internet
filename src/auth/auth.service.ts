import { BadRequestException, Injectable } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";
import * as bcrypt from "bcryptjs";
import { PrismaService } from "src/prisma/prisma.service";

@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private readonly jwtService: JwtService,
  ) { }

  async login(data) {
    let { user, password } = data;
    const val = await this.prisma.user.findFirst({
      where: {
        user
      }
    })

    if (!val)
      throw new BadRequestException(
        "Usuario no existe en nuestra base de datos"
      );

    const isPasswordValid = await bcrypt.compare(password, val.password);
    if (!isPasswordValid)
      throw new BadRequestException("Contraseña incorrecta");

    const token = await this.jwtService.signAsync(val);
    return {
      data: val,
      token,
      message: "Usuario a iniciado sesion correctamente!",
    };
  }
}
