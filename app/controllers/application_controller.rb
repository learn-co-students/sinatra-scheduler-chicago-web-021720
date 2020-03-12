class ApplicationController < Sinatra::Base
  set :views, 'app/views'

  get '/' do
    erb :'index.html'
  end

  get '/courses' do
    @courses = Course.all 
    erb :'courses/index'
  end

  get '/courses/:id/edit' do 
    find_course
    erb :'courses/edit'
  end 
  
  get '/courses/:id' do
    find_course
    erb :'courses/show'
  end 
  
  patch '/courses/:id' do
    find_course
    p params
    @course.update(name: params[:name], professor: params[:professor], credits: params[:credits].to_i)
    redirect "/courses/#{@course.id}"
  end

  get '/schedule' do
    @courses = Course.all 
    total_credits
    erb :'schedule/index'
  end 

  get '/schedule/:id' do
    @courses = Course.all
    find_course
    erb :'schedule/edit'
  end 

  post '/schedule/:id' do
    find_course
    @credits = Course.current_credits

    if @course.schedule
       @course.update(schedule: false)
    elsif total_credits < 16
      @course.update(schedule: true)      
    end 
      
    redirect "/schedule"
  end

  def find_course
    @course = Course.find(params[:id])
  end 

  def total_credits
    @credits = Course.current_credits
  end 


end
