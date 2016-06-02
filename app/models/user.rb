class User < ActiveRecord::Base
  mount_uploader :pictureid, PictureidUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable,:recoverable, :rememberable, :trackable, :validatable
  has_many :reviews
  has_many :orders
  has_many :products, through: :orders


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # has_secure_password interfers with devise authentication. has_secure_password is for homemade authentication solutions.
  # has_secure_password



  canadian_postal_code = /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/
  # valid_email = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true
  validates :postal_code, presence: true ,format: {with: canadian_postal_code}
  # validates :email, presence: true, format: {with: valid_email,
                                             # message: "Invalid email address" }
  # validates :password_digest, presence: true



end
