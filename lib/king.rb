class King < Piece

	def initialize()


	end


	def get_possible_moves(protecting: false)
		i, j = @pos
		moves = []
		for k in -1..1
			m1 = [i + k, j + k]
			m2 = [i - k, j + k]
			m3 = [i + k, j]
			m4 = [i, j + k]
			[m1, m2, m3, m4].each {|move| moves.append(move) if valid_move?(move)}
		end

		if protecting == false
			moves = moves.select {|move| @game.board[move[0]][move[1]].nil? || 
				@game.board[move[0]][move[1]].color != self.color }
		end

		if @turn == @color
			enemy = @color == "white" ? @game.black_pieces : @game.white_pieces
			threat = enemy.reduce([]){|accum, piece| accum.concat(piece.get_possible_moves())}
			moves = (moves - threat)
		end
		return moves
	end







end