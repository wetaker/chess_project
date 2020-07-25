

class Knight < Piece
	def initialize()
		super()

	end



	def get_possible_moves(protecting: false)
		i, j = @pos
		dx = [1, 1, 2, 2, -1, -1, -2, -2]
		dy = [2, -2, 1, -1, 2, -2, 1, -1]
		moves = []
		for k in 0..7
			move = [i + dx[k], j + dy[k]]
			moves.push(move) if valid_move?(move)
		end

		unless protecting
			return moves.select {|move| @game.board[move[0]][move[1]].nil? || 
				@game.board[move[0]][move[1]].color != @color}
		end


		return moves
	end




end