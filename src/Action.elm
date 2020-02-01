module Action exposing (..)


import Http
import Json.Decode as D


import Block
import Msg


getBlocks : Cmd Msg.Msg
getBlocks =
    Http.get
        { url = "https://sharma7n-5e-character-sheet.builtwithdark.com/blocks"
        , expect = Http.expectJson Msg.ElmGotBlocksResponse (D.list Block.decoder)
        }