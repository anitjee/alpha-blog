class AssignmentsController < ApplicationController
  
  def index
   @assignments = Assignment.all 
  end
  
  def new
    @assignment = Assignment.new
  end
  
   def edit
    @assignment = Assignment.find(params[:id]) 
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
       @assignment = Assignment.find(params[:id])
          if @assignment.update(assignment_params)
            flash[:notice] = "Article was successfully updated"
            redirect_to assignment_path(@assignment)
          else
            render 'edit'
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
