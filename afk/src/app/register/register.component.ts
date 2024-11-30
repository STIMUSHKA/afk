import { Component } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  imports: [FormsModule],
  styleUrls: ['./register.component.scss'],
  
})
export class RegisterComponent {
  user = { username: '', email: '', password: '' };

  constructor(private authService: AuthService, private router: Router) {}

  register() {
    this.authService.register(this.user).subscribe(
      (response: any) => {
        console.log('Registration successful', response);
        this.router.navigate(['/profile']); // Перенаправление на личный кабинет
      },
      (error) => {
        console.error('Registration error', error);
      }
    );
  }
}
