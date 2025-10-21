import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Student } from '../model/student';

@Injectable({
  providedIn: 'root'
})
export class StudentService {
  baseUrl = 'http://localhost:5050/api';
  constructor(private http: HttpClient) {  }
  getStudents(): Observable<Student[]>  {
    return this.http.get<Student[]>(`${this.baseUrl}/student`);
  }
  getStudent(id: number): Observable<Student> { 
    return this.http.get<Student>(`${this.baseUrl}/student/${id}`);
  }
  createStudent(student: Student): Observable<any> {
    return this.http.post(`${this.baseUrl}/student`, student);
  }
  deleteStudent(id: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/student/${id}`);
  }
}
