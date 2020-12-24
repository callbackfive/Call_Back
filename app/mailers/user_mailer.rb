class UserMailer < ApplicationMailer
  def notify_comment(user)
    # @greeting = "Hi"	    
    # # @comment = comment	    
    mail(:to => user.email, :subject => "恭喜您註冊成功！")	    
    # # mail to: "to@example.org"	   
  end	 
end

# UserMailer.new.notify_comment(User.first)