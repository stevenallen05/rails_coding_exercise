Simple coding exercises for job interview pair sessions.

Uses ruby 2.4.1 and Rails 5.1 with Rspec. Guard is configured for simplicity.

### Challenges


#### FizzBuzz

Everyone knows [FizzBuzz](http://wiki.c2.com/?FizzBuzzTest).

Flesh out `generate_fizzbuzz` in `FizzBuzzHelper` so that they pass the specs in `spec/helpers/fizz_buzz_helper_spec.rb`.

#### Fibonacci

Simple Fibonacci sequences.

Flesh out `generate_fibonacci` and `generate_fibonacci_array` in `FibonacciHelper` so that they pass the specs in `spec/helpers/fibonacci_helper_spec.rb`.

#### Performance

`Payment#get_average` simply fetches all payments and calculates the average `purchase_price`. But it's really, really slow.

To pass the model specs, `improved_get_average` should do the same thing at least 6 orders of magnitude faster.

#### Refactoring

`payments_controller.rb` has full spec coverage, but the `create` and `update` methods are sloppy with their field validation. They should be refactored so that they still pass the tests.