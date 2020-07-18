
class Pawn < Piece

	def initialize(color)
		super(color)


	end


	def get_possible_moves()
		i, j = @pos
		moves = []
		moves.push([i + 1, j]) if @color == "white" && @game.board[i+1][j].nil?
		moves.push([i - 1, j]) if @color == "black" && @game.board[i-1][j].nil?
		moves.push([i + 2, j]) if i == 1 && @color == "white" && @game.board[i-2][j].nil?
		moves.push([i - 2, j]) if i == 6 && @color == "black" && @game.board[i-2][j].nil?

		# Able to eat up right?
		moves.push([i + 1, j + 1]) if @color == "white" && !@game.board[i+1][j+1].nil? && 
			@game.board[i+1][j+1].color != "white"

		# Able to eat up left?
		moves.push([i + 1, j - 1]) if @color == "white" && !@game.board[i+1][j-1].nil? && 
			@game.board[i+1][j-1].color != "white"

		# Able to eat down right?
		moves.push([i - 1, j + 1]) if @color == "black" && !@game.board[i-1][j+1].nil? && 
			@game.board[i-1][j+1].color != "black"

		# Able to eat down left?
		moves.push([i - 1, j - 1]) if @color == "black" && !@game.board[i-1][j-1].nil? && 
			@game.board[i-1][j-1].color != "black"


		moves = moves.select {|move| move.valid_move?()}

	end

end