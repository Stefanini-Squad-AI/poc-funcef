unit FConsSaldoFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, wwdblook, Db, DBTables, Wwquery,
  Wwdatsrc, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmConsSaldoFinanc = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    bbtnProcessarConsulta: TBitBtn;
    PnlTopo: TPanel;
    PnlSaidas: TPanel;
    PnlEntradas: TPanel;
    Splitter1: TSplitter;
    PnlSaldo: TPanel;
    pnlCabEntradas: TPanel;
    pnlCabSaidas: TPanel;
    PnlRodEntradas: TPanel;
    PnlRodSaidas: TPanel;
    Label1: TLabel;
    edTotalEntradas: TEdit;
    Label2: TLabel;
    edTotalSaidas: TEdit;
    edSaldo: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    dblcPrograma: TwwDBLookupCombo;
    Label5: TLabel;
    dblcPatrocinador: TwwDBLookupCombo;
    Label6: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    qryPrograma: TwwQuery;
    qryPatrocinador: TwwQuery;
    qryPlanoPrev: TwwQuery;
    qryTotais: TwwQuery;
    qryTotaisTOTENTRADAS: TFloatField;
    qryTotaisTOTSAIDAS: TFloatField;
    qryEntradas: TwwQuery;
    qrySaidas: TwwQuery;
    qryEntradasHISTORICO: TStringField;
    qryEntradasVALORLANCFINAN: TFloatField;
    dsEntradas: TwwDataSource;
    dsSaidas: TwwDataSource;
    dbgEntradas: TwwDBGrid;
    dbgSaidas: TwwDBGrid;
    gpbPeriodo: TGroupBox;
    DtInicial: TCMDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    DtFinal: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnProcessarConsultaClick(Sender: TObject);
    procedure DtInicialChange(Sender: TObject);
    procedure DtFinalChange(Sender: TObject);
  private
    { Private declarations }
    procedure MontaFiltroQuery(var Qry: TwwQuery);
  public
    { Public declarations }
  end;

var
  frmConsSaldoFinanc: TfrmConsSaldoFinanc;

implementation

Uses uSistema;

{$R *.DFM}

procedure TfrmConsSaldoFinanc.FormCreate(Sender: TObject);
begin
  inherited;
  qryPrograma.Open;
  qryPatrocinador.Open;
  qryPlanoPrev.Open;
end;

procedure TfrmConsSaldoFinanc.FormDestroy(Sender: TObject);
begin
  qryPrograma.Close;
  qryPatrocinador.Close;
  qryPlanoPrev.Close;
  inherited;
end;

procedure TfrmConsSaldoFinanc.bbtnProcessarConsultaClick(Sender: TObject);
var
   Saldo : Currency;
begin
   //
   // Calcula os Totais e o Saldo
   //
   // #39 = Código ASCII do ' (plic)
   //
   qryTotais.Close;   
   qryTotais.SQL.Clear;
   qryTotais.SQL.Add('SELECT Sum(Decode(EntradaSaida,'+#39+'E'+#39+',MF.ValorLancFinan)) AS TotEntradas,');
   qryTotais.SQL.Add('       Sum(Decode(EntradaSaida,'+#39+'S'+#39+',MF.ValorLancFinan)) AS TotSaidas   ');
   qryTotais.SQL.Add('FROM MovimFinanc MF, RateioFinanc RF                                              ');
   qryTotais.SQL.Add('WHERE (MF.CodLancFinanc(+)=RF.CodLancFinanc)                                      ');
   MontaFiltroQuery(qryTotais);
   qryTotais.Open;

   edTotalEntradas.Text:=FormatFloat('#,##0.00',qryTotaisTOTENTRADAS.Value);
   edTotalSaidas.Text:=FormatFloat('#,##0.00',qryTotaisTOTSAIDAS.Value);

   Saldo:=qryTotaisTOTENTRADAS.Value-qryTotaisTOTSAIDAS.Value;
   if Saldo<0 then
      edSaldo.Font.Color:=clRed
   else
      edSaldo.Font.Color:=clWindowText;

   edSaldo.Text:=FormatFloat('#,##0.00',Saldo);

   qryTotais.Close;

   //
   // Gera Query de Entradas
   //
   qryEntradas.Close;
   qryEntradas.SQL.Clear;
   qryEntradas.SQL.Add('SELECT MF.Historico, MF.ValorLancFinan');
   qryEntradas.SQL.Add('FROM MovimFinanc MF, RateioFinanc RF');
   qryEntradas.SQL.Add('WHERE MF.CodLancFinanc(+)=RF.CodLancFinanc AND');
   qryEntradas.SQL.Add('      MF.EntradaSaida='+#39+'E'+#39);
   MontaFiltroQuery(qryEntradas);
   qryEntradas.Open;

   //
   // Gera Query de Saídas
   //
   qrySaidas.Close;
   qrySaidas.SQL.Clear;
   qrySaidas.SQL.Add('SELECT MF.Historico, MF.ValorLancFinan');
   qrySaidas.SQL.Add('FROM MovimFinanc MF, RateioFinanc RF');
   qrySaidas.SQL.Add('WHERE MF.CodLancFinanc(+)=RF.CodLancFinanc AND');
   qrySaidas.SQL.Add('      MF.EntradaSaida='+#39+'S'+#39);
   MontaFiltroQuery(qrySaidas);
   qrySaidas.Open;

end;

procedure TfrmConsSaldoFinanc.MontaFiltroQuery(var Qry: TwwQuery);
begin
   if Trim(dblcPrograma.Text)<>'' then
      qry.SQL.Add('AND (RF.IDPrograma='+Trim(dblcPrograma.LookupValue)+')');

   if Trim(dblcPatrocinador.Text)<>'' then
      qry.SQL.Add('AND (RF.IDPatro='+Trim(dblcPatrocinador.LookupValue)+')');

   if Trim(dblcPlanoPrev.Text)<>'' then
      qry.SQL.Add('AND (RF.IDPlanoPrev='+Trim(dblcPlanoPrev.LookupValue)+')');

   if Trim(DtInicial.Text)<>'' then
      qry.SQL.Add('AND (MF.DataLancFinan>=To_Date('+#39+Trim(DtInicial.Text)+#39+','+#39+'dd/mm/yyyy'+#39+'))');

   if Trim(DtFinal.Text)<>'' then
      qry.SQL.Add('AND (MF.DataLancFinan<=To_Date('+#39+Trim(DtFinal.Text)+#39+','+#39+'dd/mm/yyyy'+#39+'))');

   qry.SQL.Add('  AND (MF.IDPESSOA(+)= '+FloatToStr(Sistema.idEmpresa)+')');
end;

procedure TfrmConsSaldoFinanc.DtInicialChange(Sender: TObject);
begin
   if ((Trim(DtFinal.Text)='') or (DtFinal.Date<DtInicial.Date)) and (Trim(DtInicial.Text)<>'') then
      DtFinal.Text:=DtInicial.Text;
end;

procedure TfrmConsSaldoFinanc.DtFinalChange(Sender: TObject);
begin
   if (DtFinal.Date<DtInicial.Date) and (Trim(DtFinal.Text)<>'')then DtFinal.Text:=DtInicial.Text;
end;

end.
