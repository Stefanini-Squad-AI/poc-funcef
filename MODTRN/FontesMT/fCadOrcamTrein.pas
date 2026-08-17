unit fCadOrcamTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, TB97, StdCtrls,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls,
  wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, ImgList, fCadastroMestreDetMT, DBClient,
  TEdNum, TREdit, uCMClientDataSet, uCtrlOrcamTrein;

type
  TfrmCadOrcamTrein = class(TFrmCadastroMestreDetMT)
    Label10: TLabel;
    dbedNome: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    CdsCCusto: TCMClientDataSet;
    Label3: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    dbspeAno: TwwDBSpinEdit;
    dbedOcor: TDBRealEdit;
    cmbCCusto: TwwDBLookupCombo;
    redCusto: TRealEdit;
    ednHoras: TRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dbedOcorChange(Sender: TObject);
    procedure cmbCCustoChange(Sender: TObject);
  private
    CtrlOrcamTrein: TCtrlOrcamTrein;

    procedure Sel(IdCurso: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadOrcamTrein: TfrmCadOrcamTrein;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadOrcamTrein.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlOrcamTrein := TCtrlOrcamTrein.Create;
  CtrlOrcamTrein.InitializeAs(Padroes);
  CtrlOrcamTrein.CdsDet := CdsDet;
  Sel(-1);

  sbtnProcurarClick(Sender);

  CdsCCusto.Data := CtrlOrcamTrein.ListCentroCusto(Sistema.IdEmpresa,
    CtrlUsoGeralRH.UsuXCCusto);
end;

procedure TfrmCadOrcamTrein.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlOrcamTrein);
  inherited;
end;

procedure TfrmCadOrcamTrein.CmeDetalheInsert(Sender: TObject);
var
  wAno, wMes, wDia: word;
begin
  inherited;
  CdsDet.FieldByName('IDCURSO').asFloat := Cds.FieldByName('IDCURSO').asFloat;
  DecodeDate(Date, wAno, wMes, wDia);
  CdsDet.FieldByName('ANO').asInteger := wAno + 1;
end;

procedure TfrmCadOrcamTrein.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadOrcamTrein.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadOrcamTrein.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadOrcamTrein.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dbspeAno.CanFocus) then
    dbspeAno.SetFocus;
end;

procedure TfrmCadOrcamTrein.dbedOcorChange(Sender: TObject);
begin
  if (Cds.State in [dsInsert, dsEdit]) then
  begin
    ednHoras.Value := StrToIntDef(dbedOcor.Text,0) *
      (Cds.FieldByName('DUR_TEOR').asFloat + Cds.FieldByName('DUR_PRAT').asFloat);
    redCusto.Value := StrToIntDef(dbedOcor.Text,0) * Cds.FieldByName('VALOR').asFloat;
  end;
end;

procedure TfrmCadOrcamTrein.cmbCCustoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('CENTRO_CUSTO').asString := Trim(cmbCCusto.Text);
end;

procedure TfrmCadOrcamTrein.bbtnOkDetClick(Sender: TObject);
begin
  if (dbedOcor.Value = 0) then
  begin
    MsgDlg('Informe a Quantidade de Ocorrências.', 'Aviso', mtInformation, [mbOk], 0);
    dbedOcor.SetFocus;
  end
  else
  if (CtrlUsoGeralRH.UsuXCCusto <> '') and (Trim(cmbCCusto.Text) = '') then
  begin
    MsgDlg('Informe o Centro de Custo.', 'Aviso', mtInformation, [mbOk], 0);
    cmbCCusto.SetFocus;
  end
  else
  begin
    if (cmbCCusto.Value <> '') then
      CdsDet.FieldByName('IDEMPRESA').asFloat := Sistema.IdEmpresa
    else
      CdsDet.FieldByName('IDEMPRESA').Clear;

    inherited;
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadOrcamTrein.Sel(IdCurso: double);
begin
  Cds.Data := CtrlOrcamTrein.ListMestre(IdCurso);
  CdsDet.Data := CtrlOrcamTrein.ListDetalhe(IdCurso);
end;

function TfrmCadOrcamTrein.GravarRegistro: boolean;
begin
  Result := CtrlOrcamTrein.Gravar;
  if not(Result) then
    raise exception.Create(CtrlOrcamTrein.MessageInfo);
end;

end.
