class ApisController < ActionController::Base
 
  def projects
    @projects = Project.includes(:category).where(status:[:is_published,:succeeded]).where('due_date > ?', Time.now)
    render json: projects_with_category(@projects)
  
  end

  def succeeded
    @succeeded_projects = Project.succeeded_and_done
    render json:@succeeded_projects
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
          status:project.status,
          title: project.title,
          img:project.image.url,
          target_amount:project.target_amount,
          category: project.category.title,
          days:project.days_left,
          total:(project.percentage_of_reaching_goal* 100).ceil,
          totalprice:project.paid_orders_amounts,
          count:project.paid_orders.count
   
      }
    end
  end
end