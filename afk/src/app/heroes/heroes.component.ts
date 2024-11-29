import { Component } from '@angular/core';
import { Hero } from '../models/hero.model';
import { HeroService } from '../services/heroes.service';
import { CommonModule } from '@angular/common'; 
import { FormGroup, ReactiveFormsModule, FormBuilder } from '@angular/forms';
@Component({
  selector: 'app-heroes',
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './heroes.component.html',
  styleUrl: './heroes.component.scss'
})
export class HeroesComponent {
  heroes: Hero[] = [];
  filteredHeroes: Hero[] = [];
  filterForm: FormGroup;
  baseUrl: string = 'http://localhost:1337'
  classes: string[] = [];
  types: string[] = [];
  fractions: string[] = [];
  
  constructor(
    private heroService: HeroService,
    private fb: FormBuilder) {
    this.filterForm = this.fb.group({
      name: [''],
      class: [''],
      type: [''],
      fraction: ['']
    });
  }

  
  ngOnInit(): void {
    this.heroService.getHeroes().subscribe(heroes => {
      this.heroes = heroes;
      this.filteredHeroes = heroes; // Изначально показываем всех героев

      // Собираем уникальные значения для селекторов
      this.classes = [...new Set(heroes.map(hero => hero.class))];
      this.types = [...new Set(heroes.map(hero => hero.type))];
      this.fractions = [...new Set(heroes.map(hero => hero.fraction?.name).filter((name): name is string => name !== undefined))];
    });

    // Подписка на изменения в форме фильтрации
    this.filterForm.valueChanges.subscribe(() => {
      this.filterHeroes();
    });
  }

  filterHeroes(): void {
    const { name, class: heroClass, type, fraction } = this.filterForm.value;
    this.filteredHeroes = this.heroes.filter(hero => {
      return (
        (!name || hero.name.toLowerCase().includes(name.toLowerCase())) &&
        (!heroClass || hero.class.toLowerCase() === heroClass.toLowerCase()) &&
        (!type || hero.type.toLowerCase() === type.toLowerCase()) &&
        (!fraction || (hero.fraction && hero.fraction.name.toLowerCase() === fraction.toLowerCase()))
      );
    });
  }
  setClassFilter(heroClass: string): void {
    if(this.filterForm.value.class === heroClass) {
      this.filterForm.patchValue({ class: '' });
    } else {
      this.filterForm.patchValue({ class: heroClass });
    }
  }

  setTypeFilter(heroType: string): void {
    if(this.filterForm.value.type === heroType) {
      this.filterForm.patchValue({ type: '' });
    } else {
      this.filterForm.patchValue({ type: heroType });
    }
  }

  setFractionFilter(fraction: string): void {
    if(this.filterForm.value.fraction === fraction) {
      this.filterForm.patchValue({ fraction: '' });
    } else {
      this.filterForm.patchValue({ fraction: fraction });
    }
  }
}
  

