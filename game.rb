require_relative "text_module.rb"
require "pry"

class Players
    attr_reader :name
    attr_accessor :points
    def initialize (name)
        @name=name
        @points = 0
    end

end

class Game
    attr_reader :player1, :player2, :answer_player1, :answer_player2, :rounds
    include Text
    def initialize
        @player1= nil
        @player2= nil
        @answer_player1= ""
        @answer_player2= ""
        @rounds = 1
    end

    def random_number
        number= (rand*6).to_i
    end

    def computer_answer
        number = random_number
        case 
        when number == 0
            computer_answer
        when number == 1
            @answer_player2 = "rock"
        when number == 2
            @answer_player2 = "scissors"
        when number == 3
            @answer_player2 = "paper"
        when number == 4
            @answer_player2 = "spock"
        when number == 5
            @answer_player2 = "lizzard"
        end
    end

    def human_answer
        answer_text
        possible_answers = ["rock","paper","scissors","lizzard","spock"]
        @answer_player1 = gets.chomp.downcase
        if possible_answers.any? { |array_element| array_element == @answer_player1}
            @answer_player1
        else
            puts "Please refrase"
            human_answer
        end
    end

    def victory
        @player1.points == 5
    end

    def defeat
        @player2.points == 5
    end

    def end_of_rounds 
        @rounds == 10
    end

    def evaluation
        if @rounds == 10 && @player1.points < @player2.points
            puts "#{@player2.name} are the winners... resistence is futile."
        elsif @rounds == 10 && @player2.points < @player1.points
            puts "You have save the day Captain #{@player1.name}. Live long and prosper."
        elsif victory 
            puts "You have save the day Captain #{@player1.name}. Live long and prosper."
        elsif defeat
            puts "#{@player2.name} are the winners... resistence is futile."
        end
    end

    def create_player
        puts "How should I call you Captain?"
        name = gets.chomp
        player = Players.new(name)
    end

    def create_borg
        player = Players.new("The borg")
    end

    def update_score_human
        @player1.points += 1
    end

    def update_score_borg
        @player2.points +=1
    end

    def update_rounds
        @rounds += 1
    end

    def reset 
        @player1.points = 0
        @player2.points = 0
        @rounds = 1
    end

    #compound methods

    def creating_players
        @player1=create_player
        @player2=create_borg
    end

    def game_prep
        greetings_text
        rules_text
        creating_players
    end

    def answer_evaluation
        ans1 = @answer_player1
        ans2 = @answer_player2
        case
        when ans1 == "rock" && (ans2=="lizzard" ||ans2=="scissors")
            update_score_human
            player_wins_text(@player1.name)
        when ans1 == "scissors" && (ans2=="paper"||ans2=="lizzard")
            update_score_human
            player_wins_text(@player1.name)
        when ans1 =="paper" && (ans2=="rock"||ans2=="spock")
            update_score_human
            player_wins_text(@player1.name)
        when ans1 == "lizzard" && (ans2=="spock"||ans2=="paper")
            update_score_human
            player_wins_text(@player1.name)
        when ans1 == "spock" && (ans2=="rock"||ans2=="scissors")
            update_score_human
            player_wins_text(@player1.name)
        when ans2 =="rock" && (ans1=="lizzard" || ans1=="scissors")
            update_score_borg
            player_wins_text(@player2.name)
        when ans2 =="paper" && (ans1== "spock"|| ans1=="rock")
            update_score_borg
            player_wins_text(@player2.name)
        when ans2 =="scissors" && (ans1== "paper"|| ans1=="lizzard")
            update_score_borg
            player_wins_text(@player2.name)
        when ans2 =="lizzard" && (ans1== "spock"|| ans1=="paper")
            update_score_borg
            player_wins_text(@player2.name)
        when ans2 =="spock" && (ans1== "rock"|| ans1=="scissors")
            update_score_borg
            player_wins_text(@player2.name)
        when ans2 == ans1
            puts "This is a tie."
        end
    end


    def turns
        loop do
        computer_answer
        human_answer
        both_answers_text
        answer_evaluation
        update_rounds
        points_text
        evaluation
        break if end_of_rounds
        break if defeat
        break if victory
        end
    end

end