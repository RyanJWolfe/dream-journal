class CreateDreamLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dream_logs do |t|
      t.boolean :dream
      t.boolean :remember
      t.text :body
      t.integer :sleep_time
      t.references :journal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
