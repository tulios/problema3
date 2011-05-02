class List
  include MongoMapper::Document
  
  before_save :generates_friendly_id

  key :name, String, :required => true
  key :friendly_id, String
  
  belongs_to :user
  timestamps!
  
  many :todos
  
  validates_uniqueness_of :name, :scope => :user_id
  validates_associated :todos
  
  def to_param
    friendly_id
  end
  
  private
  def generates_friendly_id
    @friendly_id = @name.to_url
  end
  
end