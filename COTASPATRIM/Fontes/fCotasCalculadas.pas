unit fCotasCalculadas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, wwdblook,
  CMDBLookupCombo, Mask, DBCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  uCtrlAtivo, dBaseDados, uSistema, uMensErro, uCtrlCpValorCota;

type
  TfrmCotasCalculadas = class(TfrmOkCancelar)
    cdsValorCota: TCMClientDataSet;
    cdsSaldoConta: TCMClientDataSet;
    cdsAtivo: TCMClientDataSet;
    pnlCota: TPanel;
    lblAtivo: TLabel;
    lblDataInicial: TLabel;
    dblkpAtivo: TCMDBLookupCombo;
    cmbData: TComboBox;
    lblValorCota: TLabel;
    dbedtVALOR: TDBEdit;
    dtsValorCota: TDataSource;
    pnlDados: TPanel;
    PageControl: TPageControl;
    tabContas: TTabSheet;
    tabRegra: TTabSheet;
    dbgrdFundos: TwwDBGrid;
    lblNumero: TLabel;
    dbedtIDREGRA: TDBEdit;
    dbedtNomeRegra: TDBEdit;
    lblNome: TLabel;
    dbmemQUERYENTRADA: TDBMemo;
    lblQueryEntrada: TLabel;
    dtsSaldoConta: TDataSource;
    tabCalculo: TTabSheet;
    dbedtDataCalc: TDBEdit;
    lblDataCalculo: TLabel;
    Label1: TLabel;
    dbedtStatus: TDBEdit;
    lblProcesso: TLabel;
    dbedtProcesso: TDBEdit;
    lblUsuario: TLabel;
    dbedtUsuario: TDBEdit;
    tabDados: TTabSheet;
    lblSLDAPLICADO: TLabel;
    lblSLDATIVOANT: TLabel;
    lblSAIDAINVEST: TLabel;
    lblENTRINVEST: TLabel;
    lblSALDOANTCTA: TLabel;
    lblSALDOATUCTA: TLabel;
    lblENTRRENT: TLabel;
    lblSAIDARENT: TLabel;
    edtSLDAPLICADO: TEdit;
    edtENTRRENT: TEdit;
    edtSLDATIVOANT: TEdit;
    edtSALDOANTCTA: TEdit;
    edtSALDOATUCTA: TEdit;
    edtSAIDAINVEST: TEdit;
    edtENTRINVEST: TEdit;
    edtSAIDARENT: TEdit;
    cdsQuery: TCMClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdsValorCotaAfterOpen(DataSet: TDataSet);
    procedure cdsSaldoContaAfterOpen(DataSet: TDataSet);
    procedure dblkpAtivoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbDataChange(Sender: TObject);
  private
    CtrlAtivo : TCtrlAtivo;
    CtrlCpValorCota : TCtrlCpValorCota;
  public

    procedure MsgErro( sMsg : string );

    procedure SelecionaCota;

    //Modo: 1 = Resultados de execução; 2 = Visualização na janela de execuções
    class procedure Modo( _iModo : integer );
  end;

var
  frmCotasCalculadas: TfrmCotasCalculadas;

implementation

var
  iModo : integer;

{$R *.DFM}

procedure TfrmCotasCalculadas.FormShow(Sender: TObject);
var
  sAux : string;
begin
  inherited;
  pnlCota.Enabled := ( iModo = 1 );

  sAux := '';
  cdsValorCota.Last;
  while not cdsValorCota.Bof do
  begin
    if sAux <> '' then sAux := sAux + ', ';
    sAux := sAux + cdsValorCota.FieldByName('IDCPATIVO').AsString;
    if cmbData.Items.IndexOf( FormatDateTime( 'dd/mm/yyyy', cdsValorCota.FieldByName('DTCOTA').AsDateTime ) ) < 0 then
      cmbData.Items.Add( FormatDateTime( 'dd/mm/yyyy', cdsValorCota.FieldByName('DTCOTA').AsDateTime ) );
    cdsValorCota.Prior;
  end;

  CdsAtivo.Data := CtrlAtivo.CarregaAtivo( sAux );

  cmbData.ItemIndex := 0;
  dblkpAtivo.LookupValue := cdsAtivo.FieldByName('IDCPATIVO').AsString;

  SelecionaCota;
end;

class procedure TfrmCotasCalculadas.Modo(_iModo: integer);
begin
  iModo := _iModo;
end;

procedure TfrmCotasCalculadas.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlCpValorCota := TCtrlCpValorCota.Create;
  CtrlCpValorCota.InitializeAs( CtrlAtivo );

  tb97OkCancelar.Visible := ( iModo = 1 );
  tb97Fundo.Visible      := ( iModo = 2 );

  PageControl.ActivePage := tabContas;
end;

procedure TfrmCotasCalculadas.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
end;

procedure TfrmCotasCalculadas.FormDestroy(Sender: TObject);
begin
  CtrlAtivo.Free;
  CtrlCpValorCota.Free;
  inherited;  
end;

procedure TfrmCotasCalculadas.cdsValorCotaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField( DataSet.FieldByName('VALOR') ).DisplayFormat := '#,##0.000000';
  TDateTimeField( DataSet.FieldByName('DTCALCULO') ).DisplayFormat := 'dd/mm/yyyy';
end;

procedure TfrmCotasCalculadas.cdsSaldoContaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField( DataSet.FieldByName('SALDOCOTAS') ).DisplayFormat := '#,##0.000000';
  TFloatField( DataSet.FieldByName('VALOR') ).DisplayFormat      := '#,##0.000000';
end;

procedure TfrmCotasCalculadas.SelecionaCota;
var
  fTotalValor, fTotalCotas : extended;
begin
  if iModo = 2 then
  begin
    cdsSaldoConta.Close;
    cdsSaldoConta.Data := CtrlCpValorCota.SaldoConta(
    cdsValorCota.FieldByName('IDCPVALORCOTA').AsInteger, 0, 0, cdsValorCota.FieldByName('IDCPATIVO').AsInteger, 0, cdsValorCota.FieldByName('VALOR').AsFloat );
  end
  else
  begin
    cdsValorCota.First;
    cdsValorCota.Locate( 'IDCPATIVO;DTCOTA', VarArrayOf( [ dblkpAtivo.LookupValue, StrToDate( cmbData.Text ) ] ), [] );
    cdsSaldoConta.Filtered := False;
    cdsSaldoConta.Filter := 'IDCPVALORCOTA = ' + cdsValorCota.FieldByName('IDCPVALORCOTA').AsString;
    cdsSaldoConta.Filtered := True;
  end;

  fTotalValor   := 0;
  fTotalCotas := 0;
  cdsSaldoConta.First;
  while not cdsSaldoConta.Eof do
  begin
    fTotalValor := fTotalValor + cdsSaldoConta.FieldByName('VALOR').AsFloat;
    fTotalCotas := fTotalCotas + cdsSaldoConta.FieldByName('SALDOCOTAS').AsFloat;
    cdsSaldoConta.Next;
  end;
  cdsSaldoConta.First;

  dbgrdFundos.Columns[0].FooterValue := 'TOTAL';
  dbgrdFundos.Columns[1].FooterValue := FormatFloat( '#,##0.000000' , fTotalCotas );
  dbgrdFundos.Columns[2].FooterValue := FormatFloat( '#,##0.000000' , fTotalValor );

  edtSLDAPLICADO.Text := '';
  edtSLDATIVOANT.Text := '';
  edtSAIDAINVEST.Text := '';
  edtENTRINVEST.Text  := '';
  edtSALDOANTCTA.Text := '';
  edtSALDOATUCTA.Text := '';
  edtENTRRENT.Text    := '';
  edtSAIDARENT.Text   := '';

  if trim( cdsValorCota.FieldByName('QUERYENTRADA').AsString ) <> '' then
  begin
    cdsQuery.Close;
    cdsQuery.Data := CtrlCpValorCota.GetDataPacket( cdsValorCota.FieldByName('QUERYENTRADA').AsString );

    edtSLDAPLICADO.Text := FormatFloat( '#,##0.00',     cdsQuery.FieldByName( cdsValorCota.FieldByName('NRSLDAPLICADO').AsString ).AsFloat );
    edtSLDATIVOANT.Text := FormatFloat( '#,##0.000000', cdsQuery.FieldByName( cdsValorCota.FieldByName('NRSLDATIVOANT').AsString ).AsFloat );
    edtSAIDAINVEST.Text := FormatFloat( '#,##0.00',     cdsQuery.FieldByName( cdsValorCota.FieldByName('NRSAIDAINVEST').AsString ).AsFloat );
    edtENTRINVEST.Text  := FormatFloat( '#,##0.00',     cdsQuery.FieldByName( cdsValorCota.FieldByName('NRENTRINVEST').AsString ).AsFloat  );
    edtSALDOANTCTA.Text := FormatFloat( '#,##0.00',     cdsQuery.FieldByName( cdsValorCota.FieldByName('NRSALDOANTCTA').AsString ).AsFloat );
    edtSALDOATUCTA.Text := FormatFloat( '#,##0.00',     cdsQuery.FieldByName( cdsValorCota.FieldByName('NRSALDOATUCTA').AsString ).AsFloat );
    edtENTRRENT.Text    := FormatFloat( '#,##0.00',     cdsQuery.FieldByName( cdsValorCota.FieldByName('NRENTRRENT').AsString ).AsFloat    );
    edtSAIDARENT.Text   := FormatFloat( '#,##0.00',     cdsQuery.FieldByName( cdsValorCota.FieldByName('NRSAIDARENT').AsString ).AsFloat   );
  end;
end;

procedure TfrmCotasCalculadas.dblkpAtivoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  SelecionaCota;
end;

procedure TfrmCotasCalculadas.cmbDataChange(Sender: TObject);
begin
  inherited;
  SelecionaCota;
end;

end.
