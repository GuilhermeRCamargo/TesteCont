unit Provider.Endereco.ApiCepProvider;

interface

uses
  Model.Entities.TEndereco, Model.Interfaces.IEnderecoProvider;

type
  TApiCepProvider = class(TInterfacedObject, IEnderecoProvider)
  public
    function Buscar(const ACEP: string): TEndereco;
  end;

implementation

uses
  Shared.REST.RestClientHelper, System.JSON, Shared.JSON.JSONHelper, System.SysUtils;

function TApiCepProvider.Buscar(const ACEP: string): TEndereco;
const URL = 'https://cdn.apicep.com/file/apicep/%s.json';
  function NormalizarCEP: string;
  begin
    if Length(ACEP) = 8 then
      result := Format('%s-%s', [
        Copy(ACEP, 1, 5),
        Copy(ACEP, 6, 3)
      ])
    else
      result := ACEP;
  end;
begin
  Result := nil;
  var JSON: TJSONObject := TRestClientHelper.GetJSON(Format(URL, [NormalizarCEP]));
  if Assigned(JSON) then
  try
    if not (JSON.GetValue('erro') is TJSONTrue) then
    begin
      Result := TEndereco.Create;
      Result.CEP := TJSONHelper.GetJSONStringValue(JSON, 'code');
      Result.Logradouro := TJSONHelper.GetJSONStringValue(JSON, 'address');
      Result.Bairro := TJSONHelper.GetJSONStringValue(JSON, 'district');
      Result.Cidade := TJSONHelper.GetJSONStringValue(JSON, 'city');
      Result.UF := TJSONHelper.GetJSONStringValue(JSON, 'state');
    end;
  finally
    JSON.Free;
  end;
end;


end.

