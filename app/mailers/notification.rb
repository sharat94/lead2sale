class Notification < ApplicationMailer
	default :from => "support@example.com"
def send_email(p_id)
    @prospect = Prospect.find(p_id)
    b=eval(@prospect.stage.actions["email"])
     if b["template"] == "Product Intro"
     	@body = "Hi there! This is an intro mail about the product"
     elsif b["template"] == "Product Demo"
     	@body = "Hi there! This is a mail to schedule a product demo"
     elsif b["template"] == "ProductProposal & Quotation"
     	@body = "Hi there! Please click one of the responses for the proposal"
     elsif b["template"] == "Customer Negotiation"
     		@body = "Hi there! This is a customer negotiation. Please be available tomorrow."
     elsif b["template"] == "Welcome onboard"
     		@body = "Hi there! Welcome onboard to product platform. Please share feedback"
     elsif b["template"] == "Thank You"
     		@body = "Hi there! We thank you for your patience and hope to work with you in the future."
     	end

    mail(   :to      => @prospect.email,
            :subject => "#{b["template"]}"

    ) do |format|
      format.html
    end
  end
end