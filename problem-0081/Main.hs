import MyHelpers (wordsWhen)
import Debug.Trace (trace)
import GHC.IO (unsafePerformIO)


parse :: String -> [[Int]]
parse = map (map (read @Int) . wordsWhen (==',')) . lines


dp :: Int -> Int -> Int
dp = \row col -> table !! row !! col
    where
        table = [[ minPath i j | j <- [0..cols-1]] | i <- [0..rows-1]]
        rows = length matrix
        cols = length (head matrix)
        minPath 0 0 = head (head matrix)
        minPath 0 col' = dp 0 (col' - 1) + (matrix !! 0 !! col')
        minPath row' 0 = dp (row' - 1) 0 + (matrix !! row' !! 0)
        minPath row' col' = min (dp row' (col' - 1)) (dp (row' - 1) col') + (matrix !! row' !! col')
        matrix = parse $ unsafePerformIO $ readFile "./matrix.txt"

main :: IO ()
main = print (dp 79 79)