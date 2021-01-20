# CommentNotification.with(comment: @comment).deliver_later(current_user)

class CommentNotification < Noticed::Base
  # notification = CommentNotification.with(current_user)
  # notification.deliver_later(User.all)
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  def to_database
    {
      type: self.class.name,
      params: params,
      # account: Current.account,
    }
  end

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message")
  end
  #
  def url
    project_path(@comment.project_id)
  end
end

