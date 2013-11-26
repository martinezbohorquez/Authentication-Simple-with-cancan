class User < ActiveRecord::Base
  attr_accessor :role_ids , :password ,:password_confirmation 
  
  has_many :assignments
  has_many :roles, :through => :assignments


  before_save :assign_roles
  before_save :encrypt_password

  validates :first_name, :last_name, :email, :password, presence: true
  validates :password, :length   => { :minimum => 8, :allow_nil => true }, :confirmation => true
  validates :email, uniqueness: true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } 


  def fullName
  	[first_name , last_name].join(" ")
  end

  def self.authenticate(email, password)
    user = where("email = ?", [email])
    if user.present? && user[0].password_hash == BCrypt::Engine.hash_secret(password, user[0].password_salt)
      user[0]
    else
      nil
    end
  end

  private
    def assign_roles

      self.assignments.all.each do|rid|
        rid.destroy
      end

      if !self.role_ids.nil?
        self.role_ids.each do|rid|
          self.assignments.build(role_id: rid )
        end
    end

    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end
   end

end

