module View exposing (..)


import Html


import Element
import Element.Events


import Model
import Msg
import Ui


view : Model.Model -> Html.Html Msg.Msg
view model =
    viewElement model
    |> Element.layout Ui.globalLayout


viewElement : Model.Model -> Element.Element Msg.Msg
viewElement model =
    Element.el
        Ui.panel
        ( Element.text "Todo" )