import { Student } from '../model/student';
import { StudentService } from '../services/student-service';
import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-student-card',
  imports: [],
  templateUrl: './student-card.html',
  styleUrl: './student-card.css'
})
export class StudentCard {
  constructor(private studentService: StudentService) { }
  @Input() student!: Student;
  deleteStudent(): void {
    this.studentService.deleteStudent(this.student.id).subscribe();
  }
}
