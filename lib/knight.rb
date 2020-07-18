

class Knight < Piece
	def initialize()
		super()

	end



	def get_possible_moves()
		i, j = @pos
		dx = [1, 1, 2, 2, -1, -1, -2, -2]
		dy = [2, -2, 1, -1, 2, -2, 1, -1]
		moves = []
		for k in 0..7
			move = [i + dx[k], j + dy[k]]
			moves.push(move) if valid_move?(move)
		end
		return moves
	end




end