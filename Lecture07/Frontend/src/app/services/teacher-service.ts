import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Teacher } from '../model/teacher';

@Injectable({
  providedIn: 'root'
})
export class TeacherService {
    baseUrl = 'http://localhost:5050/api';
    constructor(private http: HttpClient) {  }
    getTeachers(): Observable<Teacher[]>  {
      return this.http.get<Teacher[]>(`${this.baseUrl}/teacher`);
    }
    getTeacher(id: number): Observable<Teacher> { 
      return this.http.get<Teacher>(`${this.baseUrl}/teacher/${id}`);
    }
    createTeacher(teacher: Teacher): Observable<any> {
      return this.http.post(`${this.baseUrl}/teacher`, teacher);
    }
    deleteTeacher(id: number): Observable<any> {
      return this.http.delete(`${this.baseUrl}/teacher/${id}`);
    }
}
