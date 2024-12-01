import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { ProfileComponent } from './profile/profile.component';
import { HeroesComponent } from './heroes/heroes.component';
import { MyHeroesComponent } from './my-heroes/my-heroes.component';
import { MyFormationComponent } from './my-formations/my-formations.component';

export const routes: Routes = [
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },
    { path: 'profile', component: ProfileComponent },
    { path: 'heroes', component: HeroesComponent },
    { path: 'my-heroes', component: MyHeroesComponent },
    { path: 'my-formations', component: MyFormationComponent },
    { path: '', redirectTo: '/login', pathMatch: 'full' },
];