ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :familyName, :lastName, :familyNameDetail, :lastNameDetail, :gender, :birthdate, :prefecture, :firstEducation, :firstEducationDetail, :secondEducation, :secondEducationDetail, :thirdEducation, :thirdEducationDetail, :firstCareer, :firstCareerDetail, :secondCareer, :secondCareerDetail, :thirdCareer, :thirdCareerDetail, :certification, :reason, :duration, :strongPoint, :weakPoint, :goal, :learningResource, :informationResource, :language, :framework, :portfolio, :product, :introduction, :workplace, :salary, :startingDate
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :familyName, :lastName, :familyNameDetail, :lastNameDetail, :gender, :birthdate, :prefecture, :firstEducation, :firstEducationDetail, :secondEducation, :secondEducationDetail, :thirdEducation, :thirdEducationDetail, :firstCareer, :firstCareerDetail, :secondCareer, :secondCareerDetail, :thirdCareer, :thirdCareerDetail, :certification, :reason, :duration, :strongPoint, :weakPoint, :goal, :learningResource, :informationResource, :language, :framework, :portfolio, :product, :introduction, :workplace, :salary, :startingDate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
