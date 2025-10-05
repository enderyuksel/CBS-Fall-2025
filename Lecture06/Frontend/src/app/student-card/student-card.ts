import { Student } from '../model/student';
import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-student-card',
  imports: [],
  templateUrl: './student-card.html',
  styleUrl: './student-card.css'
})
export class StudentCard {
  @Input() student!: Student;
}
