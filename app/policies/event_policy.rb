class EventPolicy < ApplicationPolicy
  #class Scope < Struct.new(:user, :scope)
  #  def resolve
  #    scope
  #  end
  #end
  def new?
    true
  end

  def create?
    true
  end

  def edit?
    if @user == @record.user
  	  true
    else
  	  false
    end
  end

end
