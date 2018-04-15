class TeamsLoyalty < ApplicationLoyalty
  def new?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
