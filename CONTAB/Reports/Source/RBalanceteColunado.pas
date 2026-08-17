{-----------------------------------------------------------------------------
Autor(a)    :  Bruno Bastos
Data        :  05/02/2010
Pendência   :  SOL 130652 KINTANA 734352
Descricao   :  Alteração para utilizar o plano de contas vigente na época.
------------------------------------------------------------------------------}
{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  26/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidade              }
{                                                       }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 08/04/2002                             }
{                                                       }
{*******************************************************}

(*==============================================================================
Analista : Antonio Marcos Fernandes de Souza (amf)
Data     : 28.12.2005
Pendência: 20936
Alteração: Correção do tipo de dado no parâmetro relacionado ao grau da conta. O relató-
           rio não estava obedecendo o grau definido pelo usuário na tela de parâmetros do
           relatório.
==============================================================================*)

{ 20/10/2003 - by Alex - correção pendência 14842
       Caso PLAGRUPO
          'A'tivo   ou 'D'espesa ==> saldo Devedor (+) ==> saldo Credor (-)
          'P'assivo ou 'R'eceita ==> saldo Devedor (-) ==> saldo Credor (+)
        SENÃO
          'C'usto ou 'O'utros ou 'E'statistica ==> saldo Devedor (+) ==> saldo Credor (-)
}

unit RBalanceteColunado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RRelatWeb, uCmRptManager, TXComp, CmParamReport, Db, DBTables,  uCtrlRptBalancete,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ADODB, DBClient, Provider, uSistema, FCmReport, uCMClientDataSet, uCmSqlParams,
  uCMTypes, uCMfileUtils,
  uCtrlContab, TXRB; //Bruno Bastos - Pend. 17454 - 21/09/2004


type
  TRptBalanceteColunado = class(TFrmCmReport)
    dsBalancete: TwwDataSource;
    ppBalancete: TppDBPipeline;
    rpBalancete: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppLine35: TppLine;
    ppLine38: TppLine;
    pplPer1: TppLabel;
    pplPer2: TppLabel;
    pplPer3: TppLabel;
    pplPer4: TppLabel;
    pplPer5: TppLabel;
    pplPer6: TppLabel;
    pplPer7: TppLabel;
    pplPer8: TppLabel;
    ppDBImage1: TppDBImage;
    pplPer9: TppLabel;
    pplPer10: TppLabel;
    pplPer11: TppLabel;
    pplPer12: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    pplTitulo: TppLabel;
    lblFiltro2: TppLabel;
    lblFiltro1: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppDBText7: TppDBText;
    dbpplPer1: TppDBText;
    dbpplPer2: TppDBText;
    dbpplPer3: TppDBText;
    dbpplPer4: TppDBText;
    dbpplPer5: TppDBText;
    dbpplPer6: TppDBText;
    dbpplPer7: TppDBText;
    dbpplPer8: TppDBText;
    dbpplPer9: TppDBText;
    dbpplPer10: TppDBText;
    dbpplPer11: TppDBText;
    dbpplPer12: TppDBText;
    dbpplPerTot: TppDBText;
    ppFooterBand19: TppFooterBand;
    ppLine39: TppLine;
    ppLabel85: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    sqlBalancete: TCMSqlParams;
    CdsBalancete: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    sqlEmpresaProp: TCMSqlParams;
    cdsEmpresaProp: TCMClientDataSet;
    dsEmpresaProp: TwwDataSource;
    pplEmpresaProp: TppBDEPipeline;
    cdsTitulos: TCMClientDataSet;
    rptBalanceteLine1: TppLine;
    rptBalanceteLabel7: TppLabel;
    memDescricao: TppMemo;
    memCol1: TppMemo;
    BandaSumario: TppSummaryBand;
    pplPer1T: TppLabel;
    memCol2: TppMemo;
    pplPer2T: TppLabel;
    memCol3: TppMemo;
    pplPer3T: TppLabel;
    memCol4: TppMemo;
    memCol5: TppMemo;
    memCol6: TppMemo;
    memCol7: TppMemo;
    memCol8: TppMemo;
    memCol9: TppMemo;
    memCol10: TppMemo;
    memCol11: TppMemo;
    memCol12: TppMemo;
    pplPer6T: TppLabel;
    pplPer5T: TppLabel;
    pplPer4T: TppLabel;
    pplPer7T: TppLabel;
    pplPer9T: TppLabel;
    pplPer10T: TppLabel;
    pplPer11T: TppLabel;
    pplPer12T: TppLabel;
    pplPer8T: TppLabel;
    cdsTot: TCMClientDataSet;
    sqlTot: TCMSqlParams;
    memColTot: TppMemo;
    pplTotal: TppLabel;
    cdsPatro: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    sqlPlanoPrev: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMAfterExecute(ActionExecute: TActionExecute);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlContab       : TCtrlContab;
    CtrlRptBalancete : TCtrlRptBalancete;
    sExercicio       : String;
    sPeriodoInicial  : String;
    sPeriodoFinal    : String;
    sContaInicial    : String;
    sContaFinal      : String;
    sCCustoInicial   : String;
    sCCustoFinal     : String;
    sAtividade       : String;
    sNomePatro       : String;
    sNomePlanoPrev   : String;
    sGrau            : String;
    sSintAnal        : String;
    iPer1 :Integer;
    iPer2, iPer3, iPer4, iPer5, iPer6, iPer7, iPer8, iPer9, iPer10, iPer11, iPer12 : Integer;
    asPlano: array [0..11] of Integer; //Bruno Bastos - Sol: 130652 - Kintana: 734352

    procedure FazQuery;
    procedure FazQueryTotalizadora;
    procedure MontaFiltroDescEncResult(psPlaGrau, psExercicio, psIdEmpresa, psPlano,
                                       psPlaConta, psPlaConta1 : String; piPeriodo : Integer;
                                       pbDescContasEst, pbDescEncResult : Boolean);

    function BuscaPlanodata(const piPeriodo  : integer;
                            const piExercicio: integer) : Integer;

  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses UMensErro, uDatabase, DBaseDados, uCtrlParamIntegra, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;


procedure TRptBalanceteColunado.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;

   sExercicio:='';
   sPeriodoInicial:='';
   sPeriodoFinal:='';
   sContaInicial:='';
   sContaFinal:='';
   sCCustoInicial:='';
   sCCustoFinal:='';
   sNomePatro:='';
   sNomePlanoPrev:='';
   sAtividade:='';

   sSintAnal:='';
   sGrau:='';

   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:='SELECT '+
                                                    '    (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ' +
                                                    '   PERNUMERO, '+
                                                    '   PERNOME, '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY '+
                                                    '   PEREXERCICIO, '+
                                                    '   PERNUMERO ';

   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text:='SELECT '+
                                                    '    (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ' +
                                                    '   PERNUMERO, '+
                                                    '   PERNOME, '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY '+
                                                    '   PEREXERCICIO, '+
                                                    '   PERNUMERO ';

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
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
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
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';


   CmpRptCM.ParamValues[9].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);
   CmpRptCM.ParamValues[9].SpinEditSettings.Value    := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);

end;

procedure TRptBalanceteColunado.CmpRptCMAfterExecute(
  ActionExecute: TActionExecute);
var
   iGrau : Integer;
begin
   inherited;
   try
      iGrau:=CmpRptCM.ParamValues[9].AsInteger;
    except
      iGrau:=0;
    end;
   if (iGrau=0) then
      sGrau:=IntToStr(FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano))
   else
      sGrau:=IntToStr(iGrau);
end;

procedure TRptBalanceteColunado.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
   inherited;
   case Index of
      0: sExercicio:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      1: Begin
         sPeriodoInicial:=Trim(TPainelControles(Sender).CtrlLookup.Text);
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter := 'PEREXERCICIO = '+trim(sExercicio);
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
      2: Begin
         sPeriodoFinal:=Trim(TPainelControles(Sender).CtrlLookup.Text);
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter := 'PEREXERCICIO = '+trim(sExercicio);
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
      3: sContaInicial:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      4: sContaFinal:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      5: sCCustoInicial:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      6: sCCustoFinal:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      7: sAtividade:=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;
end;

procedure TRptBalanceteColunado.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   FazQuery;

   if CmpRptCM.ParamValues[17].AsBoolean then
   begin
       BandaSumario.visible := true;
       FazQueryTotalizadora;
   end else
      BandaSumario.visible := false;

end;

procedure TRptBalanceteColunado.FazQuery;
var iCount,iContaReg : integer;
   sPatroSel  : String;
   sPlanoSel  : String;

begin
    pplTitulo.Caption := '';

    sPeriodoInicial:= '';
    sPeriodoFinal  := '';

    sExercicio     := CmpRptCM.ParamValues[0].AsString;
    sContaInicial  := CmpRptCM.ParamValues[3].AsString;
    sContaFinal    := CmpRptCM.ParamValues[4].AsString;
    sCCustoInicial := CmpRptCM.ParamValues[5].AsString;
    sCCustoFinal   := CmpRptCM.ParamValues[6].AsString;
    sAtividade     := CmpRptCM.ParamValues[7].AsString;

    sNomePlanoPrev := '';
    sNomePatro     := '';

      //*** preeenche titulo com patrocinadoras e planos ***
      If  CmpRptCM.ParamValues[13].AsString <> '' then
      Begin
          with sqlPlanoPrev.SQL do
          begin
            Clear;
            Add('SELECT IDPLANOPREV, NOME              ');
            Add('FROM PLANPREVCONTABIL                 ');
            Add('WHERE IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString)+ ') ');
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

      //*** rotina para pegar as patrocinadoras ***
      If  CmpRptCM.ParamValues[14].AsString <> '' then
      Begin
          with sqlPatro.SQL do
          begin
            Clear;
            Add('SELECT PE.NOME                           ');
            Add('FROM PESSOA PE,PATRO PA                  ');
            Add('WHERE (PA.IDPESSOA = PE.IDPESSOA) AND    ');
//            Add('      (PA.IDPESSOA IN (:IDPESSOA_MARCA)) ');
            Add('      (PA.IDPESSOA IN (' + trim(CmpRptCM.ParamValues[14].AsString)+ ')) ');

          end;

          sqlPatro.Prepare;
//          sqlPatro.ParamByName('IDPESSOA_MARCA').asString  := Trim(CmpRptCM.ParamValues[14].AsString);
          sqlPatro.open;
          sPatroSel  := '';
          iContaReg := 0;
          cdsPatro.First;
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


   //=========================================================
   // Pega nome do mes
   //=========================================================
   sqlTitulos.SQL.Clear;
   sqlTitulos.Sql.Add('SELECT PERNUMERO, PERNOME,PERNOMEOUTLING, PERDATINI, PERDATFIM ');
   sqlTitulos.Sql.Add('FROM PERIODO                                                   ');
   sqlTitulos.Sql.Add('WHERE                                                          ');
   sqlTitulos.Sql.Add('   (IDPESSOA =:IDPESSOA) AND                                   ');
   sqlTitulos.Sql.Add('   (PEREXERCICIO=:PEREXERCICIO) AND                            ');
   sqlTitulos.Sql.Add('   (PERNUMERO=:PERNUMERO)                                      ');
   sqlTitulos.Sql.Add('ORDER BY PERNUMERO                                             ');

   sqlTitulos.Prepare;
   sqlTitulos.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlTitulos.ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := CmpRptCM.ParamValues[1].AsInteger;
   sqlTitulos.Open;
   sPeriodoInicial := cdsTitulos.FieldByName('PERNOME').asString;

   sqlTitulos.SQL.Clear;
   sqlTitulos.Sql.Add('SELECT PERNUMERO, PERNOME,PERNOMEOUTLING, PERDATINI, PERDATFIM ');
   sqlTitulos.Sql.Add('FROM PERIODO                                                   ');
   sqlTitulos.Sql.Add('WHERE                                                          ');
   sqlTitulos.Sql.Add('   (IDPESSOA =:IDPESSOA) AND                                   ');
   sqlTitulos.Sql.Add('   (PEREXERCICIO=:PEREXERCICIO) AND                            ');
   sqlTitulos.Sql.Add('   (PERNUMERO=:PERNUMERO)                                      ');
   sqlTitulos.Sql.Add('ORDER BY PERNUMERO                                             ');

   sqlTitulos.Prepare;
   sqlTitulos.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlTitulos.ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := CmpRptCM.ParamValues[2].AsInteger;
   sqlTitulos.Open;

   sPeriodoFinal := cdsTitulos.FieldByName('PERNOME').asString;

   //=====================================================================


    //=========================================================================
    sqlEmpresaProp.Prepare;
    sqlEmpresaProp.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
    sqlEmpresaProp.Open;
    //=========================================================================
    If CmpRptCM.ParamValues[18].AsString = '' then
    Begin
      With sqlTitulos do
      Begin
        Sql.Clear;
        Sql.Add('SELECT  PERNUMERO FROM  PERIODO ');
        Sql.Add('WHERE (IDPESSOA = '  + FloatToStr(CrmRptCM.IdEmpresa) + ' ) AND ');
        Sql.Add('      (PEREXERCICIO = ' + CmpRptCM.ParamValues[0].AsString + ' ) AND ');
        Sql.Add('      (PERNUMERO BETWEEN ' + CmpRptCM.ParamValues[1].AsString + ' AND ' + CmpRptCM.ParamValues[2].AsString + ') AND ');
        Sql.Add('      ((PERBLOQUE IS NULL) OR (PERBLOQUE = ''N'')) ');

        Open;
        if cdsTitulos.isEmpty then
        begin
            if (CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString) then
               pplTitulo.Caption := 'Balancete Colunado - ' + sPeriodoInicial + '/' + sExercicio
            else
               pplTitulo.Caption := 'Balancete - ' + sPeriodoInicial + '/' + sExercicio + ' a ' +
                                                     sPeriodoFinal   + '/' + sExercicio;
        end else
        begin
            if (CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString) then
               pplTitulo.Caption := 'Balancete Colunado Provisório - ' + sPeriodoInicial + '/' + sExercicio
            else
               pplTitulo.Caption := 'Balancete Provisório - ' + sPeriodoInicial + '/' + sExercicio + ' a ' +
                                                               sPeriodoFinal   + '/' + sExercicio;
        end;
      End;

      lblFiltro1.Caption:='';

      if (sContaInicial<>'') then
         lblFiltro1.Caption := lblFiltro1.Caption +  '     Conta Inicial : ' + sContaInicial;

      if (sContaFinal<>'') then
         lblFiltro1.Caption := lblFiltro1.Caption +  '     Conta Final : ' + sContaFinal;

      if (sCCustoInicial<>'') then
         lblFiltro1.Caption := lblFiltro1.Caption +  '     Centro de Custo Inicial : ' + sCCustoInicial;

      if (sCCustoFinal<>'') then
         lblFiltro1.Caption := lblFiltro1.Caption +  '     Centro de Custo Final : ' + sCCustoFinal;

      if (sAtividade<>'') then
         lblFiltro1.Caption := lblFiltro1.Caption +  '     Atividade/Projeto : ' +CmpRptCM.ParamValues[7].AsString+' - '+ sAtividade;

    End Else
    Begin
      pplTitulo.caption  := CmpRptCM.ParamValues[18].AsString;
      lblFiltro1.caption := CmpRptCM.ParamValues[19].AsString;
    End;

    With sqlAux.Sql Do
    Begin
      Clear;
      if CmpRptCM.ParamValues[8].AsBoolean then
         Add('SELECT PERNUMERO, PERNOMEOUTLING AS PERNOME FROM PERIODO ')
      else
         Add('SELECT PERNUMERO, PERNOME FROM PERIODO ');

      Add('WHERE (PEREXERCICIO = '+CmpRptCM.ParamValues[0].AsString+')');
      Add('  AND (PERNUMERO >=   '+CmpRptCM.ParamValues[1].AsString+')');
      Add('  AND (PERNUMERO <=   '+CmpRptCM.ParamValues[2].AsString+')');
      Add('  AND (IDPESSOA  =    '+FloatToStr(CrmRptCM.IdEmpresa)  +')');

      If CdsAux.Active Then
         CdsAux.Close;

      sqlAux.Open;
    End;

    //--------------------------------------------------------------------------
    // Inicializa as variaveis da pagina total
    //--------------------------------------------------------------------------
    pplPer1T.Caption := '';
    pplPer2T.Caption := '';;
    pplPer3T.Caption := '';
    pplPer4T.Caption := '';
    pplPer5T.Caption := '';
    pplPer6T.Caption := '';
    pplPer7T.Caption := '';
    pplPer8T.Caption := '';
    pplPer9T.Caption := '';
    pplPer10T.Caption := '';
    pplPer11T.Caption := '';
    pplPer12T.Caption := '';

    pplTotal.Visible := False;
    pplPer1T.Visible := False;
    pplPer2T.Visible := False;
    pplPer3T.Visible := False;
    pplPer4T.Visible := False;
    pplPer5T.Visible := False;
    pplPer6T.Visible := False;
    pplPer7T.Visible := False;
    pplPer8T.Visible := False;
    pplPer9T.Visible := False;
    pplPer10T.Visible := False;
    pplPer11T.Visible := False;
    pplPer12T.Visible := False;

    dbpplPer1.Visible := False;
    dbpplPer2.Visible := False;
    dbpplPer3.Visible := False;
    dbpplPer4.Visible := False;
    dbpplPer5.Visible := False;
    dbpplPer6.Visible := False;
    dbpplPer7.Visible := False;
    dbpplPer8.Visible := False;
    dbpplPer9.Visible := False;
    dbpplPer10.Visible := False;
    dbpplPer11.Visible := False;
    dbpplPer12.Visible := False;


    memCol1.Visible := False;
    memCol2.Visible := False;
    memCol3.Visible := False;
    memCol4.Visible := False;
    memCol5.Visible := False;
    memCol6.Visible := False;
    memCol7.Visible := False;
    memCol8.Visible := False;
    memCol9.Visible := False;
    memCol10.Visible := False;
    memCol11.Visible := False;
    memCol12.Visible := False;
    memColTot.Visible := False;
    //--------------------------------------------------------------------------
    iPer1  := 0;
    iPer2  := 0;
    iPer3  := 0;
    iPer4  := 0;
    iPer5  := 0;
    iPer6  := 0;
    iPer7  := 0;
    iPer8  := 0;
    iPer9  := 0;
    iPer10 := 0;
    iPer11 := 0;
    iPer12 := 0;
    iCount := 0;
    //
    pplPer1.Caption  := '';
    pplPer2.Caption  := '';
    pplPer3.Caption  := '';
    pplPer4.Caption  := '';
    pplPer5.Caption  := '';
    pplPer6.Caption  := '';
    pplPer7.Caption  := '';
    pplPer8.Caption  := '';
    pplPer9.Caption  := '';
    pplPer10.Caption := '';
    pplPer11.Caption := '';
    pplPer12.Caption := '';

    CdsAux.First;
    While not CdsAux.Eof do
    Begin
       iCount := iCount + 1;
       if iCount > 12 then
          Break;
       if iCount = 1 then
       begin
          iPer1 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer1.Caption  := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1]:= BuscaPlanoData(iPer1, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer1T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer1T.Visible := True;
          memCol1.Visible  := True;

           memColTot.Visible := True;
           pplTotal.Visible  := True;

       end;
       if iCount = 2 then
       begin
          iPer2 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer2.Caption := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1]:= BuscaPlanoData(iPer2, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer2T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer2T.Visible := True;
          memCol2.Visible  := True;
       end;

       if iCount = 3 then
       begin
          iPer3 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer3.Caption := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1]:= BuscaPlanoData(iPer3, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer3T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer3T.Visible := True;
          memCol3.Visible  := True;
       end;

       if iCount = 4 then
       begin
          iPer4 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer4.Caption  := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1]:= BuscaPlanoData(iPer4, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer4T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer4T.Visible := True;
          memCol4.Visible  := True;
       end;

       if iCount = 5 then
       begin
          iPer5 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer5.Caption  := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1]:= BuscaPlanoData(iPer5, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer5T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer5T.Visible := True;
          memCol5.Visible  := True;

       end;

       if iCount = 6 then
       begin
          iPer6 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer6.Caption := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1]:= BuscaPlanoData(iPer6, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer6T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer6T.Visible := True;
          memCol6.Visible  := True;
       end;

       if iCount = 7 then
       begin
          iPer7 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer7.Caption := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1]:= BuscaPlanoData(iPer7, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer7T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer7T.Visible := True;
          memCol7.Visible  := True;
       end;

       if iCount = 8 then
       begin
          iPer8 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer8.Caption := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1]:= BuscaPlanoData(iPer8, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer8T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer8T.Visible := True;
          memCol8.Visible  := True;
       end;

       if iCount = 9 then
       begin
          iPer9 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer9.Caption  := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1]:= BuscaPlanoData(iPer9, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer9T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer9T.Visible := True;
          memCol9.Visible  := True;
       end;

       if iCount = 10 then
       begin
          iPer10 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer10.Caption  := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1] := BuscaPlanoData(iPer10, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer10T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer10T.Visible := True;
          memCol10.Visible  := True;
       end;

       if iCount = 11 then
       begin
          iPer11 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer11.Caption  := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1] := BuscaPlanoData(iPer11, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer11T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer11T.Visible := True;
          memCol11.Visible  := True;
       end;

       if iCount = 12 then
       begin
          iPer12 := CdsAux.FieldByName('PERNUMERO').AsInteger;
          pplPer12.Caption  := CdsAux.FieldByName('PERNOME').AsString;

          //Bruno Bastos - Sol: 130652 - Kintana: 734352
          asPlano[iCount-1] := BuscaPlanoData(iPer12, StrToInt(CmpRptCM.ParamValues[0].AsString));

          pplPer12T.Caption := CdsAux.FieldByName('PERNOME').AsString;
          pplPer12T.Visible := True;
          memCol12.Visible  := True;
       end;
       CdsAux.Next;
    End;



    if not CmpRptCM.ParamValues[10].AsBoolean then
    begin
       dbpplPerTot.Visible := false;
       pplabel75.Visible   := false;
       memcoltot.Visible   := false;
       ppltotal.Visible    := false;
    end else
    begin
       dbpplPerTot.Visible := true;
       pplabel75.Visible   := true;
       memcoltot.Visible   := true;
       ppltotal.Visible    := true;
    end;

    if CmpRptCM.ParamValues[15].AsBoolean then
    begin
      dbpplPerTot.DisplayFormat := '#,0.00;(#,0.00)';
      dbpplPer1.DisplayFormat   := '#,0.00;(#,0.00)';
      dbpplPer2.DisplayFormat   := '#,0.00;(#,0.00)';
      dbpplPer3.DisplayFormat   := '#,0.00;(#,0.00)';
      dbpplPer4.DisplayFormat   := '#,0.00;(#,0.00)';
      dbpplPer5.DisplayFormat   := '#,0.00;(#,0.00)';
      dbpplPer6.DisplayFormat   := '#,0.00;(#,0.00)';
      dbpplPer7.DisplayFormat   := '#,0.00;(#,0.00)';
      dbpplPer8.DisplayFormat   := '#,0.00;(#,0.00)';
      dbpplPer9.DisplayFormat   := '#,0.00;(#,0.00)';
      dbpplPer10.DisplayFormat  := '#,0.00;(#,0.00)';
      dbpplPer11.DisplayFormat  := '#,0.00;(#,0.00)';
      dbpplPer12.DisplayFormat  := '#,0.00;(#,0.00)';
    end else
    begin
      dbpplPerTot.DisplayFormat := '#,0;(#,0)';
      dbpplPer1.DisplayFormat   := '#,0;(#,0)';
      dbpplPer2.DisplayFormat   := '#,0;(#,0)';
      dbpplPer3.DisplayFormat   := '#,0;(#,0)';
      dbpplPer4.DisplayFormat   := '#,0;(#,0)';
      dbpplPer5.DisplayFormat   := '#,0;(#,0)';
      dbpplPer6.DisplayFormat   := '#,0;(#,0)';
      dbpplPer7.DisplayFormat   := '#,0;(#,0)';
      dbpplPer8.DisplayFormat   := '#,0;(#,0)';
      dbpplPer9.DisplayFormat   := '#,0;(#,0)';
      dbpplPer10.DisplayFormat  := '#,0;(#,0)';
      dbpplPer11.DisplayFormat  := '#,0;(#,0)';
      dbpplPer12.DisplayFormat  := '#,0;(#,0)';
    end;

    lblFiltro2.Caption:='';

    if sPatroSel <>'' then
      lblFiltro2.Caption:=lblFiltro2.Caption+'Patrocinadoras: '+sPatroSel;

    if sPlanoSel <>'' then
       lblFiltro2.Caption:=lblFiltro2.Caption +'   Planos: '+sPlanoSel;


    With  sqlBalancete.Sql do
    Begin
      Clear;
      Add('SELECT /*+RULE*/                                    ');
      Add('       UU.PLACONTA, UU.PLANOME, UU.PLANOMEOUTLING,UU.PLAGRUPO,    ');
      Add('       UU.NOMEINDENTADO,                              ');
      Add('       UU.PER1,  ');
      Add('       UU.PER2,  ');
      Add('       UU.PER3,  ');
      Add('       UU.PER4,  ');
      Add('       UU.PER5,  ');
      Add('       UU.PER6,  ');
      Add('       UU.PER7,  ');
      Add('       UU.PER8,  ');
      Add('       UU.PER9,  ');
      Add('       UU.PER10, ');
      Add('       UU.PER11, ');
      Add('       UU.PER12, ');
      Add('       (NVL(UU.PER1,0) + NVL(UU.PER2,0) + NVL(UU.PER3,0) + NVL(UU.PER4,0)  + NVL(UU.PER5,0)  + NVL(UU.PER6,0) +             ');
      Add('        NVL(UU.PER7,0) + NVL(UU.PER8,0) + NVL(UU.PER9,0) + NVL(UU.PER10,0) + NVL(UU.PER11,0) + NVL(UU.PER12,0)) AS TOTPER ');
      Add('FROM (                                                 ');
      Add('SELECT U.PLACONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,C.PLAGRUPO,    ');

      if CmpRptCM.ParamValues[16].AsBoolean then begin
        if CmpRptCM.ParamValues[8].AsBoolean then begin
           if CmpRptCM.ParamValues[11].AsBoolean then
              Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || U.PLACONTA||'' ''||C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')

             // Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')
           else
              Add('   U.PLACONTA||'' ''||C.PLANOMEOUTLING AS NOMEINDENTADO, ');

             // Add('   C.PLANOMEOUTLING AS NOMEINDENTADO, ');
        end else begin
            if CmpRptCM.ParamValues[11].AsBoolean then
               Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || U.PLACONTA||'' ''||DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')

              //Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
           else
              Add('   U.PLACONTA||'' ''||DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO, ');

             //Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO, ');
        end;
      end else
      begin
        if CmpRptCM.ParamValues[8].AsBoolean then begin
          if CmpRptCM.ParamValues[11].AsBoolean then
                Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')
             else
                Add('   C.PLANOMEOUTLING AS NOMEINDENTADO, ');
        end else begin
           if CmpRptCM.ParamValues[11].AsBoolean then
              Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
           else
              Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO, ');
        end;
      end;

// inicio - André Tavares - pendência 14842
{

      Add('       DECODE(SIGN(SUM(U.PER1)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER1),SUM(U.PER1)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER1),SUM(U.PER1)*-1)) AS PER1,  ');
      Add('       DECODE(SIGN(SUM(U.PER2)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER2),SUM(U.PER2)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER2),SUM(U.PER2)*-1)) AS PER2,  ');
      Add('       DECODE(SIGN(SUM(U.PER3)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER3),SUM(U.PER3)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER3),SUM(U.PER3)*-1)) AS PER3,  ');
      Add('       DECODE(SIGN(SUM(U.PER4)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER4),SUM(U.PER4)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER4),SUM(U.PER4)*-1)) AS PER4,  ');
      Add('       DECODE(SIGN(SUM(U.PER5)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER5),SUM(U.PER5)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER5),SUM(U.PER5)*-1)) AS PER5,  ');
      Add('       DECODE(SIGN(SUM(U.PER6)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER6),SUM(U.PER6)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER6),SUM(U.PER6)*-1)) AS PER6,  ');
      Add('       DECODE(SIGN(SUM(U.PER7)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER7),SUM(U.PER7)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER7),SUM(U.PER7)*-1)) AS PER7,  ');
      Add('       DECODE(SIGN(SUM(U.PER8)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER8),SUM(U.PER8)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER8),SUM(U.PER8)*-1)) AS PER8,  ');
      Add('       DECODE(SIGN(SUM(U.PER9)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER9),SUM(U.PER9)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER9),SUM(U.PER9)*-1)) AS PER9,  ');
      Add('       DECODE(SIGN(SUM(U.PER10)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER10),SUM(U.PER10)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER10),SUM(U.PER10)*-1)) AS PER10,  ');
      Add('       DECODE(SIGN(SUM(U.PER11)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER11),SUM(U.PER11)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER11),SUM(U.PER11)*-1)) AS PER11,  ');
      Add('       DECODE(SIGN(SUM(U.PER12)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER12),SUM(U.PER12)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER12),SUM(U.PER12)*-1)) AS PER12   ');

      }
      // 20/10/2003 - by Alex - correção pendência 14842
      { Caso PLAGRUPO
          'A'tivo   ou 'D'espesa ==> saldo Devedor (+) ==> saldo Credor (-)
          'P'assivo ou 'R'eceita ==> saldo Devedor (-) ==> saldo Credor (+)
        SENÃO
          'C'usto ou 'O'utros ou 'E'statistica ==> saldo Devedor (+) ==> saldo Credor (-)

       *** implementado desta maneira para otimização
       Caso PLAGRUPO
          'P'assivo ou 'R'eceita ==> saldo Devedor (-) ==> saldo Credor (+)
        SENÃO
          saldo Devedor (+) ==> saldo Credor (-)

      CASE APENAS NO ORACLE 9
      SELECT DISTINCT PLAGRUPO,
         CASE WHEN (PLAGRUPO = 'P' OR PLAGRUPO = 'R' ) THEN 'Credora'
              ELSE 'Outra' END AS TIPO
      FROM PLANOCONTA
      }

{
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER1)*-1, ');
      Add('              ''R'', SUM(U.PER1)*-1, ');
      Add('                     SUM(U.PER1)) AS PER1, ');
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER2)*-1, ');
      Add('              ''R'', SUM(U.PER2)*-1, ');
      Add('                     SUM(U.PER2)) AS PER2, ');
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER3)*-1, ');
      Add('              ''R'', SUM(U.PER3)*-1, ');
      Add('                     SUM(U.PER3)) AS PER3, ');
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER4)*-1, ');
      Add('              ''R'', SUM(U.PER4)*-1, ');
      Add('                     SUM(U.PER4)) AS PER4, ');
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER5)*-1, ');
      Add('              ''R'', SUM(U.PER5)*-1, ');
      Add('                     SUM(U.PER5)) AS PER5, ');
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER6)*-1, ');
      Add('              ''R'', SUM(U.PER6)*-1, ');
      Add('                     SUM(U.PER6)) AS PER6, ');
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER7)*-1, ');
      Add('              ''R'', SUM(U.PER7)*-1, ');
      Add('                     SUM(U.PER7)) AS PER7, ');
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER8)*-1, ');
      Add('              ''R'', SUM(U.PER8)*-1, ');
      Add('                     SUM(U.PER8)) AS PER8, ');
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER9)*-1, ');
      Add('              ''R'', SUM(U.PER9)*-1, ');
      Add('                     SUM(U.PER9)) AS PER9, ');
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER10)*-1, ');
      Add('              ''R'', SUM(U.PER10)*-1, ');
      Add('                     SUM(U.PER10)) AS PER10, ');
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER11)*-1, ');
      Add('              ''R'', SUM(U.PER11)*-1, ');
      Add('                     SUM(U.PER11)) AS PER11, ');
      Add('       DECODE(C.PLAGRUPO, ');
      Add('              ''P'', SUM(U.PER12)*-1, ');
      Add('              ''R'', SUM(U.PER12)*-1, ');
      Add('                     SUM(U.PER12)) AS PER12 '); }

      Add('       SUM(U.PER1) AS PER1, ');
      Add('       SUM(U.PER2) AS PER2, ');
      Add('       SUM(U.PER3) AS PER3, ');
      Add('       SUM(U.PER4) AS PER4, ');
      Add('       SUM(U.PER5) AS PER5, ');
      Add('       SUM(U.PER6) AS PER6, ');
      Add('       SUM(U.PER7) AS PER7, ');
      Add('       SUM(U.PER8) AS PER8, ');
      Add('       SUM(U.PER9) AS PER9, ');
      Add('       SUM(U.PER10) AS PER10, ');
      Add('       SUM(U.PER11) AS PER11, ');
      Add('       SUM(U.PER12) AS PER12  ');

      { Fim 20/10/2003 - by Alex - correção pendência 14842

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER1)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER1),SUM(U.PER1)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER1),SUM(U.PER1)*-1)), '+
      ' 1, DECODE(SIGN(SUM(U.PER1)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER1),abs(SUM(U.PER1))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER1),abs(SUM(U.PER1))*-1))) AS PER1,  ');

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER2)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER2),SUM(U.PER2)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER2),SUM(U.PER2)*-1)),  '+
       '1, DECODE(SIGN(SUM(U.PER2)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER2),abs(SUM(U.PER2))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER2),abs(SUM(U.PER2))*-1))) AS PER2,  ');

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER3)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER3),SUM(U.PER3)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER3),SUM(U.PER3)*-1)),  '+
       '1, DECODE(SIGN(SUM(U.PER3)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER3),abs(SUM(U.PER3))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER3),abs(SUM(U.PER3))*-1))) AS PER3,  ');

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER4)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER4),SUM(U.PER4)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER4),SUM(U.PER4)*-1)),  '+
       '1, DECODE(SIGN(SUM(U.PER4)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER4),abs(SUM(U.PER4))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER4),abs(SUM(U.PER4))*-1))) AS PER4,  ');

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER5)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER5),SUM(U.PER5)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER5),SUM(U.PER5)*-1)),  '+
       '1, DECODE(SIGN(SUM(U.PER5)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER5),abs(SUM(U.PER5))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER5),abs(SUM(U.PER5))*-1))) AS PER5,  ');

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER6)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER6),SUM(U.PER6)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER6),SUM(U.PER6)*-1)),   '+
       '1, DECODE(SIGN(SUM(U.PER6)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER6),abs(SUM(U.PER6))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER6),abs(SUM(U.PER6))*-1))) AS PER6,  ');

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER7)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER7),SUM(U.PER7)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER7),SUM(U.PER7)*-1)),   '+
       '1, DECODE(SIGN(SUM(U.PER7)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER7),abs(SUM(U.PER7))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER7),abs(SUM(U.PER7))*-1))) AS PER7,  ');

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER8)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER8),SUM(U.PER8)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER8),SUM(U.PER8)*-1)),   '+
       '1, DECODE(SIGN(SUM(U.PER8)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER8),abs(SUM(U.PER8))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER8),abs(SUM(U.PER8))*-1))) AS PER8,  ');

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER9)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER9),SUM(U.PER9)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER9),SUM(U.PER9)*-1)),   '+
       '1, DECODE(SIGN(SUM(U.PER9)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER9),abs(SUM(U.PER9))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER9),abs(SUM(U.PER9))*-1))) AS PER9,  ');

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER10)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER10),SUM(U.PER10)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER10),SUM(U.PER10)*-1)),   '+
       '1, DECODE(SIGN(SUM(U.PER10)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER10),abs(SUM(U.PER10))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER10),abs(SUM(U.PER10))*-1))) AS PER10,  ');

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER11)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER11),SUM(U.PER11)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER11),SUM(U.PER11)*-1)),   '+
       '1, DECODE(SIGN(SUM(U.PER11)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER11),abs(SUM(U.PER11))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER11),abs(SUM(U.PER11))*-1))) AS PER11,  ');

      Add(' decode(nvl(c.flgContaRetif, 0), 0, DECODE(SIGN(SUM(U.PER12)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER12),SUM(U.PER12)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER12),SUM(U.PER12)*-1)),   '+
       '1, DECODE(SIGN(SUM(U.PER12)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER12),abs(SUM(U.PER12))*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER12),abs(SUM(U.PER12))*-1))) AS PER12   ');

// fim - André Tavares - pendência 14842
      }



      Add('FROM                                                  ');
      Add('(                                                     ');

      //Bruno Bastos - Pend. 17454 - 21/09/2004 - Início
      CmpRptCM.ParamValues[12].AsBoolean := (CmpRptCM.ParamValues[12].AsString = 'True');
      CmpRptCM.ParamValues[20].AsBoolean := (CmpRptCM.ParamValues[20].AsString = 'True');
      //Bruno Bastos - Pend. 17454 - 21/09/2004 - Fim

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        // Add(' N.MOV AS PER1, ');
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add('       SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER1, ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add('       SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER1, ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      Add('       (0) AS PER2,                                   ');
      Add('       (0) AS PER3,                                   ');
      Add('       (0) AS PER4,                                   ');
      Add('       (0) AS PER5,                                   ');
      Add('       (0) AS PER6,                                   ');
      Add('       (0) AS PER7,                                   ');
      Add('       (0) AS PER8,                                   ');
      Add('       (0) AS PER9,                                   ');
      Add('       (0) AS PER10,                                  ');
      Add('       (0) AS PER11,                                  ');
      Add('       (0) AS PER12                                   ');
      Add(' FROM PLANOSALDO P                                    ');

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer1, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO = ' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer1 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer1)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer1)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[0]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add('  UNION ALL ');

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add(' N.MOV AS PER2, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer2, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer2 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer2)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer2)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[1]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add('  UNION ALL ');

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add(' N.MOV AS PER3, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer3, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer3 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer3)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer3)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[2]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add('  UNION ALL ');

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add(' N.MOV AS PER4, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer4, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer4 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer4)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer4)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[3]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add('  UNION ALL ');

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add(' N.MOV AS PER5, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer5, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer5 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer5)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer5)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[4]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add('  UNION ALL ');

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add(' N.MOV AS PER6, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer6, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer6 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer6)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer6)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[5]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add('  UNION ALL ');

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add(' N.MOV AS PER7, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer7, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer7 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer7)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer7)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[6]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add('  UNION ALL ');

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add(' N.MOV AS PER8, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer8, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer8 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer8)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer8)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[7]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add('  UNION ALL ');

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add(' N.MOV AS PER9, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER9, ');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer9, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer9 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer9)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer9)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[8]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add('  UNION ALL ');

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9,');
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add(' N.MOV AS PER10, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER10, ');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9,');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER10, ');
        Add(' (0) AS PER11,');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer10, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer10 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer10)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer10)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[9]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add('  UNION ALL ');

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10, ');
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add(' N.MOV AS PER11, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER11, ');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9,');
        Add(' (0) AS PER10,');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER11, ');
        Add(' (0) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer11, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer11 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer11)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer11)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[10]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add('  UNION ALL ');

      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
      If CmpRptCM.ParamValues[20].AsBoolean Then
      Begin
        Add('SELECT DISTINCT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9, ');
        Add(' (0) AS PER10, ');
        Add(' (0) AS PER11, ');
        // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
        // Add(' N.MOV AS PER12 ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR-Nvl(P.plsdebitoencerr,0)+Nvl(P.plscreditoencerr,0)) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End
      Else
      Begin
        Add('SELECT P.PLACONTA, P.PLANO, ');
        Add(' (0) AS PER1, ');
        Add(' (0) AS PER2, ');
        Add(' (0) AS PER3, ');
        Add(' (0) AS PER4, ');
        Add(' (0) AS PER5, ');
        Add(' (0) AS PER6, ');
        Add(' (0) AS PER7, ');
        Add(' (0) AS PER8, ');
        Add(' (0) AS PER9,');
        Add(' (0) AS PER10,');
        Add(' (0) AS PER11, ');
        Add(' SUM(P.PLSDEBITOCORRENTE-P.PLSCREDITOCOR) AS PER12 ');
        Add('  FROM PLANOSALDO P ');
      End;
      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
//      //Bruno Bastos - Pend. 17454 - 20/09/2004
//      MontaFiltroDescEncResult(sGrau, CmpRptCM.ParamValues[0].AsString,
//                               FloatToStr(CrmRptCM.IdEmpresa),
//                               IntToStr(ParamIntegra.Plano),
//                               RFillString(GetFirstNotEmpty('0',
//                               [CmpRptCM.ParamValues[3].AsString]), ' ', 18),
//                               RFillString(GetFirstNotEmpty('999999999999999999',
//                               [CmpRptCM.ParamValues[4].AsString]), ' ', 18),
//                               iPer12, CmpRptCM.ParamValues[12].AsBoolean,
//                               CmpRptCM.ParamValues[20].AsBoolean);

      Add('WHERE  (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      if iPer12 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (P.PERNUMERO = ' + IntToStr(iPer12)+') AND ');
         end else begin
            Add('       ((P.PERNUMERO <= ' + IntToStr(iPer12)+') OR (P.PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((P.UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (P.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (P.IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (P.IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');

      //Bruno Bastos - Sol: 130652 - Kintana: 734352 - Add('          (P.PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (P.PLANO =' + IntToStr(asPlano[11]) + ') AND   '); //Bruno Bastos - Sol: 130652 - Kintana: 734352

      Add('          (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');

//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Início
//      If CmpRptCM.ParamValues[20].AsBoolean Then
//        Add('      AND (P.PLACONTA    = N.PLACONTA)')
//      Else
//        Add('  GROUP BY P.PLACONTA, P.PLANO ');
//      //Bruno Bastos - Pend. 17454 - 20/09/2004 - Fim

      // Arnaldo V. Scarin - Pendencia 27800 - 19/06/2008
      Add('  GROUP BY P.PLACONTA, P.PLANO ');

      Add(') U,                                                  ');
      Add('PLANOCONTA C,                                         ');

      Add(CtrlRptBalancete.SelecionaPlanoContaPer(CmpRptCM.ParamValues[1].AsInteger,CmpRptCM.ParamValues[0].AsFloat,CrmRptCM.IdEmpresa)+' PD ');

      Add('WHERE (U.PLACONTA = C.PLACONTA)                       ');
      Add('  AND (U.PLANO = C.PLANO)                             ');
      Add('  AND (PD.PLACONTA(+) = C.PLACONTA)                   ');
      Add('  AND (PD.PLANO(+) = C.PLANO)                         ');
      Add('  AND (C.PLAGRAU <= ' + sGrau + ')                    ');
      if CmpRptCM.ParamValues[12].AsBoolean then
         Add(' AND (C.PLAGRUPO <> ''E'')                         ');
      Add('GROUP BY U.PLACONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLAGRAU,            ');
      Add('         C.PLANOMEOUTLING, C.PLAGRUPO, C.PLANATUREZA) UU ');

// inicio - André Tavares - pendência 14842
// 20/10 Alex correção pendência 14842      ' c.flgcontaretif ) UU        ');
// fim - André Tavares - pendência 14842
      Add('ORDER BY UU.PLACONTA                                  ');
      //Henrique Massão
      //sqlBalancete.Sql.SaveToFile('C:\Balancete Colunado.txt');
      sqlBalancete.Sql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\BalanceteColunado.txt ');
      sqlBalancete.Open;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER1').AsFloat <> 0 then
      if iPer1 <> 0 then
          dbpplPer1.Visible := True;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER2').AsFloat <> 0 then
      if iPer2 <> 0 then
          dbpplPer2.Visible := True;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER3').AsFloat <> 0 then
      if iPer3 <> 0 then
          dbpplPer3.Visible := True;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER4').AsFloat <> 0 then
      if iPer4 <> 0 then
          dbpplPer4.Visible := True;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER5').AsFloat <> 0 then
      if iPer5 <> 0 then
          dbpplPer5.Visible := True;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER6').AsFloat <> 0 then
      if iPer6 <> 0 then
          dbpplPer6.Visible := True;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER7').AsFloat <> 0 then
      if iPer7 <> 0 then
          dbpplPer7.Visible := True;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER8').AsFloat <> 0 then
      if iPer8 <> 0 then
          dbpplPer8.Visible := True;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER9').AsFloat <> 0 then
      if iPer9 <> 0 then
          dbpplPer9.Visible := True;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER10').AsFloat <> 0 then
      if iPer10 <> 0 then
          dbpplPer10.Visible := True;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER11').AsFloat <> 0 then
      if iPer11 <> 0 then
          dbpplPer11.Visible := True;

      //Bruno Bastos - 04/10/2004 - if cdsbalancete.FieldByName('PER12').AsFloat <> 0 then
      if iPer12 <> 0 then
          dbpplPer12.Visible := True;

    End;
//    CMDebugToFile (sqlBalancete.SQLChanged, 'c:\BalanceteColunado.txt');
end;


procedure TRptBalanceteColunado.CmpRptCMParamControlEnter(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      1: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter := 'PEREXERCICIO = '+trim(sExercicio);
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
      2: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter := 'PEREXERCICIO = '+trim(sExercicio);
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
   end;
end;

procedure TRptBalanceteColunado.FazQueryTotalizadora;
var
  sGrupo, sGrupoDesc: string;

  A_rPer1,A_rPer2,A_rPer3,A_rPer4,A_rPer5,A_rPer6    :Double;
  A_rPer7,A_rPer8,A_rPer9,A_rPer10,A_rPer11,A_rPer12 :Double;

  D_rPer1,D_rPer2,D_rPer3,D_rPer4,D_rPer5,D_rPer6    :Double;
  D_rPer7,D_rPer8,D_rPer9,D_rPer10,D_rPer11,D_rPer12 :Double;

  R_rPer1,R_rPer2,R_rPer3,R_rPer4,R_rPer5,R_rPer6    :Double;
  R_rPer7,R_rPer8,R_rPer9,R_rPer10,R_rPer11,R_rPer12 :Double;

  P_rPer1,P_rPer2,P_rPer3,P_rPer4,P_rPer5,P_rPer6    :Double;
  P_rPer7,P_rPer8,P_rPer9,P_rPer10,P_rPer11,P_rPer12 :Double;

  C_rPer1,C_rPer2,C_rPer3,C_rPer4, C_rPer5, C_rPer6  :Double;
  C_rPer7,C_rPer8,C_rPer9,C_rPer10,C_rPer11,C_rPer12 :Double;

  O_rPer1,O_rPer2,O_rPer3,O_rPer4, O_rPer5, O_rPer6  :Double;
  O_rPer7,O_rPer8,O_rPer9,O_rPer10,O_rPer11,O_rPer12 :Double;

  E_rPer1,E_rPer2,E_rPer3,E_rPer4, E_rPer5, E_rPer6  :Double;
  E_rPer7,E_rPer8,E_rPer9,E_rPer10,E_rPer11,E_rPer12 :Double;

  rResultado1,rResultado2,rResultado3,rResultado4,rResultado5,rResultado6 :Double;
  rResultado7,rResultado8,rResultado9,rResultado10,rResultado11,rResultado12 :Double;

  A_Total,P_Total, E_Total,R_Total,D_Total,O_Total,C_Total,T_Total :Double;
  sTipo :string;
  TemAtivo,TemPassivo,TemReceita,TemDespesa, TemCusto,TemEstatistica, TemOutras :Boolean;
begin

    With  sqlTot.Sql do
    Begin
      Clear;
      Add('SELECT /*+ RULE */                                              ');
      Add('       UU.PLACONTA,  UU.PLAGRUPO,UU.PLANOME, UU.PLANOMEOUTLING, ');
      Add('       UU.NOMEINDENTADO,UU.PLATIPO,                             ');
      Add('       UU.PER1,  ');
      Add('       UU.PER2,  ');
      Add('       UU.PER3,  ');
      Add('       UU.PER4,  ');
      Add('       UU.PER5,  ');
      Add('       UU.PER6,  ');
      Add('       UU.PER7,  ');
      Add('       UU.PER8,  ');
      Add('       UU.PER9,  ');
      Add('       UU.PER10, ');
      Add('       UU.PER11, ');
      Add('       UU.PER12, ');
      Add('       (NVL(UU.PER1,0) + NVL(UU.PER2,0) + NVL(UU.PER3,0) + NVL(UU.PER4,0)  + NVL(UU.PER5,0)  + NVL(UU.PER6,0) +             ');
      Add('        NVL(UU.PER7,0) + NVL(UU.PER8,0) + NVL(UU.PER9,0) + NVL(UU.PER10,0) + NVL(UU.PER11,0) + NVL(UU.PER12,0)) AS TOTPER ');
      Add('FROM (                                                 ');
      Add('SELECT U.PLACONTA, C.PLAGRUPO,DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING, C.PLATIPO,        ');

      if CmpRptCM.ParamValues[16].AsBoolean then begin
        if CmpRptCM.ParamValues[8].AsBoolean then begin
            if CmpRptCM.ParamValues[11].AsBoolean then
              Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')
           else
              Add('   C.PLANOMEOUTLING AS NOMEINDENTADO, ');
        end else begin
            if CmpRptCM.ParamValues[11].AsBoolean then
              Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
           else
             Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO, ');
        end;
      end else
      begin
        if CmpRptCM.ParamValues[8].AsBoolean then begin
          if CmpRptCM.ParamValues[11].AsBoolean then
                Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')
             else
                Add('   C.PLANOMEOUTLING AS NOMEINDENTADO, ');
        end else begin
           if CmpRptCM.ParamValues[11].AsBoolean then
              Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
           else
              Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO, ');
        end;
      end;
      Add('       DECODE(SIGN(SUM(U.PER1)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER1),SUM(U.PER1)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER1),SUM(U.PER1)*-1)) AS PER1,  ');
      Add('       DECODE(SIGN(SUM(U.PER2)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER2),SUM(U.PER2)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER2),SUM(U.PER2)*-1)) AS PER2,  ');
      Add('       DECODE(SIGN(SUM(U.PER3)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER3),SUM(U.PER3)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER3),SUM(U.PER3)*-1)) AS PER3,  ');
      Add('       DECODE(SIGN(SUM(U.PER4)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER4),SUM(U.PER4)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER4),SUM(U.PER4)*-1)) AS PER4,  ');
      Add('       DECODE(SIGN(SUM(U.PER5)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER5),SUM(U.PER5)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER5),SUM(U.PER5)*-1)) AS PER5,  ');
      Add('       DECODE(SIGN(SUM(U.PER6)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER6),SUM(U.PER6)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER6),SUM(U.PER6)*-1)) AS PER6,  ');
      Add('       DECODE(SIGN(SUM(U.PER7)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER7),SUM(U.PER7)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER7),SUM(U.PER7)*-1)) AS PER7,  ');
      Add('       DECODE(SIGN(SUM(U.PER8)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER8),SUM(U.PER8)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER8),SUM(U.PER8)*-1)) AS PER8,  ');
      Add('       DECODE(SIGN(SUM(U.PER9)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER9),SUM(U.PER9)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER9),SUM(U.PER9)*-1)) AS PER9,  ');
      Add('       DECODE(SIGN(SUM(U.PER10)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER10),SUM(U.PER10)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER10),SUM(U.PER10)*-1)) AS PER10,  ');
      Add('       DECODE(SIGN(SUM(U.PER11)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER11),SUM(U.PER11)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER11),SUM(U.PER11)*-1)) AS PER11,  ');
      Add('       DECODE(SIGN(SUM(U.PER12)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER12),SUM(U.PER12)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER12),SUM(U.PER12)*-1)) AS PER12   ');
      Add('FROM                                                  ');
      Add('(                                                     ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER1,  ');
      Add('       (0) AS PER2,                                   ');
      Add('       (0) AS PER3,                                   ');
      Add('       (0) AS PER4,                                   ');
      Add('       (0) AS PER5,                                   ');
      Add('       (0) AS PER6,                                   ');
      Add('       (0) AS PER7,                                   ');
      Add('       (0) AS PER8,                                   ');
      Add('       (0) AS PER9,                                   ');
      Add('       (0) AS PER10,                                  ');
      Add('       (0) AS PER11,                                  ');
      Add('       (0) AS PER12                                   ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO = ' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');
      if iPer1 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer1)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer1)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA,PLANO                               ');
      Add('UNION ALL                                             ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       (0) AS PER1,                                   ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER2,  ');
      Add('       (0) AS PER3,                                   ');
      Add('       (0) AS PER4,                                   ');
      Add('       (0) AS PER5,                                   ');
      Add('       (0) AS PER6,                                   ');
      Add('       (0) AS PER7,                                   ');
      Add('       (0) AS PER8,                                   ');
      Add('       (0) AS PER9,                                   ');
      Add('       (0) AS PER10,                                  ');
      Add('       (0) AS PER11,                                  ');
      Add('       (0) AS PER12                                   ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');
      if iPer2 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer2)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer2)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA, PLANO                              ');
      Add('UNION ALL                                             ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       (0) AS PER1,                                   ');
      Add('       (0) AS PER2,                                   ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER3,  ');
      Add('       (0) AS PER4,                                   ');
      Add('       (0) AS PER5,                                   ');
      Add('       (0) AS PER6,                                   ');
      Add('       (0) AS PER7,                                   ');
      Add('       (0) AS PER8,                                   ');
      Add('       (0) AS PER9,                                   ');
      Add('       (0) AS PER10,                                  ');
      Add('       (0) AS PER11,                                  ');
      Add('       (0) AS PER12                                   ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');
      if iPer3 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer3)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer3)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA, PLANO                              ');
      Add('UNION ALL                                             ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       (0) AS PER1,                                   ');
      Add('       (0) AS PER2,                                   ');
      Add('       (0) AS PER3,                                   ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER4,  ');
      Add('       (0) AS PER5,                                   ');
      Add('       (0) AS PER6,                                   ');
      Add('       (0) AS PER7,                                   ');
      Add('       (0) AS PER8,                                   ');
      Add('       (0) AS PER9,                                   ');
      Add('       (0) AS PER10,                                  ');
      Add('       (0) AS PER11,                                  ');
      Add('       (0) AS PER12                                   ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');
      if iPer4 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer4)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer4)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA, PLANO                              ');
      Add('UNION ALL                                             ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       (0) AS PER1,                                   ');
      Add('       (0) AS PER2,                                   ');
      Add('       (0) AS PER3,                                   ');
      Add('       (0) AS PER4,                                   ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER5,  ');
      Add('       (0) AS PER6,                                   ');
      Add('       (0) AS PER7,                                   ');
      Add('       (0) AS PER8,                                   ');
      Add('       (0) AS PER9,                                   ');
      Add('       (0) AS PER10,                                  ');
      Add('       (0) AS PER11,                                  ');
      Add('       (0) AS PER12                                   ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');
      if iPer5 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer5)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer5)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA, PLANO                              ');
      Add('UNION ALL                                             ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       (0) AS PER1,                                   ');
      Add('       (0) AS PER2,                                   ');
      Add('       (0) AS PER3,                                   ');
      Add('       (0) AS PER4,                                   ');
      Add('       (0) AS PER5,                                   ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER6,  ');
      Add('       (0) AS PER7,                                   ');
      Add('       (0) AS PER8,                                   ');
      Add('       (0) AS PER9,                                   ');
      Add('       (0) AS PER10,                                  ');
      Add('       (0) AS PER11,                                  ');
      Add('       (0) AS PER12                                   ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');
      if iPer6 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer6)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer6)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA, PLANO                              ');
      Add('UNION ALL                                             ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       (0) AS PER1,                                   ');
      Add('       (0) AS PER2,                                   ');
      Add('       (0) AS PER3,                                   ');
      Add('       (0) AS PER4,                                   ');
      Add('       (0) AS PER5,                                   ');
      Add('       (0) AS PER6,                                   ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER7,  ');
      Add('       (0) AS PER8,                                   ');
      Add('       (0) AS PER9,                                   ');
      Add('       (0) AS PER10,                                  ');
      Add('       (0) AS PER11,                                  ');
      Add('       (0) AS PER12                                   ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');
      if iPer7 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer7)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer7)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA, PLANO                              ');
      Add('UNION ALL                                             ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       (0) AS PER1,                                   ');
      Add('       (0) AS PER2,                                   ');
      Add('       (0) AS PER3,                                   ');
      Add('       (0) AS PER4,                                   ');
      Add('       (0) AS PER5,                                   ');
      Add('       (0) AS PER6,                                   ');
      Add('       (0) AS PER7,                                   ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER8,  ');
      Add('       (0) AS PER9,                                   ');
      Add('       (0) AS PER10,                                  ');
      Add('       (0) AS PER11,                                  ');
      Add('       (0) AS PER12                                   ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');
      if iPer8 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer8)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer8)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA, PLANO                              ');
      Add('UNION ALL                                             ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       (0) AS PER1,                                   ');
      Add('       (0) AS PER2,                                   ');
      Add('       (0) AS PER3,                                   ');
      Add('       (0) AS PER4,                                   ');
      Add('       (0) AS PER5,                                   ');
      Add('       (0) AS PER6,                                   ');
      Add('       (0) AS PER7,                                   ');
      Add('       (0) AS PER8,                                   ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER9,  ');
      Add('       (0) AS PER10,                                  ');
      Add('       (0) AS PER11,                                  ');
      Add('       (0) AS PER12                                   ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');
      if iPer9 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer9)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer9)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA, PLANO                              ');
      Add('UNION ALL                                             ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       (0) AS PER1,                                   ');
      Add('       (0) AS PER2,                                   ');
      Add('       (0) AS PER3,                                   ');
      Add('       (0) AS PER4,                                   ');
      Add('       (0) AS PER5,                                   ');
      Add('       (0) AS PER6,                                   ');
      Add('       (0) AS PER7,                                   ');
      Add('       (0) AS PER8,                                   ');
      Add('       (0) AS PER9,                                   ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER10, ');
      Add('       (0) AS PER11,                                  ');
      Add('       (0) AS PER12                                   ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');
      if iPer10 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer10)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer10)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA, PLANO                              ');
      Add('UNION ALL                                             ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       (0) AS PER1,                                   ');
      Add('       (0) AS PER2,                                   ');
      Add('       (0) AS PER3,                                   ');
      Add('       (0) AS PER4,                                   ');
      Add('       (0) AS PER5,                                   ');
      Add('       (0) AS PER6,                                   ');
      Add('       (0) AS PER7,                                   ');
      Add('       (0) AS PER8,                                   ');
      Add('       (0) AS PER9,                                   ');
      Add('       (0) AS PER10,                                  ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER11, ');
      Add('       (0) AS PER12                                   ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');
      if iPer11 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer11)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer11)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA, PLANO                              ');
      Add('UNION ALL                                             ');
      Add('SELECT PLACONTA, PLANO,                               ');
      Add('       (0) AS PER1,                                   ');
      Add('       (0) AS PER2,                                   ');
      Add('       (0) AS PER3,                                   ');
      Add('       (0) AS PER4,                                   ');
      Add('       (0) AS PER5,                                   ');
      Add('       (0) AS PER6,                                   ');
      Add('       (0) AS PER7,                                   ');
      Add('       (0) AS PER8,                                   ');
      Add('       (0) AS PER9,                                   ');
      Add('       (0) AS PER10,                                  ');
      Add('       (0) AS PER11,                                  ');
      Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER12  ');
      Add('FROM PLANOSALDO                                       ');
      Add('WHERE  (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      Add('       (PLSTIPO = ''A'') AND         ');

      if iPer12 <> 0 then begin
         if CmpRptCM.ParamValues[10].AsBoolean then begin
            Add('       (PERNUMERO = ' + IntToStr(iPer12)+') AND ');
         end else begin
            Add('       ((PERNUMERO <= ' + IntToStr(iPer12)+') OR (PERNUMERO IS NULL)) AND ');
         end;
      end else begin
         Add('       (1 = 2) AND ');
      end;
      if sAtividade <> '' then begin
         Add('       ((UNIDNEGOC = ' + CmpRptCM.ParamValues[7].AsString + ') AND   ');
         Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(sCCustoInicial) <> '' then begin
         Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(sCCustoFinal) <> '' then begin
         Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].AsString,10)) + ') AND ');
         Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      end;
      if trim(CmpRptCM.ParamValues[13].AsString) <> '' then begin
         Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[13].AsString) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
         Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[14].AsString) + ')) AND ');
      end;
      Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      Add('          (PLANO =' + IntToStr(ParamIntegra.Plano) + ') AND   ');
      Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                          [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ') AND              ');
      Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                          [CmpRptCM.ParamValues[4].AsString]), ' ', 18)) + ')                  ');
      Add('GROUP BY PLACONTA, PLANO                              ');
      Add(') U,                                                  ');
      Add('PLANOCONTA C,                                          ');

      Add(CtrlRptBalancete.SelecionaPlanoContaPer(CmpRptCM.ParamValues[1].AsInteger,CmpRptCM.ParamValues[0].AsFloat,CrmRptCM.IdEmpresa)+' PD ');

      Add('WHERE (U.PLACONTA = C.PLACONTA)                       ');
      Add('  AND (U.PLANO = C.PLANO)                             ');
      Add('  AND (C.PLATIPO = ''A'' )                            ');
      Add('  AND (PD.PLACONTA(+) = C.PLACONTA)                   ');
      Add('  AND (PD.PLANO(+) = C.PLANO)                         ');
      Add('  AND (C.PLAGRAU <= ' + sGrau + ')                    ');
      if CmpRptCM.ParamValues[12].AsBoolean then
         Add(' AND (C.PLAGRUPO <> ''E'')                         ');
      Add('GROUP BY U.PLACONTA, C.PLAGRUPO,DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLAGRAU, ');
      Add('         C.PLANOMEOUTLING,  C.PLANATUREZA,C.PLATIPO ) UU        ');
      Add('ORDER BY UU.PLACONTA                                  ');

      sqlTot.Open;

    End;

   With CdsTot Do
   Begin
     A_rPer1  := 0;
     A_rPer2  := 0;
     A_rPer3  := 0;
     A_rPer4  := 0;
     A_rPer5  := 0;
     A_rPer6  := 0;
     A_rPer7  := 0;
     A_rPer8  := 0;
     A_rPer9  := 0;
     A_rPer10 := 0;
     A_rPer11 := 0;
     A_rPer12 := 0;

     P_rPer1  := 0;
     P_rPer2  := 0;
     P_rPer3  := 0;
     P_rPer4  := 0;
     P_rPer5  := 0;
     P_rPer6  := 0;
     P_rPer7  := 0;
     P_rPer8  := 0;
     P_rPer9  := 0;
     P_rPer10 := 0;
     P_rPer11 := 0;
     P_rPer12 := 0;

     R_rPer1  := 0;
     R_rPer2  := 0;
     R_rPer3  := 0;
     R_rPer4  := 0;
     R_rPer5  := 0;
     R_rPer6  := 0;
     R_rPer7  := 0;
     R_rPer8  := 0;
     R_rPer9  := 0;
     R_rPer10 := 0;
     R_rPer11 := 0;
     R_rPer12 := 0;

     D_rPer1  := 0;
     D_rPer2  := 0;
     D_rPer3  := 0;
     D_rPer4  := 0;
     D_rPer5  := 0;
     D_rPer6  := 0;
     D_rPer7  := 0;
     D_rPer8  := 0;
     D_rPer9  := 0;
     D_rPer10 := 0;
     D_rPer11 := 0;
     D_rPer12 := 0;

     C_rPer1  := 0;
     C_rPer2  := 0;
     C_rPer3  := 0;
     C_rPer4  := 0;
     C_rPer5  := 0;
     C_rPer6  := 0;
     C_rPer7  := 0;
     C_rPer8  := 0;
     C_rPer9  := 0;
     C_rPer10 := 0;
     C_rPer11 := 0;
     C_rPer12 := 0;

     O_rPer1  := 0;
     O_rPer2  := 0;
     O_rPer3  := 0;
     O_rPer4  := 0;
     O_rPer5  := 0;
     O_rPer6  := 0;
     O_rPer7  := 0;
     O_rPer8  := 0;
     O_rPer9  := 0;
     O_rPer10 := 0;
     O_rPer11 := 0;
     O_rPer12 := 0;

     E_rPer1  := 0;
     E_rPer2  := 0;
     E_rPer3  := 0;
     E_rPer4  := 0;
     E_rPer5  := 0;
     E_rPer6  := 0;
     E_rPer7  := 0;
     E_rPer8  := 0;
     E_rPer9  := 0;
     E_rPer10 := 0;
     E_rPer11 := 0;
     E_rPer12 := 0;

     rResultado1  := 0;
     rResultado2  := 0;
     rResultado3  := 0;
     rResultado4  := 0;
     rResultado5  := 0;
     rResultado6  := 0;
     rResultado7  := 0;
     rResultado8  := 0;
     rResultado9  := 0;
     rResultado10 := 0;
     rResultado11 := 0;
     rResultado12 := 0;

     A_Total := 0;
     P_Total := 0;
     E_Total := 0;
     R_Total := 0;
     D_Total := 0;
     O_Total := 0;
     C_Total := 0;
     T_Total := 0;

     TemAtivo   := False;
     TemPassivo := False;
     TemReceita := False;
     TemDespesa := False;
     TemCusto   := False;
     TemEstatistica := False;
     TemOutras  := True;

     while not eof do
     begin


        sGrupo := FieldByName('PLAGRUPO').AsString;
        if (sGrupo = 'A') then
        begin
           A_rPer1  := A_rPer1 + FieldByName('PER1').asFloat;
           A_rPer2  := A_rPer2 + FieldByName('PER2').asFloat;
           A_rPer3  := A_rPer3 + FieldByName('PER3').asFloat;
           A_rPer4  := A_rPer4 + FieldByName('PER4').asFloat;
           A_rPer5  := A_rPer5 + FieldByName('PER5').asFloat;
           A_rPer6  := A_rPer6 + FieldByName('PER6').asFloat;
           A_rPer7  := A_rPer7 + FieldByName('PER7').asFloat;
           A_rPer8  := A_rPer8 + FieldByName('PER8').asFloat;
           A_rPer9  := A_rPer9 + FieldByName('PER9').asFloat;
           A_rPer10 := A_rPer10 + FieldByName('PER10').asFloat;
           A_rPer11 := A_rPer11 + FieldByName('PER11').asFloat;
           A_rPer12 := A_rPer12 + FieldByName('PER12').asFloat;

           TemAtivo := True;
        end;

        if (sGrupo = 'P') then
        begin
           P_rPer1  := P_rPer1 + FieldByName('PER1').asFloat;
           P_rPer2  := P_rPer2 + FieldByName('PER2').asFloat;
           P_rPer3  := P_rPer3 + FieldByName('PER3').asFloat;
           P_rPer4  := P_rPer4 + FieldByName('PER4').asFloat;
           P_rPer5  := P_rPer5 + FieldByName('PER5').asFloat;
           P_rPer6  := P_rPer6 + FieldByName('PER6').asFloat;
           P_rPer7  := P_rPer7 + FieldByName('PER7').asFloat;
           P_rPer8  := P_rPer8 + FieldByName('PER8').asFloat;
           P_rPer9  := P_rPer9 + FieldByName('PER9').asFloat;
           P_rPer10 := P_rPer10 + FieldByName('PER10').asFloat;
           P_rPer11 := P_rPer11 + FieldByName('PER11').asFloat;
           P_rPer12 := P_rPer12 + FieldByName('PER12').asFloat;
           TemPassivo := True;
        end;

        if (sGrupo = 'R') then
        begin
           R_rPer1  := R_rPer1 + FieldByName('PER1').asFloat;
           R_rPer2  := R_rPer2 + FieldByName('PER2').asFloat;
           R_rPer3  := R_rPer3 + FieldByName('PER3').asFloat;
           R_rPer4  := R_rPer4 + FieldByName('PER4').asFloat;
           R_rPer5  := R_rPer5 + FieldByName('PER5').asFloat;
           R_rPer6  := R_rPer6 + FieldByName('PER6').asFloat;
           R_rPer7  := R_rPer7 + FieldByName('PER7').asFloat;
           R_rPer8  := R_rPer8 + FieldByName('PER8').asFloat;
           R_rPer9  := R_rPer9 + FieldByName('PER9').asFloat;
           R_rPer10 := R_rPer10 + FieldByName('PER10').asFloat;
           R_rPer11 := R_rPer11 + FieldByName('PER11').asFloat;
           R_rPer12 := R_rPer12 + FieldByName('PER12').asFloat;
           TemReceita := True;
        end;

        if (sGrupo = 'D') then
        begin
             D_rPer1  := D_rPer1 + FieldByName('PER1').asFloat;
             D_rPer2  := D_rPer2 + FieldByName('PER2').asFloat;
             D_rPer3  := D_rPer3 + FieldByName('PER3').asFloat;
             D_rPer4  := D_rPer4 + FieldByName('PER4').asFloat;
             D_rPer5  := D_rPer5 + FieldByName('PER5').asFloat;
             D_rPer6  := D_rPer6 + FieldByName('PER6').asFloat;
             D_rPer7  := D_rPer7 + FieldByName('PER7').asFloat;
             D_rPer8  := D_rPer8 + FieldByName('PER8').asFloat;
             D_rPer9  := D_rPer9 + FieldByName('PER9').asFloat;
             D_rPer10 := D_rPer10 + FieldByName('PER10').asFloat;
             D_rPer11 := D_rPer11 + FieldByName('PER11').asFloat;
             D_rPer12 := D_rPer12 + FieldByName('PER12').asFloat;
             TemDespesa := True;
        end;

        if (sGrupo = 'C') then
        begin
           C_rPer1  := C_rPer1 + FieldByName('PER1').asFloat;
           C_rPer2  := C_rPer2 + FieldByName('PER2').asFloat;
           C_rPer3  := C_rPer3 + FieldByName('PER3').asFloat;
           C_rPer4  := C_rPer4 + FieldByName('PER4').asFloat;
           C_rPer5  := C_rPer5 + FieldByName('PER5').asFloat;
           C_rPer6  := C_rPer6 + FieldByName('PER6').asFloat;
           C_rPer7  := C_rPer7 + FieldByName('PER7').asFloat;
           C_rPer8  := C_rPer8 + FieldByName('PER8').asFloat;
           C_rPer9  := C_rPer9 + FieldByName('PER9').asFloat;
           C_rPer10 := C_rPer10 + FieldByName('PER10').asFloat;
           C_rPer11 := C_rPer11 + FieldByName('PER11').asFloat;
           C_rPer12 := C_rPer12 + FieldByName('PER12').asFloat;
           TemCusto := True;
        end;

        if (sGrupo = 'O') then
        begin
           O_rPer1  := O_rPer1 + FieldByName('PER1').asFloat;
           O_rPer2  := O_rPer2 + FieldByName('PER2').asFloat;
           O_rPer3  := O_rPer3 + FieldByName('PER3').asFloat;
           O_rPer4  := O_rPer4 + FieldByName('PER4').asFloat;
           O_rPer5  := O_rPer5 + FieldByName('PER5').asFloat;
           O_rPer6  := O_rPer6 + FieldByName('PER6').asFloat;
           O_rPer7  := O_rPer7 + FieldByName('PER7').asFloat;
           O_rPer8  := O_rPer8 + FieldByName('PER8').asFloat;
           O_rPer9  := O_rPer9 + FieldByName('PER9').asFloat;
           O_rPer10 := O_rPer10 + FieldByName('PER10').asFloat;
           O_rPer11 := O_rPer11 + FieldByName('PER11').asFloat;
           O_rPer12 := O_rPer12 + FieldByName('PER12').asFloat;
           TemOutras := True;
          end;

        if (sGrupo = 'E') then
        begin
           E_rPer1  := E_rPer1 + FieldByName('PER1').asFloat;
           E_rPer2  := E_rPer2 + FieldByName('PER2').asFloat;
           E_rPer3  := E_rPer3 + FieldByName('PER3').asFloat;
           E_rPer4  := E_rPer4 + FieldByName('PER4').asFloat;
           E_rPer5  := E_rPer5 + FieldByName('PER5').asFloat;
           E_rPer6  := E_rPer6 + FieldByName('PER6').asFloat;
           E_rPer7  := E_rPer7 + FieldByName('PER7').asFloat;
           E_rPer8  := E_rPer8 + FieldByName('PER8').asFloat;
           E_rPer9  := E_rPer9 + FieldByName('PER9').asFloat;
           E_rPer10 := E_rPer10 + FieldByName('PER10').asFloat;
           E_rPer11 := E_rPer11 + FieldByName('PER11').asFloat;
           E_rPer12 := E_rPer12 + FieldByName('PER12').asFloat;
           TemEstatistica := True;
        end;

         Next;
     end;
   end;

   //---------------------------------------------------------------------------
   // Calcula o resultado (total das colunas)
   //---------------------------------------------------------------------------
   rResultado1 := A_rPer1 + P_rPer1 + R_rPer1 + D_rPer1 + C_rPer1 + O_rPer1 + E_rPer1;
   rResultado2 := A_rPer2 + P_rPer2 + R_rPer2 + D_rPer2 + C_rPer2 + O_rPer2 + E_rPer2;
   rResultado3 := A_rPer3 + P_rPer3 + R_rPer3 + D_rPer3 + C_rPer3 + O_rPer3 + E_rPer3;

   rResultado4 := A_rPer4 + P_rPer4 + R_rPer4 + D_rPer4 + C_rPer4 + O_rPer4 + E_rPer4;
   rResultado5 := A_rPer5 + P_rPer5 + R_rPer5 + D_rPer5 + C_rPer5 + O_rPer5 + E_rPer5;
   rResultado6 := A_rPer6 + P_rPer6 + R_rPer6 + D_rPer6 + C_rPer6 + O_rPer6 + E_rPer6;

   rResultado7  := A_rPer7 + P_rPer7 + R_rPer7 + D_rPer7 + C_rPer7 + O_rPer7 + E_rPer7;
   rResultado8  := A_rPer8 + P_rPer8 + R_rPer8 + D_rPer8 + C_rPer8 + O_rPer8 + E_rPer8;
   rResultado9  := A_rPer9 + P_rPer9 + R_rPer9 + D_rPer9 + C_rPer9 + O_rPer9 + E_rPer9;

   rResultado10 := A_rPer10 + P_rPer10 + R_rPer10 + D_rPer10 + C_rPer10 + O_rPer10 + E_rPer10;
   rResultado11 := A_rPer11 + P_rPer11 + R_rPer11 + D_rPer11 + C_rPer11 + O_rPer11 + E_rPer11;
   rResultado12 := A_rPer12 + P_rPer12 + R_rPer12 + D_rPer12 + C_rPer12 + O_rPer12 + E_rPer12;

   //---------------------------------------------------------------------------
   // Movimenta campos para os memos
   //---------------------------------------------------------------------------

   if TemAtivo then
   begin
     memDescricao.lines.Add('Contas de Ativo');
     memCol1.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', A_rPer1));
     memCol2.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', A_rPer2));
     memCol3.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', A_rPer3));
     memCol4.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', A_rPer4));
     memCol5.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', A_rPer5));
     memCol6.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', A_rPer6));
     memCol7.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', A_rPer7));
     memCol8.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', A_rPer8));
     memCol9.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', A_rPer9));
     memCol10.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',A_rPer10));
     memCol11.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',A_rPer11));
     memCol12.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',A_rPer12));

     A_Total := A_rPer1 + A_rPer2 + A_rPer3 + A_rPer4 + A_rPer5 + A_rPer6 +
                A_rPer7 + A_rPer8 + A_rPer9 + A_rPer10 + A_rPer11 + A_rPer12;

     memColTot.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',A_Total));
   end;

   if TemPassivo then
   begin
     memDescricao.lines.Add('Contas de Passivo');
     memCol1.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', P_rPer1));
     memCol2.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', P_rPer2));
     memCol3.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', P_rPer3));
     memCol4.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', P_rPer4));
     memCol5.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', P_rPer5));
     memCol6.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', P_rPer6));
     memCol7.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', P_rPer7));
     memCol8.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', P_rPer8));
     memCol9.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', P_rPer9));
     memCol10.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',P_rPer10));
     memCol11.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',P_rPer11));
     memCol12.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',P_rPer12));

     P_Total := P_rPer1 + P_rPer2 + P_rPer3 + P_rPer4 + P_rPer5 + P_rPer6 +
                P_rPer7 + P_rPer8 + P_rPer9 + P_rPer10 + P_rPer11 + P_rPer12;
     memColTot.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',P_Total));
  end;

   if TemReceita then
   begin
     memDescricao.lines.Add('Contas de Receita');
     memCol1.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', R_rPer1));
     memCol2.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', R_rPer2));
     memCol3.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', R_rPer3));
     memCol4.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', R_rPer4));
     memCol5.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', R_rPer5));
     memCol6.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', R_rPer6));
     memCol7.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', R_rPer7));
     memCol8.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', R_rPer8));
     memCol9.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', R_rPer9));
     memCol10.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',R_rPer10));
     memCol11.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',R_rPer11));
     memCol12.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',R_rPer12));

     R_Total := R_rPer1 + R_rPer2 + R_rPer3 + R_rPer4 + R_rPer5 + R_rPer6 +
                R_rPer7 + R_rPer8 + R_rPer9 + R_rPer10 + R_rPer11 + R_rPer12;

     memColTot.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',R_Total));
   end;

   if TemDespesa then
   begin
     memDescricao.lines.Add('Contas de Despesa');
     memCol1.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', D_rPer1));
     memCol2.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', D_rPer2));
     memCol3.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', D_rPer3));
     memCol4.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', D_rPer4));
     memCol5.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', D_rPer5));
     memCol6.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', D_rPer6));
     memCol7.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', D_rPer7));
     memCol8.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', D_rPer8));
     memCol9.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', D_rPer9));
     memCol10.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',D_rPer10));
     memCol11.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',D_rPer11));
     memCol12.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',D_rPer12));

     D_Total := D_rPer1 + D_rPer2 + D_rPer3 + D_rPer4 + D_rPer5 + D_rPer6 +
                D_rPer7 + D_rPer8 + D_rPer9 + D_rPer10 + D_rPer11 + D_rPer12;
      memColTot.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',D_Total));
  end;

   if TemCusto then
   begin
     memDescricao.lines.Add('Contas de Custo');
     memCol1.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', C_rPer1));
     memCol2.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', C_rPer2));
     memCol3.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', C_rPer3));
     memCol4.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', C_rPer4));
     memCol5.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', C_rPer5));
     memCol6.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', C_rPer6));
     memCol7.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', C_rPer7));
     memCol8.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', C_rPer8));
     memCol9.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', C_rPer9));
     memCol10.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',C_rPer10));
     memCol11.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',C_rPer11));
     memCol12.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',C_rPer12));

     C_Total := C_rPer1 + C_rPer2 + C_rPer3 + C_rPer4 + C_rPer5 + C_rPer6 +
                C_rPer7 + C_rPer8 + C_rPer9 + C_rPer10 + C_rPer11 + C_rPer12;
     memColTot.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',C_Total));
   end;

   if TemOutras then
   begin
     memDescricao.lines.Add('Outras');
     memCol1.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', O_rPer1));
     memCol2.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', O_rPer2));
     memCol3.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', O_rPer3));
     memCol4.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', O_rPer4));
     memCol5.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', O_rPer5));
     memCol6.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', O_rPer6));
     memCol7.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', O_rPer7));
     memCol8.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', O_rPer8));
     memCol9.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', O_rPer9));
     memCol10.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',O_rPer10));
     memCol11.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',O_rPer11));
     memCol12.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',O_rPer12));

     O_Total := O_rPer1 + O_rPer2 + O_rPer3 + O_rPer4 + O_rPer5 + O_rPer6 +
                O_rPer7 + O_rPer8 + O_rPer9 + O_rPer10 + O_rPer11 + O_rPer12;

     memColTot.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',O_Total));
   end;

   if TemEstatistica then
   begin
     memDescricao.lines.Add('Contas Estatísticas');
     memCol1.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', E_rPer1));
     memCol2.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', E_rPer2));
     memCol3.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', E_rPer3));
     memCol4.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', E_rPer4));
     memCol5.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', E_rPer5));
     memCol6.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', E_rPer6));
     memCol7.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', E_rPer7));
     memCol8.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', E_rPer8));
     memCol9.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)', E_rPer9));
     memCol10.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',E_rPer10));
     memCol11.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',E_rPer11));
     memCol12.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',E_rPer12));

     E_Total := E_rPer1 + E_rPer2 + E_rPer3 + E_rPer4 + E_rPer5 + E_rPer6 +
                E_rPer7 + E_rPer8 + E_rPer9 + E_rPer10 + E_rPer11 + E_rPer12;

     memColTot.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',E_Total));

   end;

   memDescricao.lines.Add('Resultado');
   memCol1.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado1));
   memCol2.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado2));
   memCol3.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado3));
   memCol4.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado4));
   memCol5.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado5));
   memCol6.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado6));
   memCol7.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado7));
   memCol8.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado8));
   memCol9.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado9));
   memCol10.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado10));
   memCol11.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado11));
   memCol12.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',rResultado12));

   T_Total := rResultado1 + rResultado2 + rResultado3 + rResultado4 + rResultado5 + rResultado6 +
              rResultado7 + rResultado8 + rResultado9 + rResultado10 + rResultado11 + rResultado12;

   memColTot.lines.Add(FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',T_Total));

end;

procedure TRptBalanceteColunado.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  //Bruno Bastos - Pend. 17454 - 21/09/2004 - Início
  CtrlContab       := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);
  //Bruno Bastos - Pend. 17454 - 21/09/2004 - Fim
end;

procedure TRptBalanceteColunado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptBalancete.free;
  CtrlContab.Free;//Bruno Bastos - Pend. 17454 - 21/09/2004
end;

procedure TRptBalanceteColunado.MontaFiltroDescEncResult(psPlaGrau,
  psExercicio, psIdEmpresa, psPlano, psPlaConta, psPlaConta1: String;
  piPeriodo: Integer; pbDescContasEst, pbDescEncResult: Boolean);
begin
  If pbDescEncResult Then
  Begin
    sqlBalancete.Sql.Add(',(SELECT  U.PLACONTA, ABS(SUM(NVL(U.DEB, 0))) AS DEB, ');
    sqlBalancete.Sql.Add('    ABS(SUM(NVL(U.CRED, 0))) AS CRED, ');
    sqlBalancete.Sql.Add('    SUM(U.DEBA) AS DEBA, ');
    sqlBalancete.Sql.Add('    SUM(U.CREDA) AS CREDA, ');
    sqlBalancete.Sql.Add('    SUM(U.MOV) AS MOV, ');
    sqlBalancete.Sql.Add('    ABS(SUM(NVL(U.MOV, 0))) AS MOVABS ');
    sqlBalancete.Sql.Add('  FROM ');
    sqlBalancete.Sql.Add('  ((SELECT ');
    sqlBalancete.Sql.Add('      C.PLACONTA, ');
    sqlBalancete.Sql.Add('      ABS(NVL(S.DEB, 0)) AS DEB, ');
    sqlBalancete.Sql.Add('      ABS(NVL(S.CRED, 0)) AS CRED, ');
    sqlBalancete.Sql.Add('      S.DEBA, ');
    sqlBalancete.Sql.Add('      S.CREDA, ');
    sqlBalancete.Sql.Add('      S.MOV, ');
    sqlBalancete.Sql.Add('      ABS(NVL(S.MOV, 0)) AS MOVABS ');
    sqlBalancete.Sql.Add('    FROM ');
    sqlBalancete.Sql.Add('      PLANOCONTA C, ');
    sqlBalancete.Sql.Add('     (SELECT ');
    sqlBalancete.Sql.Add('        C.PLACONTA, ');
    sqlBalancete.Sql.Add('        SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR*-1, 0)) AS DEB, ');
    sqlBalancete.Sql.Add('        SUM(DECODE(L.LACDEBCRE, ''C'', L.LACVALOR*-1, 0)) AS CRED, ');
    sqlBalancete.Sql.Add('        SUM(DECODE(C.PLATIPO, ''A'', DECODE(L.LACDEBCRE, ''D'', L.LACVALOR*-1, 0), 0)) AS DEBA, ');
    sqlBalancete.Sql.Add('        SUM(DECODE(C.PLATIPO, ''A'', DECODE(L.LACDEBCRE, ''C'', L.LACVALOR*-1, 0), 0)) AS CREDA, ');
    sqlBalancete.Sql.Add('        SUM(DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, L.LACVALOR*-1)) AS MOV ');
    sqlBalancete.Sql.Add('      FROM ');
    sqlBalancete.Sql.Add('        PLANOCONTA C, ');
    sqlBalancete.Sql.Add('        LANCAMENTO L, ');
    sqlBalancete.Sql.Add('        PLANILHA P ');
    sqlBalancete.Sql.Add('      WHERE (L.PLACONTA   LIKE RTRIM(C.PLACONTA)||''%'') ');
    sqlBalancete.Sql.Add('        AND (L.PLANO         = C.PLANO) ');
    sqlBalancete.Sql.Add('        AND (P.PLNCODIGO     = L.PLNCODIGO) ');
    sqlBalancete.Sql.Add('        AND (L.TIPCODIGO     = '+QuotedStr(CtrlContab.TipoOpEncer)+') ');
    sqlBalancete.Sql.Add('        AND (P.PEREXERCICIO  = '+psExercicio+') ');
    sqlBalancete.Sql.Add('        AND (P.PERNUMERO     = '+IntToStr(piPeriodo)+') ');
    sqlBalancete.Sql.Add('        AND (P.IDPESSOA      = '+psIdEmpresa+') ');
    sqlBalancete.Sql.Add('        AND (L.PLANO         = '+psPlano+') ');
    sqlBalancete.Sql.Add('        AND (L.PLACONTA     >= '+QuotedStr(psPlaConta)+') ');
    sqlBalancete.Sql.Add('        AND (L.PLACONTA     <= '+QuotedStr(psPlaConta1)+') ');
    sqlBalancete.Sql.Add('      GROUP BY ');
    sqlBalancete.Sql.Add('        C.PLACONTA) S ');
    sqlBalancete.Sql.Add('    WHERE (S.PLACONTA(+)  = C.PLACONTA) ');
    sqlBalancete.Sql.Add('      AND (C.PLANO        = '+psPlano+') ');
    sqlBalancete.Sql.Add('      AND (C.PLACONTA    >= '+QuotedStr(psPlaConta)+') ');
    sqlBalancete.Sql.Add('      AND (C.PLACONTA    <= '+QuotedStr(psPlaConta1)+') ');

    If pbDescContasEst Then
      sqlBalancete.Sql.Add('      AND (C.PLAGRUPO    <> ''E'') ');

    sqlBalancete.Sql.Add('    GROUP BY ');
    sqlBalancete.Sql.Add('      C.PLACONTA, ');
    sqlBalancete.Sql.Add('      S.DEB, ');
    sqlBalancete.Sql.Add('      S.CRED, ');
    sqlBalancete.Sql.Add('      S.DEBA, ');
    sqlBalancete.Sql.Add('      S.CREDA, ');
    sqlBalancete.Sql.Add('      S.MOV ');
    sqlBalancete.Sql.Add('    HAVING ');
    sqlBalancete.Sql.Add('    ((DECODE(NVL(S.DEB, 0), 0, ');
    sqlBalancete.Sql.Add('       (DECODE(NVL(S.CRED, 0), 0, ''0'', ''1'')), ''1'')) = ''1'')) ');
    sqlBalancete.Sql.Add('    UNION ALL ');
    sqlBalancete.Sql.Add('   (SELECT ');
    sqlBalancete.Sql.Add('      C.PLACONTA, ');
    sqlBalancete.Sql.Add('      NVL(S.DEB, 0) AS DEB, ');
    sqlBalancete.Sql.Add('      NVL(S.CRED, 0) AS CRED, ');
    sqlBalancete.Sql.Add('      S.DEBA, ');
    sqlBalancete.Sql.Add('      S.CREDA, ');
    sqlBalancete.Sql.Add('      S.MOV, ');
    sqlBalancete.Sql.Add('      ABS(NVL(S.MOV, 0)) AS MOVABS ');
    sqlBalancete.Sql.Add('    FROM ');
    sqlBalancete.Sql.Add('      PLANOCONTA C, ');
    sqlBalancete.Sql.Add('     (SELECT ');
    sqlBalancete.Sql.Add('        PLACONTA, ');
    sqlBalancete.Sql.Add('        SUM(PLSDEBITOCORRENTE) AS DEB, ');
    sqlBalancete.Sql.Add('        SUM(PLSCREDITOCOR) AS CRED, ');
    sqlBalancete.Sql.Add('        SUM(DECODE(PLSTIPO, ''A'', PLSDEBITOCORRENTE, 0)) AS DEBA, ');
    sqlBalancete.Sql.Add('        SUM(DECODE(PLSTIPO, ''A'', PLSCREDITOCOR, 0)) AS CREDA, ');
    sqlBalancete.Sql.Add('        (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV ');
    sqlBalancete.Sql.Add('      FROM ');
    sqlBalancete.Sql.Add('        PLANOSALDO ');
    sqlBalancete.Sql.Add('      WHERE (PEREXERCICIO = '+psExercicio+') ');
    sqlBalancete.Sql.Add('        AND (PERNUMERO    = '+IntToStr(piPeriodo)+') ');
    sqlBalancete.Sql.Add('        AND (IDPESSOA     = '+psIdEmpresa+') ');
    sqlBalancete.Sql.Add('        AND (PLANO        = '+psPlano+') ');
    sqlBalancete.Sql.Add('        AND (PLACONTA     >= '+QuotedStr(psPlaConta)+') ');
    sqlBalancete.Sql.Add('        AND (PLACONTA     <= '+QuotedStr(psPlaConta1)+') ');
    sqlBalancete.Sql.Add('      GROUP BY ');
    sqlBalancete.Sql.Add('        PLACONTA) S ');
    sqlBalancete.Sql.Add('    WHERE (S.PLACONTA(+)  = C.PLACONTA) ');
    sqlBalancete.Sql.Add('      AND (C.PLAGRAU     <= '+psPlaGrau+') ');
    sqlBalancete.Sql.Add('      AND (C.PLANO        = '+psPlano+') ');
    sqlBalancete.Sql.Add('      AND (C.PLACONTA    >= '+QuotedStr(psPlaConta)+') ');
    sqlBalancete.Sql.Add('      AND (C.PLACONTA    <= '+QuotedStr(psPlaConta1)+') ');
    sqlBalancete.Sql.Add('    GROUP BY ');
    sqlBalancete.Sql.Add('      C.PLACONTA, ');
    sqlBalancete.Sql.Add('      S.DEB, ');
    sqlBalancete.Sql.Add('      S.CRED, ');
    sqlBalancete.Sql.Add('      S.DEBA, ');
    sqlBalancete.Sql.Add('      S.CREDA, ');
    sqlBalancete.Sql.Add('      S.MOV ');
    sqlBalancete.Sql.Add('    HAVING ');
    sqlBalancete.Sql.Add('     (DECODE(NVL(S.DEB, 0), 0, ');
    sqlBalancete.Sql.Add('       (DECODE(NVL(S.CRED, 0), 0, ''0'', ''1'')), ''1'')) = ''1'')) U ');
    sqlBalancete.Sql.Add('  GROUP BY ');
    sqlBalancete.Sql.Add('    U.PLACONTA) N ');
  End;
end;

function TRptBalanceteColunado.BuscaPlanodata(const piPeriodo  : integer;
                                              const piExercicio: integer): Integer;
begin
  if piPeriodo <= 9 then
    CtrlContab.SelecionaPlanoDataProc(Sistema.IdEmpresa, '01/0'+IntToStr(piPeriodo)+'/'+IntToStr(piExercicio))
  else
    CtrlContab.SelecionaPlanoDataProc(Sistema.IdEmpresa, '01/'+IntToStr(piPeriodo)+'/'+IntToStr(piExercicio));

  Result := CtrlContab.Planodata;
end;

end.
