class Authentication
  include MongoMapper::EmbeddedDocument
       
  key :provider, String
  key :uid, String
  key :image, String
  key :oauth_token, String
  key :oauth_token_secret, String
  
end