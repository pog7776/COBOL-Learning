       program-id. SinTest.

       environment division.
       configuration section.

       data division.
       working-storage section.

       01  AMPLITUDE PIC 9(4) VALUE 50.
       01  OFFSET PIC 9(4) VALUE 1.
       01  ITERATIONS PIC 9(4) VALUE 1000.
       
       01  DECIMAL-VAL PIC S99V9(5) VALUE 0.0.
       01  DEC-CALCULATED PIC S99V9(5).
       01  ROUND-INT PIC 9(4).

       01  SPACE-COUNTER PIC 9(4) VALUE 0.

       01  MESSAGE-STRING  pic x(5)  value "COBOL".

       linkage section.

       procedure division.

           PERFORM ITERATIONS TIMES

      *>       Calculate spaces needed
               COMPUTE DEC-CALCULATED = FUNCTION SIN (DECIMAL-VAL)
               COMPUTE DEC-CALCULATED = DEC-CALCULATED + OFFSET
               COMPUTE DEC-CALCULATED = DEC-CALCULATED * AMPLITUDE
               COMPUTE DEC-CALCULATED ROUNDED = DEC-CALCULATED
      
      *>       Round to int so we can use it as a counter
               COMPUTE ROUND-INT = DEC-CALCULATED

      *>       Reset counter and loop for all needed spaces
               COMPUTE SPACE-COUNTER = 0
               PERFORM UNTIL SPACE-COUNTER = ROUND-INT
      *>           NO ADVANCING to stop new line
                   DISPLAY " " NO ADVANCING
                   ADD 1 TO SPACE-COUNTER
               END-PERFORM

                 DISPLAY MESSAGE-STRING
      *>         DISPLAY DEC-CALCULATED
               
               COMPUTE DECIMAL-VAL = DECIMAL-VAL + 0.1
           END-PERFORM.
           
           goback.

       end program SinTest.
