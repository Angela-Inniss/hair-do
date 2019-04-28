class HairstylePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope means @hairstyles in this instance
      scope.all
    end
  end

  def new?
    return true # this means anyone can create a new hairstyle on the form
  end

  def create?
    return true # this means anyone can create a new hairstyle i.e click submit
  end

  def show?
    return true
  end

  # if the user of the hairstyle record is the current user...
  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end

  def upvote?
    return true # this should mean that anyone can upvote?
  end

  def downvote?
    return true # this should mean that anyone can upvote?
  end
end
