import { Injectable } from '@angular/core';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Router } from '@angular/router';
import { BehaviorSubject, tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:1337/api'; // URL вашего Strapi сервера
  private token: string = '';
  private isLoggedInSubject = new BehaviorSubject<boolean>(false);
  private user: any = null; // Хранение информации о пользователе

  constructor(private http: HttpClient, private router: Router) {
    // Проверяем наличие токена в localStorage при инициализации сервиса
    this.token = localStorage.getItem('token') || '';
    this.isLoggedInSubject.next(!!this.token);
  }

  // Метод для регистрации пользователя
  register(user: { username: string; email: string; password: string }) {
    return this.http.post(`${this.apiUrl}/auth/local/register`, user).pipe(
      tap((response: any) => {
        this.token = response.jwt;
        this.user = response.user;
        localStorage.setItem('token', this.token);
        this.isLoggedInSubject.next(true);
      })
    )
  }

  // Метод для логина пользователя
  login(user: { identifier: string; password: string }) {
    return this.http.post(`${this.apiUrl}/auth/local`, user).pipe(
      tap((response: any) => {
        this.token = response.jwt;
        this.user = response.user; // Сохраняем информацию о пользователе
        localStorage.setItem('token', this.token);
        this.isLoggedInSubject.next(true);
      })
    );
  }

  getUser() {
    return this.user; // Возвращаем информацию о пользователе
  }

  // Метод для выхода пользователя
  logout() {
    this.token = '';
    localStorage.removeItem('token');
    this.isLoggedInSubject.next(false);
    this.router.navigate(['/login']);
  }

  // Метод для установки токена
  setToken(token: string) {
    this.token = token;
    localStorage.setItem('token', token);
    this.isLoggedInSubject.next(true);
  }

  // Метод для проверки статуса авторизации
  isLoggedIn() {
    return this.isLoggedInSubject.asObservable();
  }

  // Метод для получения токена
  getToken() {
    return this.token;
  }
}
