module Text
    def greetings_text
        puts "Greetings Captain."
        puts "As you can see, The Borg invites you to play Rock-Paper-Scissors-Lizard-Spock"
        puts "They want to define who gets the earth in this simple game..."
    end

    def rules_text
        puts <<-HEREDOC 

        Rules are quite simple, mon ami:
        1) The first one to get 5 points wins.
        2) Only 10 rounds, after that, the player with more points wins.
        
        Your weapons:
        1)Rock crushes scissors and crushes lizzard.
        2)Paper covers rock and disproves spock.
        3)Scissors cut paper and decapitate lizzard.
        4)Spock crush scissors and vaporize rock.
        5)Lizzard eats paper and poisons Spock.

        Choose wisely...


        HEREDOC
    end

    #methods text

    def answer_text
        puts "Write your weapon, Captain (rock,paper,scissors,spock,lizzard)."
    end

    def both_answers_text
        puts "Borg have choosen #{@answer_player2} vs #{@player1.name} has choosen #{@answer_player1}."
    end

    def player_wins_text(player)
        puts "#{player} wins this round" if player == @player1.name
        puts "#{player} win this round" if player == @player2.name
    end

    def points_text
        puts "#{@player2.name}: #{@player2.points} vs #{@player1.name}: #{@player1.points}"
    end

end