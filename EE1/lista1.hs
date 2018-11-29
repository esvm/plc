{-
    Resolução da lista 1 
    Autor: Edjan Michiles
    Data: 10/10/2018
-}

--LISTA 1
--questão 2
sublistas :: [t] -> [[t]]
sublistas [] = [[]]
sublistas (x:xs) = [x: ys | ys <- sublistas xs] ++ sublistas xs

--questão 3
--letra A
poli :: Integer -> Integer -> Integer -> (Integer -> Integer)
poli a b c = (\x -> a * (x^2) + b*x + c)

--letra B
listapoli :: [(Integer, Integer, Integer)] -> [Integer -> Integer]
listapoli list = [poli a b c | (a, b, c) <- list]

--letra C
appListaPoli :: [Integer -> Integer] -> [Integer] -> [Integer]
appListaPoli l x = [a b | a <- l, b <- x]

--questão 4
--letra A
isMatrix :: [[t]] -> Bool
isMatrix l = not (elem False [length x == length y | x <- l, y <- l])  

--letra B
permute :: Int -> Int -> [[t]] -> [[t]]
permute x y l = ((take (x) l) ++ [(l!!y)] ++ [(l!!x)] ++ (drop (y+1) l))

--questão 5
oddLists :: [[Int]] -> [[Int]]
oddLists l = [a | a <- l, sum(filter odd a) > sum(filter even a)]

sumListOfList :: [[Int]] -> Int
sumListOfList l = maximum[sum(a) | a <- l]

filterInsert :: [[Int]] -> Int -> ([[Int]], Int)
filterInsert [] _ = ([], 0)
filterInsert l x = 
    (
        oddLists l,
        sumListOfList(oddLists l) * x
    )

--questão 6
altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap _ _ [] = []
altMap f g [x] = [f x]
altMap f g (x:y:ls) = f x : g y : altMap f g ls

--questão 7
type Codigo = Int
data Voto = Presidente Codigo 
            | Senador Codigo 
            | Deputado Codigo 
            | Branco deriving (Show)
type Urna = [Voto]
type Apuracao = [(Voto, Int)]

--letra A
instance Eq Voto where
    (Presidente cod1) == (Presidente cod2) = (cod1 == cod2)
    (Senador cod1) == (Senador cod2) = (cod1 == cod2)
    (Deputado cod1) == (Deputado cod2) = (cod1 == cod2)
    (Branco) == (Branco) = True

--letra B
totalVotos :: Urna -> Voto -> Int
totalVotos u v = length [0 | x <- u, x == v]

--letra C
apurar :: Urna -> Apuracao
apurar u = [(v, (totalVotos u v)) | v <- u]
