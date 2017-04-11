module Bank.Msgs exposing (..)
import RemoteData exposing (WebData)

import Bank.Model exposing (Bank)

type BankMsg
    = OnLoadBankList (WebData (List Bank))
