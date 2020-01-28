module View exposing (..)


import Html


import Element
import Element.Events


import Model
import Msg
import Ui


view : Model.Model Msg.Msg -> Html.Html Msg.Msg
view model =
    viewElement model
    |> Element.layout Ui.globalLayout


viewElement : Model.Model Msg.Msg -> Element.Element Msg.Msg
viewElement model =
    case model.state of
        Model.ViewingSteps ->
            viewAllSteps model
        
        Model.DoingStep step ->
            viewDoingStep step model


viewAllSteps : Model.Model Msg.Msg -> Element.Element Msg.Msg
viewAllSteps model =
    Element.column
        Ui.panel
        (List.map viewStep model.steps)


viewStep : Model.Step Msg.Msg -> Element.Element Msg.Msg
viewStep step =
    Element.el
        (List.concat
            [ Ui.panel
            ,   [ Element.Events.onClick (Msg.WorkOnStep step)
                ]
            ])
        (Element.text step.label)


viewDoingStep : Model.Step Msg.Msg -> Model.Model Msg.Msg -> Element.Element Msg.Msg
viewDoingStep step model =
    Element.el
        Ui.panel
        (Element.text <| "Working on: " ++ step.label)