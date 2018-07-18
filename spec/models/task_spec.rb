require 'rails_helper'

RSpec.describe Task, type: :model do
  context "validation tests" do 
		
		it "ensures task presence " do 
			task = Task.new(remarks: "IDK").save
			expect(task).to eq(false)
		end

		it "ensures remarks presence " do 
			task = Task.new(task: "eat ice-cream").save
			expect(task).to eq(false)
		end

		


	end
end
