module Main where

import           Data.Maybe         (listToMaybe, mapMaybe)
import           Lib                (quicksort)
import           System.Environment (getArgs)

main :: IO ()

main = do
    args <- getArgs
    let numbers :: [Integer]
        numbers = mapMaybe maybeRead args
    if null numbers
        then print $ quicksort args
        else print $ quicksort numbers

-- from Network.CGI.Protocol
maybeRead :: Read a => String -> Maybe a
maybeRead = fmap fst . listToMaybe . reads
