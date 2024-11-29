import { Component, OnInit } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  imports: [FormsModule] 
})
export class ProfileComponent implements OnInit {
  user: any;

  constructor(private authService: AuthService) {}

  ngOnInit() {
    this.user = this.authService.getUser(); // Получаем информацию о пользователе
  }

  logout() {
    this.authService.logout();
  }
}