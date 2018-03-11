module Main exposing (..)

import Html exposing (div, text, img, Html, node)
import Html.Attributes exposing (..)
import Image exposing (..)
import Msg exposing (..)
import Time exposing (..)
import Task exposing (..)
import Keyboard exposing (..)
import Random exposing (..)
import Random.List exposing (..)


main : Program Never Model Msg
main =
    Html.program { init = init, view = view, update = update, subscriptions = subscriptions }


type alias Model =
    { displayedImages : List Image
    , time : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { displayedImages = [], time = 2 }, Task.perform Tick Time.now )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick x ->
            let
                prevUrls =
                    List.map Image.url model.displayedImages

                newImages =
                    List.take 6 <| List.map (\y -> Image.newImage y (round x)) <| Tuple.first <| Random.step (shuffle (listDifference allImageURLs prevUrls)) (Random.initialSeed (round x))
            in
                ( { model | displayedImages = newImages }, Cmd.none )

        KeyMsg k ->
            let
                prevUrls =
                    List.map Image.url model.displayedImages

                newImages =
                    List.take 6 <| List.map (\y -> Image.newImage y k) prevUrls
            in
                ( { model | displayedImages = newImages }, Cmd.none )


listDifference : List a -> List a -> List a
listDifference l1 l2 =
    Tuple.first <| List.partition (\y -> not <| List.member y l2) l1



--Task.perform Tick Time.now )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.downs KeyMsg
        , Time.every (second * 2) Tick
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
    div [] <| stylesheet :: (List.map Image.imageToHtml model.displayedImages)


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
    , "toweltor-min.png"
    ]
