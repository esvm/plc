{-
    Resolução da questão 2 de PLC
    Autor: Edjan Michiles
    Data: 10/10/2018
-}

--questão 1
--letra A (com recursão)
fRecursive :: [Int] -> [Int] 
fRecursive [] = []
fRecursive (x:[]) = []
fRecursive (x:list)
    | x == head list = x : fRecursive (list)
    | otherwise = fRecursive (list)

--letra B (sem recursão)
f :: [Int] -> [Int]
f (x:xs) = [x | x == head xs] 
