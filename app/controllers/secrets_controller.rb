class SecretsController < ApplicationController
  def create
    @secret = Secret.new(params[:secret])
    @secret.author_id = self.current_user.id
    if @secret.save
      flash[:messages] = ["Post successful!"]
      redirect_to user_url(params[:secret][:recipient_id])
    else
      flash.now[:errors] = @secret.errors.full_messages
      render :new
    end
  end
end
