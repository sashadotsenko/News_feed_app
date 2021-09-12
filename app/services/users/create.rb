module Users
  class Create
    def initialize(users_params)
      @users_params = users_params
    end

    def call
      User.create(@users_params)
    end
  end
end
