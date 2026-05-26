import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CategoriaService } from './categoria.service';
import { CreateCategoriaDto } from './dto/create-categoria.dto';
import { UpdateCategoriaDto } from './dto/update-categoria.dto';

import { PrismaService } from '../prisma.service';

@Controller('categorias') 
export class CategoriasController {
  constructor(private readonly prisma: PrismaService) {}

  // create nessa parte seqguindo o padrao do BD de catgorias
  @Post()
  async criarCategoria(@Body() dados: { name: string; parentCategoryId?: number }) {
    return await this.prisma.categorias.create({
      data: {
        name: dados.name,
        parentCategoryId: dados.parentCategoryId, 
      },
    });
  }

  // read para listar as categorias 
  @Get()
  async listarCategorias() {
    return await this.prisma.categorias.findMany({
      include: {
        subCategories: true,
      },
    });
  }

  // parte do update , atualizar a categoria 
  @Patch(':id')
  async atualizarCategoria(@Param('id') id: string, @Body() dados: { name: string }) {
    return await this.prisma.categorias.update({
      where: { id: Number(id) },
      data: { name: dados.name },
    });
  }

  // parte de deletar
  @Delete(':id')
  async deletarCategoria(@Param('id') id: string) {
    return await this.prisma.categorias.delete({
      where: { id: Number(id) },
    });
  }
}