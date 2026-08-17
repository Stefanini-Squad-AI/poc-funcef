{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
N. WO..............: 9895
Data da Alteração..: 16/04/2024
Responsável........: Helen V Bianchi
Descrição..........: Adidionado na os campos: flgAtivo e flggravarubrica
--------------------------------------------------------------------------------
 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
N. SIG .............: 61905
Data da Alteração ..: 23/04/2019
Alteração Form .....: fCadProvDesc
Responsável ........: Everson Cunha
Descrição ..........: Alterar a obrigatoriedade do preenchimento do campo Natu-
                      reza da rubrica, sendo opcional caso o Tipo da Rubrica
                      seja "Outros"
--------------------------------------------------------------------------------
Rotina             : LimparCamposeSocial, LiberaCamposeSocial, Sel, FormCreate
N. SIG..........   : 38475.59579
Data da Alteração: : 04/12/2017
Alteração Form:    : fCadProvDesc
Responsável:       : Cássio Florêncio Rovaroto
Descrição.......   : Inclusão do item "Outros - Dedutora" em gbxTipoRub;
                     exclusão dos campos grbInidcarRub, e subjacentes, além do
                     campo grpFatorPercRubr.
                     Remoção das referências aos campos INCIDEDESCSEMANREMUn,
                     INCIDE13SAL, INCIDEFERIAS, INCIDEAVISOPREVIO, FATOROUPERC.
--------------------------------------------------------------------------------
Rotina...........: CdsAfterInsert, dbedtNumProCPKeyUp
Nº SIG...........: 34125
Data da Alteração: 01/06/2017
Responsável......: Andre Imakawa
Descrição........: Criação do campo FLGRATEARPORDEPENDENTE
--------------------------------------------------------------------------------
Nº SOL: 229874.16590
Nº PPM: 1203875
Data da Alteração: 08/12/2015
Alteração Form: ajustes de campos novos e alteração de outros campos
Responsável: Michelle Suellyn Mota
Descrição: Adequação do cadastro de rubricas ao manual 2.1 do eSocial
--------------------------------------------------------------------------------
Autor(a)   : Felipe Azevedo dos Santos / William Santana
Data       : 14/11/20134
Pendência  : SOL 229874/16590 PPM 544597
Descricao  : incluido aba eSocial para cadastro de rubricas.
--------------------------------------------------------------------------------
Rotina......: varias
N. Sol......: 229353-16212
N. Kintana..: 434575
Data........: 18-09-2014
Responsável.: Higor Nayde
Descrição...: ajuste referente ao e-social
--------------------------------------------------------------------------------
Nº SOL....:        191668
Nº KINTANA:        1820235
Data da Alteração: 25/11/2014
Alteração Form:    aba Incidencia de Eventos, remover radiogroup, combos,
                   acrescentar grid
Responsável:       Edilaine
Descrição:         Trocar o tipo de cadastro de radio group para grid na aba
                   "Incidência de Eventos" do cadastro de rubricas salariais
--------------------------------------------------------------------------------
Autor(a)   : Felipe Azevedo dos Santos
Data       : 16/01/2013
Pendência  : SOL 177438 KTN 1635220
Descricao  : foi incluído o checkbox dbchkEmprestimofinan.
--------------------------------------------------------------------------------
Autor(a)   : Douglas Siqueira
Data       : 21/12/2012
Pendência  : SOL 108804 KTN 494141
Descricao  : Retirar visualização na Folha de Pagamento de dados de outros
             módulos, tais como: layout de arquivos TXT, tabelas genéricas,
             rubricas, formas de cálculo etc.
             Menus: * Cadastro / Tabelas Auxiliares / Tabela REGRA/Forma de
             Cálculo - Forma de Cálculo e Tabela Genérica * Sistema /
             Utilitários / Layout de Arquivos TXT * Cadastros / Rubricas por
             Empresa * Cadastros / Rubricas Salariais * Cadastros / Motivos e
             Ações Impedir o mesmo acesso aos dados da folha por outros módulos.
--------------------------------------------------------------------------------
Nº SOL......: 154980
Nº KINTANA..: 1197282
Data........: 02/07/2012
Responsável.: Monica da Silva Gonzaga
Descrição...: Flag Rubricas de Cedidos e Beneficios
--------------------------------------------------------------------------------
Rotina......: FormCreate, CdsAfterInsert, VerificaCamposChave,
              dbchkExcessoDebClick
Nº SOL......: 141270
Nº KINTANA..: 890829
Data........: 11/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação dos campos Excesso de Débito, Rubrica Excesso de
              Débito e Débito em Conta 
--------------------------------------------------------------------------------
Rotina: Create
Nº SOL: 126964
Nº KINTANA: 668955
Data da Alteração:  29/01/2010
Responsável: Marilza Colpani
Descrição: Desvincular a flag FLGESPECIAL do módulo Folha de Pagamento,
                 substituindo pelo flag FLGESPECIALFP, que receberá todos os
                 valores da flag desvinculada.
--------------------------------------------------------------------------------}

unit fCadProvDesc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  fCadastroMestreDetMT, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, Mask, TB97,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ImgList, DBCtrls,
  TabControlDetalhe, ExtCtrls, wwdblook, Wwdbspin, wwdbedit, DBClient, CmEventosCadastro,
  uCMClientDataSet, uCtrlProvDesc, uCtrlRubCLT, uCtrlListTerceirosRH, uCtrlSitFunc,
  Wwdotdot, Wwdbcomb,
  uCtrlMotivo,   // edilaine - SOL 191668 / KTN 1820235
  uCtrlInctributXRubrica{ Felipe A. Santos SOL229874.16590 };

type
  TfrmCadProvDesc = class(TFrmCadastroMestreDetMT)
    Label2: TLabel;
    Label4: TLabel;
    lblRegraNormal: TLabel;
    Label6: TLabel;
    dbedDescr: TwwDBEdit;
    gbxOpcoes: TGroupBox;
    dbchkObrigaFavorecido: TDBCheckBox;
    dbchkConstaFolha: TDBCheckBox;
    //dbchkEspecial: TDBCheckBox;
    gbxTipoRub: TDBRadioGroup;
    gbxSeqCalc: TGroupBox;
    dbedSeqCalc: TwwDBSpinEdit;
    dblcRegraNormal: TwwDBLookupCombo;
    dblcInforme: TwwDBLookupCombo;
    dblkcmbRubCLT: TwwDBLookupCombo;
    tbsIncidEv: TTabSheet;
    tbsIncidDeOutRub: TTabSheet;
    tbsIncidAfast: TTabSheet;
    Label5: TLabel;
    Label3: TLabel;
    dbclkcmbRubIncid1: TwwDBLookupCombo;
    dbrgFlg: TDBRadioGroup;
    dbrgFlgTipoFolha: TDBRadioGroup;
    dbspPeriodo1: TwwDBSpinEdit;
    dbrgTipoAcao: TDBRadioGroup;
    dsRubxRubDe: TwwDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label7: TLabel;
    dbclkcmbRubIncid2: TwwDBLookupCombo;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    dbspPeriodo2: TwwDBSpinEdit;
    DBRadioGroup3: TDBRadioGroup;
    Panel2: TPanel;
    Label10: TLabel;
    dblcSitFunc: TwwDBLookupCombo;
    dsRubxRubEm: TwwDataSource;
    dbgrdIncidAfast: TwwDBGrid;
    dbgrdIncidDeOutRub: TwwDBGrid;
    Label8: TLabel;
    dblcNaturOper: TwwDBLookupCombo;
    CdsRubSit: TCMClientDataSet;
    CdsRegra: TCMClientDataSet;
    CdsRubCLT: TCMClientDataSet;
    CdsInforme: TCMClientDataSet;
    CdsRubIncid: TCMClientDataSet;
    CdsNaturOper: TCMClientDataSet;
    CdsSituacao: TCMClientDataSet;
    CdsRubxRubEm: TCMClientDataSet;
    CdsRubxRubDe: TCMClientDataSet;
    Toolbar972: TToolbar97;
    bbtnCopiarRub: TBitBtn;
    edCodInterno: TEdit;
    edSeuCod: TEdit;
    Label9: TLabel;
    Label11: TLabel;
    gbxFontePagadora: TGroupBox;
    dbcmbFontePagadora: TwwDBComboBox;
    gbxPrioridadeDesc: TGroupBox;
    dbEdPrioridadeDesc: TwwDBSpinEdit;
    dbchkEspecialFP: TDBCheckBox;
    dbchkDebConta: TDBCheckBox;
    pnlIdProventoExcessoDeb: TPanel;
    lblIdProventoExcessoDeb: TLabel;
    MontaSelectED: TMontaSelect;
    btnSelecionaProventoED: TBitBtn;
    btnLimpaProventoED: TBitBtn;
    CdsRubExcessoDeb: TCMClientDataSet;
    pnlEdRubExcessoDeb: TPanel;
    dblkcmbIdProventoExcessoDeb: TwwDBLookupCombo;
    dbrgContribuicao: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    dbchkEmprestimoFinan: TDBCheckBox;
    cdsRubxEvento: TCMClientDataSet;
    dsRubxEvento: TwwDataSource;
    dbgrdEvento: TwwDBGrid;
    pnlRubxEvento: TPanel;
    lblMotivoEvento: TLabel;
    lblRegrasEvento: TLabel;
    dblcRegraCalc: TwwDBLookupCombo;
    cdsMotivo: TCMClientDataSet;
    dblkMotivo: TwwDBLookupCombo;
		Label12: TLabel;
    cdsCodeSocial: TCMClientDataSet;
    dblkCodesocial: TwwDBEdit;
    edtNaturezaRubrica: TwwDBEdit;//Michelle Mota - SOL 229874.16590 - PPM 1203875
    BitBtn1: TBitBtn;
    Label13: TLabel;

    // Felipe A. Santos SOL 229874.16590 PPM 544597 - início
    tbseSocial: TTabSheet;
    grbCodIncTribRub: TGroupBox;
    grbProcessoRub: TGroupBox;
    grbProCP: TGroupBox;
    lblNumProCP: TLabel;
    btnProcCP: TBitBtn;
    dbedtNumProCP: TwwDBEdit;
    grbProIR: TGroupBox;
    lblNumProIR: TLabel;
    btnProcIR: TBitBtn;
    dbedtNumProIR: TwwDBEdit;
    grbProFGTS: TGroupBox;
    lblNumProFGTS: TLabel;
    btnProcFGTS: TBitBtn;
    dbedtNumProFGTS: TwwDBEdit;
    CdsInctributXRubrica: TCMClientDataSet;
    msProcessos: TMontaSelect;
    CdsProcessosRub: TCMClientDataSet;
    dsProcessosRub: TwwDataSource;
    grbRubPrevSoc: TGroupBox;
    lblDescRubPrevSoc: TLabel;
    cbbDescRubPrevSoc: TwwDBLookupCombo;
    grbRubFGTS: TGroupBox;
    lblDescRubFGTS: TLabel;
    cbbDescRubFGTS: TwwDBLookupCombo;
    grbRubIRFF: TGroupBox;
    lblDescRubIRFF: TLabel;
    cbbDescRubIRFF: TwwDBLookupCombo;
    CdsRubPrevSoc: TCMClientDataSet;
    CdsRubFGTS: TCMClientDataSet;
    CdsRubIRFF: TCMClientDataSet;
    dbrgrpQtdRefApur: TDBRadioGroup;
    dbchkExcessoDeb: TDBCheckBox;
    MontaSelectNaturezaRub: TMontaSelect;
    dbchkFLGRATEARPORDEPENDENTE: TDBCheckBox;
    btnLimpaNaturezaRubrica: TBitBtn;
    gbxFlag: TGroupBox;
    dbckGravar: TDBCheckBox;
    dbckAtivo: TDBCheckBox;
    // Felipe A. Santos SOL 229874.16590 PPM 544597 - Término
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcSitFuncCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dbclkcmbRubIncid1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dbclkcmbRubIncid2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure CdsRubxRubEmAfterInsert(DataSet: TDataSet);
    procedure CdsRubxRubDeAfterInsert(DataSet: TDataSet);
    procedure CdsRubSitAfterInsert(DataSet: TDataSet);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCopiarRubClick(Sender: TObject);
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure dsRubxRubEmStateChange(Sender: TObject);
    procedure dsRubxRubDeStateChange(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    //Cássio Rovaroto - SIG nº 38475.59579 - Início
    //procedure gbxTipoRubChange(Sender: TObject);
    //Cássio Rovaroto - SIG nº 38475.59579 - Fim
    procedure dbchkExcessoDebClick(Sender: TObject);
    procedure btnSelecionaProventoEDClick(Sender: TObject);
    procedure btnLimpaProventoEDClick(Sender: TObject);
 		procedure BitBtn1Click(Sender: TObject);
    procedure dbchkEmprestimoFinanClick(Sender: TObject);
    procedure dsRubxEventoStateChange(Sender: TObject);
    procedure cdsRubxEventoAfterInsert(DataSet: TDataSet);
    procedure dblcRegraCalcCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkMotivoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);    

    // Felipe A. Santos SOL 229874.16590 PPM 544597 - início
    procedure bbtnCancelarClick(Sender: TObject);
    procedure ClickProcurarNumProc(Sender : TObject); 
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject); //Michelle Mota - SOL 229874.16590 - PPM 1203875
    procedure NumProCPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbedtNumProCPKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbchkFLGRATEARPORDEPENDENTEClick(Sender: TObject); //Michelle Mota - SOL 229874.16590 - PPM 1203875
    procedure btnLimpaNaturezaRubricaClick(Sender: TObject);
    // Felipe A. Santos SOL 229874.16590 PPM 544597 - Fim
  private
    CtrlProvDesc: TCtrlProvDesc;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlRubCLT: TCtrlRubCLT;
    CtrlSitFunc: TCtrlSitFunc;
    CtrlMotivo : TCtrlMotivo; // edilaine - SOL 191668 / KTN 1820235
    iIdLinha   : integer;     // edilaine - SOL 191668 / KTN 1820235
    CtrlInctributXRubrica : TCtrlInctributXRubrica; // Felipe A. Santos SOL 229874.16590 PPM 544597
    SeuCodigo: string;
    
    // Felipe A. Santos SOL 229874.16590 PPM 544597 - início
    sGrupoIncTribut : string;
    lCodigoDescRubIncTribut : TStringList;
    iHelp : Integer;
    // Felipe A. Santos SOL 229874.16590 PPM 544597 - fim

    function  VerificaDuplicidadeMotivo : boolean; // edilaine - SOL 191668 / KTN 1820235
    procedure Sel(SelPrincipal: boolean; IdProvento: double);
    function VerificaCamposChave: boolean;
    function GravarRegistro(Exclusao: boolean = false): boolean;   
    // Felipe A. Santos SOL 229874.16590 PPM 544597 - Início
    procedure LimparCamposeSocial;
    procedure SeleSocial(IdProvento: double);
    function VerificaCamposeSocial:boolean;
    procedure LiberaCamposeSocial(pLibera : boolean);
    // Felipe A. Santos SOL 229874.16590 PPM 544597 - Fim
  end;

var
  frmCadProvDesc: TfrmCadProvDesc;
  Texto: string;//Michelle Mota - SOL 229874.16590 - PPM 1203875

implementation

uses uCMTypes, uSistema, uMensErro, uCtrlFuncoesRH, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadProvDesc.FormCreate(Sender: TObject);
begin
  inherited;
  Texto := '';//Michelle Mota - SOL 229874.16590 - PPM 1203875
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlRubCLT := TCtrlRubCLT.Create;
  CtrlRubCLT.InitializeAs(Padroes);

  CtrlSitFunc := TCtrlSitFunc.Create;
  CtrlSitFunc.InitializeAs(Padroes);

  // inicio - edilaine - SOL 191668 / KTN 1820235
  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);
  // fim - edilaine - SOL 191668 / KTN 1820235

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);
  CtrlProvDesc.Cds := Cds;
  CtrlProvDesc.CdsRubSit := CdsRubSit;
  CtrlProvDesc.CdsRubxRubEm := CdsRubxRubEm;
  CtrlProvDesc.CdsRubxRubDe := CdsRubxRubDe;
  CtrlProvDesc.CdsRubxEvento := CdsRubxEvento;  // edilaine - SOL 191668 / KTN 1820235
  
  // Felipe A. Santos SOL 229874.16590 PPM 544597 - início
  CtrlInctributXRubrica := TCtrlInctributXRubrica.Create;
  CtrlInctributXRubrica.InitializeAs(Padroes);

  lCodigoDescRubIncTribut := TStringList.Create;
  iHelp := 210022;
  // Felipe A. Santos SOL 229874.16590 PPM 544597 - fim

  // Alterado por FHBS - SOL: 141270 KTN: 890829
  CdsRubExcessoDeb.Data := CtrlProvDesc.ListRubricasRH;
  // Fim - Alterado por FHBS

  gbxFontePagadora.Visible := (Sistema.TipoEmpresa = 'P');

  // Alterado por FHBS - SOL: 141270 KTN: 890829
  if (gbxFontePagadora.Visible) then begin
    gbxOpcoes.Height := 103;
    dbchkConstaFolha.Top      := 20;
    dbchkObrigaFavorecido.Top := 41;
    dbchkEspecialFP.Top       := 60;
    dbchkDebConta.Top         := 80;
  end else begin
    gbxOpcoes.Height := 148;
    dbchkConstaFolha.Top      := 29;
    dbchkObrigaFavorecido.Top := 59;
    dbchkEspecialFP.Top       := 87;
    dbchkDebConta.Top         := 116;
  end;
//  if (gbxFontePagadora.Visible) then
//  begin
//    gbxOpcoes.Height := 103;
//    dbchkConstaFolha.Top := 20;
//    dbchkObrigaFavorecido.Top := 49;
////    dbchkEspecial.Top := 75;
//    dbchkEspecialFP.Top := 75;//Marilza Colpani - SOL 126964/KTN 668955
//  end
//  else
//  begin
//    gbxOpcoes.Height := 148;
//    dbchkConstaFolha.Top := 31;
//    dbchkObrigaFavorecido.Top := 73;
////    dbchkEspecial.Top := 112;
//    dbchkEspecialFP.Top := 112; //Marilza Colpani - SOL 126964/KTN 668955
//  end;
  // Fim - Alterado por FHBS

  SeuCodigo := '';
  Sel(true, -1);

  CdsRegra.Data := CtrlListTerceirosRH.ListRegras;
  CdsRubCLT.Data := CtrlRubCLT.ListGeral;
  CdsInforme.Data := CtrlListTerceirosRH.ListInforme;
  CdsRubIncid.Data := CtrlProvDesc.ListRubricasRH;
  CdsNaturOper.Data := CtrlListTerceirosRH.ListNaturezaOperacao;
  CdsSituacao.Data := CtrlSitFunc.ListGeral(0, 'F', 'R,G', '');

  // inicio - edilaine - SOL 191668 / KTN 1820235
  cdsMotivo.Data := CtrlMotivo.ListGeral(0, 0, 'F');

  // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
  //Início - William Santana - SOL 29874/16590 PPM 544597
  CdsRubPrevSoc.data    := CtrlInctributXRubrica.ListInctributXRubrica('CodIncCP');
  CdsRubFGTS.data       := CtrlInctributXRubrica.ListInctributXRubrica('CodIncFGTS');
  CdsRubIRFF.data       := CtrlInctributXRubrica.ListInctributXRubrica('CodIncIRRF');
  //CdsRubContrbSind.data := CtrlInctributXRubrica.ListInctributXRubrica('CodIncSIND'); //Everson Cunha - SIG38475
  //Término - William Santana - SOL 29874/16590 PPM 544597
  // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875
  {dbrgFeriasChange(Sender);
  dbrg13Change(Sender);
  dbrgRescisaoChange(Sender);
  dbrgrpFLGCEDIDOSChange(Sender); //MONICA GONZAGA SOL154980
  dbrgrpFLGBENEFICIOSChange(Sender);//MONICA GONZAGA SOL154980
  }// fim - edilaine - SOL 191668 / KTN 1820235

  MontaSelect.Filtro.Add('(RUBRICAXPESS.IDRUBRICA IS NULL OR RUBRICAXPESS.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) + ')');

  // Alterado por FHBS - SOL: 141270 KTN: 890829
  MontaSelectED.Filtro.Add('(RUBRICAXPESS.IDRUBRICA IS NULL OR RUBRICAXPESS.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) + ')');
  // Fim - Alterado por FHBS

  pgctrlDetalhe.ActivePageIndex := 0;
  dbgrdDet.BringToFront;
  dbgrdIncidDeOutRub.BringToFront;
  dbgrdIncidAfast.BringToFront;
  dbgrdEvento.BringToFront;      // edilaine - SOL 191668 / KTN 1820235
  //Cássio Rovaroto - SIG nº 38475.59579
  //gbxTipoRubChange(Sender);
end;

procedure TfrmCadProvDesc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlSitFunc);
  FreeAndNil(CtrlRubCLT);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlMotivo);  // edilaine - SOL 191668 / KTN 1820235

  // Felipe A. Santos SOL 229874.16590 PPM 544597 - Início
  FreeAndNil(lCodigoDescRubIncTribut);
  FreeAndNil(CtrlInctributXRubrica);
  // Felipe A. Santos SOL 229874.16590 PPM 544597 - fim
  inherited;
end;

procedure TfrmCadProvDesc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    SeuCodigo := MontaSelect.ValoresChave[1];
    Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));
  end;
end;

procedure TfrmCadProvDesc.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao = opInserir) then
    Sel(false, Cds.FieldByName('IDPROVENTO').asFloat);
  // Alterado por FHBS - SOL: 141270 KTN: 890829
end;

procedure TfrmCadProvDesc.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    CdsRubxRubEm.FieldByName('INDPERIODO').asInteger := 0
  else
  if (pgctrlDetalhe.ActivePage = tbsIncidDeOutRub) then
    CdsRubxRubDe.FieldByName('INDPERIODO').asInteger := 0;

end;

procedure TfrmCadProvDesc.CmeDetalheDelete(Sender: TObject);
begin
  if (MsgDlg('Deseja realmente apagar este registro?', 'Aviso', mtWarning,
      [mbYes,mbNo], 0) = mrYes) then
    inherited;
end;

procedure TfrmCadProvDesc.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadProvDesc.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadProvDesc.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadProvDesc.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadProvDesc.dsStateChange(Sender: TObject);
begin
  inherited;
  tbsIncidEv.Enabled := (Cds.State in [dsInsert, dsEdit]);
  bbtnCopiarRub.Enabled := (Cds.State = dsBrowse) and not(Cds.IsEmpty);
  if (Cds.State in [dsInsert, dsEdit]) and (dbedDescr.CanFocus) then
    dbedDescr.SetFocus;
end;

procedure TfrmCadProvDesc.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  Sel(false, -1);
  // inicio - edilaine - SOL 191668 / KTN 1820235
  {Cds.FieldByName('FLGSALFAMILIA').asInteger := 1;
  Cds.FieldByName('FLGFERIAS').asInteger := 0;
  Cds.FieldByName('FLGDECIMOTERCEIRO').asInteger := 0;
  Cds.FieldByName('FLGRESCISAO').asInteger := 0;
  }// fim - edilaine - SOL 191668 / KTN 1820235

  Cds.FieldByName('FLGTPRUBRICA').asString := 'F';
  // Alterado por FHBS - SOL: 141270 KTN: 890829
  Cds.FieldByName('FLGDEBCONTA').asInteger := 0;
  Cds.FieldByName('FLGEXCESSODEB').asInteger := 0;
  // Fim - Alterado por FHBS

  // inicio - edilaine - SOL 191668 / KTN 1820235
  //MONICA GONZAGA SOL154980 - inicio
  {Cds.FieldByName('FLGCEDIDOS').asInteger := 0;
  Cds.FieldByName('FLGBENEFICIOS').asInteger := 0;
  //MONICA GONZAG SOL154980 - FIM
  }// fim - edilaine - SOL 191668 / KTN 1820235

  // FELIPE AZEVEDO DOS SANTOS SOL 177438 KTN 1635220
  Cds.FieldByName('FLGEMPRESTIMOFINAN').AsInteger := 0;

  // Andre Imakawa - SIG 34125
  Cds.FieldByName('FLGRATEARPORDEPENDENTE').AsString := 'S';
end;

procedure TfrmCadProvDesc.CdsRubxRubEmAfterInsert(DataSet: TDataSet);
begin
  CdsRubxRubEm.FieldByName('FLGBASECALC').asInteger := 0;
  CdsRubxRubEm.FieldByName('FLGTIPOFOLHA').asInteger := 0;
  CdsRubxRubEm.FieldByName('INDPERIODO').asInteger := 0;
  CdsRubxRubEm.FieldByName('FLGACAOINCIDE').asInteger := 0;
end;

procedure TfrmCadProvDesc.CdsRubxRubDeAfterInsert(DataSet: TDataSet);
begin
  CdsRubxRubDe.FieldByName('FLGBASECALC').asInteger := 0;
  CdsRubxRubDe.FieldByName('FLGTIPOFOLHA').asInteger := 0;
  CdsRubxRubDe.FieldByName('INDPERIODO').asInteger := 0;
  CdsRubxRubDe.FieldByName('FLGACAOINCIDE').asInteger := 0;
end;

procedure TfrmCadProvDesc.CdsRubSitAfterInsert(DataSet: TDataSet);
begin
  CdsRubSit.FieldByName('IDPROVENTO').asFloat := Cds.FieldByName('IDPROVENTO').asFloat;
end;

procedure TfrmCadProvDesc.dsRubxRubEmStateChange(Sender: TObject);
begin
  if (dsRubxRubEm.State in [dsInsert,dsEdit]) then
    dbclkcmbRubIncid1.SetFocus;
end;

procedure TfrmCadProvDesc.dsRubxRubDeStateChange(Sender: TObject);
begin
  if (dsRubxRubDe.State in [dsInsert,dsEdit]) then
    dbclkcmbRubIncid2.SetFocus;
end;

procedure TfrmCadProvDesc.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (dsDet.State in [dsInsert,dsEdit]) then
    dblcSitFunc.SetFocus;
end;

procedure TfrmCadProvDesc.dbclkcmbRubIncid1CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  CdsRubxRubEm.FieldByName('DESCRICAO').asString := dbclkcmbRubIncid1.Text;
end;

procedure TfrmCadProvDesc.dbclkcmbRubIncid2CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  CdsRubxRubDe.FieldByName('DESCRICAO').asString := dbclkcmbRubIncid2.Text;
end;

procedure TfrmCadProvDesc.dblcSitFuncCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  CdsRubSit.FieldByName('DESCRICAO').asString := dblcSitFunc.Text;
end;

procedure TfrmCadProvDesc.bbtnCopiarRubClick(Sender: TObject);
begin
  if (CtrlProvDesc.CopiarRubrica) then
    MsgDlg(CtrlProvDesc.MessageInfo, 'Aviso', mtWarning, [mbOk,mbHelp], 0)
  else
    raise Exception.Create(CtrlProvDesc.MessageInfo);
end;

procedure TfrmCadProvDesc.bbtnOkDetClick(Sender: TObject);
begin
  if (VerificaCamposChave) then
    inherited;
end;

procedure TfrmCadProvDesc.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
  OldSeuCodigo: string;
begin
  // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
  //if (VerificaCamposChave) and
  if (VerificaCamposeSocial) then // Felipe A. Santos SOL 229874.16590 PPM 544597
  // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if (bInserindo) then
    begin
      OldSeuCodigo := SeuCodigo;
      SeuCodigo := '';
    end;
    Sel(true, Cds.FIeldByName('IDPROVENTO').asFloat);
    if (bInserindo) then
      SeuCodigo := OldSeuCodigo;
  end;
 
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmCadProvDesc.Sel(SelPrincipal: boolean; IdProvento: double);
begin
  if (SelPrincipal) then
  begin
    Cds.Data := CtrlProvDesc.ListProvDesc(IdProvento);
    edSeuCod.Text := SeuCodigo;
  end;

  if (IdProvento > 0) then
    edCodInterno.Text := FloatToStr(IdProvento)
  else
    edCodInterno.Text := '';

  CdsRubSit.Data := CtrlProvDesc.ListRubXSit(IdProvento);
  CdsRubxRubEm.Data := CtrlProvDesc.ListRubricasIncidEm(IdProvento);
  CdsRubxRubDe.Data := CtrlProvDesc.ListRubricasIncidDe(IdProvento);

  // inicio - edilaine - SOL 191668 / KTN 1820235
  {iIdLinha serve para controlar o no. de Motivos inseridos e usado na verificação de duplicidade}
  cdsRubxEvento.data := CtrlProvDesc.ListRubricasIncidEvento(IdProvento);
  iIdLinha :=  CtrlProvDesc.GetNumeroLinhaRubxEvento(IdProvento);
  // fim - edilaine - SOL 191668 / KTN 1820235

  //Cássio Rovaroto - SIG nº 38475.59579
  //gbxTipoRubChange(Self);

  SeleSocial(IdProvento); //William Santana - SOL 229874/16590 PPM 544597
end;

function TfrmCadProvDesc.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := CtrlProvDesc.ExcluirProvDesc
  else
//douglas.siqueira SOL108804
  begin
  Cds.FieldByName('IDMODULO').asFloat:=21;
    Result := CtrlProvDesc.GravarProvDesc(Cds.Data, CdsRubSit.Data, CdsRubxRubEm.Data,
      CdsRubxRubDe.Data,
      CdsRubxEvento.data);   // edilaine - SOL 191668 / KTN 1820235
  end;
//douglas.siqueira SOL108804

  if not(Result) then
    raise exception.Create(CtrlProvDesc.MessageInfo);
end;

function TfrmCadProvDesc.VerificaCamposChave: boolean;
begin
  Result := false;
  // Alterado por Felipe Azevedo dos Santos SOL 177438 KTN 1635220
  if (dbchkEmprestimoFinan.Checked) and (not dbchkExcessoDeb.Checked) then
  begin
       MsgDlg('Informe a Rubrica Excesso de Débito.', 'Aviso', mtWarning,
      [mbOK,mbHelp], 0);
      dbchkExcessoDeb.SetFocus;
  end
  else
  // Alterado por FHBS - SOL: 141270 KTN: 890829
  if (dbchkExcessoDeb.Checked) and (Trim(dblkcmbIdProventoExcessoDeb.Text) = '') then
  begin
    MsgDlg('Informe a Rubrica Excesso de Débito.', 'Aviso', mtWarning,
      [mbOK,mbHelp], 0);
    btnSelecionaProventoED.SetFocus;
  end
  else
  // Fim - Alterado por FHBS
  if (pgctrlDetalhe.ActivePage = tbsDet) and (Trim(dbclkcmbRubIncid1.Text) = '') then
  begin
    MsgDlg('Informe a Rubrica em que incide esta rubrica.', 'Aviso', mtWarning,
      [mbOK,mbHelp], 0);
    dbclkcmbRubIncid1.SetFocus;
  end
  else
  if (pgctrlDetalhe.ActivePage = tbsIncidDeOutRub) and (Trim(dbclkcmbRubIncid2.Text) = '') then
  begin
    MsgDlg('Informe a Rubrica que incide nesta rubrica.', 'Aviso', mtWarning,
      [mbOK,mbHelp], 0);
    dbclkcmbRubIncid2.SetFocus;
  end
  else
  if (pgctrlDetalhe.ActivePage = tbsIncidAfast) and (Trim(dblcSitFunc.Text) = '') then
  begin
    MsgDlg('Informe a situação.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
    dblcSitFunc.SetFocus;
  end
  else
  // inicio - edilaine - SOL 191668 / KTN 1820235
  if (pgctrlDetalhe.ActivePage = tbsIncidEv) and (cdsRubxEvento.State in [dsInsert,dsEdit]) and (Trim(dblkMotivo.text) = '') then
  begin
    MsgDlg('Informe o Tipo de Folha.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
    dblkMotivo.SetFocus;
  end
  else
  if (pgctrlDetalhe.ActivePage = tbsIncidEv) and (cdsRubxEvento.State in [dsInsert,dsEdit]) and (VerificaDuplicidadeMotivo) then
  begin
    MsgDlg('O Tipo de Folha selecionada já foi cadastrado para essa rubrica.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
    dblkMotivo.SetFocus;
  end
  // fim - edilaine - SOL 191668 / KTN 1820235
  else
   if (trim(dblkCodesocial.Text) = '') then  // edilaine SOL 229353/16212 / PPM 434575 - inicio
  begin
    MsgDlg('Informe o código eSocial.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
    dblkCodesocial.SetFocus;
  end
  else // edilaine SOL 229353/16212 / PPM 434575 - fim

    Result := true;
end;

//Cássio Rovaroto - SIG nº 38475.59579 - Início
{procedure TfrmCadProvDesc.gbxTipoRubChange(Sender: TObject);
begin
  inherited;

  dbEdPrioridadeDesc.Enabled := gbxTipoRub.ItemIndex = 1;
end;}
//Cássio Rovaroto - SIG nº 38475.59579 - Fim

procedure TfrmCadProvDesc.dbchkExcessoDebClick(Sender: TObject);
begin
  inherited;
  // Alterado por FHBS - SOL: 141270 KTN: 890829
  dbchkDebConta.Enabled := dbchkExcessoDeb.Checked;

  pnlIdProventoExcessoDeb.Enabled := dbchkExcessoDeb.Checked;
  lblIdProventoExcessoDeb.Enabled := dbchkExcessoDeb.Checked;
  dblkcmbIdProventoExcessoDeb.Enabled := dbchkExcessoDeb.Checked;
  btnSelecionaProventoED.Enabled := dbchkExcessoDeb.Checked;
  btnLimpaProventoED.Enabled := dbchkExcessoDeb.Checked;
  
  if (Cds.State in [dsInsert, dsEdit]) then
  begin
    if not(dbchkExcessoDeb.Checked) then
    begin
      Cds.FieldByName('FLGDEBCONTA').AsInteger := 0;
      btnLimpaProventoEDClick(btnLimpaProventoED);
    end;
  end;
  // Fim - Alterado por FHBS
end;

procedure TfrmCadProvDesc.btnSelecionaProventoEDClick(Sender: TObject);
begin
  inherited;
  MontaSelectED.Executar;
  if (MontaSelectED.RetornouValor) then
  begin
    if StrToInt(MontaSelectED.ValoresChave[0]) = Cds.FieldByName('IDPROVENTO').AsInteger then
      MsgDlg('A Rubrica Excesso de Débito não pode ser referenciada para ela mesma.', 'Aviso', mtWarning, [mbOK,mbHelp], 0)
    else
      Cds.FieldByName('IDPROVENTOEXCESSODEB').AsInteger := StrToInt(MontaSelectED.ValoresChave[0]);
  end;
end;

procedure TfrmCadProvDesc.btnLimpaProventoEDClick(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('IDPROVENTOEXCESSODEB').Clear;
end;


procedure TfrmCadProvDesc.dbchkEmprestimoFinanClick(Sender: TObject);
begin
  //inherited;

  if (cds.State in [dsEdit, dsInsert]) then
  begin
       if (dbchkEmprestimoFinan.Checked) then
       begin
            cds.FieldByName('FLGEMPRESTIMOFINAN').AsInteger := 1;
       end
       else
       begin
            cds.FieldByName('FLGEMPRESTIMOFINAN').AsInteger := 0;
       end;
  end;
end;

// Inicio - edilaine - SOL 191668 / KTN 1820235
function TfrmCadProvDesc.VerificaDuplicidadeMotivo: boolean;
var
  _cdsAux : TCMClientDataSet;
begin
  try
    _cdsAux := TCMClientDataSet.Create(nil);
    _cdsAux.CloneCursor(cdsRubxEvento, false, true);

    if (dsRubxEvento.State in [dsInsert]) then
       result := _cdsAux.Locate('IDPROVENTO;IDMOTIVO', VarArrayOf([Cds.FieldByName('IDPROVENTO').asFloat, cdsRubxEvento.FieldByName('IDMOTIVO').AsInteger]), [loCaseInsensitive])
    else
    begin
      // na alteração verificar se o item localizado não é o próprio registro que está sendo alterado
      result := false;
      while not _cdsAux.eof do
      begin
        if (_cdsAux.FieldByName('IDPROVENTO').AsFloat = Cds.FieldByName('IDPROVENTO').asFloat) and
           (_cdsAux.FieldByName('IDMOTIVO').AsInteger = cdsRubxEvento.FieldByName('IDMOTIVO').AsInteger) and
           (_cdsAux.FieldByName('LINHA').AsInteger <> cdsRubxEvento.FieldByName('LINHA').AsInteger) then
        begin
          Result := true;
          break;
        end;
        _cdsAux.next;
      end;
    end;

  finally
    FreeAndNil(_cdsAux);
  end;
end;

procedure TfrmCadProvDesc.dsRubxEventoStateChange(Sender: TObject);
begin
  inherited;
  if (dsRubxEvento.State in [dsEdit]) then
     dblkMotivo.SetFocus;
end;

procedure TfrmCadProvDesc.cdsRubxEventoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  inc(iIdLinha);
  cdsRubxEvento.FieldbyName('linha').AsInteger       := iIdLinha;
  cdsRubxEvento.FieldByName('IDPROVENTO').AsFloat    := Cds.FieldByName('IDPROVENTO').asFloat;
  cdsRubxEvento.FieldByName('IDMOTIVO').AsInteger    := 0;
  cdsRubxEvento.FieldByName('IDREGRACALC').AsInteger := 0;
  dblkMotivo.SetFocus;
end;

procedure TfrmCadProvDesc.dblcRegraCalcCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsRubxEvento.FieldByName('REGRA').AsString := dblcRegraCalc.Text;
end;

procedure TfrmCadProvDesc.dblkMotivoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsRubxEvento.FieldByName('MOTIVO').AsString := dblkMotivo.Text;
end;
// fim - edilaine - SOL 191668 / KTN 1820235

// Higor SOL 229353-16212 / PPM 434575
procedure TfrmCadProvDesc.BitBtn1Click(Sender: TObject);
begin
  inherited;
  MontaSelectNaturezaRub.Executar;
  if (MontaSelectNaturezaRub.RetornouValor) then
  begin
      Cds.FieldByName('CODNATESOCIAL').AsInteger := StrToInt(MontaSelectNaturezaRub.ValoresChave[0]);
      Cds.FieldByName('NOME_NAT').AsString := MontaSelectNaturezaRub.ValoresChave[1];
      Cds.FieldByName('IDRUBRICAXESOCIAL').AsString := MontaSelectNaturezaRub.ValoresChave[2];
  end;
end;

// Felipe A. Santos - SOL 229874.16590 PPM 544597 - início
procedure TfrmCadProvDesc.bbtnCancelarClick(Sender: TObject);
begin
  if (cds.State = dsInsert) then
     LimparCamposeSocial;

  inherited;
  LiberaCamposeSocial(False); 
end;

function TfrmCadProvDesc.VerificaCamposeSocial: boolean;
begin
  Result := False;
  // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
  //Início - William Santana - SOL 229874.16590 PPM 544597
  if (cbbDescRubPrevSoc.Value = EmptyStr) then
  begin
    MsgDlg('Selecione a descrição da rubrica que incide Para Previdência Social.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    tbcDetalhe.TabIndex := 4;
    tbcDetalheChange(Self);
    cbbDescRubPrevSoc.SetFocus;
    cbbDescRubPrevSoc.DropDown; //Everson Cunha - SIG61905
  end
  else if (cbbDescRubIRFF.Value = EmptyStr) then
  begin
    MsgDlg('Selecione a descrição da rubrica que incide Para o IRRF.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    tbcDetalhe.TabIndex := 4;
    tbcDetalheChange(Self);
    cbbDescRubIRFF.SetFocus;
    cbbDescRubIRFF.DropDown;  //Everson Cunha - SIG61905
  end
  else if (cbbDescRubFGTS.Value = EmptyStr) then
  begin
    MsgDlg('Selecione a descrição da rubrica que incide Para o FGTS.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    tbcDetalhe.TabIndex := 4;
    tbcDetalheChange(Self);
    cbbDescRubFGTS.SetFocus;
    cbbDescRubFGTS.DropDown; //Everson Cunha - SIG61905
  end
  //Everson Cunha - SIG38475 - Ini
  {else if (cbbDescRubContrSind.Value = EmptyStr) then
  begin
    MsgDlg('Selecione a descrição da rubrica que incide Para Contribuição RPPS.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    tbcDetalhe.TabIndex := 4;
    tbcDetalheChange(Self);
    cbbDescRubContrRPPS.SetFocus;
    cbbDescRubContrRPPS.DropDown; //Everson Cunha - SIG61905
  end}
  //Everson Cunha - SIG38475 - Fim
  //Término - William Santana - SOL 229874.16590 PPM 544597
  // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875
  {Essas mensagens foram removidas da especificação (padrão Não)
  Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
  else if (not(rbDescansoSim.Checked) and not(rbDescansoNao.Checked)) then
  begin
    MsgDlg('Informe se rubrica repercute no Descanso Semanal Remunerado.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    tbcDetalhe.TabIndex := 4;
    tbcDetalheChange(Self);
    rbDescansoSim.SetFocus;
  end
  else if (not(rbDesTercSim.Checked) and not(rbDesTercNao.Checked)) then
  begin
    MsgDlg('Informe se a rubrica repercute no 13º Salário.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    tbcDetalhe.TabIndex := 4;
    tbcDetalheChange(Self);
    rbDesTercSim.SetFocus;
  end
  else if (not(rbFeriasSim.Checked) and not(rbFeriasNao.Checked)) then
  begin
    MsgDlg('Informe se a rubrica repercute nas Férias.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    tbcDetalhe.TabIndex := 4;
    tbcDetalheChange(Self);
    rbFeriasSim.SetFocus;
  end
  else if (not(rbRescisaoSim.Checked) and not(rbRescisaoNao.Checked)) then
  begin
    MsgDlg('Informe se a rubrica repercute na Rescisão.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    tbcDetalhe.TabIndex := 4;
    tbcDetalheChange(Self);
    rbRescisaoSim.SetFocus;
  end
  Término - Michelle Mota - SOL 229874.16590 - PPM 1203875}


  // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
  //else if (edtNaturezaRubrica.Text = '') then //Everson Cunha - SIG61905
  else if (gbxTipoRub.ItemIndex <> 2) and (edtNaturezaRubrica.Text = '') then //Everson Cunha - SIG61905
  begin
    MsgDlg('Informe a Natureza da Rubrica.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    //tbcDetalhe.TabIndex := 4; //Everson Cunha - SIG61905
    //tbcDetalheChange(Self);   //Everson Cunha - SIG61905
    edtNaturezaRubrica.SetFocus;
  end
  // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875

  //Everson Cunha - SIG61905 - Início
  else
  if (gbxTipoRub.ItemIndex = 2) and (edtNaturezaRubrica.Text = '') then
  begin
    MsgDlg('Preencha o campo Natureza da Rubrica caso necessite enviar ao ambiente do eSocial', 'Informação', mtInformation, [mbOk], iHelp);
    Result := True;
  end
  //Everson Cunha - SIG61905 - Fim

  else
  begin
       Result := True;
  end;
end;

procedure TfrmCadProvDesc.ClickProcurarNumProc(Sender: TObject);
var
   sTipo, sExtensao : string;
begin
   msProcessos.Executar;
   // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
   if (msProcessos.RetornouValor) then
   begin
     if (msProcessos.ValoresChave[1]) = 'A' then
        sTipo := 'Administrativo'
     else
        sTipo := 'Judicial';

     if TButton(Sender).Tag = 0 then // Previdência Social
     begin
          if (StrToInt(msProcessos.ValoresChave[2]) = 1) then
             sExtensao := 'Contrib. Patronais'
          else
             sExtensao := 'Contrib. Patronais + Segurados';

          CdsProcessosRub.Edit;
          CdsProcessosRub.FieldByName('NUMPROCP').AsString := msProcessos.ValoresChave[0];
          CdsProcessosRub.FieldByName('TIPOPROCP').AsString := sTipo;
          CdsProcessosRub.FieldByName('EXTENDECISAO').AsString := sExtensao;
          CdsProcessosRub.Post;

          cds.FieldByName('IDPROCESSOCP').AsInteger := StrToInt(msProcessos.ValoresChave[3]);
     end
     else if TButton(Sender).Tag = 1 then // IRRF
     begin
          CdsProcessosRub.Edit;
          CdsProcessosRub.FieldByName('NUMPROIR').AsString := msProcessos.ValoresChave[0];
          CdsProcessosRub.FieldByName('TIPOPROIR').AsString := sTipo;
          CdsProcessosRub.Post;

          cds.FieldByName('IDPROCESSOIR').AsInteger := StrToInt(msProcessos.ValoresChave[3]);
     end
     else if TButton(Sender).Tag = 2 then // FGTS
     begin
          CdsProcessosRub.Edit;
          CdsProcessosRub.FieldByName('NUMPROFGTS').AsString := msProcessos.ValoresChave[0];
          CdsProcessosRub.FieldByName('TIPOPROFGTS').AsString := sTipo;
          CdsProcessosRub.Post;

          cds.FieldByName('IDPROCESSOFGTS').AsInteger := StrToInt(msProcessos.ValoresChave[3]);
     //Everson Cunha - SIG38475 - Ini
     {
     end
     else if TButton(Sender).Tag = 3 then // Contribuição Sindical
     begin
          CdsProcessosRub.Edit;
          CdsProcessosRub.FieldByName('NUMPROCS').AsString := msProcessos.ValoresChave[0];
          CdsProcessosRub.FieldByName('TIPOPROCS').AsString := sTipo;
          CdsProcessosRub.Post;

          cds.FieldByName('IDPROCESSOCS').AsInteger := StrToInt(msProcessos.ValoresChave[3]);}
     //Everson Cunha - SIG38475 - Fim
     end;
   end;
   // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875
end;

procedure TfrmCadProvDesc.LiberaCamposeSocial(pLibera : boolean);
begin

  //Início - William Santana - SOL 229874.16590 PPM 544597

  //Cássio Rovaroto - SIG 38475.59579
  //grbIndicarRub.Enabled := pLibera;

  lblDescRubPrevSoc.Enabled := pLibera;
  cbbDescRubPrevSoc.Enabled := pLibera;
  lblDescRubFGTS.Enabled := pLibera;
  cbbDescRubFGTS.Enabled := pLibera;
  lblDescRubIRFF.Enabled := pLibera;
  cbbDescRubIRFF.Enabled := pLibera;
  //lblDescRubContrSind.Enabled := pLibera; //Everson Cunha - SIG38475
  //cbbDescRubContrSind.Enabled := pLibera; //Everson Cunha - SIG38475
  //Término - - William Santana - SOL 229874.16590 PPM 544597
  lblNumProCP.Enabled := pLibera;
  dbedtNumProCP.Enabled := pLibera;
  lblNumProIR.Enabled := pLibera;
  dbedtNumProIR.Enabled := pLibera;
  lblNumProFGTS.Enabled := pLibera;
  dbedtNumProFGTS.Enabled := pLibera;
  //lblNumProCS.Enabled := pLibera;   //Everson Cunha - SIG38475
  //dbedtNumProCS.Enabled := pLibera; //Everson Cunha - SIG38475
  btnProcCP.Enabled := pLibera;
  btnProcIR.Enabled := pLibera;
  btnProcFGTS.Enabled := pLibera;
  //btnProcCS.Enabled := pLibera;  //Everson Cunha - SIG38475
  grbCodIncTribRub.Enabled := pLibera;
  //Cássio Rovaroto - SIG 38475.59579
  //grbIndicarRub.Enabled := pLibera;

end;

procedure TfrmCadProvDesc.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  LiberaCamposeSocial(True);
  LimparCamposeSocial;      
end;

procedure TfrmCadProvDesc.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  LiberaCamposeSocial(True);
end;

procedure TfrmCadProvDesc.LimparCamposeSocial;
begin
  // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
  CdsProcessosRub.Data := CtrlProvDesc.ListProcessosRubrica(-1);

  dbrgrpQtdRefApur.ItemIndex := 0;
  dbrgrpQtdRefApur.DataSource := ds;
  dbrgrpQtdRefApur.DataField := 'QTDREFAPUR';

  //Cássio Rovaroto - SIG nº 38475.59579 - Início
  //Cds.FieldByName('INCIDEDESCSEMANREMUN').AsString := 'N';
  //Cds.FieldByName('INCIDE13SAL').AsString := 'N';
  //Cds.FieldByName('INCIDEFERIAS').AsString := 'N';
  //Cds.FieldByName('INCIDEAVISOPREVIO').AsString := 'N';
  //Cássio Rovaroto - SIG nº 38475.59579 - Fim
  Cds.FieldByName('QTDREFAPUR').AsString := 'M';
  // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875
end;

procedure TfrmCadProvDesc.SeleSocial(IdProvento: double);
begin
  // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
  CdsProcessosRub.Data := CtrlProvDesc.ListProcessosRubrica(IdProvento);
  LiberaCamposeSocial(False);
  // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875
end;
// Felipe A. Santos SOL 229874.16590 PPM 544597 - fim

procedure TfrmCadProvDesc.NumProCPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875

  if (Key = VK_DELETE) then
    begin
         if TButton(Sender).Tag = 0 then // Previdência Social
         begin
             CdsProcessosRub.Edit;
             CdsProcessosRub.FieldByName('NUMPROCP').value := null;
             CdsProcessosRub.FieldByName('TIPOPROCP').value := null;
             CdsProcessosRub.FieldByName('EXTENDECISAO').value := null;
             CdsProcessosRub.Post;

             cds.FieldByName('IDPROCESSOCP').Value := null;

             Texto := '';
         end
         else if TButton(Sender).Tag = 1 then // IRRF
         begin
              CdsProcessosRub.Edit;
              CdsProcessosRub.FieldByName('NUMPROIR').value := null;
              CdsProcessosRub.FieldByName('TIPOPROIR').value := null;
              CdsProcessosRub.Post;

              cds.FieldByName('IDPROCESSOIR').Value := null;
              Texto := '';
         end
         else if TButton(Sender).Tag = 2 then // FGTS
         begin
              CdsProcessosRub.Edit;
              CdsProcessosRub.FieldByName('NUMPROFGTS').value := null;
              CdsProcessosRub.FieldByName('TIPOPROFGTS').value := null;
              CdsProcessosRub.Post;

              cds.FieldByName('IDPROCESSOFGTS').Value := null;
              Texto := '';
         //Everson Cunha - SIG38475 - Ini
         {
         end
         else if TButton(Sender).Tag = 3 then // Contribuição Sindical
         begin
              CdsProcessosRub.Edit;
              CdsProcessosRub.FieldByName('NUMPROCS').value := null;
              CdsProcessosRub.FieldByName('TIPOPROCS').value := null;
              CdsProcessosRub.Post;

              cds.FieldByName('IDPROCESSOCS').Value := null;
              Texto := '';}
         //Everson Cunha - SIG38475 - Fim
         end;
    end
    else
      begin
        Texto := dbedtNumProCP.Text;
      end;
  // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875
end;

procedure TfrmCadProvDesc.dbedtNumProCPKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
  if Texto <> '' then
    dbedtNumProCP.Text := Texto;
  // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875
end;

// Andre Imakawa - SIG 34125 - Inicio
procedure TfrmCadProvDesc.dbchkFLGRATEARPORDEPENDENTEClick(
  Sender: TObject);
begin
  //inherited;

  if (cds.State in [dsEdit, dsInsert]) then
  begin
       if (dbchkFLGRATEARPORDEPENDENTE.Checked) then
       begin
            cds.FieldByName('FLGRATEARPORDEPENDENTE').AsString := 'S';
       end
       else
       begin
            cds.FieldByName('FLGRATEARPORDEPENDENTE').AsString := 'N';
       end;
  end;

end;
// Andre Imakawa - SIG 34125 - Fim

procedure TfrmCadProvDesc.btnLimpaNaturezaRubricaClick(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('CODNATESOCIAL').Clear;
  Cds.FieldByName('NOME_NAT').Clear;
  Cds.FieldByName('IDRUBRICAXESOCIAL').Clear;
end;

end.
