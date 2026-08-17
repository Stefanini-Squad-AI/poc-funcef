unit dRelInvestPPatroPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppCache, uCtrlRelInvestImob, ppPrnabl,
  ppCtrls, ppVar, ppStrtch, ppRegion, ppModule, daDataModule, raCodMod,
  ppSubRpt, uModuloImobiliario, uComunsImobiliario;

type
  TdtmRelInvestPPatroPart = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppInvestPatro: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    lblTitulo: TppLabel;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine5: TppLine;
    ppDetailBand1: TppDetailBand;
    ppsCor: TppShape;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppVPercent: TppVariable;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel1: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc3: TppDBCalc;
    ppLabel4: TppLabel;
    ppDBText6: TppDBText;
    cdsSub: TClientDataSet;
    CMspSub: TCMSqlParams;
    cdsSubIDPATRO: TFloatField;
    cdsSubIDPLANOPREV: TFloatField;
    cdsSubNOME_PLANO: TStringField;
    cdsSubNOME_PATRO: TStringField;
    cdsSubVALCTB0: TFloatField;
    dsSub: TDataSource;
    pplSub: TppBDEPipeline;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppDBText7: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel5: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine7: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppShape1: TppShape;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppVPercentPlano: TppVariable;
    ppLine6: TppLine;
    ppLogoTipo: TppImage;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
  private
    CtrlRelInvestImob : TCtrlRelInvestImob;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
    Lista : TStringList;

  public
    { Public declarations }
  end;

var
  dtmRelInvestPPatroPart: TdtmRelInvestPPatroPart;
  TotalPlanos : Double;

implementation

uses dBaseDados, uSistema, uMensErro, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelInvestPPatroPart.CrmRptCMBeforePrint(Sender: TObject);
var
  i, iPosCor : Integer;
  SaldoAcum : Double;

begin
  inherited;

  CtrlRelInvestImob := TCtrlRelInvestImob.Create;

  CtrlRelInvestImob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelInvestimob.BuscaRelInvestPPatroPart(Sistema.IdEmpresa,
                                                         ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                         ModuloImobiliario.InvestImob.iIdPaisCAF,
                                                         CmpRptCM.ParamValues[0].AsDateTime, // Data Saldo
                                                         CmpRptCM.ParamValues[1].AsInteger, // ID Patrocinadora
                                                         CmpRptCM.ParamValues[2].AsInteger); // ID Plano

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador  := CmpRptCM.ParamValues[3].AsBoolean;
  bCorLinha   := CmpRptCM.ParamValues[4].AsBoolean;
  iPosCor     := CmpRptCM.ParamValues[5].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

  // Carrega o Logotipo - Marcio Motta - 07/07/2004
  if ModuloImobiliario.InvestImob.bFlgLogoRelat then
       ppLogotipo.Picture := ModuloImobiliario.InvestImob.LogoTipo.Picture
  else ppLogotipo.Picture := nil;

  // Varre o CDS acumulando o saldo contábil por Imóvel, armazenando os dados em um TStringList
  // que possui uma estrutura semelhante a de um arquivo INI e acumula saldo por Plano Patrocinadora
  // para montagem de sub-relatório - Marcio Motta - 06/07/2004 - 17089
  SaldoAcum := 0;
  TotalPlanos := 0;
  Lista.Clear;
  cds.First;
  CMspSub.Open;
  while not cds.Eof do
    begin
      TotalPlanos := TotalPlanos + Cds.FieldByName('VALCTB0').AsFloat;

      // ACUMULA O SALDO DO IMÓVEL PARA CÁLCULO DOS PERCENTUAIS
      if Lista.IndexOfName(Cds.FieldByName('IDIMOVEL').AsString) = -1 then
        begin
          SaldoAcum := 0;
          Lista.Add(Cds.FieldByName('IDIMOVEL').AsString + '=' + Cds.FieldByName('VALCTB0').AsString);
        end
      else
        begin
          SaldoAcum := StrToFloat(Lista.Values[Cds.FieldByName('IDIMOVEL').AsString]);
          SaldoAcum := SaldoAcum + Cds.FieldByName('VALCTB0').AsFloat;
          Lista.Values[Cds.FieldByName('IDIMOVEL').AsString] := FloatToStr(SaldoAcum);
        end;

      // ACUMULA O SALDO POR PLANO PATROCINADORA
      if not cdsSub.Locate('IDPATRO;IDPLANOPREV',VarArrayOf([Cds.FieldByName('IDPATRO').AsInteger,
                                                         Cds.FieldByName('IDPLANOPREV').AsInteger]),[]) then
        begin
          cdsSub.Insert;
          cdsSub.FieldByName('IDPATRO').AsInteger     := cds.FieldByName('IDPATRO').AsInteger;
          cdsSub.FieldByName('IDPLANOPREV').AsInteger := cds.FieldByName('IDPLANOPREV').AsInteger;
          cdsSub.FieldByName('NOME_PATRO').AsString   := cds.FieldByName('NOME_PATRO').AsString;
          cdsSub.FieldByName('NOME_PLANO').AsString   := cds.FieldByName('NOME_PLANO').AsString;
          cdsSub.FieldByName('VALCTB0').AsFloat       := cds.FieldByName('VALCTB0').AsFloat;
          cdsSub.Post;
        end
      else
        begin
          cdsSub.Edit;
          cdsSub.FieldByName('VALCTB0').AsFloat := (cdsSub.FieldByName('VALCTB0').AsFloat +
                                                    cds.FieldByName('VALCTB0').AsFloat);
          cdsSub.Post;
        end;

      cds.Next;
    end;
end;

procedure TdtmRelInvestPPatroPart.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelInvestimob);
  FreeAndNil(Lista);
  inherited;
end;

procedure TdtmRelInvestPPatroPart.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelInvestPPatroPart.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelInvestPPatroPart.FormCreate(Sender: TObject);
begin
  inherited;
  Lista := TStringList.Create;
end;

procedure TdtmRelInvestPPatroPart.ppDetailBand1BeforePrint(
  Sender: TObject);
var
  Total, Parcial, Percentual : double;
begin
  inherited;
  Total := StrToFloat(Lista.Values[Cds.FieldByName('IDIMOVEL').AsString]);
  Parcial := StrToFloat(Cds.FieldByName('VALCTB0').AsString);
  Percentual := StrToFloat(Cds.FieldByName('PERCENTUAL').AsString);
  ppVPercent.Value := ComunsImobiliario.Arredonda(((Parcial * Percentual) / Total),3);
end;

procedure TdtmRelInvestPPatroPart.ppDetailBand2BeforePrint(
  Sender: TObject);
var
  Parcial : double;
begin
  inherited;
  Parcial := StrToFloat(CdsSub.FieldByName('VALCTB0').AsString);
  ppVPercentPlano.Value := ComunsImobiliario.Arredonda(((Parcial / TotalPlanos) * 100),3);
end;

end.
