# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
  
  def after_sign_in_path_for(resource)
    customers_path
  end
  
  
  def after_sign_out_path_for(resource)
    root_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  private
  # アクティブであるか判断するmethod
  def customer_state
    # 【処理1】入力されたemailからアカウントを1件取得
    customer = Customer.find_by(email: params[:customer][:email])
    # 【処理2】アカウントを取得できなかった場合、methodを終了
    return if customer.nil?
    # 【処理3】取得したアカウントのpasswordと入力されたpasswordが一致しない場合methodを終了
    return unless customer.valid_password?(parms[:customer][:password])
    # 【処理4】activeではない会員に対する処理
    return if customer.is_active == "false"
      new_customer_registration_path
  end
end
