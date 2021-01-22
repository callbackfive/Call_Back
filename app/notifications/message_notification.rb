
class MessageNotification < Noticed::Base
  deliver_by :database, format: :to_database

  def to_database
    {
      type: self.class.name,
      params: params
    }
  end

  param :message

  def message
    t(".message")
  end
  
  def url
    project_path((params[:comment]).project_id)
  end
end

