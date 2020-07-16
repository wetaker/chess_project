
require './lib/*.rb'

class Chess

	def initialize()
		@board = Array.new(8) {Array.new(8)}
		@symbols = {:white_king => "\u2654", :white_queen =>"\u2655", :white_rook => "\u2656",
			:white_bishop => "\u2657", :white_knight => "\u2658", :white_pawn => "\u2659", 
			:black_king => "\u265A", :black_queen => "\u265B", :black_rook => "\u265C", 
			:black_bishop => "\u265D", :black_knight => "\u265E", :black_pawn => "\u265F"}
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
				piece = @board[i][j]
				print(@symbols["#{piece.color}_#{piece.class.name.downcase}".to_sym])
			end
			puts
		end


	end

end


