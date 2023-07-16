-Add ability to check if a row is filled
-Delete row if filled
-End game once blocks reach the top
-Add scoreboard
-Increase scoring when a row is deleted
-Add start screen
-Add end screen

Logic for board:
Have an array holding either a block or a blank space
have a function to go through and render each
Move every block down one cell each tick
if a row is full then delete every item in the row
