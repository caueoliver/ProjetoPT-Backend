//definição dos atributos da entidade usuário
import { randomUUID } from "crypto";


export class User {
    id: string = randomUUID();
    email!: string;
    name!: string;
    username!: string;
    password!: string;

}
