program Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainClient in 'view\MainClient.pas' {FrmMainClient},
  Model.Entities.TEndereco in '..\Server\model\entities\Model.Entities.TEndereco.pas',
  EnderecoController in 'controller\endereco\EnderecoController.pas',
  Model.Services.EnderecoService in 'model\services\Model.Services.EnderecoService.pas',
  ClientClassesUnit1 in 'datasnap\ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'datasnap\ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  Shared.JSON.JSONHelper in '..\Server\shared\Shared.JSON.JSONHelper.pas',
  Model.Entities.TErro in '..\Server\model\entities\Model.Entities.TErro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMainClient, FrmMainClient);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
