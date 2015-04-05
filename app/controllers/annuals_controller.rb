class AnnualsController < ApplicationController

# GET /employees/1/annuals
  def index
    # For URL like /employees/1/annuals
    # Get the employee with id=1
    @employee = Employee.find(params[:employee_id])

    # Access all annuals for that employee
    @annuals = @employee.annuals
  end

  # GET /employees/1/annuals/2
  def show
    @employee = Employee.find(params[:employee_id])

    # For URL like /employees/1/annuals/2
    # Find an annual in employees 1 that has id=2
    @annual = @employee.annuals.find(params[:id])
  end

  # GET /employees/1/annuals/new
  def new
    @employee = Employee.find(params[:employee_id])


    # Associate an annual object with employee 1
    @annual = @employee.annuals.build
  end

  # POST /employees/1/annuals
  def create
    @employee = Employee.find(params[:employee_id])

    # For URL like /employees/1/annuals
    # Populate an annual associate with employee 1 with form data
    # employee will be associated with the annual
    @annual = @employee.annuals.build(params.require(:annual).permit(:details))
    if @annual.save
      # Save the annual successfully
      redirect_to employee_annual_url(@employee, @annual)
    else
      render :action => "new"
    end
  end

  # GET /employees/1/annuals/2/edit
  def edit
    @employee = Employee.find(params[:employee_id])

    # For URL like /employees/1/annuals/2/edit
    # Get annual id=2 for employee 1
    @annual = @employee.annuals.find(params[:id])
  end

  # PUT /employees/1/annuals/2
  def update
    @employee = Employee.find(params[:employee_id])
    @annual = annual.find(params[:id])
    if @annual.update_attributes(params.require(:annual).permit(:details))
      # Save the annual successfully
      redirect_to employee_annual_url(@employee, @annual)
    else
      render :action => "edit"
    end
  end

  # DELETE /employees/1/annuals/2
  def destroy
    @employee = Employee.find(params[:employee_id])
    @annual = annual.find(params[:id])
    @annual.destroy

    respond_to do |format|
      format.html { redirect_to employee_annuals_path(@employee) }
      format.xml  { head :ok }
    end
  end

end
