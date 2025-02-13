import { Injectable } from '@nestjs/common';
import { CreateRoadmapClientDto } from './dto/create-roadmap-client.dto';
import { UpdateRoadmapClientDto } from './dto/update-roadmap-client.dto';

@Injectable()
export class RoadmapClientsService {
  create(createRoadmapClientDto: CreateRoadmapClientDto) {
    return 'This action adds a new roadmapClient';
  }

  findAll() {
    return `This action returns all roadmapClients`;
  }

  findOne(id: number) {
    return `This action returns a #${id} roadmapClient`;
  }

  update(id: number, updateRoadmapClientDto: UpdateRoadmapClientDto) {
    return `This action updates a #${id} roadmapClient`;
  }

  remove(id: number) {
    return `This action removes a #${id} roadmapClient`;
  }
}
