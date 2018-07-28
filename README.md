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

Future changes would be to further refine the user interaction, and make things
more intuitive. It also would be nice to have full test coverage on the CLI
logic, so I'd probably pull out some of that logic into a separate class so it's
more testable.

Using the Calculator:

```
ruby calculator.rb

'q' to quit
'c' to clear stack
's' to view stack
> 1
1
> 2
2
> +
3.0
> s
Stack: 3.0
> q
```

Running the specs:

```
bundle install
rake
```
