# frozen_string_literal: true

module Teachers
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up


    # POST /resource
    def create
      @teacher = Teacher.new(teacher_params)

      respond_to do |format|
        if @teacher.save
          format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully created." }
          format.json { render :show, status: :created, location: @teacher }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @teacher.errors, status: :unprocessable_entity }
        end
      end
    end

    # GET /resource/edit


    # PUT /resource


    # DELETE /resource




    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    end





    private

    def sign_up_params
      params.require(:teacher).permit(:first_name, :middle_name, :last_name, :email, :password, :password_confirmation)
    end

    def teacher_params
      params.require(:teacher).permit(:first_name, :middle_name, :last_name, :email, :password, :password_confirmation)
    end
  end
end
