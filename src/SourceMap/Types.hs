{-# OPTIONS -Wall #-}

-- | Types for the source maps.

module SourceMap.Types where

import Data.Int
import Data.Monoid
import Data.Text
import Data.Function

-- | The source mapping.
data SourceMapping = SourceMapping
  { smFile       :: !FilePath
  , smSourceRoot :: !(Maybe FilePath)
  , smMappings   :: ![Mapping]
  } deriving Show

-- | A mapping.
data Mapping = Mapping
  { mapGenerated  :: !Pos
  , mapOriginal   :: !(Maybe Pos)
  , mapSourceFile :: !(Maybe FilePath)
  , mapName       :: !(Maybe Text)
  } deriving Show

-- | A source position.
data Pos = Pos
  { posLine   :: !Int32
  , posColumn :: !Int32
  } deriving (Eq,Show)

-- | Compares the line, then the column.
instance Ord Pos where
  compare a b =
    on compare posLine a b <> on compare posColumn a b
