//definição do dto para a criação de um usuário, não é necessário ID pois ele é gerado randomicamente e não preenchido pelo usuário

export class CreateUserDto {
    email!: string;
    nome!: string;
    name!: string;
    password!: string;
}
