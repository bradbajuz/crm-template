class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name, default: "", null: false
      t.string :brand, default: "", null: false
      t.string :title, default: "", null: false
      t.string :welcome_page_heading, default: "", null: false
      t.string :welcome_page_subheading, default: "", null: false

      t.timestamps
    end
  end
end
