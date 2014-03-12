class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 # validate :password_length
#
 # def password_length
 # 	if password.length != 10
 # 		errors.add(:password, "password erroneo")
 # 	end
 # end

end
