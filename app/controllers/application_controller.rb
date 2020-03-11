class ApplicationController < Sinatra::Base
  set :views, 'app/views'

  get '/' do
    erb :'index.html'
  end
  
  get '/courses' do
    @courses = Course.all
    
    erb :index
  end
  
  get '/courses/new/:id' do
    @course = Course.find(params[:id])
    @schedule = Schedule.find(1)

    erb :new
  end

  get '/courses/:id' do
    @added_course = AddedCourse.find_by(course_id: params[:id])

    erb :edit
  end

  post '/courses/:id' do
    @course = Course.find(params[:id])
    added = AddedCourse.create
    added.schedule = Schedule.find(1)
    added.course = @course
    added.save
  
    redirect '/courses'
  end


  delete '/schedule/:id' do
    @added_course = AddedCourse.find(params[:id])
    @added_course.destroy

    redirect '/schedule'
  end

  get '/schedule' do
    @schedule = Schedule.find(1)

    erb :show
  end

end
