import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { Hero, HeroList, UserHero, UserHeroList } from '../models/hero.model';
import { map, tap } from 'rxjs/operators';
import { API_BASE_URL } from '../shared/constants';

@Injectable({
  providedIn: 'root'
})
export class HeroService {
  private url = API_BASE_URL
  private heroApi = `${this.url}/api/heroes`;
  private userHeroApiUrl = `${this.url}/api/user-heroes`;  
  private heroesKey = 'heroes';
  private lastFetchKey = 'lastFetch';
  private heroList: HeroList;
  private userHeroList: UserHeroList;
  private heroListSubject: BehaviorSubject<HeroList | null> = new BehaviorSubject<HeroList | null>(null);
  private userHeroListSubject: BehaviorSubject<UserHeroList | null> = new BehaviorSubject<UserHeroList | null>(null);

  
  constructor(private http: HttpClient) {
    this.heroList = new HeroList([]);
    this.userHeroList = new UserHeroList([]);

    this.loadHeroes();
    this.heroListSubject.subscribe( mama => {
      this.heroList = mama!
    })
    this.userHeroListSubject.subscribe( mama => {
      console.log(mama)
    })
  }

  // getHeroes(): Observable<HeroList> {
  //   const lastFetch = localStorage.getItem(this.lastFetchKey);
  //   const now = new Date().getTime();
  
  //   // Проверяем, нужно ли обновлять данные
  //   if (!lastFetch || now - Number(lastFetch) > 24 * 60 * 60 * 1000) {
  //     return this.http.get<Hero[]>(this.heroApi).pipe(
  //       map(heroesData => new HeroList(heroesData.map(heroData => new Hero(heroData)))), // Преобразуем в HeroList
  //       tap(heroList => {
  //         localStorage.setItem(this.heroesKey, JSON.stringify(heroList.getHeroes()));
  //         localStorage.setItem(this.lastFetchKey, now.toString());
  //       })
  //     );
  //   } else {
  //     // Возвращаем данные из локального хранилища
  //     return new Observable<HeroList>(observer => {
  //       const heroesData = JSON.parse(localStorage.getItem(this.heroesKey) || '[]');
  //       const heroList = new HeroList(heroesData.map((heroData: any) => new Hero(heroData))); // Преобразуем в HeroList
  //       observer.next(heroList);
  //       observer.complete();
  //     });
  //   }
  // }

  private loadHeroes(): void {
    const lastFetch = localStorage.getItem(this.lastFetchKey);
    const now = new Date().getTime();
  
    // Проверяем, нужно ли обновлять данные
    if (!lastFetch || now - Number(lastFetch) > 24 * 60 * 60 * 1000) {
      this.http.get<Hero[]>(this.heroApi).pipe(
        map(heroesData => {
          const heroList = new HeroList(heroesData.map(heroData => new Hero(heroData)));
          // Сохраняем данные о героях в локальное хранилище
          localStorage.setItem(this.heroesKey, JSON.stringify(heroList.getHeroes()));
          localStorage.setItem(this.lastFetchKey, now.toString());
          return heroList;
        }),
        tap(heroList => {
          this.heroListSubject.next(heroList);
          // После получения всех героев, грузим информацию о героях пользователя
          this.loadUserHeroes();
        })
      ).subscribe({
        next: () => console.log('Heroes loaded successfully'),
        error: (err) => console.error('Error loading heroes:', err)
      });
    } else {
      // Загружаем данные из локального хранилища
      const heroesData = JSON.parse(localStorage.getItem(this.heroesKey) || '[]');
      const heroList = new HeroList(heroesData.map((heroData: any) => new Hero(heroData)));
      this.heroListSubject.next(heroList);
      // После загрузки героев, грузим информацию о героях пользователя
      this.loadUserHeroes();
    }
  }

  public loadUserHeroes(): void {
    const token = localStorage.getItem('token');
    if (!token) {
      console.warn('No user token found');
      return;
    }

    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}` // Добавляем токен в заголовок
    });

    this.http.get<any[]>(this.userHeroApiUrl, { headers }).pipe(
      map(userHeroesData => {
        // Создаем UserHeroList на основе полученных данных
        const userHeroList = new UserHeroList(this.heroList.getHeroes());
        console.log(userHeroesData)
        userHeroesData.forEach(userHeroData => {
          userHeroList.addUserHero(userHeroData); // Добавляем каждого героя пользователя в список
        });
        return userHeroList;
      }),
      tap(userHeroList => {
        // Обновляем состояние userHeroListSubject после получения данных
        this.userHeroListSubject.next(userHeroList);
      })
    ).subscribe({
      next: () => console.log('User heroes loaded successfully'),
      error: (err) => console.error('Error loading user heroes:', err)
    });
  }

  // Метод для получения героев
  getHeroes(): Observable<HeroList> {
    return this.heroListSubject.asObservable().pipe(
      map(heroList => {
        if (!heroList) {
          throw new Error('Heroes are still loading...');
        }
        return heroList;
      })
    );
  }

  // Метод для получения UserHeroList (с автоматическим возвращением после загрузки)
  getUserHeroes(): Observable<UserHeroList> {
    return this.userHeroListSubject.asObservable().pipe(
      map(userHeroList => {
        if (!userHeroList) {
          // Возвращаем пустой UserHeroList, если еще не загружены данные
          return new UserHeroList(this.heroList.getHeroes()); // или пустой список, если так нужно
        }
        return userHeroList;
      })
    );
  }

  // Метод для получения данных о героях пользователя
  getUserHeroData(): Observable<any> {
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}` // Добавляем токен в заголовок
    });

    return this.http.get<any>(this.userHeroApiUrl, { headers });
  }


  public createUserHero(hero: UserHero) {
    const data = {
      hero:  hero.hero.id,
      engraving: '' + hero.engraving,
      furniture: '' + hero.furniture,
      signature_item: '' + hero.signature_item,
      rarity: hero.rarity,
    }
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}` // Добавляем токен в заголовок
    });

    return this.http.post<Hero>(this.userHeroApiUrl, { data }, { headers });
  }
}
