import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AnimesListComponent } from './components/animes-list/animes-list.component';
import { AnimeDetailsComponent } from './components/anime-details/anime-details.component';

const routes: Routes = [
  { path: '', redirectTo: 'animes', pathMatch: 'full' },
  { path: 'animes', component: AnimesListComponent },
  { path: 'animes/:id', component: AnimeDetailsComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
