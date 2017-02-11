module Main exposing (..)

import Platform
import HttpServer


main : Program Never Model Msg
main =
    Platform.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


type Msg
    = Request HttpServer.Request


update : Msg -> Model -> ( Model, Cmd msg )
update message model =
    case message of
        Request request ->
            ( model + 1, HttpServer.respond request (toString model) )


subscriptions : Model -> Sub Msg
subscriptions model =
    HttpServer.listen 8080 Request
