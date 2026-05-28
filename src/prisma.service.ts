import { Injectable, OnModuleInit } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
  async onModuleInit() {
    // Estabelece a conexão com o banco de dados assim que o módulo for inicializado
    await this.$connect();
  }
}