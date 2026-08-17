unit fAcertaLanctoImovel;
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Gauges,
  wwdbdatetimepicker, CMDateTimePicker, CMSQLScript, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, mImovel, DBClient, uCMClientDataSet,
  uCmSqlParams, uCtrlAcertaLanctoImovel, mContrato, uCMTypes,
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab;

type
  TfrmAcertaLanctoImovel = class(TfrmOkCancelar)
    pnldados: TPanel;
    lblDataInicial: TLabel;
    edtDataInicial: TCMDateTimePicker;
    molImovel : TmolImovel;
    molContrato : TmolContrato;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    lblBem: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    procedure FormCreate(Sender: TObject);
    procedure molImovelbtnBuscaImovelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molContratobtnBuscaContratoClick(Sender: TObject);
    procedure molContratobtnLimpaContratoClick(Sender: TObject);
    procedure molImovelbtnLimpaImovelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlAcertaLanctoImovel : TCtrlAcertaLanctoImovel;
    CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381

  public
    { Public declarations }
  end;

var
  frmAcertaLanctoImovel: TfrmAcertaLanctoImovel;

implementation

uses dBaseDados, uDataBase, uMensErro, dAtivoFixo, uSistema;

{$R *.DFM}

procedure TfrmAcertaLanctoImovel.FormCreate(Sender: TObject);
begin
  inherited;
  molImovel.btnLimpaImovelClick( Self );
  molContrato.btnLimpaContratoClick( Self );
  molContrato.bFiltraModulo := False;
  CtrlAcertaLanctoImovel := TCtrlAcertaLanctoImovel.Create;
  CtrlAcertaLanctoImovel.Initialize( dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                     Sistema.ConnectionSide, sistema.AppRemoteServer, true );
  // Helen - SOL: 172902 KTN: 1577381
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(CtrlAcertaLanctoImovel);
end;

procedure TfrmAcertaLanctoImovel.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  // Helen - SOL: 172902 KTN: 1577381 - Inicio
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataInicial.Text) then
  begin
      MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
      edtDataInicial.SetFocus;
      exit;
  end;
  // Helen - SOL: 172902 KTN: 1577381 - Fim
  With CtrlAcertaLanctoImovel do
  begin
    pnlStatus.Visible := True;
    ProgressBar := self.prgBar;
    lblStatus   := Self.lblStatus;
    DataInicial := edtDataInicial.Date;
    idImovel    := molImovel.iImovel;
    IdContrato  := molContrato.iContrato;
    If Processar then
     MessageDlg('Correção de lançamentos executada com sucesso!',mtInformation,[mbOk],0);
  end;
end;

procedure TfrmAcertaLanctoImovel.molContratobtnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato.btnBuscaContratoClick(Sender);
end;

procedure TfrmAcertaLanctoImovel.molImovelbtnBuscaImovelClick(Sender: TObject);
begin
  inherited;
  molImovel.btnBuscaImovelClick(Sender);
end;

procedure TfrmAcertaLanctoImovel.molContratobtnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato.btnLimpaContratoClick(Sender);
end;

procedure TfrmAcertaLanctoImovel.molImovelbtnLimpaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovel.btnLimpaImovelClick(Sender);
end;

procedure TfrmAcertaLanctoImovel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
end;

end.

