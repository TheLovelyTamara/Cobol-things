  identification division.
   program-id. hangman.

   data division.
   working-storage section.
   01 word                             pic X(100).
   01 word-length                      pic 9(3).
   01 guess                            pic X.
   01 FILLER.
      88  clear-to-no-guesses          VALUE ZERO.
      05  FILLER occurs 256 times.
          10  FILLER                   PIC X.
              88  letter-guessed       VALUE "1".
   01 FILLER                           pic X.
      88  done                         VALUE "Q".
      88  done-not                     VALUE "7".
   01 FILLER                           pic X.
      88  no-missing-letters           VALUE ":".
      88  missing-letter               VALUE "3".
   01 i                                pic 9(3).

   procedure division.
  * TODO: pick random word from word list
       move "hello"               to word
       move 5                     to word-length

  * TODO: show this in debug mode only
       display "word: " word

       set clear-to-no-guesses    TO TRUE
       set done-not               TO TRUE

       perform until done
           accept guess
           SET letter-guessed 
                ( function ord ( guess ) )
                                  TO TRUE
           SET no-missing-letters TO TRUE
           MOVE ZERO              TO i
           perform 
             word-length TIMES
               add 1              TO i
               if letter-guessed 
                   ( function ord ( word ( i : 1 ) ) ) 
                   display word ( i : 1 ) with no advancing
               else
                   SET missing-letter
                                  TO TRUE
                   display "_" with no advancing
               end-if
           end-perform
           display " "
           if no-missing-letters
               SET done           TO TRUE
           end-if
       end-perform
       goback
       .
