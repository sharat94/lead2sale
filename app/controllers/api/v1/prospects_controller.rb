module Api
	module V1
		class ProspectsController < ApplicationController
			respond_to :json
			
			def index
				pro=Prospect.find(params[:id])
				pro.stage_id=params[:stage_id]
				success= pro.save
				if success
					render json: {success: 'Successfully updated'}, status: :updated
			  else
			    render json: {failed: 'Unsuccessful'}, status: :unprocessable_entity
			  end


			end
		end
	end
end