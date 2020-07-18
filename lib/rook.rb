

class Rook < Piece

	def initialize()
		super()

	end


	def get_possible_moves()
		i, j = @pos
		moves = []
		for k in -8..8 
			m1 = [i, j + k]
			m2 = [i + k, j]
			moves.push(m1) if m1.valid_move?()
			moves.push(m2) if m2.valid_move?()
		end
		return moves
	end






end