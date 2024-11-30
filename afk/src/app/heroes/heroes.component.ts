import { Component, EventEmitter, input, Input, Output } from '@angular/core';
import { Hero, HeroList, UserHero, UserHeroList } from '../models/hero.model';
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
  @Input() search: boolean = false
  @Input() userMode: boolean = false
  @Input() obtainedHeroes: boolean = true
  
  @Output() heroSelected = new EventEmitter<Hero>();

  public filteredHeroes: Hero[] = [];
  public filteredUserHeroes:  UserHero[] = [];
  public filterForm: FormGroup;
  public baseUrl: string = 'http://localhost:1337'

  public classes: string[] = [];
  public types: string[] = [];
  public fractions: string[] = [];

  private heroesList: HeroList = new HeroList();
  private heroes: Hero[] = [];

  private userHeroList: UserHeroList | any
  private userHeroes: UserHero[] = [];


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
    this.heroService.getHeroes().subscribe(heroesList => {
      this.heroesList = heroesList;
      this.heroes = this.heroesList.getHeroes();
      this.classes = heroesList.classes
      this.types = heroesList.types
      this.fractions = heroesList.fractions
      this.filteredHeroes = this.heroes

    });

    this.loadUserHeroes()

    this.filterForm.valueChanges.subscribe(() => {
      this.filterHeroes();
    });

  }

  public loadUserHeroes(): void {
    this.heroService.getUserHeroes().subscribe(
      userHeroList => {
        this.userHeroList = userHeroList; // Сохраняем героев в переменной
        if(this.obtainedHeroes) {
          this.userHeroes = this.userHeroList.getUserHeroes() // Создаем новый массив героев
          this.filteredUserHeroes = this.userHeroes;
        } else {
          this.heroes = this.userHeroList.getNotObtained() // Создаем новый массив героев
          this.filteredHeroes = this.heroes;
        }
      }
    );
  }

  private filterHeroes(): void {
    const { name, class: heroClass, type, fraction } = this.filterForm.value;
    if(this.userMode && this.obtainedHeroes){
      console.log(this.userHeroes)      
      this.filteredUserHeroes = this.userHeroes.filter( hero => {
        const mama = hero.getHero()
        return (
          (!name || mama.name.toLowerCase().includes(name.toLowerCase())) &&
          (!heroClass || mama.class.toLowerCase() === heroClass.toLowerCase()) &&
          (!type || mama.type.toLowerCase() === type.toLowerCase()) &&
          (!fraction || (mama.fraction && mama.fraction.name.toLowerCase() === fraction.toLowerCase()))
        );
      }) as UserHero[]
    } else {
      this.filteredHeroes = this.heroes.filter(hero => {
        return (
          (!name || hero.name.toLowerCase().includes(name.toLowerCase())) &&
          (!heroClass || hero.class.toLowerCase() === heroClass.toLowerCase()) &&
          (!type || hero.type.toLowerCase() === type.toLowerCase()) &&
          (!fraction || (hero.fraction && hero.fraction.name.toLowerCase() === fraction.toLowerCase()))
        );
      }) as Hero[]
    }

  }
  public setClassFilter(heroClass: string): void {
    if(this.filterForm.value.class === heroClass) {
      this.filterForm.patchValue({ class: '' });
    } else {
      this.filterForm.patchValue({ class: heroClass });
    }
  }

  public setTypeFilter(heroType: string): void {
    if(this.filterForm.value.type === heroType) {
      this.filterForm.patchValue({ type: '' });
    } else {
      this.filterForm.patchValue({ type: heroType });
    }
  }

  public setFractionFilter(fraction: string): void {
    if(this.filterForm.value.fraction === fraction) {
      this.filterForm.patchValue({ fraction: '' });
    } else {
      this.filterForm.patchValue({ fraction: fraction });
    }
  }

  public selectHero(hero: any): void {
    this.heroSelected.emit(hero); // Эмитируем событие с выбранным героем
  }
}
  

