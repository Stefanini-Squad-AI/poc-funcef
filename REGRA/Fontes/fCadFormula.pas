//******************************************************************************
// SISTEMA : REGRA (REGRAS DE NEGÓCIO)
// Alexandre Ramos - 29/11/00
//   Alteracoes no LayOut do Formulário.
{ ---------------------------------------------------------------------------- }
{ FUNCOES NOVAS DESENVOLVIDAS POR CAMILLE M. VIANA NA FUNCEF                   }
{ ---------------------------------------------------------------------------- }
// *** FUNCOES DO GRUPO EVOLUCAO FUNCIONAL
//     ADICIONALDIA          // CAMILLE - 29.08.2001
//     ADICIONALMES          // CAMILLE - 29.08.2001
//     BUSCAPCS              // CAMILLE - 29.08.2001
//     BUSCAFUNCAOADICCOMP   // CAMILLE - 09.10.2001 
//     VALORCF               // CAMILLE - 29.08.2001
//     CFPESSOA              // CAMILLE - 29.08.2001
//     GRUPOPESSOA           // CAMILLE - 29.08.2001
//     NIVELPESSOA           // CAMILLE - 29.08.2001
//     NUMDIASADICIONAL      // CAMILLE - 29.08.2001
//     NUMDIASPERCADICIONAL  // CAMILLE - 29.08.2001
//     PERCENTUALFUNCAO      // CAMILLE - 29.08.2001
//     TOTALCFMES            // CAMILLE - 29.08.2001
//     VERFUNCAOPCC          // CAMILLE - 29.08.2001
//     MAIORCF               // CAMILLE - 29.08.2001
// *** FUNCOES DE OUTROS GRUPOS
//     REAJUSTAINSS          // CAMILLE - 16.05.2001
//     FREQSALARIO           // CAMILLE - 16.05.2001
//     CONVERTEDATA          // CAMILLE - 21.06.2001
//     CPASSIST              // CAMILLE - 29.08.2001
{ ---------------------------------------------------------------------------- }
{ FIM FUNCOES NOVAS DESENVOLVIDAS PELA CAMILLE                                 }
{ ---------------------------------------------------------------------------- }

unit fCadFormula;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, dialogs,
  FCadastro, StdCtrls, Db, DBTables, Wwtable, cmseldlg, wwidlg, Wwdatsrc,
  DBCtrls, MAHlpBtn, Buttons, ComCtrls, ToolWin, ExtCtrls, Mask,
  wwdbedit, Grids, Wwdbigrd, Wwdbgrid, Wwquery, UMensErro, UDataBase,
  wwdblook, TB97, MontaSelect, OleCtrls, vcf1,printers, uglobal, TB97Ctls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, FCadastroCS, URegra,
  fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, fcOutlookBar, CMProcura, CmEventosCadastro, ImgList;

type

  TfrmCadFormulas = class(TfrmCadastroCS)

    dsGrupo: TwwDataSource;
    QryGrupo: TwwQuery;
    QryAux: TwwQuery;
    ImageList1: TImageList;
    Panel4: TPanel;
    Panel5: TPanel;
    fcOpcoes: TfcOutlookBar;
    fcNumeros: TfcShapeBtn;
    fcFormulas: TfcShapeBtn;
    fcData: TfcShapeBtn;
    fcLstNumeros: TfcOutlookList;
    fcOutlookBar1OutlookList2: TfcOutlookList;
    fcOutlookBar1OutlookList3: TfcOutlookList;
    pnlTeclas: TPanel;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    memDesc: TMemo;
    Panel2: TPanel;
    lblFormula: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    sbtncampos: TSpeedButton;
    Label3: TLabel;
    DBEdtDescrcao: TwwDBEdit;
    dblckcombogrupo: TwwDBLookupCombo;
    dedMemo: TwwDBEdit;
    Panel3: TPanel;
    BitBtn21: TBitBtn;
    btnApagarUltimo: TBitBtn;
    fcOutlookBar1OutlookList4: TfcOutlookList;
    fcINSS: TfcShapeBtn;
    fcOutlookBar1OutlookList5: TfcOutlookList;
    fcSalarios: TfcShapeBtn;
    fcOutlookBar1OutlookList6: TfcOutlookList;
    fcMatematicas: TfcShapeBtn;
    fcOutlookBar1OutlookList7: TfcOutlookList;
    fcTabGenericaLonga: TfcShapeBtn;
    fcOpcoesOutlookList1: TfcOutlookList;
    fcCargoseFuncoes: TfcShapeBtn;
    fcOpcoesOutlookList3: TfcOutlookList;
    fcHistoricoRubricas: TfcShapeBtn;
    fcOpcoesOutlookList4: TfcOutlookList;
    fcContagemTempos: TfcShapeBtn;
    DBEdtIDFormula: TwwDBEdit;
    Label1: TLabel;
    fcOpcoesOutlookList2: TfcOutlookList;
    OpInvestimento: TfcShapeBtn;
    Regra1: TRegra;
    Toolbar972: TToolbar97;
    sbtnCopiar: TToolbarButton97;
    procedure sbtnInserirClick(Sender: TObject);
    procedure btnApagarUltimoClick(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure sbtncamposClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    function  tiraTodosBrancos(Value: String): String;
    procedure DBEdtIDFormulaChange(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure fcOutlookBar1OutlookList1Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items5Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items6Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items7Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items8Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    
    procedure fcOutlookBar1OutlookList2Items7Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items8Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items9Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items11Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items16Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items29Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items30Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items33Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items34Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items35Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items5Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items6Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items7Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items8Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items9Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items10Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items11Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items12Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items13Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList4Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList4Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList4Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList4Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList4Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items5Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items6Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items7Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items8Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items9Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items10Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList6Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList6Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList6Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList6Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList6Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList7Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList7Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure FormCreate(Sender: TObject);
    procedure fcLstNumerosItems9Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items11Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items12Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items14Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items15Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items14Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items15Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList4Items5Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items13Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcEvolFuncNIVELPESSOA(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcEvolFuncADICIONALMES(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcEvolFuncCFPESSOA(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList2Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList2Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList3Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList3Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList3Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList3Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList3Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcEvolFuncMAIORCF(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items17Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    function PosCharEsp(Dado : String) : LongInt;
    procedure fcOpcoesOutlookList4Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList4Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList4Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items10Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items18Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items19Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items14Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items15Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcEvolFuncTOTALCFMES(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList4Items6Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList1Items7Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcEvolFuncVERFUNCAOPCC(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items16Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcEvolFuncGRUPOPESSOA(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcEvolFuncADICIONALDIA(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcEvolFuncNUMDIASADICIONAL(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcEvolFuncVALORCF(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure fcOpcoesNUMDIASPERCADICIONAL(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesQTDEITEMMES(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcEvolFuncPERCENTUALFUNCAO(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOpcoesCPASSIST(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcEvolFuncBUSCAPCS(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items16Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items17Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcDataCONVERTEDATA(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcEvolFuncBUSCAFUNCAOADICCOMP(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList1Items14Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items20Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items18Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items19Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList1Items15Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items19Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList1Items16Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList1Items17Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items21Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items22Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList4Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList1Items18Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items23Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items24Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items25Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList4Items7Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items26Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items20Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items20Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items21Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList1Items19Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList5Items22Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList4Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items27Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure sbtnCopiarClick(Sender: TObject);
  private
    { Private declarations }
    UltCar : Char;
    ContParent   : Integer;
    bTrunc, bRound, bDifMes, bDifAno, bDifDia      : Boolean;
    procedure Sel( n : LongInt );
  public
    { Public declarations }
    function TiraPlic  (texto:string):string;
  end;

var
  frmCadFormulas: TfrmCadFormulas;

implementation

uses
  dbasedados, usistema, fAguarde,  fConsulta;

{$R *.DFM}

procedure TfrmCadFormulas.CmeCadastroFind(Sender: TObject);
begin
     inherited;
     if MontaSelect.RetornouValor then
        Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadFormulas.Sel( n : LongInt );
Begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Open;
End;


procedure TfrmCadFormulas.sbtnInserirClick(Sender: TObject);
var
  vLast : LongInt;
begin
  frmAguarde.Mostra('Verificando sequence ...');
  frmAguarde.Refresh;

  vLast := LeUltRegistro(nil,'FORMULA');
  while qry.Locate('IDFORMULA',vLast,[]) do
       vLast := LeUltRegistro(nil,'FORMULA');

  inherited;
  pnlTeclas.Enabled := True;
  qry.FieldByName('IDFORMULA').asInteger := vLast;

  frmAguarde.Apaga;
end;

procedure TfrmCadFormulas.btnApagarUltimoClick(Sender: TObject);
var
   i, Tam : LongInt;
begin
  inherited;
  memDesc.Lines.Clear;
  Tam := Length(Qry.fieldbyname('expressaoformula').AsString);
  i := PosCharEsp(Qry.fieldbyname('expressaoformula').AsString);
  if i = Tam then
     Qry.fieldbyname('expressaoformula').AsString := Copy(Qry.fieldbyname('expressaoformula').AsString,1,Tam-1)
  else
      if i = 0 then
         Qry.fieldbyname('expressaoformula').AsString := ''
      else
          Qry.fieldbyname('expressaoformula').AsString := Copy(Qry.fieldbyname('expressaoformula').AsString,1,i);
end;

procedure TfrmCadFormulas.CmeCadastroInsert(Sender: TObject);
begin
     Inherited;
     DBEdtDescrcao.SetFocus;
     sbtncampos.enabled:=true;
     pnlTeclas.Enabled := True;
     sbtncampos.enabled:=true;
end;

procedure TfrmCadFormulas.BitBtn21Click(Sender: TObject);
begin
  inherited;
  memDesc.Lines.Clear;
  ContParent := 0 ;
  bDifDia := False;
  bDifMes := False;
  bDifAno := False;
  bRound := False;
  bTrunc := False;
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := '';
end;

procedure TfrmCadFormulas.sbtncamposClick(Sender: TObject);
begin
  inherited;
  xTipoTela := 4;
  frmConsulta.Showmodal;
  if xTipo = 'V' then
     xId := '@'+ xId;
  dedMemo.Text := dedMemo.Text + xId;
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
end;

procedure TfrmCadFormulas.CmeCadastroEdit(Sender: TObject);
var
  vSql, vCod : string;
  TotRegs : LongInt;
begin
  frmAguarde.Mostra('Verificando dados ...');
  frmAguarde.Refresh;

  vCod := Qry.fieldbyname('idformula').asstring;
  with QryAux do begin
       close;
       sql.clear;
       vSql :=   'select r.idregra from regra r,algregra a where '+
                 'r.idregra=a.idregra and r.publicada=1 and '+
                 'a.formula1='+vCod;
       sql.add( vSql );
       open;
       TotRegs := RecordCount;
  end;

  if TotRegs > 0 then begin
     msgdlg('Esta fórmula está sendo usada por uma regra publicada!','Atenção',mterror,[mbok],0);
     sbtnalterar.Down:=false;
     frmAguarde.Apaga;
     bbtnCancelarClick(Self);
     Exit;
  end else begin
      inherited;
      pnlTeclas.Enabled := True;
      sbtncampos.enabled:=true;
      DBEdtDescrcao.SetFocus;
      sbtnalterar.Down:=false;
  end;
  frmAguarde.Apaga;
end;

procedure TfrmCadFormulas.CmeCadastroConfirma(Sender: TObject);
begin
  if qry.State in [dsEdit,dsInsert] then
       if (Trim(DBEdtDescrcao.Text) = '') or (dblckcombogrupo.Text = '') or (Qry.FieldbyName('EXPRESSAOFORMULA').AsString = '') then
               MsgDlg('Existem campos em branco.','Erro',mtError,[mbOK],0)
       else begin
            inherited;
       end
  else
     inherited;
end;


procedure TfrmCadFormulas.bbtnConfirmarClick(Sender: TObject);
var
  Spalavra, sformulap, sformula     : String;
  letra : string[1];
  vAux : LongInt;
begin
  if dblckcombogrupo.Text='' then begin
       MsgDlg('O Grupo não pode ficar vazio!','ATENÇÃO',mterror, [mbok],0);
       frmAguarde.Apaga;
       exit;
  end;

  frmAguarde.Mostra('Tratando dados ...');
  frmAguarde.Refresh;

  memDesc.Lines.Clear;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := False;
  sbtnAlterar.Down := False;
  sbtnInserir.Down := False;
  sbtnInserir.Enabled := True;
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled := True;
  sbtnProcurar.Enabled := True;

  If Pos('BUSCADETCALCULO',Qry.FieldbyName('EXPRESSAOFORMULA').AsString) = 0 Then
    sformula:=tiratodosbrancos(Qry.FieldbyName('EXPRESSAOFORMULA').AsString)
  Else
    sformula:=Qry.FieldbyName('EXPRESSAOFORMULA').AsString;

  spalavra:='';


  if pos('CAMPOSDESC',Qry.FieldbyName('EXPRESSAOFORMULA').AsString) =  0  then begin
    while sformula <> '' do begin
       letra:=copy(sformula,1,1);
       spalavra:=spalavra+letra;
       sFormula := copy(sFormula,2,length(sFormula)-1);
       if (pos(letra,'<>=+-*/(){}[],^')<> 0) or (sformula='') then begin
            if pos(spalavra[length(spalavra)],'<>=+-*/(){}[],^')<> 0 then
                 spalavra:=copy(spalavra,1,length(spalavra)-1);
            if trim(spalavra) <> '' then
            begin
                 if fazwwquery(QryAux,'select nomedocampo,apelido from cmpbd where UPPER(idcampo) = '''+
                    tiraplic(spalavra)+''' AND campodobanco >= 1 ') then
                 begin
                    if trim(QryAux.fieldbyname('apelido').asString) <> '' then
                      sformulaP:=sformulaP+QryAux.fieldbyname('apelido').asString
                    else
                      if sformulaP+QryAux.fieldbyname('nomedocampo').asString <> '' then
                           sformulaP:=sformulaP+QryAux.fieldbyname('nomedocampo').asString
                      else
                           sformulaP:=sformulaP+spalavra;
                 end else
                      sformulaP:=sformulaP+spalavra;
                 spalavra:='';
            end;
            if (pos(letra,'<>=+-*/(){}[],^')<> 0) then
                 sFormulaP:=sFormulaP+letra;
            letra:='';
            spalavra:='';
       end;
    end;
  end else begin
       sformulaP := sformula;
  end;

  Qry.FieldByName('EXPRESSAOREAL').asstring := sformulaP;

  frmAguarde.Mostra('Gravando formula ...');
  frmAguarde.Refresh;

  sbtncampos.enabled:=false;

  if Qry.State in [dsInsert] Then begin
     with Qry do begin
          vAux := FieldbyName('IDFORMULA').AsInteger;
          Post;
          Applyupdates;
          Close;
          ParambyName('Id').AsInteger := vAux;
          Open;
     end;
     sbtnInserir.Click;
  end else begin
      with Qry do begin
           Post;
           Applyupdates;
           Close;
           Open;
      end;
  end;

  frmAguarde.Apaga;
end;

procedure TfrmCadFormulas.sbtnApagarClick(Sender: TObject);
begin
  frmAguarde.Mostra('Verificando Dados para Exclusão');
  frmAguarde.Refresh;
  with QryAux do begin
       Close;
       Sql.Clear;
       Sql.Add(  'Select Count(*) NumFormulas From ALGREGRA A, REGRA R '+
                 'Where A.Formula1 = '+DBEdtIDFormula.Text +' or '+
                 '      A.Formula2 = '+DBEdtIDFormula.Text );
       Open;
  end;
  frmAguarde.Apaga;
  if QryAux.FieldByName('numformulas').AsInteger = 0 then begin
     if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then begin
        frmAguarde.Mostra('Apagando dados da formula');
        frmAguarde.Refresh;
        with QryAux do begin
             Close;
             Sql.Clear;
             Sql.Add(  'Delete From CMPALG Where IdFormula = '+DBEdtIDFormula.Text);
             try
                ExecSql;
             except
                   frmAguarde.Apaga;
                   MsgDlg('Existe regra utilizando esta fórmula.','Atenção',mterror,[mbOk],0);
             end;
             Close;
        end;
        qry.Delete;
        Qry.Applyupdates;
        CmeCadastro.Confirma(Self);
        frmAguarde.Apaga;
     end;
  end else
      MsgDlg('Existe regra utilizando esta formula.','Atenção',mterror,[mbOk],0);
  sbtnApagar.Down := False;
  frmAguarde.Apaga;
end;

procedure TfrmCadFormulas.bbtnCancelarClick(Sender: TObject);
begin
  frmAguarde.Mostra('Cancelando operação ...');
  frmAguarde.Refresh;
  inherited;
  sbtncampos.enabled:=false;
  frmAguarde.Apaga;
end;

function TfrmCadFormulas.tiraTodosBrancos(Value: String): String;
var
  i: Integer;
begin
  i := pos(' ',Value);
  while i <> 0 do begin
    Delete(Value,I,1);
    i := pos(' ',Value);
  end;
  Result := Value;
end;

function TfrmCadFormulas.TiraPlic(texto:string):string;
begin
    if texto[1]='''' then
       texto :=copy(texto,2,length(texto));
    if texto[length(texto)]='''' then
       texto:= copy(texto,1,length(texto)-1);
    result:=texto
end;

procedure TfrmCadFormulas.DBEdtIDFormulaChange(Sender: TObject);
begin
  inherited;
  lblFormula.Caption := 'Código da Formula : '+DBEdtIDFormula.text;
end;

procedure TfrmCadFormulas.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  dblckcombogrupo.LookupValue := Qry.FieldbyName('CODGRUPOFORMULA').AsString;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList1Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ARITM(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  ARITM(A1+A2*A3)');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList1Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + '^';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList1Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SQRT(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList1Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + ' * ';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList1Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + ' + ';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList1Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + ' - ';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList1Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + ' / ';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList1Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + '(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList1Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Dec(ContParent);
  dedMemo.Text := dedMemo.Text + ')';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ALINHA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  ALINHA(TEXTO,TAMANHO,POSICAO).  '+#13+
                    'O resultado e:"TEXTOTEXTOTEXTO"');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCAX(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  BUSCAVALOR(TABELA,QX,N). Esta expressão '+
                    'Retorna um valor de QX na tabela Atual correspondente  '+
                    'à um valor informado de N=(X + N). Obs.: N é opcional'  );
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  {
  application.createform(TfrmCriaEstrutura,frmCriaEstrutura);
  frmCriaEstrutura.ShowModal;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('CAMPOSDESC(NomeDoCampo/Variável,Tipo,Tamanho,Decimais) '+' ==> '+ #13+#10+
                    'Ex.: CAMPOSDESC(MATRIC,C,6;IDADE,N,4,0;'+#13+#10+
                    'SALARIO,N,10,2;NASC,D,10.) '+#13+#10+
                    'Onde : '+#13+#10+
                    'C - Caracter '+#13+#10+
                    'N - Número com n casas decimais'+#13+#10+
                    'D - Data '+#13+#10+
                    'Cada descrição de Campo intermediária termina com <;>'+#13+#10+
                    'A última descrição de Campo termina com <.>');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CONCAT(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  Concat(A1,A2).  '+#13+
                    'Caso A1 contenha o texto "primeira" e'+#13+
                    'e A2 o texto "Palavra" o resultado sera:'+#13+
                    '"PrimeiraPalavra"');
}
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'EXISTECAMPO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                      ');
    Add('  Retorna True se o campo existir na query de entrada e False senão.           ');
    Add('-------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                       ');
    Add('  EXISTECAMPO(NOMEDOCAMPO)                                                     ');
    Add('-------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                       ');
    Add('                                               `                               ');
    Add('  EXISTECAMPO(IDPESSOA)                                                        ');
    Add('-------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                      ');
    Add('                                                                               ');
    Add(' - NOMEDOCAMPO                                                                 ');
    Add('   Nome do Campo a verificar na Query de entrada, deve ser uma Constante.      ');
    Add('-------------------------------------------------------------------------------');
    Add('OBSERVACAO:                                                                    ');
    Add('                                                                               ');
    Add('   Campos com valores nulos passados pelos sistemas de origens não aparecem na ');
    Add(' query de entrada ('' as IDPESSOA não é valido).                               ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'EXTRAIR(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  ContParent := 0;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  EXTRAIR(TEXTO,1,3)'+' ==> '+
                    'Retorna trecho do texto indicado.'+
                    'TEXTO -> De onde será etraido o trecho.'+
                    '1 -> posicao do primeiro caracter do trecho que será extraido.'+
                    '3 -> comprimento do trecho extraido. '+
                    'Ex.: Extrair(texto,1,3) retorna "tex"');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'FORMATAR(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  FORMATAR(123.4567,2).+#13+#10'+
                    'Retorna: 123.46');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
var
 resultado : string;
begin
  inherited;
  Resultado := '';
  Regra1.pegacampoAux('HIPOTESE',false,resultado); // pega o grupo de hipóteses
  Regra1.pegacampoAux('HIPOTESE',true,resultado);  // pega o parametro/premissa do grupo
  Inc(ContParent);
  dedMemo.Text := dedMemo.Text + 'HIPOTESE('+Resultado+')';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('HIPOTESE(NomeDoParâmetro/Premissa do Grupo de Hipóteses '+' ==> '+
                    'Ex.: HIPOTESE(JUROSAT) '+#13+#10+
                    'Retorna o valor do parâmetro/premissa  JUROSAT do Grupo de Hipóteses utilizado.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items16Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Inc(ContParent);
  dedMemo.Text := dedMemo.Text + 'SITPESSOA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('SITPESSOA(TIPOSITUACAO)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Se TIPOSITUACAO for : ');
  memDesc.Lines.Add('1 ou nulo - Situação na Patrocinadora');
  memDesc.Lines.Add('2 - Situação na Fundação');
  memDesc.Lines.Add('3 - Situação no Plano');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items29Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := 'REGATU()';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  ContParent := 0;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  REGATU()'+' ==> '+
                    'Retorna  o número do registro atual selecionado na aplicação');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items30Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  inherited;
  dedMemo.Text := dedMemo.Text + 'ROUND(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor arredondado com as casas decimais.                              ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  ROUND(VALOR,NUMERO DE CASAS,TIPO DE ARREDONDAMENTO)                             ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  ROUND(123.4567,3) = 123.46                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - VALOR                                                                          ');
    Add('   Valor a ser formatado.                                                         ');
    Add(' - NUMERO DE CASAS                                                                ');
    Add('   Numero de casas decimais no valor resultante.                                  ');
    Add(' - TIPO DE ARREDONDAMENTO (opcional)                                              ');
    Add('   Tipo de arredondamento utilizado.                                              ');
    Add('     0 - Arredondamento Normal (default)                                          ');
    Add('     1 - Arredondamento do Investimento (sempre arredonda para cima)              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items33Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TABBIO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('TABBIO(NomeDaAnuidade/Índice,ValorIdade '+' ==> '+ #13+#10+
                    'Ex.: TABBIO(QX,IDADE) '+#13+#10+
                    'Retorna a probabilidade de morte(QX) para o valor da variável IDADE.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items34Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TOTREGS()';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  ContParent := 0;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  TOTREGS()'+' ==> '+
                    'Retorna  a quantidade de registros da aplicação');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items35Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  bTrunc := True;
  dedMemo.Text := dedMemo.Text + 'TRUNC(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  TRUNC(123.4547,2)'+' ==> '+'Retorna 123.45');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ANO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  ANO(15/05/1998). Esta expressão '+
                    'Retorna o valor 1998'  );
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DATAREF';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  dedMemo.SetFocus;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  DIA(15/05/1998). Esta expressão '+
                    'Retorna o valor 15'  );
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIASDOMES(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  DIASDOMES(01/10/1999).'+#13+#10+
                    'Retorna: 31 - Quantidade de Dias da Data');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  bDifAno := True;
  dedMemo.Text := dedMemo.Text + 'DIFANOS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  DIFANOS(DATAMENOR,DATAMAIOR,TipodeCalculo,TipodeMetodo)'+' ==> '+
                    ' Atenção a data maior deve vir depois da menor');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('TipodeCalculo : ');
  memDesc.Lines.Add('0 ou Nulo, retorna valor inteiro.');
  memDesc.Lines.Add('1, retorna o valor fracionário.');
  memDesc.Lines.Add('2, retorna o valor arredondado.');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('TipodeMetodo : ');
  memDesc.Lines.Add('0, Calcula a diferença entre anos comerciais pelo metodo Americano.');
  memDesc.Lines.Add('1 ou Nulo, Calcula a diferença entre anos comerciais pelo metodo Europeu.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  bDifDia := True;
  dedMemo.Text := dedMemo.Text + 'DIFDIAS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  With MemDesc.Lines Do Begin
    BeginUpdate;
    Clear;
    Add('OBJETIVO:');
    Add('  Retornar o numero de dias entre duas datas.                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  DIFDIAS(DATAMAIOR, DATAMENOR, TIPOCALCULO, TIPOINVESTIMENTO)                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATAMAIOR                                                                     ');
    Add('    Data maior da expressão.                                                      ');
    Add('  - DATAMENOR                                                                     ');
    Add('    Data Menor da expressão.                                                      ');
    Add('  - TIPOCALCULO                                                                   ');
    Add('    Indica o tipo de calculo a ser utilizado.                                     ');
    Add('      0 ou Nulo - Numero de dias corridos entre as datas.                         ');
    Add('      1         - Dias comerciais no método Americano.                            ');
    Add('      2         - Dias comerciais no método Europeu.                              ');
    Add('      3         - Dias úteis (Calendário CM). Leia Obs..                          ');
    Add('      4         - Dias úteis (Calendário CM Invest). Leia Obs..                   ');
    Add('  - TIPOINVESTIMENTO (Opcional)                                                   ');
    Add('    Indica o tipo de Investimento a ser utilizado.                                ');
    Add('      1         - Renda Fixa                                                      ');
    Add('      2         - Renda Variável                                                  ');
    Add('      5         - Fundo de Renda Fixa                                             ');
    Add('      6         - Fundo de Renda Variável                                         ');
    Add('      7         - Fundo Imobiliário                                               ');
    Add('      8         - BM&F                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVACAO :                                                                      ');
    Add('  Anos das datas com 4 digitos.                                                   ');
    Add('  Os campos IDPAIS, IDCIDADES e CODESTADO devem estar no SQL de entrada.          ');
    Add('  No caso de TIPOCALCULO 4 a pesquisa será feita nas tabelas do Investimento.     ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  bDifMes := True;
  dedMemo.Text := dedMemo.Text + 'DIFMESES(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  DIFMESES(A1,Hoje,TipodeCalculo,TipodeMetodo)'+' ==> '+
                    ' A data maior deve vir depois da menor');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('TipodeCalculo : ');
  memDesc.Lines.Add('0 ou Nulo, retorna valor inteiro.');
  memDesc.Lines.Add('1, retorna o valor fracionário.');
  memDesc.Lines.Add('2, retorna o valor arredondado.');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('TipodeMetodo : ');
  memDesc.Lines.Add('0 Utiliza o de calculo de DIAS360 no metodo Americano.');
  memDesc.Lines.Add('1 ou Nulo, Utiliza o de calculo de DIAS360 no metodo Europeu.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'EANO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Evoui a anos, para frente se positivo e para trás '+
                    'se negativo, em relação à uma data. '+
                    'Exemplo: EANO(DATANASC,5)  ==> Retorna uma data 5 '+
                    'anos depois data de nascimento contida no campo DATANASC '+
                    'do banco de dados.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'EDIA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Evolui ou regride uma data em dias.                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add(' EDIA(DATA, EVOLUÇÃO, TIPOCALCULO, TIPOINVESTIMENTO)                              ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  EDIA(01/01/1990,5,0) = 05/01/1990                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA                                                                          ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
    Add('  - EVOLUÇÃO                                                                      ');
    Add('    Quantidade de dias a evoluir, caso positivo,  ou regredir , caso negativo.    ');
    Add('  - TIPOCALCULO (Opcional)                                                        ');
    Add('    Indica o tipo de calculo a ser utilizado.                                     ');
    Add('      0 ou Nulo - Numero de dias corridos entre as datas.                         ');
    Add('      1         - Dias comerciais no método Americano.                            ');
    Add('      2         - Dias úteis (Calendário CM). Leia Obs..                          ');
    Add('      3         - Dias úteis (Calendário CM Invest). Leia Obs..                   ');
    Add('  - TIPOINVESTIMENTO (Opcional)                                                   ');
    Add('    Indica o tipo de Investimento a ser utilizado.                                ');
    Add('      1         - Renda Fixa                                                      ');
    Add('      2         - Renda Variável                                                  ');
    Add('      5         - Fundo de Renda Fixa                                             ');
    Add('      6         - Fundo de Renda Variável                                         ');
    Add('      7         - Fundo Imobiliário                                               ');
    Add('      8         - BM&F                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVACAO :                                                                      ');
    Add('  Anos das datas com 4 digitos.                                                   ');
    Add('  Os campos IDPAIS, IDCIDADES e CODESTADO devem estar no SQL de entrada.          ');
    Add('  No caso de TIPOCALCULO 3 a pesquisa será feita nas tabelas do Investimento.     ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'EMES(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Evoui m meses, para frente se positivo e para trás '+
                    'se negativo, em relação à uma data. '+
                    'Exemplo: EMES(DATANASC,-1)  ==> Retorna uma data 1 '+
                    'mês antes data de nascimento contida no campo DATANASC '+
                    'do banco de dados.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items10Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  if Qry.FieldbyName('EXPRESSAOFORMULA').AsString <> '' then
     UltCar := Qry.FieldbyName('EXPRESSAOFORMULA').AsString[length(Qry.FieldbyName('EXPRESSAOFORMULA').AsString)]
  else
      UltCar := #00;
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := Qry.FieldbyName('EXPRESSAOFORMULA').AsString + 'HOJE';
  if bDifDia or bDifMes or bDifAno then begin
     if (UltCar = '(') then
        Qry.FieldbyName('EXPRESSAOFORMULA').AsString := Qry.FieldbyName('EXPRESSAOFORMULA').AsString + ','
     else begin
          Dec(ContParent);
          Qry.FieldbyName('EXPRESSAOFORMULA').AsString := Qry.FieldbyName('EXPRESSAOFORMULA').AsString + ')';
     end;
  end;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MES(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  MES(01/01/1998). Retorna 01');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items12Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PARADATA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  ContParent := 0;
// Mostra Descricao da Formula
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO');
     Add('  Retornar Datas alteradas de acordo com o parametro TIPODATARETORNO.           ');
     Add('--------------------------------------------------------------------------------');
     Add('EXEMPLO:                                        ');
     Add('                                                ');
     Add('  PARADATA(2001/04,D)    RETORNA: 01/04/2001    ');
     Add('  PARADATA(01/04/2001,M) RETORNA: 2001/04       ');
     Add('                                                ');
     Add('--------------------------------------------------------------------------------');
     Add('DESCRICAO DOS PARAMETROS:                           ');
     Add('                                                    ');
     Add(' - DATA                                             ');
     Add('    Data a ser processada, em dois formatos;        ');
     Add('      ANO/MES     (TIPODATARETORNO = D)             ');
     Add('      DD/MM/YYYY  (TIPODATARETORNO = M)             ');
     Add('                                                    ');
     Add(' - TIPODATARETORNO                                  ');
     Add('    Tipo de retorno da Fórmula:                     ');
     Add('      Caso. D - Recebe YYYY/MM e tranforma em DD/MM/YYYY,  ');
     Add('                com DD = 01.                               ');
     Add('            M - Recebe DD/MM/YYYY e tranforma em YYYY/MM.  ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items13Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SEMANA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: SEMANA(12/12/1998)'+' ==> '+
                    'Irá retornar o DIA da semana correspondente a esta data. O resulta do pode variar de 1 (domingo) a 7 (sábado)');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList4Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MEDIAINSS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  MEDIAINSS(Vetor,NumeroparaMedia,FormaResultado)');
  memDesc.Lines.Add('           Soma os valores de um vetor passado pelo SBINSS e faz a media a partir de "NumerodaMedia"');
  memDesc.Lines.Add('Se FormaResultado for : ');
  memDesc.Lines.Add('0 ou Nulo - O Valor que será retornado será sem formatação');
  memDesc.Lines.Add('1 - O Valor Retornado será arredondado');
  memDesc.Lines.Add('2 - O Valor Retornado será truncado');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList4Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SORTINSS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  SORTINSS(Vetor, Opção1, Opção2)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('           Organiza o vetor (Resultado) de SBINSS.');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('           --> Opção1 - Campo a ordenar');
  memDesc.Lines.Add('                        0 - Data');
  memDesc.Lines.Add('                        1 - Valor');
  memDesc.Lines.Add('           --> Opção2 - Ordenação');
  memDesc.Lines.Add('                        0 - Descendente');
  memDesc.Lines.Add('                        1 - Ascendente');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList4Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMINSS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  NUMINSS(Vetor)');
  memDesc.Lines.Add('           Conta o número de incidencias de valores diferente de zero no resultado de SORTINSS.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList4Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
// Inlcui dados da Formula nos campos
  dedMemo.Text := dedMemo.Text + 'SBINSS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar uma Tabela com os salários do participante da data de inicio até a    ');
    Add(' data final, reajustados por um ou mais indices e limitados a um Teto .          ');
    Add('-------------------------------------------------------------------------------- ');
    Add('SINTAXE:                                                                         ');
    Add('  SBINSS(TETO,DATAINICIAL,DATAFINAL,TIPOINDICE,[INDICE,DATA...],TIPOFILTRO,      ');
    Add('         "FLGSRB", [CORREÇÃO, MESDATABASE,FLGTIPOCALC...],DATAFIMCORR,           ');
    Add('         FLGDEGRAVACAO, FLGTIPOGRAVA, NUMERODECIMAISINDICE)                      ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('  SBINSS(#TETOINSS,01/01/2001,01/12/2001,[#INPC,01/01/2001],F,"1,3")             ');
    Add('                                                                                 ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                                                        ');
    Add(' - TETO                                                                          ');
    Add('    Sigla da Moeda usada como teto do provento.                                  ');
    Add(' - DATAINICIAL                                                                   ');
    Add('    Data Inicial do Processo                                                     ');
    Add('      Obs.: Ano com 4 digitos.                  ');
    Add(' - DATAFINAL                                    ');
    Add('    Data Final do Processo                      ');
    Add('      Obs.: Ano com 4 digitos.                  ');
    Add(' - TIPOINDICE                                   ');
    Add('    Indica o Tipo de Indice a ser utilizado     ');
    Add('      0 ou NULO - Utilizará valores menores que zero inclusive.      ');
    Add('      1         - Utilizará valores menores que zero, como sendo zero');
    Add(' - INDICE / DATA                                ');
    Add('   - INDICE                                     ');
    Add('                                                ');
    Add('   - DATA                                       ');
    Add('                                                ');
    Add('   Obs.:                                        ');
    Add('        Passados entre Colchetes Ex.: [1,12/01/2000]   ');
    Add('        Anos das datas com 4 digitos.           ');
    Add('                                                ');
    Add(' - TIPOFILTRO                                   ');
    Add('    Tipo de Filtro utilizado na pesquisa das Rubricas.                     ');
    Add('      F - Flags SRB                                                        ');
    Add('      G - Grupo de Rubricas                                                ');
    Add(' - FILTRO                                       ');
    Add('    FLGSRB ou Grupo de Rubrica.                 ');
    Add('      Obs.:                                     ');
    Add('           Passado entre Aspas e separado por virgulas. Ex.: "1,2,3,4".    ');
    Add('           Caso não seja passado serão utilizados todos existentes.        ');
    Add('           Se houver "FLGSRB" declarado, o tipo 4 eliminará os tipo 2 e 3. ');
    Add('           Se não houver declarado não terá eliminação alguma.             ');
    Add(' - CORRECAO                                     ');
    Add('    Fator de Correção de reajuste de salário.   ');
    Add(' - MESDATABASE                                  ');
    Add('    Mes para base de calculo para o reajuste de salário. ');
    Add(' - FLGTIPOCALC                                  ');
    Add('    Indica o Tipo de cálculo a ser utilizado    ');
    Add('      0 ou NULO - Utilizará valores menores que zero inclusive.            ');
    Add('      1         - Utilizará valores menores que zero, como sendo zero      ');
    Add(' - DATAFIMCORR                                  ');
    Add('    Data Final de Correção                      ');
    Add('      Obs.: Ano com 4 digitos.                  ');
    Add('            Caso este parametro não esteja preenchido, ');
    Add('            a DATAFINAL será a data final de correção. ');
    Add(' - FLGDEGRAVACAO                                   ');
    Add('    Indica se deseja gravar na memória de cálculo. ');
    Add('      0 - Não grava.                               ');
    Add('      1 - Grava.                                   ');
    Add(' - FLGTIPOGRAVA                                    ');
    Add('    Valor que será gravado na memória de cálculo para diferenciar      ');
    Add('    valores gravados por diferentes formulas chamadas pela mesma Regra. ');
    Add('      Obs.: Este valor será gravado sem criticas.  ');
    Add(' - NUMERODECIMAISINDICE                            ');
    Add('    Numero de casa que se deseja arrendondar o Indice do INSS          ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList4Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'IRRF(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  IRRF(NumeroDependentes,DataNascimento,ValorBase,DataRef,TipodeResultado)');
  memDesc.Lines.Add(' No parâmetro TipodeResultado poderão ter três tipos de formas de Retorno da formula : ');
  memDesc.Lines.Add(' 0 ou Nada -> Irá retornar o valor do Imposto Devido.');
  memDesc.Lines.Add(' 1         -> Irá retornar o valor da Aliquota IRRF.');
  memDesc.Lines.Add(' 2         -> Irá retornar o valor a Deduzir.');
  memDesc.Lines.Add(' 3         -> Irá retornar a idade de Idoso.');
  memDesc.Lines.Add(' 4         -> Irá retornar o valor a deduzir da base de cálculo para idosos.');
  memDesc.Lines.Add(' 5         -> Irá retornar o valor a deduzir da base de cálculo por dependente.');

  memDesc.Lines.Add('');
  memDesc.Lines.Add('Exemplo : IRRF(2,04/04/1951,2000,14/04/2000,0) - retornará o Imposto Devido.');
  memDesc.Lines.Add('Exemplo : IRRF(2,04/04/1951,2000,14/04/2000) - também retornará o Imposto Devido.');
  memDesc.Lines.Add('Exemplo : IRRF(2,04/04/1951,2000,14/04/2000,1) - retornará a Aliquota IRRF.');
  memDesc.Lines.Add('Exemplo : IRRF(2,04/04/1951,2000,14/04/2000,2) - retornará o Valor a Deduzir.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CP(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  CP([índice,data]dataref,NumContrib, TipoCalculo,"contribuicao")'+' ==> '+#13+#10+
                    'índice  -> Sigla do indexador. '+#13+#10+
                    'data    -> Última data em que foi usado o indexador. '+#13+#10+
                    'dataref -> Data em que se quer calcular a média. '+#13+#10+
                    'NumContrib  -> Número de contribuições para fazer a média. '+#13+#10+
                    'TipoCalculo -> Se 0 (zero) Utiliza o NumContrib'+#13+#10+
                    '               Se 1 (Um) Utiliza o Qtd. Registros Selecionados'+#13+#10+
                    'contribuicao -> número da contribuição. Pode ser usado mais de uma contribuição '+
                    'separados por virgula. Ex.: "40,38,39"'+
                    'utilizando como base a data de inscrição e idpessoa como chave de relacionamento.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CORRECAO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  CORRECAO(DATA1,DATA2,MOEDA,VALOR)');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'INDICE(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor de um índice em uma data especificada ou aproximda.             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  INDICE(ÍNDICE,DATAREF,TIPO DE PESQUISA, TIPO DE RETORNO)                        ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  INDICE(UPC,09/01/1998,1)                                                        ');
    Add('  Irá retornar o valor da UPC em 09 de janeiro de 1998 ou antes.                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - ÍNDICE                                                                        ');
    Add('    Índice de referência do processo.                                             ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de refência do processo, formato DD/MM/YYYY.                             ');
    Add('  - TIPO DE PESQUISA (opcional)                                                   ');
    Add('    Tipo de pesquisa.                                                             ');
    Add('      0 ou Nulo - Retorna quando existe valor na data.                            ');
    Add('      1 - Retorna o ultimo valor cadastrado.                                      ');
    Add('  - TIPO DE RETORNO  (opcional)                                                   ');
    Add('    Tipo de retorno quando não encontrar indice.                                  ');
    Add('      0 ou Nulo - Retorna 0 quando não existe valor na data.                      ');
    Add('      1 - Retorna <NULO> quando não existe valor na data.                         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMCONTRIB(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Sintaxe.: NUMCONTRIB(DATAINICIAL,DATAFINAL,IDCONTRIBUICAO,TIPODEPESQUISA,PATROCINADORA)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('IDCONTRIBUICAO -> Numero da Contribuição, caso não seja declarado serão utilizados todos os número para pesquisa.');
  memDesc.Lines.Add('TIPODEPESQUISA -> Caso sejá declarado como zero ou nulo, será feita a pesquisa por valores recebidos maiores e iguais a zero, ');
  memDesc.Lines.Add('                  se este parâmetro for um, será feita a pesquisa pelos valores maiores que zero.');
  memDesc.Lines.Add('PATROCINADORA -> Caso seja declarado, será feita a pesquisa por este parametro, senão será feita a pesquisa por todas as ');
  memDesc.Lines.Add('                 patrocinadoras com o IdPessoa corrente.');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Esta formula irá retornar o número de ocorrencias no periodo passado.');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Ex.: NUMCONTRIB(01/01/1999,31/12/1999,2) ou NUMCONTRIB(01/01/1999,31/12/1999) ou');
  memDesc.Lines.Add('     NUMCONTRIB(01/01/1999,31/12/1999,2,0,2) ou NUMCONTRIB(01/01/1999,31/12/1999,1)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Caso o IDContribuicao não seja declarado serão utilizados todos os IdContribuicao existentes.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NP(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: NP([Rubrica1,Rubrica2]36,GravaMemoria)'+#13+#10+
                    'Aonde Rubrica1 e Rubrica2 sao proventos cadastrados pelo usuario '+
                    'e 36 e o nº de meses que se pretende utilizar.'+#13+#10+
                    'Esta formula soma mes a mes os proventos dos ultimos 36 meses e'+
                    'retorna a quantidade de salarios diferentes de zero dentro do'+
                    ' periodo de 36  meses que foi solicitado.' +#13+#10+
                    'O nº maximo de meses solicitado nao deve ultrapassar 48+'+#13+#10+
                    'GravaMemoria -> se 0 (zero) não grava na memoria de calculo, '+
                    ' se 1 (um) grava na memoria de calculo.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMSALARIOS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  NUMSALARIOS(1999/10, 12).'+#13+#10+
                    'Retorna: 12 - Quantidade de Salários');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'OPCONTRIB(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: OPCONTRIB(IDCONTRIBUICAO,DATA,@A1,@A2,@A3)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Esta formula retorna três valores das opções de uma contribuição em três variaveis. (@A1,@A2,@A3)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('OBS : Caso seja usado o parâmetro DATA será feita a pesquisa pelo HISTÓRICO, ');
  memDesc.Lines.Add('      e caso não seja utilizado o parâmetro DATA será feita a pesquisa ATUAL.');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Ex.: OPCONTRIB(22,,@A1,@A2,@A3) - pesquisa ATUAL');
  memDesc.Lines.Add('Ex.: OPCONTRIB(22,04/10/1999,@A1,@A2,@A3) - pesquisa HISTORICO');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'OPPATRO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  OPPATRO(@A1,@A2,@A3)'+
                    'Esta formula não retorna um único resultado, '+
                    'as opções serão retornadas nas três variáveis'  );
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PR2(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('PR2([índice,data]dataref,teto,numsal,tipomedia,tipo,gravação,FormaResultado,TipoIndice,{FLGSRB},[Correção,MesDatabase,TipoCalc])'+#13+#10+
                    'índice  -> Sigla do indexador. (Variável ou String)'+#13+#10+
                    'data    -> Última data em que foi usado o indexador. (Variável ou String)'+#13+#10+
                    'dataref -> Data em que se quer calcular a média. (Variável ou String)'+#13+#10+
                    'teto    -> Sigla da moeda usada como teto do provento. (Variável ou String)'+#13+#10+
                    'numsal  -> Número de salários para fazer a média. (Variável ou String)'+#13+#10+
                    'tipomedia -> (Variável ou String) 0 - Soma os salários e divide por numsal. '+#13+#10+
                    '                                  1 - Divide pelo nº de salários <> Zero. '+#13+#10+
                    '                                  2 - Média retroativa '+#13+#10+
                    'tipo      -> Tipo de Cálculo que será feito com a PR2, para fins de relatório. (Variável ou String) '+#13+#10+
                    'gravação  -> Variável ou String para gravação na memória de cálculo.'+
                    '             0 - Não Grava.'+#13+#10+
                    '             1 - Grava(Default).'+#13+#10+
                    'FlgSrb   -> Tipo de Salário. (Variável ou String)'+#13+#10+
                    '            1 - Salário de ativo e mantido.'+#13+#10+
                    '            2 - Benefício pago pela folha de beneficios.'+#13+#10+
                    '            3 - Benefício pago pelo INSS.'+#13+#10+
                    '            4 - Salário Virtual.'+#13+#10+
                    '            5 - Salário de mantido parcial.'+#13+#10+
                    '            0 - Outro tipo de salário.'+#13+#10+
                    'Caso não seja declarado nada em FLGSRB, serão utilizados todos os tipos acima. Com a seguinte ressalva : '+#13+#10+
                    'Se num mês o tipo for 4, serão desconsiderados os tipos 2 e 3.'+#13+#10+
                    'Ex.: {1,2,3} ou {1} ou {1,2,3,4}'+#13+#10+
                    ''+#13+#10+
                    'Correção -> Percentual para correção após data base. (Variável ou String)'+#13+#10+
                    'MesDatabase -> Mes da data base da patrocinadora. (Variável ou String)'+#13+#10+
                    'Estes parâmetros têm que ser passados entre colchetes. '+#13+#10+
                    'Ex.: [1,12] ou [@XPTO,@YZFS]. '+#13+#10+
                    'TipoCalc -> Se 0 ou nada forma de calculo normal '+#13+#10+
                    '            Se 1 Usa Descontos.'+#13+#10+
                    'Utilizando como base a data de inscrição e idpessoa como chave de relacionamento.');
  memDesc.Lines.Add('TipoIndice -> 0 ou nulo - utilizará os valores dos indices menores que zero inclusive');
  memDesc.Lines.Add('              1 - utilizará não utilizará os valores menores que zero, usando estes como 0 (Zero)');

  memDesc.Lines.Add('Se FormaResultado for : ');
  memDesc.Lines.Add('0 ou Nulo - O Valor que será retornado será sem formatação');
  memDesc.Lines.Add('1 - O Valor Retornado será arredondado');
  memDesc.Lines.Add('2 - O Valor Retornado será truncado');

end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
// Inlcui dados da Formula nos campos
  dedMemo.Text := dedMemo.Text + 'PRO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  MemDesc.Lines.BeginUpdate;
// Mostra Descricao da Formula
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retorna o número de Proventos que encontrou no periodo de 48 meses ');
    Add(' anteriores a DATADECALCULO. ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                        ');
    Add('                                                ');
    Add('  PRO(RUBRICA[INDICE1,DATA...]CORREÇÃO,MESDATABASE,');
    Add('      TETO,DATADECALCULO,FLGDEGRAVACAO,FLGTIPODECORRECAO)     ');
    Add('                                                ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                       ');
    Add('                                                ');
    Add(' - RUBRICA                                      ');
    Add('    Código do Provento que será Processado.     ');
    Add(' - INDICE / DATA                                ');
    Add('   - INDICE                                     ');
    Add('                                                ');
    Add('   - DATA                                       ');
    Add('                                                ');
    Add('   Obs.:                                        ');
    Add('        Passados entre Colchetes Ex.: [1,12]    ');
    Add('        Anos das datas com 4 digitos.           ');
    Add(' - CORRECAO                                     ');
    Add('    Percentual para correção após a data base.  ');
    Add(' - MESDATABASE                                  ');
    Add('    Mes para base de calculo para o reajuste de salário. ');
    Add(' - TETO                                         ');
    Add('    Sigla da Moeda usada como teto do provento. ');
    Add(' - DATADECALCULO                                 ');
    Add('    Data apartir do qual serão calculados os proventos.');
    Add('      Obs.: Ano com 4 digitos.                  ');
    Add(' - FLGDEGRAVACAO                                  ');
    Add('    Indica se deseja gravar na memória de cálculo. ');
    Add('      0 - Não grava.                               ');
    Add('      1 - Grava.                                   ');
    Add(' - FLGTIPODECORRECAO                                    ');
    Add('    Indica o Tipo de Correção utilizado.           ');
    Add('      0 ou Nulo - Caclula Normalmente.             ');
    Add('      1 - Calcula com Descontos.                   ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items10Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VEROPCONTRIB(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: VEROPCONTRIB(IDCONTRIBUICAO,DATAINICIAL,DATAFINAL,OPCAO)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Esta formula retorna true ou false');
  memDesc.Lines.Add('Verifica as opções de contribuição a partir de um periodo de datas.');
  memDesc.Lines.Add('Caso o parâmetro OPCAO não seja descrito serão verificadas as três opções existentes.');
  memDesc.Lines.Add('1 - Verifica ValorOp1.');
  memDesc.Lines.Add('2 - Verifica ValorOp2.');
  memDesc.Lines.Add('3 - Verifica ValorOp3.');
  memDesc.Lines.Add('Qualquer outro valor - Verifica Todos os 3 valores');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('OBS : Caso seja usado o parâmetro DATA será feita a pesquisa pelo HISTÓRICO, ');
  memDesc.Lines.Add('      e caso não seja utilizado o parâmetro DATA será feit a pesquisa ATUAL.');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Ex.: VEROPCONTRIB(22,,,) - pesquisa ATUAL - O parametro Opcao não precisa ser utilizado.');
  memDesc.Lines.Add('Ex.: VEROPCONTRIB(22,04/10/1999,04/12/1999,1) - pesquisa HISTORICO');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Caso seja feita a pesquisa ATUAL, os valores retornados são : ');
  memDesc.Lines.Add('NAO - Se achar algo e o FlgCobra = 0');
  memDesc.Lines.Add('True - Se Achar algo e o FlgCobra = 1');
  memDesc.Lines.Add('False - Se não achar nada.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList6Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Inc(ContParent);
  dedMemo.Text := dedMemo.Text + 'FV(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Você poderá informar o falor presente(PV) ou a prestação(PMT)'+
                    'Formato: FV(taxa,n,pmt,pv,tipo)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Taxa - Taxa de juros por período.');
  memDesc.Lines.Add('n - Número total de pagamentos.');
  memDesc.Lines.Add('pmt - Pagamento feito a cada período.');
  memDesc.Lines.Add('pv - Valor futuro (opcional)');
  memDesc.Lines.Add('t - Tipo de pagamento (opcional: 0 quando for no final do periodo'+
                    'ou 1 para inicio do período)');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList6Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Inc(ContParent);
  dedMemo.Text := dedMemo.Text + 'NPMT(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('NPMT(FV,PV,I)');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList6Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Inc(ContParent);
  dedMemo.Text := dedMemo.Text + 'PMT(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Formato: PMT(taxa,n,vp,vf*,t*)');
  memDesc.Lines.Add('* :Opcionais ');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList6Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Inc(ContParent);
  dedMemo.Text := dedMemo.Text + 'PV(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Você poderá informar a prestação(PMT) ou o falor futuro(FV)'+
                    'Formato: PV(Taxa,n,pmt,fv,t)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Taxa - Taxa de juros por período.');
  memDesc.Lines.Add('n - Número total de pagamentos.');
  memDesc.Lines.Add('pmt - Pagamento feito a cada período.');
  memDesc.Lines.Add('fv - Valor futuro (opcional)');
  memDesc.Lines.Add('t - Tipo de pagamento (opcional: 0 quando for no final do periodo'+
                    'ou 1 para inicio do período)');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList6Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'RATE(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Formato: RATE(FV,PV,N)');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList7Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TABGENERICA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('TABGENERICA(NomeDaTabela,ValorProcurado,ColunaDePesquisa,ColunaDeRetorno,Flag(0,1 ou 2))'+' ==> '+
                    'Ex.: TABGENERICA(TABTESTE,45,IDADE,REDUTOR,2) '+#13+#10+
                    'Retorna o Redutor contido na tabela genérica TABTESTE para '+
                    'Idade igual a 45. O ultimo parametro determina que sera utilizada '+
                    'a primeira idade acima de 45 caso esta nao exista na tabela.');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Caso Flag seja igual a : ');
  memDesc.Lines.Add('0 -> Pequisará na tabela o valor igual ao ValorProcurado');
  memDesc.Lines.Add('1 -> Pequisará na tabela o valor  menor ou igual ao ValorProcurado');
  memDesc.Lines.Add('2 -> Pequisará na tabela o valor  maior ou igual ao ValorProcurado');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList7Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CONSULTA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  CONSULTA([CAMPO1=VALOR1,CAMPO2=VALOR2]TABELA,CAMPORETORNO,TIPOPESQUISA)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('TIPOPESQUISA deve ser 0 ou 1.');
  memDesc.Lines.Add('Se 1 (um)   - tabela genérica.');
  memDesc.Lines.Add('Se 0 (zero) - tabela genérica longa. ');
  memDesc.Lines.Add('Caso não atribua nada, a pesquisa será');
  memDesc.Lines.Add('feita pela tab. genérica longa.');
end;

procedure TfrmCadFormulas.FormCreate(Sender: TObject);
begin
  inherited;
  fcOpcoes.ActivePage := fcNumeros;
end;

procedure TfrmCadFormulas.fcLstNumerosItems9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ATUARIAL(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  ATUARIAL(A1+A2*A3)');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MED(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  MED(12,1,0)'+#13+#10+
                    'Aonde 12 e o nº de proventos dos quais'+
                    ' se deseja calcular a media, o segundo nº '+
                    'e o sinalizador de opcoes que pode variar entre 0, 1 e 2:'+#13+#10+
                    '0 - Os proventos encontrados serao divididos por 12'+#13+
                    'O terceiro parametro define se os proventos serao gravados ou nao'+#13+
                    'na memoria de calculo');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items12Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SALCONTRIB(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: SALCONTRIB(DATA,{FLGSRB})');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Esta formula retorna o salário de contribuição em uma determinada data.');
  memDesc.Lines.Add('Caso o parâmetro FLGSRB não seja descrito serão utilizados todos os tipos de salarios.');
  memDesc.Lines.Add('Sendo que, se um mes o FLGSRB for 4, serão desconsiderados os tipos 2 e 3.');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Ex.: SALCONTRIB(#06/06/2000) - Será feita a pesquisa por todos os tipos.');
  memDesc.Lines.Add('Ex.: SALCONTRIB(#04/10/1999,{1,2,5}) - Será feita a pesquisa pelos FLGSRB 1, 2 e 5.');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MAXIMO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  MAXIMO(12,25,11,01,11,124,211)'+' ==> '+'Retorna 211');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Compara até 100 valores');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items15Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MINIMO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  MINIMO(12,25,11,101,11,124,211)'+' ==> '+'Retorna 11');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Compara até 100 valores');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIAINICIAL(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  // Mostra Descricao da Formula
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO');
     Add('  Retornar a data regredida para o 1º dia do mês da data.                             ');
     Add('                                                                                      ');
     Add('--------------------------------------------------------------------------------      ');
     Add('EXEMPLO:                                                                              ');
     Add('  DIAINICIAL(DATA, TIPODATA)                                                          ');
     Add('                                                                                      ');
     Add('  DIAINICIAL(20/07/2000, 0) RETORNA - 01/07/2000                                      ');
     Add('                                                                                      ');
     Add('--------------------------------------------------------------------------------      ');
     Add('DESCRICAO DOS PARAMETROS:                                                             ');
     Add('  - DATA                                                                              ');
     Add('    Data a ser processada, no formato DD/MM/YYYY.                                     ');
     Add('                                                                                      ');
     Add('  - TIPODATA                                                                          ');
     Add('    Tipo de processamento a ser feito.                                                ');
     Add('      Caso 0/Nulo - Mês corrido.                                                   ');
     Add('           1      - Mês Comercial                                                  ');
     Add(' ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items15Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIAFINAL(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  // Mostra Descricao da Formula
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO');
     Add('  Retornar a data progredida para o ultimo dia do mês da data.                        ');
     Add('                                                                                      ');
     Add('--------------------------------------------------------------------------------      ');
     Add('EXEMPLO:                                                                              ');
     Add('  DIAFINAL(DATA, TIPODATA)                                                          ');
     Add('                                                                                      ');
     Add('  DIAFINAL(20/07/2000, 0) RETORNA - 31/07/2000                                      ');
     Add('                                                                                      ');
     Add('--------------------------------------------------------------------------------      ');
     Add('DESCRICAO DOS PARAMETROS:                                                             ');
     Add('  - DATA                                                                              ');
     Add('    Data a ser processada, no formato DD/MM/YYYY.                                     ');
     Add('                                                                                      ');
     Add('  - TIPODATA                                                                          ');
     Add('    Tipo de processamento a ser feito.                                                ');
     Add('      Caso 0/Nulo - Mês corrido.                                                   ');
     Add('           1      - Mês Comercial (30 dias)                                        ');
     Add(' ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList4Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'FILTRAINSS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.:  FILTRAINSS(Vetor,QtdFiltragem)');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items13Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'OPBENEF(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: OPBENEF(IDBENEFICIO,DATA,@A1,@A2,@A3)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Esta formula retorna três valores das opções de um beneficio em três variaveis. (@A1,@A2,@A3)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('OBS : Caso seja usado o parâmetro DATA será feita a pesquisa pelo HISTÓRICO, ');
  memDesc.Lines.Add('      e caso não seja utilizado o parâmetro DATA será feita a pesquisa ATUAL.');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Ex.: OPBENEF(22,,@A1,@A2,@A3) - pesquisa ATUAL');
  memDesc.Lines.Add('Ex.: OPBENEF(22,04/10/1999,@A1,@A2,@A3) - pesquisa HISTORICO');
end;



procedure TfrmCadFormulas.fcOpcoesOutlookList2Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  inherited;
  dedMemo.Text := dedMemo.Text + 'COTACAORENFIX(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a cotação de um investimento de Renda Fixa que vence em uma determinada ');
    Add('  data de referencia.                                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  COTACAORENFIX(DATAREFERECIA, DATAVENCIMENTO, INVESTIMENTO)                      ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  COTACAORENFIX(02/01/2002, 28/02/2002, 9324)                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATAREFERENCIA                                                                ');
    Add('    Data de refência do processo, formato DD/MM/YYYY.                             ');
    Add('  - DATAVENCIMENTO                                                                ');
    Add('    Data de vencimento do investimento, formato DD/MM/YYYY.                       ');
    Add('  - INVESTIMENTO                                                                  ');
    Add('    Investimento de referência do processo.                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList2Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PRAZOPBC';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: PRAZOPBC');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Esta função retorna o prazo PBC do plano de cargos e salários da pessoa corrente.');
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList3Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRRUBMES(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: VLRRUBMES(RUBRICA,DATA)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Esta formula retorna o valor da rubrica para o referente mês');
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList3Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MEDPERCRUB(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: MEDPERCRUB([RUBRICA1, RUBRICA2,...]DATAREF,QTDEMESES)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Passado uma ou mais rubricas e uma quantidade de meses retorna a média dos');
  memDesc.Lines.Add('percentuais das rubricas encontradas no periodo informado (QTDEMESES) a partir');
  memDesc.Lines.Add('de uma determinada data (DATAREF).');
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList3Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMOCORRUB(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o número de vezes que a(s) rubrica(s) ocorreram no prazo informado.     ');
    Add('  Pode se passa os grupos em que elas estão contidas.                             ');
    Add('-------------------------------------------------------------------------------   ');
    Add('SINTAXE:                                                                          ');
    Add('  NUMOCORRUB([RUBRICA1,RUBRICA2,RUBRICA3...]DATAREF,QTDEMESES, TIPOPESQUISA)      ');
    Add('EXEMPLO:                                                                          ');
    Add('  NUMOCORRUB([001021, 03011,...]01/02/2002,10, R)                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - RUBRICAn                                                                      ');
    Add('    Identificador das Rubricas processadas.                                       ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência do processo, formato DD/MM/YYYY.                           ');
    Add('  - QTDMESES                                                                      ');
    Add('    Quantidade de meses a processar.                                              ');
    Add('  - TIPOPESQUISA (opcional)                                                       ');
    Add('    Tipo de Pesquisa a executar.                                                  ');
    Add('      R - Selecionará utilizando os códigos das Rubricas (default)                ');
    Add('      G - Selecionará utilizando os Grupos das Rubricas                           ');
  end;
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList3Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRCF(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: VLRCF(CODCF,TIPO,DATAREF)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Passado o código de um cargo/função (CODCF), o TIPO (C - Cargo, F - Função) e uma ');
  memDesc.Lines.Add('Data de Referência (DATAREF), esta função retorna o valor cargo/função, no nível/grupo ');
  memDesc.Lines.Add('vigente, na data de referência.');
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList3Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRFAIXA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: VLRFAIXA(CODGRUPONIVEL,TIPO,NUMFAIXA,DATAREF)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Passado o código do grupo ou nível, o número da faixa, e uma data de referencia,');
  memDesc.Lines.Add('esta função retorna o valor daquela faixa na data de referência, independente do ');
  memDesc.Lines.Add('grupo/nivel estar vigente na função/cargo da pessoa ou não');
end;


procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items17Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VERCONCEDIDO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: VERCONCEDIDO(NUMBENEFICIO,VARIAVELRETORNODATA,VARIAVELRETORNOVALOR)');
  memDesc.Lines.Add('');
end;

function TfrmCadFormulas.PosCharEsp(Dado : String) : LongInt;
var
   i, Tam : LongInt;
begin
     Result := 0;
     Tam := Length(Dado);
     For i := Tam downto 1 do begin
         if (Copy(Dado,i,1) = ',') or (Copy(Dado,i,1) = ')') or (Copy(Dado,i,1) = '(') or
            (Copy(Dado,i,1) = '[') or (Copy(Dado,i,1) = ']') or (Copy(Dado,i,1) = '}') or
            (Copy(Dado,i,1) = '/') or (Copy(Dado,i,1) = '*') or (Copy(Dado,i,1) = '+') or
            (Copy(Dado,i,1) = '-') or (Copy(Dado,i,1) = '{') or (Copy(Dado,i,1) = '"') then begin
            Result := i;
            Break
         end;
     end;
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList4Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TEMPOPATRO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: TEMPOPATRO(IDPATRO,TIPO,TIPOCALCULO,FORMARESULTADO)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Se TIPO = ''A'' (Acumulado - PADRÃO) ou se TIPO = ''C'' (Corrente) - Primeiro Registro somente');
  memDesc.Lines.Add('Se TIPOCALCULO = 0 (Dias Comerciais - PADRÃO) ou se TIPOCALCULO = 1 (Dias Corridos)');
  memDesc.Lines.Add('Se FORMARESULTADO = ''D'' Dias, ou ''M'' Meses (Padrão) , ou ''A'' Anos');
  memDesc.Lines.Add('');
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList4Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TEMPOPLANO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: TEMPOPLANO(FORMARESULTADO,COMAFASTAMENTO)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Se FORMARESULTADO = ''D'' Dias, ou ''M'' Meses (Padrão) , ou ''A'' Anos');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Se COMAFASTAMENTO = 0 ou Nulo não diminuirá com o tempo de afastamento.');
  memDesc.Lines.Add('Se COMAFASTAMENTO = 1 diminuirá com o tempo de afastamento.');
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList4Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  //TEMPOAFAST
  dedMemo.Text := dedMemo.Text + 'TEMPOAFAST(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: TEMPOAFAST(IDPATRO,TIPO,FORMARESULTADO)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Se TIPO = ''A'' (Acumulado - PADRÃO) ou se TIPO = ''C'' (Corrente) - Primeiro Registro somente');
  memDesc.Lines.Add('Se FORMARESULTADO = ''D'' Dias, ou ''M'' Meses (Padrão) , ou ''A'' Anos');
  memDesc.Lines.Add('');

end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items10Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NIVEL(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('NIVEL(nivel,step,dataref');
  Inc(ContParent);

end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items18Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SITINTERNA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('SITINTERNA(TIPODESITUACAO,SAIDA)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Se TIPODESITUACAO = 0 então verifica a situação da patrocinadora (ElegPatro)');
  memDesc.Lines.Add('Se TIPODESITUACAO = 1 então verifica a situação do plano (PartPrevPlan)');
  memDesc.Lines.Add('Se TIPODESITUACAO = 2 então verifica a situação do Participante (PartPrevPlan)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Se Saida for nulo ou 0 (Zero), e TIPODESITUACAO = 0 retonará o valor de TipoSit.');
  memDesc.Lines.Add('Se Saida for 1 (Um), e TIPODESITUACAO = 0 retonará o valor de TipoSit concatenado com FlgInterno.');

  memDesc.Lines.Add(' ');
  memDesc.Lines.Add('Obs.: quando usando tabelas auxiliares (Views) a formúla busca os dados nestas tabelas. ');
  Inc(ContParent);
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items19Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SITBENEFICIO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('SITBENEFICIO(NUMBENEFICIO)');
  memDesc.Lines.Add('');
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMOCORCONTRIB(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o numero de contribuições recolhidas em um período.                     ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  NUMOCORCONTRIB([CODIGO1,CODIGO2,CODIGO3...], DATA INICIAL, DATA FINAL,          ');
    Add('  TIPOSELEÇÃO)                                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NUMOCORCONTRIB([0001,0020],01/01/2002,30/05/2002,0)                             ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - CODIGOn                                                                       ');
    Add('    Códigos das Contribuições ou Grupos de Contribuições processadas.             ');
    Add('  - DATA INICIAL                                                                  ');
    Add('    Data de inicio da contagem.                                                   ');
    Add('  - DATA FINAL                                                                    ');
    Add('    Data de fim da contagem.                                                      ');
    Add('  - TIPOSELEÇÃO                                                                   ');
    Add('    Tipo de Rubricas a selecionar.                                                ');
    Add('      0 - Selecionará inclusive os valores zerados.                               ');
    Add('      1 - Não selecionará os valores zerados.                                     ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items15Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'RUBRINDIV(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  memDesc.Lines.Add('RUBRINDIV(RUBRICA)');
  memDesc.Lines.Add('');

  //RUBRINDIV
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList1Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
// Inclui Formula nos Campos
  dEdMemo.Text := dEdMemo.Text + 'TOTALCFMESHIST(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dEdMemo.Text;
  Inc(ContParent);
// Mostra Descricao da Formula
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO');
     Add('  Retornar a soma dos valores de todos os CARGOS/FUNCAO em um determinado mês,   ');
     Add('  lendo do HISTÓRICO FUNCIONAL.                                                  ');
     Add('-------------------------------------------------------------------------------- ');
     Add('EXEMPLO:                                                                         ');
     Add('                                                                                 ');
     Add('  TOTALCFMESMES(C,12/01/2000)                                                    ');
     Add('                                                                                 ');
     Add('    TIPO: CARGO, DATA DE REFERENCIA: 12/01/2000                                  ');
     Add('-------------------------------------------------------------------------------- ');
     Add('DESCRICAO DOS PARAMETROS:                                                        ');
     Add('                                                                                 ');
     Add(' - TIPO (C OU F)                                                                 ');
     Add('    Indica se a Fórmula processará CARGOS (C) ou FUNÇÕES (F).                    ');
     Add('                                                                                 ');
     Add(' - DATAREF                                                                       ');
     Add('    Data para busca do valor do Cargo/Funcao.                                    ');
     Add('    Formato : DD/MM/AAAA.                                                        ');
     Add('-------------------------------------------------------------------------------- ');
     Add('OBSERVACAO:                                                                      ');
     Add('                                                                                 ');
     Add('  O valor do CARGO/FUNÇÃO nesta fórmula é buscado da tabela de HISTÓRICO FUNCIONAL ');
     Add('  e NÃO da tabela de CARGOS/FUNÇÃO.                                                ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;






procedure TfrmCadFormulas.fcOpcoesQTDEITEMMES(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'QTDEITEMMES(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar o número de valores do item diferentes no mês indicado.               ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('                                                                                 ');
    Add('  QTDEITEMMES(ANOMESREF, CODITEM)                                                ');
    Add('                                                                                 ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                                                        ');
    Add('                                                                                 ');
    Add(' - ANOMESREF                                                                     ');
    Add('    Ano/Mês no qual se deseja calcular o número de dias do adicional.            ');
    Add(' - CODITEM                                                                       ');
    Add('    Código do Item na tabela de Itens de Cálculo.                                ');
    Add('-------------------------------------------------------------------------------- ');
    Add('OBSERVAÇÕES :                                                                    ');
    Add('                                                                                 ');
    Add(' 1. Caso a fórmula não encontre nenhum item ela retornará o valor ZERO.     ');
  end;

end;



procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items16Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIASINICIAIS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  // Mostra Descricao da Formula
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO');
     Add('  Retornar o numero de dias entre a data parametro e o fim do mês da            ');
     Add('  data de parametro.                                                            ');
     Add('--------------------------------------------------------------------------------');
     Add('SINTAXE:                                                                        ');
     Add('  DIASINICIAIS(DATAREFERENCIA, FLGTIPOMES)                                      ');
     Add('--------------------------------------------------------------------------------');
     Add('EXEMPLO:                                                                        ');
     Add('  DIASINICIAIS(05/04/2001, 0) RETORNA - 25                                      ');
     Add('--------------------------------------------------------------------------------');
     Add('DESCRICAO DOS PARAMETROS:                                                             ');
     Add('  - DATAREFERENCIA                                                                    ');
     Add('    Data de referencia para fórmula.                                                  ');
     Add(' ');
     Add(' - FLGTIPOMES                                      ');
     Add('    Tipo de Mes do processo.                       ');
     Add('      0 - Mês corrido.                             ');
     Add('      1 - Mês comercial.                           ');
     Add('--------------------------------------------------------------------------------');
     Add('OBSERVAÇÕES:                                                                          ');
     Add('  Anos das datas com 4 digitos.           ');
     Add('  Default 0 (zero) para FLGTIPOMES.       ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items17Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIASFINAIS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  // Mostra Descricao da Formula
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO');
     Add('  Retornar o numero de dias entre o inicio do mes da data parametro e o         ');
     Add('  dia da data de parametro                                                      ');
     Add('--------------------------------------------------------------------------------');
     Add('SINTAXE:                                                                        ');
     Add('  DIASFINAIS(DATAREFERENCIA, FLGTIPOMES)                                        ');
     Add('--------------------------------------------------------------------------------');
     Add('EXEMPLO:                                                                        ');
     Add('  DIASFINAIS(05/04/2001, 0) RETORNA - 5                                         ');
     Add('--------------------------------------------------------------------------------');
     Add('DESCRICAO DOS PARAMETROS:                                                             ');
     Add('  - DATAREFERENCIA                                                                    ');
     Add('    Data de referencia para fórmula.                                                  ');
     Add(' ');
     Add(' - FLGTIPOMES                                      ');
     Add('    Tipo de Mes do processo.                       ');
     Add('      0 - Mês corrido.                             ');
     Add('      1 - Mês comercial.                           ');
     Add('--------------------------------------------------------------------------------');
     Add('OBSERVAÇÕES:                                                                          ');
     Add('  Anos das datas com 4 digitos.           ');
     Add('  Default 0 (zero) para FLGTIPOMES.       ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcEvolFuncADICIONALDIA(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ADICIONALDIA('; 
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar o percentual do Adicional (T.Serviço, Periculosidade, Insalubridade,  ');
    Add('                                      Compensatório ou Noturno)                  ');
    Add('  de um participante no dia do parâmetro DATAREF.                                ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                        ');
    Add('                                                ');
    Add('  ADICIONALDIA(DATAREF, TIPO_ADICIONAL)         ');
    Add('                                                ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                               ');
    Add('                                                        ');
    Add(' - DATAREF                                              ');
    Add('    Data na qual se deseja verificar o adicional.       ');
    Add(' - TIPO_ADICIONAL                                               ');
    Add('    T : ATS                                                     ');
    Add('    P : Periculosidade                                          ');
    Add('    I : Insalubridade                                           ');
    Add('    C : Adicional Compensatório  (Primeiro Percentual)          ');
    Add('    N : Adicional Noturno                                       ');
    Add('-------------------------------------------------------------------------------- ');
    Add('OBSERVACAO :                                                                     ');
    Add('                                                                                 ');
    Add(' Caso a fórmula não encontre nenhum adicional será retornado valor ZERO.         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;

procedure TfrmCadFormulas.fcEvolFuncADICIONALMES(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ADICIONALMES('; 
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;

  
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar o percentual do Adicional (T.Serviço, Periculosidade, Insalubridade, ');
    Add('                                      Compensatório ou Noturno)                 ');
    Add('  de um participante em um determinado mês.   ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                        ');
    Add('                                                ');
    Add('  ADICIONALMES(ANOMESREF,TIPO_ADICIONAL,SEQUENCIA,VARIAVELNUMDIAS, VARIAVELPERCADIC)    ');
    Add('                                                ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                                       ');
    Add('                                                                ');
    Add(' - ANOMESREF                                                    ');
    Add('    Ano/Mês no qual se deseja verificar o adicional.            ');
    Add(' - TIPO_ADICIONAL                                               ');
    Add('    T : ATS                                                     ');
    Add('    P : Periculosidade                                          ');
    Add('    I : Insalubridade                                           ');
    Add('    C : Adicional Compensatório  (Primeiro Percentual)          ');
    Add('    N : Adicional Noturno                                       ');
    Add(' - SEQUENCIA                                                    ');
    Add('    Indica se o adicional desejado é o primeiro ( 1 ), segundo ( 2 ), terceiro ( 3 ), etc. ');
    Add(' - VARIAVELNUMDIAS                                      ');
    Add('    Variável na qual será retornado o número de dias em que o participante ficou ');
    Add('    na sequência indicada.');
    Add(' - VARIAVELPERCADIC                                      ');
    Add('    Variável na qual será retornado o percentual/valor do adicional que o ');
    Add('    participante possuia na sequência indicada.');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcEvolFuncBUSCAPCS(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  
  dedMemo.Text := dedMemo.Text + 'BUSCAPCS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  // Mostra Descricao da Formula
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO');
     Add('  Retornar o Plano de Cargos e Salários que pertence um cargo, ou um participante     ');                                                                         
     Add('--------------------------------------------------------------------------------      ');
     Add('SINTAXE:                                                                              ');
     Add('                                                                                      ');
     Add('  BUSCAPCS(TipoDeBusca, CodigoCargo<opcional>)                                        ');
     Add('                                                                                      ');
     Add('--------------------------------------------------------------------------------      ');
     Add('DESCRICAO DOS PARAMETROS:                                                             ');
     Add('  - TIPO                                                                              ');
     Add('    Indica o tipo de busca a ser executada.                                           ');
     Add('    C : busca por cargo                                                               ');
     Add('    P : busca por participante                                                        ');
     Add(' ');
     Add('  - CODIGOCARGO                                                                       ');
     Add('    Indica o código do cargo desejado. Preencher apenas para o caso de busca tipo C.  ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcEvolFuncVALORCF(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  
  dedMemo.Text := dedMemo.Text + 'VALORCF(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);


  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar o valor de um CARGO/FUNCAO de um participante em uma determinada data. ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('                                                                                 ');
    Add('  VALORCF(TIPO, DATAREF)                                                         ');
    Add('                                                                                 ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                                                        ');
    Add('                                                                                 ');
    Add(' - TIPO                                                                          ');
    Add('    Indica se deseja buscar o valor do CARGO(C) ou FUNCAO(F)                     ');
    Add(' - DATAREF                                                                       ');
    Add('    Data na qual se deseja buscar o valor do CARGO/FUNCAO                        ');
    Add('                                                                                 ');
    Add('-------------------------------------------------------------------------------- ');
    Add('OBSERVACAO:                                                                      ');
    Add('                                                                                 ');
    Add('  1. Esta fórmula busca o CARGO/FUNCAO que o participante ocupava na data indicada ');
    Add('     e, com este CARGO/FUNCAO, busca o seu valor na tabela de CARGOS/FUNÇÕES.     ');

  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcEvolFuncCFPESSOA(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CFPESSOA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar o Código de um Cargo, Função ou Função do Adicional Compensatório            ');
    Add('  (VARIAVELRETORNO1) e o número de dias que o mesmo ocorreu no mês da data de           ');
    Add('  referência para um determinada pessoa (VARIAVELRETORNO2),se existir no mês algum      ');
    Add('  cargo/função com a sequência indicada e o modo do cargo/função (VARIAVELRETORNO3).    ');
    Add('-------------------------------------------------------------------------------------   ');
    Add('EXEMPLO:                                                                                ');
    Add('                                                                                        ');
    Add(' CFPESSOA(DATAREF,TIPO,SEQUENCIA,VARIAVELRETORNO1,VARIAVELRETORNO2,VARIAVELDERETORNO3)  ');
    Add('                                                                                        ');
    Add('-------------------------------------------------------------------------------------   ');
    Add('DESCRICAO DOS PARAMETROS:                                                               ');
    Add('                                                                                        ');
    Add('- DATAREF                                                                               ');
    Add('  Indica a data de referência que se deseja verificar.                                  ');
    Add('- TIPO                                                                                  ');
    Add('  Indica o tipo de item de cálculo do PCS que se está calculando.                       ');
    Add('  (C - Cargo, F - Função, AC - Adicional Compensatório  (Primeiro Percentual))          ');
    Add('- SEQUENCIA                                                                             ');
    Add('  Indica a sequencia que se deseja verificar, ou seja, se é o primeiro cargo do mês (1) ');
    Add('  se é o segundo cargo do mês (2).                                                      ');
    Add('- VARIAVELRETORNO1                                                                      ');
    Add('  Variavel que retornará o cargo/nivel ou o grupo/função encontrado.                    ');
    Add('- VARIAVELRETORNO2                                                                      ');
    Add('  Variavel que retornará o número de ocorrências encontrado.                            ');
    Add('- VARIAVELRETORNO3 [opcional]                                                           ');
    Add('  Variavel que retornará o modo do cargo/função.                                        ');
  end;

end;

procedure TfrmCadFormulas.fcEvolFuncGRUPOPESSOA(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'GRUPOPESSOA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: GRUPOPESSOA(DATAREF)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Esta fórmula irá retornar o código do grupo de função no qual se encontra ');
  memDesc.Lines.Add('ou encontrava uma pessoa em uma determinada data.');
end;

procedure TfrmCadFormulas.fcEvolFuncNIVELPESSOA(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NIVELPESSOA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: NIVELPESSOA(DATAREF)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Esta fórmula irá retornar o código do nível de cargo no qual se encontra ');
  memDesc.Lines.Add('ou encontrava uma pessoa em uma determinada data.');
end;

procedure TfrmCadFormulas.fcEvolFuncNUMDIASADICIONAL(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMDIASADICIONAL('; 
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar o número de dias no mês indicado que o participante teve um          ');
    Add('  determinado adicional.                                                        ');
    Add('--------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                        ');
    Add('                                                                                ');
    Add('  NUMDIASADICIONAL(ANOMESREF, TIPO_ADICIONAL)                                   ');
    Add('                                                                                ');
    Add('--------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                       ');
    Add('                                                                                ');
    Add(' - ANOMESREF                                                                    ');
    Add('    Ano/Mês no qual se deseja calcular o número de dias doo adicional.          ');
    Add(' - TIPO_ADICIONAL                                                               ');
    Add('    T : ATS                                                                     ');
    Add('    P : Periculosidade                                                          ');
    Add('    I : Insalubridade                                                           ');
    Add('--------------------------------------------------------------------------------');
    Add('OBSERVACAO :                                                                    ');
    Add('                                                                                ');
    Add(' Caso a fórmula não encontre nenhum adicional ela retornará o valor ZERO.       ');
  end;
end;

procedure TfrmCadFormulas.fcOpcoesNUMDIASPERCADICIONAL(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMDIASPERCADICIONAL(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar o número de dias no mês indicado que o participante teve um           ');
    Add('  determinado adicional, com o percentual indicado                               ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('                                                                                 ');
    Add('  NUMDIASPERCADICIONAL(ANOMESREF, TIPO_ADICIONAL, PERCENTUAL)                           ');
    Add('                                                                                 ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                                                        ');
    Add('                                                                                 ');
    Add(' - ANOMESREF                                                                     ');
    Add('    Ano/Mês no qual se deseja calcular o número de dias do adicional.            ');
    Add(' - TIPO_ADICIONAL                                                               ');
    Add('    T : ATS                                                                     ');
    Add('    P : Periculosidade                                                          ');
    Add('    I : Insalubridade                                                           ');
    Add(' - PERCENTUAL                                                                    ');
    Add('    Percentual que se deseja procurar para calcular o número de dias do adicional.');
    Add('-------------------------------------------------------------------------------- ');
    Add('OBSERVAÇÕES :                                                                    ');
    Add('                                                                                 ');
    Add(' 1. Caso a fórmula não encontre nenhum adicional ela retornará o valor ZERO.     ');
    Add(' 2. A diferença desta fórmula para a NUMDIASADICIONAL é que nesta deve ser informado ');
    Add('    também o percentual a ser procurado. ');

  end;

end;

procedure TfrmCadFormulas.fcEvolFuncPERCENTUALFUNCAO(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;

  dedMemo.Text := dedMemo.Text + 'PERCENTUALFUNCAO('; 
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar o percentual de função que o participante possuia em uma determinada    ');
    Add('  data.                                                                            ');
    Add('--------------------------------------------------------------------------------   ');
    Add('EXEMPLO:                                                                           ');
    Add('                                                                                   ');
    Add('  PERCENTUALFUNCAO(DATAREF, COD_FUNCAO)                                            ');
    Add('                                                                                   ');
    Add('--------------------------------------------------------------------------------   ');
    Add('DESCRICAO DOS PARAMETROS:                                                          ');
    Add('                                                                                   ');
    Add(' - DATAREF                                                                         ');
    Add('   Data na qual se deseja verificar o percentual.                                 ');
    Add(' - COD_FUNCAO                                                                      ');
    Add('   Código da função desejada.                                                      ');
  end;
end;

//******************************************************************************
// Formula "TOTALCFMES", Soma dos valores de um Cargo/Funcao em um Mes
procedure TfrmCadFormulas.fcEvolFuncTOTALCFMES(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
// Inclui Formula nos Campos
  dEdMemo.Text := dEdMemo.Text + 'TOTALCFMES(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dEdMemo.Text;
  Inc(ContParent);
// Mostra Descricao da Formula
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO');
     Add('  Retornar a soma dos valores de todos os CARGOS/FUNCAO em um determinado mês.   ');
     Add('-------------------------------------------------------------------------------- ');
     Add('EXEMPLO:                                        ');
     Add('                                                ');
     Add('  TOTALCFMES(C,12/01/2000)                      ');
     Add('                                                ');
     Add('    TIPO: CARGO, DATA DE REFERENCIA: 12/01/2000 ');
     Add('-------------------------------------------------------------------------------- ');
     Add('DESCRICAO DOS PARAMETROS:                           ');
     Add('                                                    ');
     Add(' - TIPO (C OU F)                                    ');
     Add('    Indica se a Fórmula processará CARGOS (C) ou FUNÇÕES (F).');
     Add('                                                    ');
     Add(' - DATAREF                                          ');
     Add('    Data para busca do valor do Cargo/Funcao.       ');
     Add('      Obs.: Ano com 4 digitos.                      ');
     Add('            Fórmula utilizará o ano/mês desta data. ');
     Add('-------------------------------------------------------------------------------- ');
     Add('OBSERVACAO:                                                                      ');
     Add('                                                                                 ');
     Add('  O valor do CARGO/FUNÇÃO nesta fórmula é buscado da tabela de CARGOS/FUNÇÃO     ');
     Add('  e NÃO do HISTÓRICO FUNCIONAL.                                                  ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcEvolFuncVERFUNCAOPCC(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  
  dedMemo.Text := dedMemo.Text + 'VERFUNCAOPCC(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar se uma determinada FUNCAO percetence a um PCC.                        ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('                                                                                 ');
    Add('  VERFUNCAOPCC( CODIGOFUNCAO )                                                   ');
    Add('                                                                                 ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                                                        ');
    Add('                                                                                 ');
    Add(' - CODIGOFUNCAO                                                                  ');
    Add('    Indica o codigo da função que se deseja verificar.                           ');
    Add('                                                                                 ');
    Add('-------------------------------------------------------------------------------- ');
    Add('OBSERVACAO:                                                                      ');
    Add('                                                                                 ');
    Add('  Para buscar o código da FUNCAO que o participante ocupou em uma determinada    ');
    Add('  data utilize a fórmula CFMES                                                   ');
  end;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList4Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  
  dedMemo.Text := dedMemo.Text + 'REAJUSTAINSS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('OBJETIVO');
  memDesc.Lines.Add('  Reajustar um valor informado de acordo com as regras do INSS. ');
  memDesc.Lines.Add('-------------------------------------------------------------------------------- ');
  memDesc.Lines.Add('EXEMPLO:                                        ');
  memDesc.Lines.Add('                                                ');
  memDesc.Lines.Add('  REAJUSTAINSS( VALOR, SIGLAINDICE, DATAINICIO, DATAFINAL)  ');
  memDesc.Lines.Add('                                                ');
  memDesc.Lines.Add('-------------------------------------------------------------------------------- ');
  memDesc.Lines.Add('DESCRICAO DOS PARAMETROS:                          ');
  memDesc.Lines.Add('                                                   ');
  memDesc.Lines.Add(' - VALOR                                           ');
  memDesc.Lines.Add('   Valor a ser reajustado.                         ');
  memDesc.Lines.Add(' - SIGLAINDICE                                     ');
  memDesc.Lines.Add('   Sigla do indice a ser utilizado para o reajuste ');
  memDesc.Lines.Add(' - DATAINICIO                                      ');
  memDesc.Lines.Add('   Data para inicio do reajuste.                   ');
  memDesc.Lines.Add(' - DATAFINAL                                       ');
  memDesc.Lines.Add('   Data final para o reajuste.                     ');
  memDesc.Lines.Add('-------------------------------------------------------------------------------- ');
  memDesc.Lines.Add('OBSERVACAO:                                        ');
  memDesc.Lines.Add('   Esta formula processa o reajuste da seguinte forma : ');
  memDesc.Lines.Add('   . no 1o. mês, utiliza o indice com Mes de Referência igual ');
  memDesc.Lines.Add('     ao mês da data de início;                                ');
  memDesc.Lines.Add('   . do 2o. mês até o mês da data final, utiliza o índice da  ');
  memDesc.Lines.Add('     data da cotação do mês anterior.                         ');

end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items16Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  // Inclui Formula nos Campos
  dEdMemo.Text := dEdMemo.Text + 'FREQSALARIO('; 
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dEdMemo.Text;
  Inc(ContParent);
  // Mostra Descricao da Formula
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO');
     Add('  Retornar a soma de salários que atendam a uma determinada condição,   ');
     Add('  e a frequência com que esta condição é atendida, em um determinado mês.');
     Add('--------------------------------------------------------------------------------   ');
     Add('SINTAXE:                                                                           ');
     Add('                                                                                   ');
     Add(' FREQSALARIO([RUBRICAS_A_CONSIDERAR], ANO/MES INICIO, ANO/MES FINAL,               ');
     Add('             OPERADOR_CONDICAO, VALOR_CONDICAO, VAR_RETORNO_SOMA,                  ');
     Add('             VAR_RETORNO_FREQ)                                                     ');
     Add('                                                                                   ');
     Add('--------------------------------------------------------------------------------   ');
     Add('EXEMPLO :                                                                          ');
     Add('                                                                                   ');
     Add(' FREQSALARIO( [''5001'',''5002'',''5003''],2000/01,2000/05,<=,1000,@SOMA,@FREQ )   ');
     Add('                                                                                   ');
     Add('  De acordo com este exemplo a fórmula irá retornar a SOMA e a FREQUENCIA de       ');
     Add('  todas as rubricas 5001, 5002 e 5003 entre o mês de janeiro e maio de 2000, que   ');
     Add('  tenham sido menores ou iguais a R$ 1.000,00.                                     ');
     Add('--------------------------------------------------------------------------------   ');
     Add('DESCRICAO DOS PARAMETROS:                                                          ');
     Add('                                                                                   ');
     Add(' - RUBRICAS_A_CONSIDERAR                                                           ');
     Add('   Código das rubricas que devem ser consideradas.                                 ');
     Add('   FORMATO : O grupo de códigos deve estar entre colchetes, com cada código entre ''');
     Add('             e separado por vírgula.                                                ');
     Add(' - ANO/MES INICIO                                                                  ');
     Add('   Ano/Mês de referência do inicio do periodo a processar.                         ');
     Add('   FORMATO : AAAA/MM                                                               ');

     Add(' - ANO/MES FINAL                                                                   ');
     Add('   Ano/Mês de referência do final do periodo a processar.                          ');
     Add('   FORMATO : AAAA/MM                                                               ');

     Add(' - OPERADOR_CONDICAO                                                               ');
     Add('   Operador de condição para ser considerada na busca.                             ');
     Add('   Os operadores válidos são : >, >=, <, <=, =, <>.                                ');

     Add(' - VALOR_CONDICAO                                                                  ');
     Add('   Valor a ser considerado na condição da busca em conjunto com o operador.        ');
     Add('   Deve ser um valor numérico.                                                     ');

     Add(' - VAR_RETORNO_SOMA                                                                ');
     Add('   Variável na qual será retornada a soma das rubricas encontradas na busca.       ');

     Add(' - VAR_RETORNO_FREQ                                                                ');
     Add('   Variável na qual será retornada a frequência das rubricas encontradas na busca. ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOpcoesCPASSIST(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  
  dedMemo.Text := dedMemo.Text + 'CPASSIST(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  // Mostra Descricao da Formula
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO');
     Add('  Retornar o valor de uma ou mais contribuições de ASSISTIDO para uma data e processo ');
     Add('  indicados.                                                                          ');
     Add('--------------------------------------------------------------------------------      ');
     Add('SINTAXE:                                                                              ');
     Add('                                                                                      ');
     Add('  CPASSIST("Contribuicoes", NumeroProcesso, AnoMesReferencia)                    ');
     Add('                                                                                      ');
     Add('--------------------------------------------------------------------------------      ');
     Add('DESCRICAO DOS PARAMETROS:                                                             ');
     Add('  - CONTRIBUICOES                                                                     ');
     Add('    Código das contribuições que se deseja buscar. O valor retornado será a soma      ');
     Add('    das contribuições indicadas neste campo.                                          ');
     Add('    separadas por virgula. Ex.: "40,38,39"                                            ');
     Add(' ');
     Add('  - NUMEROPROCESSO                                                                    ');
     Add('    Número do Processo ao qual estão associadas as contribuições que se deseja buscar.');
     Add(' ');
     Add('  - ANOMESREFERENCIA                                                                    ');
     Add('    Ano/Mês na qual se deseja buscar as contribuições.                                   ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcEvolFuncMAIORCF(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  
  dedMemo.Text := dedMemo.Text + 'MAIORCF(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);


  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar o valor do MAIOR CARGO/FUNCAO na tabela de CARGOS e FUNÇÕES           ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('                                                                                 ');
    Add('  MAIORCF(TIPO, DATAREF, INDICADOR_PCC )                                          ');
    Add('                                                                                 ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                                                        ');
    Add('                                                                                 ');
    Add(' - TIPO                                                                          ');
    Add('    Indica se deseja buscar o valor do CARGO(C) ou FUNCAO(F)                     ');
    Add(' - DATAREF                                                                       ');
    Add('    Data na qual se deseja buscar o valor do CARGO/FUNCAO                        ');
    Add(' - INDICADOR_PCC                                                                 ');
    Add('    Indicador de se o cargo/função deve pertencer ao PCC ou não.                 ');
    Add('    S - Sim, cargo/função deve pertencer ao PCC                                  ');
    Add('    N - Não, cargo/função não deve pertencer ao PCC                              ');
    Add('    I - Fazer a busca INDEPENDENTE de perterncer ou não ao PCC                   ');
    Add('                                                                                 ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;

procedure TfrmCadFormulas.fcDataCONVERTEDATA(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  
  dedMemo.Text := dedMemo.Text + 'CONVERTEDATA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);


  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Converter uma data para um formato indicado como parâmetro                     ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('                                                                                 ');
    Add('  CONVERTEDATA( DATA, FORMATO )                                                  ');
    Add('                                                                                 ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                                                        ');
    Add('                                                                                 ');
    Add(' - DATA                                                                          ');
    Add('    Indica a dataa a ser convertida                                              ');
    Add(' - FORMATO                                                                       ');
    Add('    Indica o formato no qual se deseja converter a data. Os formatos permitidos são : ');
    Add('    AAAA/MM                                                                      ');
    Add('    MM/AAAA                                                                      ');
    Add('    MM/DD/AAAA                                                                   ');
    Add('                                                                                 ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;

procedure TfrmCadFormulas.fcEvolFuncBUSCAFUNCAOADICCOMP(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  
  dedMemo.Text := dedMemo.Text + 'BUSCAFUNCAOADICCOMP(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Buscar a função correspondente a um Adicional Compensatório em uma determinada data ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('                                                                                 ');
    Add('  BUSCAFUNCAOADICCOMP (DATAREF)                                                  ');
    Add('                                                                                 ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                                                        ');
    Add('                                                                                 ');
    Add(' - DATAREF                                                                          ');
    Add('    Indica a data na qual se deseja verificar o Adicional Compensatório e buscar sua ');
    Add('    função correspondente.                                                           ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;


{ QTDMINUTOS }
procedure TfrmCadFormulas.fcOpcoesOutlookList1Items14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'QTDMINUTOS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Buscar a quantidade de minutos para o Adicional Noturno ocorridos entre duas   ');
    Add('  datas.                                                                         ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('                                                                                 ');
    Add('  QTDMINUTOS(DATAMAIOR, DATAMENOR, TIPOANO)                                      ');
    Add('                                                                                 ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                                                        ');
    Add('                                                                                 ');
    Add(' - DATAMAIOR                                                                     ');
    Add('    Indica a data de inicio da pesquisa.                                         ');
    Add(' - DATAMENOR                                                                     ');
    Add('    Indica a data de fim da pesquisa.                                            ');
    Add(' - TIPOANO                                                                       ');
    Add('    "Tipo" de Ano usado no processo;                                             ');
    Add('      C - 360 dias (Ano comercial)                                               ');
    Add('      A - 365 dias (Ano calendário)                                              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ PARCANTEP }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items20Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PARCANTEP';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Buscar o valor original da parcela imediatamente anterior à de referencia.     ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('                                                                                 ');
    Add('  PARCANTEP                                                                      ');
    Add('                                                                                 ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ SOMARUBRICA }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items18Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SOMARUBRICA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar a soma de rubricas, que pertençam a um mesmo grupo, e  que atendam     ');
    Add('  a uma determinada condição,   e a frequência com que esta condição é            ');
    Add('  atendida, em um determinado mês.                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  SOMARUBRICA([CÓDIGO_DO_GRUPO,INDICE,...], DATA DE INICIO, NUMMESESPESQUISA,     ');
    Add('              FLGGRAVACAO, INDICETETO, PESQUISACONTINUA, LIMITEPESQUISA )                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  SOMARUBRICA([1,@INPC],01/01/2001,12,1,@INPC,0,0)                                   ');
    Add('  De acordo com este exemplo a fórmula irá retornar a SOMA das rubricas que       ');
    Add('  estejam contidas em um mesmo grupo apartir do mês de janeiro de 2001.           ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - CODIGO_DO_GRUPO                                                               ');
    Add('    Código do grupo das rubricas que devem ser consideradas.                      ');
    Add('      FORMATO : O grupo de códigos deve estar entre colchetes, com cada código    ');
    Add('                entre '''' (pilcs) e separado por vírgula.                        ');
    Add('  - INDICE                                                                        ');
    Add('    Indica o Indice, previamente cadastrado como Moeda que irá indexar estas      ');
    Add('  - DATA DE INICIO                                                                ');
    Add('    Data de referência do inicio do periodo a processar.                          ');
    Add('    Formato : DD/MM/AAAA                                                          ');
    Add('  - FLGGRAVACAO                                                                   ');
    Add('    0 - Não Grava variaveis de retorno na Memória de Cálculo.                     ');
    Add('    1 - Grava variaveis de retorno na Memória de Cálculo.                         ');
    Add('  - INDICETETO (OPCIONAL)                                                         ');
    Add('    Sigla da Moeda usada como teto das rubricas.                                  ');
    Add('    Busca indice no mesmo periodo indicado para calculo.                          ');
    Add('  - PESQUISACONTINUA                                                              ');
    Add('    Indica se a pesquisa continuará caso os NUMMESESPESQUISA não tenham sido pree-');
    Add('    chidos no perido pesquisado inicalmente.                                      ');
    Add('    0 - Pesquisa apenas em NUMMENESPESQUISA.                                      ');
    Add('    1 - Continua retroagindo até preencher os NUMMENESPESQUISA.                   ');
    Add('  - LIMITEPESQUISA                                                                ');
    Add('    Indica o número limite de meses a retroagir a pesquisa.                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ MEDIARUBRICA }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items19Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MEDIARUBRICA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                       ');
    Add('  Retornar a Medias das Rubricas do(s) grupos(s) desejados.                    ');
    Add('-------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                       ');
    Add('  MEDIARUBRICA([CÓDIGO_DO_GRUPO,INDICEGRUPO,....], DATA DE INICIO,             ');
    Add('               NUMMESESPESQUISA, NUMMESESMEDIA, FLGGRAVACAO, INDICETETO)       ');
    Add('-------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                       ');
    Add('                                                                               ');
    Add('  MEDIARUBRICA( [''1'',@INPC],01/06/2001,12,60,0 )                             ');
    Add('  De acordo com este exemplo a fórmula irá retornar a SOMA das rubricas que    ');
    Add('  estejam contidas em um mesmo grupo entre o mês de janeiro e maio de 2000.    ');
    Add('-------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                      ');
    Add('                                                                               ');
    Add(' - CODIGO_DO_GRUPO                                                             ');
    Add('   Código do grupo das rubricas que devem ser consideradas.                    ');
    Add('     FORMATO : O grupo de códigos deve estar entre colchetes, com cada código  ');
    Add('               entre '''' (pilcs) e separado por vírgula.                      ');
    Add(' - INDICE                                                                      ');
    Add('   Indica o Indice, previamente cadastrado como Moeda que irá indexar estas    ');
    Add(' - DATA DE INICIO                                                              ');
    Add('   Data de referência do inicio do periodo a processar.                        ');
    Add('   FORMATO : DD/MM/AAAA                                                        ');
    Add(' - NUMMESESPESQUISA                                                            ');
    Add('   Numero de meses para pesquisar a existencia da rubrica.                     ');
    Add(' - NUMMESESMEDIA                                                               ');
    Add('   Numero de meses para processo da Média.                                     ');
    Add(' - FLGGRAVACAO                                                                 ');
    Add('   0 - Não Grava variaveis de retorno na Memória de Cálculo.                   ');
    Add('   1 - Grava variaveis de retorno na Memória de Cálculo.                       ');
    Add(' - INDICETETO (OPCIONAL)                                                       ');
    Add('   Sigla da Moeda usada como teto das rubricas.                                ');
    Add('   Busca indice no mesmo periodo indicado para calculo.                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ CFPBC }
procedure TfrmCadFormulas.fcOpcoesOutlookList1Items15Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CFPBC(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                      ');
    Add('  Retornar o valor médio do Cargo/Função apurado em um prazo determinado.      ');
    Add('-------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                       ');
    Add('  CFPBC(DATAREF, PRAZO, TIPO, FLGGRAVACAO, [ANOMESRETORNO1, VALORRETORNO1,     ');
    Add('                                            ANOMESRETORNO2, VALORRETORNO2,...])');
    Add('-------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                       ');
    Add('  CFPBC(DATA,12,C,0, [@ANOMES1, @VAL1, @ANOMES2, @VAL2, @ANOMES3, @VAL3,       ');
    Add('                      @ANOMES4, @VAL4, @ANOMES5, @VAL5, @ANOMES6, @VAL6,       ');
    Add('                      @ANOMES7, @VAL7, @ANOMES8, @VAL8, @ANOMES9, @VAL9,       ');
    Add('                      @ANOMES10,@VAL10,@ANOMES11,@VAL11,@ANOMES12,@VAL12])     ');
    Add('  De acordo com este exemplo a fórmula irá retornar a composição para 12 meses,');
    Add(' retornando todas as variáveis do prazo                                        ');
    Add('-------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                      ');
    Add(' - DATAREF                                                                     ');
    Add('   Data de referência do inicio do periodo a processar.                        ');
    Add('   FORMATO : DD/MM/AAAA                                                        ');
    Add(' - PRAZO                                                                       ');
    Add('   Prazo em meses a processar.                                                 ');
    Add(' - TIPO                                                                        ');
    Add('   C - Cargo                                                                   ');
    Add('   F - Função                                                                  ');
    Add('   A - Adicional Compensatório                                                 ');
    Add(' - FLGGRAVACAO                                                                 ');
    Add('   0 - Não Grava variaveis de retorno na Memória de Cálculo.                   ');
    Add('   1 - Grava variaveis de retorno na Memória de Cálculo.                       ');
    Add(' - VARIAEVIS DE RETORNO (OPCIONAL)                                             ');
    Add('   Grupos de ANOMES, VALOR                                                     ');

  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;

{ FERIADO }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items19Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'FERIADO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna True se a Data de referência for ferado ou False caso contrário.        ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  FERIADO(DATAREF,TIPOFERIADO)                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  FERIADO(01/05/2001,0);                                                          ');
    Add('  De acordo com este exemplo a fórmula irá retornar True se for feriado ou False  ');
    Add('  caso não seja.                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência do processo, formato DD/MM/YYYY.                           ');
    Add('  - TIPOFERIADO (OPCIONAL) leia observação.                                       ');
    Add('    Indica o tipo de calculo a ser utilizado.                                     ');
    Add('      0 - Feriados Calendario CM (default).                                       ');
    Add('      1 - Feriados Calendario CM Invest.                                          ');
    Add('  - TIPOINVESTIMENTO (opcional)                                                   ');
    Add('    Indica o tipo de Investimento a ser utilizado.                                ');
    Add('      1         - Renda Fixa                                                      ');
    Add('      2         - Renda Variável                                                  ');
    Add('      5         - Fundo de Renda Fixa                                             ');
    Add('      6         - Fundo de Renda Variável                                         ');
    Add('      7         - Fundo Imobiliário                                               ');
    Add('      8         - BM&F                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVACAO :                                                                      ');
    Add('  Anos das datas com 4 digitos.                                                   ');
    Add('  Os campos IDPAIS, IDCIDADES e CODESTADO devem estar na consulta de entrada.     ');
    Add('  No caso de TIPOCALCULO 1 a pesquisa será feita nas tabelas do Investimento.     ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ FUNDATAFINAL }
procedure TfrmCadFormulas.fcOpcoesOutlookList1Items16Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'FUNDATAFINAL(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                      ');
    Add('  Retorna a DATA FINAL do Cargo, Função ou Adicional Compensatório.            ');
    Add('-------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                       ');
    Add('  FUNDATAFINAL(CODIGO, TIPO)                                                   ');
    Add('-------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                       ');
    Add('  FUNDATAFINAL(1000, F)                                                        ');
    Add('  De acordo com este exemplo a fórmula irá retornar .....                      ');
    Add('-------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                      ');
    Add(' - CODIGO                                                                      ');
    Add('   Código a Pesquisar                                                          ');
    Add(' - TIPO                                                                        ');
    Add('   C - Cargo                                                                   ');
    Add('   F - Função                                                                  ');
    Add('   A - Adicional Compensatório                                                 ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ PERCFUNPBC }
procedure TfrmCadFormulas.fcOpcoesOutlookList1Items17Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PERCFUNPBC(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                      ');
    Add('  Retorna os percentuais, códigos e modos para cada função (inclusive AC)      ');
    Add('  encontrada no periodo do cálculo do PBC.                                     ');
    Add('  Nas 3 variaveis de Retorno, preenche os 3 primeiros grupos de dados.         ');
    Add('-------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                       ');
    Add('  PERCFUNPBC(DATA, PERIODO, TIPO, VARGRUPO1, VARGRUPO2, VARGRUPO3)             ');
    Add('-------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                       ');
    Add('                                                                               ');
    Add('  PERCFUNPBC(01/10/2001,365,F,@GRUPO1,@GRUPO2,@GRUPO3)                         ');
  Add('-------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                      ');
    Add('                                                                               ');
    Add(' - DATA                                                                        ');
    Add('   Data de Referencia                                                          ');
    Add(' - PERIODO                                                                     ');
    Add('   Periodo a Processar                                                         ');
    Add(' - TIPO                                                                        ');
    Add('   C - Cargo                                                                   ');
    Add('   F - Função                                                                  ');
    Add('   A - Adicional Compensatório                                                 ');
    Add(' - VARGRUPO#                                                                   ');
    Add('   Variaveis de Retorno dos 3 primeiros grupos.                                ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ VLRBENEFICIO }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items21Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRBENEFICIO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor integral do beneficio em um determinado MES/ANO.                ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VLRBENEFICIO(MESANO,BENEFICIO, MESIGUALREFERENCIA)                              ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VLRBENEFICIO(10/1994,4,0)                                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - MESANO                                                                        ');
    Add('    MesAno de referência. Formato MM/AAAA                                         ');
    Add('  - BENEFICIO                                                                     ');
    Add('    Numero do Beneficio a pesquisar (IDBENEFICIO).                                ');
    Add('  - MESIGUALREFERENCIA (opcional)                                                 ');
    Add('    Indica se o Mês da consula deve ser igual ao Mês de Referencia.               ');
    Add('      0 - Não iguala os meses (defaut)                                            ');
    Add('      1 - Iguala meses                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Caso o parametro BENEFICIO esteja vazio, a formula retorna a soma dos beneficios');
    Add('  no mês.                                                                         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ BUSCAMATRICULA }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items22Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCAMATRICULA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                      ');
    Add('  Retorna a Matricula de uma pessoa.                                           ');
    Add('-------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                       ');
    Add('  BUSCAMATRICULA                                                               ');
    Add('-------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                       ');
    Add('                                               `                               ');
    Add('  BUSCAMATRICULA                                                               ');
    Add('-------------------------------------------------------------------------------');
    Add('OBS:                                                                           ');
    Add('                                                                               ');
    Add(' Pessoa a pesquisar será definida pelo campo IDPESSOA da Consulta de Entrada da');
    Add(' Regra ou pelos Dados Auxiliares da Regra (Views).                             ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList4Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TEMPOFUNDACAO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                      ');
    Add('  Retorna o que o participante possui na Fundação.                             ');
    Add('-------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                       ');
    Add('  TEMPOFUNDACAO(DATAREF,FLGPLANO,FLGCANCELAMENTO)                              ');
    Add('-------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                       ');
    Add('                                               `                               ');
    Add('  TEMPOFUNDACAO(01/10/2001,S,N)                                                ');
    Add('-------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                      ');
    Add('                                                                               ');
    Add(' - DATAREF                                                                     ');
    Add('   Data de Referencia do Processo (DD/MM/YYYY)                                 ');
    Add(' - FLGPLANO                                                                    ');
    Add('   S - Considera todos os Planos.                                              ');
    Add('   N - Considera apenas o último plano.                                        ');
    Add(' - FLGCANCELAMENTO                                                             ');
    Add('   S - Considera os cancelamentos.                                             ');
    Add('   N - Não considera os cancelamentos.                                         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOpcoesOutlookList1Items18Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRCF(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                      ');
    Add('  Retorna o valor do Cargo/Função passando-se o Código do mesmo.               ');
    Add('-------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                       ');
    Add('  VLRCF(CODIGO, TIPO)                                                          ');
    Add('-------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                       ');
    Add('                                                                               ');
    Add('  VLRCF(@CODIGO, F)                                                            ');
    Add('-------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                      ');
    Add('                                                                               ');
    Add(' - CODIGO                                                                      ');
    Add('   Código do Cargo/Função a pesquisar.                                         ');
    Add(' - TIPO                                                                        ');
    Add('   C - Cargo.                                                                  ');
    Add('   F - Função.                                                                 ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ VALORRESERVA }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items23Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VALORRESERVA(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor de uma reserva especifica para determinado paticipante.         ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VALORRESERVA(CODHIERARQUIA,DATAREF,TIPO DE RESULTADO, CAMPO PESQUISA)           ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VALORRESERVA(0101001,01/01/2002,1,0)                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                         ');
    Add(' - CODHIERARQUIA                                                                  ');
    Add('   Número de proventos que deseja calcular a mádia.                               ');
    Add(' - DATAREF                                                                        ');
    Add('   Data de Referencia,(DD/MM/YYYY).                                               ');
    Add(' - TIPO DE RESULTADO                                                              ');
    Add('   Define o tipo de Resultado.                                                    ');
    Add('     0 - Resultado em Cotas.                                                      ');
    Add('     1 - Resultado em Real.                                                       ');
    Add('       Obs: Caso o resultado seja em Real, é necessario informar o campo          ');
    Add('            INDICEREAJ no SQL de entrada da Regra com o código do inice a         ');
    Add('            utilizar para conversão.                                              ');
    Add(' - CAMPO PESQUISA                                                                 ');
    Add('   Define campo que será utilizado na pesquisa aos dados.                         ');
    Add('     0 - IDPESSOA (default)                                                       ');
    Add('     1 - IDTITULAR                                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVACAO:                                                                       ');
    Add('   Caso valores não sejam encontrados no banco de dados,                          ');
    Add('   a fórmula retorna 0 (zero)                                                     ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { VALORRESERVA }

{ PLANOANTERIOR }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items24Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PLANOANTERIOR(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o Plano e a Data de Incrição anterior ao plano atual de um participante.');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  PLANOANTERIOR(@VARPLANO, @VARDATAINSCRICAO)                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  PLANOANTERIOR(@PLANOANT, @DATAINSCANT)                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                         ');
    Add('  - VARPLANOANT                                                                   ');
    Add('    Variavél que irá receber o Identificador do plano anterior.                   ');
    Add('  - VARDATAINSCRICAO                                                              ');
    Add('    Variavél que irá receber a Data de Incrição do plano anterior.                ');
  end;
  MemDesc. Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ BUSCAPERCENTUAL }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items25Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCAPERCENTUAL(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o percentual de reajuste salarial praticado na patrocinadora.           ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  BUSCAPERCENTUAL(DATAREF)                                                        ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  BUSCAPERCENTUAL(15/07/2002)                                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                         ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ VLRCALCINSS }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList4Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRCALCINSS';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna valor calculado do INSS.                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VLRCALCINSS                                                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VLRCALCINSS                                                                     ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ DADOSPATROANT }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items26Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DADOSPATROANT(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna dados da patrocinadora anterior a atual de um participante.             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  DADOSPATROANT([VARIAVEL DE RETORNOn], [FLGCAMPOn])                              ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  DADOSPATROANT([@SITPATRO,@TEMPOSERVTOTAL],[1,4])                                ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                         ');
    Add('  - VARIAVEL DE RETORNOn                                                          ');
    Add('    Variáveis que irão receber os valores encontrados.                            ');
    Add('       Obs.: no máximo 7 separadas por virgula.                                   ');
    Add('  - FLGCAMPOn                                                                     ');
    Add('    Indicadores dos campos a serem retornados, conforme tabela;                   ');
    Add('      1 - Situação na patrocinadora         ( IDSITFUNC )                         ');
    Add('      2 - Data de admissão na patrocinadora ( DATAADMISSAO )                      ');
    Add('      3 - Tempo de serviço anterior         ( TEMPOSERVANTERIOR )                 ');
    Add('      4 - Tempo de Serviço total            ( TEMPOSERVTOTAL )                    ');
    Add('      5 - Valor Base 1                      ( VALORBASE1 )                        ');
    Add('      6 - Valor Base 2                      ( VALORBASE2 )                        ');
    Add('      7 - Valor Base 3                      ( VALORBASE3 )                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { DADOSPATROANT }


{ DADOSPATROANT }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items20Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CALCULASALPART(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o calculo do salário de participação utilizando para isto o indicador   ');
    Add('  "Compõe Salário de Participação"  do cadastro de rubricas onde o resultado será ');
    Add('  a soma dos proventos menos a soma dos descontos que estiverem com esta marcação.');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  CALCULASALPART(ANOMESREF)                                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  CALCULASALPART(2002/07)                                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                         ');
    Add('  - ANOMESREF                                                                     ');
    Add('    Ano/Mês de referência, formato YYYY/MM.                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SALPART }

procedure TfrmCadFormulas.fcOutlookBar1OutlookList3Items20Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin

  dedMemo.Text := dedMemo.Text + 'ENTREDATAS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('ENTREDATAS');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items21Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VALORSRB(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor do SRB em um determinado ANO/MES.                               ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VALORSRB(ANOMES,BENEFICIO)                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VALORSRB(1994/10,4)                                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - ANOMES                                                                        ');
    Add('    AnoMes de referência. Formato AAAA/MM                                         ');
    Add('  - BENEFICIO                                                                     ');
    Add('    Numero do Beneficio a pesquisar.                                              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;

procedure TfrmCadFormulas.fcOpcoesOutlookList1Items19Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCADETCALCULO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Busca dados na tabela de Detalhes de Cálculo das Regras, para a pessoa          ');
    Add('  sendo processada.                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  BUSCADETCALCULO(VALOR A PESQUISAR)                                              ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  BUSCADETCALCULO(#AD. INSALUBRIDADE MÉDIO)                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - VALOR A PESQUISAR                                                             ');
    Add('    Indica o valor que será pesquisado na tabela.                                 ');
    Add('    Obs.: Este valor será pesquisado no campo DESCRICAO da tabela de detalhes.    ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ SOMACONTRIB }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList5Items22Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'SOMACONTRIB(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Retornar a soma dos valores recebidos, de uma determinada contribuição gravada ');
    Add('  na HSTCONTRIBPREV, em determinado mês.                                         ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  SOMACONTRIB ([MOTIVO1, MOTIVO2,..], MESREFERENCIA, CODCONTRIBUICAO)            ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('  SOMACONTRIB ([3003], 2002/10, 1)                                               ');
    Add('  De acordo com este exemplo a fórmula irá retornar a SOMA das contribuições de  ');
    Add('  ativo (Identificador = 1), referentes ao mês de cobrança 2002/10.              ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - Motivo                                                                       ');
    Add('    Código do motivo a ser considerado na soma dos valores.                      ');
    Add('  - Mesreferencia                                                                ');
    Add('    O mês de referencia das contribuições a serem agrupadas, no formato AAAA/MM. ');
    Add('  - Codcontribuicao                                                              ');
    Add('    O identificador da contribuição, identificável através da tela Cadastro /    ');
    Add('    Contribuição ou Cadastro / Plano Previdenciário / Cadastro.                  ');
    Add('  - Flggravacao                                                                  ');
    Add('    0 - Não Grava variaveis de retorno na Memória de Cálculo.                    ');
    Add('    1 - Grava variaveis de retorno na Memória de Cálculo                         ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ SOMADIASBENEF }
procedure TfrmCadFormulas.fcOpcoesOutlookList4Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'SOMADIASBENEF(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Somar o número de dias que uma pessoa esteve em benefício dentro de um         ');
    Add('  determinado período de meses.                                                  ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  SOMADIASBENEF(DATAINICIAL, DATAFINAL)                                          ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('  SOMADIASBENEF(01/01/2001,31/12/2001)                                           ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - DATAINICIAL                                                                  ');
    Add('    Data de inicio do processo.                                                  ');
    Add('  - DATAFINAL                                                                    ');
    Add('    Data de fim do processo.                                                     ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SOMADIASBENEF }

{ SOMABENEFICIOS }
procedure TfrmCadFormulas.fcOutlookBar1OutlookList2Items27Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'SOMABENEFICIOS(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Somar os benefícios no período.                                                ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  SOMABENEFICIOS([IDBENEFICIO1,IDBENEFICIO2....]ANOMESINICIAL,ANOMESFINAL)       ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('  SOMABENEFICIOS([1001,1202],2001/01,2002/12)                                    ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - IDBENEFICIOn                                                                 ');
    Add('    Identificadores dos beneficios da pesquisa.                                  ');
    Add('      Obs.: Máximo de 30 Beneficios.                                                    ');
    Add('  - ANOMESINICIAL                                                                ');
    Add('    Data de inicio do processo.                                                  ');
    Add('  - ANOMESFINAL                                                                  ');
    Add('    Data de fim do processo.                                                     ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
{ SOMABENEFICIOS }

procedure TfrmCadFormulas.sbtnCopiarClick(Sender: TObject);
Var
  iTamanho : Integer;
  sIdFormula, sDescricao,
  sDescricaoAux, sExpressaoFormula, sExpressaoReal,
  sSQL : String;
begin
  inherited;
  if (Qry.IsEmpty) then begin
     MsgDlg('Não existe Fórmula para ser copiada.','Erro',mtConfirmation,[mbOk,mbHelp],0);
     sbtnCopiar.Down := False;
     Exit;
  end;
  if (Qry.State in [dsEdit, dsInsert]) then begin
     MsgDlg('Para copiar esta Fórmula confirme ou cancele a operação.','Erro',mtConfirmation,[mbOk,mbHelp],0);
     sbtnCopiar.Down := False;
     Exit;
  end;
  if MsgDlg('Deseja copiar esta Fórmula?','ATENÇÃO',mtConfirmation,[mbyes,mbno],0)=mrNo then
     Exit;

  sIdFormula := IntToStr(LeUltRegistro(NIL,'FORMULA'));
  iTamanho   := Qry.FieldbyName('DESCRICAOFORMULA').Size;

  { Gera novo nome, preocupando-se com o tamanho da string }
  sDescricaoAux := 'Cópia de '+Qry.FieldbyName('DESCRICAOFORMULA').AsString;
  if Length(sDescricaoAux) > iTamanho then
    sDescricaoAux := Copy(sDescricaoAux,1,iTamanho);
  sExpressaoFormula := Qry.FieldbyName('EXPRESSAOFORMULA').AsString;
  sExpressaoReal    := Qry.FieldbyName('EXPRESSAOREAL').AsString; 

  { Insere novo registro }
  sSQL := 'INSERT INTO FORMULA '+
          '  (IDFORMULA, DESCRICAOFORMULA, CODGRUPOFORMULA, EXPRESSAOFORMULA, EXPRESSAOREAL) '+
          'VALUES ('+sIdFormula                                             +','+
                     QuotedStr(sDescricaoAux)                               +','+
                     QuotedStr(Qry.FieldbyName('CODGRUPOFORMULA').AsString) +','+
                     QuotedStr(sExpressaoFormula)+','+
                     QuotedStr(sExpressaoReal)   +')';
  ExecutarQuery(QryAux, sSQL);
  
  msgdlg('Cópia OK','Mensagem',mtInformation,[mbok],0);
  sbtnCopiar.Down := False;
end; { Copia de Fórmula }

end.

{
         ONE
                  (METALLICA - Hetfield\Ulrich)

  I can't remember anything
  Can't tell if this is true or dream
  Deep down inside I feel to scream
  This terrible silence stops me

  Now that the war is through with me
  I'm waking up I can not see
  That there is not much left of me
  Nothing is real but pain now

  Hold my breath as I wish for death
  Oh please God, wake me

  Back in the womb its much too real
  In pumps life that I must feel
  But can't look forward to reveal
  Look to the time when I'll live

  Fed through the tube that sticks in me
  Just like a wartime novelty
  Tied to machines that make me be
  Cut this life off from me

  Hold my breath as I wish for death
  Oh please God, wake me

  Now the world is gone I'm just one
  Oh God, help me
  hold my breath as I wish for death
  Oh please God help me

  Darkness imprisoning me
  All that I see
  Absolute horror
  I cannot live
  I cannot die
  Trapped in myself
  Body my holding cell

  Landmine has taken my sight
  Taken my speech
  Taken my hearing
  Taken my arms
  Taken my legs
  Taken my soul
  Left me with life in hell

}




  dedMemo.Text := dedMemo.Text + 'PRAZOAPURACAO(';
  Qry.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('Exemplo.: PRAZOAPURACAO(CODITEMPCS)');
  memDesc.Lines.Add('');
  memDesc.Lines.Add('Esta função retorna o prazo de apuração de um determinado Item de Calculo do PCS');
  memDesc.Lines.Add('da Pessoa Corrente.');

