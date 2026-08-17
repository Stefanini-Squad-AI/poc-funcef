unit fCadOrcamTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, wwdbedit, TEdNum, wwdblook, TREdit,
  Wwdbspin;

type
  TfrmCadOrcamTrein = class(TfrmCadMestreDetalheCS)
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    dbspeAno: TwwDBSpinEdit;
    Label6: TLabel;
    dbedOcor: TDBRealEdit;
    Label2: TLabel;
    cmbCCusto: TwwDBLookupCombo;
    Label5: TLabel;
    ednHoras: TEditNum;
    Label4: TLabel;
    redCusto: TRealEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryCCusto: TwwQuery;
    qryCCustoNOME: TStringField;
    qryCCustoCODCENTROCUSTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure dbedOcorChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AtualizarDados(ID: string);    
  public
    { Public declarations }
  end;

var
  frmCadOrcamTrein: TfrmCadOrcamTrein;

implementation

uses uMensErro, uDataBase, uSistema, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadOrcamTrein.AtualizarDados(ID: string);
begin
  qry.Close;
  qry.ParamByName('IDCURSO').asString := ID;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDCURSO').asString := ID;
  qryDet.Open;
end;

procedure TfrmCadOrcamTrein.FormCreate(Sender: TObject);
begin
  inherited;
  qryCCusto.Close;
  with (qryCCusto.SQL) do
  begin
    Clear;
    Add('SELECT CODCENTROCUSTO, NOME FROM CENTCUST');
    Add('WHERE IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    if (sUsuXccusto <> '') then
      Add(' AND CODCENTROCUSTO IN ' + sUsuXccusto);
    Add('ORDER BY UPPER(NOME)');
  end;
  qryCCusto.Open;

  AtualizarDados('-1');

  sbtnProcurarClick(Self);
end;

procedure TfrmCadOrcamTrein.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.DisableControls;
  qryDet.DisableControls;

  qry.Close;
  qryDet.Close;

  qry.UnPrepare;
  qryDet.UnPrepare;
  inherited;
end;

procedure TfrmCadOrcamTrein.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  // Para fazer a procura na criação do Formulário
end;

procedure TfrmCadOrcamTrein.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.RetornouValor) then
    AtualizarDados(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadOrcamTrein.qryDetAfterInsert(DataSet: TDataSet);
var
  wAno, wMes, wDia: word;
begin
  inherited;
  qryDet.FieldByName('IDORCAMTREIN').asFloat := LeUltRegistro(nil,'OrcamTrein');
  qryDet.FieldByName('IDCURSO').asFloat      := qry.FieldByName('IDCURSO').asFloat;
  DecodeDate(Date, wAno, wMes, wDia);
  qryDet.FieldByName('ANO').asInteger := wAno + 1;
end;

procedure TfrmCadOrcamTrein.dbedOcorChange(Sender: TObject);
begin
  if (qry.Active) then
  begin
    ednHoras.Text := FloatToStr(StrToIntDef(dbedOcor.Text,0) *
      (qry.FieldByName('DUR_TEOR').asInteger + qry.FieldByName('DUR_PRAT').asInteger));
    redCusto.Value := StrToIntDef(dbedOcor.Text,0) * qry.FieldByName('VALOR').asFloat;
  end;
end;

procedure TfrmCadOrcamTrein.bbtnOkDetClick(Sender: TObject);
begin
  if (dbedOcor.Value = 0) then
  begin
    MsgDlg('Informe a Quantidade de Ocorrências','Aviso',mtInformation,[mbOK],0);
    dbedOcor.SetFocus;
    exit;
  end;

  if (sUsuXccusto <> '') and (Trim(cmbCCusto.Text) = '') then
  begin
    MsgDlg('Informe o Centro de Custo','Aviso',mtInformation,[mbOK],0);
    cmbCCusto.SetFocus;
    exit;
  end;

  if (cmbCCusto.Value <> '') then
    qryDet.FieldByName('IDEMPRESA').asFloat := Sistema.IdEmpresa
  else
    qryDet.FieldByName('IDEMPRESA').Clear;

  inherited;
end;

procedure TfrmCadOrcamTrein.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
end;

end.
