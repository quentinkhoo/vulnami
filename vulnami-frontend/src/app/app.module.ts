import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AnimesListComponent } from './components/animes-list/animes-list.component';
import { AnimeDetailsComponent } from './components/anime-details/anime-details.component';

import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AddAnimeComponent } from './components/add-anime/add-anime.component';

@NgModule({
  declarations: [
    AppComponent,
    AnimesListComponent,
    AnimeDetailsComponent,
    AddAnimeComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
