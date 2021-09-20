class PagesController < ApplicationController
  def the_batch; end

  def the_students
    @students = Student.all
  end

  def the_projects
    @projects = Project.where.not(id: 11)
  end

  def the_TAs
    @tas = Teacher.all
  end

  def the_staff
    @staff = Staff.all
  end

  def show
    @project = Project.find(params[:id])
    render partial: 'pages/show', locals: { project: @project }
  end

  def the_numbers; end

  def quick_note; end
end
