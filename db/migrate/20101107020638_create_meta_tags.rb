class CreateMetaTags < ActiveRecord::Migration
  def self.up
    create_table :meta_tags do |t|
      t.string :tag
      t.references :experiment

      t.timestamps
    end
  end

  def self.down
    drop_table :meta_tags
  end
end
