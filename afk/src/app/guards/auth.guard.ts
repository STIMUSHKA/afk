import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { AuthService } from '../services/auth.service'; // Adjust the path if necessary

@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate(): boolean {
    const isLoggedIn = !!this.authService.getToken(); // Check if a token exists
    if (!isLoggedIn) {
      this.router.navigate(['/login']); // Redirect to login if not authenticated
    }
    return isLoggedIn;
  }
}
