class UsersController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :"users/new"
    else
      redirect "/runs"
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save && !params[:username].empty?
      @user.save
      session[:user_id] = @user.id
      redirect '/runs'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect "/runs"
    else 
      erb :"/users/login"
    end
  end
  
  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/runs'
    else
      redirect '/signup'
    end
  end

  get "/logout" do
    session.clear
    redirect "/login"
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @runs =  @user.runs
    erb :'/users/show'
  end
end
