class List
  include MongoMapper::Document
  
  before_save :generates_friendly_id

  key :name, String
  key :friendly_id, String
  
  belongs_to :user
  timestamps!
  
  many :todos
  
  def to_param
    friendly_id
  end
  
  private
  def generates_friendly_id
    @friendly_id = @name.to_url
  end
  
end