import { BadRequestException, Injectable } from '@nestjs/common';
import { CreateClientDto } from './dto/create-client.dto';
import { UpdateClientDto } from './dto/update-client.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ClientService {
  constructor(private prisma: PrismaService) { }

  async create(createClientDto: CreateClientDto) {
    const validate = await this.prisma.client.findFirst({
      where: {
        document: createClientDto.document
      }
    })

    if (validate) {
      throw new BadRequestException("Este numero de documento ya existe, por lo que no puede crear un cliente duplicado!")
    }

    const data = await this.prisma.client.create({ data: createClientDto })

    return { data, message: 'Cliente Creado con Exito!' }
  }

  async findAll() {
    const data = await this.prisma.client.findMany()
    return { data, message: 'Listado de Clientes obtenidos con exito' }
  }

  findOne(id: string) {
    return `This action returns a #${id} client`;
  }

  async update(id: string, updateClientDto: UpdateClientDto) {
    const data = await this.prisma.client.update({
      where: { id },
      data: updateClientDto
    })

    return { data, message: 'Cliente Actualizado con exito' }
  }

  remove(id: string) {
    return `This action removes a #${id} client`;
  }
}
