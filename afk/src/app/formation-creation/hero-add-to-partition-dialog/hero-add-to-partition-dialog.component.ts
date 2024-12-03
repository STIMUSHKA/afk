import { Component } from '@angular/core';
import { MatDialogContent, MatDialogContainer, MatDialogRef } from '@angular/material/dialog';
import { HeroesComponent } from '../../heroes/heroes.component';
import { Hero } from '../../models/hero.model';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { API_BASE_URL } from '../../shared/constants';
@Component({
  selector: 'app-hero-selection-dialog',
  templateUrl: './hero-add-to-partition-dialog.component.html',
  styleUrls: ['./hero-add-to-partition-dialog.component.scss'],
  imports: [HeroesComponent, CommonModule, MatDialogContent, MatButtonModule ],
})
export class HeroAddToPartitionDialog {
  selectedHero: Hero | null = null; // Переменная для хранения выбранного героя

  constructor(
    public dialogRef: MatDialogRef<HeroAddToPartitionDialog>
  ) {}

  onHeroSelected(hero: any): void {
    this.selectedHero = hero;
    this.onClose();
  }

  onClose(): void {   
    this.dialogRef.close(this.selectedHero); // Закрываем модальное окно
  }

}