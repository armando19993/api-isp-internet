import { Module } from '@nestjs/common';
import { PrismaModule } from './prisma/prisma.module';
import { UserModule } from './user/user.module';
import { PlansModule } from './plans/plans.module';
import { AreaModule } from './area/area.module';
import { ClientModule } from './client/client.module';
import { RoadmapModule } from './roadmap/roadmap.module';
import { RoadmapClientsModule } from './roadmap-clients/roadmap-clients.module';
import { AuthModule } from './auth/auth.module';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: '.env',
    }),
    AuthModule,
    PrismaModule, 
    UserModule, 
    PlansModule, 
    AreaModule, 
    ClientModule, 
    RoadmapModule, 
    RoadmapClientsModule
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
