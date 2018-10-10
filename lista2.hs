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
f (x:xs) = [x | (x, y) <- zip (x:xs) xs, x == y] 

--questão 2
ehPar :: Int -> Bool 
ehPar x = mod x 2 == 0

inRange :: Int -> Bool
inRange x = x >= 0 && x <= 100

g :: [Int] -> Bool
g [] = True
g (x:xs) 
    | x > 0 && x <= 100 = ehPar x && g xs
    | otherwise = g xs

g2 :: [Int] -> Bool
g2 list = foldr (&&) True (map ehPar (filter inRange list))

--questão 3
--letra A
type Potencia = Int
type Fabricante = String
data Lampada =  Compacta Fabricante Potencia | 
                Incandescente Fabricante Potencia

--letra B
instance Show Lampada where
    show (Compacta fab pot) = "Compacta " ++ fab ++ " " ++ show pot
    show (Incandescente fab pot) = "Incandescente " ++ fab ++ " " ++ show pot

instance Eq Lampada where
    (Compacta f1 p1) == (Compacta f2 p2) = f1 == f2 && p1 == p2
    (Incandescente f1 p1) == (Incandescente f2 p2) = f1 == f2 && p1 == p2
    _ == _ = False

