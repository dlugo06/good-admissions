class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :payments]
  before_filter :authenticate_user!
  before_filter :set_cohort, only: :index
  before_filter :set_location, only: :index
  before_filter :default_filter, only: :index

  def payments
  end

  def location
    # raise
    # @location = params[:location]
    # respond_to do |format|
    #   format.html { redirect_to @student, notice: 'Location was successfully found.' }
    # end
  end
  # GET /students
  # GET /students.json
  def index
    @default_students_filter = false
    @all_students_filter = false
    @cohort_students_filter = false
    @location_students_filter = false
    @balance_students_filter = false
    @unspecified_students = Student.where(cohort_id: nil)
    @all_students = Student.all.order(created_at: :asc)
    filters
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    # @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      difference = @student.discount_difference(student_params)
      if @student.update(student_params)
        @student.balance = @student.balance + difference
        @student.save
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def filters
      if @cohort.present?
        @filtered_students = @cohort.students
        @cohort_students_filter = true
      elsif @location.present?
        @filtered_students = @location.map(&:students)
        @filtered_students.flatten!
        @location_students_filter = true
      elsif params[:student].present? && params[:student][:balance].present?
        if params[:student][:balance] == "Outstanding"
          @filtered_students = Student.where("balance > ?", 0).order(balance: :desc)
        elsif params[:student][:balance] == "Cleared"
          @filtered_students = Student.where(balance: 0)
        end
        @balance_students_filter = true
      else
        if (request.original_url.include?("/students") && !request.original_url.include?("?")) || Cohort.all.length == 0 || Student.all.length == 0
          @filtered_students = @all_students
          @all_students_filter = true
        else
          @filtered_students = @default_cohort.students
          @default_students_filter = true
        end
      end
    end

    def default_filter
      if Cohort.where("start_date >= ?", Date.today).empty?
        @default_cohort = Cohort.where("start_date <= ?", Date.today).order(start_date: :desc).first
      else
        @default_cohort = Cohort.where("start_date >= ?", Date.today).first
      end
    end

    def set_student
      @student = Student.find(params[:id])
    end

    def set_cohort
        @cohort = Cohort.find_by(id: params[:cohort][:id]) if params[:cohort].present? && params[:cohort][:id].present?
    end

    def set_location
        @location = Cohort.where(location: params[:cohort][:location]) if params[:cohort].present? && params[:cohort][:location].present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :phone_num, :balance, :discount, :notes, :cohort_id, :facebook, :twitter, :linkedin, :github, :portfolio_url, :final_project_url)
    end
end
