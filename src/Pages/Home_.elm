module Pages.Home_ exposing (Model, Msg, page)

import Html exposing (Html, div)
import Page exposing (Page)
import Task exposing (..)
import View exposing (View)


page : Page Model Msg
page =
    Page.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- INIT


type alias Model =
    { cities : Cities }


init : ( Model, Cmd Msg )
init =
    ( { cities = [ City "Amriswil" "Switzerland" 14000, City "Zürich" "Switzerland" 4000000, City "Konstanz" "Germany" 85000, City "St. Gallen" "Switzerland" 75000, City "Frauenfeld" "Switzerland" 27000 ]
      }
    , Task.succeed ShuffleCities |> Task.perform identity
    )


identity : a -> a
identity a =
    a



-- UPDATE


type Msg
    = ShuffleCities


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ShuffleCities ->
            ( model
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Pages.Home_"
    , body =
        [ Html.div []
            [ displayCities model.cities ]
        ]
    }


type alias City =
    { name : String
    , country : String
    , population : Int
    }


type alias Cities =
    List City


displayCities : Cities -> Html msg
displayCities cities =
    Html.div [] (List.map displayCity cities)


displayCity : City -> Html msg
displayCity city =
    div [] [ Html.text city.name ]
