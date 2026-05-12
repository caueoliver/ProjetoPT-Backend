import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { PrismaService } from 'src/database/prisma.service'; // Verifique se o caminho do import está correto

@Module({
  controllers: [UserController],
  providers: [UserService, PrismaService] // ADICIONE O PRISMASERVICE AQUI
})
export class UserModule {}