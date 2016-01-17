sudokusolver_ng
============

Commandline program and library for solving Sudoku puzzles

[![Build Status](https://travis-ci.org/kaspergrubbe/sudokusolver_ng.svg?branch=master)](https://travis-ci.org/kaspergrubbe/sudokusolver_ng)

## History

This software was translated from the python source code obtained from Peter Norvig's website:

http://www.norvig.com/sudoku.html
http://www.norvig.com/sudo.py

Thank you to Peter Norvig for the original python source code, algorithms and exceptionally clear explanations.

All this work was done by Martin-Louis Bright, and then gemified and converted to Ruby 1.9 by Kasper Grubbe. The original project is called "sudokusolver" and is available from Rubygems here: https://rubygems.org/gems/sudokusolver, this is a fork moved to Github.

## Install

Add this to your `Gemfile`:

```ruby
gem 'sudokusolver_ng'
```

And remember to `bundle`

## Usage

```ruby
require 'sudokusolver_ng'

# The puzzle representation is simply the 9 rows of the Sudoku grid stringed together
# from top to bottom (periods representing blank squares)

puzzle = "4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......"
s = SudokuSolverNg.new
s.print_grid(s.search(s.parse_grid(puzzle)))
```
