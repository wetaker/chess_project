

class Rook < Piece

	def initialize()
		super()

	end


	def get_possible_moves()
		i, j = @pos
		moves = []

		# Up
		for k in 1..7
			moves.push([i + k, j]) if valid_move?([i + k, j])
			break unless @game.board[i + k, j].nil?
		end

		# Down
		for k in 1..7
			moves.push([i - k, j]) if valid_move?([i - k, j])
			break unless @game.board[i - k, j].nil?
		end

		# Left
		for k in 1..7
			moves.push([i, j - k]) if valid_move?([i, j - k])
			break unless @game.board[i, j - k].nil?
		end

		# Right
		for k in 1..7
			moves.push([i, j + k]) if valid_move?([i, j + k])
			break unless @game.board[i, j + k].nil?
		end
		return moves
	end






end