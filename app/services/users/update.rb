module Users
  class Update
    def initialize(user, user_params)
      @user = user
      @user_params = user_params
    end

    def call
      @user.update(@user_params)
    end
  end
end
