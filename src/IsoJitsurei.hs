module IsoJitsurei where

import Data.Time
import JitsureiPrelude

newtype Currency = Currency {getCurrency :: Double}
  deriving (Show, Eq)

currencyIso :: Iso' Currency Double
currencyIso = iso getCurrency Currency

applyDiscount :: Double -> Double
applyDiscount amount = amount * 0.9

applyDiscountToCurrency :: Currency -> Currency
applyDiscountToCurrency = over currencyIso applyDiscount

newtype DateString = DateString {getDateString :: String}
  deriving (Show, Eq)

dateStringIso :: Iso' DateString Day
dateStringIso = iso toDay fromDay
  where
    toDay (DateString str) = parseTimeOrError True defaultTimeLocale "%Y-%m-%d" str
    fromDay day = DateString $ formatTime defaultTimeLocale "%Y-%m-%d" day
