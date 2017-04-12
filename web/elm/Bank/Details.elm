module Bank.Details exposing (..)

import Html exposing (..)
import Msgs exposing (Msg)
import Model exposing (Model)
import Bank.Model exposing (BankModel, Bank)
import RemoteData


view : Model -> String -> Html Msg
view model bankSlug =
    let
       bank = findBank model.bank bankSlug
    in
       displayBank bank


findBank : BankModel -> String -> Maybe Bank
findBank bankModel bankSlug =
    case bankModel.banks of
        RemoteData.NotAsked ->
            Nothing
        RemoteData.Loading ->
            Nothing
        RemoteData.Success banks ->
            banks
                |> List.filter (\item -> item.slug == bankSlug)
                |> List.head
        RemoteData.Failure error ->
            Nothing


displayBank : Maybe Bank -> Html Msg
displayBank bank =
    case bank of
        Just bank ->
            div []
                [ h4 [] [ text bank.name ] ]
        Nothing ->
            div []
                [ text "bank not found" ]

