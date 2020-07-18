
class Pawn < Piece

	def initialize(color)
		super(color)


	end


	def get_possible_moves()
		i, j = @pos
		moves = []
		moves.push([i + 1, j]) if @color == "white"
		moves.push([i -1, j]) if @color == "white"
		moves.push([i + 2, j]) if i == 1 && @color == "white"
		moves.push([i -2, j]) if i == 6 && @color == "black"
		moves = moves.select {|move| move.valid_move?()}

	end

end