class CreateUserTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_trails do |t|
      t.references :user, foreign_key: true
      t.references :trail, foreign_key: true
      t.timestamps
    end
  end
end
