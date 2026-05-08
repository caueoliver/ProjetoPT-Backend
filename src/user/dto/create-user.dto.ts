import { IsEmail, IsNotEmpty, IsString, MinLength } from 'class-validator';

//definição do dto para a criação de um usuário, não é necessário ID pois ele é gerado randomicamente e não preenchido pelo usuário

export class CreateUserDto {
    //decorators definem as validações a sereme feitas em cada campo
    @IsEmail()
    email!: string;

    @IsNotEmpty()
    @IsString()
    nome!: string;

    @IsNotEmpty()
    @IsString()
    name!: string;

    @MinLength(6)
    password!: string;
}
