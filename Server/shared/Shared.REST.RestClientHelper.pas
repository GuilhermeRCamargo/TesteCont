unit Shared.REST.RestClientHelper;

interface

uses
  REST.Client, REST.Types, System.JSON;

type
  TRestClientHelper = class
  public
    class function GetJSON(const AURL: string): TJSONObject;
  end;

implementation

uses
  System.SysUtils;

class function TRestClientHelper.GetJSON(const AURL: string): TJSONObject;
begin
  Result := nil;
  var Client: TRESTClient := TRESTClient.Create(AURL);
  var Request: TRESTRequest := TRESTRequest.Create(nil);
  try
    Request.Client := Client;
    Request.Method := rmGET;
    Request.Execute;
    if (Request.Response.StatusCode = 200) and (Request.Response.JSONValue is TJSONObject) then
      Result := TJSONObject(Request.Response.JSONValue.Clone as TJSONObject);
  finally
    Request.Free;
    Client.Free;
  end;
end;

end.
