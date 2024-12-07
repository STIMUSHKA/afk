import { Component, OnInit, inject } from '@angular/core';
import { FormationCreationComponent } from '../formation-creation/formation-creation.component';
import { FormationsService } from '../services/formations.service';
import { API_BASE_URL } from '../shared/constants';
import { CommonModule } from '@angular/common';
import { HeroService } from '../services/heroes.service';
import { CdkDropListGroup } from '@angular/cdk/drag-drop';
import {
  MatSnackBar,
  MatSnackBarAction,
  MatSnackBarActions,
  MatSnackBarLabel,
  MatSnackBarRef,
} from '@angular/material/snack-bar';
@Component({
  selector: 'app-my-formation',
  imports: [FormationCreationComponent, CommonModule],
  templateUrl: './my-formations.component.html',
  styleUrl: './my-formations.component.scss'
})
export class MyFormationComponent implements OnInit {
  public myFormations: any[] = [];
  public baseUrl = API_BASE_URL
  private _snackBar = inject(MatSnackBar);

  durationInSeconds = 5;

  constructor(
    private _formationsService: FormationsService,
    private _heroService: HeroService 
  ) {
  }

  ngOnInit(): void {
    this._formationsService.getMyFormations().subscribe(formations => {
      this._heroService.getHeroes().subscribe(heroesList => {
        this.myFormations = formations;
  
        this.myFormations.forEach((mFormation: any) => {
          mFormation.formation.forEach((formation: any) => {
            formation.forEach((place: any, placeIndex: number) => {
              place.forEach((heroId: any, heroIndex: number) => {
                // Обновляем конкретный элемент массива по индексу
                place[heroIndex] = heroesList.getHeroByDocId(heroId);
              });
            });
          });
        });
  
        console.log(this.myFormations);
      });
    });
  }


  openSnackBar() {
    this._snackBar.openFromComponent(PizzaPartyAnnotatedComponent, {
      duration: this.durationInSeconds * 1000,
    });
  }

  deleteFormation(formation: any): void {
    this._formationsService.deleteFormation(formation.documentId).subscribe({
      next: (response) => {
        // Удаляем элемент из массива по индексу
        const index = this.myFormations.findIndex(f => f.documentId === formation.documentId);
        if (index !== -1) {
          this.myFormations.splice(index, 1);
        }
        console.log('Formation deleted:', response);
        this.openSnackBar()
      },
      error: (err) => {
        console.error('Error deleting formation:', err);
      }
    });
  }
  
  
  
  
}
@Component({
  selector: 'snack-bar-annotated-component-example-snack',
  template: '<div class="popup">Successfully deleted</div>',
  styles: `
    :host {
      display: flex;
    }

  `,
  imports: [MatSnackBarLabel, MatSnackBarActions, MatSnackBarAction],
})
export class PizzaPartyAnnotatedComponent {
  snackBarRef = inject(MatSnackBarRef);
}
