## Exercise #5.  

This is just Helloworld. 

## Task description.

# Prerequisites:

* There is the hierarchy for a carwash from [the Exercise #4][1] with additional restrictions.
* There are one director and one accountant. The director and accountant can do one operation at a time.
* The director, accountant and washers must perform operations in a background queue and make notifications in the main queue. 

# The cash flow is

* A washer take a car.
* The washer washes the car.
* The washer receives a payment.
* The washer notifies to observers about she finished the working.
* The accountant observes washer.
* When the accountant receives the washer notification she takes the money from washer.
* The washer notifies about she is ready for new working.
* The accountant counts the money and notifies to the director about she is finished.
* The director make a profit.    

[1]: ../Exercise4

