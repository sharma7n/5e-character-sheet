module Update exposing (..)


import Http


import Block
import Model
import Msg


update : Msg.Msg -> Model.Model -> ( Model.Model, Cmd Msg.Msg )
update msg model =
    case msg of
        Msg.ElmGotBlocksResponse result ->
            updateElmGotBlocksResponse result model


updateElmGotBlocksResponse : Block.FetchResult -> Model.Model -> ( Model.Model, Cmd Msg.Msg )
updateElmGotBlocksResponse result model =
    let
        newModel =
            Model.ViewingBlocksResult result
    in
    ( newModel, Cmd.none )