var _eeue56$elm_http_server$Native_Server = function(){
    const http = require('http');

    function listen (port, settings) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {

          var server = http.createServer();

          server.on('listening', function () {
            callback(_elm_lang$core$Native_Scheduler.succeed(server));

          });

          server.on('request', function (req, res) {
            var request = {
                ctor: "Request",
                _0: { 
                    request: req,
                    response: res
                }
            };
            _elm_lang$core$Native_Scheduler.rawSpawn(settings.onRequest(request));
          });

          server.on('close', function () {
            _elm_lang$core$Native_Scheduler.rawSpawn(settings.onClose());
          });

          server.listen(port);

          return;
        });
    }

    function respond (request, string) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            request._0.response.end(string);
            callback(_elm_lang$core$Native_Scheduler.succeed({ ctor: '_Tuple0' }));
        });
    }

    function close (server) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            server.close();
            callback(_elm_lang$core$Native_Scheduler.succeed({ ctor: '_Tuple0' }));
        });
    }

    return {
        listen: F2(listen),
        respond: F2(respond),
        close: close
    };
}();

