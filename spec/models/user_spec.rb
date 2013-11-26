require 'spec_helper'

describe User do
  describe	"Validacion de Usuario - " do

  	before :each do
  		@user = FactoryGirl.build(:user)
	end

  	it "Es valido cuando tiene Firsname, first_name, Password, PasswordConfirmation" do
  		expect(@user).to be_valid
  	end

  	it "Es invalido cuando Falta FirsName" do
  		@user.first_name = nil
  		expect(@user).to have(1).errors_on(:first_name)
  	end

  	it "Es invalido cuando Falta last_name" do
  		@user.last_name = nil
  		expect(@user).to have(1).errors_on(:last_name)
  	end

  	it "Es invalido cuando Falta email" do
  		# Aparte de esta vacio el mail no tiene el formato correcto
  		@user.email = nil
  		expect(@user).to have(2).errors_on(:email)
  	end

  	it "Es invalido cuando esta reperido el email" do
  		u = User.create( first_name: "Barack", last_name: "Obama", password: "12345678", password_confirmation: "12345678", email: "correo@dominio.com")
  		@user.email = u.email
  		expect(@user).to have(1).errors_on(:email)
  	end

  	it "Es invalido cuando el email no tiene el formato correcto" do
  		emails = %w{
			   emailexamplecom
			   emailexample.com
			   email@examplecom
			 }

		emails.each do|e|	 
			@user.email = e
			expect(@user).to have(1).errors_on(:email)	
		end
  	end

  	it "Es invalido cuando password no tiene mas de 8 caracteres" do
  		@user.password = "123"
  		expect(@user).to have(1).errors_on(:password)
  	end
  	
  	it "Es invalido cuando el fullName no es igual a firstname join first_name" do
  		expect(@user.fullName).to eql([@user.first_name, @user.last_name].join(" ") )
  	end
  	
  	it "Es valido cuando el password es igual al password_confirmation" do
  		expect(@user.password).to eql(@user.password_confirmation)
  	end

  end

end
