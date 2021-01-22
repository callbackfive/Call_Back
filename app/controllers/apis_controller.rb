class ApisController < ActionController::Base
 
  def projects
    @projects = Project.includes(:category).is_published
    render json: projects_with_category(@projects)
  end

  def categories
    @categories = Category.all
    render json:@categories
  end

  def notices
   render json: @comment.content
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