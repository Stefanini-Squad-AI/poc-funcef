{ --------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
Rotina......: SelecionaEstadoCivil e alteração no DFM                                              
Nº SOL......: 211661/15807
Nº KINTANA..: 2060908
Data........: 22/09/2014
Responsavel.: William Santana
Descrição...: Padronização da nomenclatura quanto as opções de classificação de estado civíl.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 180854
Nº KINTANA..: 1675788
Data........: 30/05/2012
Responsável.: Fernando Xavier
Descrição...: Problema de invalid data packet quando vamos extrair o relatório
---------------------------------------------------------------------------------------------------
Rotinas.....: FormCreate, FormClose, bbtnConfirmarClick, MontaListaFuncionarios, GerarListaIdFunc,
              GerarListaIdEstab, SelecionaSitFunc, SelecionaTipoContrato, pgctrlPrincipalChange
Nº SOL......: 73954
Nº KINTANA..: 523465
Data........: 16/07/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação da aba "Lista" e tratamento para filtrar as os idPessoa com selecionados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SOL......: 126380
Nº KINTANA..: 659768
Data........: 20/04/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação das variaveis sListaCodCCustoSel e sDataReferencia para possibilitar o
              filtro dos centros de custos na data de referência informada.
---------------------------------------------------------------------------------------------------}

unit fSelPessoalMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uCmSqlParams, Db,
  fParamReports_Padrao, DBClient, uCMClientDataSet, Wwdatsrc, StdCtrls, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Spin, TEdNum, ComCtrls, CmParamReport, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, DBTables, CheckLst,
  uCtrlPessoaFuncionario, ColorCheckListBox;

type
  TfrmSelPessoalMT = class(TfrmParamReports_Padrao)
    dsPrincipal: TwwDataSource;
    pnSelecao: TPanel;
    pnResult: TPanel;
    pgctrlPrincipal: TPageControl;
    tsDadosFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxCandidatos: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxAutonomos: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxEspeciais: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    gbxTipoSal: TGroupBox;
    cbxMensalistas: TCheckBox;
    cbxDiaristas: TCheckBox;
    cbxHoristas: TCheckBox;
    gbxSalario: TGroupBox;
    Label4: TLabel;
    ednSal1: TEditNum;
    ednSal2: TEditNum;
    gbxTempAdm: TGroupBox;
    Label1: TLabel;
    ednAdm1: TSpinEdit;
    ednAdm2: TSpinEdit;
    gbxTempLot: TGroupBox;
    Label2: TLabel;
    ednLot1: TSpinEdit;
    ednLot2: TSpinEdit;
    gbxTempCar: TGroupBox;
    Label3: TLabel;
    ednCar1: TSpinEdit;
    ednCar2: TSpinEdit;
    rgSequencia: TGroupBox;
    cmbSequencia: TComboBox;
    tsDadosPess: TTabSheet;
    gbxIdade: TGroupBox;
    Label5: TLabel;
    ednIda1: TSpinEdit;
    ednIda2: TSpinEdit;
    gbxSexo: TGroupBox;
    cbxFeminino: TCheckBox;
    cbxMasculino: TCheckBox;
    gbxProfis: TGroupBox;
    dblckProfis: TwwDBLookupCombo;
    gbxGrauInstr: TGroupBox;
    dblckGrauInstr: TwwDBLookupCombo;
    rgSinal: TRadioGroup;
    gbxCep: TGroupBox;
    Label6: TLabel;
    ednCep1: TEditNum;
    ednCep2: TEditNum;
    gbxAniv: TGroupBox;
    cbxAniv: TComboBox;
    GroupBox1: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    rgSinTot: TRadioGroup;
    speDepTot: TSpinEdit;
    speDepIR: TSpinEdit;
    speDepSF: TSpinEdit;
    rgSinIR: TRadioGroup;
    rgSinSF: TRadioGroup;
    gbxEstCivil: TGroupBox;
    cbxSolteiro: TCheckBox;
    cbxCasado: TCheckBox;
    cbxSeparado: TCheckBox;
    cbxViuvo: TCheckBox;
    cbxOutro: TCheckBox;
    cbxSeparadoJud: TCheckBox;
    tsDadosOutros: TTabSheet;
    rgSelEstab: TRadioGroup;
    gbxEstab: TGroupBox;
    dblckEstab: TwwDBLookupCombo;
    lstEstab: TListBox;
    cbxSubEstab: TCheckBox;
    lstCodEstab: TListBox;
    rgSelSindi: TRadioGroup;
    gbxSindi: TGroupBox;
    dblckSindicato: TwwDBLookupCombo;
    lstSindicato: TListBox;
    lstCodSindicato: TListBox;
    rgSelCargo: TRadioGroup;
    gbxCargo: TGroupBox;
    dblckCargo: TwwDBLookupCombo;
    lstCargo: TListBox;
    lstCodCargo: TListBox;
    rgSelRamo: TRadioGroup;
    gbxRamo: TGroupBox;
    dblckRamo: TwwDBLookupCombo;
    lstRamo: TListBox;
    lstCodRamo: TListBox;
    tbsDemit: TTabSheet;
    gbxDemitidos: TGroupBox;
    LabelDeData: TLabel;
    LabelAdata: TLabel;
    Label711: TLabel;
    EdDataDem1: TCMDateTimePicker;
    EdDataDem2: TCMDateTimePicker;
    rgSelMotivo: TRadioGroup;
    gbxMotivo: TGroupBox;
    dblckMotivo: TwwDBLookupCombo;
    lstMotivo: TListBox;
    lstCodMotivo: TListBox;
    gbxAdmissao: TGroupBox;
    Label7: TLabel;
    EdDataAdm1: TCMDateTimePicker;
    Label8: TLabel;
    EdDataAdm2: TCMDateTimePicker;
    cbxCargoAltern: TCheckBox;
    CdsParamRH: TCMClientDataSet;
    sqlParamRH: TCMSqlParams;
    CdsEstab: TCMClientDataSet;
    sqlEstab: TCMSqlParams;
    CdsPrincipal: TCMClientDataSet;
    sqlPrincipal: TCMSqlParams;
    CdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    bbtnOutraVez: TBitBtn;
    CdsProfiss: TCMClientDataSet;
    sqlProfiss: TCMSqlParams;
    CdsGrauInstr: TCMClientDataSet;
    sqlGrauInstr: TCMSqlParams;
    CdsCargo: TCMClientDataSet;
    sqlCargo: TCMSqlParams;
    CdsSindicato: TCMClientDataSet;
    sqlSindicato: TCMSqlParams;
    CdsRamo: TCMClientDataSet;
    sqlRamo: TCMSqlParams;
    CdsMotivo: TCMClientDataSet;
    sqlMotivo: TCMSqlParams;
    gbxCCusto: TGroupBox;
    dblckCCusto: TwwDBLookupCombo;
    tbsListaFunc: TTabSheet;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    CdsListaFunc: TCMClientDataSet;
    procedure dblckProfisCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblckGrauInstrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure rgSelEstabClick(Sender: TObject);
    procedure rgSelCargoClick(Sender: TObject);
    procedure rgSelSindiClick(Sender: TObject);
    procedure dblckEstabCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblckCargoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblckSindicatoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstEstabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstCargoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstSindicatoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dblckCCusto1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure ednAdm2Change(Sender: TObject);
    procedure ednAdm1Change(Sender: TObject);
    procedure ednLot1Change(Sender: TObject);
    procedure ednCar1Change(Sender: TObject);
    procedure ednIda1Change(Sender: TObject);
    procedure ednLot2Change(Sender: TObject);
    procedure ednCar2Change(Sender: TObject);
    procedure ednIda2Change(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cbxEfetivosClick(Sender: TObject);
    procedure cbxCandidatosClick(Sender: TObject);
    procedure rgSelRamoClick(Sender: TObject);
    procedure lstRamoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dblckRamoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure rgSelMotivoClick(Sender: TObject);
    procedure dblckMotivoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstMotivoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbxDemitidosClick(Sender: TObject);
    procedure dblckCCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrlPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    SvItem: integer;

    // Alterado por FHBS - SOL: 73954 KTN: 523465
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    ListaIdFunc: TStringList;
    FOldIdEstabSel, FOldSitFunc, FOldTipoContrato: String;
    sGrauInstr, sProfis, sCentroCusto: String;   // SOL 180854 KINTANA 1675788
    // Fim - Alterado por FHBS

    procedure MudarSequencia;
    procedure MontaListaFuncionarios; // Alterado por FHBS - SOL: 73954 KTN: 523465
    function  GerarListaIdFunc(bOperador: Boolean = True): string; // Alterado por FHBS - SOL: 73954 KTN: 523465
    function  GerarListaIdEstab(bOperador: Boolean = True): string; // Alterado por FHBS - SOL: 73954 KTN: 523465
    function  GerarListaIdCargo: string;
    function  GerarListaIdMotivo: string;
    function  GerarListaIdRamo: string;
    function  GerarListaIdSindicato: string;
    function  SelecionaSexo: string;
    function  SelecionaSitFunc(bOperador: Boolean = True): string; // Alterado por FHBS - SOL: 73954 KTN: 523465
    function  SelecionaTipoContrato(bOperador: Boolean = True): string; // Alterado por FHBS - SOL: 73954 KTN: 523465
    function  SelecionaEstadoCivil: string;
    function  SelecionaTipoPagamento: string;
  protected
    // Alterado por FHBS - SOL: 126380 KTN: 659768
    sListaCodCCustoSel: String;
    sDataReferencia: String;
    // Fim - Alterado por FHBS
  public
    AbrirQueryPrincipal, IrPaginaResult: boolean;

    procedure ExecutarIrPaginaResult;
  end;

var
  frmSelPessoalMT: TfrmSelPessoalMT;

implementation

uses uSistema, uMensErro, uCtrlUsoGeralRH, uCtrlPadroes;

const
  TITULO_SEQUENCIA: array[0..15] of string =
    ('Nome',
     'Matrícula',
     'Cargo, Nome',
     'Cargo, Matrícula',
     'Centro de Custo, Nome',
     'Centro de Custo, Matrícula',
     'Lotação, Nome',
     'Lotação, Matrícula',
     'Segmento, Lotação,Nome',
     'Segmento, Lotação, Matrícula',
     'C.Custo, Cargo, Nome',
     'C.Custo, Cargo, Matrícula',
     'Lotação, Cargo, Nome',
     'Lotação, Cargo, Matrícula',
     'Segmento, Lotação, Cargo, Nome',
     'Segmento, Lotação, Cargo, Matrícula');

  ORDEM_DADOS_FUNC: array[0..15] of string =
    ('UPPER(P.Nome)',
     'F.Matricula',
     'F.IdCargo, UPPER(P.Nome)',
     'F.IdCargo, Matricula',
     'F.IdEmpresa, F.CodCentroCusto, UPPER(P.Nome)',
     'F.IdEmpresa, F.CodCentroCusto, Matricula',
     'F.IdEmpresa, F.IdEstab, F.CodCentroCusto, UPPER(P.Nome)',
     'F.IdEmpresa, F.IdEstab, F.CodCentroCusto, Matricula',
     'FP.IdRamoFornecedor, F.IdEmpresa, F.IdEstab, F.CodCentroCusto, UPPER(P.Nome)',
     'FP.IdRamoFornecedor, F.IdEmpresa, F.IdEstab, F.CodCentroCusto, Matricula',
     'F.IdEmpresa, F.CodCentroCusto, F.IdCargo, UPPER(P.Nome)',
     'F.IdEmpresa, F.CodCentroCusto, F.IdCargo, Matricula',
     'F.IdEmpresa, F.IdEstab, F.CodCentroCusto, F.IdCargo, UPPER(P.Nome)',
     'F.IdEmpresa, F.IdEstab, F.CodCentroCusto, F.IdCargo, Matricula',
     'FP.IdRamoFornecedor, F.IdEmpresa, F.IdEstab, F.CodCentroCusto, F.IdCargo, UPPER(P.Nome)',
     'FP.IdRamoFornecedor, F.IdEmpresa, F.IdEstab, F.CodCentroCusto, F.IdCargo, Matricula');

  ORDEM_DADOS_CAND: array[0..3] of string =
    ('UPPER(P.Nome)',
     'CD.IdPessoa',
     'CD.IdCargo, UPPER(P.Nome)',
     'CD.IdCargo, CD.IdPessoa');

{$R *.DFM}

procedure TfrmSelPessoalMT.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  sqlParamRH.Open;
  cbxCargoAltern.Visible := (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);
  cbxCargoAltern.Checked := (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);

  with (sqlEstab.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  IDPESSOA, NOME');
    Add('FROM');
    Add('  PESSOA');
    Add('WHERE');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('  (IDPESSOA IN ' + CtrlUsoGeralRH.UsuXFilial+ ') AND')
      else
        Add('  (IDPESSOA  = ' + CtrlUsoGeralRH.UsuXFilial+ ') AND');

    Add('  ((IDGRUPO  = :IdEmpresa) OR');
    Add('   (IDGRUPO IN (SELECT IDPESSOA');
    Add('                FROM   PESSOA');
    Add('                WHERE (IDGRUPO = :IdEmpresa))) OR');
    Add('   (IDGRUPO IN (SELECT IDPESSOA');
    Add('                FROM   PESSOA');
    Add('                WHERE (IDGRUPO IN (SELECT IDPESSOA');
    Add('                                   FROM   PESSOA');
    Add('                                   WHERE (IDGRUPO = :IdEmpresa)))) OR');
    Add('   (IDGRUPO IN (SELECT IDPESSOA');
    Add('                FROM   PESSOA');
    Add('                WHERE  (IDGRUPO IN (SELECT IDPESSOA');
    Add('                                    FROM   PESSOA');
    Add('                                    WHERE (IDGRUPO IN (SELECT IDPESSOA');
    Add('                                                       FROM   PESSOA');
    Add('                                                       WHERE (IDGRUPO = :IdEmpresa)))))))))');
    Add('ORDER BY');
    Add('  UPPER(NOME)');
  end;
  sqlEstab.Prepare;
  sqlEstab.ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;





  with (sqlCCusto.SQL) do
  begin
    Clear;
    Add(' SELECT ');
    Add('  ''**********'' AS CODCENTROCUSTO, ''**********'' AS NOME, 0 AS TIPO ');
    Add(' FROM ');
    Add('  DUAL ');
    Add(' UNION ');
    Add(' SELECT ');
    Add('  CODCENTROCUSTO, NOME, 1 AS TIPO ');
    Add(' FROM');
    Add('  CENTCUST ');
    Add(' WHERE ATIVO = ''S'' ');
    Add(' AND STATUSGRUPOCDC = ''A'' ');
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('  (CODCENTROCUSTO IN (' + CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('  (CODCENTROCUSTO  = ' + CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    Add('  AND (IDEMPRESA = ' +IntToStr(Sistema.IdEmpresa)+ ')');
    Add('  ORDER BY NOME ');

  end;
  sqlCCusto.Open;

  sqlProfiss.Open;
  sqlGrauInstr.Open;

  cmbSequencia.Items.Clear;
  for c:=Low(TITULO_SEQUENCIA) to High(TITULO_SEQUENCIA) do
    cmbSequencia.Items.Add(TITULO_SEQUENCIA[c]);
  cmbSequencia.ItemIndex := 0;

  edDataDem1.Date := Date - (365*5 + 1);
  edDataAdm2.Date := Date;
  edDataDem2.Date := Date;

  gbxDemitidos.Visible := (cbxDemitidos.Checked);
  pgctrlPrincipal.ActivePageIndex := 0;
  cbxAniv.ItemIndex := 0;
  AbrirQueryPrincipal := true;
  IrPaginaResult := true;
  dblckCCusto.LookupValue := CdsCCusto.FieldByName('NOME').asString;
  dblckCCusto.Update;

  // Alterado por FHBS - SOL: 126380 KTN: 659768
  sListaCodCCustoSel := '';
  sDataReferencia := '';
  // Fim - Alterado por FHBS

  // Alterado por FHBS - SOL: 73954 KTN: 523465
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  ListaIdFunc := TStringList.Create;

  tbsListaFunc.TabVisible := False;

  FOldIdEstabSel := '';
  FOldSitFunc := '';
  FOldTipoContrato := '';
  // Fim - Alterado por FHBS
end;

procedure TfrmSelPessoalMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ListaIdFunc); // Alterado por FHBS - SOL: 73954 KTN: 523465
  FreeAndNil(CtrlPessoaFuncionario); // Alterado por FHBS - SOL: 73954 KTN: 523465
end;

procedure TfrmSelPessoalMT.FormShow(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

procedure TfrmSelPessoalMT.ednAdm2Change(Sender: TObject);
begin
  if (ednAdm2.Value < ednAdm1.Value) then
    ednAdm2.Value := ednAdm1.Value;
end;

procedure TfrmSelPessoalMT.ednAdm1Change(Sender: TObject);
begin
  if (ednAdm1.Value > ednAdm2.Value) then
    ednAdm1.Value := ednAdm2.Value;
end;

procedure TfrmSelPessoalMT.ednLot1Change(Sender: TObject);
begin
  if (ednLot1.Value > ednLot2.Value) then
    ednLot1.Value := ednLot2.Value;
end;

procedure TfrmSelPessoalMT.ednCar1Change(Sender: TObject);
begin
  if (ednCar1.Value > ednCar2.Value) then
    ednCar1.Value := ednCar2.Value;
end;

procedure TfrmSelPessoalMT.ednIda1Change(Sender: TObject);
begin
  if (ednIda1.Value > ednIda2.Value) then
    ednIda1.Value := ednIda2.Value;
end;

procedure TfrmSelPessoalMT.ednLot2Change(Sender: TObject);
begin
  if (ednLot2.Value < ednLot1.Value) then
    ednLot2.Value := ednLot1.Value;
end;

procedure TfrmSelPessoalMT.ednCar2Change(Sender: TObject);
begin
  if (ednCar2.Value < ednCar1.Value) then
    ednCar2.Value := ednCar1.Value;
end;

procedure TfrmSelPessoalMT.ednIda2Change(Sender: TObject);
begin
  if (ednIda2.Value < ednIda1.Value) then
    ednIda2.Value := ednIda1.Value;
end;

procedure TfrmSelPessoalMT.dblckProfisCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  sProfis := '';
  if (modified) then
  begin
    (Sender as TwwDBLookupCombo).Text := CdsProfiss.FieldByName('DESCRICAO').asString;
     sProfis := CdsProfiss.FieldByName('IDPROFISS').asString; // SOL 180854 KINTANA 1675788
  end;
end;

procedure TfrmSelPessoalMT.dblckGrauInstrCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  sGrauInstr := '';
  if (modified) then
  begin
    (Sender as TwwDBLookupCombo).Text := CdsGrauInstr.FieldByName('DESCRICAO').asString;
    sGrauInstr := CdsGrauInstr.FieldByName('IDGRINSTR').asString;   // SOL 180854 KINTANA 1675788

  end;
end;

procedure TfrmSelPessoalMT.dblckCCusto1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) and not(CdsCCusto.IsEmpty) then
  begin
    (Sender as TwwDBLookupCombo).Text := CdsCCusto.FieldByName('CODCENTROCUSTO').asString;
  end;
end;

procedure TfrmSelPessoalMT.dblckEstabCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstEstab.Items.Add(CdsEstab.FieldByName('NOME').asString);
    lstCodEstab.Items.Add(CdsEstab.FieldByName('IDPESSOA').asString);
  end;
end;

procedure TfrmSelPessoalMT.dblckCargoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if modified then
  begin
    lstCargo.Items.Add(CdsCargo.FieldByName('TITULO').asString);
    lstCodCargo.Items.Add(CdsCargo.FieldByName('IDCARGO').asString);
  end;
end;

procedure TfrmSelPessoalMT.dblckSindicatoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if modified then
  begin
    lstSindicato.Items.Add(CdsSindicato.FieldByName('NOME').asString);
    lstCodSindicato.Items.Add(CdsSindicato.FieldByName('IDPESSOA').asString);
  end;
end;

procedure TfrmSelPessoalMT.dblckRamoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if modified then
  begin
    lstRamo.Items.Add(CdsRamo.FieldByName('DESCRAMOFORNECEDOR').asString);
    lstCodRamo.Items.Add(CdsRamo.FieldByName('IDRAMOFORNECEDOR').asString);
  end;
end;

procedure TfrmSelPessoalMT.dblckMotivoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if modified then
  begin
    lstMotivo.Items.Add(CdsMotivo.FieldByName('DESCRICAO').asString);
    lstCodMotivo.Items.Add(CdsMotivo.FieldByName('IDMOTIVO').asString);
  end;
end;

procedure TfrmSelPessoalMT.lstEstabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstEstab.Items.Count > 0) then
  begin
    SvItem := lstEstab.ItemIndex;
    lstEstab.Items.Delete(SvItem);
    lstCodEstab.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoalMT.lstCargoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstCargo.Items.Count > 0) then
  begin
    SvItem := lstCargo.ItemIndex;
    lstCargo.Items.Delete(SvItem);
    lstCodCargo.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoalMT.lstSindicatoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstSindicato.Items.Count > 0) then
  begin
    SvItem := lstSindicato.ItemIndex;
    lstSindicato.Items.Delete(SvItem);
    lstCodSindicato.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoalMT.lstRamoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstRamo.Items.Count > 0) then
  begin
    SvItem := lstRamo.ItemIndex;
    lstRamo.Items.Delete(SvItem);
    lstCodRamo.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoalMT.lstMotivoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstMotivo.Items.Count > 0) then
  begin
    SvItem := lstMotivo.ItemIndex;
    lstMotivo.Items.Delete(SvItem);
    lstCodMotivo.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoalMT.rgSelEstabClick(Sender: TObject);
begin
  if (rgSelEstab.ItemIndex = 1) and not(CdsEstab.Active) then
    sqlEstab.Open;

  if (CdsEstab.IsEmpty) then
    rgSelEstab.ItemIndex := 0;

  gbxEstab.Visible := (rgSelEstab.ItemIndex = 1);
end;

procedure TfrmSelPessoalMT.rgSelCargoClick(Sender: TObject);
begin
  if (rgSelCargo.ItemIndex = 1) and not(CdsCargo.Active) then
    sqlCargo.Open;

  if (CdsCargo.IsEmpty) then
    rgSelCargo.ItemIndex := 0;

  gbxCargo.Visible := (rgSelCargo.ItemIndex = 1);
end;

procedure TfrmSelPessoalMT.rgSelSindiClick(Sender: TObject);
begin
  if (rgSelSindi.ItemIndex = 1) and not(CdsSindicato.Active) then
    sqlSindicato.Open;

  if (CdsSindicato.IsEmpty) then
    rgSelSindi.ItemIndex := 0;

  gbxSindi.Visible := (rgSelSindi.ItemIndex = 1);
end;

procedure TfrmSelPessoalMT.rgSelRamoClick(Sender: TObject);
begin
  if (rgSelRamo.ItemIndex = 1) and not(CdsRamo.Active) then
    sqlRamo.Open;

  if (CdsRamo.IsEmpty) then
    rgSelRamo.ItemIndex := 0;

  gbxRamo.Visible := (rgSelRamo.ItemIndex = 1);
end;

procedure TfrmSelPessoalMT.rgSelMotivoClick(Sender: TObject);
begin
  if (rgSelMotivo.ItemIndex = 1) and not(CdsMotivo.Active) then
    sqlMotivo.Open;

  if (CdsMotivo.IsEmpty) then
    rgSelMotivo.ItemIndex := 0;

  gbxMotivo.Visible := (rgSelMotivo.ItemIndex = 1);
end;

procedure TfrmSelPessoalMT.cbxEfetivosClick(Sender: TObject);
begin
  if (TCheckBox(Sender).Checked) then
    cbxCandidatos.Checked := false;
  MudarSequencia;
end;

procedure TfrmSelPessoalMT.cbxCandidatosClick(Sender: TObject);
begin
  if (cbxCandidatos.Checked) then
  begin
    cbxEfetivos.Checked := false;
    cbxEspeciais.Checked := false;
    cbxTemporarios.Checked := false;
    cbxEstagiarios.Checked := false;
    cbxTerceiros.Checked := false;
    cbxPropDirSemVinc.Checked := false;
    cbxAutonomos.Checked := false;
  end;
  MudarSequencia;
end;

procedure TfrmSelPessoalMT.cbxDemitidosClick(Sender: TObject);
begin
  gbxDemitidos.Visible := (cbxDemitidos.Checked);
end;

procedure TfrmSelPessoalMT.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  sAux, sIdEstabSel, sIdCargoSel, sIdSindicatoSel, sIdRamoSel, sIdMotivoSel: string;
  bMarcouFuncionario, bMarcouCandidato: boolean;
  sIdFuncSel: String; // Alterado por FHBS - SOL: 73954 KTN: 523465
begin
  ModalResult := mrNone;

  bMarcouFuncionario := (cbxEfetivos.Checked) or (cbxEspeciais.Checked) or
    (cbxTemporarios.Checked) or (cbxEstagiarios.Checked) or (cbxTerceiros.Checked) or
    (cbxPropDirSemVinc.Checked) or (cbxAutonomos.Checked);

  bMarcouCandidato := (cbxCandidatos.Checked);

  if not(bMarcouFuncionario) and not(bMarcouCandidato) then
  begin
    MsgDlg('Assinale ao menos um tipo de Contrato.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    pgctrlPrincipal.ActivePage := tsDadosFunc;
    gbxTipContra.SetFocus;
    exit;
  end;

  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and
     not(cbxDemitidos.Checked) and not(cbxCandidatos.Checked) then
  begin
    MsgDlg('Assinale ao menos um tipo de Situação Funcional.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    pgctrlPrincipal.ActivePage := tsDadosFunc;
    gbxSituacao.SetFocus;
    exit;
  end;

  if not(cbxMensalistas.Checked) and not(cbxDiaristas.Checked) and not(cbxHoristas.Checked) then
  begin
    MsgDlg('Assinale ao menos um tipo de Salário.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    pgctrlPrincipal.ActivePage := tsDadosFunc;
    gbxTipoSal.SetFocus;
    exit;
  end;

  // Cria a lista de IDs do(s) Estabelecimento(s) selecionado(s)
  sIdEstabSel := GerarListaIdEstab;

  // Cria a lista de IDs do(s) Cargo(s) selecionado(s)
  sIdCargoSel := GerarListaIdCargo;

  // Cria a lista de IDs do(s) Sindicato(s) selecionado(s)
  sIdSindicatoSel := GerarListaIdSindicato;

  // Cria a lista de IDs do(s) Ramo(s) selecionado(s)
  sIdRamoSel := GerarListaIdRamo;

  // Cria a lista de IDs do(s) Motivo(s) selecionado(s)
  sIdMotivoSel := GerarListaIdMotivo;

  // Cria a lista de IDs da(s) Pessoas(s) selecionada(s)
  sIdFuncSel := GerarListaIdFunc; // Alterado por FHBS - SOL: 73954 KTN: 523465

  with (sqlPrincipal.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  P.NOME, P.RAZAOSOCIAL, P.TIPO, P.NUMDOCUMENTO,');
    Add('  PF.*, CI.NOME AS CIDADE, EP.LOGRADOURO,');
    Add('  EP.LOGRADOURO, EP.CODESTADO, EP.NUMERO,');
    Add('  EP.COMPLEMENTO, EP.BAIRRO, EP.CEP, C.TITULO,');

    if (bMarcouFuncionario) then
    begin
      Add('  F.*, ST.*, HT.JORNADAMENSAL,');
      Add('  FP.IDRAMOFORNECEDOR, CC.NOME AS CENTROCUSTO');
    end
    else
      Add('  CD.*, ('' '') AS MATRICULA, (''Candidato a'') AS DESCRICAO, '+
          '('' '') AS CENTROCUSTO');

    Add('FROM');
    Add('  PESSOA P, PESSOAFISICA PF, ENDPESS EP, CIDADES CI, CARGO C,');

    // Alterado por FHBS - SOL: 126380 KTN: 659768
    if (bMarcouFuncionario) then
    begin
      if Trim(sDataReferencia) <> '' then
      begin
        Add('  (SELECT                                                                                     ');
        Add('     CASE                                                                                     ');
        Add('       WHEN ( F.DATACARGO IS NULL OR F.DATACARGO <= F.HST_DATAREF ) THEN F.IDCARGO            ');
        Add('       ELSE DECODE( E.IDCARGO, NULL, F.IDCARGO, E.IDCARGO )                                   ');
        Add('     END AS IDCARGO,                                                                          ');
        Add('     F.DATASALARIO,                                                                           ');
        Add('     CASE                                                                                     ');
        Add('       WHEN ( F.DATASALARIO IS NULL OR F.DATASALARIO <= F.HST_DATAREF ) THEN F.SALARIOATUAL   ');
        Add('       ELSE DECODE( E.SALARIO, NULL, F.SALARIOATUAL, E.SALARIO )                              ');
        Add('     END AS SALARIOATUAL,                                                                     ');
        Add('     CASE                                                                                     ');
        Add('       WHEN ( F.DATASALARIO IS NULL OR F.DATASALARIO <= F.HST_DATAREF ) THEN F.TIPOPAGAMENTO  ');
        Add('       ELSE DECODE( E.TIPOPAGAMENTO, NULL, F.TIPOPAGAMENTO, E.TIPOPAGAMENTO )                 ');
        Add('     END AS TIPOPAGAMENTO,                                                                    ');
        Add('     CASE                                                                                     ');
        Add('       WHEN ( F.DATASALARIO IS NULL OR F.DATASALARIO <= F.HST_DATAREF ) THEN F.IDFAIXACARGO   ');
        Add('       ELSE DECODE( E.IDFAIXACARGO, NULL, F.IDFAIXACARGO, E.IDFAIXACARGO )                    ');
        Add('     END AS IDFAIXACARGO,                                                                     ');
        Add('     CASE                                                                                     ');
        Add('       WHEN ( F.DATASALARIO IS NULL OR F.DATASALARIO <= F.HST_DATAREF ) THEN F.NIVELINDIV1    ');
        Add('       ELSE DECODE( E.NIVELINDIV1, NULL, F.NIVELINDIV1, 0, F.NIVELINDIV1, E.NIVELINDIV1 )     ');
        Add('     END AS NIVELINDIV1,                                                                      ');
        Add('     F.DATACARGO2,                                                                            ');
        Add('     CASE                                                                                     ');
        Add('       WHEN ( F.DATACARGO2 IS NULL OR F.DATACARGO2 <= F.HST_DATAREF ) THEN F.IDFUNCAO         ');
        Add('       ELSE DECODE( E.IDFUNCAO, NULL, F.IDFUNCAO, E.IDFUNCAO )                                ');
        Add('     END AS IDFUNCAO,                                                                         ');
        Add('     CASE                                                                                     ');
        Add('       WHEN ( F.DATACARGO2 IS NULL OR F.DATACARGO2 <= F.HST_DATAREF ) THEN F.IDFAIXAFUNCAO    ');
        Add('       ELSE DECODE( E.IDFAIXAFUNCAO, NULL, F.IDFAIXAFUNCAO, E.IDFAIXAFUNCAO )                 ');
        Add('     END AS IDFAIXAFUNCAO,                                                                    ');
        Add('     CASE                                                                                     ');
        Add('       WHEN ( F.DATACARGO2 IS NULL OR F.DATACARGO2 <= F.HST_DATAREF ) THEN F.NIVELINDIV2      ');
        Add('       ELSE DECODE( E.NIVELINDIV2, NULL, F.NIVELINDIV2, 0, F.NIVELINDIV2, E.NIVELINDIV2 )     ');
        Add('     END AS NIVELINDIV2,                                                                      ');
        Add('     F.DATALOTACAO,                                                                           ');
        Add('     CASE                                                                                     ');
        Add('       WHEN ( F.DATALOTACAO IS NULL OR F.DATALOTACAO <= F.HST_DATAREF ) THEN F.IDEMPRESA      ');
        Add('       ELSE DECODE( E.IDEMPRESA, NULL, F.IDEMPRESA, E.IDEMPRESA )                             ');
        Add('     END AS IDEMPRESA,                                                                        ');
        Add('     TRIM(CASE                                                                                ');
        Add('       WHEN ( F.DATALOTACAO IS NULL OR F.DATALOTACAO <= F.HST_DATAREF ) THEN F.CODCENTROCUSTO ');
        Add('       ELSE DECODE( E.CODCENTROCUSTO, NULL, F.CODCENTROCUSTO, E.CODCENTROCUSTO )              ');
        Add('     END) AS CODCENTROCUSTO,                                                                  ');
        Add('     CASE                                                                                     ');
        Add('       WHEN ( F.DATALOTACAO IS NULL OR F.DATALOTACAO <= F.HST_DATAREF ) THEN F.IDESTAB        ');
        Add('       ELSE DECODE( E.IDESTAB, NULL, F.IDESTAB, E.IDESTAB )                                   ');
        Add('     END AS IDESTAB,                                                                          ');
        Add('     F.IDPESSOA, F.IDSITRISCO, F.IDCATEMPRGRE,                                                ');
        Add('     F.IDAFASTRAIS, F.IDMOVCONTRCAGED, F.IDHORARIO, F.IDCHEFE, F.IDVINCEMPREG,                ');
        Add('     F.IDFORMARESC, F.IDSITFUNC, F.IDTIPOTRAB, F.MATRICULA, F.DATAADMISSAO,                   ');
        Add('     F.TIPOCONTRATO, F.SALARIOTIPO, F.DATAOPCAOFGTS, F.DATADESLIGAMENTO,                      ');
        Add('     F.IDMOTIVODESLIGRAIS, F.IDMOTIVODESLIGGERENCIAL, F.HOMOLOGACAONUMERO,                    ');
        Add('     F.HOMOLOGACAOORGAO, F.DATARETORNO, F.TIPOMAODEOBRA,                                      ');
        Add('     F.DATAFIMCONTRATO, F.IDAGENCIASALARIO, F.NUMCONTASALARIO, F.IDAGENCIAFGTS,               ');
        Add('     F.NUMCONTAFGTS, F.DURACAOCONTRATO, F.PRORROGCONTRATO, F.FLGTIPOFGTS,                     ');
        Add('     F.QUANTIDADEFGTS, F.VALORFGTS, F.DATAAVISO, F.DATAREFHORARIO,                            ');
        Add('     F.CODARRUMADEIRA, F.IDDEPOSGRE, F.TRGDTINCLUSAO, F.TRGUSERINCLUSAO,                      ');
        Add('     F.IDPROCESSODEM, F.FLGMARCAPONTO, F.DATBANCOHORAS, F.FIR, F.UNIDNEGOC,                   ');
        Add('     F.CODSUBCONTA, F.FLGMARCAINTERVALO, F.IDPARAMPONTO, F.FLGUSABIOMETRIA,                   ');
        Add('     F.NUMCRACHA, F.TRGDTALTERACAO, F.TRGUSERALTERACAO                                        ');
        Add('   FROM                                                                                       ');
        Add('     (SELECT                                                                                  ');
        Add('        ( SELECT HST_ROWID FROM ( SELECT IDPESSOA, ROWID AS HST_ROWID FROM EVOLFUNC           ');
        Add('                                  WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(sDataReferencia)+',''DD/MM/YYYY'')');
        Add('                                  ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )           ');
        Add('         WHERE IDPESSOA = FH.IDPESSOA AND ROWNUM = 1 ) AS HST_ROWID,                          ');
        Add('         TO_DATE('+QuotedStr(sDataReferencia)+',''DD/MM/YYYY'') AS HST_DATAREF,               ');
        Add('         FH.*                                                                                 ');
        Add('      FROM                                                                                    ');
        Add('        FUNCIONARIO FH                                                                        ');
        Add('     ) F,                                                                                     ');
        Add('     EVOLFUNC E                                                                               ');
        Add('   WHERE F.HST_ROWID = E.ROWID(+)                                                             ');
        Add('  ) F,                                                                                        ');
      end
      else
        Add('  FUNCIONARIO F, ');

      Add('  SITFUNC ST, HORATRAB HT, FILIALPESSOA FP, CENTCUST CC')
    end
    else
      Add('  CANDIDAT CD');
    // Fim - Alterado por FHBS

    Add('WHERE');

    if (bMarcouFuncionario) then
      Add('  (F.IDPESSOA         = P.IDPESSOA) AND')
    else
      Add('  (CD.IDPESSOA        = P.IDPESSOA) AND');

    Add('  (P.IDPESSOA         = PF.IDPESSOA) AND');

    // Alterado por FHBS - SOL: 73954 KTN: 523465
    if (sIdFuncSel <> '') then
      Add('  (P.IDPESSOA ' + sIdFuncSel + ') AND');
    // Fim - Alterado por FHBS

    sAux := SelecionaSexo;
    if (sAux <> '') then
      Add('  (PF.SEXO           ' +sAux+ ') AND');

    sAux := SelecionaEstadoCivil;
    if (sAux <> '') then
      Add('  (PF.ESTCIVIL       ' +sAux+ ') AND');

    sAux := SelecionaTipoPagamento;
    if (sAux <> '') then
      Add('  (TIPOPAGAMENTO     ' +sAux+ ') AND');

    if (Trim(sGrauInstr) <> '') then //Grau de Instrução  // SOL 180854 KINTANA 1675788
    begin
      case (rgSinal.ItemIndex) of
        0 : sAux := ' <= ';
        1 : sAux := '  = ';
        2 : sAux := ' >= ';
      end;
      Add('  (PF.IDGRINSTR' + sAux + sGrauInstr + ') AND');   // SOL 180854 KINTANA 1675788
    end;

    if (Trim(sProfis) <> '') then // Profissão
      Add('  (PF.IDPROFISS = ' +sProfis+ ') AND'); // SOL 180854 KINTANA 1675788

    if (rgSinTot.ItemIndex < 2) or (speDepTot.Value > 0) then // Total Dependentes
    begin
      case (rgSinTot.ItemIndex) of
        0 : sAux := ' <= ';
        1 : sAux := '  = ';
        2 : sAux := ' >= ';
      end;
      Add('  (NVL(PF.NUMDEPTOT,0)' + sAux + IntToStr(speDepTot.Value)+ ') AND');
    end;

    if (rgSinIR.ItemIndex < 2) or (speDepIR.Value > 0) then // Dependentes IRRF
    begin
      case (rgSinIR.ItemIndex) of
        0 : sAux := ' <= ';
        1 : sAux := '  = ';
        2 : sAux := ' >= ';
      end;
      Add('  (NVL(PF.NUMDEPIRRF,0)' + sAux + IntToStr(speDepIR.Value)+ ') AND');
    end;

    if (rgSinSF.ItemIndex < 2) or (speDepSF.Value > 0) then // Dependentes Sal. Fam.
    begin
      case (rgSinSF.ItemIndex) of
        0 : sAux := ' <= ';
        1 : sAux := '  = ';
        2 : sAux := ' >= ';
      end;
      Add('  (NVL(PF.NUMDEPSALF,0)' + sAux + IntToStr(speDepSF.Value)+ ') AND');
    end;

    if (rgSelSindi.ItemIndex > 0) then
      Add('  (PF.IDSINDICATO ' +sIdSindicatoSel+ ') AND');

    if (ednIda1.Value > 0) then  //Faixa Etária Inicial
      Add('  (TRUNC((SYSDATE - 1 - DATANASC)/365.25) >= ' +IntToStr(ednIda1.Value)+ ') AND');

    if (ednIda2.Value < 99) then  //Faixa Etária Final
      Add('  (TRUNC((SYSDATE - 1 - DATANASC)/365.25) <= ' +IntToStr(ednIda2.Value)+ ') AND');

    if (cbxAniv.ItemIndex > 0) then // Mês do Aniversário
      Add('  (TO_NUMBER(SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YYYY''),4,2)) = '+
          IntToStr(cbxAniv.ItemIndex)+ ') AND');

    if (bMarcouFuncionario) then
    begin
      if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
        Add('  (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO  IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

      if (CtrlUsoGeralRH.UsuXFilial <> '') then
        if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
          Add('  (F.IDESTAB         IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
        else
          Add('  (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

      if (edDataAdm1.Text <> '') then
        Add('  (F.DATAADMISSAO    >= TO_DATE(' +QuotedStr(EdDataAdm1.Text)+ ',''DD/MM/YYYY'')) AND');

      if (edDataAdm2.Text <> '') then
        Add('  (F.DATAADMISSAO    <= TO_DATE(' +QuotedStr(EdDataAdm2.Text)+ ',''DD/MM/YYYY'')) AND');

      sAux := SelecionaSitFunc;
      if (sAux <> '') then
        Add('  (ST.TIPOSIT        ' +sAux+ ') AND');

      if (cbxDemitidos.Checked) then
      begin
        if (rgSelMotivo.ItemIndex > 0) then
        begin
          Add('  ((ST.TIPOSIT           <> ''D'') OR');
          Add('   (F.IDMOTIVODESLIGRAIS ' +sIdMotivoSel+ ')) AND');
        end;

        Add('  ((ST.TIPOSIT           <> ''D'') OR');
        Add('   (F.DATADESLIGAMENTO   IS NULL) OR');
        Add('   (F.DATADESLIGAMENTO BETWEEN '+
            'TO_DATE(' +QuotedStr(edDataDem1.Text)+ ',''DD/MM/YYYY'') AND '+
            'TO_DATE(' +QuotedStr(edDataDem2.Text)+ ',''DD/MM/YYYY''))) AND');
      end;

      sAux := SelecionaTipoContrato;
      if (sAux <> '') then
        Add('  (F.TIPOCONTRATO    ' +sAux+ ') AND');

      if (rgSelEstab.ItemIndex > 0) then
        Add('  (F.IDESTAB         ' +sIdEstabSel+ ') AND');

      Add('  (F.IDEMPRESA        = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

      if (rgSelRamo.ItemIndex > 0) then
        Add('  (FP.IDRAMOFORNECEDOR ' +sIdRamoSel+ ') AND');

      if (dblckCCusto.Text <> '**********') then // Máscara do Centro de Custo
        for c:=1 to Length(Trim(sCentroCusto)) do
          if (Copy(sCentroCusto,c,1) <> '*')  then
            Add('  (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
                ', 1) = ' +QuotedStr(Copy(sCentroCusto,c,1))+ ') AND');

      // Alterado por FHBS - SOL: 126380 KTN: 659768
      // Implementação para permitir a seleção de mais de um centro de custo
      if Trim(sListaCodCCustoSel) <> '' then
        Add('  (F.CODCENTROCUSTO IN ('+sListaCodCCustoSel+')) AND');
      // Fim - Alterado por FHBS

      Add('  (F.IDESTAB          = FP.IDFILIALPESSOA) AND');
      Add('  (F.IDSITFUNC        = ST.IDSITFUNC) AND');
      Add('  (F.IDHORARIO        = HT.IDHORARIO) AND');

      if (ednAdm1.Value > 0) then // Tempo de Casa Inicial
      begin
        // Anos
        Add('  ((TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''YYYY'')) -');
        Add('     TO_NUMBER(TO_CHAR(DATAADMISSAO,''YYYY''))) * 12 +');
        // Meses
        Add('   (TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''MM'')) -');
        Add('    TO_NUMBER(TO_CHAR(DATAADMISSAO,''MM''))) +');
        // Dias
        Add('   DECODE(');
        Add('     (TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATAADMISSAO,''DD''))) /');
        Add('     DECODE(');
        Add('       TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD''),');
        Add('       TO_CHAR(DATAADMISSAO,''DD''),');
        Add('       1,');
        Add('       ABS(');
        Add('         TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD'')) -');
        Add('         TO_NUMBER(TO_CHAR(DATAADMISSAO,''DD''))');
        Add('       )), -1, -1, 0) >= ' +IntToStr(ednAdm1.Value)+ ') AND');
      end;

      if (ednAdm2.Value < 999) then //Tempo de Casa Final
      begin
        // Anos
        Add('  ((TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''YYYY'')) -');
        Add('     TO_NUMBER(TO_CHAR(DATAADMISSAO,''YYYY''))) * 12 +');
        // Meses
        Add('   (TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''MM'')) -');
        Add('    TO_NUMBER(TO_CHAR(DATAADMISSAO,''MM''))) +');
        // Dias
        Add('   DECODE(');
        Add('     (TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATAADMISSAO,''DD''))) /');
        Add('     DECODE(');
        Add('       TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD''),');
        Add('       TO_CHAR(DATAADMISSAO,''DD''),');
        Add('       1,');
        Add('       ABS(');
        Add('         TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD'')) -');
        Add('         TO_NUMBER(TO_CHAR(DATAADMISSAO,''DD''))');
        Add('       )), -1, -1, 0) <= ' +IntToStr(ednAdm2.Value)+ ') AND');
      end;

      if (ednLot1.Value > 0) then //Tempo na Lotação Inicial
      begin
        Add('(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),7,10)) -');
        Add(' TO_NUMBER(SUBSTR(TO_CHAR(datalotacao,''DD/MM/YYYY''),7,10))) * 12 +');
        Add(' TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),4,2)) -');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datalotacao,''DD/MM/YYYY''),4,2)) +');
        Add('  DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datalotacao,''DD/MM/YYYY''),1,2))) /');
        Add('  DECODE(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2),');
        Add('  SUBSTR(TO_CHAR(datalotacao,''DD/MM/YYYY''),1,2),1,');
        Add('  abs(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) - ');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datalotacao,''DD/MM/YYYY''),1,2)))),-1,-1,0) '+
            '  >= ' + IntToStr(ednLot1.Value) + ' AND ');
      end;

      if (ednLot2.Value < 999) then //Tempo na Lotação Final
      begin
        Add(' (TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),7,10)) -');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datalotacao,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),4,2)) -');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datalotacao,''DD/MM/YYYY''),4,2)) + ');
        Add('  DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) - ');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datalotacao,''DD/MM/YYYY''),1,2))) / ');
        Add('  DECODE(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2), ');
        Add('  SUBSTR(TO_CHAR(datalotacao,''DD/MM/YYYY''),1,2),1, ');
        Add('  abs(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) - ');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datalotacao,''DD/MM/YYYY''),1,2)))),-1,-1,0) '+
            '  <= ' + IntToStr(ednLot2.Value) + ' AND');
      end;

      if (ednCar1.Value > 0) then //Tempo no Cargo Inicial
      begin
        Add(' (TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),7,10)) -');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datacargo,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),4,2)) -');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datacargo,''DD/MM/YYYY''),4,2)) + ');
        Add('  DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) - ');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datacargo,''DD/MM/YYYY''),1,2))) / ');
        Add('  DECODE(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2), ');
        Add('  SUBSTR(TO_CHAR(datacargo,''DD/MM/YYYY''),1,2),1, ');
        Add('  abs(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) - ');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datacargo,''DD/MM/YYYY''),1,2)))),-1,-1,0) '+
            '  >= ' + IntToStr(ednCar1.Value) + ' AND ');
      end;

      if (ednCar2.Value < 999) then //Tempo no Cargo Final
      begin
        Add(' (TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),7,10)) -');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datacargo,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),4,2)) -');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datacargo,''DD/MM/YYYY''),4,2)) + ');
        Add('  DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) - ');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datacargo,''DD/MM/YYYY''),1,2))) / ');
        Add('  DECODE(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2), ');
        Add('  SUBSTR(TO_CHAR(datacargo,''DD/MM/YYYY''),1,2),1, ');
        Add('  abs(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) - ');
        Add('  TO_NUMBER(SUBSTR(TO_CHAR(datacargo,''DD/MM/YYYY''),1,2)))),-1,-1,0) '+
            '  <= ' + IntToStr(ednCar2.Value) + ' AND ');
      end;

      if (StrToInt(ednSal1.Text) > 0) then //Faixa de Salário Inicial
        Add('  (F.SALARIOATUAL * DECODE(F.TIPOPAGAMENTO,''M'', 1,'+
            ' DECODE(F.TIPOPAGAMENTO,''H'', JORNADAMENSAL, 30))'+
            ' >= ' +(ednSal1.Text)+ ') AND');

      if (StrToInt(ednSal2.Text) < 99999999) then //Faixa de Salário Final
        Add('  (F.SALARIOATUAL * DECODE(F.TIPOPAGAMENTO,''M'', 1,'+
            ' DECODE(F.TIPOPAGAMENTO,''H'', JORNADAMENSAL, 30))'+
            ' <= ' +(ednSal2.Text)+ ') AND');

      if (cbxCargoAltern.Checked) then
        Add('  (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO(+)) AND')
      else
        Add('  (F.IDCARGO          = C.IDCARGO(+)) AND');

      Add('  (F.CODCENTROCUSTO   = CC.CODCENTROCUSTO(+)) AND');
      Add('  (F.IDEMPRESA        = CC.IDEMPRESA(+)) AND');
    end
    else
    begin
      Add('  (CD.IDPESSOA = P.IDPESSOA) AND');
      Add('  (CD.IDCARGO  = C.IDCARGO(+)) AND');

      if (StrToInt(ednSal1.Text) > 0) then //Faixa de Salário Inicial
        Add('  (CD.SALARIO * DECODE(CD.TIPOPAGAMENTO,''M'', 1,'+
            ' DECODE(CD.TIPOPAGAMENTO,''H'', 220, 30))'+
            ' >= ' +(ednSal1.Text)+ ') AND');

      if (StrToInt(ednSal2.Text) < 99999999) then //Faixa de Salário Final
        Add('  (CD.SALARIO * DECODE(CD.TIPOPAGAMENTO,''M'', 1,'+
            ' DECODE(CD.TIPOPAGAMENTO,''H'', 220, 30))'+
            ' <= ' +(ednSal2.Text)+ ') AND');
    end;

    if (rgSelCargo.ItemIndex > 0) then
      if (bMarcouFuncionario) then
      begin
        if (cbxCargoAltern.Checked) then
          Add('  (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) ' +sIdCargoSel+ ') AND')
        else
          Add('  (F.IDCARGO ' +sIdCargoSel+ ') AND');
      end
      else
        Add('  (CD.IDCARGO ' +sIdCargoSel+ ') AND');

    Add('  (P.IDENDRESIDENCIAL = EP.IDENDERECO(+)) AND');

    if (Round(StrToInt(ednCep1.Text)) > 0) then  //Faixa de CEP Inicial
      Add('  (TO_NUMBER(EP.CEP)/1000 >= ' +ednCep1.Text+ ') AND');

    if (Round(StrToInt(ednCep2.Text)) < 99999) then //Faixa de CEP Final
      Add('  (TO_NUMBER(EP.CEP)/1000 <= ' +ednCep2.Text+ ') AND');

    Add('  (EP.IDCIDADES       = CI.IDCIDADES(+))');
  end;

  // Ordem da seleção
  sqlPrincipal.SQL.Add('ORDER BY');
  if (bMarcouFuncionario) then
    sqlPrincipal.SQL.Add('  '+ORDEM_DADOS_FUNC[cmbSequencia.ItemIndex])
  else
    sqlPrincipal.SQL.Add('  '+ORDEM_DADOS_CAND[cmbSequencia.ItemIndex]);

  if (AbrirQueryPrincipal) then
  begin
    CdsPrincipal.DisableControls;
    sqlPrincipal.Open;
    CdsPrincipal.EnableControls;
  end;

  if (IrPaginaResult) then
    ExecutarIrPaginaResult;

  ModalResult := mrOk;
end;

procedure TfrmSelPessoalMT.bbtnOutraVezClick(Sender: TObject);
begin
  bbtnOutraVez.Visible := false;
  pnResult.Visible := false;  
  pnResult.SendToBack;

  if (cbxSubEstab.Checked) and (CdsEstab.Active) then
  begin
    sqlEstab.Prepare;
    sqlEstab.ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
    sqlEstab.Open;
  end;

  TB97oKCancelar.Visible := true;
  TB97oKCancelar.DockPos := Dock971.Width - tb97Fundo.Width;
  TB97oKCancelar.Repaint;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmSelPessoalMT.MudarSequencia;
var
  c, Limite: byte;
  iPos: integer;
begin
  if (rgSequencia.Visible) then
  begin
    iPos := cmbSequencia.ItemIndex;
    Limite := 15;

    if (cbxCandidatos.Checked) then
    begin
      Limite := 3;
      if (iPos > 3) then
        iPos := 0;
    end;

    if (Limite <> cmbSequencia.Items.Count) then
    begin
      cmbSequencia.Items.Clear;
      for c:=0 to Limite do
        cmbSequencia.Items.Add(TITULO_SEQUENCIA[c]);
    end;
    cmbSequencia.ItemIndex := iPos;
  end;
end;

procedure TfrmSelPessoalMT.ExecutarIrPaginaResult;
begin
  bbtnOutraVez.Visible := true;
  TB97oKCancelar.Visible := false;
  pnResult.BringToFront;
  pnResult.Visible := true;
end;

function TfrmSelPessoalMT.GerarListaIdEstab(bOperador: Boolean): string;
var
  c: integer;
begin
  Result := '';
  if (rgSelEstab.ItemIndex > 0) then
  begin
    for c:=0 to lstEstab.Items.Count-1 do
    begin
      if (lstEstab.Items[c] = '') then
        break;

      if (Result = '') then
        Result := Result + lstCodEstab.Items[c]
      else
        Result := Result +','+ lstCodEstab.Items[c];

      if (cbxSubEstab.checked) then
      begin
        sqlEstab.Prepare;
        sqlEstab.ParamByName('IdEmpresa').asInteger := StrToInt(lstCodEstab.Items[c]);
        sqlEstab.Open;

        while not(CdsEstab.EOF) do
        begin
          Result := Result +','+ CdsEstab.FieldByName('IdPessoa').asString;
          CdsEstab.Next;
        end;
      end;
    end;
    if (Result <> '') and (bOperador) then // Alterado por FHBS - SOL: 73954 KTN: 523465
      if (Pos(',', Result) = 0) then
        Result := ' = '+ Result
      else
        Result := 'IN ('+ Result +')';
  end;
end;

function TfrmSelPessoalMT.GerarListaIdCargo: string;
var
  c: integer;
begin
  Result := '';
  if (rgSelCargo.ItemIndex > 0) then
  begin
    for c:=0 to lstCargo.Items.Count-1 do
    begin
      if (lstCargo.Items[c] = '') then
        break;

      if (Result = '') then
        Result := Result + lstCodCargo.Items[c]
      else
        Result := Result +','+ lstCodCargo.Items[c];
    end;
    if (Result <> '') then
      if (Pos(',', Result) = 0) then
        Result := ' = '+ Result
      else
        Result := 'IN ('+ Result +')';
  end;
end;

function TfrmSelPessoalMT.GerarListaIdSindicato: string;
var
  c: integer;
begin
  Result := '';
  if (rgSelSindi.ItemIndex > 0) then
  begin
    for c:=0 to lstSindicato.Items.Count-1 do
    begin
      if (lstSindicato.Items[c] = '') then
        break;

      if (Result = '') then
        Result := Result + lstCodSindicato.Items[c]
      else
        Result := Result +','+ lstCodSindicato.Items[c];
    end;
    if (Result <> '') then
      if (Pos(',', Result) = 0) then
        Result := ' = '+ Result
      else
        Result := 'IN ('+ Result +')';
  end;
end;

function TfrmSelPessoalMT.GerarListaIdRamo: string;
var
  c: integer;
begin
  Result := '';
  if (rgSelRamo.ItemIndex > 0) then
  begin
    for c:=0 to lstRamo.Items.Count-1 do
    begin
      if (lstRamo.Items[c] = '') then
        break;

      if (Result = '') then
        Result := Result + lstCodRamo.Items[c]
      else
        Result := Result +','+ lstCodRamo.Items[c];
    end;
    if (Result <> '') then
      if (Pos(',', Result) = 0) then
        Result := ' = '+ Result
      else
        Result := 'IN ('+ Result +')';
  end;
end;

function TfrmSelPessoalMT.GerarListaIdMotivo: string;
var
  c: integer;
begin
  Result := '';
  if (rgSelMotivo.ItemIndex > 0) and (cbxDemitidos.Checked) then
  begin
    for c:=0 to lstMotivo.Items.Count-1 do
    begin
      if (lstMotivo.Items[c] = '') then
        break;

      if (Result = '') then
        Result := Result + lstCodMotivo.Items[c]
      else
        Result := Result +','+ lstCodMotivo.Items[c];
    end;
    if (Result <> '') then
      if (Pos(',', Result) = 0) then
        Result := ' = '+ Result
      else
        Result := 'IN ('+ Result +')';
  end;
end;

function TfrmSelPessoalMT.SelecionaTipoContrato(bOperador: Boolean): string;
begin
  Result := '';
  if (cbxEfetivos.Checked) and (cbxEspeciais.Checked) and (cbxTemporarios.Checked) and
     (cbxTerceiros.Checked) and (cbxPropDirSemVinc.Checked) and (cbxAutonomos.Checked) and
     (cbxEstagiarios.Checked) then
    exit;

  if (cbxEfetivos.Checked) then
    Result := QuotedStr('E');

  if (cbxEspeciais.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('S')
    else
      Result := QuotedStr('S');

  if (cbxTemporarios.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('T')
    else
      Result := QuotedStr('T');

  if (cbxTerceiros.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('3')
    else
      Result := QuotedStr('3');

  if (cbxPropDirSemVinc.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('P')
    else
      Result := QuotedStr('P');

  if (cbxAutonomos.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('A')
    else
      Result := QuotedStr('A');

  if (cbxEstagiarios.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('G')
    else
      Result := QuotedStr('G');

  if (Result <> '') and (bOperador) then // Alterado por FHBS - SOL: 73954 KTN: 523465
    if (Pos(',', Result) = 0) then
      Result := ' = '+ Result
    else
      Result := 'IN ('+ Result +')';
end;

function TfrmSelPessoalMT.SelecionaSitFunc(bOperador: Boolean): string;
begin
  Result := '';
  if (cbxAtivos.Checked) and (cbxAfastados.Checked) and (cbxDemitidos.Checked) then
    exit;

  if (cbxAtivos.Checked) then
    Result := QuotedStr('A');

  if (cbxAfastados.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('F')
    else
      Result := QuotedStr('F');

  if (cbxDemitidos.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('D')
    else
      Result := QuotedStr('D');

  if (Result <> '') and (bOperador) then // Alterado por FHBS - SOL: 73954 KTN: 523465
    if (Pos(',', Result) = 0) then
      Result := ' = '+ Result
    else
      Result := 'IN ('+ Result +')';
end;

function TfrmSelPessoalMT.SelecionaSexo: string;
begin
  Result := '';
  if (cbxMasculino.Checked) and (cbxFeminino.Checked) then
    exit;

  if (cbxMasculino.Checked) then
    Result := QuotedStr('M');

  if (cbxFeminino.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('F')
    else
      Result := QuotedStr('F');

  if (Result <> '') then
    if (Pos(',', Result) = 0) then
      Result := ' = '+ Result
    else
      Result := 'IN ('+ Result +')';
end;

function TfrmSelPessoalMT.SelecionaEstadoCivil: string;
begin
  Result := '';

//Início - William Santana - SOL 211661/15807 - KIN 2060908
//  if (cbxSolteiro.Checked) and (cbxCasado.Checked) and (cbxSeparado.Checked) and
//     (cbxSeparadoJud.Checked) and (cbxDesquitado.Checked) and (cbxViuvo.Checked) and
//     (cbxOutro.Checked) then
//    exit;

  if (cbxSolteiro.Checked) and (cbxCasado.Checked) and (cbxSeparado.Checked) and
     (cbxSeparadoJud.Checked) and (cbxViuvo.Checked) and
     (cbxOutro.Checked) then
    exit;

//Término - William Santana - SOL 211661/15807 - KIN 2060908

  if (cbxSolteiro.Checked) then
    Result := QuotedStr('S');

  if (cbxCasado.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('C')
    else
      Result := QuotedStr('C');

  if (cbxSeparado.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('D')
    else
      Result := QuotedStr('D');

  if (cbxSeparadoJud.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('J')
    else
      Result := QuotedStr('J');

//Início - William Santana - SOL 211661/15807 - KIN 2060908
//  if (cbxDesquitado.Checked) then
//    if (length(Result) > 0) then
//      Result := Result +','+ QuotedStr('E')
//    else
//      Result := QuotedStr('E');
//Término - William Santana - SOL 211661/15807 - KIN 2060908

  if (cbxViuvo.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('V')
    else
      Result := QuotedStr('V');

  if (cbxOutro.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('O')
    else
      Result := QuotedStr('O');

  if (Result <> '') then
    if (Pos(',', Result) = 0) then
      Result := ' = '+ Result
    else
      Result := 'IN ('+ Result +')';
end;

function TfrmSelPessoalMT.SelecionaTipoPagamento: string;
begin
  Result := '';
  if (cbxMensalistas.Checked) and (cbxDiaristas.Checked) and (cbxHoristas.Checked) then
    exit;

  if (cbxMensalistas.Checked) then
    Result := QuotedStr('M');

  if (cbxDiaristas.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('D')
    else
      Result := QuotedStr('D');

  if (cbxHoristas.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('H')
    else
      Result := QuotedStr('H');

  if (Result <> '') then
    if (Pos(',', Result) = 0) then
      Result := ' = '+ Result
    else
      Result := 'IN ('+ Result +')';
end;

procedure TfrmSelPessoalMT.dblckCCustoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dblckCCusto.Text := CdsCCusto.FieldByName('NOME').asString;
  sCentroCusto     := CdsCCusto.FieldByName('CODCENTROCUSTO').asString;
end;

procedure TfrmSelPessoalMT.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;

procedure TfrmSelPessoalMT.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
end;

procedure TfrmSelPessoalMT.MontaListaFuncionarios;
var
  sIdEstabSel, sSitFunc, sTipoContrato: String;
begin
  if tbsListaFunc.TabVisible then
  begin
    sIdEstabSel   := StringReplace(GerarListaIdEstab(False),'''','',[rfReplaceAll]);
    sSitFunc      := StringReplace(SelecionaSitFunc(False),'''','',[rfReplaceAll]);
    sTipoContrato := StringReplace(SelecionaTipoContrato(False),'''','',[rfReplaceAll]);

    if (chklstFunc.Items.Count = 0) or (FOldIdEstabSel <> sIdEstabSel) or (FOldSitFunc <> sSitFunc) or (FOldTipoContrato <> sTipoContrato) then
    begin
      ListaIdFunc.Clear;
      chklstFunc.Items.Clear;

      CdsListaFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa, '', sIdEstabSel, sSitFunc, sTipoContrato );
      CdsListaFunc.First;
      while not(CdsListaFunc.EOF) do
      begin
        ListaIdFunc.Add(CdsListaFunc.FieldByName('IDPESSOA').asString);
        chklstFunc.Items.Add(CdsListaFunc.FieldByName('NOME').asString);
        CdsListaFunc.Next;
      end;
    end;

    FOldIdEstabSel := sIdEstabSel;
    FOldSitFunc := sSitFunc;
    FOldTipoContrato := sTipoContrato;
  end;
end;

function TfrmSelPessoalMT.GerarListaIdFunc(bOperador: Boolean): String;
var
  c, iCheck: integer;
begin
  Result := '';
  if (tbsListaFunc.TabVisible) then
  begin
    iCheck := 0;
    for c:=0 to chklstFunc.Items.Count-1 do
    begin
      if chklstFunc.Checked[c] then
      begin
        if (Result = '') then
          Result := Result + ListaIdFunc.Strings[c]
        else
          Result := Result +','+ ListaIdFunc.Strings[c];
        iCheck := iCheck + 1;
      end;
    end;

    if iCheck = chklstFunc.Items.Count then
      Result := '';

    if (Result <> '') and (bOperador) then
      if (Pos(',', Result) = 0) then
        Result := ' = '+ Result
      else
        Result := 'IN ('+ Result +')';
  end;
end;

procedure TfrmSelPessoalMT.pgctrlPrincipalChange(Sender: TObject);
begin
  inherited;
  // Alterado por FHBS - SOL: 73954 KTN: 523465
  MontaListaFuncionarios;
end;

end.
