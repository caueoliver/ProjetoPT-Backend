import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { AvaliacaolojaService } from './avaliacaoloja.service';
import { CreateAvaliacaolojaDto } from './dto/create-avaliacaoloja.dto';
import { UpdateAvaliacaolojaDto } from './dto/update-avaliacaoloja.dto';
import { PrismaService } from '../prisma.service';

@Controller('avaliacoes-loja') // rota  
export class AvaliacoesLojaController {
  constructor(private readonly prisma: PrismaService) {}

  //
  // aqui fica o create de um novo us
  @Post()
  async criarAvaliacao(
    @Body() dados: { usuarioId: number; lojaId: number; nota: number; comentario?: string }
  ) {
    return await this.prisma.avaliacoesLoja.create({
      data: {
        usuarioId: dados.usuarioId,
        lojaId: dados.lojaId,
        nota: dados.nota,
        comentario: dados.comentario,
      },
    });
  }

  // read - listar as avaliaçoes 
  @Get()
  async listarAvaliacoes() {
    return await this.prisma.avaliacoesLoja.findMany({
      include: {
        usuario: { select: { nome: true } }, // Traz apenas o nome do usuário junto com a nota!
      },
    });
  }

  // alterta update de um ataualizaçao
  @Patch(':id')
  async atualizarAvaliacao(
    @Param('id') id: string, 
    @Body() dados: { nota?: number; comentario?: string }
  ) {
    return await this.prisma.avaliacoesLoja.update({
      where: { id: Number(id) },
      data: {
        nota: dados.nota,
        comentario: dados.comentario,
      },
    });
  }

  // parte do delete da avaliaçao
  @Delete(':id')
  async deletarAvaliacao(@Param('id') id: string) {
    return await this.prisma.avaliacoesLoja.delete({
      where: { id: Number(id) },
    });
  }
}

