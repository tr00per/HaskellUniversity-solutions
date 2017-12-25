module Lib where

import           Data.List (foldl')

qsort :: [Int] -> [Int]
qsort [] =
    []
qsort (x:xs) =
    qsort lessthan ++ [x] ++ qsort nolessthan
  where
    (lessthan, nolessthan) = foldl' splitter ([], []) xs
    splitter (less, noless) a = if a < x then (a:less, noless) else (less, a:noless)

quicksort :: Ord a => [a] -> [a]
quicksort  [] =
    []
quicksort (x:xs) =
    quicksort lessthan ++ [x] ++ quicksort nolessthan
  where
    (lessthan, nolessthan) = foldl' splitter ([], []) xs
    splitter (less, noless) a = if a < x then (a:less, noless) else (less, a:noless)

fizzbuzz :: Int -> [String]
fizzbuzz = undefined
