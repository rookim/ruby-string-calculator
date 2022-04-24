# **Ruby Terminal String Calculator**

## **Overview**

This simple program was inspired by an online assessment I took. It takes in a string input (a mathematical expression) from the user via the gets.chomp() method and calculates it. The output depends on what the expression is (mixed fraction, fraction, integer), but it is in a string format.

There are some rules!

1. There must be a space between digits and mathematical symbols. For example, a user would enter "1 + 1" and not "1+1".
2. Mixed fractions must be entered using "\_" to separate the whole number from fraction. For example, 1_3/4, 15_1/2.
3. You do not need to add quotation marks when entering your mathematical expression. The gets.chomp() method only takes in strings.

Through this program, I learned about Ruby Rational class! Rationals are yet another object available in the Ruby programming language. Rationals are basically what most of us know as fractions and offer a way of representing exact numbers without any rounding errors.

A real-life scenario that rationals can be very useful in is of course this calculator program I built. Another use-case is in baking! You would definitely NOT say 0.5214667 cups of flour, would you? That would certainly be ridiculous!

## **How To Use**

If you would like, you are more than welcome to fork this repository and test it out in your personal terminal!

## **Demo**

For your convenience, I've embedded a video demo of my string calculator in action! Take a look :)

https://vimeo.com/702616598/f449552d8d
