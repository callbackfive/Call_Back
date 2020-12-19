class UserMailer < ApplicationMailer
  def notify_comment(user, comment)
    @greeting = "Hi"	    
    @comment = comment	    
    mail(:to => user.email, :subject => "恭喜您註冊成功！")	    
    # mail to: "to@example.org"	   
  end	  
end
