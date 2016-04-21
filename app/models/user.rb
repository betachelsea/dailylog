class User < ActiveRecord::Base
  devise :registerable, :rememberable, :trackable,
    :omniauthable, omniauth_providers: [:twitter]

  has_one :identity

end
