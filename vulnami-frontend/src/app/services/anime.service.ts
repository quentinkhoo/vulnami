import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Anime } from '../models/anime.model';

const baseUrl = 'http://localhost:2300/animes';

@Injectable({
  providedIn: 'root'
})
export class AnimeService {

  constructor(private http: HttpClient) { }

  getAll(): Observable<Anime[]> {
    return this.http.get<Anime[]>(baseUrl);
  }

  get(id: any): Observable<Anime> {
    return this.http.get<Anime>(`${baseUrl}/${id}`);
  }

  create(data: any): Observable<any> {
    return this.http.post(baseUrl, data);
  }

  update(id: any, data: any): Observable<any> {
    return this.http.put(`${baseUrl}/${id}`, data);
  }

  delete(id: any): Observable<any> {
    return this.http.delete(`${baseUrl}/${id}`);
  }

  deleteAll(): Observable<any> {
    return this.http.delete(baseUrl);
  }

  findByTitle(title: any): Observable<Anime[]> {
    return this.http.get<Anime[]>(`${baseUrl}?title=${title}`);
  }

}
