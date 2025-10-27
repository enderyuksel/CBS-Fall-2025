import { StudentCard } from "../student-card/student-card";
import { Student } from '../model/student';
import { StudentService } from '../services/student-service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-student-list',
  imports: [StudentCard],
  templateUrl: './student-list.html',
  styleUrl: './student-list.css'
})
export class StudentList {
  constructor(private studentService: StudentService) { }
  students: Student[] = [];
  ngOnInit(): void {
    this.studentService.getStudents().subscribe(
      students => {
        console.log('API response', students);
      this.students = students;
    },
    error => {
      console.error('API error fetching students', error);
    }
    );
  }
}
