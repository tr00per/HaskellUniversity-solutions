module Main where

import           Control.Monad (forever)

main :: IO ()
main = forever greeting

greeting = do
    putStrLn "Hello, what is your name?"
    name <- getLine
    putStrLn $ "Nice to meet you, " ++ name
