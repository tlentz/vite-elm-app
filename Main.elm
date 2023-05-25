module Main exposing (main)

import Browser
import Browser.Navigation
import Json.Decode as Decode
import Types exposing (Model, Msg(..), ViewType(..))
import Url exposing (Url)
import View exposing (view)


initialModel : Browser.Navigation.Key -> Model
initialModel k =
    { count = 0, view = View1 k }


init : Decode.Value -> Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init json url navigationKey =
    ( initialModel navigationKey, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | count = model.count + 1 }, Cmd.none )

        Decrement ->
            ( { model | count = model.count - 1 }, Cmd.none )

        ChangeView v ->
            ( { model | view = v }, Cmd.none )

        _ ->
            ( model, Cmd.none )


subscriptions _ =
    Sub.none


main : Program Decode.Value Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = OnUrlRequest
        , onUrlChange = OnUrlChange
        }
