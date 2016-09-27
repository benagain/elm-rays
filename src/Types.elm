module Types exposing (Walls, Model, Msg(..), Display)

import Mouse
import Vectors exposing (..)
import Window


type alias Walls =
    List Line


type alias Display =
    { size : Window.Size
    , walls : Walls
    }


type alias Model =
    { display : Display
    , mouse : Maybe Mouse.Position
    }


type Msg
    = Mouse Mouse.Position
    | Resize Window.Size
