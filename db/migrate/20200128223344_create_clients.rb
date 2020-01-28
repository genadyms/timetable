class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :role
      t.timestamps
    end
    Client.create :name =>'Gennady', :role => 'free'
    Client.create :name =>'Irina', :role => 'teacher'
    Client.create :name => 'Anastasiya', :role => 'schoolgirl'
    Client.create :name => 'Andrey', :role => 'schoolboy'
  end
end
