class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]
  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
    @student = @loan.student
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(loan_params)
    respond_to do |format|
      if @loan.save
        @loan.student.balance = (@loan.student.balance) - @loan.amount
        @loan.student.save
        format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      old_amount = @loan.amount
      new_amount = loan_params["amount"].to_i
      diff = old_amount - new_amount
      if @loan.update(loan_params)
        @loan.student.balance = @loan.student.balance + diff
        @loan.student.save
        format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    @loan.student.balance = @loan.student.balance + @loan.amount
    @loan.student.save
    respond_to do |format|
      format.html { redirect_to loans_url, notice: 'Loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.require(:loan).permit(:student_id, :amount, :company, :pay_date, :notes)
    end
end
