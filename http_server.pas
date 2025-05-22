unit http_server;

{$mode ObjFPC}{$H+}

interface

uses
  sysutils, Classes, fphttpserver, HTTPDefs, fphttp;

type

  { THTTPServer }

  THTTPServer = class(TFPHTTPServer)
  private
    function GetMimeTypeFromExt(const Ext: string): string;
  protected
    procedure HandleRequest(Sender: TObject; var ARequest: TFPHTTPConnectionRequest;
      var AResponse: TFPHTTPConnectionResponse);
  public
    constructor Create();
  end;

implementation

{ THTTPServer }

function THTTPServer.GetMimeTypeFromExt(const Ext: string): string;
begin
  case LowerCase(Ext) of
    '.html', '.htm': Result := 'text/html';
    '.css': Result := 'text/css';
    '.js': Result := 'application/javascript';
    '.json': Result := 'application/json';
    '.png': Result := 'image/png';
    '.jpg', '.jpeg': Result := 'image/jpeg';
    '.gif': Result := 'image/gif';
    '.svg': Result := 'image/svg+xml';
    '.ico': Result := 'image/x-icon';
    '.txt': Result := 'text/plain';
    '.pdf': Result := 'application/pdf';
    '.xml': Result := 'application/xml';
    else
      Result := 'application/octet-stream';
  end;
end;

procedure THTTPServer.HandleRequest(Sender: TObject;
  var ARequest: TFPHTTPConnectionRequest;
  var AResponse: TFPHTTPConnectionResponse);
var
  FilePath, MimeType: string;
  FileStream: TFileStream;
begin
  FilePath:= '.' + ARequest.URI;
  if (FilePath = './') or (FilePath = './index.html') then
     FilePath:= './index.html';

  if FileExists(FilePath) then begin

    try
      MimeType := GetMimeTypeFromExt(ExtractFileExt(FilePath));
      FileStream := TFileStream.Create(FilePath, fmOpenRead or fmShareDenyWrite);
      AResponse.ContentStream := FileStream;
      AResponse.ContentType := MimeType;
      AResponse.Code := 200;
      AResponse.CodeText := 'OK';
    except
      on E: Exception do
      begin
        AResponse.Content := 'Error reading file: ' + E.Message;
        AResponse.Code := 500;
      end;
    end;

  end else begin

    AResponse.Content := '404 Not Found';
    AResponse.Code := 404;
    AResponse.CodeText := 'Not Found';

  end;
end;

constructor THTTPServer.Create();
begin
  inherited Create(nil);

  OnRequest:= @HandleRequest;
end;


end.



