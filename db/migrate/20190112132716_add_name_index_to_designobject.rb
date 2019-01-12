class AddNameIndexToDesignobject < ActiveRecord::Migration[5.2]
  def change
  	add_index :designobjects, :name, unique: true
  end
end
