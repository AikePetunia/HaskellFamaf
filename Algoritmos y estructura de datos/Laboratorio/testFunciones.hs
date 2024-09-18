varD :: [Int] -> Bool
varD [] = False
varD (x:y:xs) = (x == y + 1) && varD (y:xs)  