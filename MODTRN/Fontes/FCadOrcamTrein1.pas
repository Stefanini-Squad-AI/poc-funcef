unit FCadOrcamTrein1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwtable, wwdblook, Wwquery, TB97,
  TB97Ctls, TB97Tlbr, wwdbedit, CMTree, IvDictio, IvMulti, IvEMulti,
  TREdit, TEdNum, Wwdbspin, MontaSelect, CmEventosCadastro, wwDialog,
  ImgList;

type
  TfrmCadOrcamTrein1 = class(TfrmCadastroGrid)
    ds2: TwwDataSource;
    gbxGrupoFunc: TGroupBox;
    tblCurso: TwwTable;
    tblOrcamTrein: TwwTable;
    dbedDescricao: TwwDBEdit;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    cmbCCusto: TwwDBLookupCombo;
    qryCCusto: TwwQuery;
    qryCCustoCODCENTROCUSTO: TStringField;
    qryCCustoNOME: TStringField;
    dbspeAno: TwwDBSpinEdit;
    ednHoras: TEditNum;
    redCusto: TRealEdit;
    dbedOcor: TDBRealEdit;
    MontaSelectCurso: TMontaSelect;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblOrcamTreinAfterInsert(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbedOcorChange(Sender: TObject);
    procedure tblCursoAfterScroll(DataSet: TDataSet);
    procedure tblOrcamTreinAfterScroll(DataSet: TDataSet);
  private
    iCont, iVlrBotao: integer;
  public
    { Public declarations }
  end;

var
  frmCadOrcamTrein1: TfrmCadOrcamTrein1;

implementation

uses uMensErro, uDataBase, uSistema, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadOrcamTrein1.FormCreate(Sender: TObject);
begin
  inherited;
  tblCurso.Open;
  tblOrcamTrein.Open;

  iCont     := 0;
  iVlrBotao := 0;

  qryCCusto.Close;
  qryCCusto.Sql.Clear;
  qryCCusto.Sql.Add('Select CODCENTROCUSTO, NOME from CENTCUST');
  qryCCusto.Sql.Add(' where IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
  if (sUsuXccusto <> '') then
    qryCCusto.Sql.Add(' and CODCENTROCUSTO IN ' + sUsuXccusto);
  qryCCusto.Sql.Add(' order by upper(NOME)');
  qryCCusto.Open;
  tblCursoAfterScroll(ds2.DataSet);
end;

procedure TfrmCadOrcamTrein1.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  sbtnProcurar.down := false;
  MontaSelectCurso.Executar;
  if (MontaSelectCurso.ValoresChave.Count > 0) and
     (MontaSelectCurso.ValoresChave[0] <> '')  then
  begin
     tblCurso.FindKey([StrToInt(MontaSelectCurso.ValoresChave[0])]);
     tblCursoAfterScroll(ds2.DataSet);
  end;
end;

procedure TfrmCadOrcamTrein1.tblOrcamTreinAfterInsert(DataSet: TDataSet);
var
  wAno, wMes, wDia: word;
begin
  inherited;
  tblOrcamTrein.FieldByName('IdOrcamTrein').AsInteger := LeUltRegistro(nil,'OrcamTrein');
  tblOrcamTrein.FieldByName('IDCURSO').Value := tblCurso.FieldByName('IDCURSO').Value;
  DecodeDate(Date, wAno, wMes, wDia);
  tblOrcamTrein.FieldByName('ANO').Value := wAno + 1;
end;

procedure TfrmCadOrcamTrein1.tblCursoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sbtnAlterar.Enabled := not tblOrcamTrein.Eof;
  sbtnApagar.Enabled  := not tblOrcamTrein.Eof;
end;

procedure TfrmCadOrcamTrein1.tblOrcamTreinAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dbedOcorChange(Self);
end;

procedure TfrmCadOrcamTrein1.dbedOcorChange(Sender: TObject);
begin
  inherited;
  if (tblCurso.Active) then
  begin
    ednHoras.Text  := FloatToStr(dbedOcor.Value * (tblCurso.FieldByName('DUR_TEOR').AsInteger
                                                +  tblCurso.FieldByName('DUR_PRAT').AsInteger));
    redCusto.Value := dbedOcor.Value * tblCurso.FieldByName('VALOR').AsFloat;
  end;
end;

procedure TfrmCadOrcamTrein1.bbtnConfirmarClick(Sender: TObject);
begin
  if (dbedOcor.Value = 0) then
  begin
    MsgDlg('Informe a Quantidade de Ocorrências','Aviso',mtInformation,[mbOK],0);
    dbedOcor.SetFocus;
    exit;
  end;

  if (sUsuXccusto <> '') and (cmbCCusto.Value = '') then
  begin
    MsgDlg('Informe o Centro de Custo','Aviso',mtInformation,[mbOK],0);
    cmbCCusto.SetFocus;
    exit;
  end;

  if (cmbCCusto.Value <> '') then
    tblOrcamTrein.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa
    //      tblOrcamTrein.FieldByName('CODCENTROCUSTO').asString := qryCCusto.FieldByName('CODCENTROCUSTO').asString;
  else
    tblOrcamTrein.FieldByName('IDEMPRESA').Value := Null;

  inherited;

  sbtnProcurar.Enabled := true;
end;

end.
