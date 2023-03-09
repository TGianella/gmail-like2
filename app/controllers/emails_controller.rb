class EmailsController < ApplicationController
  def index
    @emails = Email.order(id: :asc)
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
  end

  def create
    @email = Email.new(object: Faker::Lorem.sentence,
                       content: Faker::Lorem.paragraph,
                       read: false)

    respond_to do |format|
      if @email.save
        format.html { redirect_to emails_path, notice: 'Nouvel email reçu !' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to emails_path, notice: 'Email supprimé !'
  end

  def toggle
    @email = Email.find(params[:id])
    @email.update(read: params[:read])

    render json: { message: 'Success' }
  end
end
