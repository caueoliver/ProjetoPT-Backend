import { PartialType } from '@nestjs/mapped-types';
import { CreateAvaliacaolojaDto } from './create-avaliacaoloja.dto';

export class UpdateAvaliacaolojaDto extends PartialType(CreateAvaliacaolojaDto) {}
