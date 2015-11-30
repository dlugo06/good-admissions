class PerformanceChartsController < ApplicationController
  before_action :set_performance_chart, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /performance_charts
  # GET /performance_charts.json
  def index
    if current_user.admin?
      @performance_charts = PerformanceChart.all
      @students = Student.all
      @cohorts = Cohort.all
      @locations = @cohorts.map {|c| c.location}.uniq
    else
      redirect_to root_path, notice: "You are not authorized to take that action."
    end
  end

  # GET /performance_charts/1
  # GET /performance_charts/1.json
  def show
  end

  # GET /performance_charts/new
  def new
    @performance_chart = PerformanceChart.new
  end

  # GET /performance_charts/1/edit
  def edit
  end

  # POST /performance_charts
  # POST /performance_charts.json
  def create
    @performance_chart = PerformanceChart.new(performance_chart_params)

    respond_to do |format|
      if @performance_chart.save
        format.html { redirect_to @performance_chart, notice: 'Performance chart was successfully created.' }
        format.json { render :show, status: :created, location: @performance_chart }
      else
        format.html { render :new }
        format.json { render json: @performance_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performance_charts/1
  # PATCH/PUT /performance_charts/1.json
  def update
    respond_to do |format|
      if @performance_chart.update(performance_chart_params)
        format.html { redirect_to @performance_chart, notice: 'Performance chart was successfully updated.' }
        format.json { render :show, status: :ok, location: @performance_chart }
      else
        format.html { render :edit }
        format.json { render json: @performance_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performance_charts/1
  # DELETE /performance_charts/1.json
  def destroy
    @performance_chart.destroy
    respond_to do |format|
      format.html { redirect_to performance_charts_url, notice: 'Performance chart was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_chart
      @performance_chart = PerformanceChart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performance_chart_params
      params[:performance_chart]
    end
end
