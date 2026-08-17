{---------------------------------------------------------------------------------
Rotina    : ppObra (passSetting)
Data      : 14/03/2017
Autor     : Edilaine
SIG       : 41804
Descrição : Preview com export migrado da CmForms para CmCompo e novo método CREATE
            para tratar apresentação de relatorios pela herança do CmRptManager
---------------------------------------------------------------------------------
Rotina..........: MontaQuerySegregacao, ppSubReport1Print, ppSubReport2Print
N. Sol..........: 126313
N. Kintana......: 660139
Data............: 11/01/2010
Responsável.....: Marilza Colpani
Descrição.......: Ajuste no relatório Lançamentos de Obras para que no mesmo
                  informe o rateio entre os planos de benefícios.
--------------------------------------------------------------------------------
Rotina..........: MontaQuerySegregacao, ppSubReport1Print, ppSubReport2Print
N. Sol..........: 131914
N. Kintana......: 758687
Data............: 09/03/2010
Responsável.....: Felipe de Oliveira
Descrição.......: Ajuste no relatório Lançamentos de Obras para que no mesmo
                  informe o rateio entre os planos de benefícios para a data de vigência
                  mais perto da data informada na tela
--------------------------------------------------------------------------------}

unit dRelObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppModule, raCodMod, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, ppStrtch, ppRegion, uCtrlRelInvestimob, ppSubRpt, ppParameter,
  TXRB, DBTables, Wwquery, Wwdatsrc, uCMMath;

type
  TdtmRelObra = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppObra: TppReport;
    qrySegreg: TwwQuery;
    pplSegregObra: TppDBPipeline;
    pplObra: TppBDEPipeline;
    dsSegregObra: TwwDataSource;
    qrySegregIDIMOVEL: TFloatField;
    qrySegregPATRO: TStringField;
    qrySegregPLANOPREV: TStringField;
    qrySegregVALOR: TFloatField;
    updSegregObra: TUpdateSQL;
    ppHeaderBand1: TppHeaderBand;
    lblTitulo: TppLabel;
    lblEmpresa: TppLabel;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    pptImovel: TppDBText;
    ppDBText4: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppRegion1: TppRegion;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppDBText9: TppDBText;
    ppLabel5: TppLabel;
    ppDBText10: TppDBText;
    ppLabel2: TppLabel;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLabel12: TppLabel;
    gfbMestre: TppGroupFooterBand;
    ppOrcamentoLine2: TppLine;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine3: TppLine;
    ppLabel19: TppLabel;
    ppLine6: TppLine;
    ppDetailBand3: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel11: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel18: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    qrySegregPERCENTRATEIO: TFloatField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
    //Marilza Colpani SOL 126313/KTN 660139 - Início
    //Felipe de Oliveira SOL 131914 /KTN 758687 - Início
    //acrescentando o parâmetro data nas chamadas da procedure montaquery
    procedure ppSubReport1Print(Sender: TObject);
    procedure ppSubReport2Print(Sender: TObject);
    //Felipe de Oliveira SOL 131914 /KTN 758687 - Fim
    //Marilza Colpani SOL 126313/KTN 660139 - Fim
  private
    { Private declarations }
    CtrlRelInvestimob     : TCtrlRelInvestimob;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
    //Marilza Colpani SOL 126313/KTN 660139
    //Felipe de Oliveira SOL 131914 /KTN 758687 - Início
    // acrescentado o campo dDataVigencia a procedure
    procedure MontaQuerySegregacao(iIDImovel, iIdPatro, iIdPlanoPrev : Integer ; dDataVigencia : TDateTime );

  public
    { Public declarations }
  end;

var
  dtmRelObra: TdtmRelObra;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelObra.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer; 
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelInvestimob := TCtrlRelInvestimob.Create;
  CtrlRelInvestimob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelInvestimob.BuscaRelLancObra(Sistema.IdEmpresa,
                                                 CmpRptCM.ParamValues[0].AsInteger,   // idObra
                                                 CmpRptCM.ParamValues[1].AsDateTime,  // Data Limite
                                                 CmpRptCM.ParamValues[2].AsBoolean);  // Apenas Ativas

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[5].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelObra.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlRelInvestimob );
  inherited;
end;

procedure TdtmRelObra.ppsCorPrint(Sender: TObject);
begin
  inherited;
  if bCorLinha then begin
     if CorAtual = clWhite then begin
        CorAtual := CorLinha;
     end else begin
        CorAtual := clWhite;
     end;
  end else begin
     CorAtual := clWhite;
  end;
  (Sender as TppShape).Brush.Color := CorAtual;
end;

procedure TdtmRelObra.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;
//Felipe de Oliveira SOL /KTN  - Início
procedure TdtmRelObra.MontaQuerySegregacao(iIDImovel, iIdPatro, iIdPlanoPrev: Integer ; dDataVigencia : TDateTime);
var
  sSQL, sParam : string;
begin
  sParam := '';
  if (iIdPatro <> -1) or (iIdPlanoPrev <> -1) then
  begin
    sParam := '  AND EXISTS (SELECT 1 ' + #13 +
                          '               FROM PLANOPATROXVIGENCIAIMOB PPI, ' + #13 +
                          '                    IMOVEL IM   ' + #13 +
                          '              WHERE IM.IDIMOVEL = PPI.IDIMOVEL ';
    if iIdPatro <> -1 then
    sParam := sParam + ' AND PPI.IDPATRO = ' + IntToStr(iIdPatro)   +#13;

    if (iIdPlanoPrev <> -1) then
      sParam := sParam +  'AND PPI.IDPLANOPREV = '+ IntToStr(iIdPlanoPrev);
    sParam := sParam + ')';
  end;

  sSQL := 'SELECT PPVI.IDIMOVEL,                   ' + #13 +
          '       PES.NOME AS PATRO,               ' + #13 +
          '       PPC.NOME AS PLANOPREV,           ' + #13 +
          '       PPVI.PERCENTRATEIO,              ' + #13 +
          '       0 AS VALOR                       ' + #13 +
          '  FROM PLANOPATROXVIGENCIAIMOB PPVI,    ' + #13 +
          '       PESSOA PES,                      ' + #13 +
          '       PLANPREVCONTABIL PPC             ' + #13 +
          ' WHERE PPVI.IDIMOVEL   =                ' + IntToStr(iIDImovel) + #13 +
          '  AND DATAVIGENCIA     =                ' + #13 +
          '      (SELECT MAX(PPB.DATAVIGENCIA) FROM   ' + #13 +
          '               PLANOPATROXVIGENCIAIMOB PPB ' + #13 +
          '               WHERE PPB.IDIMOVEL =            ' + IntToStr(iIDImovel) + #13 +
          '                 AND PPB.DATAVIGENCIA <=  ' + QuotedStr(DatetoStr(dDataVigencia)) +')' + #13 +
          '  AND PPVI.IDPATRO     = PES.IDPESSOA      ' + #13 +
          '  AND PPVI.IDPLANOPREV = PPC.IDPLANOPREV   ' + #13 +   sParam +
          'ORDER BY PPVI.PERCENTRATEIO DESC           ';



  qrySegreg.Close;
  qrySegreg.SQL.Clear;
  qrySegreg.SQL.Add(sSQL);
  qrySegreg.Open;
end;

procedure TdtmRelObra.ppSubReport1Print(Sender: TObject);
var
  fValorPlano, fValorTotal : Currency;
  i : integer;
begin
  inherited;
  fValorPlano := 0;
  fValorTotal := 0;
  i := 1;

  MontaQuerySegregacao(cds.FieldByName( 'IDIMOVEL' ).AsInteger,
                       CmpRptCM.ParamByName('iIdPatro').AsInteger,
                       CmpRptCM.ParamByName('iIdPlanoPrev').asinteger,
                       CmpRptCM.ParamByName('dLimite').AsDateTime);

  while not qrySegreg.Eof do
  begin
    qrySegreg.Edit;
    if i = qrySegreg.RecordCount then
      qrySegreg.FieldByName('VALOR').AsCurrency :=  ppDBCalc1.Value - fValorTotal
    else
    begin
      fValorPlano := RoundCM((ppDBCalc1.Value * qrySegreg.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
      qrySegreg.FieldByName('VALOR').asCurrency := fValorPlano;
    end;
    fValorTotal := fValorTotal + fValorPlano;
    qrySegreg.Post;
    qrySegreg.Next;
    Inc(i);
  end;
end;

procedure TdtmRelObra.ppSubReport2Print(Sender: TObject);
var
  fValorPlano, fValorTotal : Currency;
  i : integer;
begin
  inherited;
  fValorPlano := 0;
  fValorTotal := 0;
  i := 1;

  MontaQuerySegregacao(cds.FieldByName( 'IDIMOVEL' ).AsInteger,
                       CmpRptCM.ParamByName('iIdPatro').AsInteger,
                       CmpRptCM.ParamByName('iIdPlanoPrev').asinteger,
                       CmpRptCM.ParamByName('dLimite').AsDateTime);

  while not qrySegreg.Eof do
  begin
    qrySegreg.Edit;
    if i = qrySegreg.RecordCount then
      qrySegreg.FieldByName('VALOR').AsCurrency :=  ppDBCalc2.Value - fValorTotal
    else
    begin
      fValorPlano := RoundCM((ppDBCalc2.Value * qrySegreg.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
      qrySegreg.FieldByName('VALOR').asCurrency := fValorPlano;
    end;
    fValorTotal := fValorTotal + fValorPlano;
    qrySegreg.Post;
    qrySegreg.Next;
    Inc(i);
  end;
end;

end.
