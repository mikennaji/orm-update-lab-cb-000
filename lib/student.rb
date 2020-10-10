require_relative "../config/environment.rb"

class Student

attr_accessor :name,:grade
attr_reader :id

def initialize(name,grade,id=nil)
  @name= name
  @grade = grade

end


def  self.create_table
  sql = <<-SQL
        CREATE TABLE IF NOT EXISTS students (
          id  INTEGER PRIMARY KEY,
          name TEXT,
          grade INTEGER
        )
        SQL
  DB[:conn].execute(sql)


  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end

def self.drop_table
  sql = <<-SQL
        DROP TABLE IF EXISTS students
      SQL
  DB[:conn].execute(sql)

end

def save
  if self.id
    self.update
  else
  sql = <<-SQL
        INSERT INTO students(age,grade) VALUES (?,?)
        SQL
  DB[:conn].execute(sql,self.age,self.grade)
  @id = DB[:conn].execute("SELECT last_insert_rowid();")[0][0]
end
end


def self.create (name,age)
  student = Student.new(name,age)
  student.save

end

end
