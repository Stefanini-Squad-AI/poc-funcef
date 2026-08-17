unit dRelRanking;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppBands, ppPrnabl, ppCtrls, ppCache, ppVar, uCtrlRelIndicadores,
  ppModule, raCodMod, TXRB;

type
  TdtmRelRanking = class(TFrmCmReportImob)
    ppRanking: TppReport;
    ppl: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppDBText14: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine6: TppLine;
    ppLabel11: TppLabel;
    ppLabel18: TppLabel;
    ppDBText18: TppDBText;
    ppLabel21: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppDBCalc1: TppDBCalc;
    vcTotVenda: TppDBCalc;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBCalc2: TppDBCalc;
    lblTxtCota: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelIndicadores    : TCtrlRelIndicadores;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;

    procedure OrdenaRanking;
  public
    { Public declarations }
  end;

var
  dtmRelRanking: TdtmRelRanking;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}

procedure TdtmRelRanking.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelRanking(
                                   CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                   ModuloIndicadores.iIdIndVenda,
                                   ModuloIndicadores.iIdIndAluguel,
                                   ModuloIndicadores.iIdIndABL,
                                   ModuloIndicadores.iMoeCodigoUPV,
                                   CmpRptCM.ParamValues[1].AsInteger,    // Mes Competencia
                                   CmpRptCM.ParamValues[2].AsInteger);   // Ano Competencia

  OrdenaRanking;

  // Define Ordenação
  case CmpRptCM.ParamValues[3].AsInteger of
    1 : cds.IndexName := 'IndVenda';
    2 : cds.IndexName := 'IndAluguel';
    3 : cds.IndexName := 'IndPto';
  end;

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[4].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[5].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[6].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelRanking.OrdenaRanking;
var i :Integer;
    sImovel : String;
begin
  // Ordena por Venda
  cds.IndexName := 'IndVenda';
  cds.First;
  while not cds.eof do begin
    i := 0;
    sImovel := cds.FieldByName('IMONOME').AsString;
    while (sImovel = cds.FieldByName('IMONOME').AsString) and (not cds.eof) do begin
      i := i+1;
      cds.Edit;
      cds.FieldByName('RANKVEND').AsInteger := i;
      cds.Post;
      cds.Next;
    end;
  end;

  // Ordena por Aluguel
  cds.IndexName := 'IndAluguel';
  cds.First;
  while not cds.eof do begin
    i := 0;
    sImovel := cds.FieldByName('IMONOME').AsString;
    while (sImovel = cds.FieldByName('IMONOME').AsString) and (not cds.eof) do begin
      i := i+1;
      cds.Edit;
      cds.FieldByName('RANKALUG').AsInteger := i;
      cds.Post;
      cds.Next;
    end;
  end;

  // Ordena por Pto de Equilibrio
  cds.IndexName := 'IndPto';
  cds.First;
  while not cds.eof do begin
    i := 0;
    sImovel := cds.FieldByName('IMONOME').AsString;
    while (sImovel = cds.FieldByName('IMONOME').AsString) and (not cds.eof) do begin
      i := i+1;
      cds.Edit;
      cds.FieldByName('RANKPTO').AsInteger := i;
      cds.Post;
      cds.Next;
    end;
  end;

  cds.First;
end;

procedure TdtmRelRanking.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelRanking.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
