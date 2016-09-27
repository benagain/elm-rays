module State exposing (initialModel, initialCmd, update, subscriptions)

import Mouse
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Types exposing (..)
import Window
import Vectors
import Task


initialModel : Model
initialModel =
    { display = modelForSize smallSquare
    , mouse = Nothing
    }


initialCmd : Cmd Msg
initialCmd =
    Task.perform (\_ -> Resize smallSquare) (\size -> Resize size) Window.size


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mouse mouse ->
            ( { model | mouse = Just mouse }
            , Cmd.none
            )

        Resize size ->
            ( { model | display = modelForSize size }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Mouse.moves Mouse
        , Window.resizes Resize
        ]


modelForSize : Window.Size -> Display
modelForSize size =
    let
        width =
            toFloat size.width

        height =
            (toFloat size.height) - 25
    in
        { size = Window.Size (round width) (round height)
        , walls =
            [ { position = { x = 0, y = 0 }, vector = { length = width, angle = degrees 0 } }
            , { position = { x = 0, y = height }, vector = { length = width, angle = degrees 0 } }
            , { position = { x = 0, y = 0 }, vector = { length = height, angle = degrees 90 } }
            , { position = { x = width, y = 0 }, vector = { length = height, angle = degrees 90 } }
            , Vectors.lineBetween { x = width * 2 / 6, y = height * 2 / 6 } { x = width * 4 / 6, y = height * 4 / 6 }
            , Vectors.lineBetween { x = width * 1 / 6, y = height * 3 / 8 } { x = width * 3 / 8, y = height * 2 / 8 }
            , Vectors.lineBetween { x = width * 1 / 6, y = height * 5 / 6 } { x = width * 2 / 6, y = height * 4 / 6 }
            , Vectors.lineBetween { x = width * 1 / 4, y = height * 1 / 8 } { x = width * 3 / 4, y = height * 1 / 8 }
            , Vectors.lineBetween { x = width * 3 / 6, y = height * 3 / 6 } { x = width * 5 / 6, y = height * 2 / 6 }
            , Vectors.lineBetween { x = width * 3 / 6, y = height * 5 / 6 } { x = width * 5 / 6, y = height * 3 / 6 }
            ]
        }


smallSquare =
    { width = 100, height = 100 }
