
Dir["./lib/*.rb"].each {|file| require file unless file == "./lib/chess.rb"}

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
		@turn = "white"
		@game_over = false
		classical_setup()
	end


	def classical_setup()
		# White Pieces
		@board[1] = Array.new(8) {Pawn.new('white')}
		@board[0] = [Rook.new, Knight.new, Bishop.new, Queen.new, King.new, Bishop.new, 
			Knight.new, Rook.new]
		@board[0].each {|piece| piece.color=('white')}

		# Black Pieces
		@board[6] = Array.new(8) {Pawn.new('black')}
		@board[7] = [Rook.new, Knight.new, Bishop.new, Queen.new, King.new, Bishop.new, 
			Knight.new, Rook.new]
		@board[7].each {|piece| piece.color=('black')}

		# Initialize piece positions and create white piece / black piece lists
		for i in 0..7
			for j in 0..7
				if @board[i][j].class.superclass.name.downcase == "piece"
					next if @board[i][j].nil?
					@board[i][j].pos=([i, j])
					@board[i][j].game=(self)
					@white_pieces.push(@board[i][j]) if @board[i][j].color == "white" 
					@black_pieces.push(@board[i][j]) if @board[i][j].color == "black"
				end
			end
		end
	end



	
	def checkmate?() 
		# {Possible King moves} + {King position} is a subset of {Possible enemy moves} <=> Checkmate
		if @turn == "white" 
			king = (@black_pieces.select {|piece| piece.class.name.downcase == "king"})[0]
			king_moves = king.get_possible_moves() + king.pos
			danger = @white_pieces.reduce([]) {|accum, piece| accum += piece.get_possible_moves()}
			return true if (king_moves - danger).empty?
			return false
		else
			king = @white_pieces.select {|piece| piece.class.name.downcase == "king"}[0]
			king_moves = king.get_possible_moves() + king.pos
			danger = @black_pieces.reduce([]) {|accum, piece| accum += piece.get_possible_moves()}
			return true if (king_moves - danger).empty?
			return false
		end
	end	

	

	def move(start, final)
		p @white_pieces.length
		x1, y1 = start
		x2, y2 = final
		piece = @board[x1][y1]

		if !@board[x2][y2].nil?
			if @board[x2][y2].color == "white"
				@white_pieces.delete(@board[x2][y2])
			else
				@black_pieces.delete(@board[x2][y2])
			end
			p @white_pieces.length

		end

		@board[x1][y1] = nil
		@board[x2][y2] = piece
		piece.pos = ([x2, y2])

	end


	def play_game()
		until @game_over
			start, final = get_move()
			move(start, final)
			display_board()
			@game_over = true if checkmate?()
			"#{@turn} wins!" if @game_over
			@turn = @turn == "white" ? "black" : "white"
		end
	end

	def get_move()
		dict = {"A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6, "G" => 7, "H" => 8}

		puts "#{@turn}'s turn to play. Enter which piece you would like to move (Like E4)."
		to_move = gets.chomp.split('')
		to_move = [dict[to_move[0]], to_move[1]].map {|x| x.to_i - 1}
		to_move[0], to_move[1] = to_move[1], to_move[0]
		piece = @board[to_move[0]][to_move[1]]

		if piece.nil? || piece.color != @turn
			puts "You don't have a piece on that square! Try again."
			return get_move()
		elsif piece.get_possible_moves().empty?
			puts "That piece has no legal moves. Choose again."
			return get_move()
		end
			
		puts "Pieces position is #{piece.pos}"
		puts "Possible moves are #{piece.get_possible_moves()}"
		puts "Where do you want the #{piece.class.name} to move?"
		move = gets.chomp.split('')
		move = [dict[move[0]], move[1]].map {|x| x.to_i - 1}
		move[0], move[1] = move[1], move[0]

		if !piece.get_possible_moves().include?(move)
			puts "Sorry that's an illegal move. Try again."
			return get_move()
		end
		return to_move, move
	end

	def display_board()
		for i in 0..8
			for j in 0..7
				if i == 8 
					print("#{j} ")
					next
				end
				if @board[7-i][j].nil?
					print "  "
					next
				end
				piece = @board[7-i][j]
				print(@symbols["#{piece.color}_#{piece.class.name.downcase}".to_sym])
				print(" ")
			end
			puts "#{7-i}"
		end
	end



end



game = Chess.new()
game.display_board()
game.play_game()