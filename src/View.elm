module View exposing (..)


import Html


import Element
import Element.Events


import Model
import Msg
import Race
import Ui


view : Model.Model -> Html.Html Msg.Msg
view model =
    viewElement model
    |> Element.layout Ui.globalLayout


viewElement : Model.Model -> Element.Element Msg.Msg
viewElement model =
    case model.error of
        Nothing ->
            viewModel model
        
        Just httpError ->
            Element.text <| Debug.toString httpError


viewModel : Model.Model -> Element.Element Msg.Msg
viewModel model =
    Element.column
        Ui.panel
        [ viewChosenOptions model
        , viewModelState model
        ]


viewChosenOptions : Model.Model -> Element.Element Msg.Msg
viewChosenOptions model =
    Element.text <|
    Maybe.withDefault "No Race Selected" <|
    Maybe.map .name <|
    model.chosenRace

viewModelState : Model.Model -> Element.Element Msg.Msg
viewModelState model =
    case model.state of
        Model.ViewingSteps ->
            viewAllSteps model
        
        Model.DoingStep step ->
            viewDoingStep step model


viewAllSteps : Model.Model -> Element.Element Msg.Msg
viewAllSteps model =
    Element.column
        Ui.panel
        (List.map viewStep model.steps)


viewStep : Model.Step -> Element.Element Msg.Msg
viewStep step =
    Element.el
        (List.concat
            [ Ui.panel
            ,   [ Element.Events.onClick (Msg.WorkOnStep step)
                ]
            ])
        (Element.text step.label)


viewDoingStep : Model.Step -> Model.Model -> Element.Element Msg.Msg
viewDoingStep step model =
    Element.column
        Ui.panel
        (List.map viewRace model.races)


viewRace : Race.Race -> Element.Element Msg.Msg
viewRace race =
    Element.el
        (Ui.panel ++ [Element.Events.onClick (Msg.ChoseRace race)])
        (Element.text race.name)