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


default : Image
default =
    Image { url = "", rotation = lol }


lol : Rotation
lol =
    style [ ( "", "" ) ]


newImage : String -> Image
newImage url =
    Image <| { url = url, rotation = randomRotation }


imageToHtml : Image -> Html Msg
imageToHtml (Image image) =
    img [ src image.url ] []


randomRotation : Rotation
randomRotation =
    style []


possibleRotations : List Rotation
possibleRotations =
    []
