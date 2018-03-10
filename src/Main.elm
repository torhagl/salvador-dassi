module Main exposing (..)

import Html exposing (div, text, img, Html, node)
import Html.Attributes exposing (..)
import Image exposing (..)
import Msg exposing (..)
import Time exposing (..)
import Task exposing (..)
import Keyboard exposing (..)


main : Program Never Model Msg
main =
    Html.program { init = init, view = view, update = update, subscriptions = subscriptions }


type alias Model =
    { displayedImages : List Image
    , time : Int
    }


init : ( Model, Cmd msg )
init =
    ( { displayedImages = [], time = 2 }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Tick x ->
            ( { model | time = round x }, Cmd.none )

        KeyMsg _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every millisecond Tick
        , Keyboard.downs KeyMsg
        ]


stylesheet : Html Msg
stylesheet =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "/src/localstyles.css"
            ]

        children =
            []
    in
        node tag attrs children


view : Model -> Html Msg
view model =
    div [] <| stylesheet :: (List.map Image.imageToHtml <| List.map (\y -> Image.newImage y model.time) allImageURLs)


allImageURLs : List String
allImageURLs =
    List.map (\y -> "/bgpics/" ++ y) allImageFilenames


allImageFilenames : List String
allImageFilenames =
    [ "aribottles-min.png"
    , "aridoodoo-min.png"
    , "meg123-min.png"
    , "rune-min.png"
    , "runeturnt-min.png"
    , "tor17-min.png"
    , "torari-min.png"
    , "toraritor-min.png"
    , "torguns-min.png"
    , "torhighaf-min.png"
    , "torhighaf-min.png"
    ]
