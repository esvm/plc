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

data Post = P (Id, DataHoraPub) Texto deriving (Show, Eq)
data Thread = Nil | T Post Thread

--letra A
instance Show Thread where
    show Nil = "Nulo"
    show (T (P (id, dataHora) texto) t) = "(" ++ id ++ " " ++ 
                        show(dataHora) ++ " " ++ texto ++ ") " ++ show t

posts = [(P ("0", 1000) "Edjan"), (P ("1", 2000) "André")]

--letra B
inserePost :: Thread -> Post -> Thread
inserePost Nil p = T p Nil
inserePost (T p t) p1 = T p (inserePost t p1)

--letra C
threadToList :: Thread -> [Post]
threadToList Nil = []
threadToList (T p t) = p: threadToList t

--letra D
listToThread :: [Post] -> Thread
listToThread [] = Nil
listToThread (x:xs) = T x (listToThread xs)

--letra E
removerPost :: (Id, DataHoraPub) -> Thread -> Thread
removerPost (id, dataHora) t = listToThread ([a | a <- (filter (\(P(b, c) _) -> b /= id || c /= dataHora) (threadToList t))])


