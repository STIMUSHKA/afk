import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { ProfileComponent } from './profile/profile.component';
import { HeroesComponent } from './heroes/heroes.component';
import { MyHeroesComponent } from './my-heroes/my-heroes.component';

export const routes: Routes = [
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },
    { path: 'profile', component: ProfileComponent },
    { path: 'heroes', component: HeroesComponent },
    { path: 'my-heroes', component: MyHeroesComponent },
    { path: '', redirectTo: '/login', pathMatch: 'full' },
];