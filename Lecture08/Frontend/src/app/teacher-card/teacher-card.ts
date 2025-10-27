import { Component, Input } from '@angular/core';
import { Teacher } from '../model/teacher';
import { TeacherService } from '../services/teacher-service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-teacher-card',
  imports: [],
  templateUrl: './teacher-card.html',
  styleUrl: './teacher-card.css'
})
export class TeacherCard {
  constructor(private TeacherService: TeacherService, private router: Router) { }
  @Input() teacher!: Teacher;
  editTeacher(id: number) {
    this.router.navigate(["edit-teacher", id]);
  }
  deleteTeacher(): void {
    this.TeacherService.deleteTeacher(this.teacher.id).subscribe();
  }
}
