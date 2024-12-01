import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { NavbarComponent } from './navbar/navbar.component';
import { AuthService } from './services/auth.service';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, NavbarComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  constructor(
    private authService: AuthService,
  ) {}
  title = 'afk';
  ngOnInit(): void {
    // Подписываемся на изменения состояния аутентификации
    this.authService.isLoggedIn().subscribe(isLoggedIn => {
      if (isLoggedIn) {
        // Если информация о пользователе еще не загружена, можно вызвать fetchUser
        this.authService.fetchUser().subscribe(userData => {});
      }
    });
  }
}