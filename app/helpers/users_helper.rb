module UsersHelper
    def self.user_name(id)
        User.by_id(id).name
    end
end