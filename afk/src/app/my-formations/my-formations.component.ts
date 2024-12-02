import { Component, OnInit } from '@angular/core';
import { FormationCreationComponent } from '../formation-creation/formation-creation.component';
import { FormationsService } from '../services/formations.service';
import { API_BASE_URL } from '../shared/constants';
import { CommonModule } from '@angular/common';
import { HeroService } from '../services/heroes.service';

@Component({
  selector: 'app-my-formation',
  imports: [FormationCreationComponent, CommonModule],
  templateUrl: './my-formations.component.html',
  styleUrl: './my-formations.component.scss'
})
export class MyFormationComponent implements OnInit {
  public myFormations: any[] = [];
  public baseUrl = API_BASE_URL

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
  
  
}
