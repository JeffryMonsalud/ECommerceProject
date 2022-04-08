ActiveAdmin.register Customer do

  permit_params :name, :address, :email_address

end
