module View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import View.Svg


root : Model -> Html msg
root model =
    div []
        [ case model.mouse of
            Just position ->
                View.Svg.root model.display position

            _ ->
                Html.text "Initializing."
        , copy
        ]


copy : Html msg
copy =
    div
        [ style
            [ ( "text-align", "center" )
            ]
        ]
        [ div []
            [ a [ href "http://elm-lang.org/" ] [ text "Elm" ]
            , text " on Cordova raycasting.  See "
            , a [ href "https://github.com/krisajenkins/elm-rays" ] [ text "source code" ]
            ]
        ]
