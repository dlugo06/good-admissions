class WiresController < ApplicationController
  before_action :set_wire, only: [:show, :edit, :update, :destroy]

  # GET /wires
  # GET /wires.json
  def index
    @wires = Wire.all
  end

  # GET /wires/1
  # GET /wires/1.json
  def show
  end

  # GET /wires/new
  def new
    @wire = Wire.new
  end

  # GET /wires/1/edit
  def edit
    @student = @wire.student
  end

  # POST /wires
  # POST /wires.json
  def create
    @wire = Wire.new(wire_params)

    respond_to do |format|
      if @wire.save
        @wire.student.balance = (@wire.student.balance) - @wire.amount
        @wire.student.save
        format.html { redirect_to @wire, notice: 'Wire was successfully created.' }
        format.json { render :show, status: :created, location: @wire }
      else
        format.html { render :new }
        format.json { render json: @wire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wires/1
  # PATCH/PUT /wires/1.json
  def update
    respond_to do |format|
      old_amount = @wire.amount
      new_amount = wire_params["amount"].to_i
      diff = old_amount - new_amount
      if @wire.update(wire_params)
          @wire.student.balance = @wire.student.balance + diff
          @wire.student.save
        format.html { redirect_to @wire, notice: 'Wire was successfully updated.' }
        format.json { render :show, status: :ok, location: @wire }
      else
        format.html { render :edit }
        format.json { render json: @wire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wires/1
  # DELETE /wires/1.json
  def destroy
    @wire.destroy
    @wire.student.balance = @wire.student.balance + @wire.amount
    @wire.student.save
    respond_to do |format|
      format.html { redirect_to wires_url, notice: 'Wire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wire
      @wire = Wire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wire_params
      params.require(:wire).permit(:student_id, :amount, :send_date, :pay_date, :sender)
    end
end
