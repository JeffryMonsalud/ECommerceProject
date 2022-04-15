ActiveAdmin.register User do

    permit_params :name, :password, :password_confirmation, :email, :address
  
    form do |f|
      f.semantic_errors # shows error on :base
      f.inputs          # builds an input field ofr every attribute
      f.actions         # adds the 'Submit' and 'Cancel' buttons
    end
  
  end
  