module Bank.Model exposing (..)

import RemoteData exposing (WebData)


type alias BankModel =
    { banks: WebData(List Bank)
    }


type alias Bank =
    { name: String
    , slug: String
    }


initialBankModel : BankModel
initialBankModel =
    { banks = RemoteData.Loading
    }