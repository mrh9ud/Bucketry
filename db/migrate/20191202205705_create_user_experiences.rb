class CreateUserExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :user_experiences do |t|
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.boolean :completed
      t.datetime :goal_date
      t.datetime :completion_date

      t.timestamps
    end
  end
end
