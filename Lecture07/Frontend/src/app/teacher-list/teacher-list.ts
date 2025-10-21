import { Component, OnInit } from '@angular/core';
import { Teacher } from '../model/teacher';
import { TeacherCard } from '../teacher-card/teacher-card'; 
import { TeacherService } from '../services/teacher-service';

@Component({
  selector: 'app-teacher-list',
  imports: [TeacherCard],
  templateUrl: './teacher-list.html',
  styleUrl: './teacher-list.css'
})
export class TeacherList implements OnInit {
  constructor(private teacherService: TeacherService) {}
  teachers: Teacher[] = [];
  ngOnInit(): void {
    this.teacherService.getTeachers().subscribe(
      teachers => {
        console.log('API response', teachers);
      this.teachers = teachers;
    },
    error => {
      console.error('API error fetching teachers', error);
    }
    );
  }
}
