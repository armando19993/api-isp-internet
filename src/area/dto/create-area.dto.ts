import { IsString } from "class-validator";

export class CreateAreaDto {
    @IsString()
    title: string
}
