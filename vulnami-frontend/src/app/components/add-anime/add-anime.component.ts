import { Component, OnInit } from '@angular/core';
import { Anime } from 'src/app/models/anime.model';
import { AnimeService } from 'src/app/services/anime.service';

@Component({
  selector: 'app-add-anime',
  templateUrl: './add-anime.component.html',
  styleUrls: ['./add-anime.component.css']
})
export class AddAnimeComponent implements OnInit {
  anime: Anime = {
    title: '',
    genre: ''
  };
  submitted = false;

  constructor(private animeService: AnimeService) { }

  ngOnInit(): void {

  }

  saveAnime(): void {
    const data = {
      anime: {
        title: this.anime.title,
        genre: this.anime.genre
      }
    };

    this.animeService.create(data)
      .subscribe({
        next: (res) => {
          console.log(res);
          this.submitted = true;
        },
        error: (e) => console.error(e)
      });
  }

  newAnime(): void {
    this.submitted = false;
    this.anime = {
      title: '',
      genre: ''
    };
  }
}

