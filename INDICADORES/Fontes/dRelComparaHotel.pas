unit dRelComparaHotel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppModule, raCodMod, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, uCtrlRelHotel, uCtrlContratoLoja, uCMClientDataSet, TXRB;

type
  TdtmRelComparaHotel = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppComparaHotel: TppReport;
    ppOrcamentoHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppOrcamentoDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppDscDetalhe: TppDBText;
    ppOrcamentoDBText4: TppDBText;
    ppOrcamentoDBText5: TppDBText;
    ppOrcamentoDBText6: TppDBText;
    ppOrcamentoDBText7: TppDBText;
    ppOrcamentoDBText8: TppDBText;
    ppOrcamentoDBText9: TppDBText;
    ppOrcamentoDBText11: TppDBText;
    ppOrcamentoFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppOrcamentoSummaryBand1: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLine2: TppLine;
    lblHot01: TppLabel;
    lblHot07: TppLabel;
    lblHot02: TppLabel;
    lblHot03: TppLabel;
    lblHot04: TppLabel;
    lblHot05: TppLabel;
    lblHot06: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGrpQuebra: TppGroup;
    ppOrcamentoGroupHeaderBand1: TppGroupHeaderBand;
    ppDscQuebra: TppDBText;
    ppOrcamentoLine3: TppLine;
    ppOrcamentoGroupFooterBand1: TppGroupFooterBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelHotel : TCtrlRelHotel;
    CtrlContratoLoja: TCtrlContratoLoja;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
    procedure PreencheNomeHotel;
  public
    { Public declarations }
  end;

var
  dtmRelComparaHotel: TdtmRelComparaHotel;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}


procedure TdtmRelComparaHotel.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelHotel := TCtrlRelHotel.Create;
  CtrlContratoLoja := TCtrlContratoLoja.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.USaPlanoPatro);
  CtrlRelHotel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          ComunsImobiliario.MensErroMT);
  CtrlContratoLoja.InitializeAs( CtrlRelHotel );

  cds.Data := CtrlRelHotel.BuscaRelComparativo(3759,                               // idReport no SAD
                                               CmpRptCM.ParamValues[0].AsInteger,  // Mes
                                               CmpRptCM.ParamValues[1].AsInteger,  // Ano
                                               CmpRptCM.ParamValues[5].AsInteger,  // Hotel 1
                                               CmpRptCM.ParamValues[6].AsInteger,  // Hotel 2
                                               CmpRptCM.ParamValues[7].AsInteger,  // Hotel 3
                                               CmpRptCM.ParamValues[8].AsInteger,  // Hotel 4
                                               CmpRptCM.ParamValues[9].AsInteger,  // Hotel 5
                                               CmpRptCM.ParamValues[10].AsInteger, // Hotel 6
                                               CmpRptCM.ParamValues[11].AsInteger);// Hotel 7
  PreencheNomeHotel;

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[2].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[3].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[4].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelComparaHotel.PreencheNomeHotel;
var i : Integer;
begin
  for i := 1 to 7 do begin
    if CmpRptCM.ParamValues[i+11].AsString <> '' then begin
      case i of
        1 : lblHot01.Caption := CmpRptCM.ParamValues[i+11].AsString;
        2 : lblHot02.Caption := CmpRptCM.ParamValues[i+11].AsString;
        3 : lblHot03.Caption := CmpRptCM.ParamValues[i+11].AsString;
        4 : lblHot04.Caption := CmpRptCM.ParamValues[i+11].AsString;
        5 : lblHot05.Caption := CmpRptCM.ParamValues[i+11].AsString;
        6 : lblHot06.Caption := CmpRptCM.ParamValues[i+11].AsString;
        7 : lblHot07.Caption := CmpRptCM.ParamValues[i+11].AsString;
      end;
    end;
  end;
end;


procedure TdtmRelComparaHotel.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelComparaHotel.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
