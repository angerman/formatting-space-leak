{-# OPTIONS_GHC -Wall -Wextra -Werror -Wcompat #-}
{-# LANGUAGE GeneralizedNewtypeDeriving        #-}
{-# LANGUAGE DeriveGeneric                     #-}
{-# LANGUAGE OverloadedStrings                 #-}
module Main where

import           Data.Word (Word64)
import qualified Data.Text.IO as T
import           Formatting (bprint, int, (%), sformat)
import qualified Formatting as F
import           Formatting.Buildable (Buildable (build))

newtype NewWord = NewWord
    { getNewWord :: Word64
    } deriving (Show, Eq, Ord, Num, Enum, Real, Integral)

instance Buildable NewWord where
  build = bprint ("#"%int)

main :: IO ()
main = T.putStrLn
  (sformat
    ("Word64: "%F.build)
    (NewWord 123456790))
