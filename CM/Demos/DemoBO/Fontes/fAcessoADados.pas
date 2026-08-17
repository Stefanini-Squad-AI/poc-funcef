unit fAcessoADados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlCliente, uSistema, Db, DBClient, MConnect, SConnect, StdCtrls,
  DBTables, ComCtrls;

type
  TFrmAcessoaDados = class(TForm)
    CdsCliente: TClientDataSet;
    CdsTipoCliente: TClientDataSet;
    CdsClientexTipo: TClientDataSet;
    DbLocal: TDatabase;
    Skt: TSocketConnection;
    CdsClienteNOMEDM_CLIENTE: TStringField;
    CdsClienteIDDM_CLIENTE: TFloatField;
    CdsTipoClienteIDDM_TIPOCLIENTE: TFloatField;
    CdsTipoClienteDESCDM_TIPOCLIENTE: TStringField;
    CdsAllClienteXTipo: TClientDataSet;
    CdsClientexTipoDESCDM_TIPOCLIENTE: TStringField;
    CdsClientexTipoIDDM_TIPOCLIENTE: TFloatField;
    CdsClientexTipoIDDM_CLIENTE: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsClienteBeforeOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure CdsTipoClienteBeforeOpen(DataSet: TDataSet);
    procedure CdsClientexTipoBeforeOpen(DataSet: TDataSet);
    procedure CdsAllClienteXTipoBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    {**
      > O Connection (SKT) é utilizado a princípio apenas em tempo de desenho para
        acesso aos providers da aplicação servidora;
      > Deve ser implementado no BeforeOpen dos CLIENTDATASETS o link coms os
        respectivos providers da classe de negócio através do método SETPROVIDER.
        Esse método tem que ser utilizado porque o OWNER do PROVIDER e do CLIENTDATASET são
        diferentes.
        Esse procedimento só deve ser implementado caso a classe de negócio se porte como SERVER
    **}
    CtrlCliente: TCtrlCliente;
  public
    { Public declarations }
  end;

var
  FrmAcessoaDados: TFrmAcessoaDados;

implementation



{$R *.DFM}

procedure TFrmAcessoaDados.FormCreate(Sender: TObject);
begin
   {**
     Cria-se a instâmcia do objeto de negócio
   **}
   CtrlCliente := TCtrlCliente.Create;
   CtrlCliente.ConnectionSide := CnsServer;
   CtrlCliente.DbConnectionType := CntBde;
   CtrlCliente.DataBase := DbLocal;
end;

procedure TFrmAcessoaDados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlCliente.Free;
end;

procedure TFrmAcessoaDados.CdsClienteBeforeOpen(DataSet: TDataSet);
begin
   If (CtrlCliente.ConnectionSide = CnsServer) Then
      CdsCliente.SetProvider(CtrlCliente.Cliente.Dsp);
end;

procedure TFrmAcessoaDados.Button1Click(Sender: TObject);
begin
   CdsCliente.Open;
end;

procedure TFrmAcessoaDados.CdsTipoClienteBeforeOpen(DataSet: TDataSet);
begin
   If (CtrlCliente.ConnectionSide = CnsServer) Then
     CdsTipoCliente.SetProvider(CtrlCliente.TipoCliente.Dsp);
end;

procedure TFrmAcessoaDados.CdsClientexTipoBeforeOpen(DataSet: TDataSet);
begin
   If (CtrlCliente.ConnectionSide = CnsServer) Then
     CdsClientexTipo.SetProvider(CtrlCliente.ClienteXTipo.Dsp);
end;

procedure TFrmAcessoaDados.CdsAllClienteXTipoBeforeOpen(DataSet: TDataSet);
begin
   If (CtrlCliente.ConnectionSide = CnsServer) Then
     CdsAllClienteXTipo.SetProvider(CtrlCliente.DspAllClienteXTipo);
end;

end.
