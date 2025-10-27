import { Component, Input, OnInit } from '@angular/core';
import { StudentService } from '../services/student-service';
import { Student } from '../model/student';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-edit-student',
  imports: [FormsModule],
  templateUrl: './edit-student.html',
  styleUrl: './edit-student.css'
})
export class EditStudent {
  @Input() id!: number;
  student!: Student;
  constructor(private studentService: StudentService, private router: Router) {

  }
  ngOnInit() {
    this.studentService.getStudent(this.id).subscribe(student => this.student = student);
  }
  updateStudent() {
    this.studentService.updateStudent(this.student!).subscribe(() => {
      this.router.navigate(["/students"]);
    });
  }
}
