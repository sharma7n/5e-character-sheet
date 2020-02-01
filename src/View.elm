module View exposing (..)


import Html
import Http


import Element
import Element.Events


import Block
import Model
import Msg
import Ui


view : Model.Model -> Html.Html Msg.Msg
view model =
    viewElement model
    |> Element.layout Ui.globalLayout


viewElement : Model.Model -> Element.Element Msg.Msg
viewElement model =
    case model of
        Model.LoadingBlocks ->
            viewLoadingBlocks

        Model.ViewingBlocksResult result ->
            viewViewingBlocksResult result


viewLoadingBlocks : Element.Element msg
viewLoadingBlocks =
    Element.el
        Ui.panel
        ( Element.text "Loading..." )


viewViewingBlocksResult : Block.FetchResult -> Element.Element msg
viewViewingBlocksResult result =
    case result of
        Err loadingBlocksError ->
            viewLoadingBlocksError loadingBlocksError

        Ok blocks ->
            viewBlocks blocks


viewLoadingBlocksError : Http.Error -> Element.Element msg
viewLoadingBlocksError error =
    Element.el
        Ui.panel
        ( Element.text <| httpErrorToString error )


httpErrorToString : Http.Error -> String
httpErrorToString error =
    case error of
        Http.BadUrl url ->
            "Bad url: " ++ url
        
        Http.Timeout ->
            "Timeout"
        
        Http.NetworkError ->
            "Network Error"
        
        Http.BadStatus status ->
            "Bad status: " ++ ( String.fromInt status )
        
        Http.BadBody body ->
            "Bad body: " ++ body


viewBlocks : List Block.Block -> Element.Element msg
viewBlocks blocks =
    Element.column
        Ui.panel
        ( List.map viewBlock blocks )


viewBlock : Block.Block -> Element.Element msg
viewBlock block =
    Element.column
        Ui.panel
        [ Element.text block.name
        , Element.text <| "HP " ++ ( String.fromInt block.hitPoints )
        , Element.text <| "AC " ++ ( String.fromInt block.armorClass )
        , Element.text <| "Speed " ++ (String.fromInt block.speed )
        ]