
Dir["./lib/*.rb"].each {|file| require file }


describe Bishop do
	Bishop1, Bishop2 = Bishop.new(), Bishop.new()
	Bishop1.pos, Bishop2.pos = [0, 0], [5, 3]
	describe "#valid_move?" do
		it "Recognizes valid moves" do
			expect(Bishop1.valid_move?([1, 1])).to eql(true)
			expect(Bishop2.valid_move?([7, 5])).to eql(true)
		end
		it "Recognizes invalid moves" do
			expect(Bishop1.valid_move?([10, 10])).to eql(false)
			expect(Bishop1.valid_move?([4, 5])).to eql(false)
			expect(Bishop1.valid_move?([-5, -5])).to eql(false)
			expect(Bishop2.valid_move?([3, 3])).to eql(false)
		end
	end


end