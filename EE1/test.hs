sublists :: [a] -> [[a]]
sublists [] = [[]]
sublists (x:xs) = [x: ys | ys <- sublists xs] ++ sublists xs