module Main where

import           Data.List          (intercalate)
import           Lib                (fizzbuzz)
import           System.Environment (getArgs)

main :: IO ()
main = do
  num:_ <- getArgs
  let raw = fizzbuzz (read num)
  putStrLn $ intercalate ", " raw
