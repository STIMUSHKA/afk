import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { ProfileComponent } from './profile/profile.component';
import { HeroesComponent } from './heroes/heroes.component';
import { MyHeroesComponent } from './my-heroes/my-heroes.component';
import { MyFormationComponent } from './my-formations/my-formations.component';
import { FormationCreationComponent } from './formation-creation/formation-creation.component';

export const routes: Routes = [
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },
    { path: 'profile', component: ProfileComponent },
    { path: 'heroes', component: HeroesComponent },
    { path: 'my-heroes', component: MyHeroesComponent },
    { path: 'formation-creation', component: FormationCreationComponent },
    { path: 'my-formations', component: MyFormationComponent },
    { path: '', redirectTo: '/heroes', pathMatch: 'full' },
];