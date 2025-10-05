import { Component } from '@angular/core';
import { Teacher } from '../model/teacher';
import { TeacherCard } from '../teacher-card/teacher-card'; 

@Component({
  selector: 'app-teacher-list',
  imports: [TeacherCard],
  templateUrl: './teacher-list.html',
  styleUrl: './teacher-list.css'
})
export class TeacherList {
  teachers: Teacher[] = [
    {
      id: 1,
      firstName: 'Amalie',
      lastName: 'Bruun',
      degree: 'PhD',
    department: 'Metal Science'
    },
    {
      id: 2,
      firstName: 'Simone',
      lastName: 'Simons',
      degree: 'MSc.',
      department: 'Epic Sciences'
    },
    {
      id: 3,
      firstName: 'Charlotte',
      lastName: 'Wessel',
      degree: 'PhD',
      department: 'Digitalization'
    }
  ];
}
