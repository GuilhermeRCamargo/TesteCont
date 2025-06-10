unit ServerMethods;

interface

uses
  System.SysUtils, System.Classes, System.Json, Datasnap.DSServer,
   Datasnap.DSAuth, Model.Services.EnderecoService;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  strict private
    FEnderecoService: TEnderecoService;
  public
    function GetEndereco(const ACEP: String): TJSONObject;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses
  System.StrUtils, Provider.Endereco.ViaCepProvider,
   Model.Entities.TEndereco, Provider.Endereco.ApiCepProvider,
   Provider.Endereco.AwesomeApiProvider, Model.Entities.TErro,
   Datasnap.DSHTTP;

procedure TServerMethods1.DataModuleCreate(Sender: TObject);
begin
  FEnderecoService := TEnderecoService.Create;
  FEnderecoService.AdicionarProvider(TViaCepProvider.Create);
  FEnderecoService.AdicionarProvider(TApiCepProvider.Create);
  FEnderecoService.AdicionarProvider(TAwesomeApiProvider.Create);
end;

procedure TServerMethods1.DataModuleDestroy(Sender: TObject);
begin
  FEnderecoService.Free;
end;

function TServerMethods1.GetEndereco(const ACEP: String): TJSONObject;
begin
  try
    var Endereco: TEndereco := FEnderecoService.BuscarEndereco(ACEP);
    try
      Result := Endereco.ToJSON;
    finally
      Endereco.Free;
    end;
  except
    on e: exception do
    begin
      var Erro: TErro := TErro.Create(e.Message);
      try
        var JSONErro: TJSONObject := Erro.ToJSON;
        try
          result := JSONErro.Clone AS TJSONObject;
        finally
          JSONErro.Free;
        end;
      finally
        Erro.Free;
      end;
    end;
  end;
end;

end.

