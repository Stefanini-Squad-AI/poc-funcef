{-------------------------------------------------------------------------------

                   Lançamento Múltiplo de Receitas

             Analista Responsável :  André Pontes       
             Data de Início       :  20/03/2001
             Data de Término      :  02/04/2001
             Modificações	  :

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. Chamado....: MIGRACAO-ORACLE-2025 (TAS000000006785)
Dt.Alteração..: 16/10/2025
Responsável...: Paulo Nobre
Descrição.....: Inclusão da função CAST, para campo, na qrery:
                .qryRateio
--------------------------------------------------------------------------------
Rotina.............:
N. SIG.............: 122903
Data da Alteração..: 16/03/2022
Responsável........: Edilaine
Descrição..........: carregar por default o Portador Forma padronizado no sistema
--------------------------------------------------------------------------------
Rotina.............: DBcboTipoRecDesCloseUp
N. SIG.............: 103856
Data da Alteração..: 30/06/2021
Responsável........: Cássio Florencio Rovaroto
Descrição..........: Inclusão de bloqueio no lançamento de tipos de despesa/receita.
--------------------------------------------------------------------------------
Nº SIG......: 25057
Data........: 28/07/2016
Responsável.: Peterson Victor
Descrição...: Não permitir lançamentos em dias não uteis
--------------------------------------------------------------------------------
Rotina......: CalculaRateio
Nº SIG......: 23956
Data........: 04/07/2016
Responsável.: Peterson Victor
Descrição...: Trazer os imóveis dentro da data de competência do lançamento
--------------------------------------------------------------------------------
Rotina......: CalculaPercentualRateio
Nº SOL......: 264956
Nº PPM......: 1159140
Data........: 11/11/2015
Responsável.: William Santana
Descrição...: mudar rateio dos contratos para percentual do aluguel em relação ao valor total do contrato
--------------------------------------------------------------------------------
Rotina......: CalculaRateio, CalculaPercentualRateio
Nº SOL......: 256577
Nº KINTANA..: 843368
Data........: 24/07/2015
Responsável.: Edilaine Ferraresi
Descrição...: mudar rateio dos contratos para percentual do aluguel em relação ao valor total do contrato
--------------------------------------------------------------------------------
Rotina......: CalculaRateio
Nº SOL......: 248098
Nº KINTANA..: 662559
Data........: 18/06/2015
Responsável.: Edilaine Ferraresi
Descrição...: na seleção de contrao o processo não finaliza
--------------------------------------------------------------------------------
Rotina......: CalculaRateio
Nº SOL......: 247935
Nº KINTANA..: 662587
Data........: 25/05/2015
Responsável.: Edilaine Ferraresi
Descrição...: total rateado não fecha o valor do documento
--------------------------------------------------------------------------------
Rotina.............: Alteração Lançamentos
N. Sol.............: 107772/5681
N. Kintana.........: 1358973
Data...............: 06/12/2011
Responsável........: Eraldo Luis da Silva / Edilaine Ferraresi
Descrição..........: Diferenciar os lançamentos de documentos feitos para
                     contratos e para imóveis.
--------------------------------------------------------------------------------
Rotina.......: CtrlLancamentosImovel.PrepareRatLanImovel
SOL..........: 180032
Kintana......: 1674608
Data.........: 23/01/2013
Responsável..: Baruc Singh Baptista
Descrição....: Função UTILIZADA PARA ARREDONDAMENTO DE VALORES
--------------------------------------------------------------------------------
Rotina......: CalculaRateio
Nº SOL......: 181200/10722
Nº KINTANA..: 1745291
Data........: 05/12/2012
Responsável.: Marcio Sanches Spinosa
Descrição...: Alteração na regra de rateio para tratar valores de sobra.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
SOL   : 131499
Kintana : 750975
Responsável : Felipe de Oliveira
Data        : 21/05/2010
Descrição   : Exibir mensagem que acuse a geração de duplicidade de documentos
              com mesma competência quando gerado por meio do
              " Laçamentos Múltiplos de Receita"
--------------------------------------------------------------------------------
Pendência   : 25166
Responsável : Gustavo Mendes
Data        :
Descrição   : Adicionar a Tag <imovel>, na mensagem do boleto. Essa opção trará
              concatenado descrição dos imóveis para um contrato.
--------------------------------------------------------------------------------
Pendência   : 24085
Responsável : Daniel Simões
Data        : 19/04/2007
Descrição   : Mudança na abertura da qryRateio. A query foi adaptada para
              carregar Imóveis ou Unidades pertencentes ao contrato.
--------------------------------------------------------------------------------
Pendência   : 24577
Responsável : Daniel Simões
Data        : 23/02/2007
Descrição   : Ajuste na query de rateio para trazer os imóveis dentro da data de
              competência do lançamento...
--------------------------------------------------------------------------------
Pendência   : 22524
Responsável : Daniel Simões
Data        : 12/06/2006
Descrição   : Não deixa lançamentos de imóveis com contratos diferentes...
              Passa a verificar se o documento lançado já não foi lançado
              antes...
--------------------------------------------------------------------------------
Pendência   : 22919
Responsável : Daniel Simões
Data        : 27/07/2006
Descrição   : Passa a "limpar" os contratos de receitas referentes a clientes
              sem contrato...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecLancMultRec;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, fcButton, fcImgBtn,
   fcShapeBtn, Wwdbspin, wwdbedit, Wwdotdot, Wwdbcomb, Mask, wwdblook, ExtCtrls,
   IvDictio, IvMulti, IvEMulti, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, Spin, TREdit, Db, Wwdatsrc, DBTables, Wwquery,
   MontaSelect, fcLabel, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
   FOkCancelarImob, FSairAjudaImob, TEdNum, DBCtrls, mCliente, mContrato,
   uCMTypes,uCtrlTipoCustoRecImov, DBClient, uCMClientDataSet, uCmSqlParams,
   uCMFileUtils, uCtrlBloqueioImob, uCtrlLancamentosImovel,
   // Helen - SOL: 172902 KTN: 1577381
   uCtrlContab,
   udiasuteis; // Peterson Victor  - SIG25057

type
   TfrmExecLancMultRec = class(TFrmSairAjudaImob)
      dsRateio: TwwDataSource;
      updRateio: TUpdateSQL;
      ntbPrincipal: TNotebook;
      Label22: TLabel;
      Label1: TLabel;
      Label5: TLabel;
      Label7: TLabel;
      lblCentroCusto: TLabel;
      DBcboTipoRecDes: TwwDBLookupCombo;
      DBcboGrupo: TwwDBLookupCombo;
      btnContinuaSelecao: TfcShapeBtn;
      GroupBox1: TGroupBox;
      Label3: TLabel;
      lblDataVencimento: TLabel;
      Label15: TLabel;
      Label2: TLabel;
      edtDataLanc: TCMDateTimePicker;
      edtDataVenc: TCMDateTimePicker;
      DBspnAno: TwwDBSpinEdit;
      edtVlrTotal: TRealEdit;
      cboMes: TComboBox;
      edtNumDocumento: TEdit;
      btnAtualizar: TfcShapeBtn;
      memObs: TMemo;
      DBcboCentroCusto: TwwDBLookupCombo;
      Label4: TLabel;
      pgcLancamentos: TPageControl;
      tbsLancamentos: TTabSheet;
      tbsErro: TTabSheet;
      memErro: TMemo;
      btnConfirmaLanc: TfcShapeBtn;
      btnVoltar: TfcShapeBtn;
      Panel3: TPanel;
      btnTrazer: TfcShapeBtn;
      btnExclui: TfcShapeBtn;
      btnInsert: TfcShapeBtn;
      btnTotaliza: TfcShapeBtn;
      edtTotalLanc: TRealEdit;
      lblTitulo: TfcLabel;
      Panel2: TPanel;
      lblProgress: TLabel;
      lblContador: TLabel;
      ProgressBar: TProgressBar;
      btnContinuarLanc: TfcShapeBtn;
      Bevel3: TBevel;
      Bevel1: TBevel;
      fcShapeBtn1: TfcShapeBtn;
      btnConfirmaAlt: TfcShapeBtn;
      Label9: TLabel;
      Label14: TLabel;
      rdgAcreDesc: TRadioGroup;
      DBcboAlterador: TwwDBLookupCombo;
      DBgrdAlteradoresLanc: TwwDBGrid;
      edtValor: TEditNum;
      Panel4: TPanel;
      bbtnConfirmar: TBitBtn;
      btnExcluiAlterador: TBitBtn;
      btnRefreshAlterador: TfcShapeBtn;
      Bevel4: TBevel;
      updAlterador: TUpdateSQL;
      qryAlterador: TwwQuery;
      qryAlteradorDESCRICAO: TStringField;
      qryAlteradorIDDOCUMENTO: TFloatField;
      qryAlteradorCODALTERADOR: TFloatField;
      qryAlteradorVLRALTERADOR: TFloatField;
      dsAlterador: TwwDataSource;
      chkBoleto: TCheckBox;
      RadioGroup1: TRadioGroup;
      GroupBox2: TGroupBox;
      Label10: TLabel;
      Label12: TLabel;
      Label13: TLabel;
      Label16: TLabel;
      Label17: TLabel;
      Label18: TLabel;
      Label19: TLabel;
      Label20: TLabel;
      Label21: TLabel;
      edtLinha1: TEdit;
      edtLinha2: TEdit;
      edtLinha3: TEdit;
      edtLinha4: TEdit;
      edtLinha5: TEdit;
      edtLinha6: TEdit;
      edtLinha7: TEdit;
      edtLinha8: TEdit;
      edtLinha9: TEdit;
      btnVoltarMsg: TfcShapeBtn;
      btnContinuarMsg: TfcShapeBtn;
      btnTrazrMsg: TfcShapeBtn;
      btnLimpaMsg: TfcShapeBtn;
      Panel1: TPanel;
      chkParcelar: TCheckBox;
      DBspnNumParcelas: TwwDBSpinEdit;
      lblParcelas: TLabel;
      chkRepetirAlterador: TCheckBox;
      Label49: TLabel;
      Label11: TLabel;
      Label23: TLabel;
      Label24: TLabel;
      Label25: TLabel;
      Label27: TLabel;
      DBcboPortadorForma: TwwDBLookupCombo;
      lblFormaCobranca: TLabel;
      molCliente1: TmolCliente;
      molContrato1: TmolContrato;
      chkImovelSemContrato: TCheckBox;
      gbPeriodoCtbDiaria: TGroupBox;
      Label6: TLabel;
      Label28: TLabel;
      edtDtinictbdiaria: TCMDateTimePicker;
      edtDtfimctbdiaria: TCMDateTimePicker;
      Label8: TLabel;
      Label26: TLabel;
      qryAlteradorCODTIPIMOVEL: TStringField;
      cdsReceita: TCMClientDataSet;
      CMSqlParams1: TCMSqlParams;
      Label29: TLabel;
      edtDataEmissao: TCMDateTimePicker;
      qryBuscaContrato: TwwQuery;
      qryContratoDoImovel: TwwQuery;
      qryReceitaContratual: TwwQuery;
      qryContratoDoImovelIDCONTRATOIMOVEL: TFloatField;
      qryReceitaContratualIDTIPOCUSTORECIMO: TFloatField;
      Query1: TQuery;
      Label30: TLabel;
      edtHistLanc: TEdit;
      qryLocalizaDocumento: TwwQuery;
      qryLocalizaDocumentoIDDOCUMENTO: TFloatField;
      qryBuscaContratoIDCONTRATOIMOVEL: TFloatField;
      qryBuscaContratoIDLOCATARIO: TFloatField;
      qryBuscaContratoCONNUMERO: TStringField;
      qryBuscaContratoCONNOME: TStringField;
      qryBuscaContratoCONTRATO_EXTENSO: TStringField;
    cdsBloqueioImob: TCMClientDataSet;
    Label31: TLabel;
    Label32: TLabel;
    qryRateio: TwwQuery;
    qryRateioIMOCODIGO: TStringField;
    qryRateioIMOVEL_EXTENSO: TStringField;
    qryRateioCODTIPIMOVEL: TStringField;
    qryRateio_CONTRATOEXTENSO: TStringField;
    qryRateioGXIPERCENTRATEIO: TFloatField;
    qryRateioPERCENT_RATEIO: TFloatField;
    qryRateioVALOR: TFloatField;
    qryRateioIDCONTRATOIMOVEL: TFloatField;
    qryRateioCONNUMERO: TStringField;
    qryRateioCONNOME: TStringField;
    qryRateioVLR_PARCELA: TFloatField;
    qryRateioIMOAREA: TFloatField;
    qryRateioIDIMOVEL: TFloatField;
    qryRateioIMOFRACAOIDEAL: TFloatField;
    qryRateioIDLOCATARIO: TFloatField;
    DBgrdLancamentos: TwwDBGrid;
    qryRateioCIMDESCRICAO: TStringField;
    qryBuscaContratoSTATUS: TStringField;
    qryBuscaContratoCIMDTINI: TDateTimeField;
    qryBuscaContratoCIMDTFIM: TDateTimeField;
    qryZerado: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField7: TStringField;
    UpdateZerado: TUpdateSQL;
    qryRateioCONVLRAJUSTADO: TFloatField;
    qryRateioCIMVLRAJUSTADO: TFloatField;

      procedure btnContinuaSelecaoClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure DBgrdLancRateioCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdLancRateioTopRowChanged(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure DBgrdLancRateioEnter(Sender: TObject);
      procedure DBgrdLancRateioExit(Sender: TObject);
      procedure btnAtualizarClick(Sender: TObject);
      procedure cboMesChange(Sender: TObject);
      procedure ntbPrincipalPageChanged(Sender: TObject);
      procedure qryRateio_CONTRATOEXTENSOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
      procedure DBgrdLancamentosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdLancamentosTopRowChanged(Sender: TObject);
      procedure btnInsertClick(Sender: TObject);
      procedure btnExcluiClick(Sender: TObject);
      procedure btnTotalizaClick(Sender: TObject);
      procedure btnContinuarLancClick(Sender: TObject);
      procedure btnContinuarMsgClick(Sender: TObject);
      procedure btnVoltarMsgClick(Sender: TObject);
      procedure btnLimpaMsgClick(Sender: TObject);
      procedure chkParcelarClick(Sender: TObject);
      procedure DBcboPortadorFormaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboPortadorFormaChange(Sender: TObject);
      procedure molContrato1btnBuscaContratoClick(Sender: TObject);
      procedure DBcboGrupoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure btnConfirmaLancClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure DBcboTipoRecDesCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure FormDestroy(Sender: TObject);
      procedure edtDataLancChange(Sender: TObject);
      procedure molContrato1btnLimpaContratoClick(Sender: TObject);
      procedure molCliente1btnBuscaCliClick(Sender: TObject);
    procedure molContrato1edtContratoExit(Sender: TObject); //107772/5681
    procedure DBcboGrupoExit(Sender: TObject);
    procedure edtDataVencExit(Sender: TObject); //107772/5681


   private  // Private declarations

      CtrlTipoReceita  : TCtrlTipoCustoRecImov; // Marcio Motta - 20/02/2004 - Pendência: 16112
      CtrlBloqueioImob : TCtrlBloqueioImob;
      CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381

      iResult       : smallint;
      fTotalRateio  : double;
      sTipoImovel   : string;
      iDocumento    : integer;
      bHabilitaOK   : Boolean;
      _IdCidade: Integer; // Peterson Victor  - SIG25057
      _IdPais: Integer;   // Peterson Victor  - SIG25057
      _UF: String;        // Peterson Victor  - SIG25057

      CtrlLancamentosImovel : TCtrlLancamentosImovel;

      procedure DesabilitaBotoes;
      procedure HabilitaBotoes;

      procedure FazerRefresh;

      procedure AbreTabelas;
      procedure FechaTabelas;

      procedure MontaMsgBoleto;

      function BuscaContrato(const iIdImovel:Integer):Boolean;
      function CalculaRateio: Boolean;

      function GeraLancamentos: shortint;
      function GravaLancamento(iDocumento: int64; iParcela, iParcelas: integer): Boolean;
      function GravaMensagem(const iDocumento: int64; const iParcela, iParcelas: word): Boolean;

      function VerificaPreenchimento: Boolean;
      function VerificaPreenchimentoMsg: Boolean;
      function VerificaTipoImoveisLanc: Boolean;
      function TotalizaRateio: double;
      //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
      function EfetuarRateioZerado(pValorResto : Extended; pQry : TwwQuery) : Extended;
      function EfetuarRateioMenorMaior(pValorRest : Extended) : Extended;
     //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim

      procedure AbreTipoAlterador;
      procedure AtribuiPercentRateio;
      procedure CalculaPercentualRateio;       // edilaine - SOL 256577 / PPM 843368

      procedure CalculaDataCtbDiaria;

      // -------------------------------------------------------------------------------------------
      // André Pontes - 15/08/2005 - pendência 19875
      function  ReceitaContratual(const IDContrato : Int64;
                                  const IDImovel   : Int64 = -1
                                 ): Int64;

      function  VerificaReceitaContratual: Boolean;
      // FIM André Pontes - 15/08/2005 - pendência 19875
      // -------------------------------------------------------------------------------------------

      // Daniel Simões - 22524
      function VerificaDocumentoExistente(iIdDocumento: Integer): Boolean;

   public   // Public declarations

      bFechaForm : Boolean;    // Fecha o form ao terminar o lançamento
      iCliente   : Integer;    // Daniel Simões - 22919
      iLocatario : Integer;    // Daniel Simões - 22919

   end;



var
  frmExecLancMultRec: TfrmExecLancMultRec;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, UComunsImobiliario, uVerificaPreenchimento, UModuloAdminImob,
   UDiasInUteis, dImobiliario, dLookImobiliario, uFuncoesImob, uDocumento, dMS, dLancImovel,
   uMolduras, uModuloImobiliario, dBaseDados;

   
// edilaine - SOL 247935 / KTN 662587 - incio
function ExtraiDecimalParaInteiros(rValor : extended) : integer;
begin
 rValor := rValor * 100;
 result := StrToInt( StringReplace(FloatToStr(rValor), '0,', '', [rfReplaceAll]) );
end;

function iif(condicao : boolean; str1, str2 : string) : string;
begin
  if condicao then result := str1
              else result := str2;
end;
// edilaine - SOL 247935 / KTN 662587 - fim

procedure TfrmExecLancMultRec.DesabilitaBotoes;
begin
   Screen.Cursor := crHourGlass;

   btnContinuaSelecao.Enabled := False;
   btnVoltar.Enabled          := False;
   btnConfirmaLanc.Enabled    := False;
   bbtnSair.Enabled           := False;

   ntbPrincipal.Enabled       := False;
end;



procedure TfrmExecLancMultRec.HabilitaBotoes;
begin
   btnContinuaSelecao.Enabled := True;
   btnVoltar.Enabled          := True;
   btnConfirmaLanc.Enabled    := bHabilitaOK;
   bbtnSair.Enabled           := True;

   ntbPrincipal.Enabled       := True;

   Screen.Cursor := crDefault;
end;



procedure TfrmExecLancMultRec.FazerRefresh;
begin
   AbreTabelas;
end;



procedure TfrmExecLancMultRec.AbreTabelas;
var
   sGrupoAnt   : string;
   sRecDesAnt  : string;
   sFormaAnt   : string;
   sCCAnt      : string;
   iPFAnt      : int64;
begin
   sGrupoAnt   := '';
   sRecDesAnt  := '';
   sFormaAnt   := '';
   sCCAnt      := '';
   iPFAnt      := -1;

   // Grupo de Rateio
   if DBcboGrupo.LookupValue <> '' then sGrupoAnt := DBcboGrupo.LookupValue;
   LimpaParametros(dtmLookImobiliario.qryLookGrupoRateio);
   dtmLookImobiliario.qryLookGrupoRateio.ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
   dtmLookImobiliario.qryLookGrupoRateio.Open;
   if length(trim(sGrupoAnt)) > 0 then DBcboGrupo.LookupValue := sGrupoAnt;

   // Tipo de Receita
   if DBcboTipoRecDes.LookupValue <> '' then sRecDesAnt := DBcboTipoRecDes.LookupValue;
   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PRECCUSTO').AsString := 'R';
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;
   if length(trim(sRecDesAnt)) > 0 then DBcboTipoRecDes.LookupValue := sRecDesAnt;

   // Centro de Custo
   if DBcboCentroCusto.LookupValue <> '' then sCCAnt := DBcboCentroCusto.LookupValue;
   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      ParamByName('PIDEMPRESA').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   // Traz também o Centro de Custo default, de acordo com os parâmetros do Sistema
   if length(trim(sCCAnt)) > 0 then begin
      DBcboCentroCusto.LookupValue := sCCAnt;
   end else begin
      if (ModuloImobiliario.AdminImob.sCodCentroCusto <> '') then begin
         DBcboCentroCusto.LookupValue := ModuloImobiliario.AdminImob.sCodCentroCusto;
      end;
   end;

   // Só manipula Portador-forma se for necessário gerar boleto

      if DBcboPortadorForma.LookupValue <> '' then iPFAnt := StrToInt(DBcboPortadorForma.LookupValue);
      with dtmLookImobiliario.qryLookPortadorForma do begin
         LimpaParametros(dtmLookImobiliario.qryLookPortadorForma);
         ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
         Open;
      end;

      // Traz também o Centro de Custo default, de acordo com os parâmetros do Sistema
      if iPFAnt > 0 then begin
         DBcboPortadorForma.LookupValue := IntToStr(iPFAnt);
      end else begin
         //edilaine SIG122903 : inicio
         if ModuloImobiliario.AdminImob.iCodPortForma > 0 then
            DBcboPortadorForma.LookupValue := IntToStr(ModuloImobiliario.AdminImob.iCodPortForma)
         else
         begin
           if not(dtmLookImobiliario.qryLookPortadorFormaCODPORTFORMA.isNull) then
              DBcboPortadorForma.LookupValue := IntToStr(dtmLookImobiliario.qryLookPortadorFormaCODPORTFORMA.AsInteger);
         end;
         //edilaine SIG122903 : fim
      end;
end;



procedure TfrmExecLancMultRec.FechaTabelas;
begin
   qryRateio.Close;

   dtmLookImobiliario.qryLookGrupoRateio.Close;
   dtmLookImobiliario.qryLookTipoRecDes.Close;
end;



function TfrmExecLancMultRec.VerificaPreenchimento: Boolean;
var
  iDia, iMes, iAno, iDifMeses, iAnoComp, iMesComp: word;

  // Marcio Motta - 18/02/2004 - Pendência: 16112
  iAnoLancContab, iMesLancContab, iDiaLancContab: word;
  //------- Fim Implementação/Alteração - Marcio Motta -------------------------------

  dDia1, dDia2: TDateTime;
  iAnoMesContab, iAnoMesIniCtb, iAnoMesFimCtb : Integer;

  qryLancamentosDuplicados : TQuery;

begin

// Marcio Motta - 18/02/2004 - Pendência: 16112
// Alterado para pegar a data de Lançamento contábil ao invés da data de Competência

   Result := False;
   qryLancamentosDuplicados := TQuery.Create(nil);
   qryLancamentosDuplicados.DatabaseName:= 'BASEDADOS';

   try
      iAnoComp := Word(trunc(DBspnAno.Value));
      iMesComp := cboMes.ItemIndex + 1;

      if (DBcboTipoRecDes.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Receita a ser rateada!', DBcboTipoRecDes);

      // André Pontes - 15/08/2005 - pendência 19875
      if ModuloImobiliario.AdminImob.bFlgBloqRecAluguel then
      begin
         if length(molContrato1.edtContrato.Text) > 0 then
         begin
            if StrToInt(DBcboTipoRecDes.LookupValue) = ReceitaContratual(molContrato1.iContrato) then
               raise EValidacao.CreateVal('Não é permitido fazer lançamentos a receber da receita contratual!', DBcboTipoRecDes);
         end;
      end;
      // FIM André Pontes - 15/08/2005 - pendência 19875

      if (molCliente1.edtNomeFantasia.Text = '') then
         raise EValidacao.CreateVal('É necessário indicar o Cliente/Debitado!', molCliente1.btnBuscaCli);

      if ( edtNumDocumento.Text = '' ) then
         raise EValidacao.CreateVal('É necessário indicar o Nr. do documento!', edtNumDocumento);

      if (edtVlrTotal.Value <= 0) then
         raise EValidacao.CreateVal('É necessário indicar o Valor Total a ser rateado!', edtVlrTotal);

      if (cboMes.ItemIndex = -1) then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if (length(trim(edtDataVenc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      if (length(trim(edtDataLanc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLanc);

      if (length(trim(edtDataEmissao.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Emissão do Documento!', edtDataEmissao);

      if edtDataEmissao.Date > edtDataVenc.Date then
         raise EValidacao.CreateVal('Data de emissão não pode ser superior ao vencimento!', edtDataEmissao);

      // Decodifica a data de Lançamento Contábil
      DecodeDate(edtDataLanc.Date, iAnoLancContab, iMesLancContab, iDiaLancContab);

      // Se não for permitido efetuar lançamento contábil fora do período gerencial
      if not ModuloImobiliario.AdminImob.bFlgLancForaComp then begin
         dDia1 := DiasInUteis.UltDiaMes (iAnoComp, iMesComp);
         if edtDataLanc.Date > dDia1 then
            raise EValidacao.CreateVal('A data de lançamento não pode ser após a sua competência!', edtDataLanc);
      end;

      // Se a data de Lançamento contábil for menor que a data de competência
      if (iAnoLancContab < DBspnAno.Value) or (iMesLancContab < cboMes.ItemIndex + 1) then
         if MsgDlg ('A data de lançamento digitada é inferior a data de competência. Continua?', 'AdminImob', mtConfirmation, [mbyes,mbno], 0) = MrNo then
           raise EValidacao.CreateVal('Altere data de Lançamento.', edtDataLanc);

      { 20/06
        se possui contabilização diária
           se despesas/receitas com periodicidade mensal
              a competencia do lançamento somente pode ser igual a competencia
              atual ou no máximo um mês apos
      }

      if ModuloImobiliario.AdminImob.bFlgDiario then begin

         if (cdsReceita.FieldByName('FLGDIARIO').AsString = 'M') or
            (cdsReceita.FieldByName('FLGDIARIO').AsString = 'A') then begin

            if (length(trim(edtDtinictbdiaria.Text)) = 0) then
               raise EValidacao.CreateVal('É necessário indicar a Data de início da Contabilização!', edtDtinictbdiaria);

            if (length(trim(edtDtfimctbdiaria.Text)) = 0) then
               raise EValidacao.CreateVal('É necessário indicar a Data de início da Contabilização!', edtDtfimctbdiaria);

            if (edtDtinictbdiaria.Date > edtDtfimctbdiaria.Date) then
               raise EValidacao.CreateVal('Data de início da Contabilização diária não deve ser superior a data de término!', edtDtfimctbdiaria);
         end;

         if cdsReceita.FieldByName('FLGDIARIO').AsString = 'M' then begin
            // Pega a data definida na tela de parêmentros
            // Primeiro dia permitido para o Lançamento
            dDia1 := EncodeDate(ModuloImobiliario.AdminImob.iAnoCompetencia,
                                ModuloImobiliario.AdminImob.iMesCompetencia, 1);

            // Pega a data de Lançamento Contábil
            dDia2 := EncodeDate(iAnoLancContab, iMesLancContab, 1);

            // Se data de Lançamento Contábil for menor que a data informada na tela de Parâmetros
            if dDia2 < dDia1 then begin  // tentativa de lançar em um mes anterior
               raise EValidacao.CreateVal('A data de lançamento informada pertence a um período já encerrado!', edtDataLanc);
            end else begin

                           // Pega a diferença de meses entre o período definido na tela de parâmetros
               // e a data de lançamento contábil
               iDifMeses := DiasInUteis.IntervaloMeses(dDia1, dDia2);

               // Verifica a diferença de meses existente.
               // Se estiver dentro do permitido, apenas avise ao usuário
               // Senão informa que não será permitido efetuar o lançamento no período
               if iDifMeses < ModuloImobiliario.AdminImob.iMesBloqLancto then
                  MsgDlg('O período para a data de lançamento informada ainda não foi inicializado.', 'Informação', mtInformation, [mbok], 0)
               else if iDifMeses > ModuloImobiliario.AdminImob.iMesBloqLancto then
                  raise EValidacao.CreateVal('O período para a data de lançamento informada é superior ao permitido, execute o encerramento mensal!', edtDataLanc);
            end;

            // Decodifica a data inicial da contab. diária
            DecodeDate(edtDtinictbdiaria.Date, iAno, iMes, iDia);

            // O período INICIAL da contabilização diária deve estar dentro do
            // período de lançamento contábil
            if (iAno <> iAnoLancContab) or (iMes <> iMesLancContab) then
               raise EValidacao.CreateVal('Data de início da Contabilização diária deve estar dentro da Competência Contábil!', edtDtinictbdiaria);

            // Decodifica a data final da contab. diária
            DecodeDate(edtDtfimctbdiaria.Date, iAno, iMes, iDia);

            // O período FINAL da contabilização diária deve estar dentro do
            // período de lançamento contábil
            if (iAno <> iAnoLancContab) or (iMes <> iMesLancContab) then
               raise EValidacao.CreateVal('Data de término da Contabilização diária deve estar dentro da Competência Contábil!', edtDtfimctbdiaria);

         end else if cdsReceita.FieldByName('FLGDIARIO').AsString = 'A' then begin
            // A competência do Lançamento deve estar compreendida entre o período da
            // contabilização diária
            // Monta Mês e Ano da data de lançamento contábil
            iAnoMesContab := StrToInt(FormatFloat('0999',iAnoLancContab) + FormatFloat('09',iMesLancContab));

            // Decodifica a data INICIAL da contabilização DIÁRIA
            DecodeDate(edtDtinictbdiaria.Date, iAno, iMes, iDia);

            // Monta Mês e Ano da data INICIAL d contabilização DIÁRIA
            iAnoMesIniCtb := StrToInt(FormatFloat('0999',iAno) + FormatFloat('09',iMes));

            // Decodifica a data FINAL da contabilização DIÁRIA
            DecodeDate(edtDtfimctbdiaria.Date, iAno, iMes, iDia);

            // Monta Mês e Ano FINAL da contabilização DIÁRIA
            iAnoMesFimCtb := StrToInt(FormatFloat('0999',iAno) + FormatFloat('09',iMes));

            // A competência contábil do Lançamento deve estar compreendida entre o período da
            // contabilização diária informado
            if (iAnoMesContab < iAnoMesIniCtb) or (iAnoMesContab > iAnoMesFimCtb) then
               raise EValidacao.CreateVal('A Competência deve estar compreendida entre o período da Contabilização Diária!', edtDtInictbdiaria);
         end;
      end;
      // Helen - SOL: 172902 KTN: 1577381 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataVenc.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataVenc);
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataLanc.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataLanc);
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataEmissao.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataEmissao);
      // Helen - SOL: 172902 KTN: 1577381 - Fim


      // Marchetti - Pendencia 22289
      if (CtrlTipoReceita.ReceitaPossuiBloqueioJudicial(StrToInt(DBcboTipoRecDes.LookupValue))) and
         (molContrato1.iContrato <= 0) then
         raise EValidacao.CreateVal('A receita selecionada possui bloqueio judicial. É necessário selecionar um contrato!', molContrato1.btnBuscaContrato);
      // Fim Marchetti - Pendencia 22289

      // Felipe de Oliveira  SOL 131499 Kintana 750975 Início
      qryLancamentosDuplicados.Close;
      qryLancamentosDuplicados.SQL.Add('SELECT IDCONTRATOIMOVEL, IDTIPOCUSTORECIMO, MESCOMPETENCIA, ANOCOMPETENCIA ');
      qryLancamentosDuplicados.SQL.Add('  FROM LANCAMENTOSIMOVEL                                                   ');
      qryLancamentosDuplicados.SQL.Add(' WHERE IDCONTRATOIMOVEL  =  :PARIDCONTRATOIMOVEL                           ');
      qryLancamentosDuplicados.SQL.Add('   AND IDTIPOCUSTORECIMO =  :PARIDTIPOCUSTORECIMO                          ');
      qryLancamentosDuplicados.SQL.Add('   AND MESCOMPETENCIA    =  :PARMESCOMPETENCIA                             ');
      qryLancamentosDuplicados.SQL.Add('   AND ANOCOMPETENCIA    =  :PARANOCOMPETENCIA                             ');

      qryLancamentosDuplicados.ParamByName('PARIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;
      qryLancamentosDuplicados.ParamByName('PARIDTIPOCUSTORECIMO').AsString := DBcboTipoRecDes.LookupValue;
      qryLancamentosDuplicados.ParamByName('PARMESCOMPETENCIA').AsInteger := iMesComp;
      qryLancamentosDuplicados.ParamByName('PARANOCOMPETENCIA').AsInteger := iAnoComp;
      qryLancamentosDuplicados.Open;

      if not qryLancamentosDuplicados.IsEmpty then
      begin
         MessageDlg('Foi verificado um lançamento existente para '+#13+#10+
                    'este contrato com o mesmo tipo de receita '+#13+#10+
                    'e com o mesmo período de competência.', mtWarning, [mbOK], 0);
      end;
      // Felipe de Oliveira  SOL 131499 Kintana 750975 Fim


   except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecLancMultRec.VerificaPreenchimentoMsg: Boolean;
begin
   Result := False;

   try

      // PortadorForma
      if (DBcboPortadorForma.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar a Forma de Cobrança!', DBcboPortadorForma);

   except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecLancMultRec.VerificaTipoImoveisLanc: Boolean;
var
   sTipoImovelAnt, sTipoImovelAtual : string;
begin
   Result := False;

   if not ModuloImobiliario.AdminImob.bFlgMultiTipo then begin
      try

         with qryRateio do begin

            First;
            sTipoImovelAnt := qryRateio.FieldByName('CODTIPIMOVEL').AsString;

            while not(EOF) do begin
               sTipoImovelAtual := qryRateio.FieldByName('CODTIPIMOVEL').AsString;

               if (sTipoImovelAtual <> sTipoImovelAnt) then
                  raise EValidacao.CreateVal('Para efetuar o lançamento é necessário que TODOS os Imóveis sejam do mesmo Tipo!', btnContinuarLanc);

               Next;
            end;

         end;

      except

         on ev : EValidacao do begin
            if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
            Repaint;
            if ev.Control.CanFocus then ev.Control.SetFocus;
            Exit;
         end;

      end;
      sTipoImovel := sTipoImovelAnt;
   end else sTipoImovel := qryRateio.FieldByName('CODTIPIMOVEL').AsString;

   Result := True;
end;



function TfrmExecLancMultRec.TotalizaRateio: double;
begin
   Screen.Cursor := crHourGlass;

   qryRateio.First;

   fTotalRateio := 0;
   while not qryRateio.EOF do begin
      fTotalRateio := fTotalRateio + Arredonda(qryRateio.FieldByName('VALOR').AsFloat, 2);
      qryRateio.Next;
   end;

   Application.ProcessMessages;

   qryRateio.First;

   fTotalRateio         := Arredonda(fTotalRateio, 2);
   edtTotalLanc.Value   := fTotalRateio;
   Result               := fTotalRateio;

   Screen.Cursor := crDefault;
end;



procedure TfrmExecLancMultRec.AbreTipoAlterador;
begin
   with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin

      LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);

      ParamByName('PCODTIPIMOVEL').AsString     := sTipoImovel;
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString           := 'R';

      case rdgAcreDesc.ItemIndex of
         0: ParamByName('PACRESDECRES').AsString   := 'D'; // Acréscimo
         1: ParamByName('PACRESDECRES').AsString   := 'C'; // Desconto
      end;

      Open;
   end;
end;



procedure TfrmExecLancMultRec.MontaMsgBoleto;
begin
   edtLinha2.Text := DBcboTipoRecDes.Text;
end;



function TfrmExecLancMultRec.CalculaRateio: Boolean;
var
   fValorRateado   : extended;
   pExtResto       : Extended;
   fTotalRateado   : extended;
   sMensagem, sSql : string;
   iContador       : integer;
   fPercentRateio  : extended;

// Daniel Simões - 07/02/2006 --------------------------------------------------
   iMes,iAno       : word;
   dDtComp         : TDatetime;
// Daniel Simões - 07/02/2006 --------------------------------------------------

   sCompetencia    : String;

   iContratoImovel : Integer; // Daniel Simões - 22524

   pExtPercentual : Extended;
   iQtdeFields : integer;
   iTeste : Integer;
begin
   Result := True;
   pExtPercentual := 0;
   iAno    := Word(trunc(DBspnAno.Value));
   iMes    := cboMes.ItemIndex+1;
   dDtComp := EncodeDate(iAno,iMes,01);


   sCompetencia := IntToStr(iAno)+FormatFloat('00',(iMes));

   // Paulo

// Daniel - 24085 - Início -----------------------------------------------------
   //Cássio SOL 111068 KINTANA 512168 - Início
   sSql := 'SELECT CAST(SUBSTR(DECODE(I.IDIMOVELPAI,NULL,IM.IMONOME||'' - ''||I.IMONOME, ' +#13+
           '       DECODE(I.IMONOME,NULL,IM.IMONOME||'' - ''||IP.IMONOME, ' +#13+
           '              IM.IMONOME||'' - ''||IP.IMONOME||'' - ''||I.IMONOME) ),1,100) AS VARCHAR2(100)) AS IMOVEL_EXTENSO, ' +#13+
           '       I.IMOCODIGO, I.CODTIPIMOVEL, '                                                            +#13;

   // edilaine - SOL 256577 / PPM 843368 - inicio
   if ( DBcboGrupo.Text = '' ) then begin
      sSql := sSql +
           '       (select SUM(CIMVLRAJUSTADO) from CONTRATOXIMOVEL where IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL ' + #13 +
           '         AND (((CIMDTFIM IS NOT NULL AND '+QuotedStr(sCompetencia)+' BETWEEN TO_CHAR(CIMDTINI,''YYYYMM'') AND TO_CHAR(CIMDTFIM,''YYYYMM'')) ) OR ' +#13+ //SIG23956 Peterson Victor
           '              ((CIMDTFIM IS NULL     AND '+QuotedStr(sCompetencia)+' >= TO_CHAR(CIMDTINI,''YYYYMM'')) ) ) '+#13 + //SIG23956 Peterson Victor
           ') AS CONVLRAJUSTADO, '+#13+
           '       CXI.CIMVLRAJUSTADO,  '+ #13;
   end
   else
      sSql := sSql + '       0 AS CONVLRAJUSTADO, 0 AS CIMVLRAJUSTADO,  '+#13;
   // edilaine - SOL 256577 / PPM 843368  - fim

   //Cássio SOL 111068 KINTANA 512168 - Fim
// Daniel - 24085 - Fim --------------------------------------------------------

   if ( DBcboGrupo.Text<>'' ) then
      sSql := sSql + '       GXI.GXIPERCENTRATEIO, ' +#13
   else
      sSql := sSql + '       0.0000 AS GXIPERCENTRATEIO, ' +#13;

   sSql := sSql + '       CXI.CONNUMERO, CXI.CONNOME, CXI.IDLOCATARIO, 0 AS VALOR, 0 AS VLR_PARCELA, CXI.IDCONTRATOIMOVEL, ' +#13+
                  '       DECODE(CXI.FLGRATEIO,NULL,100, ' +#13+
                  '       DECODE(CXI.FLGRATEIO, 0, 100, '  +#13+
                  '       DECODE(CXI.CIMPERCENTRATEIO, NULL, 0, CXI.CIMPERCENTRATEIO))) AS PERCENT_RATEIO, ' +#13+
                  '       CXI.CIMDESCRICAO, ' + #13 + //25166
                  '       I.IMOAREA, I.IDIMOVEL,  -- PARA RATEAR RECEITAS POR CONTRATO ' +#13+
                  '       I.IMOFRACAOIDEAL        -- ATUALIZACAO PARA FCRT ELES CALCULAM PERCENTUAL POR AQUI, O DEFAULT E IMOAREA ' +#13+
                  'FROM ';

   if ( DBcboGrupo.Text<>'' ) then        //24085
     sSql := sSql + 'IMOVEL I, IMOVEL IM, IMOVEL IP,     GRUPOXIMOVEL GXI, ' +#13
   else                                   //24085
     sSql := sSql + 'IMOVEL I, IMOVEL IM, IMOVEL IP, ' +#13;

   sSql := sSql + '     ( SELECT C.IDCONTRATOIMOVEL, CXI.IDIMOVEL, CXI.FLGRATEIO, CXI.CIMPERCENTRATEIO, ' +#13+
                  '              C.CONNUMERO,        C.CONNOME,    C.IDLOCATARIO,  ' +#13+
                  '              CXI.CIMDESCRICAO, ' + #13 + //25166
                  '              CXI.CIMVLRAJUSTADO '+#13+     // edilaine - SOL 256577 / PPM 843368
                  '       FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI ' +#13+
                  '       WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL ' +#13+

   iif(DBcboGrupo.Text <> '', '       AND C.IDCONTRATOIMOVEL = 0', '') +#13+   // edilaine - SOL 247935 / KTN 662587

// Daniel - 24577 - Início -----------------------------------------------------
                  '         AND (((CXI.CIMDTFIM IS NOT NULL AND '+QuotedStr(sCompetencia)+' BETWEEN TO_CHAR(CXI.CIMDTINI,''YYYYMM'') AND TO_CHAR(CXI.CIMDTFIM,''YYYYMM'')) ) OR ' +#13+
                  '              ((CXI.CIMDTFIM IS NULL     AND '+QuotedStr(sCompetencia)+' >= TO_CHAR(CXI.CIMDTINI,''YYYYMM'')) ) ) ) CXI '+#13;
// Daniel - 24577 - Fim --------------------------------------------------------

   sSql := sSql + 'WHERE ( I.IDPESSOA = :PIDPESSOA ) ' +#13;

   if ( DBcboGrupo.Text<>'' ) then begin
     sSql := sSql + '  AND ( (:PIDGRUPORATEIO IS NULL) OR (GXI.IDGRUPORATEIO = :PIDGRUPORATEIO) ) ' +#13+
                    '  AND ( I.IDIMOVEL = GXI.IDIMOVEL(+) ) ' +#13;
   end else begin
     sSql := sSql + '  AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (CXI.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL) ) ' +#13;
   end;

   sSql := sSql + '  AND ( I.IDIMOVELMESTRE     = IM.IDIMOVEL ) '     +#13+
                  '  AND ( I.IDIMOVELPAI        = IP.IDIMOVEL(+) ) '  +#13+ // Daniel - 24085
                  '  AND ( I.IDIMOVEL           = CXI.IDIMOVEL(+) ) ' +#13;

   if ( DBcboGrupo.Text<>'' ) then
     sSql := sSql + 'ORDER BY I.IDIMOVEL, GXI.GXIPERCENTRATEIO ';

   qryRateio.SQL.Text := '';
   qryRateio.SQL.Text := sSql;

   LimpaParametros(qryRateio);
   qryRateio.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;

   if DBcboGrupo.LookupValue <> '' then begin
      qryRateio.ParamByName('PIDGRUPORATEIO').AsInteger := StrToInt(DBcboGrupo.LookupValue);
   end else if molContrato1.edtContrato.Text <> '' then begin
      qryRateio.ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;
   end else begin
      qryRateio.ParamByName('PIDCONTRATOIMOVEL').AsInteger := -1;
   end;

   qryRateio.Open;
   qryZerado.Open;//Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291

   //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
   if not qryZerado.IsEmpty then
   begin
     qryZerado.Close;
     qryZerado.Open;
   end;
   //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim

   // calcular percentuais de rateio para lançamentos por contrato
   {if molContrato1.edtContrato.Text <> '' then AtribuiPercentRateio;}           // edilaine - SOL 256577 / PPM 843368
   if molContrato1.edtContrato.Text <> '' then CalculaPercentualRateio;          // edilaine - SOL 256577 / PPM 843368

   if not (qryRateio.isEmpty) then begin

      fTotalRateado := ComunsImobiliario.Arredonda(edtVlrTotal.Value, 2);

      qryRateio.First;
      iContador := 1;


// Alteração feita segundo as exigências descritas na pendência 23591...
// Daniel Simões - Início ------------------------------------------------------

      if ( molContrato1.iContrato > 0 ) then
        iContratoImovel := qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger // Daniel Simões - 22524
      else
        iContratoImovel := -1;

// Daniel Simões - Fim ---------------------------------------------------------

     while not(qryRateio.EOF) do
     begin

// Daniel Simões - 22879 - Início ----------------------------------------------

// Alteração feita segundo as exigências descritas na pendência 23591...
// Daniel Simões - Início ------------------------------------------------------
     if DBcboGrupo.LookupValue = '' then begin  // ELS SOL 107772/5681 KINTANA 1358973
        if chkImovelSemContrato.Checked = False then begin
          if qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger = 0 then begin
            MsgDlg('Existem imóveis sem contratos neste grupo.', 'Aviso', mtWarning, [mbOk], 0);
            btnVoltarMsgClick(Self);
            Result := False;
            Exit;
          end;
        end;
     end; // ELS SOL 107772/5681 KINTANA 1358973

// Daniel Simões - Fim ---------------------------------------------------------

// Daniel Simões - 22879 - Fim -------------------------------------------------

        //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - inicio
        //Passo o valor da porcentagem de 4 casas decimais para 02 casas decimais
        pExtPercentual := StrToFloat(FloattoStrf( qryRateio.FieldByName('GXIPERCENTRATEIO').AsFloat, ffNumber, 12, 4{2}));    // edilaine - SOL 247935 / KTN 662587
//        fValorRateado := ComunsImobiliario.Arredonda(edtVlrTotal.Value * ryRateio.FieldByName('GXIPERCENTRATEIO').AsFloat / 100, 2, True);
        fValorRateado := ComunsImobiliario.Arredonda(edtVlrTotal.Value * pExtPercentual / 100, 2, false{true});    // edilaine - SOL 248098 / PPM 662559


        //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
        if (fValorRateado = 0) then
        begin
          qryZerado.Insert;
          for iQtdeFields := 0 to qryRateio.FieldCount - 1 do
          begin
            if (qryZerado.Fields[iQtdeFields].ReadOnly = False) then
               qryZerado.Fields[iQtdeFields].AsString := qryRateio.Fields[iQtdeFields].AsString;
          end;
          qryZerado.Post;
        end;
        //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim

  //      Rateio do Rateio = se o imóvel possuir mais de um contrato então o
  //      rateio deve ser rateado novamente pelo campo CONTRATOxIMOVEL.CimPercentRateio.
  //      So que neste caso o usuário pode não ter cadastrado um rateio de contrato
  //      com 100% gerando talvez uma inconsistência no último lançamento

        // edilaine - SOL 256577 / PPM 843368 - comentado inicio
        //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - inicio
        //Passo o valor da porcentagem de 4 casas decimais para 02 casas decimais
        //pExtPercentual := StrToFloat(FloattoStrf( qryRateio.FieldByName('PERCENT_RATEIO').AsFloat, ffNumber, 12, 4{2}));    // edilaine - SOL 247935 / KTN 662587
//        fValorRateado := ComunsImobiliario.Arredonda(fValorRateado * qryRateio.FieldByName('PERCENT_RATEIO').AsFloat / 100, 2);
        //fValorRateado := ComunsImobiliario.Arredonda(fValorRateado * pExtPercentual / 100, 2);
        // edilaine - SOL 256577 / PPM 843368 - comentado fim

        qryRateio.Edit;

        //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
        // se for o ultimo registro da query colocar o valor restante nela
//        if iContador = qryRateio.RecordCount then begin
//           qryRateio.FieldByName('VALOR').AsFloat := fTotalRateado;
//        end else begin
           qryRateio.FieldByName('VALOR').AsFloat := fValorRateado;
//        end;
       //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim
// Daniel Simões - 22919 - Início ----------------------------------------------
        if ( molContrato1.iContrato<=0 ) then begin
          if ( qryRateio.FieldByName('IDLOCATARIO').AsInteger=0 ) or ( iCliente <> qryRateio.FieldByName('IDLOCATARIO').AsInteger ) then begin
            qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger := -1;
            //qryRateio.FieldByName('CONNUMERO').AsString         := '';  // Edilaine - SOL 1077772-5681 / KTN 1358973 - comentado
            //qryRateio.FieldByName('CONNOME').AsString           := '';  // Edilaine - SOL 1077772-5681 / KTN 1358973 - comentado
            
// Daniel - 23591 - ------------------------------------------------------------
          end else begin
            if iContratoImovel = -1 then iContratoImovel := qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger;
          end;
// Daniel - 23591 - ------------------------------------------------------------
        end;
// Daniel Simões - 22919 - Fim -------------------------------------------------

// Daniel Simões - 22524 - -----------------------------------------------------
        if (iContratoImovel>0) then begin
          if (iContratoImovel <> qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger) then begin
            MsgDlg('Existem imóveis pertencentes a contratos diferentes neste grupo.', 'Aviso', mtWarning, [mbOk], 0);
            Result := False;
            Exit;
          end;
        end;
// Daniel Simões - 22524 - -----------------------------------------------------

        qryRateio.Post;
        qryRateio.Next;

//        fTotalRateado := fTotalRateado - fValorRateado;
//        inc(iContador);
     end;


     pExtResto := 0;
     qryRateio.First;
     while not qryRateio.Eof do
     begin
        pExtResto := pExtResto + qryRateio.FieldByName('VALOR').AsCurrency;
        fTotalRateado   := fTotalRateado - qryRateio.FieldByName('VALOR').AsCurrency;
        qryRateio.Next;
     end;

     // edilaine - SOL 248098 / PPM 662559 - inicio
     //if not (iContratoImovel>0) then                           // edilaine - SOL 256577 / PPM 843368 - comentado
     begin
       //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
       if (fTotalRateado > 0) and (qryZerado <> nil) and (qryZerado.RecordCount > 0) then
         fTotalRateado := EfetuarRateioZerado(fTotalRateado, qryZerado);
       if (Abs(fTotalRateado) > 0) then                                    // edilaine - SOL 256577 / PPM 843368
         fTotalRateado := EfetuarRateioMenorMaior(fTotalRateado);
     end;
     // edilaine - SOL 248098 / PPM 662559 - fim

     TotalizaRateio;
     //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim

   end;
end;


procedure TfrmExecLancMultRec.AtribuiPercentRateio;
var
   fAreaTotal: Extended;
   bFracaoIdeal: Boolean;  // a FCRT rateia suas despesas por aqui
begin
   qryRateio.First;

   // usar a area ideal como grupo para o lançamento da receitas por contrado
   bFracaoIdeal := false;
   fAreaTotal := 0;
   while not qryRateio.Eof do begin
      fAreaTotal := fAreaTotal + qryRateio.FieldByName('IMOAREA').AsFloat;
      qryRateio.Next;
   end;

   // se a area ideal não for preenchida usar a fração ideal
   if fAreaTotal = 0 then begin
      bFracaoIdeal := true;
      qryRateio.First;
      while not qryRateio.Eof do begin
         fAreaTotal := fAreaTotal + qryRateio.FieldByName('IMOFRACAOIDEAL').AsFloat;
         qryRateio.Next;
      end;
   end;

   qryRateio.First;
   while not qryRateio.Eof do begin
      if bFracaoIdeal then begin
         if qryRateio.FieldByName('IMOFRACAOIDEAL').AsFloat <> 0 then begin
            qryRateio.Edit;
            qryRateio.FieldByName('GXIPERCENTRATEIO').AsFloat := qryRateio.FieldByName('IMOFRACAOIDEAL').AsFloat / fAreaTotal * 100;
            qryRateio.Post;
         end;
      end else begin
         if qryRateio.FieldByName('IMOAREA').AsFloat <> 0 then begin
            qryRateio.Edit;
            qryRateio.FieldByName('GXIPERCENTRATEIO').AsFloat := qryRateio.FieldByName('IMOAREA').AsFloat / fAreaTotal * 100;
            qryRateio.Post;
         end;
      end;
      qryRateio.Next;
   end;

   qryRateio.First;
end;


// edilaine - SOL 256577 / PPM 843368 - inicio
procedure TfrmExecLancMultRec.CalculaPercentualRateio;
begin
   qryRateio.First;
   while not qryRateio.Eof do begin
      {calcula o percentual de rateio pelo valor do aluguel do imovel sobre o valor total do contrato}
      qryRateio.Edit;
      //Início - William Santana - SOL 264956 PPM 1159140
//      qryRateio.FieldByName('GXIPERCENTRATEIO').AsFloat := ComunsImobiliario.Arredonda(qryRateio.FieldByName('cimvlrajustado').AsFloat /
//                                                                                       qryRateio.FieldByName('convlrajustado').AsFloat * 100, 2, false);
        qryRateio.FieldByName('GXIPERCENTRATEIO').AsFloat := ComunsImobiliario.Arredonda(qryRateio.FieldByName('cimvlrajustado').AsFloat /
                                                                                       qryRateio.FieldByName('convlrajustado').AsFloat * 100, 4, false);
       //Término - William Santana - SOL 264956 PPM 1159140
      qryRateio.Post;

      qryRateio.Next;
   end;

   qryRateio.First;
end;
// edilaine - SOL 256577 / PPM 843368 - fim


//--------------------------------------------------------------------------------------------------
// Retorno:  0 :  lançamentos gerados sem ocorrências
//          -1 :  lançamentos gerados mas houve ocorrências
//          -2 :  erro fatal: lançamentos NÃO gerados
//--------------------------------------------------------------------------------------------------
function TfrmExecLancMultRec.GeraLancamentos: shortint;
var
   fPercentRateio, fCount, fAtual   : double;
   sErro, sObs, sTextoProgresso     : string;
   iErro : Integer;

   fVlrTotal         : currency; // valor total geral
   fSobraGeral       : currency; // controle do total restante
   fTotalParcela     : currency; // total geral dividido pelo nº de parcelas
   fSobraParcela     : currency; // controle do valor restante de cada parcela
   fVlrParcelaImovel : currency; // valor do imóvel na Parcela

   i, j, k     : integer;
   vMsgBoleto  : array [0..8] of string;
begin
   Result := 0;
   iErro  := 0;
   fCount := qryRateio.RecordCount;

   sTextoProgresso := 'Gerando Lançamentos...';

   // ProgressBar
   MostraProgresso(ProgressBar, lblProgress, lblContador, fCount, sTextoProgresso);

   try
      // nº de parcelas
      j := trunc(DBspnNumParcelas.Value);

      // valor de cada parcela e Total TOTAL das parcelas
      fSobraGeral    := edtTotalLanc.Value;
      fTotalParcela  := Arredonda(edtVlrTotal.Value / j, 2);

      // loop para geração das parcelas
      for i := 1 to j do begin

         // definição do valor da parcela ----------------------------------------------------------
         // se for última parcela, o valor dessa parcela recebe a sobra
         if i <> j then begin
            fSobraParcela  := fTotalParcela;
         end else begin
            fSobraParcela  := fSobraGeral;
         end;
         // ----------------------------------------------------------------------------------------

         // insere a Observação na tabela ObsLancImovel
         if length(trim(memObs.Text)) > 0 then FuncoesImob.InsertObsLanc(iDocumento, memObs.Text);

         fAtual := 0;
         qryRateio.First;
         while ( (Result > -2) and not(qryRateio.EOF) ) do begin

            // ProgressBar
            AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fCount);

            // ----------------------------------------------------------------------------------------
            // verifica se o Contrato está indicado (se for necessário)
            if (ModuloImobiliario.AdminImob.bFlgObrigaContrato) and
               (not chkImovelSemContrato.Checked) then begin
               if qryRateio.FieldByName('IDCONTRATOIMOVEL').isNULL then begin

                  // Registro de ocorrência (é ERRO) por falta de contrato
                  sErro := '- Contrato NÃO Informado --> ' + qryRateio.FieldByName('IMOVEL_EXTENSO').AsString;
                  memErro.Lines.Add(sErro + ';' + #13);

                  Result := -2;
                  Break;

               end;
            end;

            // Marca o documento para liberação caso exista receita em imovel nunca locado
            if (chkImovelSemContrato.Checked) and (qryRateio.FieldByName('IDCONTRATOIMOVEL').isNULL) then iErro := -90;

            // ----------------------------------------------------------------------------------------

            if Result > -2 then begin

               fVlrParcelaImovel := Arredonda(qryRateio.FieldByName('VALOR').AsFloat * (fTotalParcela / edtVlrTotal.Value), 2);

               qryRateio.Edit;
               // se for o ultimo registro da query colocar o valor restante nela
               if qryRateio.RecNo = qryRateio.RecordCount then begin
                  qryRateio.FieldByName('VLR_PARCELA').AsFloat := fSobraParcela;
               end else begin
                  qryRateio.FieldByName('VLR_PARCELA').AsFloat := fVlrParcelaImovel;
               end;
               qryRateio.Post;

               fSobraParcela  := fSobraParcela - fVlrParcelaImovel;
               fSobraGeral    := fSobraGeral - fVlrParcelaImovel;

               // Se o resultado for ZERO, não gerar lançamento
               // No caso de rateio de contrato existem rateios com 0% (CONTRATOXIMOVEL.CIMPERCENTRATEIO)
               if ( qryRateio.FieldByName('VALOR').AsFloat <> 0 ) then begin

                  if not(GravaLancamento(iDocumento, i, j)) then begin
                     Result := -2;
                     Break;
                  end;

               end else begin

                  // Registro de ocorrência (NÃO ERRO) por valor fZERO
                  sErro := '- Valor ZERO --> ' + qryRateio.FieldByName('IMOVEL_EXTENSO').AsString;
                  if not(qryRateio.FieldByName('IDCONTRATOIMOVEL').isNULL) then sErro := sErro + ', ' + qryRateio.FieldByName('_CONTRATOEXTENSO').asString;
                  memErro.Lines.Add(sErro + ';' + #13);

                  Result := -1;
               end;

            end;

            qryRateio.Next;
            fAtual := fAtual + 1;
         end;

         // Grava erro no documento para posterior liberação
         if iErro < 0 then begin
            if not FuncoesImob.RegistraErroDocumento(iDocumento, iErro) then begin
               MsgDlg('Houve ERRO ao registrar a necessidade de liberação do documento.', 'Erro', mtError, [mbOk], 0);
               Result := -2;
               Break;
            end;
         end;

         // TODO -oAndre : condicionar o lançamento de alteradores à página atual
         if not(GravaMensagem(iDocumento, i, j)) then begin
            sErro := 'Houve ERRO ao tentar atualizar a mensagem do Boleto. ' + #13 +
                     'Deseja prosseguir ainda assim?';
            if MsgDlg(sErro, 'Erro', mtError, [mbYes, mbNo], 0) = mrNo then begin
               Repaint;
               Result := -2;
               Break;
            end;

         end;
         EscondeProgresso(ProgressBar, lblProgress, lblContador);

      end; // for

   except
      Result := -2;

      Raise;
      Repaint;
   end;
end;



function TfrmExecLancMultRec.GravaLancamento(iDocumento: int64; iParcela, iParcelas: integer): Boolean;
var
   x : integer;
   bBloqueioJudicial : Boolean;
begin
   Result := True;

   try
      bBloqueioJudicial := CtrlTipoReceita.ReceitaPossuiBloqueioJudicial(cdsReceita.FieldByName('IDTIPOCUSTORECIMO').AsInteger);

      with dtmLancImovel.qryInsertLancImovel do begin
         LimpaParametros(dtmLancImovel.qryInsertLancImovel);

         ParamByName('PIDLANCIMOVEL').AsInteger      := LeUltRegistro(nil, 'LANCAMENTOSIMOVEL');

         ParamByName('PRECPAG').AsString             := 'R';

         ParamByName('PIDPESSOA').AsInteger          := Sistema.idEmpresa;
         ParamByName('PIDFORCLI').AsInteger          := molCliente1.iCliente;

         ParamByName('PIDIMOVEL').AsInteger          := qryRateio.FieldByName('IDIMOVEL').AsInteger;
         ParamByName('PCODTIPIMOVEL').AsString       := qryRateio.FieldByName('CODTIPIMOVEL').AsString;
         ParamByName('PIDTIPOCUSTORECIMO').AsInteger := cdsReceita.FieldByName('IDTIPOCUSTORECIMO').AsInteger;

         // Contrato pode ser preenchido ou não
         if ( not(qryRateio.FieldByName('IDCONTRATOIMOVEL').isNULL) and (qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger > 0) ) then
           ParamByName('PIDCONTRATOIMOVEL').AsInteger := qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger;

         ParamByName('PMOEDARECEB').AsInteger         := Modulo.iMoedaCorrente;

         // Marchetti - Pendencia 22289
         ParamByName('PFLGINTEGRADO').AsInteger       := Ord(bBloqueioJudicial);
         // Fim Marchetti - Pendencia 22289

         ParamByName('PIDUSUARIOSISTEMA').AsInteger   := Sistema.IdUsuario;
         ParamByName('PFLGORIGEMLANC').AsString       := 'M'; // M = Lançamentos Múltiplos
         ParamByName('PCODCENTROCUSTO').AsString      := DBcboCentroCusto.LookupValue;

         if DBcboPortadorForma.LookupValue <> '' then
         ParamByName('PCODPORTFORMA').AsInteger       := StrToInt(DBcboPortadorForma.LookupValue);

         if chkBoleto.Checked then
         ParamByName('PFLGAGRUPAR').AsString          := 'S';

         // Campos variáveis em função da parcela --------------------------------------------------
         ParamByName('PDATALANCAMENTO').AsDateTime    := DiasInUteis.SomaMeses(edtDataLanc.Date, iParcela - 1);
         ParamByName('PDATAVENCIMENTO').AsDateTime    := DiasInUteis.SomaMeses(edtDataVenc.Date, iParcela - 1);
         ParamByName('PDATAEMISSAO').AsDateTime       := edtDataEmissao.Date;

         ParamByName('PMESREFERENCIA').AsInteger      := DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(edtDataVenc.Date, iParcela - 1));
         ParamByName('PANOREFERENCIA').AsInteger      := DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(edtDataVenc.Date, iParcela - 1));
         ParamByName('PMESCOMPETENCIA').AsInteger     := DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(EncodeDate(word(trunc(DBspnAno.Value)), cboMes.ItemIndex + 1, 1), iParcela - 1));
         ParamByName('PANOCOMPETENCIA').AsInteger     := DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(EncodeDate(word(trunc(DBspnAno.Value)), cboMes.ItemIndex + 1, 1), iParcela - 1));
         // ----------------------------------------------------------------------------------------

         // Valor das parcelas (previamente calculado) ---------------------------------------------
         if iParcelas = 1 then begin
            ParamByName('PVLRLANCOMRECEB').AsFloat    := qryRateio.FieldByName('VALOR').AsFloat;
            ParamByName('PVLRLANCRECEB').AsFloat      := qryRateio.FieldByName('VALOR').AsFloat;
         end else begin
            ParamByName('PVLRLANCOMRECEB').AsFloat    := qryRateio.FieldByName('VLR_PARCELA').AsFloat;
            ParamByName('PVLRLANCRECEB').AsFloat      := qryRateio.FieldByName('VLR_PARCELA').AsFloat;
         end;

         // ----------------------------------------------------------------------------------------
         ParamByName('PIDDOCUMENTO').AsInteger        := iDocumento;
         ParamByName('PNODOCUMENTO').AsFloat          := StrToFloat(edtNumDocumento.Text);

         // complemento do documento
         if iParcelas > 1 then
         ParamByName('PCOMPLDOCUMENTO').AsString      := IntToStr(iParcelas);

         // Período para contabilização diária
         if (length(trim(edtDtinictbdiaria.Text)) > 0) then
            ParamByName('PDTINICTBDIARIA').AsDateTime := edtDtinictbdiaria.Date;
         if (length(trim(edtDtfimctbdiaria.Text)) > 0) then
            ParamByName('PDTFIMCTBDIARIA').AsDateTime := edtDtfimctbdiaria.Date;

         ParamByName('PIDMODULO').AsInteger           := Sistema.IdModulo;

         // Pendência 22461 - Marcos Topini
         If length(trim(edtHistLanc.Text)) > 0 then
           ParamByName('POBS').AsString := edtHistLanc.Text;


         ExecSQL;

         //BARUC 14/11/2012 - SOL : 180032 KTN : 1674608 - INICIO

         CtrlLancamentosImovel.PrepareRatLanImovel(ParamByName('PIDLANCIMOVEL').AsInteger,
                                                   ParamByName('PIDIMOVEL').AsInteger,
                                                   ParamByName('PDATALANCAMENTO').AsDateTime);
         //BARUC 14/11/2012 - SOL : 180032 KTN : 1674608 - INICIO

         // Marchetti - Pendencia 22289
         if bBloqueioJudicial then
         begin
            cdsBloqueioImob.Data := CtrlBloqueioImob.LookupBloqueioImob(-1,iDocumento,-1,qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger);
            if cdsBloqueioImob.IsEmpty then cdsBloqueioImob.Insert
            else                            cdsBloqueioImob.Edit;

            cdsBloqueioImob.FieldByName('IDDOCUMENTOBLOQ').AsInteger  := iDocumento;
            cdsBloqueioImob.FieldByName('IDCONTRATOIMOVEL').AsInteger := qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger;
            cdsBloqueioImob.Post;

            CtrlBloqueioImob.OpenTransaction := False;
            CtrlBloqueioImob.GravaBloqueioImob;
         end;
         // Fim Marchetti - Pendencia 22289

      end;

   except
      Result := False;
   end;
end;



function TfrmExecLancMultRec.GravaMensagem(const iDocumento: int64; const iParcela, iParcelas: word): Boolean;
var
   vMensagem, vCuringa, vValor : array of string;
   sCompetencia, sNomeImoveis : String;
begin
   Result := True;
   sNomeImoveis := '';

   try
      SetLength(vMensagem, 9);
      SetLength(vCuringa, 12);
      SetLength(vValor, 12);

      // guarda as linhas digitadas
      vMensagem[0]   := copy(edtLinha1.Text, 1, 69);
      vMensagem[1]   := copy(edtLinha2.Text, 1, 69);
      vMensagem[2]   := copy(edtLinha3.Text, 1, 69);
      vMensagem[3]   := copy(edtLinha4.Text, 1, 69);
      vMensagem[4]   := copy(edtLinha5.Text, 1, 69);
      vMensagem[5]   := copy(edtLinha6.Text, 1, 69);
      vMensagem[6]   := copy(edtLinha7.Text, 1, 69);
      vMensagem[7]   := copy(edtLinha8.Text, 1, 69);
      vMensagem[8]   := copy(edtLinha9.Text, 1, 69);

      // Competencia do Lançamento
      sCompetencia := FormatFloat('00',(cboMes.ItemIndex + 1)) + '/' + FormatFloat('0000',word(trunc(DBspnAno.Value)));

      qryRateio.First;

      while not qryRateio.Eof do
      begin
        sNomeImoveis := sNomeImoveis + qryRateio.FieldByName('CIMDESCRICAO').AsString + ' ';

        qryRateio.Next;
      end;

      // inicializa os curingas e os valores
      vCuringa[0]    := '<parcela>';   {|}   vValor[0]   := IntToStr(iParcela);
      vCuringa[1]    := '<parcelas>';  {|}   vValor[1]   := IntToStr(iParcelas);
      vCuringa[2]    := '<vo>';        {|}   vValor[2]   := '';
      vCuringa[3]    := '<cm>';        {|}   vValor[3]   := '';
      vCuringa[4]    := '<juros>';     {|}   vValor[4]   := '';
      vCuringa[5]    := '<multa>';     {|}   vValor[5]   := '';
      vCuringa[6]    := '<dataval>';   {|}   vValor[6]   := '';
      vCuringa[7]    := '<imovel>';    {|}   vValor[7]   := Trim(sNomeImoveis);//25166
      vCuringa[8]    := '<recdes>';    {|}   vValor[8]   := DBcboTipoRecDes.Text;
      vCuringa[9]    := '<tolera>';    {|}   vValor[9]   := '';
      vCuringa[10]   := '<periodo>';   {|}   vValor[10]  := '';
      vCuringa[11]   := '<comp>';      {|}   vValor[11]  := sCompetencia;

      FuncoesImob.SubstituiCuringa(vMensagem, vCuringa, vValor);

      Result := FuncoesImob.InsertMsgLanc(iDocumento, '', '', -1, vMensagem) > 0;

   except
      Result := False;
   end;
end;



procedure TfrmExecLancMultRec.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   // Abre a query de rateio imovel
   if VerificaPreenchimento then begin

      try
         DesabilitaBotoes;

         if chkBoleto.Checked then begin
            AbreTabelas;
            MontaMsgBoleto;
            ntbPrincipal.PageIndex := 1;
         end else begin
            if CalculaRateio() then begin
               ntbPrincipal.PageIndex := 2;

               // permite a habilitação do botão de confirmar Lançamentos
               bHabilitaOK := True;
               // limpa quaisquer mensagens de erro anteriores
               memErro.Clear;
            end;
         end;

         Repaint;

      finally
         HabilitaBotoes;
      end;

   end;
end;



procedure TfrmExecLancMultRec.btnVoltarClick(Sender: TObject);
begin
   inherited;

   if chkBoleto.Checked then begin
      ntbPrincipal.PageIndex := 1;
   end else begin
      ntbPrincipal.PageIndex := 0;
   end;
end;



procedure TfrmExecLancMultRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ( (qryRateio.Active) and (qryRateio.UpdatesPending) ) then qryRateio.CancelUpdates;
   FechaTabelas;
   FreeAndNil( CtrlLancamentosImovel );   

   inherited;
end;



procedure TfrmExecLancMultRec.FormShow(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex := 0;
   Repaint;

   AbreTabelas;

   // gerar apenas um idDocumento para todos os lançamentos para agrupá-los
   // na contabilidade e no contas a receber
   iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);

   // preenche o número do documento = id.doc. 18/07/2001
   edtNumDocumento.Text := FormatFloat('#0', iDocumento);

   // competência default
   cboMes.ItemIndex  := DiasInUteis.ExtraiMes(Date)-1;
   DBspnAno.Value    := DiasInUteis.ExtraiAno(Date);
end;



procedure TfrmExecLancMultRec.DBgrdLancRateioCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecLancMultRec.DBgrdLancRateioTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecLancMultRec.DBgrdLancRateioEnter(Sender: TObject);
begin
   inherited;
   if (qryRateio.Active) and (not(qryRateio.isEmpty)) and (qryRateio.State = dsBrowse) then qryRateio.Edit;
end;



procedure TfrmExecLancMultRec.DBgrdLancRateioExit(Sender: TObject);
begin
   inherited;
   if (qryRateio.Active) and (not(qryRateio.isEmpty)) and (qryRateio.State = dsEdit) then qryRateio.Post;
end;



procedure TfrmExecLancMultRec.btnAtualizarClick(Sender: TObject);
begin
   inherited;
   FazerRefresh;
end;



procedure TfrmExecLancMultRec.cboMesChange(Sender: TObject);
begin
   inherited;
   edtDataLanc.Date    := FuncoesImob.DataLancamento((cboMes.ItemIndex + 1), word(trunc(DBspnAno.Value)), edtDataVenc.Date);
   CalculaDataCtbDiaria;
end;



procedure TfrmExecLancMultRec.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;

   case ntbPrincipal.PageIndex of
      0: lblTitulo.Caption := 'Lançamento Múltiplo de Receitas [Seleção]';
      1: lblTitulo.Caption := 'Lançamento Múltiplo de Receitas [Mensagem]';
      2: lblTitulo.Caption := 'Lançamento Múltiplo de Receitas [Lançamentos]';
      3: lblTitulo.Caption := 'Lançamento Múltiplo de Receitas [Alteradores]';
   else
         lblTitulo.Caption := 'Lançamento Múltiplo de Receitas';
   end;

   // só dá a opção de repetir
   if ntbPrincipal.PageIndex = 3 then chkRepetirAlterador.Visible := chkParcelar.Checked;
end;



procedure TfrmExecLancMultRec.qryRateio_CONTRATOEXTENSOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
   inherited;

   if qryRateio.FieldByName('CONNUMERO').isNULL then begin
      Text := qryRateio.FieldByName('CONNOME').AsString;
   end else begin
      Text := qryRateio.FieldByName('CONNUMERO').AsString + ' - ' + qryRateio.FieldByName('CONNOME').AsString;
   end;
end;



procedure TfrmExecLancMultRec.DBgrdLancamentosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecLancMultRec.DBgrdLancamentosTopRowChanged(Sender: TObject);
begin
   inherited;

   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecLancMultRec.btnInsertClick(Sender: TObject);
var
   iImovel : integer;
   MS_     : TMontaSelect;
   iConImovel : Integer; // Daniel Simões
begin
   inherited;

   iConImovel := qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger;

// Daniel - 24085 - Início -----------------------------------------------------
   if (ModuloImobiliario.AdminImob.bFlgUsaUnidade) then begin
     if not (chkImovelSemContrato.Checked) then begin
        {Verifica se é possível indicar um contrato já encerrado nos Lançamentos
         a receber}
        if (ModuloImobiliario.AdminImob.bFlgLancRecEncerra) then
          MS_ := dtmMS.MS_UnidadeContrato
        else
          MS_ := dtmMS.MS_UnidadeContratoV;
     end else
       MS_ := dtmMS.MS_UnidadeComOuSemContrato;
   end else begin
// Daniel - 24085 - Fim --------------------------------------------------------

     if not chkImovelSemContrato.checked then begin
        // verifica se é possível indicar um contrato já encerrado nos Lançamentos a receber
        if ModuloImobiliario.AdminImob.bFlgLancRecEncerra then
             MS_ := dtmMS.MS_ImovelContrato
        else MS_ := dtmMS.MS_ImovelContratoV;
     end else begin
        MS_ := dtmMS.MS_ImovelComOuSemContrato;
     end;
   end; // Fim 24085

   MS_.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if MS_.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      qryRateio.Insert;

      // Imóvel
      if chkImovelSemContrato.checked then begin
        qryRateio.FieldByName('IDIMOVEL').AsInteger         := StrToInt(MS_.ValoresChave[0]);
      end else begin
        qryRateio.FieldByName('IDIMOVEL').AsInteger         := StrToInt(MS_.ValoresChave[1]);
      end;

      qryRateio.FieldByName('IMOVEL_EXTENSO').AsString := MS_.ValoresChave[2] + ' - ' + MS_.ValoresChave[3];
      qryRateio.FieldByName('CODTIPIMOVEL').AsString   := MS_.ValoresChave[8];
      qryRateio.FieldByName('IMOCODIGO').AsString      := MS_.ValoresChave[9]; // Daniel - 23208

// Daniel Simões - 22524 - -----------------------------------------------------
      if ( iConImovel>0 ) then begin
        if iConImovel <> StrToInt(MS_.ValoresChave[0]) then begin
          MsgDlg('Imóveis pertencentes a contratos diferentes.', 'Aviso', mtWarning, [mbOk], 0);
          Repaint;
          qryRateio.Cancel;
          Screen.Cursor := crDefault;
          Exit;
        end;
      end;
// Daniel Simões - 22524 - -----------------------------------------------------

      // Contrato
      if BuscaContrato( qryRateio.FieldByName('IDIMOVEL').AsInteger ) then begin
        // Daniel Simões - 22919 - Início ----------------------------------------------
        if (iConImovel>0) then begin
          qryRateio.FieldByName('IDCONTRATOIMOVEL').asInteger := qryBuscaContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger;
          qryRateio.FieldByName('_CONTRATOEXTENSO').AsString  := qryBuscaContrato.FieldByName('CONTRATO_EXTENSO').AsString;
          qryRateio.FieldByName('CONNUMERO').AsString         := qryBuscaContrato.FieldByName('CONNUMERO').AsString;
          qryRateio.FieldByName('CONNOME').AsString           := qryBuscaContrato.FieldByName('CONNOME').AsString;
        end
        else
        begin
          if (iCliente=qryBuscaContratoIDLOCATARIO.AsInteger) then begin
            qryRateio.FieldByName('IDCONTRATOIMOVEL').asInteger := qryBuscaContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger;
            qryRateio.FieldByName('_CONTRATOEXTENSO').AsString  := qryBuscaContrato.FieldByName('CONTRATO_EXTENSO').AsString;
            qryRateio.FieldByName('CONNUMERO').AsString         := qryBuscaContrato.FieldByName('CONTRATO_EXTENSO').AsString;
            qryRateio.FieldByName('CONNOME').AsString           := qryBuscaContrato.FieldByName('CONNOME').AsString;
          end else if (qryBuscaContratoSTATUS.AsString = 'Vigente') then begin    // Edilaine - SOL 1077772-5681 / KTN 1358973
            qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger := -1;
            qryRateio.FieldByName('_CONTRATOEXTENSO').AsString  := qryBuscaContrato.FieldByName('CONTRATO_EXTENSO').AsString;
            qryRateio.FieldByName('CONNUMERO').AsString         := qryBuscaContrato.FieldByName('CONTRATO_EXTENSO').AsString;
            qryRateio.FieldByName('CONNOME').AsString           := qryBuscaContrato.FieldByName('CONNOME').AsString;
           // Edilaine - SOL 1077772-5681 / KTN 1358973 - fim
          end else begin
            qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger := -1;
            qryRateio.FieldByName('_CONTRATOEXTENSO').AsString  := '';
            qryRateio.FieldByName('CONNUMERO').AsString         := '';
            qryRateio.FieldByName('CONNOME').AsString           := '';
          end;
        end;
      end;
// Daniel Simões - 22919 - Fim -------------------------------------------------

      // Verifica se o Imóvel está ativo
      if (not ModuloImobiliario.AdminImob.bFlgLancRecInativo) and (MS_.ValoresChave[6] <> '1') then begin
         Screen.Cursor := crDefault;
         MsgDlg('O Imóvel escolhido não está ativo! Não é possível atribuir-lhe uma receita.', 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         qryRateio.Cancel;
         Exit;
      end;

      qryRateio.Post;
      Screen.Cursor := crDefault;
   end else begin
      // cancela a inserção na query
      qryRateio.Cancel;
   end;
end;



function TfrmExecLancMultRec.BuscaContrato(const iIdImovel: Integer): Boolean;
var dDataLancto : TDateTime;
begin
    dDataLancto := EncodeDate(Word(trunc(DBspnAno.Value)), Word(trunc(cboMes.ItemIndex + 1)), 1);

    LimpaParametros(qryBuscaContrato);
    qryBuscaContrato.ParamByName('IDIMOVEL').AsInteger    := iIdImovel;
    qryBuscaContrato.ParamByName('DATALANCTO').AsDateTime := dDataLancto;
    qryBuscaContrato.Open;

    Result := not qryBuscaContrato.IsEmpty;
end;



procedure TfrmExecLancMultRec.btnExcluiClick(Sender: TObject);
begin
   inherited;

   Screen.Cursor := crHourGlass;

   qryRateio.Delete;
   TotalizaRateio;

   Screen.Cursor := crDefault;
end;



procedure TfrmExecLancMultRec.btnTotalizaClick(Sender: TObject);
begin
   inherited;
   TotalizaRateio;
end;



procedure TfrmExecLancMultRec.btnContinuarLancClick(Sender: TObject);
begin
   inherited;

   if VerificaTipoImoveisLanc then begin

      AbreTipoAlterador;

      with qryAlterador do begin
         LimpaParametros(qryAlterador);
         ParamByName('PIDDOCUMENTO').asInteger := iDocumento;
         Open;
      end;

   end;
end;



procedure TfrmExecLancMultRec.btnContinuarMsgClick(Sender: TObject);
begin
   // Abre a query de rateio imovel
   if VerificaPreenchimentoMsg then begin

      try
         DesabilitaBotoes;

         if CalculaRateio then begin
            ntbPrincipal.PageIndex := 2;
            Repaint;

            // permite a habilitação do botão de confirmar Lançamentos
            bHabilitaOK := True;

            // limpa quaisquer mensagens de erro anteriores
            memErro.Clear;
         end;

      finally
         HabilitaBotoes;
      end;

   end;
end;



procedure TfrmExecLancMultRec.btnVoltarMsgClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmExecLancMultRec.btnLimpaMsgClick(Sender: TObject);
begin
   inherited;

   edtLinha1.Clear;
   edtLinha2.Clear;
   edtLinha3.Clear;
   edtLinha4.Clear;
   edtLinha5.Clear;
   edtLinha6.Clear;
   edtLinha7.Clear;
   edtLinha8.Clear;
   edtLinha9.Clear;
end;



procedure TfrmExecLancMultRec.chkParcelarClick(Sender: TObject);
begin
   inherited;

   if chkParcelar.Checked then begin
      DBspnNumParcelas.Enabled   := True;
      lblParcelas.Enabled        := True;
   end else begin
      DBspnNumParcelas.Value     := 1;
      DBspnNumParcelas.Enabled   := False;
      lblParcelas.Enabled        := False;
   end;
end;



procedure TfrmExecLancMultRec.DBcboPortadorFormaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   chkBoleto.Checked := not(dtmLookImobiliario.qryLookPortadorFormaIDCONFIGBARRAS.IsNull);
end;

procedure TfrmExecLancMultRec.DBcboPortadorFormaChange(Sender: TObject);
begin
   inherited;
   chkBoleto.Checked := not(dtmLookImobiliario.qryLookPortadorFormaIDCONFIGBARRAS.IsNull);
end;

procedure TfrmExecLancMultRec.molContrato1btnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato1.btnBuscaContratoClick(Sender);
  if molContrato1.edtContrato.Text <> '' then begin
     DBcboGrupo.Clear;
     DBcboGrupo.LookupValue := '';
     DBcboGrupo.Enabled := false; // ELS SOL 107772/5681 KINTANA 1358973
     molCliente1.iCliente := molContrato1.iLocatario;
     AtribuiMolCliente(molContrato1.iLocatario, molCliente1.edtNomeFantasia, molCliente1.edtRazaoSocial);
     DBcboPortadorForma.LookupValue := IntToStr(molContrato1.iCodportForma);
  end;

end;

procedure TfrmExecLancMultRec.DBcboGrupoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if DBcboGrupo.Text <> '' then begin
      molContrato1.edtContrato.Clear;
      molContrato1.iContrato := -1;
      molContrato1.edtContrato.Enabled := False; // ELS SOL 107772/5681 KINTANA 1358973
      molContrato1.btnBuscaContrato.Enabled := False; // ELS SOL 107772/5681 KINTANA 1358973
   end;
end;

procedure TfrmExecLancMultRec.btnConfirmaLancClick(Sender: TObject);
begin
   inherited;

   if not (VerificaTipoImoveisLanc) then Exit;

   if not (VerificaReceitaContratual) then Exit;

// Daniel Simões - 22524 - -----------------------------------------------------
   if (VerificaDocumentoExistente(StrToInt(edtNumDocumento.Text))) then begin
     MsgDlg('Número de Documento já existe.', 'Aviso', mtWarning, [mbok], 0);
     Repaint;
     Exit;
   end;
// Daniel Simões - 22524 - -----------------------------------------------------

   // o total lançado tem que bater com o total do lançamento
   if Arredonda(TotalizaRateio, 2) <> Arredonda(edtVlrTotal.Value, 2) then begin
      MsgDlg('O Total do lançamentos não confere com o valor informado.', 'Aviso', mtWarning, [mbok], 0);
      Repaint;
      Exit;
   end;

   StartTransacao;

   iResult := GeraLancamentos;
   if iResult > -1 then begin // Daniel Simões - 23/03/2006 - ------------------
         CommitTransacao;

         if ( (iResult = 0) and (length(trim(memErro.Text)) = 0) ) then begin

            if not bFechaForm then begin
               // gerar apenas um idDocumento para todos os lançamentos para agrupá-los
               // na contabilidade e no contas a receber
               iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);

               // preenche o número do documento = id.Documento 18/07/2001
               edtNumDocumento.Text := FormatFloat('#0', iDocumento);

               qryRateio.Close;
               ntbPrincipal.PageIndex := 0;
            end;

            Screen.Cursor := crDefault;
            MsgDlg('Lançamento concluído.', 'Informação', mtInformation, [mbOK], 0);
            Repaint;

            if bFechaForm then Close;

         end else begin
            bHabilitaOK                := False;
            btnConfirmaLanc.Enabled    := False;
            pgcLancamentos.ActivePage  := tbsErro;
         end;

   end else begin
      RollBackTransacao;

      bHabilitaOK                := False;
      btnConfirmaLanc.Enabled    := False;

      if length(trim(memErro.Text)) > 0 then pgcLancamentos.ActivePage := tbsErro;


      MsgDlg('Houve ERRO na tentativa de Lançamento! Os Lançamentos não foram gerados.', 'Erro', mtError, [mbOk], 0);
      Repaint;
   end;
end;

procedure TfrmExecLancMultRec.FormCreate(Sender: TObject);
begin
  inherited;
   bFechaForm := False;
   if ModuloImobiliario.AdminImob.bFlgHistContDifAP then
        memObs.MaxLength := 1000    // histórico contábil (concatenado) <> obs ap
   else memObs.MaxLength := 200;    // histórico contábil = obs ap

   // Apenas exibe o período da Ctb diária, se o mesmo estiver ativado no parâmetro
   if ModuloImobiliario.AdminImob.bFlgDiario then begin
      gbPeriodoCtbDiaria.Visible := True;
      lblCentroCusto.Top         := 197;
      dbcboCentroCusto.Top       := 211;
      lblFormaCobranca.Top       := 234;
      DBcboPortadorForma.Top     := 248;
      chkBoleto.Left             := 16;
      chkBoleto.Top              := 274;
      chkImovelSemContrato.Left  := 362;
   end else begin
      gbPeriodoCtbDiaria.Visible := False;
      lblCentroCusto.Top         := 142;
      dbcboCentroCusto.Top       := 156;
      lblFormaCobranca.Top       := 197;
      DBcboPortadorForma.Top     := 211;
      chkBoleto.Left             := 16;
      chkBoleto.Top              := 255;      
      chkImovelSemContrato.Left  := 16;
   end;

  // Marcio Motta - 20/02/2004 - Pendência: 16112
  CtrlTipoReceita := TCtrlTipoCustoRecImov.Create;

  CtrlTipoReceita.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                             ComunsImobiliario.MensErroMT);


  if ModuloImobiliario.AdminImob.bFlgBloqRecAluguel then
     cdsReceita.Data     := CtrlTipoReceita.LookupTipoCustoRecImov (Sistema.IdModulo,'R',-1,'',False)
  else
     cdsReceita.Data     := CtrlTipoReceita.LookupTipoCustoRecImov (Sistema.IdModulo,'R');

  edtDataEmissao.Date := Date;

  CtrlBloqueioImob := TCtrlBloqueioImob.Create;
  CtrlBloqueioImob.InitializeAs(CtrlTipoReceita);
  CtrlBloqueioImob.CdsBloqueioImob := cdsBloqueioImob;
  // Helen - SOL: 172902 KTN: 1577381
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(CtrlTipoReceita);
  CtrlLancamentosImovel := TCtrlLancamentosImovel.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
//  CtrlLancamentosImovel := TCtrlLancamentosImovel.Create;

  DiasUteis.SetLogradouro(Sistema.IdEmpresa, _IdCidade, _IdPais, _UF); // Peterson Victor  - SIG25057
end;

procedure TfrmExecLancMultRec.DBcboTipoRecDesCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  CalculaDataCtbDiaria;

  //Cássio Rovaroto - SIG nº 103856 - Início
  if cdsReceita.FieldByName('FLGRECCUSTCONTRATO').AsInteger = 1 then
  begin
    chkImovelSemContrato.Checked := False;
    chkImovelSemContrato.Enabled := False;

    if DBcboGrupo.DisplayValue <> EmptyStr then
    begin
      MsgDlg('Este tipo receita é restrito a contratos registrados.', 'Aviso', mtWarning, [mbOK], 0);
      DBcboGrupo.LookupField := EmptyStr;
    end;
    DBcboGrupo.Enabled := False;
  end
  else
  begin
    chkImovelSemContrato.Enabled := True;
    DBcboGrupo.Enabled := True;
  end;
  //Cássio Rovaroto - SIG nº 103856 - Fim
end;

procedure TfrmExecLancMultRec.CalculaDataCtbDiaria;
var iAnoLancContab, iMesLancContab, iDiaLancContab : word;
begin
// Marcio Motta - 20/02/2004 - Pendência: 16112
// Alterado para pegar a data de Lançamento contábil ao invés da data de Competência

  // para a data de lancamento contabil
  if ModuloImobiliario.AdminImob.bFlgDiario then
    begin
      // Se Tipo de Despesa e Período de Competência estiverem preenchidos
      if (DBcboTipoRecDes.Text <> '') and (cboMes.Text <> '') and (DbspnAno.Value > 0) then
        begin
          // Decodifica a data de Lançamento contábil
          DecodeDate(edtDataLanc.DateTime,iAnoLancContab,iMesLancContab,iDiaLancContab);

          // Se período de contabilização diária for MENSAL
          if cdsReceita.FieldByName('FLGDIARIO').AsString = 'M' then
            begin
              // Habilita os Edits das Datas
              edtDtinictbdiaria.Enabled := True;
              edtDtfimctbdiaria.Enabled := True;
              // Atribui a Data Inicial o primeiro dia do Mês ref. Lançamento contábil
              edtDtinictbdiaria.Date    := EncodeDate(iAnoLancContab,iMesLancContab,1);
              // Atribui a Data Final o último dia do Mês ref. Lançamento contábil
              edtDtfimctbdiaria.Date    := DiasUteis.UltDiaMes(iAnoLancContab,iMesLancContab);
            end
          else
            // Se período de contabilização diária for NÃO MENSAL
            if cdsReceita.FieldByName('FLGDIARIO').AsString = 'A' then
              begin
                // Habilita os Edits das Datas
                edtDtinictbdiaria.Enabled := True;
                edtDtfimctbdiaria.Enabled := True;
                // Atribui a Data Inicial o primeiro dia do Ano ref. Lançamento contábil
                edtDtinictbdiaria.Date    := EncodeDate(iAnoLancContab,1,1);
                // Atribui a Data Final o último dia do Ano ref. Lançamento contábil
                edtDtfimctbdiaria.Date    := EncodeDate(iAnoLancContab,12,31);
              end
            else
              begin
                // Se período de Contabilização diária não estiver definido
                // Desabilita os Edits das datas
                edtDtinictbdiaria.Enabled := False;
                edtDtfimctbdiaria.Enabled := False;
                // Limpa o Conteúdo dos Edits das Datas
                edtDtinictbdiaria.Clear;
                edtDtfimctbdiaria.Clear;
              end;
        end
     else
        begin
           // Apaga as datas INICIAL e FINAL de Contabilização DIÁRIA
           edtDtinictbdiaria.Clear;
           edtDtfimctbdiaria.Clear;
        end;
    end;
end;



procedure TfrmExecLancMultRec.FormDestroy(Sender: TObject);
begin
  // Marcio Motta - 20/02/2004 - Pendência: 16112
  FreeAndNil( CtrlTipoReceita );
  FreeAndNil( CtrlBloqueioImob );
  FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
  inherited;
end;

procedure TfrmExecLancMultRec.edtDataLancChange(Sender: TObject);
begin
   inherited;
   CalculaDataCtbDiaria;
end;


function TfrmExecLancMultRec.ReceitaContratual(const IDContrato : Int64;
                                               const IDImovel   : Int64 = -1
                                              ): Int64;
var
   iContratoBusca : Int64;
begin
   Result         := -1;
   iContratoBusca := -1;

   try
      // -------------------------------------------------------------------------------------------
      // Se o Contrato for indicado, usa o mesmo para buscar a receita contratual
      if IDContrato > 0 then
      begin
         iContratoBusca := IDContrato;
      end
      else
      begin
         // Senão busca, pelo Imovel o contrato ao qual pertence
         with qryContratoDoImovel do
         begin
            LimpaParametros(qryContratoDoImovel);
            ParamByName('PIDIMOVEL').AsInteger := IDImovel;
            Open;

            if not(isEmpty) then iContratoBusca := qryContratoDoImovelIDCONTRATOIMOVEL.AsInteger;

            Close;
         end;
      end;
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      if iContratoBusca > 0 then
      begin
         with qryReceitaContratual do
         begin
            LimpaParametros(qryReceitaContratual);
            ParamByName('PIDCONTRATOIMOVEL').AsInteger := iContratoBusca;
            Open;

            Result := qryReceitaContratualIDTIPOCUSTORECIMO.AsInteger;

            Close;
         end;
      end;
      // -------------------------------------------------------------------------------------------

   finally
      qryReceitaContratual.Close;
   end;
end;



function TfrmExecLancMultRec.VerificaReceitaContratual: Boolean;
var
   IDImovel    : Integer;
   IDContrato  : Integer;
begin
   Result := True;

   // ----------------------------------------------------------------------------------------------

   if not(ModuloImobiliario.AdminImob.bFlgBloqRecAluguel) then
   begin
      Result := True;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   qryRateio.First;
   while not(qryRateio.EOF) do
   begin
      IDContrato := -1;
      if not(qryRateio.FieldByName('IDCONTRATOIMOVEL').isNULL) then IDContrato := qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger;

      if (IDContrato > 0) and
         (molContrato1.iContrato > 0) and
         (IDContrato <> molContrato1.iContrato) then
      begin
         if StrToInt(DBcboTipoRecDes.LookupValue) = ReceitaContratual(IDContrato) then
         begin
            MsgDlg('Não é permitido fazer lançamentos a receber da receita contratual do imóvel ' +
                   qryRateio.FieldByName('IMOVEL_EXTENSO').AsString + '!', 'Administração Imobiliária', mtWarning,
                   [mbOk], 0);
            Repaint;

            Result := False;

            Exit;
         end;
      end
      else 
      begin
         IDImovel := qryRateio.FieldByName('IDIMOVEL').AsInteger;

         if StrToInt(DBcboTipoRecDes.LookupValue) = ReceitaContratual(-1, IDImovel) then
         begin
            MsgDlg('Não é permitido fazer lançamentos a receber da receita contratual do imóvel ' +
                   qryRateio.FieldByName('IMOVEL_EXTENSO').AsString + '!', 'Administração Imobiliária', mtWarning,
                   [mbOk], 0);
            Repaint;

            Result := False;

            Exit;
         end;
      end;  
      qryRateio.Next;
   end;  
end;



procedure TfrmExecLancMultRec.molContrato1btnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato1.btnLimpaContratoClick(Sender);
  DBcboGrupo.Enabled := true; // ELS SOL 107772/5681 KINTANA 1358973

end;

// Daniel Simões - 22524 - Início ----------------------------------------------
function TfrmExecLancMultRec.VerificaDocumentoExistente(iIdDocumento: Integer): Boolean;
begin
// Função que verifica a existência do ID do documento na tabela LANCAMENTOSIMOVEL
// e retorna False se existir
  Result := False;

  with qryLocalizaDocumento do begin
    LimpaParametros(qryLocalizaDocumento);
    ParamByName('PIDDOCUMENTO').AsInteger := iIdDocumento;
    Open;

    if (RecordCount>0) then Result := True;
  end;
end;
// Daniel Simões - 22524 - Fim -------------------------------------------------

procedure TfrmExecLancMultRec.molCliente1btnBuscaCliClick(Sender: TObject);
begin
  inherited;
  molCliente1.btnBuscaCliClick(Sender);

  // Daniel Simões - 22919
  if molCliente1.bRetornouValor = True then
    molContrato1.btnLimpaContratoClick(Sender);
  iCliente := molCliente1.iCliente;
  // Daniel Simões - 22919
end;

//Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
function TfrmExecLancMultRec.EfetuarRateioMenorMaior(
  pValorRest: Extended): Extended;
var
    pCdsRateio : TCMClientDataSet;
    intFields  : Integer;
    i          : Integer;
    iValorRateio : integer;     // edilaine - SOL 247935 / KTN 662587
begin

  //Verifica se o valorResto > 0 e se existe zerados
    qryRateio.First;

    //Cria o cds para melhor manipulação dos dados
    pCdsRateio := TCMClientDataSet.Create(nil);
    pCdsRateio.Close;
    pCdsRateio.FieldDefs.Clear;

    //Criar as Fields no CDS igual aos da Query
    for intFields := 0 to qryRateio.FieldCount - 1 do
    begin
      pCdsRateio.FieldDefs.Add( qryRateio.Fields[intFields].Name,
                                qryRateio.Fields[intFields].DataType,
                                qryRateio.Fields[intFields].Size,
                                qryRateio.Fields[intFields].Required,
                              );

    end;

    qryRateio.First;
    //Abre o cds
    pCdsRateio.CreateDataSet;

    //Passa os valores da Query para o CDS
    while not (qryRateio.Eof) do
    begin
        pCdsRateio.Append;

        for i := 0 to pCdsRateio.FieldCount - 1 do
           pCdsRateio.Fields[i].Value := qryRateio.Fields[i].Value;

        pCdsRateio.Post;
        qryRateio.Next;
    end;

  pCdsRateio.IndexFieldNames := 'qryRateioVALOR';

  // edilaine - SOL 256577 / PPM 843368 - inicio
  if pValorRest >  0 then
  begin
    pCdsRateio.First;

    // edilaine - SOL 247935 / KTN 662587 - inicio
    pValorRest   := ComunsImobiliario.Arredonda(pValorRest,2);
    iValorRateio := ExtraiDecimalParaInteiros(pValorRest);

    while not (pCdsRateio.eof) and (iValorRateio > 0) {(StrToFloat(FloatToStr(pValorRest)) > 0)} do
    begin
      //if ((StrToFloat(FloatToStr(pValorRest)) > 0)) then
      begin
        pCdsRateio.Edit;
        pCdsRateio.FieldByName('qryRateioVALOR').Value := pCdsRateio.FieldByName('qryRateioVALOR').Value + 0.01;
        {pValorRest := StrToFloat(FloatToStr(pValorRest)) - 0.01;}
        iValorRateio := iValorRateio - 1;
        pCdsRateio.Post;
      end;
      pCdsRateio.Next;

      if (pCdsRateio.eof) and (iValorRateio > 0) {(StrToFloat(FloatToStr(pValorRest)) > 0)} then
        pCdsRateio.First;
    end;
  end
  else
  begin
    pCdsRateio.last;

    pValorRest   := ComunsImobiliario.Arredonda(pValorRest,2);
    iValorRateio := ExtraiDecimalParaInteiros(pValorRest);

    while not (pCdsRateio.bof) and (iValorRateio < 0) do
    begin
      pCdsRateio.Edit;
      pCdsRateio.FieldByName('qryRateioVALOR').Value := pCdsRateio.FieldByName('qryRateioVALOR').Value - 0.01;
      iValorRateio := iValorRateio + 1;
      pCdsRateio.Post;

      pCdsRateio.Prior;

      if (pCdsRateio.bof) and (iValorRateio < 0) then
         pCdsRateio.Last;
    end;

  end;           // edilaine - SOL 256577 / PPM 843368 - fim
  pValorRest := (iValorRateio / 100);
  // edilaine - SOL 247935 / KTN 662587 - fim

  //Límpa os indices e os filtros do Cds
  qryRateio.Filtered  := False;
  pCdsRateio.Filtered := False;
  pCdsRateio.IndexFieldNames := EmptyStr;
  pCdsRateio.IndexDefs.Clear;

  //Atualiza a Query Rateio com os valores contidos no CDS
  qryRateio.First;
  pCdsRateio.First;

  while not pCdsRateio.eof do
  begin
    // edilaine - SOL 247935 / KTN 662587 - inicio
    if qryRateio.Locate('IDIMOVEL', pCdsRateio.FieldByName('qryRateioIDIMOVEL').AsString, []) then
    begin
      qryRateio.Edit;
      qryRateio.FieldByName('VALOR').Value := pCdsRateio.FieldByName('qryRateioVALOR').Value;
      qryRateio.Post;
    end;

    {qryRateio.Filtered := False;
    qryRateio.Filter   := 'IDIMOVEL = ' + pCdsRateio.FieldByName('qryRateioIDIMOVEL').AsString;
    qryRateio.Filtered := True;

    if (qryRateio.RecordCount > 0) then
    begin
      qryRateio.Edit;
      qryRateio.FieldByName('VALOR').Value := pCdsRateio.FieldByName('qryRateioVALOR').Value;
      qryRateio.Post;
    end; }
    // edilaine - SOL 247935 / KTN 662587 - fim

    pCdsRateio.Next;
  end;

  //Tira os filtros da Query
  qryRateio.Filtered := False;
  pCdsRateio.IndexFieldNames := EmptyStr;
  pCdsRateio.IndexDefs.Clear;

  Result := pValorRest;

  FreeAndNil(pCdsRateio);

end;

function TfrmExecLancMultRec.EfetuarRateioZerado(pValorResto: Extended;
  pQry : TwwQuery): Extended;
var i, intFields : integer;
    pCountMaiorZero : integer;
    pCdsRateio : TCMClientDataSet;
    pSql       : String;
    iValorRateio : integer;    // edilaine - SOL 247935 / KTN 662587
begin
  //Verifica se o valorResto > 0 e se existe zerados
    qryRateio.First;
    pQry.DisableControls;

    //Cria o cds para melhor manipulação dos dados
    pCdsRateio := TCMClientDataSet.Create(nil);
    pCdsRateio.Close;
    pCdsRateio.FieldDefs.Clear;
    pCdsRateio.DisableControls;
    //Criar as Fields no CDS igual aos da Query
    for intFields := 0 to qryRateio.FieldCount - 1 do
    begin
      pCdsRateio.FieldDefs.Add( qryRateio.Fields[intFields].Name,
                                qryRateio.Fields[intFields].DataType,
                                qryRateio.Fields[intFields].Size,
                                qryRateio.Fields[intFields].Required,
                              );

    end;


    qryRateio.First;
    //Abre o cds
    pCdsRateio.CreateDataSet;

    //Passa os valores da Query para o CDS
    while not (qryRateio.Eof) do
    begin
        pCdsRateio.Append;

        for i := 0 to pCdsRateio.FieldCount - 1 do
           pCdsRateio.Fields[i].Value := qryRateio.Fields[i].Value;
        pCdsRateio.Post;
        qryRateio.Next;
    end;
    pQry.First;

    // edilaine - SOL 247935 / KTN 662587 - inicio
    pValorResto  := ComunsImobiliario.Arredonda(pValorResto,2);
    iValorRateio := ExtraiDecimalParaInteiros(pValorResto);

    //Verifica se existe resto no Rateio
    for i := 0 to pQry.RecordCount - 1 do
    begin
      if (iValorRateio > 0) {(StrToFloat(FloatToStr(pValorResto)) > 0)} then // Verifica se ainda existe Resto
      begin
        pQry.Edit;
        pQry.FieldByName('VALOR').Value := pQry.FieldByName('VALOR').Value + 0.01;

        iValorRateio := iValorRateio - 1;
        {if (StrToFloat(FloatToStr(pValorResto)) > 0.01) then
          pValorResto := StrToFloat(FloatToStr(pValorResto)) - 0.01
        else
          pValorResto := 0; }

        pQry.Post;

        pQry.Next;

        if (pQry.eof) and (iValorRateio > 0) {(StrToFloat(FloatToStr(pValorResto)) > 0)} then
          pQry.First;

      end
      else
        Break;
    end;
    pValorResto := (iValorRateio / 100);
    // edilaine - SOL 247935 / KTN 662587 - fim

    //Procura no pCds se existe algum registro ainda zerado
    pQry.Filtered       := False;
    pQry.Filter         := 'VALOR = 0';
    pQry.Filtered       := True;

    //Verifica se a consulta retorna valor
    if (pQry.RecordCount > 0) then
    begin

      //Ordena o cdsImoveis pelos valores do maior para o menor
      pCdsRateio.Filtered       := False;
      pCdsRateio.Filter         := 'qryRateioVALOR > 0 ';
      pCdsRateio.Filtered       := True;

      pCdsRateio.IndexFieldNames := 'qryRateioVALOR';
      pCdsRateio.IndexDefs.AddIndexDef.Options := [ixDescending];

      pQry.First;
      pCdsRateio.Last;

      while not pQry.Eof do
      begin
        if ((StrToFloat(pCdsRateio.FieldByName('qryRateioVALOR').AsString) - 0.01) >= 0.01) then
        begin
        //Retira 1 centavo do maior valor
          pCdsRateio.Edit;
          pCdsRateio.FieldByName('qryRateioVALOR').Value := pCdsRateio.FieldByName('qryRateioVALOR').Value - 0.01;
          pCdsRateio.Post;

          pQry.Edit;
          pQry.FieldByName('VALOR').Value := pQry.FieldByName('VALOR').Value + 0.01;
          pQry.Post;
        end;

        if (pCdsRateio.Bof) and not (pQry.Eof) then
        begin
          pCountMaiorZero := 0;
          pCdsRateio.First;

          while not pCdsRateio.Eof do
          begin
            if (pCdsRateio.FieldByName('qryRateioVALOR').AsCurrency > 0.01) then
               pCountMaiorZero := pCountMaiorZero + 1;
            pCdsRateio.Next;
          end;
          pCdsRateio.Last;
          if (pCountMaiorZero = 0) then
            Break;
        end
        else
          pCdsRateio.Prior;
      end;
    end;

    //Seleciona os valores que estavam zerados e procura no pCds para atualiza-los
    pQry.Filtered       := False;
    pQry.Filter         := 'VALOR > 0';
    pQry.Filtered       := True;

    pCdsRateio.Filtered := False;
    pCdsRateio.IndexFieldNames := EmptyStr;
    pCdsRateio.IndexDefs.Clear;


    //Verifica se pCds Zerado retornou valor
    if (pQry.RecordCount > 0) then
    begin
      pQry.First; //Volta para o primeiro registro
      while not pQry.Eof do
      begin
        // edilaine - SOL 247935 / KTN 662587 - incio
        //Procura o registro do pCds dentro do CdsImoveis.
        if pCdsRateio.Locate('qryRateioIDIMOVEL', pQry.FieldByName('IDIMOVEL').AsString, []) then
        begin
          {pCdsRateio.Filtered := False;
          pCdsRateio.Filter   := ' qryRateioIDIMOVEL = ' + pQry.FieldByName('IDIMOVEL').AsString;
          pCdsRateio.filtered := True;

          //Verifica se localizou o registro e atualiza o valor do mesmo dentro do cdsImoveis.
          if (pCdsRateio.RecordCount > 0) then}
          begin
            pCdsRateio.Edit;
            pCdsRateio.FieldByName('qryRateioVALOR').Value := pQry.fieldByName('VALOR').AsCurrency;
            pCdsRateio.Post;
          end;
        end;           // edilaine - SOL 247935 / KTN 662587 - fim

        pQry.Next;
      end;
    end;

    qryRateio.Filter   := '';
    qryRateio.Filtered := False;
    qryRateio.First;
    //Repassa todas as alterações do CDS para a Query
    pCdsRateio.Filtered := False;
    pCdsRateio.IndexFieldNames := EmptyStr;
    pCdsRateio.IndexDefs.Clear;
    pCdsRateio.First;


    while not pCdsRateio.Eof do
    begin

//        if qryRateio.locate('IDIMOVEL;IDCONTRATOIMOVEL;IMOCODIGO;CODTIPIMOVEL;CONNUMERO;IMOAREA', VarArrayOf([
//                            pCdsRateio.FieldByName('qryRateioIDIMOVEL').AsString,
//                            pCdsRateio.FieldByName('qryRateioIDCONTRATOIMOVEL').AsString,
//                            pCdsRateio.FieldByName('qryRateioIMOCODIGO').AsString,
//                            pCdsRateio.FieldByName('qryRateioCODTIPIMOVEL').AsString,
//                            pCdsRateio.FieldByName('qryRateioCONNUMERO').AsString,
//                            pCdsRateio.FieldByName('qryRateioIMOAREA').AsString]), [])then
//        begin
//          qryRateio.Edit;
//          qryRateio.FieldByName('VALOR').Value := pCdsRateio.fieldByName('qryRateioVALOR').AsCurrency;
//          qryRateio.Post;
//        end;
//        pCdsRateio.Next;


      qryRateio.Close;
      LimpaParametros(qryRateio);
      qryRateio.ParamByName('PIDPESSOA').AsInteger := -1;
      qryRateio.ParamByName('PIDGRUPORATEIO').AsInteger := -1;

      if molContrato1.edtContrato.Text <> '' then 
         qryRateio.ParamByName('PIDCONTRATOIMOVEL').AsInteger := -1;

      qryRateio.Open;

      while not (pCdsRateio.Eof) do
      begin
          qryRateio.Append;

          for i := 0 to pCdsRateio.FieldCount - 1 do
             qryRateio.Fields[i].Value := pCdsRateio.Fields[i].Value;
          qryRateio.Post;
          pCdsRateio.Next;
      end;

    end;


    pQry.Filtered       := False;
    qryRateio.Filtered  := False;

    pCdsRateio.IndexFieldNames := EmptyStr;
    pCdsRateio.IndexDefs.Clear;

    Result := pValorResto;
    FreeAndNil(pCdsRateio);
    FreeAndNil(pQry);
end;
//Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim

procedure TfrmExecLancMultRec.molContrato1edtContratoExit(Sender: TObject);
begin
  inherited;
  // ELS SOL 107772/5681 KINTANA 1358973 FIM
   if molContrato1.edtContrato.Text = '' then begin
      DBcboGrupo.Enabled := true;
      DBcboGrupo.Clear;
   end;
  // ELS SOL 107772/5681 KINTANA 1358973 FIM
end;

procedure TfrmExecLancMultRec.DBcboGrupoExit(Sender: TObject);
begin
  inherited;
  //ELS SOL 107772 KINTANA 1358973 INICIO
   if DBcboGrupo.Text = '' then begin
      molContrato1.edtContrato.Enabled := true;
      molContrato1.btnBuscaContrato.Enabled := true;
      molContrato1.edtContrato.Clear;
   end;
   //ELS SOL 107772 KINTANA 1358973 INICIO
end;

procedure TfrmExecLancMultRec.edtDataVencExit(Sender: TObject);
begin
  inherited;
  if _IdCidade <> 0 then
  begin
     if not diasuteis.DiaUtil(edtDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false) then
     begin
        if (Application.MessageBox('Data de vencimento não é um dia útil. Deseja alterar ?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
        begin
           if (Application.MessageBox('Lançar para o primeiro dia útil posterior?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
              edtDataVenc.Date := diasuteis.PrimeiroDiaUtilPosterior(edtDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false)
           else
              edtDataVenc.Date := diasuteis.UltDiaUtilAnterior(edtDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false);
         end;
     end;
  end;

end;

end.
