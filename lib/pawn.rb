
class Pawn < Piece

	def initialize(color)
		super(color)


	end


	def get_possible_moves(protecting: false)
		i, j = @pos
		moves = []
		moves.push([i + 1, j]) if @color == "white" && @game.board[i+1][j].nil?
		moves.push([i - 1, j]) if @color == "black" && @game.board[i-1][j].nil?
		moves.push([i + 2, j]) if i == 1 && @color == "white" && @game.board[i+2][j].nil?
		moves.push([i - 2, j]) if i == 6 && @color == "black" && @game.board[i-2][j].nil?

		# Able to eat up right?
		moves.push([i + 1, j + 1]) if @color == "white" && !@game.board[i+1][j+1].nil? 

		# Able to eat up left?
		moves.push([i + 1, j - 1]) if @color == "white" && !@game.board[i+1][j-1].nil? 

		# Able to eat down right?
		moves.push([i - 1, j + 1]) if @color == "black" && !@game.board[i-1][j+1].nil?

		# Able to eat down left?
		moves.push([i - 1, j - 1]) if @color == "black" && !@game.board[i-1][j-1].nil?


		moves = moves.select {|move| valid_move?(move)}
		# return moves.select do |move|
		# 	square = @game.board[move[0]][move[1]]
		# 	!square.nil? && square.color == color ? false : true
		# end

		# Removes positions of allied pieces as the Pawn cannot move there.
		unless protecting
			moves = moves.select do |move|
				square = @game.board[move[0]][move[1]]
				!square.nil? && square.color == @color ? false : true
			end
		end


		# Includes allied piece positions that the Pawn protects but cannot move to.
		return moves
	end

end