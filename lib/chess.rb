
require './lib/*.rb'

class Chess

	def initialize()
		@board = Array.new(8) {Array.new(8)}
		classical_setup()
	end


	def classical_setup()
		# White Pieces
		@board[1] = Array.new(8, Pawn.new('white'))
		@board[0] = [Rook.new, Knight.new, Bishop.new, Queen.new, King.new, Bishop.new, 
			Knight.new, Rook.new]
		@board[0].each {|piece| piece.color=('white')}

		# Black Pieces
		@board[6] = Array.new(8, Pawn.new('black'))
		@board[7] = [Rook.new, Knight.new, Bishop.new, Queen.new, King.new, Bishop.new, 
			Knight.new, Rook.new]
		@board[7].each {|piece| piece.color=('black')}
	end


	def display_board()
		for i in 0..7
			for j in 0..7
				print(@board[i][j].symbol)
			end
			puts
		end


	end

end


