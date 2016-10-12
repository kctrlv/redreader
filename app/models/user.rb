class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.screen_name        = auth_info.extra.raw_info.name
      new_user.link_karma         = auth_info.extra.raw_info.link_karma
      new_user.comment_karma      = auth_info.extra.raw_info.comment_karma

      new_user.token              = auth_info.credentials.token
      new_user.created_at         = auth_info.extra.raw_info.created_utc
    end
    user.update_token(auth_info.credentials.token)
    return user
  end

  def update_token(new_token)
    self.token = new_token
    self.save
  end
end
