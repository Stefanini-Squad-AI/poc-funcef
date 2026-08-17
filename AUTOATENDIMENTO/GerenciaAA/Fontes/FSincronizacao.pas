unit FSincronizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FFrameDadosExportados, dBaseDados, uSistema,
  uCtrlWebSincronizacao, uCtrlWebTransfDados, uCtrlWebLogAlteracao,
  Db, DBClient, uCMClientDataSet, DBCtrls;

type
  TfrmSincronizacao = class(TfrmOkCancelar)
    pnlTop: TPanel;
    frameDadosExportados: TframeDadosExportados;
    lblIdWebTransfDados: TLabel;
    lblDtTransf: TLabel;
    lblNomeBase: TLabel;
    cdsWebTransfDados: TCMClientDataSet;
    cdsWebTransfDadosIDWEBTRANSFDADOS: TFloatField;
    cdsWebTransfDadosDTTRANSF: TDateTimeField;
    cdsWebTransfDadosSITUACAO: TStringField;
    cdsWebTransfDadosNOMEBASE: TStringField;
    dbtxtWebTransfDados: TDBText;
    dbtxtData: TDBText;
    dbtxtNomeBase: TDBText;
    dtsWebTransfDados: TDataSource;
    cdsWebTransfDadosDATA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsWebTransfDadosCalcFields(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    WebSincronizacao : TCtrlWebSincronizacao;
    WebTransfDados   : TCtrlWebTransfDados;
    WebLogAlteracao  : TCtrlWebLogAlteracao;

    procedure MsgErro ( sMsg : String );
  public
    { Public declarations }
  end;

var
  frmSincronizacao: TfrmSincronizacao;

implementation

{$R *.DFM}

procedure TfrmSincronizacao.FormCreate(Sender: TObject);
begin
  inherited;
  WebSincronizacao := TCtrlWebSincronizacao.Create;
  WebSincronizacao.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebLogAlteracao := TCtrlWebLogAlteracao.Create;
  WebLogAlteracao.InitializeAs( WebSincronizacao );

  WebTransfDados := TCtrlWebTransfDados.Create;
  WebTransfDados.InitializeAs( WebLogAlteracao );

  cdsWebTransfDados.Data := WebTransfDados.UltimoSincronizado;

  if not cdsWebTransfDados.IsEmpty then
  begin
    frameDadosExportados.cdsWebLogAlteracao_Local.Data :=
     WebLogAlteracao.SelecionaWebLogAlteracaoPorWebTransfDados( cdsWebTransfDadosIDWEBTRANSFDADOS.AsInteger );

    if not frameDadosExportados.cdsWebLogAlteracao_Local.IsEmpty then
    begin
      frameDadosExportados.cdsWebLogAlteracao_Local.First;
      frameDadosExportados.MostraDetalhes;
      frameDadosExportados.lblTotal.Caption := IntToStr( frameDadosExportados.cdsExibe.RecordCount );
      frameDadosExportados.pgrProgresso.Max := frameDadosExportados.cdsExibe.RecordCount;
    end;
  end
  else
  begin
    ShowMessage('A próxima transferência (de número ' +
     IntToStr( WebTransfDados.UltimoIdSincronizado ) + ') ainda não foi importada.');
    bbtnSairClick( Self );
  end;
end;

procedure TfrmSincronizacao.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmSincronizacao.cdsWebTransfDadosCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsWebTransfDadosDATA.AsString := FormatDateTime( 'dd/mm/yyyy hh:nn:ss',
   cdsWebTransfDadosDTTRANSF.AsDateTime );
end;

procedure TfrmSincronizacao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if cdsWebTransfDados.IsEmpty then exit;

  if ( MessageDlg('Confirma sincronização dos dados com base nas informações importadas?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo ) then exit;

  if WebSincronizacao.Sincroniza( cdsWebTransfDadosIDWEBTRANSFDADOS.AsInteger ) then
  begin
    ShowMessage('Dados sincronizados com sucesso.');
    cdsWebTransfDados.Close;
    frameDadosExportados.cdsWebLogAlteracao_Local.Close;
    frameDadosExportados.PreparaDetalhes;
  end
  else
    ShowMessage('Não foi possível sincronizar os dados.');
end;

procedure TfrmSincronizacao.FormDestroy(Sender: TObject);
begin
  inherited;
  WebSincronizacao.Free;
  WebTransfDados.Free;
  WebLogAlteracao.Free;
end;

end.
