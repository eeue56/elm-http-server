module LowLevel
    exposing
        ( listen
        , Settings
        , respond
        , close
        , Server
        , Request
        )

import Task exposing (Task)
import Json.Encode as Json
import Native.Server


type Server
    = Server


type alias RequestRecord =
    { request : Json.Value
    , response : Json.Value
    }


type Request
    = Request RequestRecord


{-| Attempt to listen to a particular port.
-}
listen : Int -> Settings -> Task x Server
listen portNumber settings =
    Native.Server.listen portNumber settings


{-|
-}
type alias Settings =
    { onRequest : Request -> Task Never ()
    , onClose : () -> Task Never ()
    }


{-| Respond to the request with the given body
-}
respond : Request -> String -> Task x ()
respond request body =
    Native.Server.respond request body


{-| Close a server's connection
-}
close : Server -> Task x ()
close =
    Native.Server.close
