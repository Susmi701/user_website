class EnquiriesController < ApplicationController
  before_action :require_user,only: [:show,:index]
  before_action :require_admin_user,only: [:show,:index]

  def index
    @enquiries = Enquiry.paginate(page: params[:page], per_page: 10)
  end

  def show
    @enquiry = Enquiry.find(params[:id])
  end
  

  def new
    @enquiry=Enquiry.new
  end

  def create
    @enquiry = Enquiry.new(message_params)
    if @enquiry.save
      flash[:notice] = "Message was sent successfully"
      redirect_to new_enquiry_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:enquiry).permit(:name, :email,:subject, :message)
  end

  def require_admin_user
    if !current_user.admin?
        flash[:alert]="Only Admin has access"
        redirect_to users_path
    end
end
end
