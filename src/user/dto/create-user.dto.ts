import { TYPE_USER } from "@prisma/client";
import { IsEnum, IsNotEmpty, IsOptional, IsString } from "class-validator";

export class CreateUserDto {
    @IsString()
    @IsNotEmpty()
    name: string;

    @IsString()
    @IsNotEmpty()
    password: string;

    @IsString()
    @IsNotEmpty()
    user: string;

    @IsEnum(TYPE_USER)
    @IsOptional()
    role: TYPE_USER = TYPE_USER.SOPORTE;
}