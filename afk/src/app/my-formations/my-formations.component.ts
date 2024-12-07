import { Component, OnInit, inject } from '@angular/core';
import { FormationCreationComponent } from '../formation-creation/formation-creation.component';
import { FormationsService } from '../services/formations.service';
import { API_BASE_URL } from '../shared/constants';
import { CommonModule } from '@angular/common';
import { HeroService } from '../services/heroes.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SnackBarComponent } from '../snack-bar/snack-bar.component';
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


  openSnackBar(message: string, customClass: string): void {
    this._snackBar.openFromComponent(SnackBarComponent, {
      duration: this.durationInSeconds * 1000,
      data: { message },
      panelClass: customClass,
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
        this.openSnackBar("Successfully deleted", "success-snack");
      },
      error: (err) => {
        console.error('Error deleting formation:', err);
      }
    });
  }
}