import           Data.List       (sort)
import           Lib
import           Test.QuickCheck

main = sequence_ tests

tests = [ longCheck qsortIsSorting
        , longCheck quicksortIsSortingInts
        , longCheck quicksortIsSortingDoubles
        , longCheck quicksortIsSortingChars
        , quickCheck quicksortIsSortingStrings
        ]
    where longCheck :: Testable prop => prop -> IO ()
          longCheck = quickCheckWith stdArgs { maxSuccess = 1000 }

qsortIsSorting :: [Int] -> Bool
qsortIsSorting xs = qsort xs == sort xs

quicksortIsSortingInts :: [Int] -> Bool
quicksortIsSortingInts xs = quicksort xs == sort xs

quicksortIsSortingDoubles :: [Double] -> Bool
quicksortIsSortingDoubles xs = quicksort xs == sort xs

quicksortIsSortingChars :: [Char] -> Bool
quicksortIsSortingChars xs = quicksort xs == sort xs

quicksortIsSortingStrings :: [String] -> Bool
quicksortIsSortingStrings xs = quicksort xs == sort xs
