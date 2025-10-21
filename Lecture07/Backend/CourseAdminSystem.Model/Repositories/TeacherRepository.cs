using System;
using CourseAdminSystem.Model.Entities;
using Microsoft.Extensions.Configuration;
using Npgsql;
using NpgsqlTypes;
namespace CourseAdminSystem.Model.Repositories;
public class TeacherRepository : BaseRepository
{
public TeacherRepository(IConfiguration configuration) : base(configuration) { }
public Teacher GetTeacherById(int id)
{
NpgsqlConnection dbConn = null;
try
{
//create a new connection for database
dbConn = new NpgsqlConnection(ConnectionString);
//creating an SQL command
var cmd = dbConn.CreateCommand();
cmd.CommandText = "select * from teacher where id = @id";
cmd.Parameters.Add("@id", NpgsqlDbType.Integer).Value = id;
//call the base method to get data
var data = GetData(dbConn, cmd);
if (data != null)
{
if (data.Read()) //every time loop runs it reads next like from fetched rows
{
return new Teacher(Convert.ToInt32(data["id"]))
{
FirstName = data["firstname"].ToString(),
LastName = data["lastname"].ToString(),
Degree = data["degree"].ToString(),
Department = data["department"].ToString(),
Specialization = data["specialization"].ToString()
};
}
}
return null;
}
finally
{
dbConn?.Close();
}
}
public List<Teacher> GetTeachers()
{
NpgsqlConnection dbConn = null;
var teachers = new List<Teacher>();
try
{
//create a new connection for database
dbConn = new NpgsqlConnection(ConnectionString);
//creating an SQL command
var cmd = dbConn.CreateCommand();
cmd.CommandText = "select * from teacher";
//call the base method to get data
var data = GetData(dbConn, cmd);
if (data != null)
{
while (data.Read()) //every time loop runs it reads next like from fetched rows
{
Teacher s = new Teacher(Convert.ToInt32(data["id"]))
{
FirstName = data["firstname"].ToString(),
LastName = data["lastname"].ToString(),
Degree = data["degree"].ToString(),
Department = data["department"].ToString(),
Specialization = data["specialization"].ToString()
};
teachers.Add(s);
}
}
return teachers;
}
finally
{
dbConn?.Close();
}
}
//add a new teacher
public bool InsertTeacher(Teacher s)
{
NpgsqlConnection dbConn = null;
try
{
dbConn = new NpgsqlConnection(ConnectionString);
var cmd = dbConn.CreateCommand();
cmd.CommandText = @"
insert into teacher
(firstname,lastname, degree, department, specialization)
values
(@firstname,@lastname, @degree, @department, @specialization)
";
//adding parameters in a better way
cmd.Parameters.AddWithValue("@firstname", NpgsqlDbType.Text, s.FirstName);
cmd.Parameters.AddWithValue("@lastname", NpgsqlDbType.Text, s.LastName);
cmd.Parameters.AddWithValue("@degree", NpgsqlDbType.Text, s.Degree);
cmd.Parameters.AddWithValue("@department", NpgsqlDbType.Text, s.Department);
cmd.Parameters.AddWithValue("@specialization", NpgsqlDbType.Text, s.Specialization);
//will return true if all goes well
bool result = InsertData(dbConn, cmd);
return result;
}
finally
{
dbConn?.Close();
}
}
public bool UpdateTeacher(Teacher s)
{
var dbConn = new NpgsqlConnection(ConnectionString);
var cmd = dbConn.CreateCommand();
cmd.CommandText = @"
update teacher set
firstname=@firstname,
lastname=@lastname,
degree=@degree,
department=@department,
specialization=@specialization
where
id = @id";
cmd.Parameters.AddWithValue("@firstname", NpgsqlDbType.Text, s.FirstName);
cmd.Parameters.AddWithValue("@lastname", NpgsqlDbType.Text, s.LastName);
cmd.Parameters.AddWithValue("@degree", NpgsqlDbType.Text, s.Degree);
cmd.Parameters.AddWithValue("@department", NpgsqlDbType.Text, s.Department);
cmd.Parameters.AddWithValue("@specialization", NpgsqlDbType.Text, s.Specialization);
cmd.Parameters.AddWithValue("@id", NpgsqlDbType.Integer, s.Id);
bool result = UpdateData(dbConn, cmd);
return result;
}
public bool DeleteTeacher(int id)
{
var dbConn = new NpgsqlConnection(ConnectionString);
var cmd = dbConn.CreateCommand();
cmd.CommandText = @"
delete from teacher
where id = @id
";
//adding parameters in a better way
cmd.Parameters.AddWithValue("@id", NpgsqlDbType.Integer, id);
//will return true if all goes well
bool result = DeleteData(dbConn, cmd);
return result;
}
}

