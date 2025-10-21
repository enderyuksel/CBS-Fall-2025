import { Routes } from '@angular/router';
import { StudentList } from './student-list/student-list';
import { TeacherList } from './teacher-list/teacher-list';

export const routes: Routes = [
    { path: 'students', component: StudentList },
    { path: 'teachers', component: TeacherList },
];
