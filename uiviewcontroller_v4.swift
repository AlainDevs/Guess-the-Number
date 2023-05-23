@IBAction func guessButtonPressed(_ sender: UIButton) {
    // Get the user's guess from a text field
    guard let guess = Int(guessTextField.text ?? "") else {
        // If the user's guess is not a valid integer, show an error message and return
        showAlert(title: "Invalid Guess", message: "Please enter a valid integer.")
        return
    }
    
    // Check if the user's guess is correct
    if guess == secretNumber {
        // If the user's guess is correct, increment the score and show a success message
        score += 1
        showAlert(title: "Correct!", message: "You guessed the secret number!")
    } else {
        // If the user's guess is incorrect, decrement the lives and score (if the score is greater than zero) and show a failure message
        let isTooLow = guess < secretNumber
        lives -= 1
        score = max(0, score - 1)
        let message = "Sorry, your guess of \(guess) is too \(isTooLow ? "low" : "high"). You have \(lives) lives left."
        showAlert(title: "Incorrect", message: message)
    }
    
    // If the user has run out of lives, show a game over message and reset the score and lives
    if lives == 0 {
        showAlert(title: "Game Over", message: "You ran out of lives. Your score was \(score).")
        score = 0
        lives = 5
        generateSecretNumber()
    }

    // Clear the text field
    guessTextField.text = ""
}

func generateSecretNumber() {
    // Generate a random number between 1 and 100
    secretNumber = Int.random(in: 1...100)
}
