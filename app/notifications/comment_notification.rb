
class CommentNotification < Noticed::Base
  deliver_by :database, format: :to_database

  def to_database
    {
      type: self.class.name,
      params: params
    }
  end

  param :comment

  def message
    '您有一則新留言!'
  end

  def url
    project_path((params[:comment]).project_id)
  end
end

