class ClothingType < ActiveRecord::Base

has_attached_file :imagem,:styles => { :normal => "200x200>"}

end
