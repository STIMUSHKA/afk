import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
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
  public userName: string = "";
  public isSidebarOpen: boolean = false;
  constructor(private router: Router, private authService: AuthService) {}
  
  ngOnInit(): void {
    this.authService.isLoggedIn().subscribe( isLoggedIn => {
      this.loggedIn = isLoggedIn
    })
    this.authService.userSubject.subscribe( user => {
      if (user) {
        this.userName = user.username
      }
    })
  }

  @ViewChild('sidebar') sidebar!: ElementRef;
  toggleBurger() {
    this.isSidebarOpen = !this.isSidebarOpen;
    const sidebarElement = this.sidebar.nativeElement;

      if (sidebarElement.style.left === '0px') {
        sidebarElement.style.left = '-102%'; // Hide sidebar
        sidebarElement.blur();
        console.log('hi');
      } else {
        sidebarElement.style.left = '0px'; // Show sidebar
      }
    
  }
  
  navigateToHome() {
    this.router.navigate(['/'])
    this.toggleBurger()
  }
  navigateToHeroes() {
    this.router.navigate(['/heroes'])
    this.toggleBurger()
  }
  navigateToMyFormations() {
    this.router.navigate(['/my-formations'])
    this.toggleBurger()
  }
  navigateToMyHeroes() {
    this.router.navigate(['/my-heroes'])
    this.toggleBurger()
  }
  navigateToProfile() {
    this.router.navigate(['/profile']); // Перейти на страницу профиля
    this.toggleBurger()
  }

  navigateToFormationCreation() {
    this.router.navigate(['/formation-creation']); // Перейти на страницу профиля
    this.toggleBurger()
  }

  logout() {
    this.authService.logout(); // Выйти из аккаунта
    this.router.navigate(['/login']); // Перейти на страницу логина
  }
}
