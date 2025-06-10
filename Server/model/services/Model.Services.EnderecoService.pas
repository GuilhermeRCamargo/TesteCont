unit Model.Services.EnderecoService;

interface

uses
  System.Generics.Collections, Model.Interfaces.IEnderecoProvider,
  Model.Entities.TEndereco;

type
  TEnderecoService = class
  private
    FProviders: TList<IEnderecoProvider>;
  public
    constructor Create;
    destructor Destroy; override;
    function BuscarEndereco(const CEP: string): TEndereco;
    procedure AdicionarProvider(const Provider: IEnderecoProvider);
  end;

implementation

uses
  System.SysUtils;

{ TEnderecoService }

constructor TEnderecoService.Create;
begin
  FProviders := TList<IEnderecoProvider>.Create;
end;

destructor TEnderecoService.Destroy;
begin
  FProviders.Free;
  inherited;
end;

procedure TEnderecoService.AdicionarProvider(const Provider: IEnderecoProvider);
begin
  FProviders.Add(Provider);
end;

function TEnderecoService.BuscarEndereco(const CEP: string): TEndereco;
begin
  for var Provider: IEnderecoProvider in FProviders do
    try
      Result := Provider.Buscar(CEP);
      if Assigned(Result) then
        Exit;
    except
      on E: Exception do
        Continue;
    end;
  raise Exception.Create('Nenhum serviço conseguiu localizar o endereço.');
end;

end.
