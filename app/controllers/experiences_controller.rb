class ExperiencesController < ApplicationController
    before_action :logged_in_user, only: [:new]

    def new
        experience = current_user.profile.experiences.create
        experience.projects.create
        flash[:success] = "New Experience added."
        redirect_to edit_url
    end

end
