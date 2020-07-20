

class Piece
	attr_accessor :color, :pos, :game


	def initialize(color = nil)
		@color = color
		@pos = nil
		@game = nil
	end


	def valid_move?(move)
		x, y = move
		return false if move == @pos
		return false if x < 0 || x > 7 || y < 0 || y > 7
		return true
	end

	def to_s()
		return self.class.name

	end




end