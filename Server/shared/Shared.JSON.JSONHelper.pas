unit Shared.JSON.JSONHelper;

interface

uses
  System.JSON;

type
  TJSONHelper = class
  public
    class function GetJSONStringValue(AJson: TJSONObject; const AKey: string): string;
  end;

implementation

uses
  System.SysUtils;

{ TJSONHelper }

class function TJSONHelper.GetJSONStringValue(AJson: TJSONObject; const AKey: string): string;
begin
  Result := EmptyStr;
  if not Assigned(AJson) then
    Exit;
  var JSONValue: TJSONValue := AJson.GetValue(AKey);
  if Assigned(JSONValue) and (JSONValue is TJSONString) then
    Result := TJSONString(JSONValue).Value;
end;


end.
