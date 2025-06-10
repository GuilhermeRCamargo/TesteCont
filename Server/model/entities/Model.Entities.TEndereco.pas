unit Model.Entities.TEndereco;

interface

uses System.JSON;

type
  TEndereco = class
  strict private
    FBairro: string;
    FCep: string;
    FCidade: string;
    FComplemento: string;
    FDDD: string;
    FDistrito: string;
    FEstado: string;
    FIbge: string;
    FGia: string;
    FLatitude: string;
    FLocalidade: string;
    FLogradouro: string;
    FLongitude: string;
    FRegiao: string;
    FSiafi: string;
    FTipoLogradouro: string;
    FUf: string;
    FUnidade: string;
  public
    procedure FromJSON(const AJSON: TJSONObject);
    function ToJSON: TJSONObject;
    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property Cidade: string read FCidade write FCidade;
    property Complemento: string read FComplemento write FComplemento;
    property DDD: string read FDDD write FDDD;
    property Distrito: string read FDistrito write FDistrito;
    property Estado: string read FEstado write FEstado;
    property Ibge: string read FIbge write FIbge;
    property Gia: string read FGia write FGia;
    property Latitude: string read FLatitude write FLatitude;
    property Localidade: string read FLocalidade write FLocalidade;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Longitude: string read FLongitude write FLongitude;
    property Regiao: string read FRegiao write FRegiao;
    property Siafi: string read FSiafi write FSiafi;
    property TipoLogradouro: string read FTipoLogradouro write FTipoLogradouro;
    property Uf: string read FUf write FUf;
    property Unidade: string read FUnidade write FUnidade;
  end;


implementation

uses Shared.JSON.JSONHelper, REST.JSON;

{ TEndereco }

procedure TEndereco.FromJSON(const AJSON: TJSONObject);
begin
  FCep := TJSONHelper.GetJSONStringValue(AJSON, 'cep');
  FTipoLogradouro := TJSONHelper.GetJSONStringValue(AJSON, 'tipoLogradouro');
  FLogradouro := TJSONHelper.GetJSONStringValue(AJSON, 'logradouro');
  FComplemento := TJSONHelper.GetJSONStringValue(AJSON, 'complemento');
  FBairro := TJSONHelper.GetJSONStringValue(AJSON, 'bairro');
  FDistrito := TJSONHelper.GetJSONStringValue(AJSON, 'distrito');
  FCidade := TJSONHelper.GetJSONStringValue(AJSON, 'cidade');
  FIbge := TJSONHelper.GetJSONStringValue(AJSON, 'ibge');
  FLatitude := TJSONHelper.GetJSONStringValue(AJSON, 'latitude');
  FLongitude := TJSONHelper.GetJSONStringValue(AJSON, 'longitude');
  FDDD := TJSONHelper.GetJSONStringValue(AJSON, 'dDD');
  FRegiao := TJSONHelper.GetJSONStringValue(AJSON, 'regiao');
  FLocalidade := TJSONHelper.GetJSONStringValue(AJSON, 'localidade');
  FUnidade := TJSONHelper.GetJSONStringValue(AJSON, 'unidade');
  FSiafi := TJSONHelper.GetJSONStringValue(AJSON, 'siafi');
  FGia := TJSONHelper.GetJSONStringValue(AJSON, 'gia');
  FEstado := TJSONHelper.GetJSONStringValue(AJSON, 'estado');
  FUf := TJSONHelper.GetJSONStringValue(AJSON, 'uf');
end;

function TEndereco.ToJSON: TJSONObject;
begin
  result := TJSON.ObjectToJsonObject(Self);
end;

end.
