module PostHelper
	def current_post
		@post ||= Post.find_by_id(params[:id])
	end

end