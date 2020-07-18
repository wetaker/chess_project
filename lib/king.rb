

class King < Piece

	def initialize()


	end


	def get_possible_moves()
		i, j = @pos
		moves = []
		for k in -1..1
			m1 = [i + k, j + k]
			m2 = [i - k, j + k]
			m3 = [i + k, j]
			m4 = [i, j + k]
			[m1, m2, m3, m4].each {|move| moves.append(move) if valid_move?(move)}
		end
		return moves
	end




end