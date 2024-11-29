import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Hero } from '../models/hero.model';
import { tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class HeroService {
  private apiUrl = 'http://localhost:1337/api/heroes';
  private heroesKey = 'heroes';
  private lastFetchKey = 'lastFetch';

  constructor(private http: HttpClient) {}

  getHeroes(): Observable<Hero[]> {
    const lastFetch = localStorage.getItem(this.lastFetchKey);
    const now = new Date().getTime();

    // Проверяем, нужно ли обновлять данные
    if (!lastFetch || now - Number(lastFetch) > 24 * 60 * 60 * 1000) {
      return this.http.get<Hero[]>(this.apiUrl).pipe(
        tap(heroes => {
          localStorage.setItem(this.heroesKey, JSON.stringify(heroes));
          localStorage.setItem(this.lastFetchKey, now.toString());
        })
      );
    } else {
      // Возвращаем данные из локального хранилища
      return new Observable<Hero[]>(observer => {
        const heroes = JSON.parse(localStorage.getItem(this.heroesKey) || '[]');
        observer.next(heroes);
        observer.complete();
      });
    }
  }
}
