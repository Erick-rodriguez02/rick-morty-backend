import { Controller, Get, Query } from '@nestjs/common';
import { CharactersService } from './characters.service';

@Controller('characters')
export class CharactersController {
  constructor(private readonly charactersService: CharactersService) {}

  @Get()
  async getCharacters(@Query('name') name?: string) {
    return this.charactersService.getCharacters(name);
  }
}
