puts 'Welcome, what\'s your name?'
name = gets.chomp
puts "#{name}! What a lovely name! I bet you suck at blackjack though <3"
human_win = 0
dealer_win = 0

while true
	array = ['Ace','Ace','Ace','Ace',2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 'Jack', 'Jack', 'Jack', 'Jack', 'Queen', 'Queen', 'Queen', 'Queen', 'King', 'King', 'King', 'King']
	array.shuffle!
	player_card = []
	dealer_card = []
	player_sum = 0
	dealer_sum = 0
	hos = 0

	2.times do
		player_card << array.pop
		dealer_card << array.pop
	end

	def sum_method (input)
		sum = 0
		repetition = 0
		input.each do |value|
			if value == 'Ace'
				sum += 11
			elsif value.to_i == 0
				sum = sum + 10
			else 
				sum = sum + value
			end
		end

		repetition = input.select{|value| value == 'Ace'}.count
		repetition.times do
			if sum > 21
				sum -= 10
			end
		end 


		return sum
	end

	while true
		dealer_sum = sum_method dealer_card
		player_sum = sum_method player_card

		puts "Dealer has #{dealer_card.join(', ')} the total is #{sum_method dealer_card}"
		puts "Player has #{player_card.join(', ')} the total is #{sum_method player_card}"
		if player_sum >= 21 || dealer_sum >= 21
			break
		end

		#asks for a decision
		puts "Type in 1) hit 2) stay"
		while true
			hit_or_stay = gets.chomp.to_i
			if hit_or_stay == 1
				puts 'You choose to hit'
				player_card << array.pop
				break
			elsif hit_or_stay == 2
				puts 'You choose to stay'
				hos = 2
				break
			else
				puts 'invalid input, please type in 1 or 2'
				next
			end
		end
		if hos == 2
			break
		end
	end
	if hos == 2
		while dealer_sum < 17
			dealer_card << array.pop
			dealer_sum = sum_method dealer_card
			puts "Dealer has #{dealer_card.join(', ')} the total is #{sum_method dealer_card}"
			puts "Player has #{player_card.join(', ')} the total is #{sum_method player_card}"
		end
	end

	if player_sum == 21
		puts 'You win'
		human_win += 1
	elsif dealer_sum == 21
		puts 'You lose'
		dealer_win += 1
	elsif dealer_sum > 21
		puts 'You win'
		human_win += 1
	elsif player_sum > 21
		puts 'You lose'
		dealer_win += 1
	elsif player_sum > dealer_sum
		puts 'You win'
		human_win += 1
	elsif dealer_sum > player_sum
		puts 'You lose'
		dealer_win += 1
	elsif dealer_sum == player_sum
		puts 'it\'s a tie!'	
	end

	puts 'Do you want to play again 1) yes 2) no'
	input_answer = 0
	while true
		input = gets.chomp.to_i
		if input == 1
			input_answer = 1
			break
		elsif input == 2
			input_answer = 2
			break
		else
			puts 'Invalid input please type 1 or 2'
			next
		end
	end
	if input_answer == 1
		puts "Total #{name} win: #{human_win}"
		puts "Total dealer win: #{dealer_win}"
		next
	elsif input_answer == 2
		break
	end

end

puts 'Thankyou for playing!'
puts "Total #{name} win: #{human_win}"
puts "Total dealer win: #{dealer_win}"


