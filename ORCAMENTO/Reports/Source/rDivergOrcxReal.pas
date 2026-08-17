unit rDivergOrcxReal;
{----------------------------------------------------------------------------------------
  Autor     : Rodolpho da Silva
  Data      : 21/12/2006
  Pendência : 22175
  Descrição : Corrigir erro na filtragem do percentual
-----------------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  ppVar, ppCtrls, ppPrnabl, ppBands, ppDB, ppCache, ppDBPipe, ADODB,
  DBTables, uCtrlTransacoesPorGrupo, uCtrlPadroes, uSistema, uModulo,
  uDiasUteis, MontaSelect, ppModule, raCodMod, ppMemo, ppStrtch, ppSubRpt,
  ppParameter, ppRichTx;

type
  TRptDivergOrcxReal = class(TFrmCmReport)
    Cds: TCMClientDataSet;
    ppReport: TppReport;
    ppl: TppDBPipeline;
    ds: TDataSource;
    CdsLogo: TCMClientDataSet;
    dsLogo: TDataSource;
    pplLogo: TppDBPipeline;
    MsGrupoIni: TMontaSelect;
    MsGrupoFim: TMontaSelect;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDBImage1: TppDBImage;
    lbNomeEmpresa: TppLabel;
    ppLabel25: TppLabel;
    lbAdicionais: TppLabel;
    lbDetAdicionais: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel6: TppLabel;
    ppLabel12: TppLabel;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    lbSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel5: TppLabel;
    ppLabel23: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape3: TppShape;
    ppShape2: TppShape;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel15: TppLabel;
    ppLabel18: TppLabel;
    ppLabel21: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine3: TppLine;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppDBText59: TppDBText;
    ppLabel24: TppLabel;
    ppSubReport: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLine2: TppLine;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    raCodeModule2: TraCodeModule;
    lnDrilDraw: TppLine;
    ppLabel38: TppLabel;
    CdsDiverg: TCMClientDataSet;
    dsDiverg: TDataSource;
    pplDescDiv: TppDBPipeline;
    ppDBText1: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText60: TppDBText;
    ppLabel26: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure ppSubReportPrint(Sender: TObject);
  private
    { Private declarations }
     CtrlTransacoesPorGrupo : TCtrlTransacoesPorGrupo;
  public
    { Public declarations }
  end;

var
  RptDivergOrcxReal: TRptDivergOrcxReal;

implementation

{$R *.DFM}

procedure TRptDivergOrcxReal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);
  CdsLogo.Data := CtrlTransacoesPorGrupo.ListaImagem(Sistema.IdEmpresa);
  MsGrupoIni.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
  MsGrupoFim.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));


  // Preenche o lookup de c.custo
  CmpRptCM.ParamValues[11].LookupSettings.SQL.Add('SELECT');
  CmpRptCM.ParamValues[11].LookupSettings.SQL.Add('  CODCENTROCUSTO,');
  CmpRptCM.ParamValues[11].LookupSettings.SQL.Add('  NOME || '' - '' || TRIM(CODEXTERNO) AS NOME');
  CmpRptCM.ParamValues[11].LookupSettings.SQL.Add('FROM CENTCUST');
  CmpRptCM.ParamValues[11].LookupSettings.SQL.Add('WHERE  ATIVO = ''S''');
  CmpRptCM.ParamValues[11].LookupSettings.SQL.Add(' AND IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
  CmpRptCM.ParamValues[11].LookupSettings.SQL.Add('ORDER BY NOME');

  // Preenche o lookup de ATV/PROJETO
  CmpRptCM.ParamValues[12].LookupSettings.SQL.Add('SELECT');
  CmpRptCM.ParamValues[12].LookupSettings.SQL.Add('  UNIDNEGOC,NOME');
  CmpRptCM.ParamValues[12].LookupSettings.SQL.Add('FROM');
  CmpRptCM.ParamValues[12].LookupSettings.SQL.Add('  UNIDNEGOCIO');
  CmpRptCM.ParamValues[12].LookupSettings.SQL.Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  CmpRptCM.ParamValues[12].LookupSettings.SQL.Add('ORDER BY  NOME');

  // Preenche o lookup do planoprev
  CmpRptCM.ParamValues[13].LookupSettings.SQL.Add('SELECT');
  CmpRptCM.ParamValues[13].LookupSettings.SQL.Add('  IDPLANOPREV, NOME');
  CmpRptCM.ParamValues[13].LookupSettings.SQL.Add('FROM PLANPREVCONTABIL');
  CmpRptCM.ParamValues[13].LookupSettings.SQL.Add('WHERE ATIVO = ''S''');
  CmpRptCM.ParamValues[13].LookupSettings.SQL.Add('ORDER BY NOME');

  // Preenche o lookup da patrocinadora
  CmpRptCM.ParamValues[14].LookupSettings.SQL.Add('SELECT');
  CmpRptCM.ParamValues[14].LookupSettings.SQL.Add('  P.IDPESSOA, P.NOME');
  CmpRptCM.ParamValues[14].LookupSettings.SQL.Add('FROM');
  CmpRptCM.ParamValues[14].LookupSettings.SQL.Add('  PATRO PT, PESSOA P');
  CmpRptCM.ParamValues[14].LookupSettings.SQL.Add('WHERE');
  CmpRptCM.ParamValues[14].LookupSettings.SQL.Add('  (PT.IDPESSOA = P.IDPESSOA)');
  CmpRptCM.ParamValues[14].LookupSettings.SQL.Add('ORDER BY P.NOME');

  // Preenche o lookup do Centro de Responsabilidade
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('SELECT');
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('   CR.CODCENTRORESPON,');
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('   TRIM(CR.NOME) || '' - '' || TRIM(CR.CODEXTERNO) AS NOME');
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('FROM');
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('   CENTRESPON CR');
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('WHERE');
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('   EXISTS (SELECT PXC.CODCENTRORESPON');
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('           FROM PESSOAXCRESP PXC');
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('           WHERE (PXC.IDPESSOAACESSO  = ' + IntToStr(Sistema.IdUsuario) + ') AND');
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('                 (PXC.CODCENTRORESPON = CR.CODCENTRORESPON))');
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('ORDER BY');
  CmpRptCM.ParamValues[15].LookupSettings.SQL.Add('   NOME');

end;




procedure TRptDivergOrcxReal.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlTransacoesPorGrupo)
end;




procedure TRptDivergOrcxReal.CrmRptCMBeforePrint(Sender: TObject);
var
  sAux, sCampoFiltro: string;


begin
  inherited;
  Cds.Data := CtrlTransacoesPorGrupo.ListaDivergOrcxReal((CmpRptCM.ParamValues[4].AsInteger + 1),
                                                         (CmpRptCM.ParamValues[5].AsInteger + 1),
                                                          CmpRptCM.ParamValues[6].AsInteger,
                                                          Sistema.IdEmpresa,
                                                          Modulo.iPlanoOrc,
                                                          CmpRptCM.ParamValues[0].AsString,
                                                          CmpRptCM.ParamValues[1].AsString,
                                                          CmpRptCM.ParamValues[2].AsString,
                                                          CmpRptCM.ParamValues[3].AsString,
                                                          CmpRptCM.ParamValues[11].AsString,
                                                          CmpRptCM.ParamValues[15].AsString,
                                                          CmpRptCM.ParamValues[13].AsString,
                                                          CmpRptCM.ParamValues[14].AsString,
                                                          CmpRptCM.ParamValues[12].AsString);

  CdsDiverg.Data := CtrlTransacoesPorGrupo.ListaDescDiverg(Sistema.IdEmpresa,Modulo.iPlanoOrc,
                                                           CmpRptCM.ParamValues[6].AsInteger,
                                                          (CmpRptCM.ParamValues[4].AsInteger + 1),
                                                          (CmpRptCM.ParamValues[5].AsInteger + 1));


  lbAdicionais.Caption := 'Período de ' + CmpRptCM.ParamValues[4].DispalyText +
                          ' a '  + CmpRptCM.ParamValues[5].DispalyText +
                          ' de ' + CmpRptCM.ParamValues[6].DispalyText;

  ppSubReport.ExpandAll := CmpRptCM.ParamValues[16].AsBoolean;


  //======================================================================================
  // Seta a faixa de valores inicial
  //======================================================================================
  if CmpRptCM.ParamValues[9].AsFloat > 0 then
  begin
      if CmpRptCM.ParamValues[8].AsInteger = 0 then
         lbDetAdicionais.Caption := 'Variação (-) '
      else
         lbDetAdicionais.Caption := 'Variação (+) ';


      // (-) Variação negativa
      if CmpRptCM.ParamValues[8].AsInteger = 0 then
      begin
         // Faz a filtragem de acordo com a seleção, 0= Percetual; 1= Valor
         if CmpRptCM.ParamValues[7].AsInteger = 0 then
         begin
            sCampoFiltro            := 'PERCENTTOTAL';
            lbDetAdicionais.Caption := lbDetAdicionais.Caption + ' Percentual inicial: ' + FloatToStr(CmpRptCM.ParamValues[9].AsFloat * -1) + '%  ';
         end
         else
         begin
            sCampoFiltro            := 'DIFERENCATOTAL';
            lbDetAdicionais.Caption := lbDetAdicionais.Caption + ' Valor inicial: ' + FormatFloat('#,##0.00;-#,##0.00;',(CmpRptCM.ParamValues[9].AsFloat * -1));
         end;

         Cds.Filter := sCampoFiltro + ' >= ' + FloatToStr(CmpRptCM.ParamValues[9].AsFloat * -1);
      end
      else
      // (+) Variação positiva
      begin
         // Faz a filtragem de acordo com a seleção, 0= Percetual; 1= Valor
         if CmpRptCM.ParamValues[7].AsInteger = 0 then
         begin
            sCampoFiltro            := 'PERCENTTOTAL';
            lbDetAdicionais.Caption := lbDetAdicionais.Caption + ' Percentual inicial: ' + FloatToStr(CmpRptCM.ParamValues[9].AsFloat) + '%  ';
         end
         else
         begin
            sCampoFiltro            := 'DIFERENCATOTAL';
            lbDetAdicionais.Caption := lbDetAdicionais.Caption + ' Valor inicial: ' + FormatFloat('#,##0.00;-#,##0.00;',CmpRptCM.ParamValues[9].AsFloat);
         end;

         Cds.Filter := sCampoFiltro + ' >= ' + FloatToStr(CmpRptCM.ParamValues[9].AsFloat);
      end;
  end;

  
  //======================================================================================
  // Seta a faixa de valores final
  //======================================================================================
  if CmpRptCM.ParamValues[10].AsFloat > 0 then
  begin
      if CmpRptCM.ParamValues[8].AsInteger = 0 then
      begin
         if trim(lbDetAdicionais.Caption) = '' then
            lbDetAdicionais.Caption := 'Variação (-) '
      end
      else
      begin
         if trim(lbDetAdicionais.Caption) = '' then
            lbDetAdicionais.Caption := 'Variação (+) ';
      end;

      sAux := '';
      if Trim(Cds.Filter) <> '' then
         sAux := ' AND ';

      // (-) Variação negativa
      if CmpRptCM.ParamValues[8].AsInteger = 0 then
      begin
         // Faz a filtragem de acordo com a seleção, 0= Percetual; 1= Valor
         if CmpRptCM.ParamValues[7].AsInteger = 0 then
         begin
            sCampoFiltro            := 'PERCENTTOTAL';
            lbDetAdicionais.Caption := lbDetAdicionais.Caption + ' Percentual final: ' + FloatToStr(CmpRptCM.ParamValues[10].AsFloat * -1) + '%  ';
         end
         else
         begin
            sCampoFiltro            := 'DIFERENCATOTAL';
            lbDetAdicionais.Caption := lbDetAdicionais.Caption + ' Valor final: ' + FormatFloat('#,##0.00;-#,##0.00',(CmpRptCM.ParamValues[10].AsFloat * -1));
         end;

         Cds.Filter := Cds.Filter + sAux + ' ' + sCampoFiltro + ' <= ' + FloatToStr(CmpRptCM.ParamValues[10].AsFloat * -1);
      end
      else
      // (+) Variação positiva
      begin
         // Faz a filtragem de acordo com a seleção, 0= Percetual; 1= Valor
         if CmpRptCM.ParamValues[7].AsInteger = 0 then
         begin
            sCampoFiltro            := 'PERCENTTOTAL';
            lbDetAdicionais.Caption := lbDetAdicionais.Caption + ' Percentual final: ' + FloatToStr(CmpRptCM.ParamValues[10].AsFloat) + '%  ';
         end
         else
         begin
            sCampoFiltro            := 'DIFERENCATOTAL';
            lbDetAdicionais.Caption := lbDetAdicionais.Caption + ' Valor final: ' + FormatFloat('#,##0.00;-#,##0.00',(CmpRptCM.ParamValues[10].AsFloat));
         end;

         Cds.Filter := Cds.Filter + sAux + ' ' + sCampoFiltro + ' <= ' + FloatToStr(CmpRptCM.ParamValues[10].AsFloat);
      end;
  end;


  Cds.Filtered := true;

end;




procedure TRptDivergOrcxReal.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  with TDiasUteis.Create do
  try
     CmpRptCM.ParamValues[6].TextDefault := IntToStr(ExtraiAno(Now));
  finally
     Free;
  end;
end;




procedure TRptDivergOrcxReal.ppSubReportPrint(Sender: TObject);
begin
  inherited;
  CdsDiverg.Filtered := False;
  CdsDiverg.Filter   := 'IDCONTAORCAMEN = ' + QuotedStr(Cds.FieldByName('IDCONTAORCAMEN').AsString);
  CdsDiverg.Filtered := True;
end;

end.
