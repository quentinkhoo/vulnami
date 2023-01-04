import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Anime } from '../models/anime.model';

@Injectable({
  providedIn: 'root'
})
export class AnimeService {

  constructor() { }
}
