module Main where

import Prelude

import Effect (Effect)
import Effect.Aff.Class (class MonadAff)
import Elmish.Boot (defaultMain)
import Elmish (Dispatch, ReactElement, Transition)
import Elmish.HTML as R

main :: Effect Unit
main = defaultMain { elementId: "app", def: { init, update, view } }

data Msg
  = Inc
  | Dec

type Model =
  { count :: Int
  }

init :: forall eff. MonadAff eff => Transition eff Msg Model
init = pure
  { count: 0
  }

update :: forall eff. MonadAff eff => Model -> Msg -> Transition eff Msg Model
update m Inc = pure m { count = m.count + 1 }
update m Dec = pure m { count = m.count - 1 }

view :: Model -> Dispatch Msg -> ReactElement
view m dispatch =
  R.div { className: "container" }
    [ R.h1 {} "PureScript Quickstart"
    , R.p {} $ "Hello there. Current counter is: " <> show m.count
    , R.button { onClick: dispatch Dec } "-"
    , R.button { onClick: dispatch Inc } "+"
    ]
