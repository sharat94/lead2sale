module Api
	module V1
		class ProspectsController < ApplicationController
			respond_to :json
			
			def update
				respond_with Prospect.update(params[:id],params[:stage_id])
			end
		end
	end
end