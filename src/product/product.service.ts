import { BadRequestException, Injectable } from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { TYPE_INVENTORY } from '@prisma/client';

@Injectable()
export class ProductService {

  constructor(
    private prisma: PrismaService
  ) { }

  async create(createProductDto: CreateProductDto, user) {
    const whereConditions = [];
  
    if (createProductDto.code) {
      whereConditions.push({ code: createProductDto.code });
    }
  
    if (createProductDto.codeBar) {
      whereConditions.push({ codeBar: createProductDto.codeBar });
    }
  
    const validate = whereConditions.length > 0 
      ? await this.prisma.product.findFirst({
          where: {
            OR: whereConditions
          }
        })
      : null;
  
    if (validate) {
      throw new BadRequestException('Ya existe un producto con el mismo código o código de barras.');
    }
  
    const data = await this.prisma.product.create({ data: createProductDto });
  
    if (createProductDto.stock) {
      await this.prisma.inventory.create({
        data: {
          productId: data.id,
          userId: user.id,
          type: "INGRESO",
          qty_old: 0,
          qty_new: createProductDto.stock_count,
          qty_inventory: createProductDto.stock_count,
        },
      });
    }
  
    return { data, message: 'Producto creado con éxito' };
  }
  


  async findAll() {
    const data = await this.prisma.product.findMany()

    return { data, message: 'Productops Obtenidos con exito' }
  }

  findOne(id: number) {
    return `This action returns a #${id} product`;
  }

  update(id: number, updateProductDto: UpdateProductDto) {
    return `This action updates a #${id} product`;
  }

  remove(id: number) {
    return `This action removes a #${id} product`;
  }
}
