unit Model.Services.EnderecoService;

interface

uses
  System.SysUtils, System.JSON,
  Model.Entities.TEndereco,
  ClientClassesUnit1;

type
  TEnderecoService = class
  public
    class function BuscarEndereco(const ACEP: string): TEndereco;
  end;

implementation

{ TEnderecoService }

uses ClientModuleUnit1, Model.Entities.TErro;

class function TEnderecoService.BuscarEndereco(const ACEP: string): TEndereco;  
begin
  Result := nil;
  var Client: TServerMethods1Client := TServerMethods1Client.Create(ClientModule1.DSRestConnection1);
  var JSON: TJSONObject := Client.GetEndereco(ACEP);
  try
    if Assigned(JSON) then
    begin
      var b: boolean;
      if JSON.TryGetValue<boolean>('erro', b) then
      begin
        var Erro: TErro := TErro.Create;
        try
          Erro.FromJSON(JSON);
          raise Exception.Create(Erro.Mensagem);
        finally
          Erro.Free;
        end;
      end
      else
      begin
        Result := TEndereco.Create;
        result.FromJSON(JSON);
      end;
    end;
  finally
    JSON.Free;
  end;
end;

end.

