module Users
  class Destroy
    def initialize(user)
      @user = user
    end

    def call
      @user.destroy
    end
  end
end
