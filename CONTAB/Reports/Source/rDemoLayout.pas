unit rDemoLayout;
{-------------------------------------------------------------------------------
   Data      : 22/11/2005
   Autor     : Rodolpho da Silva
   Pendência : 20809
   Descrição : Ao marcar a opção "Desconsiderar o Encerramento das Contas de
               Resultado" o sistema não está trazendo os lançamentos das contas
               contábeis do exercício anterior.
-------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport,
  pptypes,uCtrlContab,uCtrlRptDemonstrativo, StdCtrls, ComCtrls, TXRB;

type
  TrptDemoLayout = class(TFrmCmReport)
    dsDemoLayout: TwwDataSource;
    pplDemoLayout: TppBDEPipeline;
    rptDemoLayout: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand13: TppFooterBand;
    lblsistema: TppLabel;
    ppLine34: TppLine;
    rptDemoLayoutLabel1: TppLabel;
    rptDemoLayoutLabel2: TppLabel;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
    sqlDemoAux: TCMSqlParams;
    cdsDemoAux: TCMClientDataSet;
    sqlTipoLayout: TCMSqlParams;
    cdsTipoLayout: TCMClientDataSet;
    cdsDemoLayout: TCMClientDataSet;
    cdsReport: TCMClientDataSet;
    sqlReport: TCMSqlParams;
    mmAchaTroca: TRichEdit;
    cdsPerAux: TCMClientDataSet;
    sqlPerAux: TCMSqlParams;
    cdsPeriodoAtu: TCMClientDataSet;
    sqlPeriodoAtu: TCMSqlParams;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rptDemoLayoutLabel1Print(Sender: TObject);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
   CtrlRptDemonstrativo :TCtrlRptDemonstrativo;
   CtrlContab :TCtrlContab;

   iPagIni,iPlano :integer;
   sDataPap, sTipoLayout,sDataIni,sPacTipoPerResult,sDataFimAtu,sTipoOperResult,sNomeExerc :string;

   procedure SetaDataPipeline(sNomePipeline,sNomeFormConfig,sNomePipelineConfig: String; Var Memo: TRichEdit);

  public
    { Public declarations }
  end;

var
  rptDemoLayout: TrptDemoLayout;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,uModeloRelatCM,
     uModulo, uData, uFuncaoGeral;

{$R *.DFM}

procedure TrptDemoLayout.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[11].SpinEditSettings.Value := 1;

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



   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text:= 'SELECT                                                         '+
                                                     '  (D.DEMDESCDEMONSTRAT||'' - ''||L.NOMELAYOUT) AS NOMEDESENHO, '+
                                                     '   L.IDDESENHODEMO, L.IDDEMONSTRATIVO, L.NOMELAYOUT,           '+
                                                     '   L.FLGTIPOLAYOUT, L.IDREPORTS, L.ORIGEMCM,L.IDDEMONSTRATIVO  '+
                                                     'FROM DEMONSTRATIVO D, DESENHODEMO L                            '+
                                                     'WHERE (D.IDDEMONSTRATIVO = L.IDDEMONSTRATIVO)  AND             '+
                                                     '      (D.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+')        '+
                                                     'ORDER BY   NOMEDESENHO ';

   CmpRptCM.ParamValues[5].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';


   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';


end;

procedure TrptDemoLayout.CrmRptCMBeforePrint(Sender: TObject);
begin
    if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
    begin
       sPacTipoPerResult := CtrlContab.TipoOpEncer;
    end else
    begin
       sPacTipoPerResult := '';
    end;
   iPlano :=  CmpRptCM.ParamValues[18].AsInteger;


   iPagIni := CmpRptCM.ParamValues[11].AsInteger;

  //================== pega a data inicial do exercicio atual ==================
   sqlPerAux.Prepare;
   sqlPerAux.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlPerAux.ParamByName('PEREXERCICIO').asInteger := Year(Date);
   sqlPerAux.Open;
   sDataIni     := DateToStr((cdsPerAux.FieldByName('PERDATINI').asDateTime-1));

   //===== pega dados do exercicio anterior para testar cotacao da moeda =======
   sqlPeriodoAtu.Prepare;
   sqlPeriodoAtu.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlPeriodoAtu.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
   sqlPeriodoAtu.Open;
   sDataFimAtu := DateToStr(cdsPeriodoAtu.FieldByName('PERDATFIM').asDateTime);
   //==========================================================================

   //==== pega dados do demonstrativo, salto de pagina,titulos, etc..=====
   sqlDemoAux.Prepare;
   sqlDemoAux.ParamByName('IDDEMO').asInteger:=StrToInt(CmpRptCM.ParamValues[3].AsString);
   sqlDemoAux.Open;
   //=====================================================================

   sTipoOperResult := CtrlRptDemonstrativo.RetornaTipoOperResult(Sistema.IdEmpresa);


   //=========================== pega o tipo do Demolayout ===============
   sqlTipoLayout.Prepare;
   sqlTipoLayout.ParamByName('IDDEMONSTRATIVO').asInteger :=StrToInt(CmpRptCM.ParamValues[3].AsString);
   sqlTipoLayout.ParamByName('IDREPORTS').asInteger :=StrToInt(CmpRptCM.ParamValues[19].AsString);

   sqlTipoLayout.Open;
   sTipoLayout := cdsTipoLayout.FieldByName('FLGTIPOLAYOUT').asString;
   //=====================================================================

   {ao entrar com os dados,observar que se o tipo de layout  for do tipo 1,
    ou seja normal, deve-se desconsiderar o encerramento das contas de resultado }

   //====== monta os sql de acordo com o tipo de layout ======
   case sTipoLayout[1] of
      '1' : begin
               if CtrlRptDemonstrativo.MontaSqlDemoNormal(cdsDemoAux.FieldByName('IDDEMONSTRATIVO').asInteger,
                                                          iPlano,StrToInt(CmpRptCM.ParamValues[0].AsString),
                                                          StrToInt(CmpRptCM.ParamValues[1].AsString),StrToInt(CmpRptCM.ParamValues[2].AsString),
                                                          cdsDemoAux.FieldByName('DEMNATUREZA').AsString,
                                                          CmpRptCM.ParamValues[5].AsString,
                                                          CmpRptCM.ParamValues[6].AsString,
                                                          sTipoOperResult,sDataIni,
                                                          CmpRptCM.ParamValues[7].AsString,
                                                          CmpRptCM.ParamValues[8].AsString,
                                                          CmpRptCM.ParamValues[9].AsString,
                                                          CmpRptCM.ParamValues[10].AsString,
                                                          CmpRptCM.ParamValues[17].AsString,
                                                          CrmRptCM.IdEmpresa,
                                                          CmpRptCM.ParamValues[14].AsBoolean,
                                                          CmpRptCM.ParamValues[15].AsBoolean,
                                                          CmpRptCM.ParamValues[16].AsBoolean) then

               begin
                  sDataPap := 'ppConsulta';
               end else
               begin
                  exit;
               end;
            end;

      '2' : begin
               if CtrlRptDemonstrativo.MontaSqlDemoColunado(cdsDemoAux.FieldByName('IDDEMONSTRATIVO').asInteger,
                                             iPlano,
                                             StrToInt(CmpRptCM.ParamValues[0].AsString),
                                             StrToInt(CmpRptCM.ParamValues[1].AsString),
                                             StrToInt(CmpRptCM.ParamValues[2].AsString),
                                             CmpRptCM.ParamValues[12].AsInteger,
                                             cdsDemoAux.FieldByName('DEMNATUREZA').AsString,
                                             CmpRptCM.ParamValues[10].AsString,
                                             CmpRptCM.ParamValues[9].AsString,
                                             CmpRptCM.ParamValues[7].AsString,
                                             CmpRptCM.ParamValues[6].AsString,
                                             CmpRptCM.ParamValues[5].AsString,
                                             CmpRptCM.ParamValues[17].AsString,
                                             CrmRptCM.IdEmpresa,
                                             CmpRptCM.ParamValues[13].AsBoolean,
                                             CmpRptCM.ParamValues[14].AsBoolean) then

               begin
                  sDataPap := 'pplDemoColunado';
               end else
               begin
                  exit;
               end;
            end;

      '3' : begin
               if CtrlRptDemonstrativo.MontaSqlDemoColMes(cdsDemoAux.FieldByName('IDDEMONSTRATIVO').asInteger,
                                                           StrToInt(CmpRptCM.ParamValues[0].AsString),
                                                           StrToInt(CmpRptCM.ParamValues[1].AsString),
                                                           StrToInt(CmpRptCM.ParamValues[2].AsString),
                                                           CrmRptCM.IdEmpresa,
                                                           cdsDemoAux.FieldByName('DEMNATUREZA').AsString,
                                                           CmpRptCM.ParamValues[5].AsString,
                                                           CmpRptCM.ParamValues[6].AsString,
                                                           sDataFimAtu,
                                                           CmpRptCM.ParamValues[9].AsString,
                                                           CmpRptCM.ParamValues[10].AsString,
                                                           CmpRptCM.ParamValues[7].AsString,
                                                           CmpRptCM.ParamValues[8].AsString,
                                                           CmpRptCM.ParamValues[17].AsString,
                                                           CmpRptCM.ParamValues[14].AsBoolean) then
               begin
                  sDataPap := 'pplDemoColMes';
               end else
               begin
                  exit;
               end;
            end;

      '4' : begin
               if CtrlRptDemonstrativo.MontaSqlDemoBalPatr(cdsDemoAux.FieldByName('IDDEMONSTRATIVO').asInteger,
                                                         iPlano,
                                                         StrToInt(CmpRptCM.ParamValues[0].AsString),
                                                         StrToInt(CmpRptCM.ParamValues[1].AsString),
                                                         StrToInt(CmpRptCM.ParamValues[2].AsString),
                                                         CrmRptCM.IdEmpresa,
                                                         cdsDemoAux.FieldByName('DEMNATUREZA').AsString,
                                                         CmpRptCM.ParamValues[5].AsString,
                                                         CmpRptCM.ParamValues[6].AsString,
                                                         CmpRptCM.ParamValues[9].AsString,
                                                         CmpRptCM.ParamValues[10].AsString,
                                                         CmpRptCM.ParamValues[7].AsString,
                                                         CmpRptCM.ParamValues[8].AsString,
                                                         sDataFimAtu,
                                                         CmpRptCM.ParamValues[17].AsString,
                                                         CmpRptCM.ParamValues[14].AsBoolean) then
               begin
                   sDataPap := 'pplDemoBalPatr';
               end else
               begin
                  exit;
               end;
            end;
   end;

   sqlReport.Prepare;
   sqlReport.ParamByName('PIDREPORTS').asInteger := cdsTipoLayout.FieldByName('IDREPORTS').AsInteger;
   sqlReport.ParamByName('PORIGEMCM').asInteger  := cdsTipoLayout.FieldByName('ORIGEMCM').AsInteger;
   sqlReport.Open;
   mmAchaTroca.Lines.Clear;
   mmAchaTroca.Lines.Text := cdsReport.FieldByName('TEMPLATE').AsString;
   SetaDataPipeline('pplDemoLayout','rptDemoLayout',sDataPap,mmAchaTroca);
   mmAchaTroca.Lines.SaveToFile(Sistema.TempDir + ArqCmDefault);
   rptDemoLayout.Template.FileName := Sistema.TempDir + ArqCmDefault;
   rptDemoLayout.Template.LoadFromFile;
   inherited;

   //=========================== pega o template =========================


end;

procedure TrptDemoLayout.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptDemonstrativo := TCtrlRptDemonstrativo.Create;
  CtrlRptDemonstrativo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptDemonstrativo.cdsDemoLayoutTipo := cdsDemoLayout;

end;

procedure TrptDemoLayout.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptDemonstrativo.free;
  CtrlContab.free;
end;

procedure TrptDemoLayout.SetaDataPipeline(sNomePipeline,
  sNomeFormConfig, sNomePipelineConfig: String; var Memo: TRichEdit);
Var
  iSelPos: Integer;
Begin
    iSelPos := Pos(sNomeFormConfig + '.' +sNomePipelineConfig, Memo.Lines.Text);
    If iSelPos = 0 Then
    Begin
      iSelPos := Pos(sNomePipelineConfig, Memo.Lines.Text);
      While iSelPos > 0 Do
      begin
        Memo.SelStart  := iSelPos - 1;
        Memo.SelLength := Length(sNomePipelineConfig);
        Memo.SelText   := sNomePipeline;
        iSelPos := Pos(sNomePipelineConfig, Memo.Lines.Text);
      End;
    End
    Else
    Begin
      While iSelPos > 0 Do
      begin
        Memo.SelStart   := iSelPos - 1;
        Memo.SelLength := Length(sNomeFormConfig + '.' +sNomePipelineConfig);
        Memo.SelText   := sNomePipeline;
        iSelPos := Pos(sNomeFormConfig + '.' +sNomePipelineConfig, Memo.Lines.Text);
      End;
    End;

end;

procedure TrptDemoLayout.rptDemoLayoutLabel1Print(Sender: TObject);
begin
  inherited;
  rptDemoLayoutLabel1.Caption := IntToStr((iPagIni + StrToInt(ppCalc25.text)) - 1);

end;

procedure TrptDemoLayout.CmpRptCMParamControlEnter(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      1: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter   := 'PEREXERCICIO = '+IntToStr(StrToIntDef(sNomeExerc,0));
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
      2: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter   := 'PEREXERCICIO = '+IntToStr(StrToIntDef(sNomeExerc,0));
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
   end;

end;

procedure TrptDemoLayout.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

end.
