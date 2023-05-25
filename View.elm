module View exposing (..)

import Browser exposing (Document)
import Html exposing (button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (Model, Msg(..), ViewType(..))


view : Model -> Document Msg
view model =
    { title = "vite elm app"
    , body =
        [ case model.view of
            View1 k ->
                div [ class "blue" ]
                    [ button [ onClick Increment ] [ text "+1" ]
                    , div [] [ text <| String.fromInt model.count ]
                    , button [ onClick Decrement ] [ text "-1" ]
                    , div [] []
                    , button [ onClick <| ChangeView (View2 k) ] [ text "change view" ]
                    ]

            View2 k ->
                div []
                    [ Html.text "hi"
                    , div [] []
                    , button [ onClick <| ChangeView (View1 k) ] [ text "change view" ]
                    ]
        ]
    }
