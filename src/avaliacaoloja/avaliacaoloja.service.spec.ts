import { Test, TestingModule } from '@nestjs/testing';
import { AvaliacaolojaService } from './avaliacaoloja.service';

describe('AvaliacaolojaService', () => {
  let service: AvaliacaolojaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AvaliacaolojaService],
    }).compile();

    service = module.get<AvaliacaolojaService>(AvaliacaolojaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
