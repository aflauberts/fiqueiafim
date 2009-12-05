class Clothing < ActiveRecord::Base

  set_table_name('clothing')

belongs_to :metting

end
