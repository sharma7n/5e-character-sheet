module Main exposing (..)


import Browser
import Html


import Element
import Element.Background
import Element.Font


import Palette


main : Program () Model msg 
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


init : () -> ( Model, Cmd msg )
init flags = 
    let
        initModel =
            { steps = initSteps
            , state = ViewingSteps
            }
        
        initSteps =
            [ { label = "Choose a Race" }
            , { label = "Choose a Background" }
            , { label = "Choose an Alignment" }
            , { label = "Choose a Class" }
            , { label = "Generate Ability Scores" }
            ]
    in
    ( initModel, Cmd.none )


view : Model -> Html.Html msg
view model =
    viewElement model
    |> Element.layout
        [ Element.explain Debug.todo
        , Element.Font.family
            [ Element.Font.typeface "Verdana"
            , Element.Font.sansSerif
            ]
        , Element.Font.color Palette.elementFontColor
        , Element.Background.color Palette.siteBackgroundColor
        ]


viewElement : Model -> Element.Element msg
viewElement model =
    Element.column
        [ Element.centerX
        , Element.centerY
        , Element.spacing 10
        ]
        (List.map viewStep model.steps)


viewStep : Step -> Element.Element msg
viewStep step =
    Element.el
        [ Element.Background.color Palette.elementBackgroundColor
        , Element.padding 5
        , Element.width Element.fill
        ]
        (Element.text step.label)


update : msg -> Model -> ( Model, Cmd msg )
update msg model = ( model, Cmd.none )


subscriptions : model -> Sub msg
subscriptions model =
    Sub.none