class StripesController < ApplicationController
  before_action :set_stripe, only: [:show, :edit, :update, :destroy]
  before_action :check_admin


  # GET /stripes
  # GET /stripes.json
  def index
    @stripes = Stripe.all
  end

  # GET /stripes/1
  # GET /stripes/1.json
  def show
  end

  # GET /stripes/new
  def new
    @stripe = Stripe.new
  end

  # GET /stripes/1/edit
  def edit
    @student = @stripe.student
  end

  # POST /stripes
  # POST /stripes.json
  def create
    @stripe = Stripe.new(stripe_params)

    respond_to do |format|
      if @stripe.save
        @stripe.student.balance = (@stripe.student.balance) - @stripe.amount
        @stripe.student.save
        format.html { redirect_to student_payments_path(@stripe.student), notice: 'Stripe was successfully created.' }
        format.json { render :show, status: :created, location: @stripe }
      else
        format.html { render :new }
        format.json { render json: @stripe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stripes/1
  # PATCH/PUT /stripes/1.json
  def update
    respond_to do |format|
      old_amount = @stripe.amount
      new_amount = stripe_params["amount"].to_i
      diff = old_amount - new_amount
      if @stripe.update(stripe_params)
        @stripe.student.balance = @stripe.student.balance + diff
        @stripe.student.save
        format.html { redirect_to @stripe, notice: 'Stripe was successfully updated.' }
        format.json { render :show, status: :ok, location: @stripe }
      else
        format.html { render :edit }
        format.json { render json: @stripe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stripes/1
  # DELETE /stripes/1.json
  def destroy
    @stripe.destroy
    @stripe.student.balance = @stripe.student.balance + @stripe.amount
    @stripe.student.save
    respond_to do |format|
      format.html { redirect_to student_payments_path(@stripe.student), notice: 'Stripe was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stripe
      @stripe = Stripe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stripe_params
      params.require(:stripe).permit(:student_id, :amount, :refunded, :pay_date)
    end

    def check_admin
      if current_user.try(:admin?) == false
        redirect_to root_path, notice: "You are not authorized to take that action"
      end
    end
end
