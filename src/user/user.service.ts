import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import {User} from './entities/user.entity';
import { PrismaService } from 'src/database/prisma.service';
import { randomUUID } from 'node:crypto';

@Injectable()
export class UserService {
  //como a integração com o banco de dados não está 100% configurada, inicialmente vou utilizar o array para a criação do crud
  private users: User[] = [];

  //a função para criação do usuário tem como parametro um objeto data com os atributos definidos no createUserDTO
  create(data: CreateUserDto) {
    //cria um objeto para o novo usuário
    const newUser = {
      //gera o id randomicamente sem precisar de um input do usuário
      id: randomUUID(),
      //"..." espalha os campos definidos no dto dentro do objeto
      ...data,
    };
    //coloca o novo objeto dentro do array
    this.users.push(newUser);
    //retorna o novo objeto
    return newUser;
  }

  findAll() {
    //retorna todos os usuários armazenados no array até o momento
    return this.users;
  }

//a função para buscar um usuário tem como parâmetro um id
  findOne(id: string) {
    //cria uma constante local e busca o usuário com o id correspondente no array
    const user = this.users.find((user) => user.id === id);
    //se ele não for encontrado o sistema retorna uma mensagem de usuário não encontrado
    if(!user){
      throw new NotFoundException('Usuário não encontrado')
    }
    //se for encontrado retorna o nome do usuário
    else
    return `user ${user.name}`;
  }

  //a função para atualizar um usuário tem como parâmetro o id do usuário que será atualizado 
  //e um objeto updateData com os atributos definidos pelo update user dto
  update(id: string, updateData: UpdateUserDto) {
    //cria uma constante para achar o index do usuárido dentro do array
    const userIndex = this.users.findIndex((user) => user.id === id);
    if(userIndex === -1){
      //se o index não for encontrado, uma mensagem é retornada
      throw new NotFoundException('Usuário não encontrado')
    }
    //cria um objeto de usuário atualizado e preenche ele com os dados do usuário no array
    const updatedUser ={
      ...this.users[userIndex],
      //sobrescreve os dados do objeto com os dados enviados na requisição
      ...updateData,
    }
    //atualiza o usuário no array
    this.users[userIndex] = updatedUser;

    console.log(`Usuário ${updatedUser.name} atualizado com sucesso`);
    return updatedUser;
  }

  //tem com parametro o id do usuário a ser deletado
  remove(id: string) {
    //busca o index do usuário no array
    const userIndex = this.users.findIndex((user) => user.id === id);
    //caso não seja encontrado retorna uma msg
    if(userIndex === -1){
      throw new NotFoundException('Usuário não encontrado')
    }
    else{
    //caso seja encontrado, remove o usuário do array
      this.users.splice(userIndex, 1);
      return {message: 'Usuário deletado com sucesso'};
    }
  }
}
