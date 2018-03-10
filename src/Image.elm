module Image exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (Msg)


type Image
    = Image
        { url : String
        , rotation : Rotation
        }


type alias Rotation =
    Attribute Msg


newImage : String -> Image
newImage url =
    Image <| { url = url, rotation = randomRotation }


imageToHtml : Image -> Html Msg
imageToHtml (Image image) =
    img [ src image.url ] []



-- TODO


randomRotation : Rotation
randomRotation =
    style []



-- TODO


possibleRotations : List Rotation
possibleRotations =
    []
