import { Injectable } from '@nestjs/common';
import { CreateAreaDto } from './dto/create-area.dto';
import { UpdateAreaDto } from './dto/update-area.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class AreaService {

  constructor(
    private prisma: PrismaService
  ) { }

  async create(createAreaDto: CreateAreaDto) {
    const data = await this.prisma.area.create({ data: createAreaDto })
    return { data, message: 'Area Creada con exito' }
  }

  async findAll() {
    const data = await this.prisma.area.findMany({
      include: {
        _count: {
          select: {
            clients: true,
          },
        },
      },
      orderBy: {
        publicId: 'asc'
      }
    });

    return data;
  }

  async findOne(id: string) {
    return `This action returns a #${id} area`;
  }

  async update(id: string, updateAreaDto: UpdateAreaDto) {
    const data = await this.prisma.area.update({
      where: { id },
      data: updateAreaDto
    })

    return { data, message: 'Area Actualizado con exito' }
  }

  async remove(id: string) {
    return `This action removes a #${id} area`;
  }
}
