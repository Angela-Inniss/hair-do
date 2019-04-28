class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

# edit function calls the update function which is false
# in the hairstyle policy (see policy) we ask if the hairstyle user
# is the current user (logged in user
  def edit?
    update?
  end

  def destroy?
    false
  end

  def upvote?
    false
  end

   def downvote?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
