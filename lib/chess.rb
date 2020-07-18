
Dir["./lib/*.rb"].each {|file| require file }

class Chess
	attr_accessor :board
	def initialize()
		@board = Array.new(8) {Array.new(8)}
		@black_pieces = []
		@white_pieces = []
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

		# Initialize piece positions and create white piece / black piece lists
		for i in 0..7
			for j in 0..7
				if @board[i][j].class.superclass.name.downcase == "piece"
					next if @board[i][j].nil?
					@board[i][j].pos=([i, j])
					@white_pieces.push(@board[i][j]) if @board[i][j].color == "white" 
					@black_pieces.push(@board[i][j]) if @board[i][j].color == "black"
				end
			end
		end
	end


	def display_board()
		for i in 0..7
			for j in 0..7
				next if @board[7-i][j].nil?
				piece = @board[7-i][j]
				print(@symbols["#{piece.color}_#{piece.class.name.downcase}".to_sym])
				print(" ")
			end
			puts ' '
		end


	end
end

game = Chess.new()
puts "test"
game.display_board()
p game.board[1][0].class


