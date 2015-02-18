## Exercise #6.  

This is just Helloworld. 

## Task description.

# Prerequisites:

* There is the hierarchy for a carwash from [the task #5][1].

#Task.

Create a handler dispatcher that matches the following requirements:
* it has an object queue to handle;
* it has an handler array. The handlers can be busy or ready to working;
* when new object is passed to handle the dispatcher must pass the object to the handler, if there is idle handler then add the object to the queue for further processing;
* it observes states of the handlers.

[1]: ../Exercise5

