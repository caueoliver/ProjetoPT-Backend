import { Module } from '@nestjs/common';
import { AvaliacaolojaService } from './avaliacaoloja.service';
import { AvaliacoesLojaController } from './avaliacaoloja.controller'; // <-- Ajustado
import { PrismaService } from '../prisma.service'; // (Não esqueça de importar o Prisma aqui também se precisar)

@Module({
  controllers: [AvaliacoesLojaController], // <-- Ajustado
  providers: [AvaliacaolojaService, PrismaService],
})
export class AvaliacaolojaModule {}