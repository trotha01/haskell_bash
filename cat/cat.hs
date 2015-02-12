module Main where
import System.Environment
import Data.Maybe
import Control.Monad

-- getArgs :: IO [String]
-- mapM :: Monad m => (a -> m b) -> [a] -> m [b]
-- mapM_ :: Monad m => (a -> m b) -> [a] -> m ()
-- readFile :: FilePath -> IO String
-- putStr :: String -> IO ()
-- listToMaybe :: [a] -> Maybe a

ifElseCat = getArgs >>= \args ->if args == [] then interact id else mapM readFile args >>= mapM_ putStr

-- maybe takes in three arguments
-- The first is the default value to use (if Maybe is Nothing)
-- The second is the function to apply to 'a', in Just a
-- The third is the Maybe value (either Just a or Nothing)
-- Examples:
--  > maybe 1 (\_ -> 2) (Just "a")
--  2
--  > maybe 1 (\_ -> 2) (Nothing)
--  1

-- listToMaybe changes a list into either Nothing, if the list is empty
--      or Just a, where a is the first item in the list
-- Examples:
--  > listToMaybe []
--  Nothing
--  > listToMaybe ["hello","world"]
--  Just "hello"

-- interact takes a function (String -> String), takes standard input, applies the function to it,
--  and returns the result to standard output
-- id takes a value and returns that same value

-- "interact id" will take standard input and give it back as standard output

-- readFile takes a filename and reads it to a string, returning an IO String
-- putStr takes in a string, prints it to standard out and returns IO ()

-- \a -> ... Is just a lambda function.

-- mapM makes more sense with its signature, Monad m => (a -> m b) -> [a] -> m [b]
--      Basically, it takes in a function and a list, and applies the function to each element of the list
-- mapM_ is very similar to mapM, Monad m => (a -> m b) -> [a] -> m ()
--      It just basically ignores the results of the function (Nice when printing stuff out)

-- The '>=>' is composition of monads (Monad m => (a -> m b) -> (b -> m c) -> (a -> m c))
-- So here we compose (readFile :: FilePath -> IO String)
--                and (putStr   :: String   -> IO () )
--      to get a function of type (FilePath -> IO ()) that takes in a file and prints it to standard out

-- The mapM_ takes the function we composed with '>=>' and applies it to each file

main = getArgs >>= \files ->
  maybe
   (interact id)
   (\_ -> mapM_ (readFile >=> putStr) files)
   (listToMaybe files)

