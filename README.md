```
              ::::::::  :::::::::::  
             :+:    :+: :+:     :+:  
                  +:+         +:+    
               +#+          +#+      
            +#+           +#+        
          #+#           #+#          
         ##########     ###          

Terminal App // Pen & Paper Strategy Game

```


# 27

## About

27 was created with the goal of making a fun and challenging game that could be played on pen and paper,
but also online, as a simple free game. It's quite similar to other 3D variations of Naughts & Crosses, with
the unique characteristic of being points-based, making for longer and more complex gameplay.

## How to play

The aim of Twenty-Seven is to earn points by making combinations of Flats, Pillars and Stairs. When all 27 squares
are full, the player with the most points is the winner.

To play, imagine a game similar to Naughts & Crosses but in a 3D space, represented by 3 game boards.
The top-most board, Board 3, represents the highest plane; and the bottom-most board, Board 1, represents the lowest plane.
Board 2 represents the middle plane.

```
board 3

| | | |
| | | |
| | | |

board 2

| | | |
| | | |
| | | |

board 1

| | | |
| | | |
| | | |
```
Players take turns placing their respective tokens on the board, attempting to make combinations of 3; both, on a single plane, and across 
multiple planes. Players may only place tokens on higher planes if the same square is occupied on the lower plane.
(Imagine the tokens are being stacked.)

Unlike Naughts & Crosses, the game does not end when a single combintation is made. Instead, the player is awarded points for the combination
and the game continues until every square has been filled or one of the players forfeits.

## Combinations & Points

### Flats

#### Example:
3 tokens are placed in a flat row, straight or diagonal, across the board; this is called
a "flat" and is awarded 3 points.

```
| | | |
| | | |
| | | |


| | | |
| | | |
| | | |


| | | |
| | | |
|o|o|o| = 3 points

   __ _ _
  /_/_/_/\
 /_/_/_/\/\
/_/_/_/\/\/\
\_\_\_\/\/\/
 \_\_\_\/\/
  \o\o\o\/

```

### Pillars

#### Example:
3 tokens are stacked on top of each other; this is called a "pillar" and is 
awarded 2 points.

```
| | | |
| | | |
| | |x|


| | | |
| | | |
| | |x|


| | | |
| | | |
| | |x| = 2 points

   __ _ _
  /_/_/_/\
 /_/_/_/\/\
/_/_/_/\/\/\
\_\_\x\/\/\/
 \_\_\x\/\/
  \_\_\x\/

```

### Stairs

#### Example:
3 tokens are stacked from one side of the board to the opposite, and from 
the bottom plane to the top; this is called "stairs" and is awarded 2 points. 


```
| | | |
| | | |
|x| | |


| | | |
| | | |
|o|x| |


| | | |
| | | |
|o|o|x| = 2 points       
     
   __ _ _
  /_/_/_/\
 /_/_/_/\/\
/_/_/_/\/\/\
\x\_\_\/\/\/
 \o\x\_\/\/
  \o\o\x\/

```

### Diamond Stairs

3 tokens are stacked diagonally from one corner to the opposite, and from the 
bottom plane to the top. This is called "diamond stairs" and is awarded 1 point.


```
|x| | |
| | | |
| | | |


|o| | |
| |x| |
| | | |


|o| | |
| |o| |
| | |x| = 1 point

   __ 
  /x/\ _ _
  \_\/_/_/\
  /_/x/_/\/\
 /_/\_\_\/\/
 \_\/_/x/\/
  \_\_\_\/

```

## ILLEGAL MOVES


This is an illegal move. Notice that the x's are not stacked on anything.

```
| | | |
| | | |
|x| | |


| | | |
| | | |
| |x| |


| | | |
| | | |
| | |x| = 1 point
  
   __ _ _
  /_/_/_/\
 /_/_/_/\/\
/_/_/_/\/\/\
\x\_\_\/\/\/
   \x\_\/\/
 !    \x\/

```


## KEEPING TALLY

When playing on pen and paper, it's best practice to tally your own score
as you go. 

A good house rule is that if you fail to notice a combination before your next turn, 
then you miss out on the points. Either way, tallying up points at the end of 
the game is an arduous task, and not recommended.

