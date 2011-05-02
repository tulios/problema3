class Todo
  include MongoMapper::EmbeddedDocument
       
  key :description, String
  key :finished, Boolean, :default => false
  
  validates_presence_of :description
  
end