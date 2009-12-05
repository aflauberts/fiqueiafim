class CategoryPlace < ActiveRecord::Base
  
  set_table_name :categories_places

  belongs_to :place
  belongs_to :category

end
