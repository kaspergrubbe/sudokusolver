Sudokusolver
============

Commandline program and library for solving Sudoku puzzles

[![Build Status](https://travis-ci.org/kaspergrubbe/sudokusolver.svg?branch=master)](https://travis-ci.org/kaspergrubbe/sudokusolver)

## History

This software was translated from the python source code
obtained from Peter Norvig's website:

http://www.norvig.com/sudoku.html
http://www.norvig.com/sudo.py

Thank you to Peter Norvig for the original python source code,
algorithms and exceptionally clear explanations.

## Install

Add this to your `Gemfile`:

```ruby
gem 'sudokusolver'
```

And remember to `bundle`

## Usage

```ruby
require 'sudokusolver'

# The puzzle representation is simply the 9 rows of the Sudoku grid stringed together
# from top to bottom (periods representing blank squares)

puzzle = "4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......"
s = SudokuSolver.new
s.print_grid(s.search(s.parse_grid(puzzle)))
```
