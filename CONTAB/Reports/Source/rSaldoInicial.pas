{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------}

unit rSaldoInicial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,uCtrlPeriodo,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, uCmSqlParams, Db,uCtrlRptBalancete,
  DBClient, uCMClientDataSet, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl,uCtrlContab,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Wwdatsrc,
  TXRB;

type
  TrptSaldoInicial = class(TFrmCmReport)
    dsSaldoInicial: TwwDataSource;
    pplSaldoInicial: TppBDEPipeline;
    rptSaldoInicial: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLblTituloSIni: TppLabel;
    ppLine49: TppLine;
    LblEmpresa: TppLabel;
    ppLabel107: TppLabel;
    ppLine50: TppLine;
    ppLabel110: TppLabel;
    ppLabel112: TppLabel;
    ppLblTituloSIni2: TppLabel;
    bndDetSaldoInicial: TppDetailBand;
    dbtxtCorrespSIni: TppDBText;
    dbtxtContaSIni: TppDBText;
    dbtxtNomeContaSIni: TppDBText;
    dbtxtSaldoSIni: TppDBText;
    dbtxtSaldoDCSIni: TppDBText;
    ppDBText48: TppDBText;
    ppFooterBand17: TppFooterBand;
    ppLine51: TppLine;
    LblSistema: TppLabel;
    rptSaldoInicialLabel1: TppLabel;
    lblContSaldoIni: TppLabel;
    ppCalc34: TppSystemVariable;
    lblCalcSaldoIni: TppSystemVariable;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    cdsSaldoInicial: TCMClientDataSet;
    sqlSaldoInicial: TCMSqlParams;
    procedure bndDetSaldoInicialBeforeGenerate(Sender: TObject);
    procedure ppFooterBand17BeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlContab       : TCtrlContab;
    CtrlRptBalancete : TCtrlRptBalancete;
    CtrlPeriodo     :TCtrlPeriodo;

    sMascara,sSintAnal,sTitulo :string;
    bEspaco,bIndenta  :Boolean;
    iPagIni,iNumero  :Integer;
  public
    { Public declarations }
  end;

var
  rptSaldoInicial: TrptSaldoInicial;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uModulo,  uData, uFuncaoGeral;

{$R *.DFM}

procedure TrptSaldoInicial.bndDetSaldoInicialBeforeGenerate(
  Sender: TObject);
begin
  inherited;

   //Controla a altura da banda
   if bEspaco then begin
      if (sSintAnal = 'S') or (cdsSaldoInicial.FieldByName('PLATIPO').asString = 'S') then begin
         bndDetSaldoInicial.Height := 23;
         dbtxtContaSIni.top      := 9;
         dbtxtCorrespSIni.top    := 9;
         dbtxtNomeContasIni.top  := 9;
         dbtxtSaldosIni.Top      := 9;
         dbtxtSaldoDCsIni.Top    := 9;
      end else begin
         bndDetSaldoInicial.Height := 16;
         dbtxtContasIni.top      := 2;
         dbtxtCorrespSIni.top    := 2;
         dbtxtNomeContaSIni.top  := 2;
         dbtxtSaldoSIni.Top      := 2;
         dbtxtSaldoDCSIni.Top    := 2;
      end;
      sSintAnal := cdsSaldoInicial.FieldByName('PLATIPO').asString;
   end else begin
      bndDetSaldoInicial.Height := 16;
      dbtxtContaSIni.top      := 2;
      dbtxtCorrespSIni.top    := 2;
      dbtxtNomeContaSIni.top  := 2;
      dbtxtSaldosIni.Top      := 2;
      dbtxtSaldoDCSIni.Top    := 2;
   end;

   //Configura a máscara das contas contábeis
   if sMascara <> '' then begin
      //sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsSaldoInicial.FieldByName('PLAGRAU').asInteger);      //Everson Cunha - SIG102043
      sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaData, cdsSaldoInicial.FieldByName('PLAGRAU').asInteger);  //Everson Cunha - SIG102043
      dbtxtContaSIni.DisplayFormat := sMascara + ';0; ';
   end;

end;

procedure TrptSaldoInicial.ppFooterBand17BeforePrint(Sender: TObject);
begin
  inherited;
   lblContSaldoIni.Caption := IntToStr((iPagIni + StrToInt(lblCalcSaldoIni.text)) - 1);

end;

procedure TrptSaldoInicial.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[6].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   CmpRptCM.ParamValues[6].SpinEditSettings.Value    := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);

end;

procedure TrptSaldoInicial.CrmRptCMBeforePrint(Sender: TObject);
var
  sEspacos :string;
  i:integer;
  iGrau : Integer;

begin
  inherited;
  if not CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then  Exit;

  CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,DateToStr(CmpRptCM.ParamValues[12].AsDateTime));

   //==================================================================
   // Calcula grau
   //==================================================================
   Try
      iGrau:=CmpRptCM.ParamValues[6].AsInteger;
   Except
      iGrau:=0;
   End;

   If (iGrau=0) then
      iGrau:= FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   //==================================================================

  iPagIni  := CmpRptCM.ParamValues[11].AsInteger;

   sSintAnal := 'A';

   sTitulo := 'Saldos Iniciais do Exercício ' + CmpRptCM.ParamValues[0].asString;

   //Imprime os títulos
   pplblTituloSIni.caption := sTitulo;

   sTitulo := '';
   if trim(CmpRptCM.ParamValues[1].AsString) <> '' then begin
      sTitulo := sTitulo +  '     Conta Inicial : ' + trim(CmpRptCM.ParamValues[1].AsString);
   end;
   if trim(CmpRptCM.ParamValues[2].AsString) <> '' then begin
      sTitulo := sTitulo +  '     Conta Final : ' +   trim(CmpRptCM.ParamValues[2].AsString);
   end;

   pplblTituloSIni2.caption := sTitulo;

   //Configura a exibiçao da Conta Correspondente
   if CmpRptCM.ParamValues[7].AsBoolean then begin
      dbtxtCorrespSIni.visible := true;
      dbtxtContaSIni.visible   := false;
   end else begin
      dbtxtCorrespSIni.visible := false;
      dbtxtContaSIni.visible   := true;
   end;


   //Configura a quebra de página
   if CmpRptCM.ParamValues[4].AsBoolean then begin
      rptSaldoInicial.Groups[0].NewPage := true;
   end else begin
      rptSaldoInicial.Groups[0].NewPage := false;
   end;

   iNumero := FuncaoGeral.CalcNumEleGrau(modulo.sMascaraContas, 1);

   sMascara := '';
   if CmpRptCM.ParamValues[3].AsBoolean then begin
      sMascara := CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
      //sMascara := modulo.sMascaraContas;     //Everson Cunha - SIG102043
   end;

   bIndenta := CmpRptCM.ParamValues[8].AsBoolean;
   bEspaco  := CmpRptCM.ParamValues[9].AsBoolean;

   with sqlSaldoInicial do begin
      SQL.Clear;
      SQL.Add('SELECT                                                           ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
      SQL.Add('   '' '' as DEBCRESALDO,                                         ');
      SQL.Add('   0 AS SALDOABS,                                                ');
      SQL.Add('  ''                                                         '' AS NOMEINDENTADO, ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
      if CmpRptCM.ParamValues[5].AsBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,    ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
      end;
      SQL.Add('   SS.SALDO                                                      ');
      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S, PLANOCONTA C,                                   ');

      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToInt(CmpRptCM.ParamValues[0].AsString),CrmRptCM.IdEmpresa)+' PD, ');

      SQL.Add('   (SELECT                                                       ');
      SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
      SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          (PERNUMERO IS NULL) AND                                ');
      SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');
      SQL.Add('    GROUP BY PLACONTA ) SS                                       ');
      SQL.Add('                                                                 ');
      SQL.Add('WHERE                                                            ');
      SQL.Add('    ((S.PLANO(+) = C.PLANO) AND                                  ');
      SQL.Add('    (S.PLACONTA(+) = C.PLACONTA)) AND                            ');

      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA)  AND                           ');
      SQL.Add('    (PD.PLANO(+)    = C.PLANO)     AND                           ');

      SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                            ');
      if not CmpRptCM.ParamValues[10].AsBoolean then begin
         SQL.Add(' (SS.SALDO = 0) AND                                           ');
      end;
      SQL.Add('    (C.PLANO =:PLANO) AND                                        ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                          ');
      SQL.Add('    (S.PERNUMERO(+) IS NULL) AND                                 ');
      SQL.Add('    (C.PLAGRAU <=:GRAU) AND                                      ');
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                               ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                  ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM))                      ');
      SQL.Add('GROUP BY                                                         ');
      SQL.Add('    C.PLACONTA, SS.SALDO,                                        ');
      SQL.Add('    C.PLAGRAU, C.PLATIPO,                                        ');
      SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP                 ');
      SQL.Add('ORDER BY                                                         ');
      if CmpRptCM.ParamValues[7].AsBoolean then begin
         SQL.Add(' C.PLACONCORRESP                                              ');
      end else begin
         SQL.Add(' C.PLACONTA                                                   ');
      end;

      Prepare;

      ParamByName('GRAU').asInteger      := iGrau;
      ParamByName('PLANO').asInteger     := Modulo.iPlano;
      ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);

      if trim(CmpRptCM.ParamValues[1].AsString) <> '' then begin
         ParamByName('CONTAINI').asString := CmpRptCM.ParamValues[1].AsString;
      end else begin
         ParamByName('CONTAINI').asString := '0';
      end;
      //
      if trim(CmpRptCM.ParamValues[2].AsString) <> '' then begin
         ParamByName('CONTAFIM').asString := CmpRptCM.ParamValues[2].AsString;
      end else begin
         ParamByName('CONTAFIM').asString := '999999999999999999';
      end;

      Open;
   end;

   //*** simula o onclacfield ****
   cdsSaldoInicial.First;
   while not cdsSaldoInicial.Eof do begin
      cdsSaldoInicial.Edit;

      //Gera a label de débito/crédito
      if cdsSaldoInicial.FieldByName('SALDO').asFloat = 0 then begin
         cdsSaldoInicial.FieldByName('DEBCRESALDO').asString := ' ';
      end;
      if cdsSaldoInicial.FieldByName('SALDO').asFloat < 0 then begin
         cdsSaldoInicial.FieldByName('DEBCRESALDO').asString := 'C';
      end else begin
         cdsSaldoInicial.FieldByName('DEBCRESALDO').asString := 'D';
      end;

      //Tira o sinal dos saldos
      cdsSaldoInicial.FieldByName('SALDOABS').asFloat    := ABS(cdsSaldoInicial.FieldByName('SALDO').asFloat);

      //Indenta o Nome da Conta Contábil de acordo com o grau
      sEspacos:= '';

      if bIndenta then begin
         for i := 1 to ((cdsSaldoInicial.FieldByName('PLAGRAU').asInteger - 1) * 5) do begin
            sEspacos := sEspacos + ' ';
         end;
      end;

      cdsSaldoInicial.FieldByName('NOMEINDENTADO').asString := sEspacos + (cdsSaldoInicial.FieldByName('CONTA').asString);

      cdsSaldoInicial.Post;
      cdsSaldoInicial.Next;
   End;
   cdsSaldoInicial.First;
end;

procedure TrptSaldoInicial.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);


  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptSaldoInicial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptBalancete.free;
  CtrlContab.free;
  CtrlPeriodo.free;
end;

end.
