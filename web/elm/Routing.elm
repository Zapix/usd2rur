module Routing exposing (..)

import Navigation exposing (Location)
import Model exposing (Model, Route(..))
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
         [ map LoginRoute top
         , map LoginRoute (s "login")
         , map AboutRoute (s "about")
         ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route
        Nothing ->
            NotFoundRoute


loginPath : String
loginPath = "#login"


aboutPath : String
aboutPath = "#about"

