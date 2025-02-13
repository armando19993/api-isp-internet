import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { RoadmapClientsService } from './roadmap-clients.service';
import { CreateRoadmapClientDto } from './dto/create-roadmap-client.dto';
import { UpdateRoadmapClientDto } from './dto/update-roadmap-client.dto';

@Controller('roadmap-clients')
export class RoadmapClientsController {
  constructor(private readonly roadmapClientsService: RoadmapClientsService) {}

  @Post()
  create(@Body() createRoadmapClientDto: CreateRoadmapClientDto) {
    return this.roadmapClientsService.create(createRoadmapClientDto);
  }

  @Get()
  findAll() {
    return this.roadmapClientsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.roadmapClientsService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateRoadmapClientDto: UpdateRoadmapClientDto) {
    return this.roadmapClientsService.update(+id, updateRoadmapClientDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.roadmapClientsService.remove(+id);
  }
}
