require "./lib/piece.rb"

class Bishop < Piece

	def initialize(color = "white")
		super(color)

	end


	def get_possible_moves()
		moves = []
		i, j = @pos

		# Up right
		for k in 1..7
			moves.push([i + k, j + k]) if valid_move?([i + k, j + k])
			break unless @game.board[i + k, j + k].nil?
		end

		# Down right
		for k in 1..7
			moves.push([i - k, j + k]) if valid_move?([i - k, j + k])
			break unless @game.board[i - k, j + k].nil?
		end	

		# Up left
		for k in 1..7
			moves.push([i + k, j - k]) if valid_move?([i + k, j - k])
			break unless @game.board[i + k, j - k].nil?
		end	

		# Down left
		for k in 1..7
			moves.push([i - k, j - k]) if valid_move?([i - k, j - k])
			break unless @game.board[i - k, j - k].nil?
		end	
		return moves
	end



	def valid_move?(move) 
		# Valid if solution to (y-j) = \pm(x-i), within boundaries
		# (Assuming no decimal input)
		x, y = move
		return false if move = @pos
		return false if x < 0 || x > 7 || y < 0 || y > 8
		return true if y - @pos[1] == (x - @pos[0]).abs
		return false
	end




end