class Tasks < ActiveRecord::Migration[5.2]
  def change
  	create_table :tasks do |t|
  		t.string :task
  		t.string :remarks
  		t.date :start_date
  		t.date :end_date
  	end

  end
end
