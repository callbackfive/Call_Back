class CommentNotification < Noticed::Base
  CommentNotification.with(comment: @comment).deliver_later(User.all)
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

  param :comment

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message")
  end
  #
  def url
    comment_path(params[:comment])
  end
end

