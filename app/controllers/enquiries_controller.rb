class EnquiriesController < ApplicationController
  
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
      flash[:notice] = "Error occured while senting message"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:enquiry).permit(:name, :email,:subject, :message)
  end
end
