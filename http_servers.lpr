program http_servers;

{$mode objfpc}{$H+}

uses
  cthreads,
  http_server, sysutils;

var
  httpSvr: THTTPServer;
begin
  httpSvr := THTTPServer.Create();
  try
    httpSvr.Port:= 8080;
    httpSvr.Threaded:= true;
    try
      WriteLn('HTTP Server running at http://localhost:'+IntToStr(httpSvr.Port));
      httpSvr.Active:= True;
    except
      on E:Exception do
         WriteLn('Failed to start server: ', E.Message);
    end;
    ReadLn;
  finally
    httpSvr.Free;
  end;

end.

