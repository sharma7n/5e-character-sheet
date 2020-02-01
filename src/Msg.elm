module Msg exposing (..)


import Http


import Block
import Model


type Msg
    = ElmGotBlocksResponse Block.FetchResult