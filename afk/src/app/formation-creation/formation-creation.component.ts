import { Component, OnInit } from '@angular/core';
import {CdkDragDrop, CdkDrag, CdkDropList, moveItemInArray} from '@angular/cdk/drag-drop';
import { HeroService } from '../services/heroes.service';
import { Hero, HeroList } from '../models/hero.model';
import { API_BASE_URL } from '../shared/constants';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { HeroAddToPartitionDialog } from './hero-add-to-partition-dialog/hero-add-to-partition-dialog.component';
import { CommonModule } from '@angular/common';
import { FormationsService } from '../services/formations.service';
import { FormsModule } from '@angular/forms';
@Component({
  selector: 'app-formation-creation',
  imports: [CdkDropList, CdkDrag, MatDialogModule, CommonModule, FormsModule],
  templateUrl: './formation-creation.component.html',
  styleUrl: './formation-creation.component.scss'
})
export class FormationCreationComponent {
  public baseUrl = API_BASE_URL
  public formationName: string = ''
  public formations: Hero[][][] = [[[],[],[],[],[]]]

  constructor(
    private _heroService: HeroService,
    public dialog: MatDialog,
    private _formationService: FormationsService,
  ) {}  

  openHeroSelectionDialog(f: number, p: number): void {
    console.log('openHeroSelectionDialog');
    const dialogRef = this.dialog.open(HeroAddToPartitionDialog, {
      height: '800px',
      width: '920px',
    });
    dialogRef.afterClosed().subscribe(result => {
      if (!this.formations[f][p].some(existingResult => existingResult === result)) {
        this.formations[f][p].push(result);
      }
    });
  }

  addNewFormation(): void {
    this.formations.push([[],[],[],[],[]])
  }

  drop(event: CdkDragDrop<string[]>, f: number, p: number) {
    moveItemInArray(this.formations[f][p], event.previousIndex, event.currentIndex);
  }

  createFormation(): void {
    this._formationService.createFormation(this.formations, this.formationName).subscribe(
      (response) => {
        console.log(response);
      }
    );
  }
}
