unit Provider.Endereco.AwesomeApiProvider;

interface

uses
  Model.Entities.TEndereco, Model.Interfaces.IEnderecoProvider;

type
  TAwesomeApiProvider = class(TInterfacedObject, IEnderecoProvider)
  public
    function Buscar(const ACEP: string): TEndereco;
  end;

implementation

uses
  Shared.REST.RestClientHelper, System.JSON, Shared.JSON.JSONHelper, System.SysUtils;

function TAwesomeApiProvider.Buscar(const ACEP: string): TEndereco;
const URL = 'https://cep.awesomeapi.com.br/json/%s';
begin
  Result := nil;
  var JSON: TJSONObject := TRestClientHelper.GetJSON(Format(URL, [ACEP]));
  if Assigned(JSON) then
  try
    if not (JSON.GetValue('erro') is TJSONTrue) then
    begin
      Result := TEndereco.Create;
      Result.CEP := TJSONHelper.GetJSONStringValue(JSON, 'cep');
      Result.Logradouro := TJSONHelper.GetJSONStringValue(JSON, 'address');
      Result.Bairro := TJSONHelper.GetJSONStringValue(JSON, 'district');
      Result.Cidade := TJSONHelper.GetJSONStringValue(JSON, 'city');
      Result.UF := TJSONHelper.GetJSONStringValue(JSON, 'state');
      Result.IBGE := TJSONHelper.GetJSONStringValue(JSON, 'city_ibge');
      Result.DDD := TJSONHelper.GetJSONStringValue(JSON, 'ddd');
      Result.Estado := TJSONHelper.GetJSONStringValue(JSON, 'state');
      Result.Latitude := TJSONHelper.GetJSONStringValue(JSON, 'lat');
      Result.Longitude := TJSONHelper.GetJSONStringValue(JSON, 'lng');
    end;
  finally
    JSON.Free;
  end;
end;


end.
