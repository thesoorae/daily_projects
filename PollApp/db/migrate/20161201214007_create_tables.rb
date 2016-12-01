class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
    end
    add_index :users, :name

    create_table :polls do |t|
      t.string :title, null: false
      t.integer :author_id, null:false
    end
    add_index :polls, :author_id

    create_table :questions do |t|
      t.integer :poll_id, null: false
      t.string :question_text, null: false
    end
    add_index :questions, :poll_id

    create_table :answer_choices do |t|
      t.integer :question_id, null: false
      t.string :answer_text, null: false
    end
    add_index :answer_choices, :question_id

    create_table :responses do |t|
      t.integer :user_id, null:false
      t.integer :answer_id, null:false
    end
    add_index :responses, :user_id
  end
end
