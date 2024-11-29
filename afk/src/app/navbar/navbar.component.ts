import { Component, OnInit,  } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { CommonModule } from '@angular/common'; 

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss'],
  imports: [CommonModule]
})
export class NavbarComponent implements OnInit {
  public loggedIn: boolean = false;
  constructor(private router: Router, private authService: AuthService) {}
  
  ngOnInit(): void {
    this.authService.isLoggedIn().subscribe( isLoggedIn => {
      this.loggedIn = isLoggedIn
    })
  }

  navigateToHome() {
    this.router.navigate(['/'])
  }
  navigateToHeroes() {
    this.router.navigate(['/heroes'])
  }
  navigateToPacks() {
    this.router.navigate(['/packs'])
  }
  navigateToMyHeroes() {
    this.router.navigate(['/my-heroes'])
  }
  navigateToProfile() {
    this.router.navigate(['/profile']); // Перейти на страницу профиля
  }

  logout() {
    this.authService.logout(); // Выйти из аккаунта
    this.router.navigate(['/login']); // Перейти на страницу логина
  }
}
