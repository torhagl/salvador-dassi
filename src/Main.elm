module Main exposing (..)

import Html exposing (div, text, img, Html)
import Image exposing (..)
import Msg exposing (..)


main : Program Never Model Msg
main =
    Html.program { init = init, view = view, update = update, subscriptions = always Sub.none }


type alias Model =
    { displayedImages : List Image
    , allImages : List Image
    }


init : ( Model, Cmd msg )
init =
    ( { displayedImages = [], allImages = [] }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [] <| List.map Image.imageToHtml <| List.map Image.newImage allImageURLs


allImageURLs : List String
allImageURLs =
    List.map (\y -> "/bgpics/" ++ y) allImageFilenames


allImageFilenames : List String
allImageFilenames =
    [ "aribottles-min.png"
    , "aridoodoo-min.png"
    ]
