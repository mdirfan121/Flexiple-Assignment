class UsersController < ApplicationController
    
    
    def profile
        @user = User.find(params[:id])
        render('home/profile_view')
    end

    def sign_up
        render('home/sign_up')
    end

    def signup
        user = User.find_by(email: params[:registeration][:email])
        if user
            flash.now[:danger] = 'Email already registered'
            render('home/sign_up')
        else
            @name = params[:registeration][:name]
            @email = params[:registeration][:email]
            @password = params[:registeration][:password]
            user = User.create(name: @name, email: @email, password: @password)
            Profile.create(user: user)
            redirect_to(login_path)
        end
    end
end
