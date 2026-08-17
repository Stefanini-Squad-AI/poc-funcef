unit rConfSubConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, uCmRptManager, TXComp, CmParamReport,uCmSqlParams, uCtrlRptBalancete,
  ppBands, ppClass, ppVar, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppCache,uCtrlPeriodo,
  ppProd, ppReport, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, mask,
  DBClient, Provider, ADODB, uSistema,uCMfileUtils,uCtrlParamIntegra,
  uCMClientDataSet, FCmReport;

type
  TrptConfSubConta = class(TFrmCmReport)
    dsConfSubConta: TwwDataSource;
    pplConfSubConta: TppBDEPipeline;
    pplConfSubContappField1: TppField;
    pplConfSubContappField2: TppField;
    pplConfSubContappField3: TppField;
    pplConfSubContappField4: TppField;
    pplConfSubContappField5: TppField;
    pplConfSubContappField6: TppField;
    pplConfSubContappField7: TppField;
    pplConfSubContappField8: TppField;
    pplConfSubContappField9: TppField;
    pplConfSubContappField10: TppField;
    pplConfSubContappField11: TppField;
    pplConfSubContappField12: TppField;
    pplConfSubContappField13: TppField;
    pplConfSubContappField14: TppField;
    pplConfSubContappField15: TppField;
    pplConfSubContappField16: TppField;
    pplConfSubContappField17: TppField;
    pplConfSubContappField18: TppField;
    pplConfSubContappField19: TppField;
    rptConfSubConta: TppReport;
    ppHeaderBand3: TppHeaderBand;
    pplblTituloConfSubConta: TppLabel;
    ppLine8: TppLine;
    LblEmpresa: TppLabel;
    ppLabel10: TppLabel;
    ppLine10: TppLine;
    ppLabel12: TppLabel;
    ppLabel19: TppLabel;
    pplblTituloConfSubConta2: TppLabel;
    rptPlanilhasLabel9: TppLabel;
    rptPlanilhasLabel11: TppLabel;
    rptPlanilhasLabel12: TppLabel;
    rptPlanilhasLabel1: TppLabel;
    rptConfSubContaLabel1: TppLabel;
    bndDetConfSubConta: TppDetailBand;
    dbtxtContaConfSubConta: TppDBText;
    ppDBText2: TppDBText;
    rptPlanilhasDBMemo1: TppDBMemo;
    rptPlanilhasDBText11: TppDBText;
    rptPlanilhasDBText8: TppDBText;
    rptPlanilhasDBText1: TppDBText;
    rptPlanilhasDBText2: TppDBText;
    rptPlanilhasDBText10: TppDBText;
    ppFooterBand3: TppFooterBand;
    LBLSISTEMA: TppLabel;
    ppCalc8: TppSystemVariable;
    rptConfSubContaCalc1: TppSystemVariable;
    sqlConfSubconta: TCMSqlParams;
    cdsConfSubConta: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure bndDetConfSubContaBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlRptBalancete :TCtrlRptBalancete;
    CtrlPeriodo     :TCtrlPeriodo;
    { Private declarations }
    sMascara,sTitulo :string;
    function  VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;

  public
    { Public declarations }
  end;

var
  rptConfSubConta: TrptConfSubConta;

implementation

uses uCtrlPadroes,UMensErro, uDatabase, DBaseDados, uModulo, uFuncaoGeral;

{$R *.DFM}

{ TFrmCmReport1 }

function TrptConfSubConta.VerificaDatas(dDataIni,
  dDataFim: TDateTime): boolean;
begin
   result := true;

   if dDataFim < dDataIni then begin
      MsgDlg('A Data Final deve ser maior ou igual que a Data Inicial.','Erro',mtError,[mbOk],0);
      result := false;
   end;

end;

procedure TrptConfSubConta.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
   if not ((CmpRptCM.ParamValues[1].AsString = '') or (CmpRptCM.ParamValues[2].AsString = '')) then begin

     if VerificaDatas(CmpRptCM.ParamValues[1].AsDateTime, CmpRptCM.ParamValues[2].AsDateTime) then begin

          if CmpRptCM.ParamValues[10].AsString = '' then begin

             sTitulo := 'Conferência de Lançamentos sem Sub-Conta - período de ' + CmpRptCM.ParamValues[1].AsString + ' a ' + CmpRptCM.ParamValues[2].AsString;
             pplblTituloConfSubConta.caption := sTitulo;

             sTitulo := '';

             if CmpRptCM.ParamValues[5].AsInteger <> 0 then begin
                with sqlTitulos do begin
                    SQL.Clear;
                    SQL.Add('SELECT NOMEMODULO FROM  MODULO ');
                    SQL.Add('WHERE (IDMODULO = '+IntToStr(CmpRptCM.ParamValues[5].asInteger)+') ');
                    Open;
                end;
                sTitulo := sTitulo +  'Módulo : ' + cdsTitulos.FieldByName('NOMEMODULO').asString;
             end;

             if CmpRptCM.ParamValues[6].AsString <> '' then begin
                with sqlTitulos do begin
                    SQL.Clear;
                    SQL.Add('SELECT TIPDESCRICAO FROM TIPOPER ');
                    SQL.Add('WHERE (TIPCODIGO = ' +CmpRptCM.ParamValues[6].AsString+') ');
                    Open;

                end;
                sTitulo := sTitulo +  '     Tipo de Operação : ' + cdsTitulos.FieldByName('TIPDESCRICAO').asString;
             end;

             case CmpRptCM.ParamValues[7].AsInteger of
                0: sTitulo := sTitulo +  '    Lançamentos : TODOS';
                1: sTitulo := sTitulo +  '    Lançamentos : Somente Integrados';
                2: sTitulo := sTitulo +  '    Lançamentos : Somente NÃO Integrados';
             end;
             pplblTituloConfSubConta2.caption := sTitulo;
          end else begin
             pplblTituloConfSubConta.caption  := CmpRptCM.ParamValues[10].AsString;
             pplblTituloConfSubConta2.caption := CmpRptCM.ParamValues[11].AsString;
          end;

          //Configura a máscara das contas contábeis
          if CmpRptCM.ParamValues[8].AsBoolean then begin
             sMascara := ParamIntegra.MascaraPlano;
          end;

         if not CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,DateToStr(CmpRptCM.ParamValues[1].AsDateTime)) then begin
            Abort;
         end;

          //Faz a query
          With sqlConfSubconta do begin
             SQL.Clear;
             SQL.Add('SELECT                                                                             ');
             SQL.Add('   L.PLACONTA, P.PLNCODIGO, P.PLNPLANIL, P.PLNDATDIA, M.NOMEMODULO, C.PLASUBCONTA, ');
             SQL.Add('   L.LACNUMLAN, C.PLAGRAU, L.LACVALOR, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, L.LACDEBCRE,                     ');
             SQL.Add('   (RTRIM(L.LACHIST1)||'' ''||RTRIM(L.LACHIST2)||'' ''||                           ');
             SQL.Add('    RTRIM(L.LACHIST3)||'' ''||RTRIM(L.LACHIST4)||'' ''||RTRIM(L.LACHIST5)) AS HISTORICO, ');
             SQL.Add('   P.PLNNUMLAN, P.PLNEFETIVADO                                                     ');
             SQL.Add('FROM                                                                               ');
             SQL.Add('   LANCAMENTO L, PLANILHA P, PLANOCONTA C, MODULO M,                               ');

             SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD ');

             SQL.Add('WHERE                                                                              ');
             SQL.Add('   (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                                 ');
             SQL.Add('   (P.PEREXERCICIO =:EXERCICIO) AND                                                ');
             SQL.Add('   (P.IDPESSOA =:IDPESSOA) AND                                                     ');
             if CmpRptCM.ParamValues[3].AsString <> '' then begin
                SQL.Add('(P.PLNPLANIL >=:PLNPLANILINI) AND                                               ');
             end;
             if CmpRptCM.ParamValues[4].AsString <> '' then begin
                SQL.Add('(P.PLNPLANIL <=:PLNPLANILFIM) AND                                               ');
             end;
             if CmpRptCM.ParamValues[7].AsInteger = 1 then begin
                SQL.Add('(P.PLNEFETIVADO = ''S'') AND                                                    ');
             end;
             if CmpRptCM.ParamValues[7].AsInteger = 2 then begin
                SQL.Add('((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND                      ');
             end;
             if CmpRptCM.ParamValues[5].AsInteger <> 0 then begin
                SQL.Add('(L.IDMODULO =:MODULO ) AND                                                      ');
             end;
             if CmpRptCM.ParamValues[6].AsString <> '' then begin
                SQL.Add('(L.TIPCODIGO =:TIPO ) AND                                ');
             end;
             SQL.Add('((L.PLANO = C.PLANO) AND                                    ');
             SQL.Add('(L.PLACONTA = C.PLACONTA)) AND                              ');

             SQL.Add(' (PD.PLACONTA(+) = C.PLACONTA) AND                          ');
             SQL.Add(' (PD.PLANO(+)    = C.PLANO) AND                             ');

             SQL.Add('(P.IDMODULO = M.IDMODULO) AND                                                      ');
             SQL.Add('(P.PLNCODIGO = L.PLNCODIGO) AND                                                    ');
             SQL.Add('((C.PLASUBCONTA = ''S'') AND ((L.CODSUBCONTA = 0) OR (L.CODSUBCONTA IS NULL)))     ');
             if CmpRptCM.ParamValues[9].AsInteger = 0 then begin
                SQL.Add('ORDER BY P.PLNPLANIL, P.PLNDATDIA, L.LACNUMLAN                                  ');
             end else begin
                SQL.Add('ORDER BY P.PLNDATDIA, P.PLNPLANIL, L.LACNUMLAN                                  ');
             end;
             Prepare;

             ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
             ParamByName('DATAINI').asDate      := StrToDate(CmpRptCM.ParamValues[1].AsString);
             ParamByName('DATAFIM').asDate      := StrToDate(CmpRptCM.ParamValues[2].AsString);
             ParamByName('EXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);

             if CmpRptCM.ParamValues[3].AsString <> '' then begin
                ParamByName('PLNPLANILINI').asInteger := StrToInt(CmpRptCM.ParamValues[3].AsString);
             end;

             if CmpRptCM.ParamValues[4].AsString <> '' then begin
                ParamByName('PLNPLANILFIM').asInteger := StrToInt(CmpRptCM.ParamValues[4].AsString);
             end;

             if CmpRptCM.ParamValues[5].AsInteger <> 0 then begin
                ParamByName('MODULO').asInteger := CmpRptCM.ParamValues[5].AsInteger;
             end;
             if CmpRptCM.ParamValues[6].AsString <> '' then begin
                ParamByName('TIPO').asInteger := StrToInt(CmpRptCM.ParamValues[6].AsString);
             end;
             Open;
          End;
       End;
    End;

end;

procedure TrptConfSubConta.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[1].AsDateTime:=Now;
   CmpRptCM.ParamValues[2].AsDateTime:=Now;

end;

procedure TrptConfSubConta.bndDetConfSubContaBeforePrint(Sender: TObject);
begin
  inherited;
   //Configura a máscara das contas contábeis
   if (sMascara <> '') then begin
      sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, FuncaoGeral.CalcGrau(modulo.sMascaraContas, cdsConfSubConta.FieldByName('PLACONTA').asString));
      dbtxtContaConfSubConta.DisplayFormat := sMascara + ';0; ';
   end;

end;

procedure TrptConfSubConta.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptConfSubConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptBalancete.free;
  CtrlPeriodo.free;
end;

end.
