module Main exposing (main)

import Browser exposing (Document)
import Browser.Navigation
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Json.Decode as Decode
import Url exposing (Url)


type alias Model =
    { count : Int, view : ViewType }


initialModel : Model
initialModel =
    { count = 0, view = View1 }


init : Decode.Value -> Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init json url navigationKey =
    ( initialModel, Cmd.none )


type Msg
    = Increment
    | Decrement
    | OnUrlRequest Browser.UrlRequest
    | OnUrlChange Url
    | ChangeView ViewType


type ViewType
    = View1
    | View2


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


view : Model -> Document Msg
view model =
    { title = "vite elm app"
    , body =
        [ case model.view of
            View1 ->
                div [ class "blue" ]
                    [ button [ onClick Increment ] [ text "+1" ]
                    , div [] [ text <| String.fromInt model.count ]
                    , button [ onClick Decrement ] [ text "-1" ]
                    , div [] []
                    , button [ onClick <| ChangeView View2 ] [ text "change view" ]
                    ]

            View2 ->
                div []
                    [ Html.text "hello"
                    , div [] []
                    , button [ onClick <| ChangeView View1 ] [ text "change view" ]
                    ]
        ]
    }


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
