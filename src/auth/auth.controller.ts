import {
  Body,
  Controller,
  Get,
  Post,
  Request,
  UseGuards,
} from "@nestjs/common";
import { AuthService } from "./auth.service";
import { AuthGuard } from "./auth.guard";
import { LoginDto } from "./dto/login.dto";

@Controller("auth")
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post("login")
  login(@Body() req: LoginDto) {
    return this.authService.login(req);
  }

  @Get("profile")
  @UseGuards(AuthGuard)
  profile(@Request() req) {
    return req.user;
  }
}
