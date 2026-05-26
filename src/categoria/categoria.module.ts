import { Module } from '@nestjs/common';
import { CategoriaService } from './categoria.service';
import { CategoriasController } from './categoria.controller'; 
import { PrismaService } from '../prisma.service';

@Module({
  controllers: [CategoriasController], 
  providers: [CategoriaService, PrismaService],
})
export class CategoriaModule {}