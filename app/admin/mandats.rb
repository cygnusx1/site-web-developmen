ActiveAdmin.register Mandat do
  
  form do |f|
      f.inputs "Details" do
        f.input :title
        f.input :description,:as => :text, :label => "description", :limit=> 5000
        f.input :show, :label => "indique si on affiche ou non le mandat sur la page"
        f.input :renew, :label => "affiche renouvelable si oui"
        f.input :duree
        f.input :expiration
        f.input :location
        

      end
      f.buttons
    end
  
end
