unit DRelEstatDetalhada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, uDiasUteis, uSistema, ppModule, daDataModule, uModulo;

type
  TdtmRelEstatDetalhada = class(TdtmReports)
    qryRelaEstat: TwwQuery;
    pprRelaEstat: TppReport;
    ppRelaEstat: TppBDEPipeline;
    DsRelaEstat: TwwDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabelTopico: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    UpdRelaEstat: TUpdateSQL;
    qryAux: TwwQuery;
    qryRelaEstatCONTATEND: TFloatField;
    qryRelaEstatTOPICO: TStringField;
    qryRelaEstatPERCENT: TStringField;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppShape1: TppShape;
    ppShape2: TppShape;
    cidade: TppLabel;
    Situacao: TppLabel;
    Plano: TppLabel;
    Local: TppLabel;
    Forma: TppLabel;
    Status: TppLabel;
    Grupo: TppLabel;
    Assunto: TppLabel;
    Atendente: TppLabel;
    Filial: TppLabel;
    Patrocinadora: TppLabel;
    ppLabel2: TppLabel;
    Periodo: TppLabel;
    ppDBImage3: TppDBImage;
    ppDBText28: TppDBText;
    ppDBText27: TppDBText;
    qryFun: TwwQuery;
    qryFunNOME: TStringField;
    qryFunRAZAOSOCIAL: TStringField;
    qryFunLOGRADOURO: TStringField;
    qryFunNUMERO: TStringField;
    qryFunCOMPLEMENTO: TStringField;
    qryFunBAIRRO: TStringField;
    qryFunCIDADE: TStringField;
    qryFunCODESTADO: TStringField;
    qryFunCEP: TStringField;
    qryFunIMAGEM: TBlobField;
    DSfun: TwwDataSource;
    ppDBPipeFun: TppDBPipeline;
    ppLine4: TppLine;
    ppLabel6: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    qryRelaEstatTOTAL_EM_SEGUNDOS: TFloatField;
    qryRelaEstatMEDIA_EM_SEGUNDOS: TFloatField;
    qryRelaEstatTOTAL_EM_MINUTOS: TFloatField;
    qryRelaEstatMEDIA_EM_MINUTOS: TFloatField;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppdbTempoMedio: TppDBText;
    ppdbTempoTotal: TppDBText;
    qryRelaEstatTotalFormatado: TStringField;
    qryRelaEstatMediaFormatada: TStringField;
    pplblTotalTempoMedio: TppLabel;
    pplblTotalTempoTotal: TppLabel;
    procedure qryRelaEstatCalcFields(DataSet: TDataSet);
    procedure pplblTotalTempoMedioPrint(Sender: TObject);
    procedure pplblTotalTempoTotalPrint(Sender: TObject);
  private
    { Private declarations }
  public
    sTotalTempoMedio : string;
    sTotalTempoTotal : string;
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelEstatDetalhada: TdtmRelEstatDetalhada;

implementation
uses FPRelEstatDetalhada;
{$R *.DFM}

function TdtmRelEstatDetalhada.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if UPPERCASE(Form)= 'FRMPRELESTATDETALHADA' then
    frm := TfrmPRelEstatDetalhada.Create(Application)
  else
    frm := nil;

  if frm = nil then
    Result := true
  else
  begin
    with frm do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;




procedure TdtmRelEstatDetalhada.qryRelaEstatCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryRelaEstatTotalFormatado.AsString := SegundosParaHMS( qryRelaEstatTOTAL_EM_SEGUNDOS.AsInteger );
  qryRelaEstatMediaFormatada.AsString := SegundosParaHMS( qryRelaEstatMEDIA_EM_SEGUNDOS.AsInteger );
end;


procedure TdtmRelEstatDetalhada.pplblTotalTempoMedioPrint(Sender: TObject);
begin
  inherited;
  pplblTotalTempoMedio.Text := sTotalTempoMedio;
end;

procedure TdtmRelEstatDetalhada.pplblTotalTempoTotalPrint(Sender: TObject);
begin
  inherited;
  pplblTotalTempoTotal.Text := sTotalTempoTotal;
end;

end.
