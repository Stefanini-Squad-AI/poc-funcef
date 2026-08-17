unit FConsSaldoFinancMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  uCtrlConsSaldoFinanc,uCtrlListTercFinanc, TREdit;

type
  TfrmConsSaldoFinancMT = class(TfrmSairAjuda)
    bbtnProcessarConsulta: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    PnlTopo: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dblcPrograma: TwwDBLookupCombo;
    dblcPatrocinador: TwwDBLookupCombo;
    dblcPlanoPrev: TwwDBLookupCombo;
    gpbPeriodo: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edDataInicial: TCMDateTimePicker;
    edDataFinal: TCMDateTimePicker;
    PnlSaldo: TPanel;
    Label3: TLabel;
    dsEntradas: TwwDataSource;
    dsSaidas: TwwDataSource;
    Splitter1: TSplitter;
    PnlSaidas: TPanel;
    pnlCabSaidas: TPanel;
    PnlRodSaidas: TPanel;
    Label2: TLabel;
    dbgSaidas: TwwDBGrid;
    PnlEntradas: TPanel;
    pnlCabEntradas: TPanel;
    PnlRodEntradas: TPanel;
    Label1: TLabel;
    dbgEntradas: TwwDBGrid;
    cdsEntradas: TCMClientDataSet;
    cdsSaidas: TCMClientDataSet;
    edTotalEntradas: TDBRealEdit;
    edTotalSaidas: TDBRealEdit;
    edSaldo: TDBRealEdit;
    cdsPrograma: TCMClientDataSet;
    cdsPatrocinador: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcessarConsultaClick(Sender: TObject);
    procedure edDataChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlConsSaldoFinanc : TCtrlConsSaldoFinanc;
    CtrlListTerceiros : TCtrlListTercFinanc;
  public
    { Public declarations }
  end;

var
  frmConsSaldoFinancMT: TfrmConsSaldoFinancMT;

implementation

{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados,uSistema;

procedure TfrmConsSaldoFinancMT.FormCreate(Sender: TObject);
begin
   inherited;

   //Inicializa CtrlFluxoCaixa
   CtrlConsSaldoFinanc:=TCtrlConsSaldoFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                                    Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlConsSaldoFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);


   dblcPrograma.Enabled:=Sistema.UsaPlanoPatro;
   dblcPatrocinador.Enabled:=Sistema.UsaPlanoPatro;
   dblcPlanoPrev.Enabled:=Sistema.UsaPlanoPatro;

   if Sistema.UsaPlanoPatro then
    begin
       //Carrega cds de Programa Previdenciário
       cdsPrograma.Data:=CtrlListTerceiros.ListPrograma;
       //Carrega cds de Patrocinador Previdenciário
       cdsPatrocinador.Data:=CtrlListTerceiros.ListPatrocinador;
       //Carrega cds de Plano Previdenciário
       cdsPlanoPrev.Data:=CtrlListTerceiros.ListPlanoPrev;
    end;
end;

procedure TfrmConsSaldoFinancMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlConsSaldoFinanc.Free;
   CtrlListTerceiros.Free;
   inherited;
end;

procedure TfrmConsSaldoFinancMT.bbtnProcessarConsultaClick(
  Sender: TObject);
var
   rTotEntradas : Double;
   rTotSaidas   : Double;
   rIDPrograma  : Double;
   rIDPatro     : Double;
   rIDPlanoPrev : Double;
begin
   rTotEntradas:=0;
   rTotSaidas:=0;
   rIDPrograma:=0;
   rIDPatro:=0;
   rIDPlanoPrev:=0;

   if (dblcPrograma.Text<>'') then rIDPrograma:=StrToFloat(dblcPrograma.LookupValue);
   if (dblcPatrocinador.Text<>'') then rIDPatro:=StrToFloat(dblcPatrocinador.LookupValue);
   if (dblcPlanoPrev.Text<>'') then rIDPlanoPrev:=StrToFloat(dblcPlanoPrev.LookupValue);

   CtrlConsSaldoFinanc.GeraTotais(rTotEntradas,rTotSaidas,rIDPrograma,rIDPatro,rIDPlanoPrev,
                                  edDataInicial.Date,edDataFinal.Date);

   edTotalEntradas.Value:=rTotEntradas;
   edTotalSaidas.Value:=rTotSaidas;

   edSaldo.Value:=rTotEntradas-rTotSaidas;
   if (edSaldo.Value<0) then
      edSaldo.Font.Color:=clRed
   else
      edSaldo.Font.Color:=clWindowText;

   //Carrega cdsEntradas
   cdsEntradas.Data:=CtrlConsSaldoFinanc.ListEntradas(rIDPrograma,rIDPatro,rIDPlanoPrev,
                                                      edDataInicial.Date,edDataFinal.Date);
   TFloatField(cdsEntradas.FieldByName('VALORLANCFINAN')).DisplayFormat:='#,##0.00';

   //Carrega cdsEntradas
   cdsSaidas.Data:=CtrlConsSaldoFinanc.ListSaidas(rIDPrograma,rIDPatro,rIDPlanoPrev,
                                                  edDataInicial.Date,edDataFinal.Date);
   TFloatField(cdsSaidas.FieldByName('VALORLANCFINAN')).DisplayFormat:='#,##0.00';
end;

procedure TfrmConsSaldoFinancMT.edDataChange(Sender: TObject);
begin
   if (edDataFinal.Date<edDataInicial.Date) and (Trim(edDataFinal.Text)<>'')then
      edDataFinal.Date:=edDataInicial.Date;
end;

end.
