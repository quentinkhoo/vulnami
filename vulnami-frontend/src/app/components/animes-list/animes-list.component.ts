import { Component, OnInit } from '@angular/core';
import { Anime } from 'src/app/models/anime.model';
import { AnimeService } from 'src/app/services/anime.service';

@Component({
  selector: 'app-animes-list',
  templateUrl: './animes-list.component.html',
  styleUrls: ['./animes-list.component.css']
})
export class AnimesListComponent implements OnInit {

  animes?: Anime[];
  currentAnime: Anime = {};
  currentIndex = -1;
  title = '';

  constructor(private animeService: AnimeService) { }

  ngOnInit(): void {
    this.retrieveAnimes();
  }

  retrieveAnimes(): void {
    this.animeService.getAll()
      .subscribe({
        next: (data) => {
          this.animes = data;
          console.log(data);
        },
        error: (e) => console.error(e)
      });
  }

  refreshList(): void {
    this.retrieveAnimes();
    this.currentAnime = {};
    this.currentIndex = -1;
  }

  setActiveAnime(anime: Anime, index: number): void {
    this.currentAnime = anime;
    this.currentIndex = index;
  }

  removeAllAnimes(): void {
    this.animeService.deleteAll()
      .subscribe({
        next: (res) => {
          console.log(res);
          this.refreshList();
        },
        error: (e) => console.error(e)
      })
  }

  searchTitle(): void {
    this.currentAnime = {};
    this.currentIndex = -1;

    this.animeService.findByTitle(this.title)
      .subscribe({
        next: (data) => {
          this.animes = data;
          console.log(data);
        },
        error: (e) => console.error(e)
      });
  }
}
