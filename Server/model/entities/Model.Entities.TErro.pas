unit Model.Entities.TErro;

interface

uses 
  System.JSON;

type
  TErro = class
  strict private
    FMensagem: string;
  public
    constructor Create(const AMensagem: string = '');
    procedure FromJSON(const AValue: TJSONObject);
    function ToJSON: TJSONObject;
    property Mensagem: string read FMensagem write FMensagem;
  end;

implementation


constructor TErro.Create(const AMensagem: string);
begin
  FMensagem := AMensagem;
end;

procedure TErro.FromJSON(const AValue: TJSONObject);
begin
  if Assigned(AValue) then
    FMensagem := AValue.GetValue<string>('mensagem', '');
end;

function TErro.ToJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('erro', True);
  Result.AddPair('mensagem', FMensagem);
end;


end.
