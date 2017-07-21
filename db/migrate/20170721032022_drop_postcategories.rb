class DropPostcategories < ActiveRecord::Migration
  def change
    drop_table :postcategories
  end
end
