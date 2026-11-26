unit dConciliaInstResgPort;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Vinicius Eduardo Nascimento Maciel
// Data        : 20/09/2011
// Pendência   : SOL 136317 Kintana 828472
// Alteração   : Criação do relatório
//------------------------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppParameter;

type
  TdtmConciliaInstResgPort = class(TdtmReports)
    prConciliaInstResgPort: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    lblEmpresa2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppConciliaInstResgPort: TppBDEPipeline;
    dsConsulta: TwwDataSource;
    qryConsulta: TwwQuery;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppConciliaInstResgPortppField1: TppField;
    ppParameterList1: TppParameterList;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppConciliaInstResgPortppField2: TppField;
    ppConciliaInstResgPortppField3: TppField;
    ppConciliaInstResgPortppField4: TppField;
    ppConciliaInstResgPortppField5: TppField;
    ppConciliaInstResgPortppField6: TppField;
    ppConciliaInstResgPortppField7: TppField;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    lblEndereco1: TppLabel;
    lblEndereco2: TppLabel;
    lblEndereco3: TppLabel;
    lblPeriodo: TppLabel;
    ppLabel2: TppLabel;
    lbTotalLinhas: TppLabel;
    ppLabel12: TppLabel;
    lbTotalVlrReal: TppLabel;
    lblTotalCotas: TppLabel;
    lblFolha: TppLabel;
    lblDiferenca: TppLabel;
    ppImage1: TppImage;
    ppLabel3: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel13: TppLabel;
    ppConciliaInstResgPortppField8: TppField;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    procedure LblEmpresaPrint(Sender: TObject);
    procedure lblEndereco1Print(Sender: TObject);
    procedure lblEndereco3Print(Sender: TObject);
    procedure lblEndereco2Print(Sender: TObject);
    procedure lblPeriodoPrint(Sender: TObject);
    procedure lbTotalLinhasPrint(Sender: TObject);
    procedure lbTotalVlrRealPrint(Sender: TObject);
    procedure lblTotalCotasPrint(Sender: TObject);
    procedure lblFolhaPrint(Sender: TObject);
    procedure lblDiferencaPrint(Sender: TObject);
  private
    function truncaNumero(sValor: String): String;
    { Private declarations }
  public
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmConciliaInstResgPort: TdtmConciliaInstResgPort;
  sInicial, sFinal : String;
  iTotalLinhas : integer;
  dTotalValorReal, dTotalValorCotas, dTotalFolha, dDiferenca : double;
implementation

uses fConciliaInstResgPort;

{$R *.DFM}

{ TdtmConciliaInstResgPort }

function TdtmConciliaInstResgPort.MostraParam(Form: string): boolean;
var
   frm : Tform;
begin
  if (UPPERCASE(Form) = 'FRMCONCILIAINSTRESGPORT') then begin
    frm := TfrmConciliaInstResgPort.Create(Application);
  end;
  if (frm = nil) then begin
    Result := false;
  end else begin
    with (frm) do begin
      Result := (ShowModal = mrOk);
      Free;
    end;
  end;
end;

procedure TdtmConciliaInstResgPort.LblEmpresaPrint(Sender: TObject);
begin
//inherited;
  lblEmpresa2.Caption := 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS';
end;

procedure TdtmConciliaInstResgPort.lblEndereco1Print(Sender: TObject);
begin
  inherited;
  lblEndereco1.Caption := 'SCN, Quadra 2 Edifício Corporate Financial Center 12 e 13 Andares';
end;

procedure TdtmConciliaInstResgPort.lblEndereco3Print(Sender: TObject);
begin
  inherited;
  lblEndereco3.Caption := 'CNPJ: 03.296.986/0001-03 - Inscrição Estadual: 01.001.001-001-01';
end;

procedure TdtmConciliaInstResgPort.lblEndereco2Print(Sender: TObject);
begin
  inherited;
  lblEndereco2.Caption := 'Brasília DF CEP 70.712-900 - (061) 329-7100 - www.funcef.com.br';
end;

procedure TdtmConciliaInstResgPort.lblPeriodoPrint(Sender: TObject);
begin
  inherited;
  lblPeriodo.Caption := 'Período : ' +sInicial + ' até: ' + sFinal;
end;

procedure TdtmConciliaInstResgPort.lbTotalLinhasPrint(Sender: TObject);
begin
  inherited;
  lbTotalLinhas.Caption := IntToStr(iTotalLinhas);
end;

procedure TdtmConciliaInstResgPort.lbTotalVlrRealPrint(Sender: TObject);
begin
  inherited;
  lbTotalVlrReal.Caption := FloatToStr(dTotalValorReal);
end;

procedure TdtmConciliaInstResgPort.lblTotalCotasPrint(Sender: TObject);
begin
  inherited;
  lblTotalCotas.Caption := FloatToStr(dTotalValorCotas);
end;

procedure TdtmConciliaInstResgPort.lblFolhaPrint(Sender: TObject);
begin
  inherited;
  lblFolha.Caption := FloatToStr(dTotalFolha);
end;

procedure TdtmConciliaInstResgPort.lblDiferencaPrint(Sender: TObject);
begin
  inherited;

 // dDiferenca := (dTotalFolha-dTotalValorReal);
  lblDiferenca.Caption := FloatToStr(dDiferenca);
end;

function TdtmConciliaInstResgPort.truncaNumero(sValor : String) : String;
begin
    Result := copy(sValor,1,pos(',',sValor)+2);
end;


end.
