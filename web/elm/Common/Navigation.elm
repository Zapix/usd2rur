module Common.Navigation exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, id, href)
import Model exposing (Model)
import Msgs exposing (Msg)
import Routing exposing (loginPath, aboutPath)


view : Model -> Html Msg
view model =
    nav []
        [
            div [ class "container nav-wrapper" ]
                [ logo
                , menu model
                ]
        ]


logo : Html Msg
logo =
    a [ class "brand-logo" ]
      [ text "Usd2rur" ]


menu : Model -> Html Msg
menu model =
    ul [ id "nav-mobile"
       , class "right hide-on-med-and-down"
       ]
        [ li []
             [ a [ href loginPath ]
                 [ text "Login" ]
             ]
        , li []
             [ a [ href aboutPath ]
                 [ text "About" ]
             ]
        ]
