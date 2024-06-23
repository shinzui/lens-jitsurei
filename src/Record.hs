{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}

module Record where

import Data.Generics.Labels ()
import JitsureiPrelude

data User = User
  { firstName :: !Text,
    lastName :: !Text
  }
  deriving stock (Generic)

kayoung :: User
kayoung = User {firstName = "Ka-young", lastName = "Mun"}

kayoungFirstName :: Text
kayoungFirstName = kayoung ^. #firstName
