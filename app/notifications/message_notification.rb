
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
    '您有一則新的私訊！'
  end
  
  def url
    dialogbox_path(
      Dialogbox.find(params[:message].dialogbox_id))
  end
end

