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

       01  MESSAGE-STRING  pic x(5)  value "COBOL".

       linkage section.

       procedure division.

           PERFORM ITERATIONS TIMES

      *>       Calculate spaces needed
               COMPUTE DEC-CALCULATED = FUNCTION SIN (DECIMAL-VAL)
               ADD OFFSET TO DEC-CALCULATED
               MULTIPLY AMPLITUDE BY DEC-CALCULATED
      
      *>       Round to int so we can use it as a counter
      *>       Literally just jamming the decimal number into an int
      *>       I don't know if this is bad
               COMPUTE ROUND-INT = DEC-CALCULATED

      *>       Loop for all needed spaces
               PERFORM ROUND-INT TIMES
      *>           NO ADVANCING to stop new line
                   DISPLAY " " NO ADVANCING
               END-PERFORM

               DISPLAY MESSAGE-STRING
      *>       DISPLAY DEC-CALCULATED
               
               ADD 0.1 TO DECIMAL-VAL
           END-PERFORM.
           
           goback.

       end program SinTest.
