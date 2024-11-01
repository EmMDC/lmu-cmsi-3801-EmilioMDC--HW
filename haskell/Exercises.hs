module Exercises
    ( change,
      firstThenApply,
      powers,
      meaningfulLineCount,
      Shape(..),
      volume,
      surfaceArea,
      BST(Empty),
      size,
      insert,
      inorder,
      contains
    ) where

import qualified Data.Map as Map
import Data.Text (pack, unpack, replace)
import Data.List (isPrefixOf, find)
import Data.Char (isSpace)

change :: Integer -> Either String (Map.Map Integer Integer)
change amount
    | amount < 0 = Left "amount cannot be negative"
    | otherwise = Right $ changeHelper [25, 10, 5, 1] amount Map.empty
        where
          changeHelper [] remaining counts = counts
          changeHelper (d:ds) remaining counts =
            changeHelper ds newRemaining newCounts
              where
                (count, newRemaining) = remaining `divMod` d
                newCounts = Map.insert d count counts

-- Problem 1: First Applied
firstThenApply :: [a] -> (a -> Bool) -> (a -> b) -> Maybe b
firstThenApply elements predicate function = fmap function (find predicate elements)

-- Problem 2: Powers Generator
powers :: (Integral a) => a -> [a]
powers base = map (base^) [0..]

-- Problem 3: Line Count
meaningfulLineCount :: FilePath -> IO Int
meaningfulLineCount filePath = do
  fileContents <- readFile filePath
  return $ length $ filter isMeaningfulLine (lines fileContents)
  where
    isMeaningfulLine line = 
      not (all isSpace line) && not (isComment line)
    isComment line = case dropWhile isSpace line of
      ('#':_) -> True
      _       -> False

-- Problem 4: Shapes Surface Area/Volume
data Shape
    = Sphere Double 
    | Box Double Double Double 
    deriving (Eq, Show)

volume :: Shape -> Double
volume (Sphere radius) = 4/3 * pi * radius^3
volume (Box length width height) = length * width * height

surfaceArea :: Shape -> Double
surfaceArea (Sphere radius) = 4 * pi * radius^2
surfaceArea (Box length width height) = 2 * (length * width + width * height + height * length)

-- Problem 5: Binary Search Tree
data BST value 
    = Empty
    | Node value (BST value) (BST value)

size :: BST value -> Int
size Empty = 0
size (Node _ leftChild rightChild) = 1 + size leftChild + size rightChild

insert :: Ord value => value -> BST value -> BST value
insert newValue Empty = Node newValue Empty Empty
insert newValue (Node currentValue leftChild rightChild)
    | newValue < currentValue = Node currentValue (insert newValue leftChild) rightChild
    | newValue > currentValue = Node currentValue leftChild (insert newValue rightChild)
    | otherwise = Node currentValue leftChild rightChild 

contains :: Ord value => value -> BST value -> Bool
contains _ Empty = False
contains searchValue (Node currentValue leftChild rightChild)
    | searchValue == currentValue = True
    | searchValue < currentValue = contains searchValue leftChild
    | otherwise = contains searchValue rightChild

inorder :: BST value -> [value]
inorder Empty = []
inorder (Node currentValue leftChild rightChild) = inorder leftChild ++ [currentValue] ++ inorder rightChild

instance Show value => Show (BST value) where
    show Empty = "()"
    show (Node currentValue leftChild rightChild) = 
        "(" ++ showTreeContent leftChild ++ show currentValue ++ showTreeContent rightChild ++ ")"
        where 
          showTreeContent Empty = ""
          showTreeContent tree = show tree
