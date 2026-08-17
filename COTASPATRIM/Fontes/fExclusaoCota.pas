unit fExclusaoCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBClient,
  uCMClientDataSet, uCtrlAtivo, dBaseDados, uSistema, uMensErro, Mask,
  DBCtrls, wwdbdatetimepicker, uCtrlCpValorCota;

type
  TfrmExclusaoCota = class(TfrmOkCancelar)
    CdsAtivo: TCMClientDataSet;
    lblAtivo: TLabel;
    dblkpAtivo: TCMDBLookupCombo;
    grpDadosCota: TGroupBox;
    cdsListaCotas: TCMClientDataSet;
    dtsValorCota: TDataSource;
    lblData: TLabel;
    lblValorCota: TLabel;
    dbedtVALOR: TDBEdit;
    lblSituacao: TLabel;
    dbedtStatus: TDBEdit;
    dtCota: TwwDBDateTimePicker;
    lblListaCotas: TLabel;
    dblkpCotas: TCMDBLookupCombo;
    cdsValorCota: TCMClientDataSet;
    dbedtValida: TDBEdit;
    lblValida: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpAtivoChange(Sender: TObject);
    procedure cdsListaCotasAfterOpen(DataSet: TDataSet);
    procedure dblkpCotasChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlAtivo : TCtrlAtivo;
    CtrlCpValorCota : TCtrlCpValorCota;
  public
    procedure MsgErro( sMsg : string );
    procedure SelecionaAtivo;
    procedure SelecionaCota;
  end;

var
  frmExclusaoCota: TfrmExclusaoCota;

implementation

{$R *.DFM}

procedure TfrmExclusaoCota.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CdsAtivo.Data := CtrlAtivo.CarregaAtivo;

  CtrlCpValorCota := TCtrlCpValorCota.Create;
  CtrlCpValorCota.InitializeAs( CtrlAtivo );
end;

procedure TfrmExclusaoCota.FormDestroy(Sender: TObject);
begin
  CtrlAtivo.Free;
  CtrlCpValorCota.Free;
  inherited;     
end;

procedure TfrmExclusaoCota.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
end;

procedure TfrmExclusaoCota.dblkpAtivoChange(Sender: TObject);
begin
  inherited;
  SelecionaAtivo;
end;

procedure TfrmExclusaoCota.SelecionaAtivo;
begin
  if ( dblkpAtivo.Text <> '' ) and ( dblkpAtivo.LookupValue <> '' ) then
  begin
    cdsListaCotas.Data := CtrlCpValorCota.ListaCotasExclusao( StrToInt( dblkpAtivo.LookupValue ) );
    dblkpCotas.Enabled := True;
  end
  else
  begin
    cdsListaCotas.Data := CtrlCpValorCota.ListaCotasExclusao( -1 );
    dblkpCotas.Enabled := False;
  end;
  dblkpCotas.Clear;
  SelecionaCota;
end;

procedure TfrmExclusaoCota.cdsListaCotasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField( DataSet.FieldByName('VALOR') ).DisplayFormat := '#,##0.000000';
  TDateTimeField( DataSet.FieldByName('DTCOTA') ).DisplayFormat := 'dd/mm/yyyy';
end;

procedure TfrmExclusaoCota.SelecionaCota;
begin
  cdsValorCota.Close;
  if ( dblkpCotas.Text <> '' ) and ( dblkpCotas.LookupValue <> '' ) then
  begin
    cdsValorCota.Data := CtrlCpValorCota.DadosCota( StrToInt( dblkpCotas.LookupValue ) );
    bbtnConfirmar.Enabled := True;
  end
  else
  begin              
    bbtnConfirmar.Enabled := False;
  end;
end;

procedure TfrmExclusaoCota.dblkpCotasChange(Sender: TObject);
begin
  inherited;
  SelecionaCota;
end;

procedure TfrmExclusaoCota.bbtnConfirmarClick(Sender: TObject);
var
  bContinua : boolean;
begin
  inherited;
  if cdsValorCota.FieldByName('FLGVALIDO').AsString = 'S' then
    bContinua := MessageDlg( 'Esta cota é válida para cálculos de cotas posteriores. Sua exclusão ' +
     'fará com que a cota anterior desta data, caso exista, seja considerada ' +
     'novamente como válida.'+#13+#10+'Confirma exclusão da cota selecionada?', mtConfirmation, [mbYes, mbNo], 0)= mrYes
  else
    bContinua := MessageDlg( 'Confirma exclusão da cota selecionada?', mtConfirmation, [mbYes, mbNo], 0)= mrYes;

  if not bContinua then exit;

  if CtrlCpValorCota.ExclusaoCota( cdsValorCota.FieldByName('IDCPVALORCOTA').AsInteger, cdsValorCota.FieldByName('FLGVALIDO').AsString = 'S' ) then
  begin
    MsgDlg( 'Cota excluída com sucesso.', 'Atenção', mtInformation, [mbOk], 0 );
    dblkpAtivo.Clear;
    SelecionaAtivo;
  end;
  
end;

end.
