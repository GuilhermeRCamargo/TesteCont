unit EnderecoController;

interface

uses
  Model.Entities.TEndereco, Model.Services.EnderecoService, MainClient, SysUtils;

type
  TEnderecoController = class
  public
    class procedure BuscarEndereco(const ACEP: string; AView: TFrmMainClient);
    class function ValidarCEP(const ACEP: string; out ACEPNormalizado: string): boolean;
  end;

implementation

{ TEnderecoController }

class procedure TEnderecoController.BuscarEndereco(const ACEP: string; AView: TFrmMainClient);
begin
  if ACEP.Trim = '' then
  begin
    AView.ShowMessage('Informe um CEP válido.');
    Exit;
  end;
  var Endereco: TEndereco;
  try
    Endereco := TEnderecoService.BuscarEndereco(ACEP);
    try
      if Assigned(Endereco) then
      begin
        AView.edtCEP.Text := Endereco.Cep;
        AView.edtTipoLogradouro.Text := Endereco.TipoLogradouro;
        AView.edtLogradouro.Text := Endereco.Logradouro;
        AView.edtComplemento.Text := Endereco.Complemento;
        AView.edtBairro.Text := Endereco.Bairro;
        AView.EdtDistrito.Text := Endereco.Distrito;
        AView.EdtCidade.Text := Endereco.Cidade;
        AView.EdtIBGE.Text := Endereco.Ibge;
        AView.EdtLatitude.Text := Endereco.Latitude;
        AView.EdtLongitude.Text := Endereco.Longitude;
        AView.EdtDDD.Text := Endereco.DDD;
        AView.EdtRegiao.Text := Endereco.Regiao;
        AView.EdtLocalidade.Text := Endereco.Localidade;
        AView.EdtUnidade.Text := Endereco.Unidade;
        AView.EdtSiafi.Text := Endereco.Siafi;
        AView.EdtGia.Text := Endereco.Gia;
      end
      else
        AView.ShowMessage('Endereço não encontrado.');
    except
      on E: Exception do
        AView.ShowMessage('Erro ao buscar endereço: ' + E.Message);
    end;
  finally
    Endereco.Free;;
  end;
end;

class function TEnderecoController.ValidarCEP(const ACEP: string;
  out ACEPNormalizado: string): boolean;
const TAMANHO_CEP = 8;
begin
  ACEPNormalizado := '';
  for var i: integer := 1 to Length(ACEP) do
    if ACEP[i] in ['0'..'9'] then
      ACEPNormalizado := ACEPNormalizado + ACEP[i];
  result := Length(ACEPNormalizado) = TAMANHO_CEP;
end;

end.

