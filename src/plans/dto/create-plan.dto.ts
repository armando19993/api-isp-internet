import { IsString, Matches } from "class-validator";

export class CreatePlanDto {
  @IsString()
  name: string;

  @IsString()
  @Matches(/^\d+(\.\d{1,2})?$/, {
    message: 'El precio debe ser un número válido con hasta dos decimales.',
  })
  price: string;
}
