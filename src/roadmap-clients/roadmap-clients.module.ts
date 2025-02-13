import { Module } from '@nestjs/common';
import { RoadmapClientsService } from './roadmap-clients.service';
import { RoadmapClientsController } from './roadmap-clients.controller';

@Module({
  controllers: [RoadmapClientsController],
  providers: [RoadmapClientsService],
})
export class RoadmapClientsModule {}
