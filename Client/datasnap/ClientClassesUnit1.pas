//
// Created by the DataSnap proxy generator.
// 09/06/2025 22:39:14
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FDataModuleCreateCommand: TDSRestCommand;
    FDataModuleDestroyCommand: TDSRestCommand;
    FGetEnderecoCommand: TDSRestCommand;
    FGetEnderecoCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    function GetEndereco(ACEP: string; const ARequestFilter: string = ''): TJSONObject;
    function GetEndereco_Cache(ACEP: string; const ARequestFilter: string = ''): IDSRestCachedJSONObject;
  end;

const
  TServerMethods1_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods1_DataModuleDestroy: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods1_GetEndereco: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACEP'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONObject')
  );

  TServerMethods1_GetEndereco_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACEP'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

procedure TServerMethods1Client.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TServerMethods1."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TServerMethods1_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

procedure TServerMethods1Client.DataModuleDestroy(Sender: TObject);
begin
  if FDataModuleDestroyCommand = nil then
  begin
    FDataModuleDestroyCommand := FConnection.CreateCommand;
    FDataModuleDestroyCommand.RequestType := 'POST';
    FDataModuleDestroyCommand.Text := 'TServerMethods1."DataModuleDestroy"';
    FDataModuleDestroyCommand.Prepare(TServerMethods1_DataModuleDestroy);
  end;
  if not Assigned(Sender) then
    FDataModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleDestroyCommand.Execute;
end;

function TServerMethods1Client.GetEndereco(ACEP: string; const ARequestFilter: string): TJSONObject;
begin
  if FGetEnderecoCommand = nil then
  begin
    FGetEnderecoCommand := FConnection.CreateCommand;
    FGetEnderecoCommand.RequestType := 'GET';
    FGetEnderecoCommand.Text := 'TServerMethods1.GetEndereco';
    FGetEnderecoCommand.Prepare(TServerMethods1_GetEndereco);
  end;
  FGetEnderecoCommand.Parameters[0].Value.SetWideString(ACEP);
  FGetEnderecoCommand.Execute(ARequestFilter);
  Result := TJSONObject(FGetEnderecoCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.GetEndereco_Cache(ACEP: string; const ARequestFilter: string): IDSRestCachedJSONObject;
begin
  if FGetEnderecoCommand_Cache = nil then
  begin
    FGetEnderecoCommand_Cache := FConnection.CreateCommand;
    FGetEnderecoCommand_Cache.RequestType := 'GET';
    FGetEnderecoCommand_Cache.Text := 'TServerMethods1.GetEndereco';
    FGetEnderecoCommand_Cache.Prepare(TServerMethods1_GetEndereco_Cache);
  end;
  FGetEnderecoCommand_Cache.Parameters[0].Value.SetWideString(ACEP);
  FGetEnderecoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONObject.Create(FGetEnderecoCommand_Cache.Parameters[1].Value.GetString);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FDataModuleCreateCommand.Free;
  FDataModuleDestroyCommand.Free;
  FGetEnderecoCommand.Free;
  FGetEnderecoCommand_Cache.Free;
  inherited;
end;

end.

