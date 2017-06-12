class AssignmentsController < ApplicationController
  
  before_action :set_assignment, only: [:edit, :update, :show, :destroy]
  
  def index
   @assignments = Assignment.all 
  end
  
  def new
    @assignment = Assignment.new
  end
  
  def edit
  
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
    
  def update
     
          if @assignment.update(assignment_params)
            flash[:notice] = "Article was successfully updated"
            redirect_to assignment_path(@assignment)
          else
            render 'edit'
          end
    end
       

     def show
    
  end
  
  def destroy
   
    @assignment.destroy
    flash[:notice] = "Article was succesfully destroyed"
    redirect_to assignments_path
  end
   private
  
   def set_assignment
      @assignment = Assignment.find(params[:id])
   end
   
         def assignment_params
         params.require(:assignment).permit(:title, :description) 
        end
end
