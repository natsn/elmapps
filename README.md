# Guide to learning Elm

Thank the creator of Elm and BDFL, Evan Czaplicki.

I would highly recommend _reading_ the guide and _writing_ elm code before watching any videos.

 - Read the [Guide](https://guide.elm-lang.org). This is a gitbook by the creator of Elm
 - [Try Elm](elm-lang.org/try) out in the browser. (_Hint - try the stuff from the book_)
 - Watch a [video series](https://egghead.io/courses/start-using-elm-to-build-web-applications) to remind yourself of the concepts.
 - Complete the [Elm for beginners](http://courses.knowthen.com/p/elm-for-beginners) course over the weekend
 - Complete the [exercises](https://github.com/knowthen/elm) for that course
 - Oh! And setup your computer to to Eλmy stuff:

# Dev Setup For Elm

 - Install [NodeJS LTS](https://nodejs.org/en/)
 - Install elm with `npm install -g elm`
 - Configure [atom](https://github.com/knowthen/elm/blob/master/DEVSETUP.md).
   - `elm-oracle`, `elm-format`, `linter-elm-make` to lint on save.

# Notes

 - [Code is the Easy Part](https://www.youtube.com/watch?v=DSjbTC-hvqQ) by Evan Czaplicki

ELM Apps use this terminology for talking about it's design pattern.

 - Model
 - Update
 - View
 - Subscribers
 - Commands

Nice [overview video](https://egghead.io/lessons/elm-create-apps-using-the-elm-application-architecture) of the architecture

Everything is an expression in elm, that's why theres no `return` statement

All data is immutable in Elm

Elm is strongly typed - there is not implicit type conversion. If a function takes a String you can't give it a Number, you must explicitly convert it to a String (2 -> "2")

Elm has a friendly compiler :) Very verbose and likes to suggest things.


# Pure functions
 - No Side effects
 - Reusable
 - Composable
 - Testable
 - Cacheable
 - ...


# Imports
Import everything from Html into our modules namespace
```
import Html exposing (..)
```

Import a few things from Html into our modules namespace
```
import Html exposing (text, div)
```

# Types

Parameterized type

```
view : Model -> Html Msg
```

Union type

```
type Msg
  = Increment
  | Decrement
```

Type aliasing (call an Int by Model)

```
type alias Model =
  Int
```


random questions
What is the technical difference between a statement and an expression?

Example : if/else in Elm, vs. if in other langs.

If elm is meant for front end web applications why does the html package come seperate?

Baby app ideas:

 - Show random ascii art [face](https://egghead.io/lessons/elm-create-apps-using-the-elm-application-architecture)
 - Searchable ascii art faces (face with searchable keywords, click to show matching faces)
