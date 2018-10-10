{-
    Resolução do Exercício Escolar 1 da turma 2018.1
    Autor: Edjan Michiles
    Data: 10/10/2018
-}

--questão 2
import Data.List (sort)
data CInt = Conjunto [Int] deriving (Show)

getList :: CInt -> [Int]
getList (Conjunto x) = x

makeList :: [Int] -> [Int]
makeList [] = []
makeList list
    | elem (head list) (tail list) = makeList (tail list)
    | otherwise = (head list) : makeList (tail list)

--letra A
makeSet :: [Int] -> CInt
makeSet [] = Conjunto []
makeSet list = Conjunto (makeList (sort list))

--letra B
union :: CInt -> CInt -> CInt
union a b = Conjunto (getList a ++ getList b)

--letra C
mapSet :: (Int -> Int) -> CInt -> CInt
mapSet _ (Conjunto []) = Conjunto []
mapSet f (Conjunto list) = Conjunto (map f list)

--questão 3
type Texto = String
type Id = String
type DataHoraPub = Int

data Post = Post (Id, DataHoraPub) Texto deriving (Show, Eq)
data Thread = Nil | T Post (Thread)

getId :: Post -> Id
getId (Post (id, _) _) = id

getDataHora :: Post -> DataHoraPub
getDataHora (Post (_, dataHoraPub) _) = dataHoraPub

getText :: Post -> Texto
getText (Post _ texto) = texto


--letra A
instance Show Thread where
    show (Nil) = []
    show (T p (t)) = "(" ++ getId(p) ++ " " ++ show(getDataHora p) ++ " " ++ getText p ++ ")" ++ show(t)

--letra B




