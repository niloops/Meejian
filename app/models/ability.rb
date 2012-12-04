class Ability
  include CanCan::Ability

  def initialize(user)
    if user.blank?
      can :new, Interview
      basic_read_only
    elsif user.admin?
      can :manage, :all
    else
      can :create, Product
      can [:update, :destroy], Product do |product|
        product.creator == user
      end
      can [:update, :destroy], Interview do |interview|
        interview.author == user
      end
      can :create, Interview
      can :like, Interview
      can :share, Interview
      can :create, Comment
      can :destroy, Comment do |comment|
        comment.author == user
      end
      basic_read_only
    end
  end

  private

  def basic_read_only
    can :read,    Topic
    can :read,    Product
    can :read,    Interview
  end

end
