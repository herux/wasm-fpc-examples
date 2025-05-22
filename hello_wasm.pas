library hello;

{$mode objfpc}
{$H+}
{$linklib c}

var
  Message: PChar = 'Hello World!';


function Hello: PChar; export; cdecl;
var
  i: Integer;
begin
  result := Message;
end;

exports
  Hello name 'hello';

end.

