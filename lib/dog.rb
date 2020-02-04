require 'pry'
class Dog
  
  attr_accessor :id,:name, :breed
  
  def initialize (id:nil,name:,breed:)
    @id = nil
    @name = name
    @breed = breed
  end
  
  def self.create_table
    sql = <<-SQL 
           CREATE TABLE IF NOT EXISTS dogs (
            id INTEGER PRIMARY KEY,
            name TEXT,
            breed TEXT
            );
            SQL
    DB[:conn].execute (sql)
  end
  
  def self.drop_table
    sql = "DROP TABLE dogs;"
    DB[:conn].execute (sql)
  
  end
  
  def save
     sql = <<-SQL
            INSERT INTO dogs (name, breed)
            VALUES(?,?);
            SQL
      DB[:conn].execute(sql,self.name,self.breed) 
      #binding.pry
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs;")[0][0] 
      self
  end
  
  def self.create(name:,breed:)
    dog = self.new
    dog.save
  end
end