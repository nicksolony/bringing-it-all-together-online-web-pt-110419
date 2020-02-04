class Dog
  
  attr_accessor :id,:name, :breed
  
  def initialize (id:nil,name:,breed:)
    @id = nil
    @name = name
    @breed = breed
  end
  
  def self.create_table
    sql = "CREATE TABLE dogs IF NOT EXISTS IN dogs;"
    DB[:conn].execute (sql)
  
end