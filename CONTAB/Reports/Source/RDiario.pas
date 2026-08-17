{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 210568/15662
Nº KINTANA..: 2058378
Data........: 30/01/2014
Responsável.: Thiago Melo
Descrição...: Novo layout para atender impressão única com período maior. 
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 210567
Nº KINTANA..: 2030912
Data........: 04/07/2013
Responsável.: William Moreira da silva
Descrição...: Correção na query da impressão do diario
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 144332
Nº KINTANA..: 999953
Data........: 10/08/2011
Responsável.: Thaise Amaral Martins
Descrição...: Adicionar quebra de linha no nome da conta
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: CrmRptCMBeforePrint
Nº SOL......: 129731
Nº KINTANA..: 715203
Data........: 22/02/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para dividir a busca dos dados em três períodos na montagem do
              relatório quando for "Exportar Direto para PDF".
---------------------------------------------------------------------------------------------------}
{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  26/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint
Data      : 21/06/2004
Autor     : André Pontes
Pendência : 17053
Descrição : Corrigida a passagem do parâmetro MODULO para a query
---------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidad               }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 14/05/2002 - Veronica                  }
{                                                       }
{*******************************************************}

unit RDiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  uCmRptManager, TXComp, CmParamReport, DBClient, Provider, ADODB,
  DBTables, uCtrlGeral,uCtrlParamIntegra, uCmSqlParams,uCMfileUtils,
  FCmReport, uCMClientDataSet, uCtrlRptBalancete, uCtrlPeriodo, TXRB, uCMTypes,
  ppStrtch, ppMemo;

type
  TRptDiario = class(TFrmCmReport)
    dsDiario: TwwDataSource;
    pplDiario: TppBDEPipeline;
    rptDiario: TppReport;
    ppHeaderBand15: TppHeaderBand;
    pplblTituloDiario: TppLabel;
    ppLine41: TppLine;
    LblEmpresaRpt: TppLabel;
    ppLabel95: TppLabel;
    ppLine42: TppLine;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    pplblTituloDiario2: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel103: TppLabel;
    rptDiarioLabel1: TppLabel;
    rptDiarioLabel2: TppLabel;
    txtLabelTotHead: TppLabel;
    txtTotTransportadoD: TppLabel;
    txtTotTransportadoC: TppLabel;
    lblSomaCreCab: TppDBCalc;
    lblSomaDebCab: TppDBCalc;
    rptDiarioLine3: TppLine;
    rptDiarioLabel4: TppLabel;
    ppDetailBand7: TppDetailBand;
    dbtxtContaDiario: TppDBText;
    dbtxtDiarioNumDoc: TppDBText;
    dbtxtDiarioSCNome: TppDBText;
    dbtxtCorrespDiario: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText43: TppDBText;
    rptDiarioDBText1: TppDBText;
    rptDiarioDBText2: TppDBText;
    dbtxtDiarioSC: TppDBText;
    rptDiarioDBText3: TppDBText;
    rptDiarioDBText4: TppDBText;
    ppFooterBand15: TppFooterBand;
    LblSistemaRpt: TppLabel;
    lblContadorDia: TppLabel;
    rptDiarioLabel3: TppLabel;
    txtLabelTot: TppLabel;
    rptDiarioLine2: TppLine;
    lblSomaDebFot: TppDBCalc;
    lblSomaCreFot: TppDBCalc;
    rptDiarioLine1: TppLine;
    lblCalcContadorDia: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    lblCalcMaxPagDia: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel116: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLine43: TppLine;
    ppDBText47: TppDBText;
    ppLabel108: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel111: TppLabel;
    ppLine45: TppLine;
    rptDiarioDBCalc1: TppDBCalc;
    rptDiarioDBCalc2: TppDBCalc;
    cdsDiario: TClientDataSet;
    sqlDiario: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    pplDiarioppField9: TppField;
    pplDiarioppField30: TppField;
    cdsDiarioAux: TClientDataSet;
    qryDiario: TQuery;
    ppDBMemo1: TppDBMemo;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppHeaderBand15BeforePrint(Sender: TObject);
    procedure ppDetailBand7BeforeGenerate(Sender: TObject);
    procedure ppFooterBand15BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtTotTransportadoDPrint(Sender: TObject);
    procedure txtTotTransportadoCPrint(Sender: TObject);
    procedure sqlTitulosFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
  private
    { Private declarations }
    sNomePatro       : String;
    sNomePlanoPrev   : String;

    sDataInicial     : String;
    sDataFinal       : String;
    sContaInicial    : String;
    sContaFinal      : String;
    sCCustoInicial   : String;
    sCCustoFinal     : String;
    sSubConta        : String;
    sAtividade       : String;
    sModulo          : String;
    sHistorico       : String;
    sTipoOperacao    : String;
    bCorresp         : Boolean;
    bContra          : Boolean;
    iPagIni          : Integer;
    bImprimeSaldo    : Boolean;
    sContaSaldo      : String;
    rTotalCreDiario  : Real;
    rTotalDebDiario  : Real;
    CtrlGeral : TCtrlGeral;
    CtrlRptBalancete : TCtrlRptBalancete;
    CtrlPeriodo : TCtrlPeriodo;
  public
    { Public declarations }
  end;

implementation

Uses uCtrlPadroes,dBaseDados,uSistema, uString;

{$R *.DFM}

procedure TRptDiario.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   sDataInicial  :='';
   sDataFinal    :='';
   sContaInicial :='';
   sContaFinal   :='';
   sCCustoInicial:='';
   sCCustoFinal  :='';
   sSubConta     :='';
   sAtividade    :='';
   sModulo       :='';
   sHistorico    :='';
   sTipoOperacao :='';
   bCorresp      :=False;
   bContra       :=False;
   iPagIni       :=0;
   bImprimeSaldo :=False;
   sContaSaldo   :='';

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

procedure TRptDiario.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
   inherited;
   case Index of
      1: sDataInicial  :=TPainelControles(Sender).CtrlDateTimePicker.Text;
      2: sDataFinal    :=TPainelControles(Sender).CtrlDateTimePicker.Text;
      3: sContaInicial :=TPainelControles(Sender).CtrlLookup.Text;
      4: sContaFinal   :=TPainelControles(Sender).CtrlLookup.Text;
      5: sAtividade    :=TPainelControles(Sender).CtrlLookup.Text;
      8: sModulo       :=TPainelControles(Sender).CtrlLookup.Text;
      9: sSubConta     :=TPainelControles(Sender).CtrlLookup.Text;
     10: sHistorico    :=TPainelControles(Sender).CtrlLookup.Text;
     11: sTipoOperacao :=TPainelControles(Sender).CtrlLookup.Text;
   end;
end;

procedure TRptDiario.CrmRptCMBeforePrint(Sender: TObject);
var
   iGrau,iNumDig,i : Integer;
   sTitulo         : String;
   sIDPlanoPrev    : String;
   sIDPatro        : String;

   // Alterado por FHBS - SOL: 129731 KTN: 715203
   bQuebraSql   : Boolean;
   sDataSqlIni,
   sDataSqlFim  : tDateTime;
   nPosSql      : Integer;
   nQteDias     : Integer;
   nLinIni: Integer;
   nLinFim: Integer;
   iFields: Integer;

const
   nLinInter = 50000;

begin
   inherited;
   Try
      sDataInicial     :=CmpRptCM.ParamValues[1].AsString;
      sDataFinal       :=CmpRptCM.ParamValues[2].AsString;
      sContaInicial    :=CmpRptCM.ParamValues[3].AsString;
      sContaFinal      :=CmpRptCM.ParamValues[4].AsString;
      sAtividade       :=CmpRptCM.ParamValues[5].AsString;
      sModulo          :=CmpRptCM.ParamValues[8].AsString;
      sSubConta        :=CmpRptCM.ParamValues[9].AsString;
      sHistorico       :=CmpRptCM.ParamValues[10].AsString;
      sTipoOperacao    :=CmpRptCM.ParamValues[11].AsString;
      sCCustoInicial   :=CmpRptCM.ParamValues[6].AsString;
      sCCustoFinal     :=CmpRptCM.ParamValues[7].AsString;
      sIDPlanoPrev     :=CmpRptCM.ParamValues[25].AsString;
      sIDPatro         :=CmpRptCM.ParamValues[26].AsString;

      LblEmpresaRpt.Caption := sistema.RazaoSocial;

      if CmpRptCM.ParamValues[23].AsString = '' then
      begin
          //Imprime os títulos
          sTitulo := 'Diário - período de ' + sDataInicial + ' a ' + sDataFinal;
          pplblTituloDiario.caption := sTitulo;

          sTitulo := '';
          if Trim(sCCustoInicial) <> '' then
             sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + sCCustoInicial;

          if Trim(sCCustoFinal) <> '' then
             sTitulo := sTitulo +  '     Centro de Custo Final : ' + sCCustoFinal;

          if Trim(sSubConta) <> '' then
             sTitulo := sTitulo +  '     Sub-Conta : ' + sSubConta;

          if Trim(sAtividade) <> '' then
          begin
             sqlTitulos.SQL.Clear;
             sqlTitulos.SQL.Add('SELECT UNIDNEGOC, NOME, UNECODIGO ');
             sqlTitulos.SQL.Add('FROM  UNIDNEGOCIO                 ');
             sqlTitulos.SQL.Add('WHERE                             ');
             sqlTitulos.SQL.Add('  (IDPESSOA  = :IDPESSOA)  AND    ');
             sqlTitulos.SQL.Add('  (UNIDNEGOC = :UNIDNEGOC)        ');

             sqlTitulos.Prepare;
             sqlTitulos.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
             sqlTitulos.ParamByName('UNIDNEGOC').asInteger := StrToInt(sAtividade);
             sqlTitulos.Open;

             sTitulo := sTitulo +  '   Atividade/Projeto : ' + cdsTitulos.FieldByName('NOME').asString;
          end;

          if Trim(sModulo) <> '0' then
          begin
             sqlTitulos.Sql.Clear;
             sqlTitulos.Sql.add('SELECT IDMODULO, NOMEMODULO ');
             sqlTitulos.Sql.add('FROM MODULO                 ');
             sqlTitulos.Sql.add('WHERE IDMODULO = :IDMODULO  ');
             sqlTitulos.Sql.add('ORDER BY NOMEMODULO         ');

             sqlTitulos.Prepare;
             sqlTitulos.ParamByName('IDMODULO').asInteger := StrToInt(sModulo);
             sqlTitulos.Open;

             sTitulo := sTitulo +  '  Módulo : ' + cdsTitulos.FieldByName('NOMEMODULO').asString;
          end;

          if Trim(sTipoOperacao) <> '' then
          begin
            sqlTitulos.sql.Clear;
            sqlTitulos.sql.add('SELECT TIPCODIGO, TIPDESCRICAO ');
            sqlTitulos.sql.add('FROM TIPOPER                   ');
            sqlTitulos.sql.add('WHERE TIPCODIGO = :TIPCODIGO   ');
            sqlTitulos.sql.add('ORDER BY TIPDESCRICAO          ');

            sqlTitulos.Prepare;
            sqlTitulos.ParamByName('TIPCODIGO').asString := Trim(sTipoOperacao);
            sqlTitulos.Open;

            sTitulo := sTitulo +  ' Tipo de Operação : ' + cdsTitulos.FieldByName('TIPDESCRICAO').asString;
          end;

          if Trim(sHistorico) <> '' then
             sTitulo := sTitulo +  '     Histórico Padrão : ' + sHistorico;

          case CmpRptCM.ParamValues[13].AsInteger of
             0: sTitulo := sTitulo +  '    Lançamentos : TODOS';
             1: sTitulo := sTitulo +  '    Lançamentos : Somente Integrados';
             2: sTitulo := sTitulo +  '    Lançamentos : Somente NÃO Integrados';
          end;

          sNomePlanoPrev := '';
          if Trim(sIDPlanoPrev) <> '0' then
          begin
            sqlTitulos.SQL.Clear;
            sqlTitulos.Sql.Add('SELECT NOME                                ');
            sqlTitulos.Sql.Add('FROM  PLANPREVCONTABIL                     ');
            sqlTitulos.Sql.Add('WHERE  IDPLANOPREV IN (:IDPLANOPREV_MARCA) ');
            sqlTitulos.Prepare;
            sqlTitulos.ParamByName('IDPLANOPREV_MARCA').asString  := Trim(sIDPlanoPrev);
            sqlTitulos.Open;

            i := 0;

            if not cdsTitulos.isEmpty then
            begin
              cdsTitulos.First;
              while not cdsTitulos.Eof do
              begin
                inc(i);

                if i = 1 then
                   sNomePlanoPrev :=  cdsTitulos.FieldByName('NOME').AsString
                else
                   sNomePlanoPrev := sNomePlanoPrev + '/' + cdsTitulos.FieldByName('NOME').AsString;

                cdsTitulos.Next;
              end;
            end;
            sTitulo := sTitulo +'  '+ sNomePlanoPrev;
          end;

          sNomePatro := '';
          if Trim(sIDPatro) <> '0' then
          begin
            sqlTitulos.Sql.Clear;
            sqlTitulos.SQL.Clear;
            sqlTitulos.Sql.Add('SELECT PE.NOME                           ');
            sqlTitulos.Sql.Add('FROM PESSOA PE,PATRO PA                  ');
            sqlTitulos.Sql.Add('WHERE (PA.IDPESSOA = PE.IDPESSOA) AND    ');
            sqlTitulos.Sql.Add('      (PA.IDPESSOA IN (:IDPESSOA_MARCA)) ');

            sqlTitulos.Prepare;
            sqlTitulos.ParamByName('IDPESSOA_MARCA').asString  := Trim(sIDPatro);
            sqlTitulos.Open;

            i := 0;

            if not cdsTitulos.isEmpty then
            begin
               cdsTitulos.First;
               while not cdsTitulos.Eof do
               begin
                 inc(i);

                 if i = 1 then
                    sNomePatro :=  cdsTitulos.FieldByName('NOME').AsString
                 else
                    sNomePatro := sNomePatro + '/' + cdsTitulos.FieldByName('NOME').AsString;

                 cdsTitulos.Next;
               end;
            end;
            sTitulo := sTitulo +' - '+ sNomePatro;
          end;

          pplblTituloDiario2.caption := sTitulo;
       end else
       begin
          pplblTituloDiario.caption  := CmpRptCM.ParamValues[23].AsString;;
          pplblTituloDiario2.caption := CmpRptCM.ParamValues[24].AsString;
       end;


      //Configura a exibiçao da Conta Correspondente
      if CmpRptCM.ParamValues[17].AsBoolean then
       begin
          dbtxtCorrespDiario.visible := True;
          dbtxtContaDiario.visible   := False;
       end
      else
       begin
          dbtxtCorrespDiario.visible := False;
          dbtxtContaDiario.visible   := True;
       end;

      //Configura a quebra de página
      rptDiario.Groups[0].NewPage := CmpRptCM.ParamValues[15].AsBoolean;

      bCorresp := CmpRptCM.ParamValues[17].AsBoolean;
      iPagIni  := CmpRptCM.ParamValues[14].AsInteger;

      iNumDig := 0;
      if CmpRptCM.ParamValues[20].AsBoolean then begin
         iGrau   := CtrlGeral.CalcGrauMax(ParamIntegra.MascaraUnidNegoc);
         iNumDig := CtrlGeral.CalcNumEleGrau(ParamIntegra.MascaraUnidNegoc,(iGrau-1));
      end;

      CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,CmpRptCM.ParamValues[1].AsString);

      rTotalCreDiario := 0;
      rTotalDebDiario := 0;

      With qryDiario.Sql do
      Begin
        Clear;

        // Thiago Melo SOL 210568/15662 Ktn 2058378
        Add('SELECT P.PLNDATDIA,                                                               ');
        Add('       P.PLNPLANIL,                                                               ');
        Add('       L.LACNUMLAN,                                                               ');
        Add('       P.PLNCODIGO,                                                               ');
        Add('       L.PLACONTA AS CONTA,                                                       ');
        Add('       L.LACNUMDOC AS DOCUMENTO,                                                  ');
        Add('       L.CODSUBCONTA AS SC,                                                       ');
        Add('       S.NOMESUBCONTA,                                                            ');
        Add('       C.PLAGRAU,                                                                 ');
        Add('       C.PLACONCORRESP,                                                           ');
        Add('       DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,                   ');
        Add('       TO_CHAR(P.PLNPLANIL) || ''/'' || TO_CHAR(L.LACNUMLAN) AS LANC,             ');
        Add('       DECODE(L.LACDEBCRE, ''D'', 2, 1) TIPO,                                     ');
        Add('       (DECODE(L.LACDEBCRE,                                                       ');
        Add('               ''D'',                                                             ');
        Add('               TRIM(L.PLACONTA) || '' - '' ||                                     ');
        Add('               DECODE(PD.PLANOME, NULL, PL.PLANOME, PD.PLANOME),                  ');
        Add('               NULL)) AS CONTA_DEBITO,                                            ');
        Add('       (DECODE(L.LACDEBCRE,                                                       ');
        Add('               ''C'',                                                             ');
        Add('               TRIM(L.PLACONTA) || '' - '' ||                                     ');
        Add('               DECODE(PD.PLANOME, NULL, PL.PLANOME, PD.PLANOME),                  ');
        Add('               NULL)) AS CONTA_CREDITO,                                           ');
        Add('       DECODE(L.LACDEBCRE,                                                        ');
        Add('              ''C'',                                                              ');
        Add('              L.LACHIST1 || '' '' || L.LACHIST2 || '' '' || L.LACHIST3 || '' '' ||');
        Add('              L.LACHIST4 || '' '' || L.LACHIST5,                                  ');
        Add('              NULL) AS HISTORICO,                                                 ');
        Add('       L.CODCENTROCUSTO CENTROCUSTO,                                              ');
        Add('       L.IDMODULO IDMODULOS,                                                      ');
        Add('       (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, NULL)) AS DEB,                     ');
        Add('       (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, NULL)) AS CRED,                    ');
        if CmpRptCM.ParamValues[20].AsBoolean then begin
          Add('   U1.UNECODIGO, U1.UNIDNEGOC, U1.UNIDNEGOC AS UN                               ');
        end else begin
          Add('   U.UNECODIGO, L.UNIDNEGOC, L.UNIDNEGOC AS UN                                  ');
        end;
        Add('  FROM LANCAMENTO L                                                               ');
        if CmpRptCM.ParamValues[19].AsBoolean then begin
          Add('  LEFT OUTER                                                                    ');
        end;
        Add('  JOIN PLANILHA P                                                                 ');
        Add('    ON P.PLNCODIGO = L.PLNCODIGO                                                  ');
        Add('  JOIN PLANOCONTA PL                                                              ');
        Add('    ON PL.PLANO = L.PLANO                                                         ');
        Add('   AND PL.PLACONTA = L.PLACONTA                                                   ');
        Add('  JOIN PLANPREVCONTABIL PP                                                        ');
        Add('    ON PP.IDPLANOPREV = L.IDPLANOPREV                                             ');
        Add('  JOIN PESSOA PE                                                                  ');
        Add('    ON PE.IDPESSOA = L.IDPATRO                                                    ');
        Add('  LEFT JOIN UNIDNEGOCIO U                                                         ');
        Add('    ON U.UNIDNEGOC = L.UNIDNEGOC                                                  ');
        Add('   AND L.IDPESSOA  = U.IDPESSOA                                                   ');
        if CmpRptCM.ParamValues[20].AsBoolean then begin
          Add('  RIGHT OUTER JOIN  (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO         ');
          Add('                      WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')         ');
          Add('                        AND (IDPESSOA = :IDPESSOA) ) U1                         ');
          Add('                         ON (U.UNECODIGO = U1.UNECODIGO)                        ');
        end;
        Add('  LEFT OUTER JOIN SUBCONTA S                                                      ');
        Add('    ON (L.CODSUBCONTA = S.CODSUBCONTA)                                            ');
        Add('   AND (L.IDPESSOA = S.IDPESSOA)                                                  ');
        Add('  LEFT JOIN (SELECT P.PLANOME, P.PLACONTA, P.PLANO, P.PLATIPO, P.PLAINATIVA       ');
        Add('               FROM PLANOCONTAPER P,                                              ');
        Add('                    (SELECT PLACONTA,                                             ');
        Add('                            PLANO,                                                ');
        Add('                            MIN(TO_CHAR(PEREXERCICIO) ||                          ');
        Add('                                DECODE(LENGTH(NVL(PERNUMERO, 0)),                 ');
        Add('                                       1,                                         ');
        Add('                                       ''0'' || TO_CHAR(NVL(PERNUMERO, 0)),       ');
        Add('                                       TO_CHAR(NVL(PERNUMERO, 0)))) AS PERNUMERO  ');
        Add('                       FROM PLANOCONTAPER                                         ');
        Add('                      WHERE (TO_CHAR(PEREXERCICIO) ||                             ');
        Add('                             DECODE(LENGTH(NVL(PERNUMERO, 0)),                    ');
        Add('                                    1,                                            ');
        Add('                                    ''0'' || TO_CHAR(NVL(PERNUMERO, 0)),          ');
        Add('                                    TO_CHAR(NVL(PERNUMERO, 0))) >= :ANOMES)       ');
        Add('                        AND (IDPESSOA = 1)                                        ');
        Add('                      GROUP BY PLACONTA, PLANO) PX                                ');
        Add('              WHERE (P.PLACONTA = PX.PLACONTA)                                    ');
        Add('                AND (P.PLANO = PX.PLANO)                                          ');
        Add('                AND (P.IDPESSOA = 1)                                              ');
        Add('                AND (TO_CHAR(P.PEREXERCICIO) ||                                   ');
        Add('                    DECODE(LENGTH(NVL(P.PERNUMERO, 0)),                           ');
        Add('                           1,                                                     ');
        Add('                           ''0'' || TO_CHAR(NVL(P.PERNUMERO, 0)),                 ');
        Add('                           TO_CHAR(NVL(P.PERNUMERO, 0))) = PX.PERNUMERO)) PD      ');
        Add('    ON PD.PLANO = PL.PLANO                                                        ');
        Add('   AND PL.PLACONTA = PD.PLACONTA                                                  ');
        Add('  LEFT OUTER JOIN PLANOCONTA C                                                    ');
        Add('    ON ((C.PLANO = L.PLANO)                                                       ');
        Add('   AND  (C.PLACONTA = L.PLACONTA))                                                ');
        Add(' WHERE                                                                            ');
        Add('        P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM                                 ');
        Add('   AND (P.PEREXERCICIO = :EXERCICIO)                                              ');
        if CmpRptCM.ParamValues[18].AsBoolean then begin
          Add('   AND (P.IDPESSOA <>:IDPESSOA)                                                 ');
        end else begin
          Add('   AND (P.IDPESSOA =:IDPESSOA)                                                  ');
        end;
        Add('  AND (PL.PLAGRUPO <> ''E'')                                                      ');
        Add('  AND (C.PLAGRUPO  <> ''E'')                                                      ');
        if CmpRptCM.ParamValues[20].AsBoolean then begin
          Add('AND (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO)                ');
        end;
        Add('  AND NOT EXISTS (SELECT 1                                                        ');
        Add('                    FROM PLANOCONTA PLC                                           ');
        Add('                   WHERE PLC.PLANO = L.PLANO                                      ');
        Add('                     AND PLC.PLACONTA = L.PLACONTA                                ');
        Add('                     AND PLC.PLAGRUPO = ''E'')                                    ');

        if Trim(sContaInicial) <> '' then begin
          Add('   AND (PL.PLACONTA >= :CONTAINI)                                               ');
        end;

        if Trim(sContaFinal) <> '' then begin
          Add('   AND (PL.PLACONTA <= :CONTAFIM)                                               ');
        end;

        if CmpRptCM.ParamValues[13].AsInteger = 1 then begin
          Add('   AND (P.PLNEFETIVADO = ''S'')                                                 ');
        end;

        if CmpRptCM.ParamValues[13].AsInteger = 2 then begin
          Add('   AND ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL))                   ');
        end;

        if Trim(sAtividade) <> '' then  begin
          Add('   AND ((L.UNIDNEGOC = :UNIDNEGOC)                                              ');
          Add('   AND  (L.IDPESSOA  = :PESSOA))                                                ');
        end;

        if Trim(sSubConta) <> '' then begin
          Add('   AND ((L.CODSUBCONTA = :SUBCONTA) AND                                         ');
          Add('        (L.IDPESSOA = :PESSOA))                                                 ');
        end;

        if (Trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
          Add('   AND (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + '))                          ');
        end;

        if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0')  then begin
          Add('   AND (L.IDPATRO IN (' + Trim(sIDPatro) + '))                                  ');
        end;

        if Trim(sCCustoInicial) <> '' then begin
          Add('   AND (L.CODCENTROCUSTO >=:CCUSTOINI) AND                                      ');
          Add('       (L.IDEMPRESA =:EMPRESA)                                                  ');
        end;

        if Trim(sCCustoFinal) <> '' then begin
          Add('AND (L.CODCENTROCUSTO <= :CCUSTOFIM) AND                                        ');
          Add('    (L.IDEMPRESA = :EMPRESA)                                                    ');
        end;

        if Trim(sModulo) <> '0' then begin
          Add('  AND (L.IDMODULO = :MODULO)                                                    ');
        end;

        if Trim(sTipoOperacao) <> '' then begin
          if CmpRptCM.ParamValues[12].AsBoolean then begin
            Add('   AND (RTRIM(L.TIPCODIGO) <> :TIPO)                                          ');
          end else begin
            Add('   AND (RTRIM(L.TIPCODIGO) = :TIPO)                                           ');
          end;
        end;

        if Trim(sHistorico) <> '' then  begin
          Add('   AND (RTRIM(L.HITCODHIST) = :HIST)                                            ');
        end;

         {Add('SELECT /*+rule*/                                                               ');
         Add('   PLNPLANIL,LANC, CONTA, PLACONTA, PLANOME, NOMESUBCONTA, PLAGRAU,   ');
         Add('   UNECODIGO, UNIDNEGOC, UN,                                          ');
         Add('   PLACONCORRESP, IDMODULOS, IDEMODULO, PLNDATDIA, LACNUMDOC, DOCUMENTO,          ');
         Add('   HISTORICO, ORDEMHISTORICO, DEB, CRED, CODCENTROCUSTO,              ');
         Add('   CODSUBCONTA, LACDEBCRE, PLNCODIGO, LACNUMLAN,  SC, CC,             ');
         Add('   NOMEPATRO, NOMEPLANOPREV, IDPATRO, IDPLANOPREV                     ');
         Add('FROM                                                                  ');
         Add('(SELECT                                                               ');
         Add('   P.PLNPLANIL,TO_CHAR(P.PLNPLANIL)||''/''||TO_CHAR(L.LACNUMLAN) AS LANC,           ');
         Add('   L.PLACONTA AS CONTA, L.PLACONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, S.NOMESUBCONTA, C.PLAGRAU, ');
         if CmpRptCM.ParamValues[20].AsBoolean then begin
                  Add('   U1.UNECODIGO, U1.UNIDNEGOC, U1.UNIDNEGOC AS UN,           ');
         end else begin
            Add('   U.UNECODIGO, L.UNIDNEGOC, L.UNIDNEGOC AS UN,                    ');
         end;

         Add('   C.PLACONCORRESP, L.IDMODULO AS IDMODULOS, P.IDMODULO AS IDEMODULO, P.PLNDATDIA, L.LACNUMDOC, L.LACNUMDOC AS DOCUMENTO,    ');
         Add('   L.LACHIST1 AS HISTORICO, (1) AS ORDEMHISTORICO,                    ');
         Add('   (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) AS DEB,                ');
         Add('   (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) AS CRED,               ');
         Add('   L.CODCENTROCUSTO, L.CODSUBCONTA, L.LACDEBCRE, L.PLNCODIGO, L.LACNUMLAN, ');
         Add('   L.CODSUBCONTA AS SC, L.CODCENTROCUSTO AS CC,  ');
         Add('   PE.NOME AS NOMEPATRO, PP.NOME AS NOMEPLANOPREV, ');
         Add('   L.IDPATRO, L.IDPLANOPREV                        ');

         Add('FROM                                                                  ');
         Add('   LANCAMENTO L, PLANILHA P, PLANOCONTA C, SUBCONTA S, PESSOA PE, PLANPREVCONTABIL PP, ');
         Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD, ');
         if CmpRptCM.ParamValues[20].AsBoolean then begin
            Add('   (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO         ');
            Add('    WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')          ');
            Add('      AND (IDPESSOA =:IDPESSOA) ) U1,                          ');
         end;

         Add('     UNIDNEGOCIO U  ');
         Add('WHERE                                                                 ');
         Add('    (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                   ');
         Add('    (P.PEREXERCICIO =:EXERCICIO) AND                                  ');
         Add('    (C.PLAGRUPO <> ''E'') AND                                         ');

         if CmpRptCM.ParamValues[18].AsBoolean then
            Add('    (P.IDPESSOA <>:IDPESSOA) AND                                       ')
         else
            Add('    (P.IDPESSOA =:IDPESSOA) AND                                       ');

         if Trim(sContaInicial) <> '' then
            Add('    (C.PLACONTA(+) >=:CONTAINI) AND                       ');

         if Trim(sContaFinal) <> '' then
            Add('    (C.PLACONTA(+) <=:CONTAFIM) AND                       ');

         if CmpRptCM.ParamValues[13].AsInteger = 1 then begin
            Add(' (P.PLNEFETIVADO = ''S'') AND                                      ');
         end;

         if CmpRptCM.ParamValues[13].AsInteger = 2 then begin
            Add(' ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND        ');
         end;

         if Trim(sAtividade) <> '' then  begin
            Add(' ((L.UNIDNEGOC(+) =:UNIDNEGOC) AND                                    ');
            Add('  (L.IDPESSOA(+) =:PESSOA)) AND                                       ');
         end;

         if Trim(sSubConta) <> '' then begin
            Add(' ((L.CODSUBCONTA(+) = :SUBCONTA) AND                                  ');
            Add('  (L.IDPESSOA(+) =:PESSOA)) AND                                       ');
         end;

         Add('      (L.IDPLANOPREV = PP.IDPLANOPREV(+)) AND ');
         Add('      (L.IDPATRO = PE.IDPESSOA(+)) AND           ');

         if (Trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
            Add('      (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND ');
         end;

         if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0')  then begin
            Add('      (L.IDPATRO IN (' + Trim(sIDPatro) + ')) AND        ');
         end;

         if Trim(sCCustoInicial) <> '' then begin
            Add('    (L.CODCENTROCUSTO(+) >=:CCUSTOINI) AND                           ');
            Add('    (L.IDEMPRESA(+) =:EMPRESA) AND                                   ');
         end;

         if Trim(sCCustoFinal) <> '' then begin
            Add('    (L.CODCENTROCUSTO(+) <=:CCUSTOFIM) AND                           ');
            Add('    (L.IDEMPRESA(+) =:EMPRESA) AND                                   ');
         end;

         if Trim(sModulo) <> '0' then begin
            Add(' (L.IDMODULO(+) =:MODULO) AND                                         ');
         end;

         if Trim(sTipoOperacao) <> '' then begin
            if CmpRptCM.ParamValues[12].AsBoolean then begin
               Add('       (RTRIM(L.TIPCODIGO(+)) <>:TIPO) AND                     ');
            end else begin
              Add('       (RTRIM(L.TIPCODIGO(+)) =:TIPO) AND                     ');
            end;
         end;

         if Trim(sHistorico) <> '' then  begin
            Add(' (RTRIM(L.HITCODHIST(+)) =:HIST) AND                          ');
         end;

         Add('    ((PD.PLANO(+)     = C.PLANO) AND                                          ');
         Add('    (PD.PLACONTA(+)   = C.PLACONTA)) AND                                    ');
         Add('    ((L.PLANO     = C.PLANO(+)) AND                                          ');
         Add('    (L.PLACONTA   = C.PLACONTA(+))) AND                                    ');
         Add('    ((L.UNIDNEGOC = U.UNIDNEGOC(+)) AND                               ');
         Add('    (L.IDPESSOA   = U.IDPESSOA(+))) AND                                 ');

         if CmpRptCM.ParamValues[20].AsBoolean then begin
            Add('    (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO(+)) AND ');
         end;

         if CmpRptCM.ParamValues[19].AsBoolean then begin
            Add('    (P.PLNCODIGO = L.PLNCODIGO(+)) AND                                   ');
         end else begin
            Add('    (P.PLNCODIGO = L.PLNCODIGO) AND                                   ');
         end;

         Add('    (L.CODSUBCONTA = S.CODSUBCONTA(+)) AND                            ');
         Add('    (L.IDPESSOA = S.IDPESSOA(+))                                     ');
         //William Moreira SOL 210567 KINTANA 2030912
         Add('    AND NOT EXISTS                        ');
         Add('  (SELECT 1 FROM PLANOCONTA PLC WHERE PLC.PLANO = L.PLANO    ');
         Add('    AND PLC.PLACONTA = L.PLACONTA AND PLC.PLAGRUPO = ''E'')        )              ');
         //William Moreira SOL 210567 KINTANA 2030912
         Add('UNION ALL                                                             ');
         Add('(SELECT                                                               ');
         Add('   P.PLNPLANIL,('' '') AS LANC, ('' '') AS CONTA, L.PLACONTA, ('' '') AS PLANOME, ('' '') AS NOMESUBCONTA, (0) AS PLAGRAU, ');
         Add('   ('' '') AS UNECODIGO, L.UNIDNEGOC, (0) AS UN,   ');
         Add('   ('' '') AS PLACONCORRESP, (0) AS IDMODULOS, P.IDMODULO, P.PLNDATDIA, L.LACNUMDOC, ('' '') AS DOCUMENTO,             ');
         Add('   L.LACHIST2 AS HISTORICO, (2) AS ORDEMHISTORICO, (0) AS DEB, (0) AS CRED,                  ');
         Add('   L.CODCENTROCUSTO, L.CODSUBCONTA, L.LACDEBCRE, L.PLNCODIGO, L.LACNUMLAN,');
         Add('   (0) AS SC, ('' '') AS CC,                  ');
         Add('   ('' '') AS NOMEPATRO, ('' '') AS NOMEPLANOPREV, (0) AS IDPATRO, (0) AS IDPLANOPREV                     ');

         Add('FROM                                                                  ');
         Add('   LANCAMENTO L, PLANILHA P ');
         Add('WHERE                                                                 ');
         Add('    (L.LACHIST2 IS NOT NULL) AND    ');
         Add('    (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                   ');
         Add('    (P.PEREXERCICIO =:EXERCICIO) AND                                  ');

         if CmpRptCM.ParamValues[18].AsBoolean then
            Add('    (P.IDPESSOA <>:IDPESSOA) AND                                   ')
         else
            Add('    (P.IDPESSOA =:IDPESSOA) AND                                    ');

         if Trim(sContaInicial) <> '' then
            Add('    (L.PLACONTA >=:CONTAINI) AND                                   ');

         if Trim(sContaFinal) <> '' then
            Add('    (L.PLACONTA <=:CONTAFIM) AND                                   ');

         if CmpRptCM.ParamValues[13].AsInteger = 1 then begin
            Add(' (P.PLNEFETIVADO = ''S'') AND                                      ');
         end;

         if CmpRptCM.ParamValues[13].AsInteger = 2 then begin
            Add(' ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND        ');
         end;

         if Trim(sAtividade) <> '' then begin
            Add(' ((L.UNIDNEGOC =:UNIDNEGOC) AND                                    ');
            Add('  (L.IDPESSOA  =:PESSOA)) AND                                      ');
         end;

         if Trim(sSubConta) <> '' then begin
            Add(' ((L.CODSUBCONTA =:SUBCONTA) AND                                   ');
            Add('  (L.IDPESSOA    =:PESSOA)) AND                                    ');
         end;

         if (Trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
             Add('     (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND ');
         end;

         if  (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
             Add('      (L.IDPATRO IN (' + trim(sIDPatro) + ')) AND        ');
         end;

         if Trim(sCCustoInicial) <> '' then begin
            Add('    (L.CODCENTROCUSTO >=:CCUSTOINI) AND                           ');
            Add('    (L.IDEMPRESA =:EMPRESA) AND                                   ');
         end;

         if Trim(sCCustoFinal) <> '' then begin
            Add('    (L.CODCENTROCUSTO <=:CCUSTOFIM) AND                           ');
            Add('    (L.IDEMPRESA =:EMPRESA) AND                                   ');
         end;

         if Trim(sModulo) <> '0' then begin
            Add(' (L.IDMODULO =:MODULO) AND                                         ');
         end;

         if Trim(sTipoOperacao) <> '' then begin
            if CmpRptCM.ParamValues[12].AsBoolean then  begin
               Add('       (RTRIM(L.TIPCODIGO) <>:TIPO) AND                         ');
            end else begin
               Add('       (RTRIM(L.TIPCODIGO) =:TIPO) AND                          ');
            end;
         end;

         if Trim(sHistorico) <> '' then begin
            Add(' (RTRIM(L.HITCODHIST) =:HIST) AND                                 ');
         end;

         Add('    (P.PLNCODIGO = L.PLNCODIGO)                                      ');
         //William Moreira SOL 210567 KINTANA 2030912
         Add('    AND NOT EXISTS                        ');
         Add('  (SELECT 1 FROM PLANOCONTA PLC WHERE PLC.PLANO = L.PLANO    ');
         Add('    AND PLC.PLACONTA = L.PLACONTA AND PLC.PLAGRUPO = ''E'')        )              ');
         //William Moreira SOL 210567 KINTANA 2030912
         Add('UNION ALL                                                             ');
         Add('(SELECT                                                               ');
         Add('   P.PLNPLANIL,('' '') AS LANC, ('' '') AS CONTA, L.PLACONTA, ('' '') AS PLANOME, ('' '') AS NOMESUBCONTA, (0) AS PLAGRAU,  ');
         Add('   ('' '') AS UNECODIGO, L.UNIDNEGOC, (0) AS UN,   ');
         Add('   ('' '') AS PLACONCORRESP, (0) AS IDMODULOS, P.IDMODULO, P.PLNDATDIA, L.LACNUMDOC, ('' '') AS DOCUMENTO, ');
         Add('   L.LACHIST3 AS HISTORICO, (3) AS ORDEMHISTORICO, (0) AS DEB, (0) AS CRED,                  ');
         Add('   L.CODCENTROCUSTO, L.CODSUBCONTA, L.LACDEBCRE, L.PLNCODIGO, L.LACNUMLAN,');
         Add('   (0) AS SC, ('' '') AS CC,                  ');
         Add('   ('' '') AS NOMEPATRO, ('' '') AS NOMEPLANOPREV, (0) AS IDPATRO, (0) AS IDPLANOPREV                     ');
         Add('FROM                                                                  ');
         Add('   LANCAMENTO L, PLANILHA P ');
         Add('WHERE                                                                 ');
         Add('    (L.LACHIST3 IS NOT NULL) AND    ');
         Add('    (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                   ');
         Add('    (P.PEREXERCICIO =:EXERCICIO) AND                                  ');

         if CmpRptCM.ParamValues[18].AsBoolean then
            Add('    (P.IDPESSOA <>:IDPESSOA) AND                                   ')
         else
            Add('    (P.IDPESSOA =:IDPESSOA) AND                                    ');

         if Trim(sContaInicial) <> '' then
            Add('    (L.PLACONTA >=:CONTAINI) AND                                   ');

         if Trim(sContaFinal) <> '' then
            Add('    (L.PLACONTA <=:CONTAFIM) AND                                   ');

         if CmpRptCM.ParamValues[13].AsInteger = 1 then begin
            Add(' (P.PLNEFETIVADO = ''S'') AND                                      ');
         end;

         if CmpRptCM.ParamValues[13].AsInteger = 2 then begin
              Add(' ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND        ');
         end;

         if Trim(sAtividade) <> '' then begin
            Add(' ((L.UNIDNEGOC =:UNIDNEGOC) AND                                    ');
            Add('  (L.IDPESSOA =:PESSOA)) AND                                       ');
         end;

         if Trim(sSubConta) <> '' then begin
            Add(' ((L.CODSUBCONTA = :SUBCONTA) AND                                  ');
            Add('  (L.IDPESSOA =:PESSOA)) AND                                       ');
         end;

         if (Trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
            Add('      (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND ');
         end;

         if  (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
            Add('      (L.IDPATRO IN (' + trim(sIDPatro) + ')) AND        ');
         end;

         if Trim(sCCustoInicial) <> '' then begin
            Add('    (L.CODCENTROCUSTO >=:CCUSTOINI) AND                           ');
            Add('    (L.IDEMPRESA =:EMPRESA) AND                                   ');
         end;

         if Trim(sCCustoFinal) <> '' then begin
            Add('    (L.CODCENTROCUSTO <=:CCUSTOFIM) AND                           ');
            Add('    (L.IDEMPRESA =:EMPRESA) AND                                   ');
         end;

         if Trim(sModulo) <> '0' then begin
            Add(' (L.IDMODULO =:MODULO) AND                                        ');
         end;

         if Trim(sTipoOperacao) <> '' then begin
            if CmpRptCM.ParamValues[12].AsBoolean then begin
               Add('       (RTRIM(L.TIPCODIGO) <>:TIPO) AND                     ');
            end else begin
               Add('       (RTRIM(L.TIPCODIGO) =:TIPO) AND                     ');
            end;
         end;

         if Trim(sHistorico) <> '' then begin
            Add(' (RTRIM(L.HITCODHIST) =:HIST) AND                          ');
         end;

         Add('    (P.PLNCODIGO = L.PLNCODIGO)                                   ');
         //William Moreira SOL 210567 KINTANA 2030912
         Add('    AND NOT EXISTS                        ');//William Moreira
         Add('  (SELECT 1 FROM PLANOCONTA PLC WHERE PLC.PLANO = L.PLANO    ');
         Add('    AND PLC.PLACONTA = L.PLACONTA AND PLC.PLAGRUPO = ''E'')        )              ');
         //William Moreira SOL 210567 KINTANA 2030912
         Add('UNION ALL                                                             ');
         Add('(SELECT                                                               ');
         Add('   P.PLNPLANIL,('' '') AS LANC, ('' '') AS CONTA, L.PLACONTA, ('' '') AS PLANOME, ('' '') AS NOMESUBCONTA, (0) AS PLAGRAU, ');
         Add('   ('' '') AS UNECODIGO, L.UNIDNEGOC, (0) AS UN,   ');
         Add('   ('' '') AS PLACONCORRESP, (0) AS IDMODULOS, P.IDMODULO, P.PLNDATDIA, L.LACNUMDOC, ('' '') AS DOCUMENTO, ');
         Add('   L.LACHIST4 AS HISTORICO, (4) AS ORDEMHISTORICO, (0) AS DEB, (0) AS CRED,                  ');
         Add('   L.CODCENTROCUSTO, L.CODSUBCONTA, L.LACDEBCRE, L.PLNCODIGO, L.LACNUMLAN,');
         Add('   (0) AS SC, ('' '') AS CC,                  ');
         Add('   ('' '') AS NOMEPATRO, ('' '') AS NOMEPLANOPREV, (0) AS IDPATRO, (0) AS IDPLANOPREV                     ');
         Add('FROM                                                                  ');
         Add('   LANCAMENTO L, PLANILHA P ');
         Add('WHERE                                                                 ');
         Add('    (L.LACHIST4 IS NOT NULL) AND    ');
         Add('    (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                   ');
         Add('    (P.PEREXERCICIO =:EXERCICIO) AND                                  ');

         if CmpRptCM.ParamValues[18].AsBoolean then
            Add('    (P.IDPESSOA <>:IDPESSOA) AND                                       ')
         else
            Add('    (P.IDPESSOA =:IDPESSOA) AND                                       ');

         if Trim(sContaInicial) <> '' then
            Add('    (L.PLACONTA >=:CONTAINI) AND                       ');

         if Trim(sContaFinal) <> '' then
            Add('    (L.PLACONTA <=:CONTAFIM) AND                       ');

         if CmpRptCM.ParamValues[13].AsInteger = 1 then begin
            Add(' (P.PLNEFETIVADO = ''S'') AND                                      ');
         end;

         if CmpRptCM.ParamValues[13].AsInteger = 2 then begin
            Add(' ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND        ');
         end;

         if Trim(sAtividade) <> '' then begin
            Add(' ((L.UNIDNEGOC =:UNIDNEGOC) AND                                    ');
            Add('  (L.IDPESSOA =:PESSOA)) AND                                       ');
         end;

         if Trim(sSubConta) <> '' then begin
            Add(' ((L.CODSUBCONTA = :SUBCONTA) AND                                  ');
            Add('  (L.IDPESSOA =:PESSOA)) AND                                       ');
         end;

         if (Trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
             Add('      (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND ');
         end;

         if  (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
           Add('      (L.IDPATRO IN (' + trim(sIDPatro) + ')) AND        ');
         end;

         if Trim(sCCustoInicial) <> '' then begin
            Add('    (L.CODCENTROCUSTO >=:CCUSTOINI) AND              ');
            Add('    (L.IDEMPRESA =:EMPRESA) AND                                   ');
         end;

         if Trim(sCCustoFinal) <> '' then begin
            Add('    (L.CODCENTROCUSTO <=:CCUSTOFIM) AND              ');
            Add('    (L.IDEMPRESA =:EMPRESA) AND                                   ');
         end;

         if Trim(sModulo) <> '0' then  begin
            Add(' (L.IDMODULO =:MODULO) AND                                         ');
         end;

         if Trim(sTipoOperacao) <> '' then begin
           if CmpRptCM.ParamValues[12].AsBoolean then begin
               Add('       (RTRIM(L.TIPCODIGO) <>:TIPO) AND                     ');
            end else begin
               Add('       (RTRIM(L.TIPCODIGO) =:TIPO) AND                     ');
            end;
         end;

         if Trim(sHistorico) <> '' then begin
            Add(' (RTRIM(L.HITCODHIST) =:HIST) AND                          ');
         end;

         Add('    (P.PLNCODIGO = L.PLNCODIGO)                                   ');
         //William Moreira SOL 210567 KINTANA 2030912
         Add('    AND NOT EXISTS                        ');
         Add('  (SELECT 1 FROM PLANOCONTA PLC WHERE PLC.PLANO = L.PLANO    ');
         Add('    AND PLC.PLACONTA = L.PLACONTA AND PLC.PLAGRUPO = ''E'')        )              ');
         //William Moreira SOL 210567 KINTANA 2030912
         Add('UNION ALL                                                             ');
         Add('(SELECT                                                               ');
         Add('   P.PLNPLANIL,('' '') AS LANC, ('' '') AS CONTA, L.PLACONTA, ('' '') AS PLANOME, ('' '') AS NOMESUBCONTA, (0) AS PLAGRAU,  ');
         Add('   ('' '') AS UNECODIGO, L.UNIDNEGOC, (0) AS UN,   ');
         Add('   ('' '') AS PLACONCORRESP, (0) AS IDMODULOS, P.IDMODULO, P.PLNDATDIA, L.LACNUMDOC, ('' '') AS DOCUMENTO, ');
         Add('   L.LACHIST3 AS HISTORICO, (5) AS ORDEMHISTORICO, (0) AS DEB, (0) AS CRED,                  ');
         Add('   L.CODCENTROCUSTO, L.CODSUBCONTA, L.LACDEBCRE, L.PLNCODIGO, L.LACNUMLAN,');
         Add('   (0) AS SC, ('' '') AS CC,                   ');
         Add('   ('' '') AS NOMEPATRO, ('' '') AS NOMEPLANOPREV, (0) AS IDPATRO, (0) AS IDPLANOPREV                     ');
         Add('FROM                                                                  ');
         Add('   LANCAMENTO L, PLANILHA P ');
         Add('WHERE                                                                 ');
         Add('    (L.LACHIST5 IS NOT NULL) AND    ');
         Add('    (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                   ');
         Add('    (P.PEREXERCICIO =:EXERCICIO) AND                                  ');

         if CmpRptCM.ParamValues[18].AsBoolean then
            Add('    (P.IDPESSOA <>:IDPESSOA) AND                                   ')
         else
            Add('    (P.IDPESSOA =:IDPESSOA) AND                                    ');

         if Trim(sContaInicial) <> '' then
            Add('    (L.PLACONTA >=:CONTAINI) AND                                   ');

         if Trim(sContaFinal) <> '' then
            Add('    (L.PLACONTA <=:CONTAFIM) AND                                   ');

         if CmpRptCM.ParamValues[13].AsInteger = 1 then begin
            Add(' (P.PLNEFETIVADO = ''S'') AND                                      ');
         end;

         if CmpRptCM.ParamValues[13].AsInteger = 2 then begin
            Add(' ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND        ');
         end;

         if Trim(sAtividade) <> '' then begin
            Add(' ((L.UNIDNEGOC =:UNIDNEGOC) AND                                    ');
            Add('  (L.IDPESSOA =:PESSOA)) AND                                       ');
         end;

         if Trim(sSubConta) <> '' then begin
            Add(' ((L.CODSUBCONTA = :SUBCONTA) AND                                  ');
            Add('  (L.IDPESSOA    = :PESSOA)) AND                                   ');
         end;

         if (Trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
             Add('      (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND ');
         end;

         if  (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
             Add('      (L.IDPATRO IN (' + trim(sIDPatro) + ')) AND        ');
         end;

         if Trim(sCCustoInicial) <> '' then begin
            Add('    (L.CODCENTROCUSTO >=:CCUSTOINI) AND              ');
            Add('    (L.IDEMPRESA =:EMPRESA) AND                                   ');
         end;

         if Trim(sCCustoFinal) <> '' then begin
            Add('    (L.CODCENTROCUSTO <=:CCUSTOFIM) AND              ');
            Add('    (L.IDEMPRESA =:EMPRESA) AND                                   ');
         end;

         if Trim(sModulo) <> '0' then begin
            Add(' (L.IDMODULO =:MODULO) AND                                         ');
         end;

         if Trim(sTipoOperacao) <> '' then begin
            if CmpRptCM.ParamValues[12].AsBoolean then begin
               Add('       (RTRIM(L.TIPCODIGO) <>:TIPO) AND                     ');
            end else begin
               Add('       (RTRIM(L.TIPCODIGO) =:TIPO) AND                     ');
            end;
         end;

         if Trim(sHistorico) <> '' then begin
            Add(' (RTRIM(L.HITCODHIST) =:HIST) AND                          ');
         end;

         Add('    (P.PLNCODIGO = L.PLNCODIGO)                                   ');
         //William Moreira SOL 210567 KINTANA 2030912
         Add('    AND NOT EXISTS                        ');
         Add('  (SELECT 1 FROM PLANOCONTA PLC WHERE PLC.PLANO = L.PLANO    ');
         Add('    AND PLC.PLACONTA = L.PLACONTA AND PLC.PLAGRUPO = ''E'')        )              ');
         //William Moreira SOL 210567 KINTANA 2030912
         }

         // Thiago Melo SOL 210568/15662 Ktn 2058378

         Add('ORDER BY                                                           ');

         Add('    PLNDATDIA,                                                     ');

         if CmpRptCM.ParamValues[22].AsInteger = 0 then begin
           // Thiago Melo SOL 210568/15662 Ktn 2058378
           //Add('PLNPLANIL, LACNUMLAN, LACDEBCRE, ORDEMHISTORICO');
           Add('PLNPLANIL, LACNUMLAN, LACDEBCRE');
           // Thiago Melo SOL 210568/15662 Ktn 2058378
         end;

         if CmpRptCM.ParamValues[22].AsInteger = 1 then begin
           // Thiago Melo SOL 210568/15662 Ktn 2058378
           //Add('PLNPLANIL, LACNUMLAN, LACDEBCRE, ORDEMHISTORICO, IDMODULOS');
           Add('PLNPLANIL, LACNUMLAN, LACDEBCRE, IDMODULOS');
           // Thiago Melo SOL 210568/15662 Ktn 2058378
         end;

         if CmpRptCM.ParamValues[22].AsInteger = 2 then begin
           // Thiago Melo SOL 210568/15662 Ktn 2058378
           //Add('LACNUMDOC, PLACONTA, CODCENTROCUSTO, CODSUBCONTA, UNIDNEGOC, PLNCODIGO, LACNUMLAN, LACDEBCRE, ORDEMHISTORICO');
           Add('LACNUMDOC, PLACONTA, CODCENTROCUSTO, CODSUBCONTA, UNIDNEGOC, PLNCODIGO, LACNUMLAN, LACDEBCRE');
           // Thiago Melo SOL 210568/15662 Ktn 2058378

         end;

//pendência 27560 - 07/03/2008 troquei o dataset deste relatório para TQUERY por causa do problema do
//Erros "insufficient memory for this operation" (para este tem que configurar o BDE nos ítens MEMSIZE e SHEREDMEMSIZE entre outros) do BDE e "temporary table resource limit" do TClientdataset,
//pois o resultado da query é muito grande (> 200.000 linhas).
{
         sqlDiario.Prepare;

         sqlDiario.ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
         sqlDiario.ParamByName('DATAINI').asDate      := CmpRptCM.ParamValues[1].AsDateTime;
         sqlDiario.ParamByName('DATAFIM').asDate      := CmpRptCM.ParamValues[2].AsDateTime;
         sqlDiario.ParamByName('EXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;

         if Trim(sContaInicial) <> '' then
            sqlDiario.ParamByName('CONTAINI').asString := Espaco(sContaInicial,18);

         if Trim(sContaFinal) <> '' then
            sqlDiario.ParamByName('CONTAFIM').asString := Espaco(sContaFinal,18);

         if Trim(sCCustoInicial) <> '' then begin
            sqlDiario.ParamByName('CCUSTOINI').asString   := Espaco(sCCustoInicial,10);
            sqlDiario.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
         end;

         if Trim(sCCustoFinal) <> '' then begin
            sqlDiario.ParamByName('CCUSTOFIM').asString   := Espaco(sCCustoFinal,10);
            sqlDiario.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
         end;

         if Trim(sSubConta) <> '' then begin
            sqlDiario.ParamByName('SUBCONTA').asInteger:= StrToInt(sSubConta);
            sqlDiario.ParamByName('PESSOA').asFloat    := CrmRptCM.IdEmpresa;
         end;

         if Trim(sAtividade) <> '' then begin
            sqlDiario.ParamByName('UNIDNEGOC').asInteger := StrToInt(sAtividade);
            sqlDiario.ParamByName('PESSOA').asFloat      := CrmRptCM.IdEmpresa;
         end;

         if Trim(sModulo) <> '0' then begin
            sqlDiario.ParamByName('MODULO').AsInteger := CmpRptCM.ParamValues[8].AsInteger;
         end;

         if Trim(sTipoOperacao) <> '' then begin
            sqlDiario.ParamByName('TIPO').asString := CmpRptCM.ParamValues[11].AsString;
         end;

          if Trim(sHistorico) <> '' then begin
            sqlDiario.ParamByName('HIST').asString := CmpRptCM.ParamValues[10].AsString;
         end;
         SQLDIARIO.SQL.SaveToFile('c:\contab.txt');
         sqlDiario.Open;
}

         SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\contab.txt');
      end;

      // Alterado por FHBS - SOL: 129731 KTN: 715203
      if not CmpRptCM.ParamValues[27].AsBoolean then
      begin
         qryDiario.ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
         qryDiario.ParamByName('DATAINI').asDate      := CmpRptCM.ParamValues[1].AsDateTime;
         qryDiario.ParamByName('DATAFIM').asDate      := CmpRptCM.ParamValues[2].AsDateTime;
         qryDiario.ParamByName('EXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;

         if Trim(sContaInicial) <> '' then
            qryDiario.ParamByName('CONTAINI').asString := Espaco(sContaInicial,18);

         if Trim(sContaFinal) <> '' then
            qryDiario.ParamByName('CONTAFIM').asString := Espaco(sContaFinal,18);

         if Trim(sCCustoInicial) <> '' then begin
            qryDiario.ParamByName('CCUSTOINI').asString   := Espaco(sCCustoInicial,10);
            qryDiario.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
         end;

         if Trim(sCCustoFinal) <> '' then begin
            qryDiario.ParamByName('CCUSTOFIM').asString   := Espaco(sCCustoFinal,10);
            qryDiario.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
         end;

         if Trim(sSubConta) <> '' then begin
            qryDiario.ParamByName('SUBCONTA').asInteger:= StrToInt(sSubConta);
            qryDiario.ParamByName('PESSOA').asFloat    := CrmRptCM.IdEmpresa;
         end;

         if Trim(sAtividade) <> '' then begin
            qryDiario.ParamByName('UNIDNEGOC').asInteger := StrToInt(sAtividade);
            qryDiario.ParamByName('PESSOA').asFloat      := CrmRptCM.IdEmpresa;
         end;

         if Trim(sModulo) <> '0' then begin
            qryDiario.ParamByName('MODULO').AsInteger := CmpRptCM.ParamValues[8].AsInteger;
         end;

         if Trim(sTipoOperacao) <> '' then begin
            qryDiario.ParamByName('TIPO').asString := CmpRptCM.ParamValues[11].AsString;
         end;

          if Trim(sHistorico) <> '' then begin
            qryDiario.ParamByName('HIST').asString := CmpRptCM.ParamValues[10].AsString;
         end;

         // Thiago Melo SOL 210568/15662 Ktn 2058378
         if (not qryDiario.ParamByName('DATAINI').IsNull) then begin
           qryDiario.ParamByName('ANOMES').AsString := FormatDateTime('yyyy/mm',StrToDate(qryDiario.ParamByName('DATAINI').AsString));
         end;
         // Thiago Melo SOL 210568/15662 Ktn 2058378      

         qryDiario.Open;
      end
      else
      begin
        // Alterado por FHBS - SOL: 129731 KTN: 715203 - Gerando PDF
        dsDiario.DataSet := cdsDiario;

        CrmRptCM.DeviceType := rdtPdf;
        CrmRptCM.FileName   := CmpRptCM.ParamValues[28].AsString;
        CrmRptCM.ShowPrintDialog := False;

        sqlDiario.SQL.Clear;
        sqlDiario.SQL.Add('select * from (select rownum as nLinha, a.* from (');
        sqlDiario.SQL.Add(qryDiario.SQL.Text);
        sqlDiario.SQL.Add(') a ) where nLinha between :nLinhaIni and :nLinhaFim');

        nPosSql       := 1;
        bQuebraSql    := (StrToDate(sDataFinal) - StrToDate(sDataInicial) >= 27);
        If bQuebraSql then
          nQteDias    := Trunc(StrToDate(sDataFinal) - StrToDate(sDataInicial)) div 3;

        while True do
        begin
          If bQuebraSql then
          begin
            Case nPosSql Of
              1 : begin
                    sDataSqlIni := CmpRptCM.ParamValues[1].AsDateTime;
                    sDataSqlFim := sDataSqlIni + nQteDias;
                  end;
              2 : begin
                    sDataSqlIni := sDataSqlFim + 1;
                    sDataSqlFim := sDataSqlIni + nQteDias;
                  end;
              3 : begin
                    sDataSqlIni := sDataSqlFim + 1;
                    sDataSqlFim := CmpRptCM.ParamValues[2].AsDateTime;
                  end;
             end;
          end
          else
          begin
            sDataSqlIni := CmpRptCM.ParamValues[1].AsDateTime;
            sDataSqlFim := CmpRptCM.ParamValues[2].AsDateTime;
          end;

          nLinIni := 1;
          nLinFim := nLinInter;
          repeat
            // PARÂMETROS DA QUERY
            if cdsDiarioAux.Active then cdsDiarioAux.Close;
            sqlDiario.Prepare;

            sqlDiario.ParamByName('nLinhaIni').asInteger := nLinIni;
            sqlDiario.ParamByName('nLinhaFim').asInteger := nLinFim;

            sqlDiario.ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
            sqlDiario.ParamByName('DATAINI').asDate      := sDataSqlIni;
            sqlDiario.ParamByName('DATAFIM').asDate      := sDataSqlFim;
            sqlDiario.ParamByName('EXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;

            if Trim(sContaInicial) <> '' then
               sqlDiario.ParamByName('CONTAINI').asString := Espaco(sContaInicial,18);

            if Trim(sContaFinal) <> '' then
               sqlDiario.ParamByName('CONTAFIM').asString := Espaco(sContaFinal,18);

            if Trim(sCCustoInicial) <> '' then begin
               sqlDiario.ParamByName('CCUSTOINI').asString   := Espaco(sCCustoInicial,10);
               sqlDiario.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
            end;

            if Trim(sCCustoFinal) <> '' then begin
               sqlDiario.ParamByName('CCUSTOFIM').asString   := Espaco(sCCustoFinal,10);
               sqlDiario.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
            end;

            if Trim(sSubConta) <> '' then begin
               sqlDiario.ParamByName('SUBCONTA').asInteger:= StrToInt(sSubConta);
               sqlDiario.ParamByName('PESSOA').asFloat    := CrmRptCM.IdEmpresa;
            end;

            if Trim(sAtividade) <> '' then begin
               sqlDiario.ParamByName('UNIDNEGOC').asInteger := StrToInt(sAtividade);
               sqlDiario.ParamByName('PESSOA').asFloat      := CrmRptCM.IdEmpresa;
            end;

            if Trim(sModulo) <> '0' then begin
               sqlDiario.ParamByName('MODULO').AsInteger := CmpRptCM.ParamValues[8].AsInteger;
            end;

            if Trim(sTipoOperacao) <> '' then begin
               sqlDiario.ParamByName('TIPO').asString := CmpRptCM.ParamValues[11].AsString;
            end;

             if Trim(sHistorico) <> '' then begin
               sqlDiario.ParamByName('HIST').asString := CmpRptCM.ParamValues[10].AsString;
             end;

             // Thiago Melo SOL 210568/15662 Ktn 2058378
             if (not qryDiario.ParamByName('DATAINI').IsNull) then begin
               qryDiario.ParamByName('ANOMES').AsString := FormatDateTime('yyyy/mm',StrToDate(qryDiario.ParamByName('DATAINI').AsString));
             end;
             // Thiago Melo SOL 210568/15662 Ktn 2058378

            sqlDiario.Open;

            If (nPosSql = 1) and (nLinIni = 1) then
              cdsDiario.Data := cdsDiarioAux.Data
            else
            begin
              cdsDiarioAux.First;
              while not cdsDiarioAux.Eof do
              begin
                cdsDiario.Append;
                For iFields := 0 to cdsDiario.Fields.Count-1 do
                  cdsDiario.Fields[iFields].Value := cdsDiarioAux.Fields[iFields].Value;
                cdsDiario.Post;
                cdsDiarioAux.Next;
              end;
            end;

            nLinIni := nLinFim + 1;
            nLinFim := nLinIni + nLinInter - 1;

          until ((cdsDiarioAux.RecordCount = 0) or (cdsDiarioAux.RecordCount < nLinInter));

          if cdsDiarioAux.Active then cdsDiarioAux.Close;

          If (not bQuebraSql) or (nPosSql = 3) then
          begin
            Break;
          end;
          Inc(nPosSql);
        end;
      end;

      if CmpRptCM.ParamValues[21].AsBoolean then
      Begin
          ppLabel101.caption := 'Num.Documento';
          dbtxtDiarioNumDoc.visible := true;
          dbtxtDiarioSC.visible     := false;
          dbtxtDiarioSCNome.visible := false;
      End Else
      Begin
          ppLabel101.caption := 'Sub-Conta';
          dbtxtDiarioNumDoc.visible := false;
          dbtxtDiarioSC.visible     := true;
          dbtxtDiarioSCNome.visible := true;
      End;
   Except
     On E:Exception Do
     Begin
        CMDebugToFile('Erro Relatório Diário:' + (#13+#10) + E.Message );
     End;
   End;

end;

procedure TRptDiario.ppHeaderBand15BeforePrint(Sender: TObject);
begin
   inherited;
   if lblCalcContadorDia.text = '1' then
    begin
       txtTotTransportadoD.visible := False;
       txtTotTransportadoC.visible := False;
       txtlabelTotHead.visible     := False;
    end
   else
    begin
       txtTotTransportadoD.visible := True;
       txtTotTransportadoC.visible := True;
       txtlabelTotHead.visible     := True;
    end;
end;

procedure TRptDiario.ppDetailBand7BeforeGenerate(Sender: TObject);
var sMascara : String;
begin
  // Alterado por FHBS - SOL: 129731 KTN: 715203 - Alteração de "qryDiario" para "dsDiario.DataSet"
  if (dsDiario.DataSet.FieldByName('PLAGRAU').asInteger <> 0) and (CmpRptCM.ParamValues[16].AsBoolean) and (not bCorresp) then begin
     sMascara := CtrlGeral.CalcMascaraPorGrau(ParamIntegra.MascaraPlano, dsDiario.DataSet.FieldByName('PLAGRAU').asInteger);
     dbtxtContaDiario.DisplayFormat := sMascara + ';0; ';
  end else begin
     dbtxtContaDiario.DisplayFormat := '';
  end;
  rTotalCreDiario := rTotalCreDiario + dsDiario.DataSet.FieldByName('CRED').asFloat;
  rTotalDebDiario := rTotalDebDiario + dsDiario.DataSet.FieldByName('DEB').asFloat;
end;

procedure TRptDiario.ppFooterBand15BeforePrint(Sender: TObject);
begin
   inherited;
   lblContadorDia.Caption := IntToStr((iPagIni + StrToInt(lblCalcContadorDia.text)) - 1);

   if lblCalcContadorDia.text = lblCalcMaxPagDia.text then begin
      lblSomaCreFot.visible := false;
      lblSomaDebFot.visible := false;
      txtlabelTot.visible   := false;
   end else begin
      lblSomaCreFot.visible := true;
      lblSomaDebFot.visible := true;
      txtlabelTot.visible   := true;
   end;
end;

procedure TRptDiario.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGeral := TCtrlGeral.Create;
  CtrlGeral.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);
end;

procedure TRptDiario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CtrlGeral.free;
  CtrlRptBalancete.Free;
  CtrlPeriodo.Free;
end;

procedure TRptDiario.txtTotTransportadoDPrint(Sender: TObject);
begin
  inherited;
  // Alterado por FHBS - SOL: 129731 KTN: 715203 - Alteração de "qryDiario" para "dsDiario.DataSet"
  if dsDiario.DataSet.Eof then
     txtTotTransportadoD.caption  :=  FormatFloat('###,###,###,###,##0.00', lblSomaDebCab.Value)
  else
     txtTotTransportadoD.caption  :=  FormatFloat('###,###,###,###,##0.00', (lblSomaDebCab.Value - dsDiario.DataSet.FieldByName('DEB').asFloat));
end;

procedure TRptDiario.txtTotTransportadoCPrint(Sender: TObject);
begin
  inherited;
  // Alterado por FHBS - SOL: 129731 KTN: 715203 - Alteração de "qryDiario" para "dsDiario.DataSet"
  if dsDiario.DataSet.Eof then
     txtTotTransportadoC.caption  :=  FormatFloat('###,###,###,###,##0.00', lblSomaCreCab.Value)
  else
     txtTotTransportadoC.caption  :=  FormatFloat('###,###,###,###,##0.00', (lblSomaCreCab.Value - dsDiario.DataSet.FieldByName('CRED').asFloat));
end;

procedure TRptDiario.sqlTitulosFormartParam(sParamName, sOldValue: String;
  var sNewValue: String);
begin
  inherited;
  if (sParamName = 'IDPLANOPREV_MARCA') or
     (sParamName = 'IDPESSOA_MARCA')    then
     sNewValue := Copy(sOldValue,1,Length(sOldValue));

end;

end.
