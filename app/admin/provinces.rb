ActiveAdmin.register Province do

    permit_params :name, :gst, :pst

    form do |f|
      f.semantic_errors # shows error on :base
      f.inputs          # builds an input field ofr every attribute
      f.actions         # adds the 'Submit' and 'Cancel' buttons
    end
  
  end
  