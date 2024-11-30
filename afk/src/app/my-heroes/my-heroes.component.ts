import { Component, ViewChild } from '@angular/core';
import { HeroesComponent } from '../heroes/heroes.component';
import { MatDialog } from '@angular/material/dialog';
import { HeroSelectionDialogComponent } from './hero-selection-dialog/hero-selection-dialog.component';
import { MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatStepperModule } from '@angular/material/stepper';
import { HeroService } from '../services/heroes.service';
import { Hero, UserHero } from '../models/hero.model';

@Component({
  selector: 'app-my-heroes',
  imports: [HeroesComponent, MatDialogModule, MatButtonModule, MatStepperModule],
  templateUrl: './my-heroes.component.html',
  styleUrl: './my-heroes.component.scss'
})
export class MyHeroesComponent {
  myHeroes = []; // Ваши герои, которые нужно исключить
  authService: any;
  userHeroes: UserHero[] = [];
  heroList: Hero[] = [];
  loading: boolean = true;

  @ViewChild(HeroesComponent) heroesComponent: HeroesComponent = {} as HeroesComponent;
  constructor(
    public dialog: MatDialog,
    private heroService: HeroService
  ) {}

  ngOnInit(): void {
   
  }
  openHeroSelectionDialog(): void {
    const dialogRef = this.dialog.open(HeroSelectionDialogComponent, {
      height: '800px',
      width: '920px',
      panelClass: 'mama'
    });

    dialogRef.afterClosed().subscribe(result => {
      this.heroService.createUserHero(result).subscribe({
        next: (response) => {
          this.heroService.loadUserHeroes()
          this.heroesComponent.loadUserHeroes();
        },
        error: (error) => {
          console.error('Error adding hero:', error);
        }
      });
    });
  }

  onHeroSelected(hero: any): void {
    console.log('Выбранный герой:', hero);

    // тут будет редактирование стат перса
  }

  
}
