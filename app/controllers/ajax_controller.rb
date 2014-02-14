class AjaxController < ApplicationController
  def dbout
    @track=Track.new
    @track.name=params[:name]
    @track.instrument=params[:track]
    @track.score=params[:score]
    @track.project_id=params[:project_id]
    @track.user_id=params[:user_id]
    @track.save
    redirect_to :controller=>'projects',:action => "edit", :id => 2
  end
end
