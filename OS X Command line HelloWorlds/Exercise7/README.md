## Exercise #7.  

This is just Helloworld. 

## Task description.

# Prerequisites:

* There is the hierarchy for a carwash from [the task #6][1]

# Task.

Realize couples of asynchronous methods that meet the following conditions:
* All the logic of transitions implemented in the Worker class;
* the logic of transitions must meet the following requirements:
	a. There is the methods that can be reloaded that always would be performed in a background thread or the main thread.
	b. This methods provide the logic of transitions between the threads.
	c. When processing is finished it should switch to main thread and notify to observers about it finished working.
	d. Children classes should realize the logic of data processing in main and background threads and no transitions between threads.  


[1]: ../Exercise6
