import { Component, Input, OnInit } from '@angular/core';
import { AnimeService } from 'src/app/services/anime.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Anime } from '../../models/anime.model'

@Component({
  selector: 'app-anime-details',
  templateUrl: './anime-details.component.html',
  styleUrls: ['./anime-details.component.css']
})
export class AnimeDetailsComponent implements OnInit {

  @Input() viewMode = false;

  @Input() currentAnime: Anime = {
    title: '',
    genre: ''
  };

  message = '';

  constructor(
    private animeService: AnimeService,
    private route: ActivatedRoute,
    private router: Router) { }

  ngOnInit(): void {
    if (!this.viewMode) {
      this.message = '';
      this.getAnime(this.route.snapshot.params["id"]);
    }
  }

  getAnime(id: string): void {
    this.animeService.get(id)
      .subscribe({
        next: (data) => {
          this.currentAnime = data;
          console.log(data);
        },
        error: (e) => console.error(e)
      });
  }

  deleteAnime(): void {
    this.animeService.delete(this.currentAnime.id)
      .subscribe({
        next: (res) => {
          console.log(res);
          this.router.navigate(['/animes']);
        },
        error: (e) => console.error(e)
      });
  }

}
