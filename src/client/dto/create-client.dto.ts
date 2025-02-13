import { TYPE_DOCUMENT } from '@prisma/client';
import { IsString, IsOptional, IsEnum, IsEmail, IsUUID } from 'class-validator';
import { StringifyOptions } from 'querystring';

export class CreateClientDto {
  @IsString()
  full_name: string;

  @IsEnum(TYPE_DOCUMENT)
  type_document: TYPE_DOCUMENT;

  @IsString()
  document: string;

  @IsString()
  phone: string;

  @IsOptional()
  @IsString()
  phone_whatsapp?: string;

  @IsOptional()
  @IsEmail()
  email?: string;

  @IsString()
  address: string;

  @IsString()
  latitud: string;

  @IsString()
  longitud: string;

  @IsUUID()
  areaId: string

  @IsUUID()
  @IsOptional()
  plansId: string
}
