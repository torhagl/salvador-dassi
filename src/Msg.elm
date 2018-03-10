module Msg exposing (..)

import Time exposing (..)
import Keyboard exposing (..)


type Msg
    = Tick Time
    | KeyMsg Keyboard.KeyCode
