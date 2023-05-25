module Types exposing (..)

import Browser
import Browser.Navigation
import Url exposing (Url)


type Msg
    = Increment
    | Decrement
    | OnUrlRequest Browser.UrlRequest
    | OnUrlChange Url
    | ChangeView ViewType


type ViewType
    = View1 Browser.Navigation.Key
    | View2 Browser.Navigation.Key


type alias Model =
    { count : Int, view : ViewType }
