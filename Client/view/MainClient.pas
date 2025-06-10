unit MainClient;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts;

type
  TFrmMainClient = class(TForm)
    VertScrollBox1: TVertScrollBox;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    edtCEP: TEdit;
    Label1: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Label2: TLabel;
    edtTipoLogradouro: TEdit;
    Layout3: TLayout;
    Label3: TLabel;
    edtLogradouro: TEdit;
    Layout4: TLayout;
    Layout5: TLayout;
    Label4: TLabel;
    edtComplemento: TEdit;
    Layout7: TLayout;
    Layout8: TLayout;
    Label6: TLabel;
    edtBairro: TEdit;
    Layout9: TLayout;
    Label7: TLabel;
    EdtDistrito: TEdit;
    Layout10: TLayout;
    Layout11: TLayout;
    Label8: TLabel;
    EdtCidade: TEdit;
    Layout12: TLayout;
    Label9: TLabel;
    EdtIBGE: TEdit;
    Layout13: TLayout;
    Layout14: TLayout;
    Label10: TLabel;
    EdtLatitude: TEdit;
    Layout15: TLayout;
    Label11: TLabel;
    EdtLongitude: TEdit;
    Layout16: TLayout;
    Layout17: TLayout;
    Label12: TLabel;
    EdtDDD: TEdit;
    Layout18: TLayout;
    Label13: TLabel;
    EdtRegiao: TEdit;
    Layout19: TLayout;
    Label14: TLabel;
    EdtLocalidade: TEdit;
    Layout23: TLayout;
    Layout24: TLayout;
    Label17: TLabel;
    EdtUnidade: TEdit;
    Layout25: TLayout;
    Label18: TLabel;
    EdtSiafi: TEdit;
    Layout26: TLayout;
    Label19: TLabel;
    EdtGia: TEdit;
    ButFechar: TButton;
    butPesquisar: TButton;
    procedure ButFecharClick(Sender: TObject);
    procedure butPesquisarClick(Sender: TObject);
    procedure edtCEPKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: WideChar; Shift: TShiftState);
  strict private
    procedure DoPesquisar;
  public
    { Public declarations }
    procedure ShowMessage(const AMessage: String);
  end;

var
  FrmMainClient: TFrmMainClient;

implementation

{$R *.fmx}

uses EnderecoController, Vcl.Dialogs;

procedure TFrmMainClient.ButFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMainClient.butPesquisarClick(Sender: TObject);
begin
  DoPesquisar;
end;

procedure TFrmMainClient.DoPesquisar;
begin
  var CEPNormalizado: String;
  if TEnderecoController.ValidarCEP(edtCEP.Text, CEPNormalizado) then
    TEnderecoController.BuscarEndereco(CEPNormalizado, Self)
  else
    ShowMessage(Format('O CEP %s não é válido', [edtCEP.Text]));
end;

procedure TFrmMainClient.edtCEPKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
begin
  if Key = vkReturn  then
  begin
    DoPesquisar;
    Key := 0;
  end;
end;

procedure TFrmMainClient.ShowMessage(const AMessage: String);
begin
  Vcl.Dialogs.Showmessage(AMessage);
end;

end.
