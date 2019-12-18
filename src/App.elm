module App exposing(..)

import Html
import Html.Events as He
import Browser exposing (element)
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Row as Row
import Bootstrap.Grid.Col as Col
import Bootstrap.Button as Button

type alias Model = {
    value: Int,
    numberOfClicks: Int
    }

type Msg = Initialize | Increment | Decrement | InitModel

initialModel : () -> (Model, Cmd Msg)
initialModel () = ({
    value=0,
    numberOfClicks=0}, Cmd.none)

view model = 
    Grid.container [] [
        Html.h1 [] [Html.text "Hello world."],
        Html.h2 [] [Html.text (String.fromInt model.value)],
        Html.h2 [] [Html.text (String.fromInt model.numberOfClicks)],
        Button.button [Button.success, Button.block, Button.attrs [He.onClick Increment]] [Html.text "Increment"],
        Button.button [Button.success, Button.block, Button.attrs [He.onClick Decrement]] [Html.text "Decrement"],
        Button.button [Button.success, Button.block, Button.attrs [He.onClick InitModel]] [Html.text "Initialize"]
    ]

update : Msg -> Model ->(Model, Cmd Msg)
update msg model =
    case msg of
        Increment -> ({
            value=model.value +1,
            numberOfClicks = model.numberOfClicks + 1
            }, Cmd.none)
        Decrement ->  ({
            value=model.value - 1,
            numberOfClicks = model.numberOfClicks + 1
            }, Cmd.none)
        InitModel ->  initialModel()
        _ -> (model, Cmd.none)
    

main = 
    element
        {
            init = initialModel,
            update = update,
            view = view,
            subscriptions = \_ -> Sub.none
        }





