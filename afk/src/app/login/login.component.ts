import { Component } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  imports: [FormsModule],
  styleUrls: ['./login.component.scss'],

})
export class LoginComponent {
  user = { identifier: '', password: '' };

  constructor(private authService: AuthService, private router: Router) {}

  login() {
    this.authService.login(this.user).subscribe(
      (response: any) => {
        this.authService.setToken(response.jwt);
        console.log('Login successful', response);
        this.router.navigate(['/profile']); // Перенаправление на личный кабинет
      },
      (error) => {
        console.error('Login error', error);
      }
    );
  }
}
