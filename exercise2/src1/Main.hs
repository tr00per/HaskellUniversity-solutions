module Main where

import           Lib                (qsort)
import           System.Environment (getArgs)

main :: IO ()

main = do
    args <- getArgs
    let numbers = map read args
    print $ qsort numbers
