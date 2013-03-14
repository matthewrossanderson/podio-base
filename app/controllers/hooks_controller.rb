class HooksController < ApplicationController
	skip_before_filter :ensure_login, :verify_authenticity_token, :only => [:callback]
	def callback
		case params[:type] 
			when "hook.verify"
				Podio::Hook.validate(params[:hook_id], params[:code])	
		end
  	head :ok
	end
end
