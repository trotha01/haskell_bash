module Main where
import System.Environment
import Control.Monad
import Data.Functor

-- mapM_    :: Monad m => (a -> m b) -> [a] -> m ()
-- readFile :: FilePath -> IO String
-- putStr   :: String -> IO ()
-- take     :: Int -> [a] -> [a]
--   using it here as (take 10) :: [String] -> [String]
-- lines   :: String -> [String]
-- unlines :: [String] -> String
-- >=>     :: Monad m => (a -> m b) -> (b -> m c) -> (a -> m c)
-- .       :: (b -> c) -> (a -> b) -> a -> c

fileTail :: String -> IO ()
fileTail file = (unlines . reverse . (take 10) . reverse . lines) <$> (readFile file) >>= putStr

main = getArgs >>= mapM_ fileTail
