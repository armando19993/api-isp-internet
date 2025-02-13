import { PartialType } from '@nestjs/mapped-types';
import { CreateRoadmapClientDto } from './create-roadmap-client.dto';

export class UpdateRoadmapClientDto extends PartialType(CreateRoadmapClientDto) {}
