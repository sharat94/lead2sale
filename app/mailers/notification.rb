class Notification < ApplicationMailer
	default :from => "support@example.com"
def send_email(p_id)
    @prospect = Prospect.find(p_id)
    b=eval(@prospect.stage.actions["email"])
    @body= EmailTemplate.where("title=?",b["template"]).last.content
    mail(   :to      => @prospect.email,
            :subject => "#{b["template"]}"

    ) do |format|
      format.html
    end
  end
end