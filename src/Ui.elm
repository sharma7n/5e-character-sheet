module Ui exposing (..)


import Element
import Element.Background
import Element.Font


import Palette


globalLayout : List (Element.Attribute msg)
globalLayout =
    [ Element.explain Debug.todo
    , Element.Font.family
        [ Element.Font.typeface "Verdana"
        , Element.Font.sansSerif
        ]
    , Element.Font.color Palette.elementFontColor
    , Element.Background.color Palette.siteBackgroundColor
    ]


panel : List (Element.Attribute msg)
panel =
    [ Element.centerX
    , Element.centerY
    , Element.Background.color Palette.elementBackgroundColor
    , Element.padding 5
    , Element.spacing 10
    ]