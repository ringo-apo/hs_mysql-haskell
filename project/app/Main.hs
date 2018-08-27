{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib
import Database.MySQL.Base
import qualified System.IO.Streams as Streams

main :: IO ()
main = do
     someFunc
     conn <- connect
        defaultConnectInfo {ciUser = "root", ciPassword = "password", ciDatabase = "test"}
     (defs, is) <- query_ conn "SELECT * FROM memos"
     print =<< Streams.toList is
