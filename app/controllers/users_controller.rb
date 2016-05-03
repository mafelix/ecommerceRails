class UsersController<ApplicationController
  canadian_postal_code = /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/
  valid_email = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :firstname, presence: true
  validates :lastname, presence: true
  # validates :address, presence: true, 
  # validates :postal_code, presence: true, format: { with: canadian_postal_code }
  validates :email, presence: true, format: {with: valid_email }
  validates :password_digest, presence: true
  helper_method :create


  def create
    @user = User.create(user_params)
  end

  






protected

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :address)
end

end