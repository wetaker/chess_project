require "./lib/piece.rb"

class Bishop < Piece

	def initialize(color = "white")
		super(color)

	end


	def get_possible_moves(protecting: false)
		moves = []
		i, j = @pos

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
		
		# return moves.select do |move|
		# 	square = @game.board[move[0]][move[1]]
		# 	!square.nil? && square.color == color ? false : true
		# end

		# Removes positions of allied pieces as the Bishop cannot move there.
		unless protecting
			return moves.select do |move|
				square = @game.board[move[0]][move[1]]
				!square.nil? && square.color == @color ? false : true
			end
		end


		# Includes allied piece positions that the Bishop protects but cannot move to.
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