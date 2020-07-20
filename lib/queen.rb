

class Queen < Piece

	def initialize(color = "white")	
		super(color)
	end


	def get_possible_moves()
		i, j = @pos
		moves = []

		# Up right
		for k in 1..7
			valid_move?([i + k, j + k]) ? moves.push([i + k, j + k]) : break
			break unless @game.board[i + k][j + k].nil?
		end

		# Down right
		for k in 1..7
			valid_move?([i - k, j + k]) ? moves.push([i - k, j + k]) : break
			break unless @game.board[i - k][j + k].nil?
		end

		# Up left
		for k in 1..7
			valid_move?([i + k, j - k]) ? moves.push([i + k, j - k]) : break
			break unless @game.board[i + k][j - k].nil?
		end

		# Down left
		for k in 1..7
			valid_move?([i - k, j - k]) ? moves.push([i - k, j - k]) : break
			break unless @game.board[i - k][j - k].nil?
		end

		# Up
		for k in 1..7
			valid_move?([i + k, j]) ? moves.push([i + k, j]) : break
			break unless @game.board[i + k][j].nil?
		end

		# Down
		for k in 1..7
			valid_move?([i - k, j]) ? moves.push([i - k, j]) : break
			break unless @game.board[i - k][j].nil?
		end

		# Left
		for k in 1..7
			valid_move?([i, j - k]) ? moves.push([i, j - k]) : break
			break unless @game.board[i][j - k].nil?
		end

		# Right
		for k in 1..7
			valid_move?([i, j + k]) ? moves.push([i, j + k]) : break
			break unless @game.board[i][j + k].nil?
		end

		return moves.select do |move|
			square = @game.board[move[0]][move[1]]
			!square.nil? && square.color == @color ? false : true
		end
	end


end