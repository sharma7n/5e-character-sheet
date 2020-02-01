module Model exposing (..)


import Http


import Block


type Model
    = LoadingBlocks
    | ViewingBlocksResult Block.FetchResult


init : Model
init = 
    let
        initModel =
            LoadingBlocks
    in
    initModel