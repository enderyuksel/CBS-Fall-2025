import { Component, Input } from '@angular/core';
import { Teacher } from '../model/teacher';

@Component({
  selector: 'app-teacher-card',
  imports: [],
  templateUrl: './teacher-card.html',
  styleUrl: './teacher-card.css'
})
export class TeacherCard {
  @Input() teacher!: Teacher;
}
