

class Piece
	attr_accessor :color, :pos


	def initialize(color = nil)
		@color = color
		@pos = nil
	end


	def valid_move?(move)
		x, y = move
		return false if move == @pos
		return false if x < 0 || x > 7 || y < 0 || y > 7
		return true
	end

end