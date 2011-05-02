class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      
      can [:create, :update, :destroy], [List, Todo]
      
    end
  end
end