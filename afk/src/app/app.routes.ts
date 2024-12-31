import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { ProfileComponent } from './profile/profile.component';
import { HeroesComponent } from './heroes/heroes.component';
import { MyHeroesComponent } from './my-heroes/my-heroes.component';
import { MyFormationComponent } from './my-formations/my-formations.component';
import { FormationCreationComponent } from './formation-creation/formation-creation.component';
import { AuthGuard } from './guards/auth.guard'; // Import the AuthGuard
import { GuestGuard } from './guards/guest.guard';

export const routes: Routes = [
    { path: 'login', component: LoginComponent, canActivate: [GuestGuard] },
    { path: 'register', component: RegisterComponent, canActivate: [GuestGuard] },
    { path: 'profile', component: ProfileComponent, canActivate: [AuthGuard] },
    { path: 'heroes', component: HeroesComponent },
    { path: 'my-heroes', component: MyHeroesComponent, canActivate: [AuthGuard] },
    { path: 'formation-creation', component: FormationCreationComponent, canActivate: [AuthGuard] },
    { path: 'my-formations', component: MyFormationComponent, canActivate: [AuthGuard] },
    { path: '', redirectTo: '/heroes', pathMatch: 'full' },
];