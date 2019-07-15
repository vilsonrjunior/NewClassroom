
class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    if current_user
      @lessons = Lesson.all
    elsif current_teacher
      lessons_array = []
      # check if current_teacher has any courses
      if current_teacher.courses != nil
       # filter current_teacher courses
      @teacher_courses = current_teacher.courses.map { |course| lessons_array << course.lessons }
      # from current_teacher courses, get individual course
      @lessons = lessons_array
      # raise
      # from each current_teacher course, get lessons

      # from each lesson, display info

      end

      # @lessons_filtered = @courses_filtered.lessons.each do |lesson|
      #   lesson.name
      # end
      # @courses_filtered = current_teacher.courses.each { |course|}
      # # raise
      # @lessons_filtered = @courses_filtered.find { |lesson| lesson.name }
      #raise

    elsif current_student
      # raise
      @lessons = current_student.course.lessons
    else current_parent
      @lessons = current_parent.students.course.lessons
  end
  end
  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  #   def create
  #   @lesson = Lesson.new(lesson_params)
  #   @lesson.end = @lesson.start + 40.minutes
  #   # @lesson.teacher = @user
  #   if @lesson.save
  #     respond_to do |format|
  #       format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
  #       format.js  # <-- will render `app/views/slots/create.js.erb`
  #     end
  #   else
  #     respond_to do |format|
  #       format.html { render 'users/show' }
  #       format.js  # <-- idem
  #     end
  #   end
  # end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:course_id, :name, :material)
    end
end
