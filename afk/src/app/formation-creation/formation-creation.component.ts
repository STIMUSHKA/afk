import { Component, OnInit } from '@angular/core';
import {CdkDragDrop, CdkDrag, CdkDropList, moveItemInArray} from '@angular/cdk/drag-drop';
import { HeroService } from '../services/heroes.service';
import { Hero, HeroList } from '../models/hero.model';
import { API_BASE_URL } from '../shared/constants';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { HeroAddToPartitionDialog } from './hero-add-to-partition-dialog/hero-add-to-partition-dialog.component';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-formation-creation',
  imports: [CdkDropList, CdkDrag, MatDialogModule, CommonModule],
  templateUrl: './formation-creation.component.html',
  styleUrl: './formation-creation.component.scss'
})
export class FormationCreationComponent implements OnInit {
  public baseUrl = API_BASE_URL

  private heroesList: HeroList = new HeroList([]);
  public formation: Hero[][] = [[],[],[],[],[]]

  constructor(
    private heroService: HeroService,
    public dialog: MatDialog,
  ) {}  
  ngOnInit(): void {
    this.heroService.getHeroes().subscribe(heroesList => {
      this.heroesList = heroesList;
      // this.heroes = this.heroesList.getHeroes().slice(1,10);
    });
  }

  openHeroSelectionDialog(i: number): void {
    console.log(i)
    console.log('openHeroSelectionDialog');
    const dialogRef = this.dialog.open(HeroAddToPartitionDialog, {
      height: '800px',
      width: '920px',
    });
    dialogRef.afterClosed().subscribe(result => {
      if (!this.formation[i].some(existingResult => existingResult === result)) {
        this.formation[i].push(result);
      }
    });
  }


  drop(event: CdkDragDrop<string[]>, i: number) {
    moveItemInArray(this.formation[i], event.previousIndex, event.currentIndex);
  }
}
