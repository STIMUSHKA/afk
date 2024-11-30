import { Component, ViewChild } from '@angular/core';
import { MatDialogContent, MatDialogContainer, MatDialogRef } from '@angular/material/dialog';
import { HeroesComponent } from '../../heroes/heroes.component';
import { Hero, UserHero, rarity, engraving, signature_item, furniture } from '../../models/hero.model';
import { MatStepper, MatStepperModule } from '@angular/material/stepper';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input'; // Для полей ввода
import { MatSelectModule } from '@angular/material/select'; // Для <mat-select> и <mat-option>
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { API_BASE_URL } from '../../shared/constants';
@Component({
  selector: 'app-hero-selection-dialog',
  templateUrl: './hero-selection-dialog.component.html',
  styleUrls: ['./hero-selection-dialog.component.scss'],
  imports: [HeroesComponent, MatStepperModule, CommonModule, MatDialogContent, MatButtonModule, FormsModule, MatInputModule ],
})
export class HeroSelectionDialogComponent {
  baseUrl: string = API_BASE_URL;
  selectedHero: any; // Переменная для хранения выбранного героя
  heroAttributes: any = {
    rarity: 'Elite',
    engraving: 0,
    signature_item: 0,
    furniture: 0,

  }; // Переменная для хранения характеристик героя
  myHeroes: Hero[] = []; // Переменная для хранения списка моих героев

  rarity = rarity; // Добавляем массив для выбора rarity
  engraving = engraving; // Добавляем массив для выбора engraving
  signature_item = signature_item; // Добавляем массив для выбора signature item
  furniture = furniture; // Добавляем массив для выбора furniture

  @ViewChild('stepper') stepper!: MatStepper | undefined;
  constructor(
    public dialogRef: MatDialogRef<HeroSelectionDialogComponent>
  ) {}

  onHeroSelected(hero: any): void {
    const newhero = new UserHero({hero});
    this.selectedHero = newhero; 

    this.stepper!.next()
  }

  onNext(): void {
    // Логика для перехода к следующему шагу
  }

  onClose(): void {
    this.selectedHero.rarity = this.heroAttributes.rarity;
    this.selectedHero.engraving = this.heroAttributes.engraving;
    this.selectedHero.signature_item = this.heroAttributes.signature_item;
    this.selectedHero.furniture = this.heroAttributes.furniture;
    
    this.dialogRef.close(this.selectedHero); // Закрываем модальное окно
  }

}