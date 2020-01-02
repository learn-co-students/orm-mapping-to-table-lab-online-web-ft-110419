class Student

  attr_accessor :name, :grade
  attr_reader :id 


def initialize (id = nil, name, grade)
  @id = id 
  @name = name
  @grade = grade
end 


def self.create_table 
  sql = <<-SQL 
    Create table if not exists students (
      id integer primary key,
      name text, 
      grade text
    )
  SQL
  DB[:conn].execute(sql)
end 


def self.drop_table 
  sql = <<-SQL
    Drop table students 
SQL
DB[:conn].execute(sql)
end 


def save
  sql = <<-SQL 
  Insert into students (name, grade)
  values (?,?)
  SQL
  DB[:conn].execute(sql, self.name, self.grade)
  @id = DB[:conn].execute("Select last_insert_rowid() From students")[0][0]
end 


def self.create(name:, grade:)
  student = Student.new(name,grade)
  student.save 
  student
end 



end 







