class HooksController < ApplicationController
	skip_before_filter :ensure_login, :verify_authenticity_token, :only => [:callback]
	def callback
		case params[:type] 
			when "hook.verify"
				# validate any hook that you ask it to verify
				Podio::Hook.validate(params[:hook_id], params[:code])
			when "app.update" || "app.delete"
				# verify the given app.
				App.find(params[:app_id]).verify
				# todo add a notification, or a sweeper
		end
		# return 200 to podio no matter what, keep calm and carry on
  	head :ok
	end
end
