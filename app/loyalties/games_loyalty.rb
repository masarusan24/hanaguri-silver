class GamesLoyalty < ApplicationLoyalty
  def create?
    !user.nil?
  end

  def update?
    !user.nil?
  end

  def destroy?
    !user.nil?
  end
end
