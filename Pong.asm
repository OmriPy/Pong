;Omri Lustig
IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
;	For the game itself
	ScreenBounds dw 3 ; used to check collisions early
	BallX dw 11 ; current X position of the ball
	BallY dw 11 ; current Y position of the ball
	ResettedBallPositionXIfPlayer1Won dw 30 ; the resetted X value of the ball if player 1 won the previous round
	ResettedBallPositionYIfPlayer1Won dw 11 ; the resetted Y value of the ball if player 1 won the previous round
	ResettedBallPositionXIfPlayer2Won dw 290 ; the resetted X value of the ball if player 2 won the previous round
	ResettedBallPositionYIfPlayer2Won dw 11 ; the resetted Y value of the ball if player 2 won the previous round
	BallSize dw 4 ; size of the ball - both X and Y
	BallVelocityX dw 5 ; X (horizontal) velocity of the ball
	BallVelocityY dw 2 ; Y (vertical) velocity of the ball
	PaddleLeftX dw 10 ; current X position of the left paddle
	PaddleLeftY dw 10 ; current Y position of the left paddle
	PaddleRightX dw 304 ; current X position of the right paddle
	PaddleRightY dw 10 ; current Y position of the right paddle
	PaddlesWidth dw 5 ; the width of both paddles
	PaddlesHeight dw 31 ; the height of both paddles
	PaddlesVelocity dw 6 ; the velocity of both paddles
	PaddleRightYCase1 dw 3 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is below 28
	PaddleRightYCase2 dw 16 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 22 to 41
	PaddleRightYCase3 dw 29 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 35 to 54
	PaddleRightYCase4 dw 42 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 48 to 67
	PaddleRightYCase5 dw 55 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 61 to 80
	PaddleRightYCase6 dw 68 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 74 to 93
	PaddleRightYCase7 dw 81 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 87 to 106
	PaddleRightYCase8 dw 94 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 100 to 119
	PaddleRightYCase9 dw 107 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 113 to 132
	PaddleRightYCase10 dw 120 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 126 to 145
	PaddleRightYCase11 dw 133 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 139 to 158
	PaddleRightYCase12 dw 148 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 152 to 171
	PaddleRightYCase13 dw 159 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 165 to 184
	PaddleRightYCase14 dw 166 ; the Y of the right paddle if it is controlled by the computer and if the Y of the ball is between 172 to 191
;	User Interface
	LeftPaddlePlayerScore db 0 ; current points of the left player
	RightPaddlePlayerScore db 0 ; current points of the right player
	Player1 db 'Player 1:$' ; the text "Player 1:"
	Player2 db 'Player 2:$' ; the text "Player 2:"
	Computer db 'Computer:$' ; the text "Computer:"
	WinnerNumber db ? ; the number of the player who won. Left player is player 1 and the right player is player 2.
	Player db 'Player:$' ; text shown in the UI if the chosen mode is PVE.
;	Boolean variables
	IsPVEorPVP db ? ; a boolean like variable that tells if the chosen mode is PVE or PVP. 1 means PVE and 2 means PVP.
	Player1WonRound db ? ; a boolean like variable that tells if player 1 won the previous round
	StartOfGame db ? ; a boolean like variable that determines whether the game has just started or not
	VersusComputerDifficulty dw ? ; a boolean like variable that determines what the difficulty against the computer will be. 1 means easy, 2 means hard and 3 means IMPOSSIBLE.
	GameActive db 1 ; if the game is active then GameActive is 1. Else, it's 0. like a boolean variable
	ExitingProgram db 0 ; a boolean like variable that tells if the user wants to exit the game or not.
	RightPaddleControlledByAI db 0 ; a boolean like variable that tells if the right paddle is controlled by the AI.
	CurrentScene db 0 ; 0 means the main menu and 1 means the game. Boolean
	IsPVEEasyOrNot db ? ; 0 means that the chosen mode is NOT PVP Easy. 1 means the chosen mode IS PVP Easy.
;	Texts
	TextLeftPaddlePlayerScore db '0$' ; displayed text of left paddle player's score
	TextRightPaddlePlayerScore db '0$' ; displayed text of right paddle player's score
	TextGameOverTitle db 'Game Over!$' ; the game over title
	TextGameOverWinnerPVP db 'Player 1 Won!$' ; shows which player won in PVP
	TextGameOverWinnerPVEComputer db 'The Computer Won!$' ; shown if the computer has won
	TextGameOverWinnerPVEPlayer db 'The Player Won!$' ; shown if the player has won
	TextGameOverPlayAgain db 'Press Enter to play again.$' ; message shown asking if the players want to play again
	TextGameOverMainMenu db 'Press ESC to exit to main menu.$' ; contains the text shown on the game over screen asking if the player would like to go to the main menu.
	TextMainMenuTitle db 'Main Menu:$' ; the title of the main menu screen
	TextMainMenuSingleplayer db ' - For PVE mode press 1.$' ; message shown describing the user what to do in order to play single player
	TextMainMenuMultiplayer db ' - For PVP mode press 2.$' ; message shown describing the user what to do in order to play multi player
	TextMainMenuTutorial db ' - For the tutorial press T.$' ; the text shown telling the user to press T to go to the tutorial
	TextMainMenuExitProgram db 'To exit the program press ESC.$' ; message shown telling the user what to do in order to exit the game
	TextTutorialMenuTitle db 'Tutorial Menu:$'; the title shown in the tutorial menu
	TextTutorialMenuPVE db 'In PVE, the computer handles the', 0Ah, '     right paddle and the user handles', 0Ah, '     the left paddle.', 0Ah, '     Press W to move the paddle up',0Ah, '     and S to move it down.$' ; the text explaining the PVE mode
	TextTutorialMenuPVP db 'In PVP, there are two users.', 0Ah, '     If you are Player 1, the buttons', 0Ah, '     are the same as PVE.', 0Ah, '     For Player 2, in order to move', 0Ah, '     the paddle up press the up arrow', 0Ah, '     and to move it down press the', 0Ah, '     down arrow.$' ; the text explaining the PVP mode
	TextBackToMainMenu db 'Back to Main Menu press ESC.$' ; telling the user that if he wants to go back to the main menu he needs to press ESC
	TextMessage1 db 'Game Paused$' ; the first part of the text displayed on the screen when the message is shown
	TextMessage2 db 'Are you sure you want$' ; the second part of the text displayed on the screen when the message is shown
	TextMessage3 db 'to quit the game?$' ; the third part of the text displayed on the screen when the message is shown
	TextMessage4 db 'Press Y/Enter to quit.$' ; the fourth part of the text displayed on the screen when the message is shown
	TextMessage5 db 'Press N/ESC to continue playing.$' ; the fifth part of the text displayed on the screen when the message is shown
	Text1DifficultyLevelScreen db 'Choose difficulty level:$' ; telling the user what this screen is for
	Text2DifficultyLevelScreen db ' - Easy: press 1.$' ; telling the user to press 3 if he prefers easy difficulty
	Text3DifficultyLevelScreen db ' - Hard: press 2.$' ; telling the user to press 2 if he prefers hard difficulty
	Text4DifficultyLevelScreen db ' - IMPOSSIBLE: press 3.$' ; telling the user to press 1 if he prefers impossible difficulty
;	Variables used as parameters
	ChosenInitialX dw ? ; The initial X parameter given to the procedures: PrintChosenRectangle & PrintChosenFrame
	ChosenInitialY	dw ? ; The initial Y parameter given to the procedures: PrintChosenRectangle & PrintChosenFrame
	ChosenHeight dw ? ; The height parameter given to the procedures: PrintChosenRectangle & PrintChosenFrame
	ChosenWidth dw ? ; The width parameter given to the procedures: PrintChosenRectangle & PrintChosenFrame
	ChosenColor db ? ; The color parameter given to the procedures: PrintChosenRectangle & PrintChosenFrame
	ChosenThickness dw ? ; The thickness parameter given to the procedure: PrintChosenFrame
; Others
	TimeAux db 0 ; used when checking if time has passed
CODESEG
proc DrawBall
	mov ax, [BallX]
	mov [ChosenInitialX], ax
	mov ax, [BallY]
	mov [ChosenInitialY], ax
	mov ax, [BallSize]
	mov [ChosenHeight], ax
	mov [ChosenWidth], ax
	mov [ChosenColor], 0Fh
	call PrintChosenRectangle
	ret
endp DrawBall
proc ClearScreen ; Credits to my friend for giving me this procedure
	mov ah, 2h
	xor dx, dx
	xor bh, bh
	int 10h
	mov cx, 18h
ClearScreen_1:
	push cx
	mov cx, 28h
ClearScreen_2:
	mov dl, ' '
	mov ah, 2h
	int 21h
	loop ClearScreen_2
	pop cx
	mov dl, 0Ah
	mov ah, 2h
	int 21h
	loop ClearScreen_1
	ret
endp ClearScreen
proc PaintLeftPaddleBlack
	mov ax, [PaddleLeftX]
	mov [ChosenInitialX], ax
	mov ax, [PaddleLeftY]
	mov [ChosenInitialY], ax
	mov ax, [PaddlesHeight]
	mov [ChosenHeight], ax
	mov ax, [PaddlesWidth]
	mov [ChosenWidth], ax
	mov [ChosenColor], 0
	call PrintChosenRectangle
	ret
endp PaintLeftPaddleBlack
proc PaintRightPaddleBlack
	mov ax, [PaddleRightX]
	mov [ChosenInitialX], ax
	mov ax, [PaddleRightY]
	mov [ChosenInitialY], ax
	mov ax, [PaddlesHeight]
	mov [ChosenHeight], ax
	mov ax, [PaddlesWidth]
	mov [ChosenWidth], ax
	mov [ChosenColor], 0
	call PrintChosenRectangle
	ret
endp PaintRightPaddleBlack
proc PaintBallBlack
	mov ax, [BallX]
	mov [ChosenInitialX], ax
	mov ax, [BallY]
	mov [ChosenInitialY], ax
	mov ax, [BallSize]
	mov [ChosenHeight], ax
	mov [ChosenWidth], ax
	mov [ChosenColor], 0
	call PrintChosenRectangle
	ret
endp PaintBallBlack
proc MoveBall
;	All the next lines until the label comtinue are to check if the ball is where the bug occures
	mov ax, [PaddleLeftX]
	add ax, [PaddlesWidth]
	inc ax
	cmp [BallX], ax
	jb test1
	jmp Comtinue
test1:
	mov ax, [ScreenBounds]
;	inc ax
	cmp [BallY], ax
	jb test2
	jmp Comtinue
test2:
	mov ax, 1
Comtinue:
	mov ax, [BallVelocityX]
	add [BallX], ax ; move the ball horizontally
	mov ax, [PaddleLeftX]
	add ax, [PaddlesWidth]
	cmp [BallX], ax
	jl JumpToAddAPointToRightPlayerAndResetPosition
	mov ax, [PaddleRightX]
	sub ax, [BallSize]
	cmp [BallX], ax
	jg JumpToAddAPointToLeftPlayerAndResetPosition
	mov ax, [BallVelocityY]
	add [BallY], ax ; move the ball vertically
	mov ax, [ScreenBounds]
	cmp [BallY], ax
	jl JumpToNegVelocityY
	mov ax, 200
	sub ax, [BallSize]
	sub ax, [ScreenBounds]
	cmp [BallY], ax
	jg JumpToNegVelocityY
	jmp FirstCondition
JumpToAddAPointToLeftPlayerAndResetPosition:
	jmp AddAPointToLeftPlayerAndResetPosition
JumpToAddAPointToRightPlayerAndResetPosition:
	jmp AddAPointToRightPlayerAndResetPosition
JumpToNegVelocityY:
	jmp NegVelocityY
;	Checking if the ball is colliding with the right paddle
;	The conditions:
;	BallX + BallSize > PaddleRightX && BallX < PaddleRightX + PaddlesWidth
;	&& BallY + BallSize > PaddleRightY && BallY < PaddleRightY + PaddlesHeight
FirstCondition:
	mov ax, [BallX]
	add ax, [BallSize]
	cmp ax, [PaddleRightX] ; if there is no collision
	jl CheckCollisionWithLeftPaddle ; check for the left paddle collisions
;Second condition:
	mov ax, [PaddleRightX]
	add ax, [PaddlesWidth]
	cmp [BallX], ax ; if there is no collision
	jg CheckCollisionWithLeftPaddle ; check for the left paddle collisions
;Third condition:
	mov ax, [BallY]
	add ax, [BallSize]
	cmp ax, [PaddleRightY] ; if there is no collision
	jl CheckCollisionWithLeftPaddle ; check for the left paddle collisions
;Forth condition:
	mov ax, [PaddleRightY]
	add ax, [PaddlesHeight]
	cmp [BallY], ax ; if there is no collision
	jg CheckCollisionWithLeftPaddle ; check for the left paddle collisions
;	if it reaches this point, the ball is colliding with the right paddle.
	neg [BallVelocityX] ; reverses the horizontal velocity of the ball
	ret
;	Checking if the ball is colliding with the left paddle
CheckCollisionWithLeftPaddle:
;	The conditions:
;	BallX + BallSize > PaddleLeftX && BallX < PaddleLeftX + PaddlesWidth
;	&& BallY + BallSize > PaddleLeftY && BallY < PaddleLeftY + PaddlesHeight
;First condition:
	mov ax, [BallX]
	add ax, [BallSize]
	cmp ax, [PaddleLeftX] ; if there is no collision
	jl JumpToExitProcedure ; exit the procedure
;Second condition:
	mov ax, [PaddleLeftX]
	add ax, [PaddlesWidth]
	cmp [BallX], ax ; if there is no collision
	jg JumpToExitProcedure ; exit the procedure
;Third condition:
	mov ax, [BallY]
	add ax, [BallSize]
	cmp ax, [PaddleLeftY] ; if there is no collision
	jl JumpToExitProcedure ; exit the procedure
;Forth condition:
	mov ax, [PaddleLeftY]
	add ax, [PaddlesHeight]
	cmp [BallY], ax ; if there is no collision
	jg JumpToExitProcedure ; exit the procedure
;	if it reaches this point, the ball is colliding with the left paddle.
	neg [BallVelocityX] ; reverses the horizontal velocity of the ball
	ret
JumpToExitProcedure:
	jmp ExitProcedure
AddAPointToLeftPlayerAndResetPosition:
	inc [LeftPaddlePlayerScore]
	mov [Player1WonRound], 1
	call ResetBallPosition
	call UpdateLeftPaddlePlayerScore ; updating the score displayed of the left paddle player's score
	cmp [LeftPaddlePlayerScore], 5 ; checking if the left paddle player's score is 5
	je GameOver ; if it is 5 or more, jump to GameOver
	ret
AddAPointToRightPlayerAndResetPosition:
	inc [RightPaddlePlayerScore]
	mov [Player1WonRound], 0
	call ResetBallPosition
	call UpdateRightPaddlePlayerScore ; updating the score displayed of the right paddle player's score
	cmp [RightPaddlePlayerScore], 5 ; checking if the right paddle player's score is 5
	je GameOver ; if it is 5 or more, jump to GameOver
	ret
GameOver: ; setting the scores to zero
	cmp [LeftPaddlePlayerScore], 5 ; Checking which player has won
	je Player1Won
	jmp Player2Won
Player1Won:
	mov [WinnerNumber], 1
	jmp ContinueGameOver
Player2Won:
	mov [WinnerNumber], 2
ContinueGameOver:
	call NewGame
	mov [GameActive], 0 ; GameActive is 0 which means the game is not active (over)
	ret
NegVelocityY:
	neg [BallVelocityY]
ExitProcedure:
	ret
endp MoveBall
proc ResetBallPosition
	cmp [StartOfGame], 0
	je MiddleGame
; Start of game
	mov [BallVelocityX], 5
	mov [BallVelocityY], 2
	mov ax, [ResettedBallPositionXIfPlayer1Won]
	mov [BallX], ax
	mov ax, [ResettedBallPositionYIfPlayer1Won]
	mov [BallY], ax
	ret
MiddleGame:
	cmp [Player1WonRound], 0
	je RightPlayerWonRound
; Left player won round
	mov [BallVelocityX], 5
	mov [BallVelocityY], 2
	mov ax, [ResettedBallPositionXIfPlayer1Won]
	mov [BallX], ax
	mov ax, [ResettedBallPositionYIfPlayer1Won]
	mov [BallY], ax
	ret
RightPlayerWonRound:
	mov [BallVelocityX], -5
	mov [BallVelocityY], 2
	mov ax, [ResettedBallPositionXIfPlayer2Won]
	mov [BallX], ax
	mov ax, [ResettedBallPositionYIfPlayer2Won]
	mov [BallY], ax
	ret
endp ResetBallPosition
proc ResetPaddlesPosition
	mov [PaddleLeftY], 85
	mov [PaddleRightY], 85
	ret
endp ResetPaddlesPosition
proc NewGame
	mov [LeftPaddlePlayerScore], 0 ; setting the left paddle player's scores to zero
	mov [RightPaddlePlayerScore], 0 ; setting the right paddle player's scores to zero
	call UpdateLeftPaddlePlayerScore
	call UpdateRightPaddlePlayerScore
	call ResetBallPosition
	call ResetPaddlesPosition
	ret
endp NewGame
proc DrawPaddles
; Paddle left
	mov ax, [PaddleLeftX]
	mov [ChosenInitialX], ax
	mov ax, [PaddleLeftY]
	mov [ChosenInitialY], ax
	mov ax, [PaddlesHeight]
	mov [ChosenHeight], ax
	mov ax, [PaddlesWidth]
	mov [ChosenWidth], ax
	mov [ChosenColor], 0Fh
	call PrintChosenRectangle
; Paddle right
	mov ax, [PaddleRightX]
	mov [ChosenInitialX], ax
	mov ax, [PaddleRightY]
	mov [ChosenInitialY], ax
	mov ax, [PaddlesHeight]
	mov [ChosenHeight], ax
	mov ax, [PaddlesWidth]
	mov [ChosenWidth], ax
	mov [ChosenColor], 0Fh
	call PrintChosenRectangle
	ret
endp DrawPaddles
proc MovePaddles
; Left paddle
; Checking if any key is pressed. If not, we check the other paddle.
	mov ah, 1
	int 16h
	jz CheckRightPaddleMovement
; Checking which key is pressed. al = ascii character
	xor ah, ah
	int 16h
	cmp al, 'w'
	je MoveLeftPaddleUp
	cmp al, 'W'
	je MoveLeftPaddleUp
	cmp al, 's'
	je MoveLeftPaddleDown
	cmp al, 'S'
	je MoveLeftPaddleDown
	cmp al, 01Bh
	je JumpToMessageAskingIfQuit
	jmp CheckRightPaddleMovement
JumpToMessageAskingIfQuit:
	jmp MessageAskingIfQuit
MoveLeftPaddleUp:
	call FlushBuffer
	call PaintLeftPaddleBlack
	mov ax, [PaddlesVelocity]
	sub [PaddleLeftY], ax
	mov ax, [ScreenBounds]
	cmp [PaddleLeftY], ax
	jl FixPaddleLeftTopPosition
	jmp CheckRightPaddleMovement
FixPaddleLeftTopPosition:
	mov ax, [ScreenBounds]
	mov [PaddleLeftY], ax
	jmp CheckRightPaddleMovement
MoveLeftPaddleDown:
	call FlushBuffer
	call PaintLeftPaddleBlack
	mov ax, [PaddlesVelocity]
	add [PaddleLeftY], ax
	mov ax, 200
	sub ax, [ScreenBounds]
	sub ax, [PaddlesHeight]
	cmp [PaddleLeftY], ax
	jg FixPaddleLeftBottomPosition
	jmp CheckRightPaddleMovement
FixPaddleLeftBottomPosition:
	mov [PaddleLeftY], ax
; Right paddle
CheckRightPaddleMovement:
	cmp [RightPaddleControlledByAI], 1
	je AIControlsRightPaddle
; when the paddle is controlled by the user pressing a key
	cmp ah, 048h ; up arrow
	je JumpToMoveRightPaddleUp ; if it is up arrow, move up.
	cmp ah, 050h ; down arrow
	je JumpToMoveRightPaddleDown ; if it is down arrow, move down.
	ret
JumpToMoveRightPaddleUp:
	jmp MoveRightPaddleUp
JumpToMoveRightPaddleDown:
	jmp MoveRightPaddleDown
AIControlsRightPaddle: ; When the right paddle is controlled by the AI
	cmp [VersusComputerDifficulty], 3
	je InvincibleComputer
; Easily beaten computer
; Checking if the ball is above the paddle.
	mov ax, [BallY]
	add ax, [BallSize]
	cmp ax, [PaddleRightY]
	jl JumpToMoveRightPaddleUp
; Checking if the ball is below the paddle.
	mov ax, [PaddleRightY]
	add ax, [PaddlesHeight]
	cmp ax, [BallY]
	jl JumpToMoveRightPaddleDown
	ret
InvincibleComputer:
; Case 1
	cmp [BallY], 28
	jl JumpToCase1
; Case 2
	mov ax, 22
	cmp [BallY], ax
	jl JumpToExitProcedure2
	mov ax, 41
	cmp [BallY], ax
	jl JumpToCase2
; Case 3
	mov ax, 35
	cmp [BallY], ax
	jl JumpToExitProcedure2
	mov ax, 54
	cmp [BallY], ax
	jl JumpToCase3
	jmp ContinueToCase4
JumpToExitProcedure2:
	jmp ExitProcedure2
JumpToCase1:
	jmp Case1
JumpToCase2:
	jmp Case2
JumpToCase3:
	jmp Case3
JumpToCase4:
	jmp Case4
JumpToCase5:
	jmp Case5
JumpToCase6:
	jmp Case6
ContinueToCase4:
	mov ax, 48
	cmp [BallY], ax
	jl JumpToExitProcedure2
	mov ax, 67
	cmp [BallY], ax
	jl JumpToCase4
; Case 5
	mov ax, 61
	cmp [BallY], ax
	jl JumpToExitProcedure2
	mov ax, 80
	cmp [BallY], ax
	jl JumpToCase5
; Case 6
	mov ax, 74
	cmp [BallY], ax
	jl JumpToExitProcedure2
	mov ax, 93
	cmp [BallY], ax
	jl JumpToCase6
; Case 7
	mov ax, 87
	cmp [BallY], ax
	jl JumpTo2ExitProcedure2
	mov ax, 106
	cmp [BallY], ax
	jl JumpToCase7
; Case 8
	mov ax, 100
	cmp [BallY], ax
	jl JumpTo2ExitProcedure2
	mov ax, 119
	cmp [BallY], ax
	jl JumpToCase8
	jmp ContinueToCase9
JumpTo2ExitProcedure2:
	ret
JumpToCase7:
	jmp Case7
JumpToCase8:
	jmp Case8
JumpToCase9:
	jmp Case9
JumpToCase10:
	jmp Case10
ContinueToCase9:
	mov ax, 113
	cmp [BallY], ax
	jl JumpTo2ExitProcedure2
	mov ax, 132
	cmp [BallY], ax
	jl JumpToCase9
; Case 10
	mov ax, 126
	cmp [BallY], ax
	jl JumpTo2ExitProcedure2
	mov ax, 145
	cmp [BallY], ax
	jl JumpToCase10
; Case 11
	mov ax, 139
	cmp [BallY], ax
	jl JumpTo3ExitProcedure2
	mov ax, 158
	cmp [BallY], ax
	jl JumpToCase11
	jmp ContinueToCase12
JumpToCase11:
	jmp Case11
JumpToCase12:
	jmp Case12
JumpToCase13:
	jmp Case13
JumpToCase14:
	jmp Case14
ContinueToCase12:
	mov ax, 152
	cmp [BallY], ax
	jl JumpTo3ExitProcedure2
	mov ax, 171
	cmp [BallY], ax
	jl JumpToCase12
; Case 13
	mov ax, 165
	cmp [BallY], ax
	jl JumpTo3ExitProcedure2
	mov ax, 184
	cmp [BallY], ax
	jl JumpToCase13
; Case 14
	mov ax, 172
	cmp [BallY], ax
	jl JumpTo3ExitProcedure2
	mov ax, 191
	cmp [BallY], ax
	jl JumpToCase14
JumpTo3ExitProcedure2:
	ret
Case1:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase1]
	mov [PaddleRightY], ax
	ret
Case2:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase2]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case3:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase3]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case4:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase4]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case5:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase5]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case6:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase6]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case7:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase7]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case8:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase8]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case9:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase9]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case10:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase10]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case11:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase11]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case12:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase12]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case13:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase13]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
Case14:
	call PaintRightPaddleBlack
	mov ax, [PaddleRightYCase14]
	mov [PaddleRightY], ax
	call DrawPaddles
	ret
JumpToMoveLeftPaddleUp:
	jmp MoveLeftPaddleUp
JumpToMoveLeftPaddleDown:
	jmp MoveLeftPaddleDown
JumpToMoveRightPaddleDown2:
	jmp MoveRightPaddleDown
MoveRightPaddleUp:
	call FlushBuffer
	call PaintRightPaddleBlack
	mov ax, [PaddlesVelocity]
	sub [PaddleRightY], ax
	cmp [IsPVEorPVP], 1
	je IsPVE1
	jmp ContinueToCheckings1
IsPVE1:
	cmp [IsPVEEasyOrNot], 1
	je IsPVEEasy1
	jmp IsPVEHard1
IsPVEEasy1:
	sub [PaddleRightY], 2
	jmp ContinueToCheckings1
IsPVEHard1:
	sub [PaddleRightY], 5
ContinueToCheckings1:
	mov ax, [ScreenBounds]
	cmp [PaddleRightY], ax
	jl FixPaddleRightTopPosition
	ret
FixPaddleRightTopPosition:
	mov ax, [ScreenBounds]
	mov [PaddleRightY], ax
	ret
MoveRightPaddleDown:
	call FlushBuffer
	call PaintRightPaddleBlack
	mov ax, [PaddlesVelocity]
	add [PaddleRightY], ax
	cmp [IsPVEorPVP], 1
	je IsPVE2
	jmp ContinueToCheckings2
IsPVE2:
	cmp [IsPVEEasyOrNot], 1
	je IsPVEEasy2
	jmp IsPVEHard2
IsPVEEasy2:
	add [PaddleRightY], 2
	jmp ContinueToCheckings2
IsPVEHard2:
	add [PaddleRightY], 6
ContinueToCheckings2:
	add [PaddleRightY], 2
	mov ax, 200
	sub ax, [ScreenBounds]
	sub ax, [PaddlesHeight]
	cmp [PaddleRightY], ax
	jg FixPaddleRightBottomPosition
	ret
FixPaddleRightBottomPosition:
	mov [PaddleRightY], ax
	ret
MessageAskingIfQuit:
	call ClearScreen
	mov [ChosenInitialX], 20
	mov [ChosenInitialY], 50
	mov [ChosenColor], 4
	mov [ChosenHeight], 100
	mov [ChosenWidth], 280
	mov [ChosenThickness], 4
	call PrintChosenFrame
	mov ax, [ChosenThickness]
	add [ChosenInitialX], ax
	add [ChosenInitialY], ax
	mov [ChosenColor], 8
	sub [ChosenHeight], ax
	sub [ChosenHeight], ax
	sub [ChosenWidth], ax
	sub [ChosenWidth], ax
	call PrintChosenRectangle
; Part 1 of the sentence:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 7 ; setting row
	mov dl, 14 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextMessage1
	int 21h
; Part 2 of the sentence:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 10 ; setting row
	mov dl, 9 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextMessage2
	int 21h
; Part 3 of the sentence:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 12 ; setting row
	mov dl, 11 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextMessage3
	int 21h
; Part 4 of the sentence:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 14 ; setting row
	mov dl, 8 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextMessage4
	int 21h
; Part 5 of the sentence:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 16 ; setting row
	mov dl, 4 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextMessage5
	int 21h
InputFromKeyboard1:
	xor ah, ah
	int 16h
; Checking which key was pressed
	cmp al, 'Y'
	je ExitToMainMenu
	cmp al, 'y'
	je ExitToMainMenu
	cmp ah, 01Ch
	je ExitToMainMenu
	cmp al, 'N'
	je ExitProcedure2
	cmp al, 'n'
	je ExitProcedure2
	cmp al, 01Bh
	je ExitProcedure2
	jmp InputFromKeyboard1
ExitToMainMenu:
	call PrintMainMenu
	ret
ExitProcedure2:
	call ClearScreen
	ret
endp MovePaddles
proc UI
	cmp [IsPVEorPVP], 1
	je PVE
	jmp PVP
PVE:
; Printing player
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 1 ; setting row
	mov dl, 8 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset Player
	int 21h
; Printing computer
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 1 ; setting row
	mov dl, 25 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset Computer
	int 21h
	jmp TheScores
PVP:
; Printing player 1
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 1 ; setting row
	mov dl, 7 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset Player1
	int 21h
; Printing player 2
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 1 ; setting row
	mov dl, 25 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset Player2
	int 21h
TheScores:
; Left player
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 3 ; setting row
	mov dl, 11 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextLeftPaddlePlayerScore
	int 21h
; Right player
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 3 ; setting row
	mov dl, 29 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextRightPaddlePlayerScore
	int 21h
	ret
endp UI
proc UpdateLeftPaddlePlayerScore
	mov al, [LeftPaddlePlayerScore]
	add al, 30h
	mov [TextLeftPaddlePlayerScore], al
	ret
endp UpdateLeftPaddlePlayerScore
proc UpdateRightPaddlePlayerScore
	mov al, [RightPaddlePlayerScore]
	add al, 30h
	mov [TextRightPaddlePlayerScore], al
	ret
endp UpdateRightPaddlePlayerScore
proc PrintGameOverScreen
	call ClearScreen
; Printing title
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 4 ; setting row
	mov dl, 15 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextGameOverTitle
	int 21h
; Showing which player won:
	cmp [IsPVEorPVP], 1
	je PVECase2
	jmp PVPCase2
PVECase2:
	cmp [WinnerNumber], 1
	je PlayerWon
	jmp ComputerWon
PlayerWon:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 11 ; setting row
	mov dl, 13 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextGameOverWinnerPVEPlayer
	int 21h
	jmp DisplayingThePlayAgainMessage
ComputerWon:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 11 ; setting row
	mov dl, 12 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextGameOverWinnerPVEComputer
	int 21h
	jmp DisplayingThePlayAgainMessage
PVPCase2:
	call UpdateWinnerText
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 11 ; setting row
	mov dl, 14 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextGameOverWinnerPVP
	int 21h
DisplayingThePlayAgainMessage:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 14 ; setting row
	mov dl, 7 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextGameOverPlayAgain
	int 21h
; Showing the go to main menu message:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 16 ; setting row
	mov dl, 5 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextGameOverMainMenu
	int 21h
; Waiting for a key to be pressed
InputFromKeyboard2:
	xor ah, ah
	int 16h
	cmp ah, 01Ch ; if the key that was pressed is Enter
	je RestartGame ; then restart the game
	cmp al, 01Bh ; if the key that was pressed is ESC
	je GoToMainMenu ; then go to the main menu
	jmp InputFromKeyboard2
RestartGame:
	mov [StartOfGame], 1
	mov [GameActive], 1
	call NewGame
	call ClearScreen
	ret
GoToMainMenu:
	mov [GameActive], 0
	mov [CurrentScene], 0
	ret
endp PrintGameOverScreen
proc UpdateWinnerText
	mov al, [WinnerNumber]
	add al, 30h
	mov [TextGameOverWinnerPVP + 7], al
	ret
endp UpdateWinnerText
proc PrintMainMenu
	call ClearScreen
; Showing the main menu screen texts:
; Displaying the title
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 3 ; setting row
	mov dl, 5 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextMainMenuTitle
	int 21h
; Displaying the single player option:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 7 ; setting row
	mov dl, 2 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextMainMenuSingleplayer
	int 21h
; Displaying the multi player option:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 10 ; setting row
	mov dl, 2 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextMainMenuMultiplayer
	int 21h
; Displaying the Tutorial screen option:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 13 ; setting row
	mov dl, 2 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextMainMenuTutorial
	int 21h
; Displaying the exit game option:
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 20 ; setting row
	mov dl, 5 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextMainMenuExitProgram
	int 21h
InputFromKeyboard3:
	xor ah, ah
	int 16h
; Single player
	cmp al, 31h ; if the key that was pressed is 1
	je SinglePlayer ; then start the single player mode
; Multi player
	cmp al, 32h ; if the key that was pressed is 2
	je MultiPLayer ; then start the multi player mode
; Tutorial
	cmp al, 't'  ; if the key that was pressed is s
	je Tutorial ; then go to tutorial
	cmp al, 'T'  ; if the key that was pressed is S
	je Tutorial ; then go to tutorial
; Exit
	cmp al, 01Bh ; if the key that was pressed is ESC
	je ExitGame ; then exit
	jmp InputFromKeyboard3
SinglePlayer:
	mov [IsPVEorPVP], 1
	mov [StartOfGame], 1
	mov [CurrentScene], 1
	mov [RightPaddleControlledByAI], 1
	call NewGame
	mov [StartOfGame], 0
	call DifficultyLevelScreen
	call ClearScreen
	ret
MultiPLayer:
	mov [IsPVEorPVP], 2
	mov [StartOfGame], 1
	mov [CurrentScene], 1
	mov [GameActive], 1
	mov [RightPaddleControlledByAI], 0
	call NewGame
	mov [StartOfGame], 0
	call ClearScreen
	ret
Tutorial:
	call PrintTutorialMenu
	ret
ExitGame:
	mov [ExitingProgram], 1
	ret
endp PrintMainMenu
proc ConcludeExitProgram
	mov ax, 2
	int 10h
	mov ah, 04Ch ; terminate program
	int 21h
endp ConcludeExitProgram
proc DifficultyLevelScreen
	call ClearScreen
; Printing the texts:
; Title
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 3 ; setting row
	mov dl, 5 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset Text1DifficultyLevelScreen
	int 21h
; easy
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 7 ; setting row
	mov dl, 2 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset Text2DifficultyLevelScreen
	int 21h
; Hard
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 10 ; setting row
	mov dl, 2 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset Text3DifficultyLevelScreen
	int 21h
; IMPOSSIBLE
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 13 ; setting row
	mov dl, 2 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset Text4DifficultyLevelScreen
	int 21h
; Back to main menu
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 20 ; setting row
	mov dl, 5 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextBackToMainMenu
	int 21h
InputFromKeyboard4:
	xor ah, ah
	int 16h
	cmp al, 31h
	je EasyDifficulty
	cmp al, 32h
	je HardDifficulty
	cmp al, 33h
	je ImpossibleDifficulty
	cmp al, 01Bh
	je BackToMainMenu1
	jmp InputFromKeyboard4
EasyDifficulty:
	mov [StartOfGame], 1
	mov [GameActive], 1
	mov [VersusComputerDifficulty], 1
	mov [IsPVEEasyOrNot], 1
	call NewGame
	mov [StartOfGame], 0
	ret
HardDifficulty:
	mov [StartOfGame], 1
	mov [GameActive], 1
	mov [VersusComputerDifficulty], 2
	mov [IsPVEEasyOrNot], 0
	call NewGame
	mov [StartOfGame], 0
	ret
ImpossibleDifficulty:
	mov [StartOfGame], 1
	mov [GameActive], 1
	mov [VersusComputerDifficulty], 3
	mov [IsPVEEasyOrNot], 0
	call NewGame
	mov [StartOfGame], 0
	ret
BackToMainMenu1:
	call PrintMainMenu
	ret
endp DifficultyLevelScreen
proc PrintTutorialMenu
	call ClearScreen
; Printing the texts:
; Title
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 3 ; setting row
	mov dl, 5 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextTutorialMenuTitle
	int 21h
; Explanations
; PVE
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 5 ; setting row
	mov dl, 5 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextTutorialMenuPVE
	int 21h
; PVP
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 11 ; setting row
	mov dl, 5 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextTutorialMenuPVP
	int 21h
; Back to main menu
	mov ah, 2 ; setting cursor position
	xor bh, bh
	mov dh, 20 ; setting row
	mov dl, 5 ; setting column
	int 10h
	mov ah, 9
	mov dx, offset TextBackToMainMenu
	int 21h
InputFromKeyboard5:
	xor ah, ah
	int 16h
	cmp al, 01Bh
	je BackToMainMenu2
	jmp InputFromKeyboard5
BackToMainMenu2:
	call PrintMainMenu
	ret
endp PrintTutorialMenu
proc PrintChosenRectangle
	mov cx, [ChosenInitialX]
	mov dx, [ChosenInitialY]
Rectangle:
	mov ah, 0Ch
	mov al, [ChosenColor]
	xor bh, bh
	int 10h
	inc cx
	mov ax, [ChosenInitialX]
	add ax, [ChosenWidth]
	cmp cx, ax
	jb Rectangle
	mov cx, [ChosenInitialX]
	inc dx
	mov ax, [ChosenInitialY]
	add ax, [ChosenHeight]
	cmp dx, ax
	jb Rectangle
	ret
endp PrintChosenRectangle
proc PrintChosenFrame
; Left side
	mov cx, [ChosenInitialX]
	mov dx, [ChosenInitialY]
Frame1:
	mov ah, 0Ch
	mov al, [ChosenColor]
	xor bh, bh
	int 10h
	inc cx
	mov ax, [ChosenInitialX]
	add ax, [ChosenThickness]
	cmp cx, ax
	jb Frame1
	inc dx
	mov cx, [ChosenInitialX]
	mov ax, [ChosenInitialY]
	add ax, [ChosenHeight]
	cmp dx, ax
	jb Frame1
; Right side
	mov cx, [ChosenInitialX]
	add cx, [ChosenWidth]
	sub cx, [ChosenThickness]
	mov dx, [ChosenInitialY]
Frame2:
	mov ah, 0Ch
	mov al, [ChosenColor]
	xor bh, bh
	int 10h
	inc cx
	mov ax, [ChosenInitialX]
	add ax, [ChosenWidth]
	cmp cx, ax
	jb Frame2
	mov cx, [ChosenInitialX]
	add cx, [ChosenWidth]
	sub cx, [ChosenThickness]
	inc dx
	mov ax, [ChosenInitialY]
	add ax, [ChosenHeight]
	cmp dx, ax
	jb Frame2
; Upper side
	mov cx, [ChosenInitialX]
	add cx, [ChosenThickness]
	mov dx, [ChosenInitialY]
Frame3:
	mov ah, 0Ch
	mov al, [ChosenColor]
	xor bh, bh
	int 10h
	inc cx
	mov ax, [ChosenInitialX]
	add ax, [ChosenWidth]
	sub ax, [ChosenThickness]
	cmp cx, ax
	jb Frame3
	mov cx, [ChosenInitialX]
	add cx, [ChosenThickness]
	inc dx
	mov ax, [ChosenInitialY]
	add ax, [ChosenThickness]
	cmp dx, ax
	jb Frame3
; Lower side
	mov cx, [ChosenInitialX]
	add cx, [ChosenThickness]
	mov dx, [ChosenInitialY]
	add dx, [ChosenHeight]
	sub dx, [ChosenThickness]
Frame4:
	mov ah, 0Ch
	mov al, [ChosenColor]
	xor bh, bh
	int 10h
	inc cx
	mov ax, [ChosenInitialX]
	add ax, [ChosenWidth]
	sub ax, [ChosenThickness]
	cmp cx, ax
	jb Frame4
	mov cx, [ChosenInitialX]
	add cx, [ChosenThickness]
	inc dx
	mov ax, [ChosenInitialY]
	add ax, [ChosenHeight]
	cmp dx, ax
	jb Frame4
	ret
endp PrintChosenFrame
proc FlushBuffer
	mov ax, 0C00h
	int 21h
	ret
endp FlushBuffer
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your main code here
; --------------------------
; Graphic mode
	mov ax, 13h
	int 10h
CheckTime: ; Time checking loop
	cmp [ExitingProgram], 1
	je ExitProgram
	cmp [CurrentScene], 0
	je GoToMainMenuProcedure
	cmp [GameActive], 0
	je GameOverScreen
	mov ah, 2Ch ; system time
	int 21h
	cmp dl, [TimeAux]
	je CheckTime ; if time (milliseconds) has not passed, check again
;	if time (milliseconds) has passed, then continue.
	mov [TimeAux], dl ; updating time
	call MovePaddles
	call DrawPaddles
	call PaintBallBlack
	call MoveBall
	call DrawBall
	mov [ChosenInitialX], 0
	mov [ChosenInitialY], 2
	mov [ChosenHeight], 196
	mov [ChosenWidth], 320
	mov [ChosenColor], 15
	mov [ChosenThickness], 1
	call PrintChosenFrame
	call UI
	jmp CheckTime ; after everything, checks time again
GameOverScreen:
	call PrintGameOverScreen
	jmp CheckTime
GoToMainMenuProcedure:
	call PrintMainMenu
	jmp CheckTime
ExitProgram:
	call ConcludeExitProgram
exit:
	mov ax, 4c00h
	int 21h
END start