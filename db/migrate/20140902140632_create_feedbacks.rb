class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :user, index: true
      t.string :title
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end
