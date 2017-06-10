class AssignmentsController < ApplicationController
  
  def new
    @assignment = Assignment.new
  end
  
  def create
    
  # render plain: params[:assignments].inspect
  @assignment = Assignment.new(assignment_params)
  
  if @assignment.save
  flash[:notice] = "Article was successfully created"
  redirect_to assignment_path(@assignment) #redirect to show action
  
  else
    render 'new'
    
    end
  end
  
  private
  def assignment_params
 params.require(:assignment).permit(:title, :description) 
  end
  def show
    @assignment = Assignment.find(params[:id])
  
  end
    
  
end
