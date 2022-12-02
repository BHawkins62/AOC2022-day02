# Day 2
# written in Julia

# Part One

open("input.txt") do file
    total_score = 0
    choice =  Dict([('X', 1), ('Y', 2), ('Z', 3)])
    for play  ∈ eachline(file)
        score1 = choice[last(play)]
        if (play ∈ ["C X", "A Y", "B Z"])   # wins
            score2 = 6
        elseif (play ∈ ["A X", "B Y", "C Z"])  # ties
            score2 = 3
        else
            score2 = 0   # losses
        end
        total_score += (score1 + score2)
    end
    println(total_score)
end

# Part Two

open("input.txt") do file
    total_score = 0
    choices = ['A', 'B', 'C']
    choice =  Dict([('A', 1), ('B', 2), ('C', 3)])
    for play  ∈ eachline(file)
        instruction = last(play)
        opponent = first(play)
        index_of_opponent = choice[opponent]
        if (instruction == 'X')    # losses
            score2 = 0
            score1 = choice[choices[mod1(index_of_opponent + 2, end)]]
        elseif (instruction == 'Y')   # ties
            score2 = 3
            score1 = choice[opponent]
        else     # wins
            score2 = 6
            score1 = choice[choices[mod1(index_of_opponent + 1, end)]]
        end
        total_score += (score1 + score2)
    end
    println(total_score)
end