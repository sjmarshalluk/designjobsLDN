ActiveAdmin.register Job do

  controller do
    def permitted_params
      params.permit job: [:title, :company, :company_url, :job_url, :email, :description, :approved, :user_id, :area_of_london, :salary, :how_to_apply]
    end
  end

  index do
    column :id
    column :title
    column :company
    column :email
    column :created_at
    column :approved
    column :user_id
    column :area_of_london
    column :salary
    column :how_to_apply
    actions


  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
