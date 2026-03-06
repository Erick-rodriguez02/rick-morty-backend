import { Injectable } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';
import { firstValueFrom } from 'rxjs';

@Injectable()
export class CharactersService {
  constructor(private readonly httpService: HttpService) {}

  async getCharacters(name?: string) {
    const url = `https://rickandmortyapi.com/api/character`;
    const params = name ? { name } : {};
    
    try {
      const { data } = await firstValueFrom(
        this.httpService.get(url, { params })
      );
      return data;
    } catch (error) {
      if (error.response?.status === 404) {
        return { results: [] };
      }
      throw error;
    }
  }
}
