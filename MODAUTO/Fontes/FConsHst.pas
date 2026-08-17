unit FConsHst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBTables, Wwquery,
  Db, Wwtable, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls, TB97,
  MontaSelect, IvDictio, IvMulti, IvEMulti, TB97Tlbr, TREdit, wwdblook,
  Spin, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, ppDB, ppDBPipe,
  ppDBBDE, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, ppEndUsr, ppTypes, CmParamReport;

type
  TfrmConsHst = class(TfrmOkCancelar)
    Panel2: TPanel;
    lblSituacao: TLabel;
    sbtnProcurar: TSpeedButton;
    MontaSelectFunc: TMontaSelect;
    qryPessoa: TwwQuery;
    ds: TwwDataSource;
    Label1: TLabel;
    dbedMatric: TDBEdit;
    Label2: TLabel;
    dbedNome: TDBEdit;
    dsCursos: TwwDataSource;
    qryCursos: TwwQuery;
    dsAval: TwwDataSource;
    qryAval: TwwQuery;
    dsEvol: TwwDataSource;
    qryEvol: TwwQuery;
    dsBenef: TwwDataSource;
    qryBenef: TwwQuery;
    dsMedic: TwwDataSource;
    qryMedic: TwwQuery;
    dsFerias: TwwDataSource;
    qryFerias: TwwQuery;
    dsHistRub: TwwDataSource;
    qryHistRub: TwwQuery;
    qryHistRubDESCRICAO: TStringField;
    qryHistRubFLGDESCONTO: TFloatField;
    qryHistRubTIPO: TStringField;
    qryHistRubVALORPROVENTO: TFloatField;
    qryHistRubREFERENCIA: TStringField;
    pnlDataHist: TPanel;
    Label60: TLabel;
    dtedHist: TCMDateTimePicker;
    pgctrlHistoricos: TPageControl;
    tbshCursos: TTabSheet;
    dbgrCursos: TwwDBGrid;
    tbshAvaliacoes: TTabSheet;
    dbgrAval: TwwDBGrid;
    tbshEvolucao: TTabSheet;
    dbgrEvol: TwwDBGrid;
    tbshBeneficios: TTabSheet;
    dbgrBenef: TwwDBGrid;
    tbshProntuario: TTabSheet;
    dbgrMedic: TwwDBGrid;
    tbshFerias: TTabSheet;
    dbgrFerais: TwwDBGrid;
    tbshContraCheque: TTabSheet;
    Panel3: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    dblcMotivo: TwwDBLookupCombo;
    redProvento: TRealEdit;
    redDesconto: TRealEdit;
    redLiquido: TRealEdit;
    dbgrHistRub: TwwDBGrid;
    tblParam: TwwTable;
    qryMotivoFolha: TwwQuery;
    Label3: TLabel;
    sbtnImprimirCCheque: TSpeedButton;
    dsContrSind: TwwDataSource;
    qryContrSind: TwwQuery;
    tbshContrSind: TTabSheet;
    dbgrContrSind: TwwDBGrid;
    qryContrSindIDPESSOA: TFloatField;
    qryContrSindMES: TStringField;
    qryContrSindVALORPROVENTO: TFloatField;
    qryContrSindNOME: TStringField;
    pnlEtiqCTPS: TPanel;
    spbtnEtiqCTPS: TSpeedButton;
    Panel1: TPanel;
    sbtnEtiquetaFerias: TSpeedButton;
    cbxNumDep: TCheckBox;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure dblcMotivoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnImprimirCChequeClick(Sender: TObject);
    procedure spbtnEtiqCTPSClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnEtiquetaFeriasClick(Sender: TObject);
    function GetLayoutPadrao: TStringList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsHst: TfrmConsHst;
  sMesRef: String;

implementation

uses UMensErro, UsoGeralRH, uFuncoesUteisRH, fAguarde, dBaseDados, uSistema, uComumRelats,
     uImprimeRelatorio, dRelatorioEtiqAltCTPS, REtiquetaFerias, RReciboPagamento;

{$R *.DFM}



procedure TfrmConsHst.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  sbtnProcurar.down := false;
  lblSituacao.Caption := '';

  begin
      MontaSelectFunc.Executar;
      if (MontaSelectFunc.ValoresChave.Count > 0) and
         (MontaSelectFunc.ValoresChave[0] <> '')
      then begin
          qryPessoa.Close;
          qryPessoa.Sql.Clear;
          qryPessoa.Sql.Add('SELECT P.NOME, P.IDPESSOA, S.TIPOSIT, F.MATRICULA, F.DATAADMISSAO, F.IDESTAB, F.TIPOCONTRATO ' +
                            'FROM PESSOA P, FUNCIONARIO F, SITFUNC S ' +
                            'WHERE P.IDPESSOA = ' + MontaSelectFunc.ValoresChave[0] +
                            '  AND P.IDPESSOA = F.IDPESSOA ' +
                            '  AND F.IDSITFUNC = S.IDSITFUNC ');
          qryPessoa.Open;

          if qryPessoa.FieldByName('TIPOSIT').Value = 'A' then
             lblSituacao.Caption := '(Ativo)';
          if qryPessoa.FieldByName('TIPOSIT').Value = 'F' then
             lblSituacao.Caption := '(Afastado)';
          if qryPessoa.FieldByName('TIPOSIT').Value = 'D' then
             lblSituacao.Caption := '(Demitido)';

          dtedHist.Date := qryPessoa.FieldByName('DataAdmissao').Value;
          cmbMesChange(Self);
          if (qryPessoa.Active) and (not qryPessoa.Eof) then
              bbtnConfirmarClick(Self);
      end;
  end;

end;

procedure TfrmConsHst.FormCreate(Sender: TObject);
var
  wAno, wMes, wDia: word;
begin
  inherited;
  tblParam.Open;
  qryMotivoFolha.Open;
  qryMotivoFolha.Locate('IdMotivo', tblParam.FieldByName('IdMotivo').asInteger, []);
  dblcMotivo.Text := qryMotivoFolha.FieldByName('Descricao').asString;

  if sUsuXccusto <> '' then
     MontaSelectFunc.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto);

  if sUsuXfilial <> '' then
     MontaSelectFunc.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + sUsuXfilial);

  // Usuário Individual
  if sUsoGeralIdPessoa <> '' then
    MontaSelectFunc.Filtro.Add('FUNCIONARIO.IDPESSOA = ' + sUsoGeralIdPessoa);

  DecodeDate(tblParam.FieldbyName('NormalIni').Value, wAno, wMes, wDia);
  wMes := wMes - 1;
  if (wMes = 0) then
  begin
    wMes := 12;
    wAno := wAno - 1;
  end;
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value   := wAno;

  ImprimeRelatorio := TImprimeRelatorio.Create;
  // Registro o Form de visualização das Etiquetas e Carrego a configuração destas
  with (dtmRelatorioEtiqAltCTPS) do
    ImprimeRelatorio.Iniciar(dsgnEtiquetasAltCTPS, rpEtiquetasAltCTPS, ppEtiquetasAltCTPS,
      qryEtiquetasAltCTPS, GetLayoutPadrao, 'Etiquetas para Atualização de CTPS',
      'rpEtiquetasAltCTPS', 'Etiquetas.tmp', 417);

  if (sUsoGeralIdPessoa <> '') then
  begin
    qryPessoa.Close;
    qryPessoa.Sql.Clear;
    qryPessoa.Sql.Add('SELECT P.NOME, P.IDPESSOA, S.TIPOSIT, F.MATRICULA, F.DATAADMISSAO, F.IDESTAB, F.TIPOCONTRATO ' +
                      'FROM PESSOA P, FUNCIONARIO F, SITFUNC S ' +
                      'WHERE P.IDPESSOA = ' + sUsoGeralIdPessoa +
                      '  AND P.IDPESSOA = F.IDPESSOA ' +
                      '  AND F.IDSITFUNC = S.IDSITFUNC ');
    qryPessoa.Open;

    if qryPessoa.FieldByName('TIPOSIT').Value = 'A' then
       lblSituacao.Caption := '(Ativo)';
    if qryPessoa.FieldByName('TIPOSIT').Value = 'F' then
       lblSituacao.Caption := '(Afastado)';
    if qryPessoa.FieldByName('TIPOSIT').Value = 'D' then
       lblSituacao.Caption := '(Demitido)';

    dtedHist.Date := qryPessoa.FieldByName('DataAdmissao').Value;
    cmbMesChange(Self);
    if (qryPessoa.Active) and (not qryPessoa.Eof) then
        bbtnConfirmarClick(Self);
  end
  else
    sbtnProcurarClick(Self);
end;

procedure TfrmConsHst.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  qryCursos.Close;
  qryCursos.ParamByName('IdPessoa').Value  := qryPessoa.FieldByName('IdPessoa').Value;
  qryCursos.ParamByName('DatIni').asString := dtedHist.Text;
  qryCursos.Open;

  qryAval.Close;
  qryAval.ParamByName('IdPessoa').Value  := qryPessoa.FieldByName('IdPessoa').Value;
  qryAval.ParamByName('DatIni').asString := dtedHist.Text;
  qryAval.Open;

  qryEvol.Close;
  qryEvol.ParamByName('IdPessoa').Value  := qryPessoa.FieldByName('IdPessoa').Value;
  qryEvol.ParamByName('DatIni').asString := dtedHist.Text;
  qryEvol.Open;
  spbtnEtiqCTPS.Enabled := (not qryEvol.IsEmpty);

  qryBenef.Close;
  qryBenef.ParamByName('IdPessoa').Value  := qryPessoa.FieldByName('IdPessoa').Value;
  qryBenef.ParamByName('DatIni').asString := dtedHist.Text;
  qryBenef.Open;
  TFloatField(qryBenef.FieldByName('ValorRubrica')).DisplayFormat := '###,###,##0.00';

  qryMedic.Close;
  qryMedic.ParamByName('IdPessoa').Value  := qryPessoa.FieldByName('IdPessoa').Value;
  qryMedic.ParamByName('DatIni').asString := dtedHist.Text;
  qryMedic.Open;

  qryFerias.Close;
  qryFerias.ParamByName('IdPessoa').Value  := qryPessoa.FieldByName('IdPessoa').Value;
  qryFerias.ParamByName('DatIni').asString := dtedHist.Text;
  qryFerias.Open;

  qryContrSind.Close;
  qryContrSind.ParamByName('IdPessoa').Value  := qryPessoa.FieldByName('IdPessoa').Value;
  qryContrSind.ParamByName('DatIni').asString := dtedHist.Text;
  qryContrSind.Open;
end;

procedure TfrmConsHst.cmbMesChange(Sender: TObject);
begin
  inherited;
  if not qryPessoa.Active then exit;

  sMesRef := Trim(spnedAno.Text) +'/'+ PoeZero(cmbMes.ItemIndex+1);

  qryHistRub.Close;
  qryHistRub.ParamByName('IdPessoa').Value  := qryPessoa.FieldByName('IdPessoa').Value;
  qryHistRub.ParamByName('IdMotivo').Value  := qryMotivoFolha.FieldByName('IdMotivo').Value;
  qryHistRub.ParamByName('DatIni').asString := sMesRef;
  qryHistRub.Open;
  redProvento.Value := 0;
  redDesconto.Value := 0;
  redLiquido.Value := 0;
  while not qryHistRub.EOF do
  begin
     redProvento.Value := redProvento.Value +
       iff(qryHistRub.FieldByName('FlgDesconto').AsInteger = 0,
                 qryHistRub.FieldByName('ValorProvento').AsFloat,0);

     redDesconto.Value := redDesconto.Value +
       iff(qryHistRub.FieldByName('FlgDesconto').AsInteger = 1,
                 qryHistRub.FieldByName('ValorProvento').AsFloat,0);

     redLiquido.Value  := redLiquido.Value +
       iff(qryHistRub.FieldByName('FlgDesconto').AsInteger <= 1,
                 qryHistRub.FieldByName('ValorProvento').AsFloat *
                 iff(qryHistRub.FieldByName('FlgDesconto').AsInteger = 1,-1,1),0);

     qryHistRub.Next;
  end;
  qryHistRub.First;
end;

procedure TfrmConsHst.dblcMotivoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then cmbMesChange(Self);
end;


procedure TfrmConsHst.sbtnImprimirCChequeClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Recibo de Pagamento');
  frmAguarde.Pos := 0;

  RptReciboPagamento := TRptReciboPagamento.Create(Self);
//  RptReciboPagamento.sqlEtiquetaAlteracaoCTPS.Prepare;
  RptReciboPagamento.CrmRptCM.IdReports := 1585;
  RptReciboPagamento.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  RptReciboPagamento.CrmRptCM.OrigemCM := 1;
  RptReciboPagamento.CrmRptCM.IdModulo := 21;
  RptReciboPagamento.CrmRptCM.IdUsuario := Sistema.IdUsuario;

  with (RptReciboPagamento.CmpRptCM) do
  begin
    ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
    ParamByName('ListaIdEstab').asString := qryPessoa.FieldByName('IDESTAB').asString;
    ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
    ParamByName('AnoRef').asInteger := spnedAno.Value;
    ParamByName('ListaIdMotivo').asString := qryMotivoFolha.FieldByName('IDMOTIVO').asString;
    ParamByName('ListaIdFunc').asString := qryPessoa.FieldByName('IDPESSOA').asString;
    ParamByName('TipoContrato').asString := qryPessoa.FieldByName('TIPOCONTRATO').asString;
    ParamByName('SitFunc').asString := qryPessoa.FieldByName('TIPOSIT').asString;
    ParamByName('DoisRecPorFolha').asBoolean := (false);
    ParamByName('ImprimirDuplicado').asBoolean := (false);
    ParamByName('NumDepIRRF').asBoolean := cbxNumDep.Checked;
    ParamByName('Ordenacao').asInteger := 0;
    ParamByName('NomeTabela').asString := 'HISTRUBSAL';
  end;

  RptReciboPagamento.CrmRptCM.Print;
  FreeAndNil(RptReciboPagamento);

  frmAguarde.Apaga;
end;

procedure TfrmConsHst.spbtnEtiqCTPSClick(Sender: TObject);
begin
  inherited;
  // Registro o Form de visualização das Etiquetas e Carrego a configuração destas
  with (dtmRelatorioEtiqAltCTPS) do
    ImprimeRelatorio.Iniciar(dsgnEtiquetasAltCTPS, rpEtiquetasAltCTPS, ppEtiquetasAltCTPS,
      qryEtiquetasAltCTPS, GetLayoutPadrao, 'Etiquetas para Atualização de CTPS',
      'rpEtiquetasAltCTPS', 'Etiquetas.tmp', 417);

  with (ImprimeRelatorio.QueryDados) do
  begin
    Clear;
    Add('SELECT');
    Add('  TO_CHAR(H.DATAALTERFUNC,''DD/MM/YYYY'') AS DATA,');
    Add('  DECODE(E2.IDCARGO,C.IDCARGO,''A mesma'',C.TITULO) AS NOVAFUNCAO,');
    Add('  H.SALARIO AS NOVOSALARIO,');
    Add('  ('+QuotedStr(Replicate(' ',45))+' || MO.DESCRICAO) AS MOTIVO,');
    Add('  C.CBO2002 AS CBO');
    Add('FROM');
    Add('  EVOLFUNC H, FUNCIONARIO F, MOTIVO MO, CARGO C,');
    Add('  (SELECT');
    Add('     IDCARGO, IDPESSOA');
    Add('   FROM');
    Add('     EVOLFUNC');
    Add('   WHERE');
    Add('     (IDPESSOA      = ' +qryPessoa.FieldByName('IDPESSOA').asString+ ') AND');
    Add('     (DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)');
    Add('                       FROM   EVOLFUNC');
    Add('                       WHERE  (IDPESSOA = ' +qryPessoa.FieldByName('IDPESSOA').asString+ ') AND');
    Add('                              (DATAALTERFUNC < TO_DATE('+
                                       QuotedStr(qryEvol.FieldByName('DATAALTERFUNC').asString)+
                                       ',''DD/MM/YYYY''))))) E2');
    Add('WHERE');
    Add('  (H.IDMOTIVO = ' +qryEvol.FieldByName('IDMOTIVO').asString+ ') AND');
    Add('  (H.DATAALTERFUNC = TO_DATE(' +QuotedStr(qryEvol.FieldByName('DATAALTERFUNC').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('  (H.IDPESSOA      = ' +qryPessoa.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (H.IDPESSOA      = F.IDPESSOA)     AND');
    Add('  (H.IDPESSOA      = E2.IDPESSOA(+)) AND');
    Add('  (H.IDMOTIVO      = MO.IDMOTIVO(+)) AND');
    Add('  (H.IDCARGO       = C.IDCARGO(+))');
  end;

  ImprimeRelatorio.TipoImpressao := tpAbreQuery;
  ImprimeRelatorio.Imprimir([NULL]);
end;

procedure TfrmConsHst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ImprimeRelatorio.free;
end;

procedure TfrmConsHst.sbtnEtiquetaFeriasClick(Sender: TObject);
begin
  inherited;
  with (rptEtiquetaFerias) do
  begin
    dsgnRelatorios.Report := rpEtiquetas;
    ImprimeRelatorio.Iniciar(dsgnRelatorios, rpEtiquetas, ppEtiquetas,
      qryEtiquetas, GetLayoutPadrao, 'Etiqueta de Férias',
      'rpEtiquetas', 'Etiqueta de Férias.tmp', 417);

    qryEtiquetas.Close;
    qryEtiquetas.ParamByName('IDPESSOA').asString := qryPessoa.FieldByName('IDPESSOA').asString;
    qryEtiquetas.ParamByName('DATINI').asString   := qryFerias.FieldByName('INIGOZOFERIAS').asString;
    qryEtiquetas.Open;

  end;

  ImprimeRelatorio.TipoImpressao := tpQueryComDados;
  ImprimeRelatorio.QueryDados.Assign(rptEtiquetaFerias.qryEtiquetas.SQL);
  ImprimeRelatorio.Imprimir([null]);
  frmAguarde.Apaga;
end;

function TfrmConsHst.GetLayoutPadrao: TStringList;
var
  Aux: TStringList;
begin
  Aux := TStringList.Create;
  Aux.Add('');
  Result := Aux;
end;

end.
