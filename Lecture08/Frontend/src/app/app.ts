import { StudentList } from './student-list/student-list';
import { StudentCard } from './student-card/student-card';
import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { RouterLink } from '@angular/router';
import { TeacherCard } from './teacher-card/teacher-card';
import { TeacherList } from './teacher-list/teacher-list';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, RouterLink, StudentCard, StudentList, TeacherCard, TeacherList],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('CourseAdminSystemAngular');
}
