using CourseAdminSystem.Model.Entities;
using CourseAdminSystem.Model.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CourseAdminSystem.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TeacherController : ControllerBase
    {
        protected TeacherRepository Repository { get; }
        public TeacherController(TeacherRepository repository)
        {
            Repository = repository;
        }

        [HttpGet("{id}")]
        public ActionResult<Teacher> GetTeacher([FromRoute] int id)
        {
            Teacher teacher = Repository.GetTeacherById(id);
            if (teacher == null)
            {
                return NotFound();
            }
            return Ok(teacher);
        }

        [HttpGet]
        public ActionResult<IEnumerable<Teacher>> GetTeachers()
        {
            return Ok(Repository.GetTeachers());
        }

        [HttpPost]
        public ActionResult Post([FromBody] Teacher teacher)
        {
            if (teacher == null)
            {
                return BadRequest("Teacher info not correct");
            }
            bool status = Repository.InsertTeacher(teacher);
            if (status)
            {
                return Ok();
            }
            return BadRequest();
        }

        [HttpPut]

        public ActionResult UpdateTeacher([FromBody] Teacher teacher)
        {
            if (teacher == null)
            {
                return BadRequest("Teacher info not correct");
            }
            Teacher existingTeacher = Repository.GetTeacherById(teacher.Id);
            if (existingTeacher == null)
            {
                return NotFound($"Teacher with id {teacher.Id} not found");
            }
            bool status = Repository.UpdateTeacher(teacher);
            if (status)
            {
                return Ok();
            }
            return BadRequest("Something went wrong");
        }
        [HttpDelete("{id}")]
        public ActionResult DeleteTeacher([FromRoute] int id)
        {
            Teacher existingTeacher = Repository.GetTeacherById(id);
            if (existingTeacher == null)
            {
                return NotFound($"Teacher with id {id} not found");
            }
            bool status = Repository.DeleteTeacher(id);
            if (status)
            {
                return NoContent();
            }
            return BadRequest($"Unable to delete teacher with id {id}");
        }
    }
}

