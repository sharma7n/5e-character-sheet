module Main exposing (..)


import Browser
import Html


import Element
import Element.Background
import Element.Events
import Element.Font


import Palette
import Ui


main : Program () (Model Msg) Msg 
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model msg =
    { steps : List (Step msg)
    , state : State msg
    }


type State msg
    = ViewingSteps
    | DoingStep (Step msg)


type alias Step msg =
    { label : String
    , request : Cmd msg
    }


type Msg
    = WorkOnStep (Step Msg)


init : () -> ( Model Msg, Cmd Msg )
init flags = 
    let
        initModel =
            { steps = initSteps
            , state = ViewingSteps
            }
        
        initSteps =
            [   { label = "Choose a Race"
                , request = Cmd.none
                }
            ]
    in
    ( initModel, Cmd.none )


view : Model Msg -> Html.Html Msg
view model =
    viewElement model
    |> Element.layout Ui.globalLayout


viewElement : Model Msg -> Element.Element Msg
viewElement model =
    case model.state of
        ViewingSteps ->
            viewAllSteps model
        
        DoingStep step ->
            viewDoingStep step model


viewAllSteps : Model Msg -> Element.Element Msg
viewAllSteps model =
    Element.column
        Ui.panel
        (List.map viewStep model.steps)


viewStep : Step Msg -> Element.Element Msg
viewStep step =
    Element.el
        (List.concat
            [ Ui.panel
            ,   [ Element.Events.onClick (WorkOnStep step)
                ]
            ])
        (Element.text step.label)


viewDoingStep : Step Msg -> Model Msg -> Element.Element Msg
viewDoingStep step model =
    Element.el
        Ui.panel
        (Element.text <| "Working on: " ++ step.label)


update : Msg -> Model Msg -> ( Model Msg, Cmd Msg )
update msg model =
    case msg of
        WorkOnStep step ->
            updateWorkOnStep step model


updateWorkOnStep : Step Msg -> Model Msg -> ( Model Msg, Cmd Msg )
updateWorkOnStep step model =
    let
        newModel =
            { steps = model.steps
            , state = DoingStep step
            }
    in
    ( newModel, step.request )


subscriptions : model -> Sub msg
subscriptions model =
    Sub.none