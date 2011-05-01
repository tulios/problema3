class Todo
  include MongoMapper::EmbeddedDocument
       
  key :description, String
  key :finished, Boolean, :default => false
  
end