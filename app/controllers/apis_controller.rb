class ApisController < ActionController::Base
 
  def projects
    @projects = Project.includes(:category).all
    # @projects = Project.all.includes(:category)
    # render json: @projects.category.title
     render json: projects_with_category(@projects)
  end

  def categories
    @categories = Category.all
    render json:@categories
  end

  private

  def projects_with_category(projects)
    projects.map do |project|
      {
          id: project.id,
          title: project.title,
          img:project.image.url,
          target_amount:project.target_amount,
          category: project.category.title
      }
    end
  end
end