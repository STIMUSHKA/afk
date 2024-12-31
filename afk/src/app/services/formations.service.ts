import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { API_BASE_URL } from '../shared/constants';
import { AuthService } from './auth.service';
import { Hero } from '../models/hero.model';

@Injectable({
  providedIn: 'root'
})
export class FormationsService {
  private url = API_BASE_URL
  private formatiopnApis = `${this.url}/api/formation-jsons`;
  private formatiopnApi = `${this.url}/api/formation-json`;

  constructor(
    private http: HttpClient,
    private _authService: AuthService
  ) { }

  getMyFormations() {
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}` // Добавляем токен в заголовок
    });

    return this.http.get<any>(this.formatiopnApi + '/my-formations', { headers });
  }

  createFormation(formation: Hero[][][], name: string) {
    const token = this._authService.getToken()

    const transformedFormations = this.transformFormations(formation);

    const data = {
      name: name,
      formation: transformedFormations
    }
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}` // Добавляем токен в заголовок
    });

    return this.http.post(this.formatiopnApis, { data }, { headers });
 }

  public transformFormations(formations: Hero[][][]): string[][][] {
   return formations.map(level1 => 
     level1.map(level2 => 
       level2.map(hero => hero.documentId) // Заменяем объекты на их documentId
     )
   );
  }

  deleteFormation(id: number) {
    const token = this._authService.getToken()

    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}` // Добавляем токен в заголовок
    });

    return this.http.delete<any>(this.formatiopnApis + '/' + id, { headers });
  }
}
