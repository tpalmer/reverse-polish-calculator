## reverse-polish-calculator

The calculator is composed of two classes responsible for driving the business
logic:  

RPNCalculator::Calculator - The public interface, also contains input parsing
                            logic

RPNCalculator::Stack - The main business logic lives here, and is responsible
                       for performing the operations parsed by
                       RPCalculator::Calculator

Each class is composed of relatively small methods, making them easy to test.
The business logic in the Calculator class takes advantage of the Array#map
method which is a performant method of enumerating across the collection, and
converting the passed in input into the respective symbol/token.

The business logic in the Stack class relies on the Array#reduce method, which
is a straightforward, performant method of processing the last two elements on
the stack.

In the interest of time, I have not provided a convenient user-facing interface
to the underlying business logic.  The next step would be to create a CLI that
makes it easier for the user, so they don't have to write a script or use a REPL
in order to access the calculator.  I also would have liked to have added
persistence to the stack, currently it's not designed for multiple calls to
Calculator#calculate.

Using the Calculator class:

```
calculator = RPNCalculator::Calculator.new
calculator.calculate("2 2 +")
```

Running the specs:

```
bundle install
rake
```
