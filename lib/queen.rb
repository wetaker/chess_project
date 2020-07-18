

class Queen < Piece

	def initialize(color = "white")	
		super(color)
	end


	def get_possible_moves()
		i, j = @pos
		moves = []
		for k in -8..8
			m1 = [i + k, j + k]
			m2 = [i - k, j + k]
			m3 = [i + k, j]
			m4 = [i, j + k]
			[m1, m2, m3, m4].each {|x| moves.push(x) if valid_move?(x)}
		end
		return moves
	end




end