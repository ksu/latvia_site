class CreateQuestions < ActiveRecord::Migration

  def self.up
    create_table :questions do |t|
      t.string :title
      t.integer :image1_id
      t.text :text1
      t.integer :image2_id
      t.text :text2
      t.integer :image3_id
      t.text :text3
      t.integer :position

      t.timestamps
    end

    add_index :questions, :id

    load(Rails.root.join('db', 'seeds', 'questions.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "questions"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/questions"})
    end

    drop_table :questions
  end

end
