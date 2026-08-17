{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidade              }
{                                                       }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit RPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, uCmRptManager, TXComp, CmParamReport,uCmSqlParams,
  ppBands, ppClass, ppVar, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppCache,
  ppProd, ppReport, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, mask,
  DBClient, Provider, ADODB, uSistema,uCMfileUtils,uCtrlGeral,uCtrlParamIntegra,
  uCMClientDataSet, FCmReport, uCtrlRptBalancete,uCtrlPeriodo, TXRB, uCtrlContaContabil;


type
  TrptPlanoContas = class(TFrmCmReport)
    dsPlanoContas: TwwDataSource;
    pplPlanoContas: TppBDEPipeline;
    rptPlanoContas: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLblTituloPlanoContas: TppLabel;
    ppLine12: TppLine;
    LblEmpresa: TppLabel;
    ppLabel17: TppLabel;
    ppLine13: TppLine;
    ppLabel20: TppLabel;
    rptPlanoContasLabel1: TppLabel;
    rptPlanoContasLabel2: TppLabel;
    rptPlanoContasLabel3: TppLabel;
    rptPlanoContasLabel4: TppLabel;
    rptPlanoContasLabel6: TppLabel;
    bndDetPlanoContas: TppDetailBand;
    dbtxtCodigoPl: TppDBText;
    dbtxtNomePl: TppDBText;
    ppDBText12: TppDBText;
    dbtxtCorrespPl: TppDBText;
    dbtxtSecretariaPl: TppDBText;
    dbtxtNaturezaPl: TppDBText;
    dbtxtReduzPl: TppDBText;
    dbtxtCCustoPl: TppDBText;
    dbtxtSAPl: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine14: TppLine;
    LblSistema: TppLabel;
    rptPlanoContasLabel7: TppLabel;
    lblContCon: TppLabel;
    ppCalc10: TppSystemVariable;
    lblCalcCon: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    sqlPlanoContas: TCMSqlParams;
    cdsPlanoContas: TCMClientDataSet;
    ppRateioAp: TppLabel;
    dbtxtRateioap: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppFooterBand5BeforePrint(Sender: TObject);
    procedure bndDetPlanoContasBeforeGenerate(Sender: TObject);
    procedure CdsPlanoContasBeforeOpen(DataSet: TDataSet);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    iPagIni             : integer;
    sMascara, sSintAnal : string;
    bIndenta, bEspaco   : Boolean;
    CtrlRptBalancete :TCtrlRptBalancete;
    CtrlPeriodo      : TCtrlPeriodo;
    CtrlContaContabil: TCtrlContaContabil;

  public
    { Public declarations }
  end;

implementation

uses uFuncaoGeral, uDatabase, DBaseDados;

{$R *.DFM}

procedure TrptPlanoContas.CrmRptCMBeforePrint(Sender: TObject);
var sTitulo : string;
    iNumero : Integer;
    sEspacos,sGrau : string;
    i,iGrau : integer;

begin
   inherited;
   CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,CmpRptCM.ParamValues[10].AsString);
   //==================================================================
   // Calcula grau
   //==================================================================
   Try
      iGrau:=CmpRptCM.ParamValues[9].AsInteger;
   Except
      iGrau:=0;
   End;

   If (iGrau=0) then
      sGrau:=IntToStr(FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano))
   Else
      sGrau:=IntToStr(iGrau);
   //====================================================================
   if trim(CmpRptCM.ParamValues[12].AsString) = '' then
   begin
      sTitulo := 'Plano de Contas';
      pplblTituloPlanoContas.caption := sTitulo;
   end
   else
     pplblTituloPlanoContas.caption := CmpRptCM.ParamValues[12].AsString;


   if CmpRptCM.ParamValues[4].AsBoolean then
      rptPlanoContas.Groups[0].NewPage := true
   else
     rptPlanoContas.Groups[0].NewPage := false;

   iPagIni := CmpRptCM.ParamValues[11].AsInteger;

   iNumero := FuncaoGeral.CalcNumEleGrau(ParamIntegra.MascaraPlano, 1);

   with sqlPlanoContas do
   begin
      SQL.Clear;
      SQL.Add('SELECT                                                             ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, DECODE(PD.PLATIPO,NULL,C.PLATIPO,PD.PLATIPO) AS PLATIPO, C.PLAREDUZ, C.PLACCUST,       ');
      SQL.Add('   C.PLANATUREZA, C.PLASECRETARIA, C.PLACONCORRESP, C.PLARATEIOAP, ');
      SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');

      if CmpRptCM.ParamValues[5].AsBoolean then begin
         //Iferreira Pendencia 27042
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, NVL(C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING     ');
         //SQL.Add('   C.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING     ');
      end else begin
         //Iferreira Pendencia 27042
         SQL.Add('   NVL(C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME      ');
         //SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME      ');
      end;
      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOCONTA C,                                                 ');
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD ');
      SQL.Add('WHERE                                                            ');
      SQL.Add('    (C.PLANO =:PLANO) AND                                        ');
      SQL.Add('    (C.PLAGRAU <=:GRAU) AND                                      ');

      if CmpRptCM.ParamValues[13].AsBoolean then
      begin
        SQL.Add(' (C.PLASECRETARIA = ''S'') AND                                   ');
      end;

      if CmpRptCM.ParamValues[8].AsBoolean then begin
         SQL.Add(' (DECODE(PD.PLAINATIVA,NULL,C.PLAINATIVA,PD.PLAINATIVA) = ''A'') AND                                   ');
      end;
      SQL.Add('    (PD.PLACONTA(+)    = C.PLACONTA) AND                         ');
      SQL.Add('    (PD.PLANO(+)       = C.PLANO) AND                            ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                  ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM))                      ');
      SQL.Add('ORDER BY                                                         ');
      SQL.Add('    C.PLACONTA                                                   ');

      Prepare;

      ParamByName('GRAU').asInteger  := StrToInt(sGrau);

      if trim(CmpRptCM.ParamValues[0].AsString) = '' then begin
         ParamByName('PLANO').asInteger := ParamIntegra.Plano;
      end else begin
         ParamByName('PLANO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
      end;

      if trim(CmpRptCM.ParamValues[1].AsString) <> '' then  begin
         ParamByName('CONTAINI').asString := CmpRptCM.ParamValues[1].AsString;
      end else begin
         ParamByName('CONTAINI').asString := '1';
      end;

      if trim(CmpRptCM.ParamValues[2].AsString) <> '' then  begin
         ParamByName('CONTAFIM').asString := CmpRptCM.ParamValues[2].AsString;
      end else begin
         ParamByName('CONTAFIM').asString := '999999999999999999';
      end;

      Open;

      //====================================
      CtrlContaContabil.BuscaMascaraConta(StrToFloat(CmpRptCM.ParamValues[0].asString)); //Everson Cunha - SIG102043

      sMascara := '';
      If CmpRptCM.ParamValues[3].AsBoolean Then
        sMascara := CtrlContaContabil.MascaraConta; //Everson Cunha - SIG102043
        //sMascara := ParamIntegra.MascaraPlano;    //Everson Cunha - SIG102043

      //=====================================================================

      bIndenta := CmpRptCM.ParamValues[6].AsBoolean;
      bEspaco  := CmpRptCM.ParamValues[7].AsBoolean;

      CdsPlanoContas.First;

      While Not CdsPlanoContas.Eof Do
      Begin
         sEspacos := '';
         if bIndenta then
           Begin
             for i := 1 to ((CdsPlanoContas.FieldByName('PLAGRAU').asInteger - 1) * 5) do
               sEspacos := sEspacos + ' ';
           end;

         CdsPlanoContas.Edit;
         CdsPlanoContas.FieldByName('NOMEINDENTADO').asString := sEspacos + (CdsPlanoContas.FieldByName('CONTA').asString);
         CdsPlanoContas.Post;

         CdsPlanoContas.Next;
      End;

   End;

end;

procedure TrptPlanoContas.ppFooterBand5BeforePrint(Sender: TObject);
begin
  inherited;
  lblContCon.Caption := IntToStr((iPagIni + StrToInt(lblCalcCon.text)) - 1);
end;

procedure TrptPlanoContas.bndDetPlanoContasBeforeGenerate(Sender: TObject);
Var
   Platipo  : string;
   PlAgrau : integer;
begin
  inherited;
   Platipo := CdsPlanoContas.FieldByName('PLATIPO').asString;
   PlAgrau := CdsPlanoContas.FieldByName('PLAGRAU').asInteger;

   //Controla a altura da banda
   if bEspaco then begin
      if (sSintAnal = 'S') or (Platipo = 'S') then begin
         bndDetPlanoContas.Height := 23;
         dbtxtCodigoPl.top        := 9;
         dbtxtNomePl.top          := 9;
         dbtxtCorrespPl.top       := 9;
         dbtxtSecretariaPl.top    := 9;
         dbtxtNaturezaPl.Top      := 9;
         dbtxtCCustoPl.Top        := 9;
         dbtxtReduzPl.Top         := 9;
         dbtxtSAPl.Top            := 9;
      end else begin
         bndDetPlanoContas.Height := 16;
         dbtxtCodigoPl.top        := 2;
         dbtxtNomePl.top          := 2;
         dbtxtCorrespPl.top       := 2;
         dbtxtSecretariaPl.top    := 2;
         dbtxtNaturezaPl.Top      := 2;
         dbtxtCCustoPl.Top        := 2;
         dbtxtReduzPl.Top         := 2;
         dbtxtSAPl.Top            := 2;
      end;
      sSintAnal := Platipo;
   end else begin
      bndDetPlanoContas.Height := 16;
      dbtxtCodigoPl.top        := 2;
      dbtxtNomePl.top          := 2;
      dbtxtCorrespPl.top       := 2;
      dbtxtSecretariaPl.top    := 2;
      dbtxtNaturezaPl.Top      := 2;
      dbtxtCCustoPl.Top        := 2;
      dbtxtReduzPl.Top         := 2;
      dbtxtSAPl.Top            := 2;
   end;

   //Configura a máscara das contas contábeis
   if sMascara <> '' then begin
      //sMascara := FuncaoGeral.CalcMascaraPorGrau(ParamIntegra.MascaraPlano, PlAgrau);    //Everson Cunha - SIG102043
      sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContaContabil.MascaraConta, PlAgrau); //Everson Cunha - SIG102043
      dbtxtCodigoPl.DisplayFormat  := sMascara + ';0; ';
   end else
      sMascara := '';

end;

procedure TrptPlanoContas.CdsPlanoContasBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  //Inicializa a variável de controle de Conta Sistética/Analitica
   sSintAnal := 'A';
end;

procedure TrptPlanoContas.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[9].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);
   CmpRptCM.ParamValues[9].SpinEditSettings.Value    := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);

end;

procedure TrptPlanoContas.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  //Everson Cunha - SIG102043 - Ini
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);
  //Everson Cunha - SIG102043 - Fim
end;

procedure TrptPlanoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptBalancete.free;
  CtrlPeriodo.free;
  CtrlContaContabil.Free; //Everson Cunha - SIG102043
end;

end.
