class AddColorAndParentColumnToDesignObject < ActiveRecord::Migration[5.2]
  def change
  	add_column :designobjects, :parent_id, :integer, null: true, index: true
    add_foreign_key :designobjects, :designobjects, column: :parent_id
    add_column :designobjects, :color, :string
  end
end
