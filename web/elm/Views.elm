module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Model exposing (Model, Route(..))
import Msgs exposing (Msg)
import Common.Navigation
import Auth.Login
import Page.About


view : Model -> Html Msg
view model =
    div [ ]
        [
          Common.Navigation.view model
        , div [ class "container" ]
              [ page model ]
        ]


page: Model -> Html Msg
page model =
    case model.route of
        LoginRoute ->
            Auth.Login.view model
        AboutRoute ->
            Page.About.view model
        NotFoundRoute ->
            notFoundView model


notFoundView : Model -> Html Msg
notFoundView model =
    div []
        [ text "Page Not Found" ]

