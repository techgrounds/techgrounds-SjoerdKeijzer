#--------------- Rock - Paper - Scissors game -----------------------------------
# The player plays against a computer opponent typing either a letter (rps) or an entire word (rock paper scissors) to play their move.
# Create a function that checks whether the move is valid or not.
# Create another function to create a computer move.
# Create another function to check who wins the round.
# Finally, create a function that keeps track of the score.
# The game should be played in a predetermined number of rounds.

import random

# we start with a while loop so if we find this very fun, we can play again when entering 'y' at the prompt at the end
while True:

# user input and possible options
    player_input = input("Please submit your choice (rock, paper, scissors):  ")
    

# Create a function that checks whether the move is valid or not. If player input is a possible action, continue. If not, return error. 
    def valid_move(move):
        possible_actions = ['rock', 'paper', 'scissors']
        return move in possible_actions
    
# Create another function to create a computer move with random
    def computer_move():
        possible_actions = ['rock', 'paper', 'scissors']
        computer_choice = random.choice(possible_actions) 
        return computer_choice
    
    # print chosen values of both user and computer
    computer_action = computer_move
    player_action = valid_move
    print(f'\nYou have chosen {player_input} - Computer has chosen {computer_action}.')

# Create another function to check who wins the round - this works but could probably in a function 
    if player_input == computer_action:
        print(f"Both players selected {player_input}. It's a draw!")
    elif player_input == "rock":
        if computer_action == "scissors":
            print("Rock smashes scissors! You win!")
        else:
            print("Paper covers rock! You lose.")
    elif player_input == "paper":
        if computer_action == "rock":
            print("Paper covers rock! You win!")
        else:
            print("Scissors cuts paper! You lose.")
    elif player_input == "scissors":
        if computer_action == "paper":
            print("Scissors cuts paper! You win!")
        else:
            print("Rock smashes scissors! You lose.")

# function that keeps track of the score
    def update_score(winner, scores):
        if winner == "player":
            scores["player"] += 1
        elif winner == "computer":
            scores["computer"] += 1
        else:
             print()


                            
    play_again = input("\nPlay again? (y/n): ")
    if play_again.lower() != "y":   # need to fix this into something better because now even if you type 'yes' it will close the loop, lol. 
        break

# after coming out of the while loop
# we print thanks for playing
print("\nThanks for playing! Have a nice day.")