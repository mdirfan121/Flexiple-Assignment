class ProjectsController < ApplicationController
    before_action :logged_in_user, only: [:new]

    def new
        puts "Params = #{params}"
        experience = Experience.find_by(id: params[:expid])
        experience.projects.create
        flash[:success] = 'New Project Added'
        redirect_to edit_url
    end

end
