module Image exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (Msg)
import Random exposing (..)


type Image
    = Image
        { url : String
        , rotation : Rotation
        }


url : Image -> String
url (Image img) =
    img.url


type alias Rotation =
    Attribute Msg


newImage : String -> Int -> Image
newImage url seed =
    Image <|
        { url = url
        , rotation =
            case randomRotation seed of
                Just el ->
                    el

                Nothing ->
                    class "rotate-0"
        }


imageToHtml : Image -> Html Msg
imageToHtml (Image image) =
    img
        [ src image.url
        , image.rotation
        ]
        []


getRandomIntInListRange : List a -> Int -> Int
getRandomIntInListRange list timeseed =
    Tuple.first (Random.step (Random.int 1 (List.length list)) (Random.initialSeed timeseed))


randomRotation : Int -> Maybe Rotation
randomRotation seed =
    List.head (List.reverse (List.take (getRandomIntInListRange possibleRotations seed) possibleRotations))


possibleRotations : List Rotation
possibleRotations =
    List.map (\y -> class ("rotate-" ++ y)) possibleRotationDegrees


possibleRotationDegrees : List String
possibleRotationDegrees =
    [ "0", "20", "40", "60", "80", "100", "120", "140", "160", "180", "200", "220", "240", "260", "280", "300", "320", "340" ]
