module Spec where

import           Data.List       (sort)
import           Lib
import           Test.QuickCheck

main = quickCheck tests

tests = qsortIsSorting

qsortIsSorting :: [Int] -> Bool
qsortIsSorting xs = undefined
