class CommentsController < ApplicationController

  before_filter(:get_experiment)
  
  def get_experiment
	@experiment = Experiment.find(params[:experiment_id])
  end

  
  # POST /experiments
  # POST /experiments.xml
  def create
    authenticate_user!
    @comment = @experiment.comments.create(params[:comment])
	@comment.user_id = current_user
	@comment.save
	redirect_to experiment_path(@experiment)
  end

  
  # DELETE /experiments/1
  # DELETE /experiments/1.xml
  def destroy
    @comment = @experiment.comments.find(params[:id])
    @comment.destroy
	redirect_to experiment_path(@experiment)
  end
  
end
