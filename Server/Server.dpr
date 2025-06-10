program Server;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  MainAppServer in 'view\MainAppServer.pas' {Form1},
  ServerMethods in 'controller\ServerMethods.pas' {ServerMethods1: TDataModule},
  WebModule in 'view\WebModule.pas' {WebModule1: TWebModule},
  Model.Entities.TEndereco in 'model\entities\Model.Entities.TEndereco.pas',
  Model.Interfaces.IEnderecoProvider in 'model\interfaces\Model.Interfaces.IEnderecoProvider.pas',
  Model.Services.EnderecoService in 'model\services\Model.Services.EnderecoService.pas',
  Provider.Endereco.ViaCepProvider in 'provider\endereco\Provider.Endereco.ViaCepProvider.pas',
  Shared.REST.RestClientHelper in 'shared\Shared.REST.RestClientHelper.pas',
  Shared.JSON.JSONHelper in 'shared\Shared.JSON.JSONHelper.pas',
  Provider.Endereco.ApiCepProvider in 'provider\endereco\Provider.Endereco.ApiCepProvider.pas',
  Provider.Endereco.AwesomeApiProvider in 'provider\endereco\Provider.Endereco.AwesomeApiProvider.pas',
  Model.Entities.TErro in 'model\entities\Model.Entities.TErro.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
