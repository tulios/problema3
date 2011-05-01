class User
  include MongoMapper::Document
       
  key :name, String
  key :nickname, String
  key :created_at, Time
  key :last_login, Time
  
  many :authentications
  many :lists
end