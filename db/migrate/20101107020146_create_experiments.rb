class CreateExperiments < ActiveRecord::Migration
  def self.up
    create_table :experiments do |t|
      t.date :entry_date
      t.string :author
      t.string :title
      t.text :summary
      t.string :citation
      t.integer :participants
      t.integer :size
      t.integer :realism
	  t.integer :times_viewed
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :experiments
  end
end
