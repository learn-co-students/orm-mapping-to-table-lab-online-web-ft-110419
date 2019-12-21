class Student
# Remember, you can access your database connection anywhere in this class
#  with DB[:conn]
  attr_accessor :name,:grade
  attr_reader:id 
  def initialize(name,grade,id = nil)
     @name = name 
     @grade = grade
     @id = nil 
  end
  
  def self.create_table
     sql = <<- SQL CREATE TABLE students(
       id INTEGER PRIMARY KEY,
       name TEXT,
       grade INTEGER
      )
      SQL
        DB[:conn].execute(sql)
   end
   
   def self.drop_table
       sql = DROP TABLE students
       DB[:conn].execute(sql)
   end
   
   def save
      sql = <<- SQL INSERT INTO students (name,album) VALUES ("?","?")
      SQL
      DB[:conn].execute(sql,sql.name,sql.album)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
   end
   
    def self.create(name, album)
        song = Song.new(name, album)
       song.save
       song
  end
end
