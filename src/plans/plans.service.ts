import { Injectable } from '@nestjs/common';
import { CreatePlanDto } from './dto/create-plan.dto';
import { UpdatePlanDto } from './dto/update-plan.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class PlansService {

  constructor(
    private prisma: PrismaService
  ) { }

  async create(createPlanDto: CreatePlanDto) {
    const data = await this.prisma.plans.create({ data: createPlanDto })
    return { data, message: 'Plan Creado con exito!' }
  }

  async findAll() {
    const data = await this.prisma.plans.findMany({
      include: {
        _count: {
          select: {
            clients: true,
          },
        }
      }
    })

    return { data, message: 'Planes obtenidos con exito' }
  }

  findOne(id: string) {
    return `This action returns a #${id} plan`;
  }

  async update(id: string, updatePlanDto: UpdatePlanDto) {
    const data = await this.prisma.plans.update({ where: { id }, data: updatePlanDto })

    return { data, message: 'Actualizacion Correcta' }
  }

  remove(id: string) {
    return `This action removes a #${id} plan`;
  }
}
