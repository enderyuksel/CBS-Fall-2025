import { Routes } from '@angular/router';
import { StudentList } from './student-list/student-list';
import { TeacherList } from './teacher-list/teacher-list';
import { EditStudent } from './edit-student/edit-student';
import { EditTeacher } from './edit-teacher/edit-teacher';

export const routes: Routes = [
    { path: 'students', component: StudentList },
    { path: 'edit-student/:id', component: EditStudent },
    { path: 'teachers', component: TeacherList },
    { path: 'edit-teacher/:id', component: EditTeacher },
];
