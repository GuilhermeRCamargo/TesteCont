unit Provider.Endereco.ViaCepProvider;

interface

uses
  Model.Entities.TEndereco, Model.Interfaces.IEnderecoProvider;

type
  TViaCepProvider = class(TInterfacedObject, IEnderecoProvider)
  public
    function Buscar(const ACEP: string): TEndereco;
  end;

implementation

uses
  Shared.REST.RestClientHelper, System.JSON, Shared.JSON.JSONHelper, System.SysUtils;

function TViaCepProvider.Buscar(const ACEP: string): TEndereco;
const URL = 'https://viacep.com.br/ws/%s/json/';
begin
  Result := nil;
  try
    var JSON: TJSONObject := TRestClientHelper.GetJSON(Format(URL, [ACEP]));
    if Assigned(JSON) then
    try
      if not (JSON.GetValue('erro') is TJSONTrue) then
      begin
        Result := TEndereco.Create;
        Result.CEP := TJSONHelper.GetJSONStringValue(JSON, 'cep');
        Result.Logradouro := TJSONHelper.GetJSONStringValue(JSON, 'logradouro');
        Result.Complemento := TJSONHelper.GetJSONStringValue(JSON, 'complemento');
        Result.Unidade := TJSONHelper.GetJSONStringValue(JSON, 'unidade');
        Result.Bairro := TJSONHelper.GetJSONStringValue(JSON, 'bairro');
        Result.Cidade := TJSONHelper.GetJSONStringValue(JSON, 'localidade');
        Result.UF := TJSONHelper.GetJSONStringValue(JSON, 'uf');
        Result.Gia := TJSONHelper.GetJSONStringValue(JSON, 'gia');
        Result.IBGE := TJSONHelper.GetJSONStringValue(JSON, 'ibge');
        Result.SIAFI := TJSONHelper.GetJSONStringValue(JSON, 'siafi');
        Result.DDD := TJSONHelper.GetJSONStringValue(JSON, 'ddd');
        Result.Estado := TJSONHelper.GetJSONStringValue(JSON, 'estado');
        Result.Regiao := TJSONHelper.GetJSONStringValue(JSON, 'regiao');
      end;
    finally
      JSON.Free;
    end;
  finally
    result := nil;
  end;
end;


end.

