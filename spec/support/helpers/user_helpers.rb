module Models
  module UserHelpers

    def check_role(user, user_role)
      User.roles.each do |role, val|
        if role == user_role
          return false unless user.send("#{role}?")
        else
          return false if user.send("#{role}?")
        end
      end
      true
    end

  end
end