import           Data.List       (sort)
import           Lib
import           Test.QuickCheck

main = sequence_ tests

tests = [ longCheck qsortIsSorting
        , longCheck quicksortIsSortingInts
        , longCheck quicksortIsSortingDoubles
        , longCheck quicksortIsSortingChars
        , quickCheck quicksortIsSortingStrings
        , quickCheck fizzbuzzGeneratesGivenNumberOfStrings
        , quickCheck fizzbuzzCountMachesUp
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

fizzbuzzGeneratesGivenNumberOfStrings :: Int -> Property
fizzbuzzGeneratesGivenNumberOfStrings x = x >= 0 ==> length (fizzbuzz x) == x

fizzbuzzCountMachesUp :: Int -> Property
fizzbuzzCountMachesUp x =
    let
        target = fizzbuzz x
        foundFizz = length $ filter (=="Fizz") target
        foundBuzz = length $ filter (=="Buzz") target
        foundFizzBuzz = length $ filter (=="Fizz Buzz") target
        div3count = x `div` 3
        div5count = x `div` 5
        div3and5count = x `div` (3*5)
    in
        x >= 0 ==> conjoin
            [ foundFizz === div3count - div3and5count
            , foundBuzz === div5count - div3and5count
            , foundFizzBuzz === div3and5count
            ]
