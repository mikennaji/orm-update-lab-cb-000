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
        CREATE TABLE students(
          NAME TEXT
          GRADE INTEGER
          ID PRIMARY KEY INTEGER
        )
        SQL
  db[:conn].execute(sql)


  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end
