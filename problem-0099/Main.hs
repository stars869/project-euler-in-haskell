{-# LANGUAGE TypeApplications #-}
import Data.List (elemIndex)
import GHC.Float (int2Float)
import MyHelpers (wordsWhen)
import Control.Arrow ((&&&))

parse :: String -> [(Int, Int)]
parse = map parsePair . lines
    where
        parsePair = (read @Int . head &&& read @Int . last) . wordsWhen (==',')

solve :: [(Int, Int)] -> Maybe Int
solve l = elemIndex maxoflist loglist where
    loglist = map (\(x, y) -> int2Float y * log (int2Float x)) l :: [Float]
    maxoflist = maximum loglist :: Float

main :: IO ()
main = readFile "./0099_base_exp.txt" >>= print . solve . parse