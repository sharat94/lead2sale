module Api
	module V1
		class API::V1::ProspectsController < ApplicationController
			respond_to :json
			
			def update
				respond_with Prospect.update(params[:id],params[:prospect])
			end
		end
	end
end