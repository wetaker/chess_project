require "./lib/piece.rb"

class Bishop < Piece

	def initialize(color = "white")
		super(color)

	end


	def get_possible_moves()
		moves = []
		i, j = @pos
		for k in -8..8 
			m1 = [i + k, j + k]
			m2 = [i - k, j + k]
			moves.push(m1) if valid_move?(m1)
			moves.push(m2) if valid_move?(m2)
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