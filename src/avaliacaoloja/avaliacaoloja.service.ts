import { Injectable } from '@nestjs/common';
import { CreateAvaliacaolojaDto } from './dto/create-avaliacaoloja.dto';
import { UpdateAvaliacaolojaDto } from './dto/update-avaliacaoloja.dto';

@Injectable()
export class AvaliacaolojaService {
  create(createAvaliacaolojaDto: CreateAvaliacaolojaDto) {
    return 'This action adds a new avaliacaoloja';
  }

  findAll() {
    return `This action returns all avaliacaoloja`;
  }

  findOne(id: number) {
    return `This action returns a #${id} avaliacaoloja`;
  }

  update(id: number, updateAvaliacaolojaDto: UpdateAvaliacaolojaDto) {
    return `This action updates a #${id} avaliacaoloja`;
  }

  remove(id: number) {
    return `This action removes a #${id} avaliacaoloja`;
  }
}
