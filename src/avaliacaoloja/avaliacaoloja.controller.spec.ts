import { Test, TestingModule } from '@nestjs/testing';
import { AvaliacaolojaController } from './avaliacaoloja.controller';
import { AvaliacaolojaService } from './avaliacaoloja.service';

describe('AvaliacaolojaController', () => {
  let controller: AvaliacaolojaController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [AvaliacaolojaController],
      providers: [AvaliacaolojaService],
    }).compile();

    controller = module.get<AvaliacaolojaController>(AvaliacaolojaController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
