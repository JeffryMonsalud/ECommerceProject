ActiveAdmin.register Product do

  permit_params :name, :description, :price, :quantity, :image, :category_id

  form do |f|
    f.semantic_errors # shows error on :base
    f.inputs          # builds an input field ofr every attribute

    f.inputs do 
      f.input :image, as: :file
    end

    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

end
