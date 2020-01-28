module Main exposing (..)


import Browser
import Html


import Element
import Element.Background
import Element.Events
import Element.Font


import Palette
import Ui


main : Program () Model Msg 
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { steps : List Step
    , state : State
    }


type State
    = ViewingSteps
    | DoingStep Step


type alias Step =
    { label : String
    }


type Msg
    = WorkOnStep Step


init : () -> ( Model, Cmd Msg )
init flags = 
    let
        initModel =
            { steps = initSteps
            , state = ViewingSteps
            }
        
        initSteps =
            [ { label = "Choose a Race" }
            ]
    in
    ( initModel, Cmd.none )


view : Model -> Html.Html Msg
view model =
    viewElement model
    |> Element.layout Ui.globalLayout


viewElement : Model -> Element.Element Msg
viewElement model =
    case model.state of
        ViewingSteps ->
            viewAllSteps model
        
        DoingStep step ->
            viewDoingStep step model


viewAllSteps : Model -> Element.Element Msg
viewAllSteps model =
    Element.column
        Ui.panel
        (List.map viewStep model.steps)


viewStep : Step -> Element.Element Msg
viewStep step =
    Element.el
        (List.concat
            [ Ui.panel
            ,   [ Element.Events.onClick (WorkOnStep step)
                ]
            ])
        (Element.text step.label)


viewDoingStep : Step -> Model -> Element.Element Msg
viewDoingStep step model =
    Element.el
        Ui.panel
        (Element.text <| "Working on: " ++ step.label)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WorkOnStep step ->
            updateWorkOnStep step model


updateWorkOnStep : Step -> Model -> ( Model, Cmd Msg )
updateWorkOnStep step model =
    let
        newModel =
            { steps = model.steps
            , state = DoingStep step
            }
    in
    ( newModel, Cmd.none )


subscriptions : model -> Sub msg
subscriptions model =
    Sub.none