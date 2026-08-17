{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------
 Desenvolvedor : Taffarel Sevaybriker
 Data          : 25.02.2021
 SOL_Kintana   : SIG113613
 Descrição     : Ajuste na exportação excel para não cortar os dígitos do campo
                 Conta.
--------------------------------------------------------------------------------
 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Autor(a)    :  Henrique Massão
 Data        :  26/02/2009
 Pendência   :  SOL 109421 KINTANA 496332
 Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
--------------------------------------------------------------------------------
 Data         : 20/08/04
 Desenvolvedor: Alex Pereira
 Pendência    : 17116
 Descrição    : O relatório estava dando erro selecionando os filtros
                [19] Quebra do relatório por sub-conta
                [26] Considerar contas com saldo e sem movimento
                Foi necessário fazer um novo sub-select para este relatório.
-------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidade              }
{                                                       }
{ Analista Responsável: veronica Almeida                }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit RRazaoAnalSimples;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, uCmRptManager, TXComp, CmParamReport,uCmSqlParams, uCtrlRptBalancete, uCtrlPeriodo,
  ppBands, ppClass, ppVar, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppCache,
  ppProd, ppReport, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, mask,
  DBClient, Provider, ADODB, uSistema,uCMfileUtils,uCtrlGeral,uCtrlParamIntegra,
  uCMClientDataSet, FCmReport, TXRB, uCtrlContab;

type
  TRptRazaoAnalSimples = class(TFrmCmReport)
    dsRazaoAnal: TwwDataSource;
    cdsRazaoAnal: TClientDataSet;
    sqlRazaoAnal: TCMSqlParams;
    cdsAtivProjG: TCMClientDataSet;
    sqlAtivProjG: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlPlanoPrev: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    pplRazaoAnalCad: TppBDEPipeline;
    rptRazaoAnalCad: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLblTituloCad: TppLabel;
    ppLine1: TppLine;
    LblNomeEmpresaCad: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLblTitulo2Cad: TppLabel;
    ppLabel16: TppLabel;
    rptRazaoAnalLabel18Cad: TppLabel;
    rptRazaoAnalLabel20Cad: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBMemo1: TppDBMemo;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    dbSumMovCad: TppDBCalc;
    dbtxtSaldoAntCad: TppDBText;
    dbtxtSaldoCad: TppDBText;
    txtSaldoRazAnalCad: TppLabel;
    txtDebCreRazAnalCad: TppLabel;
    dbtxtMovRazAnalCad: TppDBText;
    dbtxtContraPartidaCad: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine5: TppLine;
    LblNomeSistemaCad: TppLabel;
    ppLabel23: TppLabel;
    lblContRazAnalCad: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    lblCalcRazAnalCad: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLine6: TppLine;
    dbtxtContaCad: TppDBText;
    ppLabel25: TppLabel;
    ppDBText16: TppDBText;
    txtSaldoCabRazAnalCad: TppLabel;
    txtDebCreCabRazAnalCad: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel29: TppLabel;
    ppLine7: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine8: TppLine;
    ppLabel30: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel31: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLine9: TppLine;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppGroupHeaderBand1AfterGenerate(Sender: TObject);
    procedure ppGroupHeaderBand1BeforeGenerate(Sender: TObject);
    procedure ppFooterBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand1AfterGenerate(Sender: TObject);
  private
    { Private declarations }
    CtrlRptBalancete : TCtrlRptBalancete;
    CtrlPeriodo      : TCtrlPeriodo;
    sDataInicial     : String;
    sDataFinal       : String;
    sContaInicial    : String;
    sContaFinal      : String;
    sCCustoInicial   : String;
    sCCustoFinal     : String;
    sSubContaInicial : String;
    sSubContaFinal   : String;
    sAtividade       : String;
    sModulo          : String;
    sHistorico       : String;
    sTipoOperacao    : String;
    bCorresp         : Boolean;
    bContra          : Boolean;
    iPagIni          : Integer;
    sNomePatro       : String;
    sNomePlanoPrev   : String;
    sMascContas      : String;
    sMascCC          : String;
    sMascUnidNeg     : String;
    CtrlGeral  : TCtrlGeral;
    CtrlContab : TCtrlContab;
  public
    { Public declarations }

  end;

implementation

Uses uCtrlPadroes, uDatabase, DBaseDados, uFuncaoGeral, uString,uModulo;

{$R *.DFM}

procedure TRptRazaoAnalSimples.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;

   sDataInicial     :='';
   sDataFinal       :='';
   sContaInicial    :='';
   sContaFinal      :='';
   sCCustoInicial   :='';
   sCCustoFinal     :='';
   sSubContaInicial :='';
   sSubContaFinal   :='';
   sAtividade       :='';
   sModulo          :='';
   sHistorico       :='';
   sTipoOperacao    :='';
   bCorresp         :=False;
   bContra          :=False;
   iPagIni          :=1;
   sNomePatro       :='';
   sNomePlanoPrev   :='';



   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[5].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[8].LookupSettings.SQL.Text:='SELECT '+
                                                    '   NOMEMODULO, '+
                                                    '   IDMODULO '+
                                                    'FROM '+
                                                    '   MODULO '+
                                                    'ORDER BY NOMEMODULO';

   CmpRptCM.ParamValues[9].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODSUBCONTA, '+
                                                    '   NOMESUBCONTA '+
                                                    'FROM '+
                                                    '   SUBCONTA '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOMESUBCONTA';

   CmpRptCM.ParamValues[10].LookupSettings.SQL.Text:='SELECT '+
                                                     '   CODSUBCONTA, '+
                                                     '   NOMESUBCONTA '+
                                                     'FROM '+
                                                      '   SUBCONTA '+
                                                     'WHERE '+
                                                     '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                     'ORDER BY NOMESUBCONTA';

   CmpRptCM.ParamValues[11].LookupSettings.SQL.Text:='SELECT '+
                                                     '   HITCODHIST, '+
                                                     '   HITDESCR1 '+
                                                     'FROM '+
                                                     '   HISTOPADRAO '+
                                                     'WHERE '+
                                                     '   (IDPESSOA='+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                     'ORDER BY HITCODHIST';



   CmpRptCM.ParamValues[1].AsDateTime:=Now;
   CmpRptCM.ParamValues[2].AsDateTime:=Now;

end;

procedure TRptRazaoAnalSimples.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
   inherited;
   case Index of
      1: sDataInicial:=TPainelControles(Sender).CtrlDateTimePicker.Text;
      2: sDataFinal:=TPainelControles(Sender).CtrlDateTimePicker.Text;
      3: sContaInicial:=TPainelControles(Sender).CtrlLookup.Text;
      4: sContaFinal:=TPainelControles(Sender).CtrlLookup.Text;
      5: sAtividade:=TPainelControles(Sender).CtrlLookup.Text;
      6: sCCustoInicial:=TPainelControles(Sender).CtrlLookup.Text;
      7: sCCustoFinal:=TPainelControles(Sender).CtrlLookup.Text;
      8: sModulo:=TPainelControles(Sender).CtrlLookup.Text;
     11: sHistorico:=TPainelControles(Sender).CtrlLookup.Text;
     12: sTipoOperacao:=TPainelControles(Sender).CtrlLookup.Text;
   end;
end;

procedure TRptRazaoAnalSimples.CrmRptCMBeforePrint(Sender: TObject);
var
   sTitulo         : string;
   sIDPlanoPrev    : String;
   sIDPatro        : String;
   sAtivSel        : String;
   sPatroSel       : String;
   sPlanoSel       : String;
   iGrau,iNumDig,iContaReg,iPlano : Integer;
begin
   inherited;
   Try
      sDataInicial     :=CmpRptCM.ParamValues[1].AsString;
      sDataFinal       :=CmpRptCM.ParamValues[2].AsString;
      sContaInicial    :=CmpRptCM.ParamValues[3].AsString;
      sContaFinal      :=CmpRptCM.ParamValues[4].AsString;
      sAtividade       :=CmpRptCM.ParamValues[5].AsString;
      sModulo          :=CmpRptCM.ParamValues[8].AsString;
      sSubContaInicial :=CmpRptCM.ParamValues[9].AsString;
      sSubContaFinal   :=CmpRptCM.ParamValues[10].AsString;
      sHistorico       :=CmpRptCM.ParamValues[11].AsString;
      sTipoOperacao    :=CmpRptCM.ParamValues[12].AsString;
      sIDPlanoPrev     :=CmpRptCM.ParamValues[29].AsString;
      sIDPatro         :=CmpRptCM.ParamValues[30].AsString;
      sCCustoInicial   :=CmpRptCM.ParamValues[6].AsString;
      sCCustoFinal     :=CmpRptCM.ParamValues[7].AsString;

      LblNomeEmpresaCad.Caption := Sistema.RazaoSocial;

      sAtivSel := '';
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
      begin
         sqlAtivProjG.SQL.Clear;
         sqlAtivProjG.SQL.Add('SELECT UNIDNEGOC, NOME, UNECODIGO '+
                            'FROM  UNIDNEGOCIO '+
                            'WHERE '+
                            '   (IDPESSOA    = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND ' +
                            '   (UNIDNEGOC   = '+CmpRptCM.ParamValues[5].AsString + ') ' +
                            'ORDER BY UNIDNEGOC');
         sqlAtivProjG.Open;
         sAtivSel := cdsAtivProjG.FieldByName('NOME').asString;
      end;


      // *** seleciona os nomes da ativ/proj se selecionadas ***
      If  CmpRptCM.ParamValues[31].AsString <> '' then
      Begin
          with sqlAtivProjG.SQL do
          begin
            Clear;
            Add('SELECT UNECODIGO, UNIDNEGOC, NOME                                    ');
            Add('FROM UNIDNEGOCIO                                                     ');
            Add('WHERE                                                                ');
            Add('       (IDPESSOA = '+ FloatToStr(CrmRptCM.IdEmpresa) +')             ');
            Add('   AND (UNETIPO = ''A'')                                             ');
            Add('   AND UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString)+ ') ');
            Add('ORDER BY UNECODIGO                                                   ');
          end;

          sqlAtivProjG.Open;
          sAtivSel  := '';
          iContaReg := 0;
          cdsAtivProjG.First;
          While not cdsAtivProjG.Eof do
          Begin
            Inc(iContaReg);
            If cdsAtivProjG.RecordCount = 1 Then
            Begin
               sAtivSel := Trim(cdsAtivProjG.FieldByName('NOME').AsString)
            End Else
            Begin
              If cdsAtivProjG.RecordCount = iContaReg  Then
                 sAtivSel := sAtivSel + Trim(cdsAtivProjG.FieldByName('NOME').AsString)
              Else
                 sAtivSel := sAtivSel + Trim(cdsAtivProjG.FieldByName('NOME').AsString) + '-';
            End;
            cdsAtivProjG.Next;
          End;
      End;

      //*** preeenche titulo com patrocinadoras e planos ***
      If  CmpRptCM.ParamValues[29].AsString <> '' then
      Begin
          with sqlPlanoPrev.SQL do
          begin
            Clear;
            Add('SELECT IDPLANOPREV, NOME              ');
            Add('FROM PLANPREVCONTABIL                 ');
            Add('WHERE IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[29].AsString)+ ') ');
          end;

          sqlPlanoPrev.Open;
          sPlanoSel  := '';
          iContaReg := 0;
          cdsPlano.First;
          While not cdsPlano.Eof do
          Begin
            Inc(iContaReg);
            If cdsPlano.RecordCount = 1 Then
            Begin
               sPlanoSel := Trim(cdsPlano.FieldByName('NOME').AsString)
            End Else
            Begin
              If cdsPlano.RecordCount = iContaReg  Then
                 sPlanoSel := sPlanoSel + Trim(cdsPlano.FieldByName('NOME').AsString)
              Else
                 sPlanoSel := sPlanoSel +Trim(cdsPlano.FieldByName('NOME').AsString) + '-';
            End;
            cdsPlano.Next;
          End;
      End;

      //*** reotina para pegar as patrocinadoras ***
      If  CmpRptCM.ParamValues[30].AsString <> '' then
      Begin
          with sqlPatro.SQL do
          begin
            Clear;
            Add('SELECT  PA.IDPESSOA, PE.NOME      ');
            Add('FROM PESSOA PE, PATRO PA          ');
            Add('WHERE (PA.IDPESSOA = PE.IDPESSOA) ');
            Add('  AND PA.IDPESSOA IN (' + trim(CmpRptCM.ParamValues[30].AsString)+ ')');
          end;

          sqlPatro.Open;
          sPlanoSel  := '';
          iContaReg := 0;
          cdsPlano.First;
          While not cdsPatro.Eof do
          Begin
            Inc(iContaReg);
            If cdsPatro.RecordCount = 1 Then
            Begin
               sPatroSel := Trim(cdsPatro.FieldByName('NOME').AsString)
            End Else
            Begin
              If cdsPatro.RecordCount = iContaReg  Then
                 sPatroSel := sPatroSel + Trim(cdsPatro.FieldByName('NOME').AsString)
              Else
                 sPatroSel := sPatroSel + Trim(cdsPatro.FieldByName('NOME').AsString) + '-';
            End;
            cdsPatro.Next;
          End;

      End;

      rptRazaoAnalLabel20Cad.Caption := '';
      rptRazaoAnalLabel18Cad.Caption := '';

      if sAtivSel <> '' then begin
         rptRazaoAnalLabel20Cad.Caption := rptRazaoAnalLabel20Cad.Caption+'Atividades/Projetos: ' + sAtivSel;
      end;
      if sPatroSel <> '' then begin
         rptRazaoAnalLabel18Cad.Caption := 'Patrocinadoras: ' + sPatroSel;
      end;

      if sPlanoSel <> '' then begin
         rptRazaoAnalLabel18Cad.Caption := rptRazaoAnalLabel18Cad.Caption  + '  Planos: ' + sPlanoSel;
      end;

      ppGroupHeaderBand2.Visible   := CmpRptCM.ParamValues[23].AsBoolean; // Quebra Período
      ppGroupHeaderBand3.Visible   := CmpRptCM.ParamValues[22].AsBoolean; // Quebra Dia
      ppGroupFooterBand3.Visible   := CmpRptCM.ParamValues[22].AsBoolean; // Quebra Dia
      ppGroupFooterBand2.Visible   := CmpRptCM.ParamValues[23].AsBoolean; // Quebra Período

      sDataInicial  := CmpRptCM.ParamValues[1].AsString;
      sDataFinal    := CmpRptCM.ParamValues[2].AsString;
      sContaInicial := CmpRptCM.ParamValues[3].AsString;
      sContaFinal   := CmpRptCM.ParamValues[4].AsString;

      CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,DateToStr(CmpRptCM.ParamValues[1].AsDateTime));

      if CmpRptCM.ParamValues[27].AsString = '' then   //Testa Edit de Título
      begin
          //Imprime os títulos
          sTitulo := 'Razão Analítico Simplificado - período de ' + sDataInicial + ' a ' + sDataFinal;
          pplblTituloCad.caption := sTitulo;

          sTitulo := '';

          if trim(sContaInicial) <> '' then
             sTitulo := sTitulo +  '     Conta Inicial : ' + sContaInicial;

          if trim(sContaFinal) <> '' then
             sTitulo := sTitulo +  '     Conta Final : ' + sContaFinal;

          if trim(sCCustoInicial) <> '' then
             sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + sCCustoInicial ;

          if trim(sCCustoFinal) <> '' then
             sTitulo := sTitulo +  '     Centro de Custo Final : ' + sCCustoFinal;

          if trim(sAtividade) <> '' then
             sTitulo := sTitulo +  '     Atividade/Projeto : '+ sAtividade;

          if trim(sModulo) <> '' then
             sTitulo := sTitulo +  '     Módulo : ' + sModulo;

          if trim(sTipoOperacao) <> '' then
             sTitulo := sTitulo +  '     Tipo de Operação : ' + sTipoOperacao;

          if trim(sHistorico) <> '' then
             sTitulo := sTitulo +  '     Histórico Padrão : ' + sHistorico;

          case CmpRptCM.ParamValues[14].AsInteger of
             0: sTitulo := sTitulo +  '    Lançamentos : TODOS';
             1: sTitulo := sTitulo +  '    Lançamentos : Somente Integrados';
             2: sTitulo := sTitulo +  '    Lançamentos : Somente NÃO Integrados';
          end;


          if CmpRptCM.ParamValues[19].AsBoolean then  // Quebra Sub-Conta
             sTitulo := sTitulo +  '     Quebra por Sub-Conta'
          else
             sTitulo := sTitulo +  '     Quebra por Conta Contábil';


          pplblTitulo2Cad.caption := sTitulo;

       end else
       begin
         pplblTituloCad.caption  := CmpRptCM.ParamValues[27].AsString;
         pplblTitulo2Cad.caption := CmpRptCM.ParamValues[28].AsString;
       end;

      //Configura a quebra de página
      rptRazaoAnalCad.Groups[0].NewPage := CmpRptCM.ParamValues[21].AsBoolean;

      //Configura a máscara das contas contábeis

      sMascContas  := '';
      sMascCC      := '';
      sMascUnidNeg := '';

      bCorresp:=CmpRptCM.ParamValues[20].AsBoolean;
      bContra :=CmpRptCM.ParamValues[18].AsBoolean;

      CtrlContab.SelecionaPlanoData(CrmRptCM.IdEmpresa,CmpRptCM.ParamValues[1].AsString); //Everson Cunha - SIG102043

      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
         //sMascContas :=ParamIntegra.MascaraPlano; //Everson Cunha - SIG102043
         sMascContas :=CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
         sMascCC     :=ParamIntegra.MascaraCC;
         sMascUnidNeg:=ParamIntegra.MascaraUnidNegoc;
      end;


      iPagIni:=CmpRptCM.ParamValues[16].AsInteger;
      iPlano  := Modulo.iPlano;

      If iPagIni = 0 Then iPagIni := 1;

      iNumDig := 0;
      if CmpRptCM.ParamValues[20].AsBoolean then begin
         iGrau   := CtrlGeral.CalcGrauMax(ParamIntegra.MascaraUnidNegoc);
         iNumDig := CtrlGeral.CalcNumEleGrau(ParamIntegra.MascaraUnidNegoc,(iGrau-1));
      end;

      //Faz a query
      cdsRazaoAnal.Close;
      //Faz a query
      cdsRazaoAnal.Close;
      with sqlRazaoAnal.Sql do
      begin
          Clear;
          Add('SELECT /*+ RULE */                                                       ');
          Add('    L.PLACONTA|| '' '' AS PLACONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, SC.NOMESUBCONTA, CC.NOME AS NOMECC, C.PLAGRAU, ');
          if CmpRptCM.ParamValues[25].AsBoolean  then begin
             Add('   U1.UNECODIGO, U1.UNIDNEGOC, U1.NOME,                                ');
          end else begin
             Add('   U.UNECODIGO, U.UNIDNEGOC, U.NOME,                                   ');
          end;
          Add('(0) AS SALDOCABECALHO, ('' '') AS DEBCRECABECALHO,                        ');
          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('   L.PLACONTA||'' - ''||SC.NOMESUBCONTA AS PLACONTAREF,                ');
             Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOMEREF,         ');
          end else begin
             Add('   L.PLACONTA|| '' '' AS PLACONTAREF, ');
             Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOMEREF,         ');
          end;
          Add('   C.PLACONCORRESP, L.IDMODULO, P.PLNEFETIVADO, TO_CHAR(P.PLNDATDIA,''YYYYMM'') AS PERIODO,  ');
          Add('   DECODE(P.PLNEFETIVADO,''S'',''*'','' '') AS EFET,                         ');
          Add('   SA.SALDOANT, SS.SALDO, P.PLNCODIGO, P.PLNPLANIL, P.PLNDATDIA,L.LACVALOR,  ');
          Add('   (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * (-1)))) AS MOVIMENT,');
          Add('   (RTRIM(L.LACHIST1)||'' ''||RTRIM(L.LACHIST2)||'' ''||                  ');
          Add('    RTRIM(L.LACHIST3)||'' ''||RTRIM(L.LACHIST4)||'' ''||RTRIM(L.LACHIST5)) AS HISTORICO, ');
          Add('   (TO_CHAR(P.PLNPLANIL,''999999'')||''/''||TO_CHAR(L.LACNUMLAN,''9999'')) AS LANCAMENTO, ');
          Add('   (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) AS DEB,                ');
          Add('   (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) AS CRED,               ');
          Add('   PE.NOME AS NOMEPATRO, PP.NOME AS NOMEPLANOPREV,                    ');
          Add('   L.IDPATRO, L.IDPLANOPREV,                                          ');
          Add('   (0) AS SALDOCORRENTE,                                              ');
          Add('   ('' '')  AS DEBCRE,                                                ');
          if CmpRptCM.ParamValues[18].AsBoolean  then
             Add('   DECODE(CP.CONTRAPARTIDA,NULL,CP1.CONTRAPARTIDA,CP.CONTRAPARTIDA) AS CONTRAPARTIDA, ')
          else
             Add('   (''                  '') AS CONTRAPARTIDA, ');
          Add('   L.CODCENTROCUSTO, L.CODSUBCONTA, L.LACNUMLAN,                      ');
          Add('   L.LACDEBCRE, L.LACNUMDOC                                           ');
          Add('FROM                                                                  ');
          Add('   LANCAMENTO L, PLANILHA P, PLANOCONTA C, SUBCONTA SC, UNIDNEGOCIO U, CENTCUST CC,PESSOA PE, PLANPREVCONTABIL PP, ');
          Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD, ');
          if CmpRptCM.ParamValues[18].AsBoolean  then begin
             Add('     (SELECT L.PLNCODIGO, L.LACNUMLAN, L.LACDEBCRE,                ');
             if CmpRptCM.ParamValues[20].AsBoolean  then
                Add('             C.PLACONCORRESP AS CONTRAPARTIDA                   ')
             else
                Add('             L.PLACONTA AS CONTRAPARTIDA                        ');
             Add('      FROM PLANILHA P, LANCAMENTO L, PLANOCONTA C                  ');
             Add('      WHERE                                                        ');
             Add('            (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM)            ');
             Add('        AND (P.PEREXERCICIO >= :EXERCICIO)                         ');
             Add('        AND (RTRIM(P.IDPESSOA) = :IDPESSOA)                        ');
             Add('        AND (EXISTS (SELECT X.PLNCODIGO                            ');
             Add('                     FROM PLANILHA X, LANCAMENTO Y                 ');
             Add('                     WHERE                                         ');
             Add('                           (X.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) ');
             Add('                       AND (X.PEREXERCICIO >= :EXERCICIO)                         ');
             Add('                       AND (RTRIM(X.IDPESSOA) = :IDPESSOA)         ');
             Add('                       AND (RTRIM(Y.PLACONTA) >=:CONTAINI)         ');
             Add('                       AND (RTRIM(Y.PLACONTA) <=:CONTAFIM)         ');
             Add('                       AND (X.PLNCODIGO = Y.PLNCODIGO)             ');
             Add('                       AND (P.PLNCODIGO = X.PLNCODIGO)))           ');
             Add('        AND (L.PLNCODIGO=P.PLNCODIGO)                              ');
             Add('        AND (L.LACTIPO = ''2'')                                    ');
             Add('        AND (C.PLANO = L.PLANO)                                    ');
             Add('        AND (C.PLACONTA = L.PLACONTA))  CP,                        ');
             Add('     (SELECT L.PLNCODIGO, L.LACNUMLAN, L.LACDEBCRE,                ');
             if CmpRptCM.ParamValues[20].AsBoolean  then
                Add('             C.PLACONCORRESP AS CONTRAPARTIDA  ')
             else
                Add('             L.PLACONTA AS CONTRAPARTIDA       ');
             Add('      FROM PLANILHA P, LANCAMENTO L, PLANOCONTA C,                   ');
             Add('          (SELECT L.PLNCODIGO, COUNT(*)                              ');
             Add('           FROM PLANILHA P, LANCAMENTO L                             ');
             Add('           WHERE                                                     ');
             Add('                 (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM)         ');
             Add('             AND (P.PEREXERCICIO >= :EXERCICIO)                      ');
             Add('             AND (RTRIM(P.IDPESSOA) = :IDPESSOA)                     ');
             Add('             AND (P.PLNCODIGO = L.PLNCODIGO)                         ');
             Add('           GROUP BY L.PLNCODIGO                                      ');
             Add('           HAVING COUNT(*) = 2) N                                    ');
             Add('      WHERE                                                          ');
             Add('            (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM)              ');
             Add('        AND (P.PEREXERCICIO >= :EXERCICIO)                         ');
             Add('        AND (P.IDPESSOA = :IDPESSOA)                                 ');
             Add('        AND (EXISTS (SELECT X.PLNCODIGO                              ');
             Add('                     FROM PLANILHA X, LANCAMENTO Y                   ');
             Add('                     WHERE                                           ');
             Add('                           (X.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) ');
             Add('                       AND (X.PEREXERCICIO >= :EXERCICIO)                         ');
             Add('                       AND (RTRIM(X.IDPESSOA) = :IDPESSOA)             ');
             Add('                       AND (X.PLNCODIGO = Y.PLNCODIGO)                 ');
             Add('                       AND (RTRIM(Y.PLACONTA) >=:CONTAINI)             ');
             Add('                       AND (RTRIM(Y.PLACONTA) <=:CONTAFIM)             ');
             Add('                       AND (P.PLNCODIGO = X.PLNCODIGO)))               ');
             Add('         AND (L.PLNCODIGO = P.PLNCODIGO)                               ');
             Add('         AND (L.LACTIPO <> ''2'' )                                     ');
             Add('         AND (C.PLANO = L.PLANO)                                       ');
             Add('         AND (C.PLACONTA = L.PLACONTA)                                 ');
             Add('         AND (N.PLNCODIGO = L.PLNCODIGO)) CP1,                         ');
          end;
          if CmpRptCM.ParamValues[25].AsBoolean  then begin
             Add('   (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO               ');
             Add('    WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')                ');
             Add('      AND (IDPESSOA =:IDPESSOA) ) U1,                                ');
          end;
          Add('   (SELECT                                                              ');
          Add('       S.PLACONTA,                                                      ');
          if CmpRptCM.ParamValues[19].AsBoolean then begin
             Add('    S.CODSUBCONTA, S.IDPESSOA,                                        ');
          end;
          Add('       SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) -   ');
          Add('           DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOANT ');
          Add('    FROM PLANOSALDO S  ,SUBCONTA SC                                      ');
          Add('    WHERE                                                                ');
          Add('	      (S.PEREXERCICIO =:EXERCICIO) AND                                  ');
          Add('       (S.PERNUMERO IS NULL) AND                                         ');
          Add('       (S.PLANO = :PLANO) AND                                            ');
          Add('       (S.PLACONTA >=:CONTAINI)  AND                                    ');
          Add('       (S.PLACONTA <=:CONTAFIM) AND                                     ');
          Add('       (S.IDPESSOA =:IDPESSOA) AND                                       ');
          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('   (S.CODSUBCONTA IS NOT NULL)  AND                                   ');
          end;
          if trim(sAtividade) <> '' then begin
             Add('   ((S.UNIDNEGOC =:UNIDNEGOC) AND                                     ');
             Add('   (S.IDPESSOA =:PESSOA)) AND                                         ');
          end;
          if CmpRptCM.ParamValues[15].AsInteger = 0  then begin
             if trim(sSubContaInicial) <> '' then begin
                Add('   ((S.CODSUBCONTA >= :SUBCONTAINI) AND                            ');
                Add('   (S.IDPESSOA =:PESSOA)) AND                                      ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('   ((S.CODSUBCONTA <= :SUBCONTAFIM) AND                            ');
                Add('   (S.IDPESSOA =:PESSOA)) AND                                      ');
             end;
          end else begin
             if trim(sSubContaInicial) <> '' then begin
                Add('   ((SC.NOMESUBCONTA >= :SUBCONTAINI) AND                          ');
                Add('   (S.IDPESSOA =:PESSOA)) AND                                      ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('  ((SC.NOMESUBCONTA <= :SUBCONTAFIM) AND                           ');
                Add('  (S.IDPESSOA =:PESSOA)) AND                                       ');
             end;
          end;

          if trim(CmpRptCM.ParamValues[31].AsString) <> '' then begin
             Add('     (S.UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString) + ')) AND ');
          end;

         if (trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
             Add('     (S.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND             ');
         end;
         if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
             Add('     (S.IDPATRO IN (' + trim(sIDPatro) + ')) AND                     ');
         end;
         if trim(sCCustoInicial) <> '' then begin
             Add('    (S.CODCENTROCUSTO >=:CCUSTOINI) AND                              ');
             Add('    (S.IDEMPRESA =:EMPRESA) AND                                      ');
         end;
         if trim(sCCustoFinal) <> '' then begin
             Add('    (S.CODCENTROCUSTO <=:CCUSTOFIM) AND                              ');
             Add('    (S.IDEMPRESA =:EMPRESA)  AND                                     ');
          end;
          Add('      (S.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                           ');
          Add('      (S.IDPESSOA    = SC.IDPESSOA(+))                                  ');
          Add('    GROUP BY S.PLACONTA                                                 ');
          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('    ,S.CODSUBCONTA, S.IDPESSOA                                                   ');
          end;
             Add('    ) SA,                                                             ');
          Add('   (SELECT                                                               ');
          Add('       L.PLACONTA,                                                       ');
          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('    L.CODSUBCONTA, L.IDPESSOA,                                                ');
          end;
          Add('       SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * (-1)))) AS SALDO');
          Add('    FROM PLANILHA P, LANCAMENTO L, SUBCONTA SC                                     ');
          Add('    WHERE                                                               ');
          Add('	         (P.PEREXERCICIO =:EXERCICIO) AND                              ');
          Add('          (P.PLNDATDIA < :DATAINI)  AND                                 ');

          if CmpRptCM.ParamValues[14].AsInteger = 1  then begin
             Add('       (P.PLNEFETIVADO = ''S'') AND                                  ');
          end;
          if CmpRptCM.ParamValues[14].AsInteger = 2  then begin
             Add('       ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND    ');
          end;

          Add('          (RTRIM(P.IDPESSOA) =:IDPESSOA) AND                                   ');
          Add('          (L.PLNCODIGO = P.PLNCODIGO) AND                               ');
          Add('          (RTRIM(L.PLACONTA) >= :CONTAINI) AND                          ');
          Add('          (RTRIM(L.PLACONTA) <= :CONTAFIM) AND                          ');

          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('       (L.CODSUBCONTA IS NOT NULL) AND                               ');
          end;

          if  trim(sAtividade) <> '' then begin
             Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                                ');
             Add('       (L.IDPESSOA =:PESSOA)) AND                                    ');
          end;
          if CmpRptCM.ParamValues[15].AsInteger = 0 then begin
             if trim(sSubContaInicial) <> '' then begin
                Add('       ((L.CODSUBCONTA >= :SUBCONTAINI) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                                 ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('       ((L.CODSUBCONTA <= :SUBCONTAFIM) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                                 ');
             end;
          end else begin
             if trim(sSubContaInicial) <> '' then begin
                Add('       ((SC.NOMESUBCONTA >= :SUBCONTAINI) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                                 ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('       ((SC.NOMESUBCONTA <= :SUBCONTAFIM) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                                 ');
             end;
          end;
          if trim(CmpRptCM.ParamValues[31].AsString) <> '' then begin
             Add('      (L.UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString) + ')) AND ');
          end;

         if (trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
             Add('      (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND      ');
         end;
         if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
             Add('      (L.IDPATRO IN (' + trim(sIDPatro) + ')) AND ');
         end;

         if trim(sCCustoInicial) <> '' then  begin
             Add('       (L.CODCENTROCUSTO >= :CCUSTOINI) AND                        ');
             Add('       (L.IDEMPRESA =:EMPRESA) AND                                 ');
         end;

         if trim(sCCustoFinal) <> '' then begin
             Add('       (L.CODCENTROCUSTO <= :CCUSTOFIM) AND                        ');
             Add('       (L.IDEMPRESA =:EMPRESA) AND                                 ');
         end;
         if trim(sModulo) <> '' then begin
             Add('       (L.IDMODULO =:MODULO) AND                                   ');
         end;

         if trim(sTipoOperacao) <> '' then begin
             if CmpRptCM.ParamValues[13].AsBoolean then begin
                Add('       (RTRIM(L.TIPCODIGO) <> RTRIM(:TIPO)) AND                 ');
             end else begin
                Add('       (RTRIM(L.TIPCODIGO) = RTRIM(:TIPO)) AND                  ');
             end;
         end;

         if trim(sHistorico) <> '' then begin
             Add('       (RTRIM(L.HITCODHIST) = RTRIM(:HIST)) AND                    ');
         end;
          Add('       (L.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                        ');
          Add('       (L.IDPESSOA = SC.IDPESSOA(+))                                  ');
          Add('    GROUP BY L.PLACONTA                                               ');
          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('    ,L.CODSUBCONTA, L.IDPESSOA                                     ');
          end;
          Add('    ) SS                                                              ');
          Add('WHERE                                                                 ');
          Add('    (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                   ');
          Add('    (P.PEREXERCICIO >= :EXERCICIO) AND                        ');
          if CmpRptCM.ParamValues[14].AsInteger = 1  then begin
             Add(' (P.PLNEFETIVADO = ''S'') AND                                      ');
          end;
          if CmpRptCM.ParamValues[14].AsInteger = 2  then begin
             Add(' ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND        ');
          end;

          if trim(sAtividade) <> '' then  begin
             Add(' ((L.UNIDNEGOC =:UNIDNEGOC) AND                                    ');
             Add('  (L.IDPESSOA =:PESSOA)) AND                                       ');
          end;
          if CmpRptCM.ParamValues[15].AsInteger = 0  then begin
             if trim(sSubContaInicial) <> '' then begin
                Add('       ((L.CODSUBCONTA >= :SUBCONTAINI) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('       ((L.CODSUBCONTA <= :SUBCONTAFIM) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
             end;
          end else begin
             if trim(sSubContaInicial) <> '' then begin
                Add('       ((SC.NOMESUBCONTA >= :SUBCONTAINI) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('       ((SC.NOMESUBCONTA <= :SUBCONTAFIM) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
             end;
          end;
          if trim(CmpRptCM.ParamValues[31].AsString) <> '' then begin
             Add('      (L.UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString) + ')) AND ');
          end;
          if (trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
             Add('      (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND      ');
          end;
          if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
             Add('      (L.IDPATRO IN (' + trim(sIDPatro) + ')) AND              ');
          end;
          if trim(sCCustoInicial) <> '' then begin
             Add('    (L.CODCENTROCUSTO >= :CCUSTOINI) AND                          ');
             Add('    (L.IDEMPRESA =:EMPRESA) AND                                   ');
          end;
          if trim(sCCustoFinal) <> '' then begin
             Add('    (L.CODCENTROCUSTO <= :CCUSTOFIM) AND                          ');
             Add('    (L.IDEMPRESA =:EMPRESA) AND                                   ');
          end;
          if trim(sModulo) <> '' then  begin
             Add(' (L.IDMODULO =:MODULO) AND                                        ');
          end;
          if trim(sTipoOperacao) <> '' then  begin
             if CmpRptCM.ParamValues[13].AsBoolean then begin
                Add('       (RTRIM(L.TIPCODIGO) <> RTRIM(:TIPO)) AND                ');
             end else begin
                Add('       (RTRIM(L.TIPCODIGO) = RTRIM(:TIPO)) AND                 ');
             end;
          end;
          if trim(sHistorico) <> '' then begin
             Add(' (RTRIM(L.HITCODHIST) = RTRIM(:HIST)) AND                                          ');
          end;
          Add('    (RTRIM(P.IDPESSOA) =:IDPESSOA) AND                               ');
          Add('    (L.PLNCODIGO = P.PLNCODIGO) AND                                  ');
          Add('    (RTRIM(L.PLACONTA) >= :CONTAINI) AND                             ');
          Add('    (RTRIM(L.PLACONTA) <= :CONTAFIM) AND                             ');
          if CmpRptCM.ParamValues[24].AsBoolean  then begin
             Add('     (C.PLAGRUPO <> ''E'') AND                                    ');
          end;
          Add('    ((L.PLANO = C.PLANO) AND                                         ');
          Add('    (L.PLACONTA = C.PLACONTA)) AND                                   ');
          Add('    (PD.PLANO(+) = C.PLANO) AND                                      ');
          Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                                ');
          Add('    ((L.UNIDNEGOC = U.UNIDNEGOC(+)) AND                              ');
          Add('    (L.IDPESSOA = U.IDPESSOA(+))) AND                                ');
          if CmpRptCM.ParamValues[25].AsBoolean  then begin
             Add('    (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO(+)) AND ');
          end;
          if CmpRptCM.ParamValues[18].AsBoolean  then begin
             Add('   (L.PLNCODIGO = CP.PLNCODIGO(+)) AND                            ');
             Add('   (L.LACNUMLAN = CP.LACNUMLAN(+)) AND                            ');
             Add('   (L.LACDEBCRE <> CP.LACDEBCRE(+)) AND                           ');
             Add('   (L.PLNCODIGO = CP1.PLNCODIGO(+)) AND                           ');
             Add('   (L.LACDEBCRE <> CP1.LACDEBCRE(+)) AND                          ');
          end;
          Add('    (L.IDPLANOPREV = PP.IDPLANOPREV(+)) AND                          ');
          Add('    (L.IDPATRO = PE.IDPESSOA(+)) AND                                 ');
          Add('    ((L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND                   ');
          Add('    (L.IDEMPRESA = CC.IDEMPRESA(+))) AND                             ');
          Add('    (SA.PLACONTA(+) = L.PLACONTA) AND                                ');
          Add('    (SS.PLACONTA(+) = L.PLACONTA) AND                                ');
          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add(' (L.CODSUBCONTA IS NOT NULL) AND                                  ');
             Add(' (SA.CODSUBCONTA(+) = L.CODSUBCONTA) AND                          ');
             Add(' (SA.IDPESSOA(+)    = L.IDPESSOA)    AND                          ');
             Add(' (SS.CODSUBCONTA(+) = L.CODSUBCONTA) AND                          ');
             Add(' (SS.IDPESSOA(+)    = L.IDPESSOA)    AND                          ');
          end;
          Add('    (L.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                          ');
          Add('    (L.IDPESSOA    = SC.IDPESSOA(+))                                 ');

          if CmpRptCM.ParamValues[26].AsBoolean  then begin
             Add('UNION ALL                                                         ');
             Add('SELECT                                                            ');
             Add('   C.PLACONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, ');
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('   SC.NOMESUBCONTA, ');
             end else begin
                Add('   ''                                                           '' AS NOMESUBCONTA, ');
             end;
             Add('   ''                              '' AS NOMECC,  C.PLAGRAU,      ');
             Add('   ''          '' AS UNECODIGO, (0) AS UNIDNEGOC, ''                              '' AS NOME, ');
             Add('   (0) AS SALDOCABECALHO, ('' '') AS DEBCRECABECALHO,             ');
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('   C.PLACONTA||'' - ''||SC.NOMESUBCONTA AS PLACONTAREF,        ');
                Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOMEREF, ');
             end else begin
                Add('   C.PLACONTA||''                                                               '' AS PLACONTAREF, ');
                Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOMEREF,                                    ');
             end;
             Add('   C.PLACONCORRESP, 0 AS IDMODULO, ''S'' AS PLNEFETIVADO, TO_CHAR(TO_DATE('''+sDataInicial+''',''DD/MM/YYYY''),''YYYYMM'') AS PERIODO,  ');
             Add('   ''*'' AS EFET,  ');
             if CmpRptCM.ParamValues[19].AsBoolean then
                Add('   SALDO.SALDOANT, SALDO.SALDO, ')
             else
                Add('   SA.SALDOANT, SS.SALDO, ');

             Add('    0 AS PLNCODIGO, 0 AS PLNPLANIL, TO_DATE('''+sDataInicial+''',''DD/MM/YYYY'') AS PLNDATDIA,      ');
             Add('   (0) AS LACVALOR, (0) AS MOVIMENT,                                      ');
             Add('    ''SALDO ANTERIOR'' AS HISTORICO,                                      ');
             Add('   (TO_CHAR(0,''999999'')||''/''||TO_CHAR(0,''999'')) AS LANCAMENTO,      ');
             Add('   (0) AS DEB,                                                            ');
             Add('   (0) AS CRED,                                                           ');
             Add('   (''                                                    '') AS NOMEPATRO,     ');
             Add('   (''                                                    '') AS NOMEPLANOPREV, ');
             Add('   (0) AS IDPATRO, (0) AS IDPLANOPREV,                                    ');
             Add('   (0) AS SALDOCORRENTE,                                                  ');
             Add('   ('' '')  AS DEBCRE, (''                  '') AS CONTRAPARTIDA,         ');
             Add('   (''          '') AS CODCENTROCUSTO,                                    ');
             if CmpRptCM.ParamValues[19].AsBoolean then
                Add('   SC.CODSUBCONTA,                                                     ')
             else
                Add('   (0) AS CODSUBCONTA,                                                 ');

             Add('   (0) AS LACNUMLAN,                   ');
             Add('   ('' '') AS LACDEBCRE, (''               '') AS LACNUMDOC               ');
             Add('FROM                                                                      ');
             Add('   PLANOCONTA C, ');

             if CmpRptCM.ParamValues[19].AsBoolean then
                Add('   CONTASXSUBC CS, ');

             Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD, ');
             if CmpRptCM.ParamValues[19].AsBoolean  then
                Add('   SUBCONTA SC, ');

             if CmpRptCM.ParamValues[19].AsBoolean then begin
                Add('(SELECT CS.CODSUBCONTA, CS.IDPESSOA, CS.PLACONTA, CS.PLANO, SUM(NVL(SA.SALDOANT, 0)) AS SALDOANT, SUM(NVL(SS.SALDO,0)) AS SALDO ');
                Add('FROM CONTASXSUBC CS, ');
             end;

             Add('   (SELECT                                                                ');
             Add('       S.PLACONTA, S.PLANO,                                               ');
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('    S.CODSUBCONTA, S.IDPESSOA,                                                 ');
             end;
             Add('       SUM(NVL(S.PLSDEBITOCORRENTE, 0) -  NVL(S.PLSCREDITOCOR, 0)) AS SALDOANT ');
             Add('    FROM PLANOSALDO S  ,SUBCONTA SC                                       ');
             Add('    WHERE                                                                 ');
             Add('       (S.PEREXERCICIO =:EXERCICIO) AND                                   ');
             Add('       (S.PERNUMERO IS NULL) AND                                          ');
             Add('       (S.PLANO =:PLANO) AND                                              ');
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('    (S.CODSUBCONTA IS NOT NULL) AND                                    ');
             end;

             if trim(sAtividade) <> '' then begin
                Add('    ((S.UNIDNEGOC =:UNIDNEGOC) AND                                    ');
                Add('    (S.IDPESSOA =:PESSOA)) AND                                        ');
             end;

             if CmpRptCM.ParamValues[15].AsInteger = 0  then begin
                if trim(sSubContaInicial) <> '' then begin
                   Add('  ((S.CODSUBCONTA >= :SUBCONTAINI) AND                              ');
                   Add('  (S.IDPESSOA =:PESSOA)) AND                                        ');
                end;
                if trim(sSubContaFinal) <> '' then begin
                   Add('  ((S.CODSUBCONTA <= :SUBCONTAFIM) AND                              ');
                   Add('  (S.IDPESSOA =:PESSOA)) AND                                        ');
                end;
             end else begin
                if trim(sSubContaInicial) <> '' then begin
                   Add('  ((SC.NOMESUBCONTA >= :SUBCONTAINI) AND                           ');
                   Add('  (S.IDPESSOA =:PESSOA)) AND                                       ');
                end;
                if trim(sSubContaFinal) <> '' then begin
                   Add('  ((SC.NOMESUBCONTA <= :SUBCONTAFIM) AND                           ');
                   Add('  (S.IDPESSOA =:PESSOA)) AND                                       ');
                end;
             end;
             if trim(CmpRptCM.ParamValues[31].AsString) <> '' then begin
                Add('      (S.UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString) + ')) AND ');
             end;
             if (trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
                Add('      (S.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND ');
             end;
             if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
                Add('      (S.IDPATRO IN (' + trim(sIDPatro) + ')) AND ');
             end;
             if trim(sCCustoInicial) <> '' then begin
                Add('       (S.CODCENTROCUSTO >=:CCUSTOINI) AND             ');
                Add('       (S.IDEMPRESA =:EMPRESA) AND                     ');
             end;
             if trim(sCCustoFinal) <> '' then begin
                Add('       (S.CODCENTROCUSTO <=:CCUSTOFIM) AND             ');
                Add('       (S.IDEMPRESA =:EMPRESA) AND                     ');
             end;
             Add('          (S.PLACONTA >=:CONTAINI) AND                   ');
             Add('          (S.PLACONTA <=:CONTAFIM) AND                   ');
             Add('          (S.IDPESSOA =:IDPESSOA) AND                     ');
             Add('          (S.CODSUBCONTA = SC.CODSUBCONTA(+)) AND         ');
             Add('          (S.IDPESSOA    = SC.IDPESSOA(+))                ');
             Add('    GROUP BY S.PLACONTA, S.PLANO                          ');
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('    ,S.CODSUBCONTA, S.IDPESSOA                          ');
             end;
                Add('    ) SA,                                               ');
             Add('   (SELECT                                                 ');
             Add('       L.PLACONTA, L.PLANO,                                ');
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('    L.CODSUBCONTA, L.IDPESSOA,                          ');
             end;
             Add('       SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * (-1)))) AS SALDO');
             Add('    FROM PLANILHA P, LANCAMENTO L, SUBCONTA SC                                     ');
             Add('    WHERE                                                             ');
             Add('          (P.PEREXERCICIO =:EXERCICIO) AND                              ');
             Add('          (P.PLNDATDIA < :DATAINI)  AND                               ');
             if  CmpRptCM.ParamValues[14].AsInteger = 1 then begin
                Add('       (P.PLNEFETIVADO = ''S'') AND                                    ');
             end;
             if  CmpRptCM.ParamValues[14].AsInteger = 2 then begin
                Add('       ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND      ');
             end;
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('       (L.CODSUBCONTA IS NOT NULL) AND                             ');
             end;
             if trim(sAtividade) <> '' then begin
                Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                                  ');
             end;
             if CmpRptCM.ParamValues[15].AsInteger = 0  then begin
                if trim(sSubContaInicial) <> '' then begin
                   Add('     ((L.CODSUBCONTA >= :SUBCONTAINI) AND                              ');
                   Add('     (L.IDPESSOA =:PESSOA)) AND                                    ');
                end;
                if trim(sSubContaFinal) <> '' then begin
                   Add('     ((L.CODSUBCONTA <= :SUBCONTAFIM) AND                              ');
                   Add('     (L.IDPESSOA =:PESSOA)) AND                                    ');
                end;
             end else begin
                if trim(sSubContaInicial) <> '' then begin
                   Add('     ((SC.NOMESUBCONTA >= :SUBCONTAINI) AND                              ');
                   Add('     (L.IDPESSOA =:PESSOA)) AND                                    ');
                end;
                if trim(sSubContaFinal) <> '' then begin
                   Add('     ((SC.NOMESUBCONTA <= :SUBCONTAFIM) AND                              ');
                   Add('     (L.IDPESSOA =:PESSOA)) AND                                    ');
                end;
             end;
             if trim(CmpRptCM.ParamValues[31].AsString) <> '' then begin
                Add('        (L.UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString) + ')) AND ');
             end;
             if (trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
                 Add('       (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND          ');
             end;
             if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
                 Add('       (L.IDPATRO IN (' + trim(sIDPatro) + ')) AND                  ');
             end;
             if trim(sCCustoInicial) <> '' then begin
                Add('       (L.CODCENTROCUSTO >= :CCUSTOINI) AND                            ');
                Add('       (L.IDEMPRESA =:EMPRESA) AND                                     ');
             end;
             if trim(sCCustoFinal) <> '' then begin
                Add('       (L.CODCENTROCUSTO <= :CCUSTOFIM) AND                            ');
                Add('       (L.IDEMPRESA =:EMPRESA) AND                                     ');
             end;
             if trim(sModulo) <> '' then begin
                Add('       (L.IDMODULO =:MODULO) AND                                       ');
             end;
             if trim(sTipoOperacao) <> '' then begin
                if CmpRptCM.ParamValues[13].AsBoolean then begin
                   Add('    (RTRIM(L.TIPCODIGO) <> RTRIM(:TIPO)) AND                       ');
                end else begin
                   Add('    (RTRIM(L.TIPCODIGO) = RTRIM(:TIPO)) AND                        ');
                end;
             end;
             if trim(sHistorico) <> '' then begin
                Add('       (RTRIM(L.HITCODHIST) = RTRIM(:HIST)) AND                       ');
             end;
             Add('	    (P.PEREXERCICIO =:EXERCICIO) AND                               ');
             Add('          (RTRIM(L.PLACONTA) >= :CONTAINI) AND                           ');
             Add('          (RTRIM(L.PLACONTA) <= :CONTAFIM) AND                           ');
             Add('          (RTRIM(P.IDPESSOA) =:IDPESSOA) AND                             ');
             Add('          (L.PLNCODIGO = P.PLNCODIGO) AND                                ');
             Add('          (L.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                        ');
             Add('          (L.IDPESSOA = SC.IDPESSOA(+))                                  ');
             Add('    GROUP BY L.PLACONTA, L.PLANO                                         ');
             if CmpRptCM.ParamValues[19].AsBoolean then begin
                Add('    ,L.CODSUBCONTA, L.IDPESSOA                                         ');
             end;
             Add('    ) SS                                                                  ');

             if CmpRptCM.ParamValues[19].AsBoolean then begin
                Add('    WHERE                                                           ');
                Add('       CS.CODSUBCONTA = SS.CODSUBCONTA(+) AND                       ');
                Add('       CS.IDPESSOA    = SS.IDPESSOA(+)    AND                       ');
                Add('       CS.PLACONTA    = SS.PLACONTA(+)    AND                       ');
                Add('       CS.PLANO       = SS.PLANO(+)       AND                       ');
                Add('       CS.CODSUBCONTA = SA.CODSUBCONTA(+) AND                       ');
                Add('       CS.IDPESSOA    = SA.IDPESSOA(+)    AND                       ');
                Add('       CS.PLACONTA    = SA.PLACONTA(+)    AND                       ');
                Add('       CS.PLANO       = SA.PLANO(+)                                 ');
                Add('    GROUP BY                                                        ');
                Add('       CS.CODSUBCONTA, CS.IDPESSOA, CS.PLACONTA, CS.PLANO           ');
                Add('    HAVING                                                          ');
                Add('       SUM(NVL(SA.SALDOANT, 0)) <>0 OR SUM(NVL(SS.SALDO,0)) <> 0    ');
                Add('   ) SALDO                                                          ');
             end;

             Add('WHERE                                                                     ');
             Add('    (RTRIM(C.PLACONTA) >= :CONTAINI) AND                                         ');
             Add('    (RTRIM(C.PLACONTA) <= :CONTAFIM) AND                                         ');
             Add('    (C.PLATIPO = ''A'') AND                                               ');
             if CmpRptCM.ParamValues[24].AsBoolean  then begin
                Add(' (C.PLAGRUPO <> ''E'') AND                                         ');
             end;
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('    (SALDO.CODSUBCONTA(+) = CS.CODSUBCONTA) AND       ');
                Add('    (SALDO.IDPESSOA(+)    = CS.IDPESSOA)    AND       ');
                Add('    (SALDO.PLANO(+) = CS.PLANO) AND                   ');
                Add('    (SALDO.PLACONTA(+) = CS.PLACONTA) AND             ');
                Add('    (CS.CODSUBCONTA = SC.CODSUBCONTA) AND             ');
                Add('    (CS.IDPESSOA = SC.IDPESSOA) AND                   ');
                Add('    (CS.PLANO = C.PLANO) AND                          ');
                Add('    (CS.PLACONTA = C.PLACONTA) AND                    ');
                Add('    (SALDO.SALDOANT + SALDO.SALDO <> 0) AND           ');
             end else begin
                Add('    (SA.PLANO(+) = C.PLANO) AND                       ');
                Add('    (SS.PLANO(+) = C.PLANO) AND                       ');
                Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                 ');
                Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                 ');
                Add('    ((NVL(SA.SALDOANT,0) + NVL(SS.SALDO,0)) <> 0) AND ');
             end;

             Add('    (PD.PLANO(+) = C.PLANO) AND                                      ');
             Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                                ');
             Add('    (NOT EXISTS (SELECT X.PLACONTA FROM PLANILHA Y, LANCAMENTO X          ');
             Add('                 WHERE                                                    ');
             Add('                      (Y.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                     ');
             Add('                      (Y.PEREXERCICIO >= :EXERCICIO) AND                  ');
             if CmpRptCM.ParamValues[14].AsInteger = 1  then begin
                Add('                   (Y.PLNEFETIVADO = ''S'') AND                        ');
             end;
             if CmpRptCM.ParamValues[14].AsInteger = 2  then begin
                Add('                   ((Y.PLNEFETIVADO = ''N'') OR (Y.PLNEFETIVADO IS NULL)) AND  ');
             end;
             if trim(sModulo) <> '' then begin
                Add('                   (X.IDMODULO =:MODULO) AND                          ');
             end;
             if trim(sTipoOperacao) <> '' then begin
                if CmpRptCM.ParamValues[13].AsBoolean then begin
                   Add('               (RTRIM(X.TIPCODIGO) <> RTRIM(:TIPO)) AND                 ');
                end else begin
                   Add('               (RTRIM(X.TIPCODIGO) = RTRIM(:TIPO)) AND                  ');
                end;
             end;
             if trim(sHistorico) <> '' then begin
                Add('                 (RTRIM(X.HITCODHIST) = RTRIM(:HIST)) AND                            ');
             end;
             Add('                    (RTRIM(Y.IDPESSOA) =:IDPESSOA) AND                                         ');
             Add('                    (X.PLACONTA = C.PLACONTA) AND                                       ');
             Add('                    (X.PLANO = C.PLANO) AND                                             ');
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('                 (X.IDPESSOA = SC.IDPESSOA) AND                                   ');
                Add('                 (X.CODSUBCONTA = SC.CODSUBCONTA) AND                             ');
             end;
             Add('                    (RTRIM(X.PLACONTA) >= :CONTAINI) AND                                ');
             Add('                    (RTRIM(X.PLACONTA) <= :CONTAFIM) AND                                ');
             Add('                    (X.PLNCODIGO = Y.PLNCODIGO) ) )                                     ');
          end;
          Add('ORDER BY                                                                   ');
          Add('    PLACONTAREF, PLNDATDIA, PLNPLANIL, LACNUMLAN                           ');

          sqlRazaoAnal.Prepare;
          sqlRazaoAnal.ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
          sqlRazaoAnal.ParamByName('DATAINI').asDate      := CmpRptCM.ParamValues[1].AsDateTime;
          sqlRazaoAnal.ParamByName('DATAFIM').asDate      := CmpRptCM.ParamValues[2].AsDateTime;
          sqlRazaoAnal.ParamByName('EXERCICIO').asInteger := strToInt(CmpRptCM.ParamValues[0].AsString);
          sqlRazaoAnal.ParamByName('PLANO').asInteger     := iPlano;

          if trim(sContaInicial) <> '' then begin
             sqlRazaoAnal.ParamByName('CONTAINI').asString := trim(sContaInicial);
          end else begin
             sqlRazaoAnal.ParamByName('CONTAINI').asString := '0';
          end;

          if Trim(sContaFinal) <> '' then begin
             sqlRazaoAnal.ParamByName('CONTAFIM').asString := trim(sContaFinal);
          end else begin
             sqlRazaoAnal.ParamByName('CONTAFIM').asString := '999999999999999999';
          end;

          if trim(sCCustoInicial) <> '' then begin
             sqlRazaoAnal.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);;
             sqlRazaoAnal.ParamByName('EMPRESA').asFloat    := CrmRptCM.IdEmpresa;
          end;

          if trim(sCCustoFinal) <> '' then begin
             sqlRazaoAnal.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[7].AsString,10);
             sqlRazaoAnal.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
          end;

          if CmpRptCM.ParamValues[15].AsInteger = 0  then begin
             if trim(sSubContaInicial) <> '' then begin
                sqlRazaoAnal.ParamByName('SUBCONTAINI').asInteger:= StrToInt(sSubContaInicial);
                sqlRazaoAnal.ParamByName('PESSOA').asFloat       := CrmRptCM.IdEmpresa;
             end;
             if trim(sSubContaFinal) <> '' then begin
                sqlRazaoAnal.ParamByName('SUBCONTAFIM').asInteger:= StrToInt(sSubContaFinal);
                sqlRazaoAnal.ParamByName('PESSOA').asFloat       :=  CrmRptCM.IdEmpresa;
             end;
          end else begin
             if trim(sSubContaInicial) <> '' then begin
                sqlRazaoAnal.ParamByName('SUBCONTAINI').asString := sSubContaInicial;
                sqlRazaoAnal.ParamByName('PESSOA').asFloat       := CrmRptCM.IdEmpresa;
             end;
             if trim(sSubContaFinal) <> '' then begin
                sqlRazaoAnal.ParamByName('SUBCONTAFIM').asString := sSubContaFinal;
                sqlRazaoAnal.ParamByName('PESSOA').asFloat       := CrmRptCM.IdEmpresa;
             end;
          end;

          if trim(sAtividade) <> '' then begin
             sqlRazaoAnal.ParamByName('UNIDNEGOC').asFloat   := Trunc(CmpRptCM.ParamValues[5].AsFloat);
             sqlRazaoAnal.ParamByName('PESSOA').asFloat      := CrmRptCM.IdEmpresa;
          end;

          if trim(sModulo) <> '' then begin
             sqlRazaoAnal.ParamByName('MODULO').asFloat := Trunc(CmpRptCM.ParamValues[8].AsFloat);
          end;
          if trim(sTipoOperacao) <> '' then begin
             sqlRazaoAnal.ParamByName('TIPO').asString :=  Trim(CmpRptCM.ParamValues[12].AsString);
          end;
          if trim(sHistorico) <> '' then begin
             sqlRazaoAnal.ParamByName('HIST').asString := Trim(CmpRptCM.ParamValues[11].AsString);
          end;
          //Henrique Massão
          //CMDebugToFile(sqlRazaoAnal.SQLChanged, 'c:\RazaoSimplificado.txt' );
          CMDebugToFile(sqlRazaoAnal.SQLChanged,Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\RazaoSimplificado.txt');
          sqlRazaoAnal.Open;
      end;

   Except
     On E:Exception Do
     Begin
        CMDebugToFile('Erro Relatório Razão:' + (#13+#10) + E.Message );
     End;
   End;
end;


procedure TRptRazaoAnalSimples.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGeral := TCtrlGeral.Create;
  CtrlGeral.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  //Everson Cunha - SIG102043 - Ini
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);
  //Everson Cunha - SIG102043 - Fim                  
end;

procedure TRptRazaoAnalSimples.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlGeral.free;
  CtrlPeriodo.Free;
  CtrlRptBalancete.Free;
  CtrlContab.free; //Everson Cunha - SIG102043
end;

procedure TRptRazaoAnalSimples.ppGroupHeaderBand1AfterGenerate(
  Sender: TObject);
var
   rSaldo : Real;
begin
  inherited;
   rSaldo :=0;
   if dbtxtSaldoCad.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoCad.GetText);

   if dbtxtSaldoAntCad.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoAntCad.GetText);

   if dbSumMovCad.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbSumMovCad.GetText);

   if (dbtxtMovRazAnalCad.GetText <> '')  then
      rSaldo := rSaldo - StrToFloat(dbtxtMovRazAnalCad.GetText);

   if rSaldo > 0 then
      txtDebCreCabRazAnalCad.caption := 'D'
   else
      txtDebCreCabRazAnalCad.caption := 'C';

   txtSaldoCabRazAnalCad.caption  :=  FormatFloat('###,###,###,###,##0.00', ABS(rSaldo));
end;

procedure TRptRazaoAnalSimples.ppGroupHeaderBand1BeforeGenerate(
  Sender: TObject);
var
   sMascara : String;
begin
  inherited;
   //Configura a máscara das contas contábeis
   if (sMascContas <> '') then
    begin
       sMascara :=FuncaoGeral.CalcMascaraPorGrau(sMascContas,cdsRazaoAnal.FieldByName('PLAGRAU').asInteger);
       dbtxtContaCad.DisplayFormat := sMascara + ';0; ';

       if bContra then
          dbtxtContraPartidaCad.DisplayFormat := sMascara + ';0; ';
    end;
end;

procedure TRptRazaoAnalSimples.ppFooterBand2BeforePrint(Sender: TObject);
begin
  inherited;
  lblContRazAnalCad.Caption := IntToStr((iPagIni + StrToInt(lblCalcRazAnalCad.text)) - 1);
end;

procedure TRptRazaoAnalSimples.ppDetailBand1AfterGenerate(Sender: TObject);
var
   rSaldo : Real;
begin
  inherited;
   rSaldo :=0;
   if dbtxtSaldoCad.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoCad.GetText);

   if dbtxtSaldoAntCad.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoAntCad.GetText);

   if dbSumMovCad.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbSumMovCad.GetText);

   if rSaldo > 0 then
      txtDebCreRazAnalCad.caption := 'D'
   else
      txtDebCreRazAnalCad.caption := 'C';

   txtSaldoRazAnalCad.caption  :=  FormatFloat('###,###,###,###,##0.00', ABS(rSaldo));
end;

end.
