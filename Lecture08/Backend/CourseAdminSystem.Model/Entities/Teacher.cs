namespace CourseAdminSystem.Model.Entities;

public class Teacher
{
    public Teacher(int id) { Id = id; }
    public int Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Degree { get; set; }
    public string Department { get; set; }
    public string Specialization { get; set; }
}
