import { Component, Input, OnInit } from '@angular/core';
import { Teacher } from '../model/teacher';
import { TeacherService } from '../services/teacher-service';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-edit-teacher',
  imports: [FormsModule],
  templateUrl: './edit-teacher.html',
  styleUrl: './edit-teacher.css'
})
export class EditTeacher {
  @Input() id!: number;
  teacher!: Teacher;
  constructor(private teacherService: TeacherService, private router: Router) {
  }
  ngOnInit() {
    this.teacherService.getTeacher(this.id).subscribe(teacher => this.teacher = teacher);
  }
  updateTeacher() {
    this.teacherService.updateTeacher(this.teacher!).subscribe(() => {
      this.router.navigate(["teacher"]);
    });
  }

}
