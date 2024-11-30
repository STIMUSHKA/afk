import { Component, OnInit } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss'],
  imports: [FormsModule] 
})
export class ProfileComponent implements OnInit {
  user: any;

  constructor(
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    // Подписываемся на изменения состояния аутентификации
    this.authService.isLoggedIn().subscribe(isLoggedIn => {
      if (isLoggedIn) {
        this.user = this.authService.getUser();
        // Если информация о пользователе еще не загружена, можно вызвать fetchUser
        if (!this.user) {
          this.authService.fetchUser().subscribe(userData => {
            this.user = userData;
          });
        }
      }
    });
  }

  logout() {
    this.authService.logout();
  }
}