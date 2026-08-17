unit DDemoBO;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ServerDemoBO_TLB, StdVcl, Db, DBTables, Provider, uCtrlCliente,
  uSistema, Dialogs;

type
  TDmDemoBO = class(TRemoteDataModule, IDmDemoBO)
    DbAppServer: TDatabase;
    DspCliente: TDataSetProvider;
    DspTipoCliente: TDataSetProvider;
    DsClienteXTipo: TDataSetProvider;
    DspAllClienteXTipo: TDataSetProvider;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlCliente: TCtrlCliente;
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TDmDemoBO.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TDmDemoBO.RemoteDataModuleCreate(Sender: TObject);
begin
   {**
     Cria-se a instâmcia do objeto de negócio
   **}
   CtrlCliente := TCtrlCliente.Create;
   CtrlCliente.ConnectionSide := CnsServer;
   CtrlCliente.DbConnectionType := CntBde;
   CtrlCliente.DataBase := DbAppServer;

   {**
     Atribui-se os data sets do objeto de negócio aos respectivos providers
   **}

   DspCliente.DataSet := CtrlCliente.Cliente.Qry;
   DspTipoCliente.DataSet := CtrlCliente.TipoCliente.Qry;
   DsClienteXTipo.DataSet := CtrlCliente.ClienteXTipo.Qry;
   DspAllClienteXTipo.DataSet := CtrlCliente.QryAllClienteXTipo;
end;

procedure TDmDemoBO.RemoteDataModuleDestroy(Sender: TObject);
begin
   DbAppServer.Connected := False;
   CtrlCliente.Free;
end;

initialization
  TComponentFactory.Create(ComServer, TDmDemoBO,
    Class_DmDemoBO, ciMultiInstance, tmApartment);
end.
