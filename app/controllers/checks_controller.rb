class ChecksController < ApplicationController
  before_action :set_check, only: [:show, :edit, :update, :destroy]
  before_action :check_admin


  # GET /checks
  # GET /checks.json
  def index
    @checks = Check.all
  end

  # GET /checks/1
  # GET /checks/1.json
  def show
  end

  # GET /checks/new
  def new
    @check = Check.new
  end

  # GET /checks/1/edit
  def edit
    @student = @check.student
  end

  # POST /checks
  # POST /checks.json
  def create
    @check = Check.new(check_params)

    respond_to do |format|
      if @check.save
        @check.student.balance = (@check.student.balance) - @check.amount
        @check.student.save
        format.html { redirect_to student_payments_path(@check.student), notice: 'Check was successfully created.' }
        format.json { render :show, status: :created, location: @check }
      else
        format.html { render :new }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checks/1
  # PATCH/PUT /checks/1.json
  def update
    respond_to do |format|
      old_amount = @check.amount
      new_amount = check_params["amount"].to_i
      diff = old_amount - new_amount
      if @check.update(check_params)
        @check.student.balance = @check.student.balance + diff
        @check.student.save
        format.html { redirect_to @check, notice: 'Check was successfully updated.' }
        format.json { render :show, status: :ok, location: @check }
      else
        format.html { render :edit }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checks/1
  # DELETE /checks/1.json
  def destroy
    @check.destroy
    @check.student.balance = @check.student.balance + @check.amount
    @check.student.save
    respond_to do |format|
      format.html { redirect_to student_payments_path(@check.student), notice: 'Check was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check
      @check = Check.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_params
      params.require(:check).permit(:student_id, :amount, :pay_date, :deposited_date, :check_number, :name_on_check)
    end

    def check_admin
      if current_user.try(:admin?) == false
        redirect_to root_path, notice: "You are not authorized to take that action"
      end
    end
end
