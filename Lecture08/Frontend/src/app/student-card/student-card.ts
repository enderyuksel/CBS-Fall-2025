import { Student } from '../model/student';
import { StudentService } from '../services/student-service';
import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-student-card',
  imports: [],
  templateUrl: './student-card.html',
  styleUrl: './student-card.css'
})
export class StudentCard {
  constructor(private studentService: StudentService, private router: Router) { }
  @Input() student!: Student;
  editStudent(id: number) {
    this.router.navigate(["edit-student", id]);
  }
  deleteStudent(): void {
    this.studentService.deleteStudent(this.student.id).subscribe();
  }
}
