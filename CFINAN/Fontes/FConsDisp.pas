unit FConsDisp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Grids,
  Wwdbigrd, Wwdbgrid, DBTables, Db, Wwdatsrc, Wwquery, ComCtrls, wwdblook,
  ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,ppForms,ppTypes,ppPrvDlg;

type
  TfrmConsDisp = class(TfrmSairAjuda)
    deDataDisp: TCMDateTimePicker;
    lblDataDisp: TLabel;
    qryLancamento: TwwQuery;
    dsLancamento: TwwDataSource;
    dbgrLancamentos: TwwDBGrid;
    qryParametros: TwwQuery;
    qryParametrosDATABLOQDISPFINAN: TDateTimeField;
    lblStatusDisp: TLabel;
    qryLancamentoENTRADA: TFloatField;
    qryLancamentoSAIDA: TFloatField;
    qryLancamentoVALORAPLIC: TFloatField;
    qryLancamentoVALORRESGATE: TFloatField;
    qryLancamentoIDPLANOPREV: TFloatField;
    qryLancamentoIDPATRO: TFloatField;
    qryLancamentoNOMEPATRO: TStringField;
    qryLancamentoNOMEPLANO: TStringField;
    qryLancamentoDATALANCFINAN: TStringField;
    qryLancamentoNUMCHQBORDERO: TStringField;
    qryLancamentoHISTORICO: TStringField;
    qryLancamentoSTATUSCONCILIA: TStringField;
    qryLancamentoENTRADASAIDA: TStringField;
    qryLancamentoVALORLANCFINAN: TFloatField;
    qryLancamentoCODPORTADOR: TFloatField;
    qryLancamentoDESCRICAO: TStringField;
    qryLancamentoDATADISPFINANC: TDateTimeField;
    qryPatro: TwwQuery;
    qryPlanoPrev: TwwQuery;
    Label14: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    Label15: TLabel;
    dblcPatro: TwwDBLookupCombo;
    btnBusca: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qryLancamentoCODLANCFINANC: TStringField;
    qryRelatDisp: TwwQuery;
    dsRelatDisp: TwwDataSource;
    pplRelatDisp: TppBDEPipeline;
    rptRelatDisp: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLine15: TppLine;
    ppLabel24: TppLabel;
    ppLine16: TppLine;
    ppLabel25: TppLabel;
    ppLblTituloContaCC2: TppLabel;
    bndDetContaCC: TppDetailBand;
    dbtxtCCustoCC: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine17: TppLine;
    ppLabel32: TppLabel;
    rptContaCCLabel2: TppLabel;
    lblContCoCC: TppLabel;
    ppCalc12: TppSystemVariable;
    lblCalcCoCC: TppSystemVariable;
    rptContaCCGroup1: TppGroup;
    rptContaCCGroupHeaderBand1: TppGroupHeaderBand;
    rptContaCCLabel1: TppLabel;
    dbtxtContaCC: TppDBText;
    rptContaCCLine1: TppLine;
    rptContaCCLine2: TppLine;
    rptContaCCGroupFooterBand1: TppGroupFooterBand;
    bbtnImprime: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel4: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppLabel9: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine2: TppLine;
    ppDBText8: TppDBText;
    ToolbarSep973: TToolbarSep97;
    bbtnDivergentes: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure dbgrLancamentosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure btnBuscaClick(Sender: TObject);
    procedure bbtnImprimeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnDivergentesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure FazQueryDisp(dDataDisp : TDateTime; idEmpresa : LongInt);
  public
    { Public declarations }
  end;

var
  frmConsDisp: TfrmConsDisp;

implementation

Uses uMensErro, uSistema, uDataBase, FDisponDiverg;

{$R *.DFM}

procedure TfrmConsDisp.FormCreate(Sender: TObject);
begin
   inherited;
   ppRegisterForm(TppCustomPreviewer,tppPrintPreview);
end;

procedure TfrmConsDisp.FormActivate(Sender: TObject);
begin
  inherited;
  qryParametros.Close;
  qryParametros.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryParametros.Open;
  //
  qryPatro.Close;
  qryPatro.Open;
  //
  qryPlanoPrev.Close;
  qryPlanoPrev.Open;
  //
  FazQueryDisp(0,-1);
  //
  lblStatusDisp.Caption := '';
  deDataDisp.Date := Date;
  deDataDisp.SetFocus;
end;

procedure TfrmConsDisp.FormShow(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmConsDisp.FazQueryDisp(dDataDisp : TDateTime; idEmpresa : LongInt);
begin
   inherited;
   //
   qryLancamento.Close;

   if dblcPlanoPrev.Text <> '' then
    begin
       qryLancamento.ParamByName('IDPlanoPrev').AsFloat:=StrToFloat(dblcPlanoPrev.LookUpValue);
       qryLancamento.ParamByName('TodosPlanos').AsString:='N';
    end
   else
    begin
       qryLancamento.ParamByName('IDPlanoPrev').AsFloat:=0;
       qryLancamento.ParamByName('TodosPlanos').AsString:='S';
    end;

   if dblcPatro.Text <> '' then
    begin
       qryLancamento.ParamByName('IDPatro').AsFloat:=StrToFloat(dblcPatro.LookUpValue);
       qryLancamento.ParamByName('TodosPatrocinadores').AsString:='N';
    end
   else
    begin
       qryLancamento.ParamByName('IDPatro').AsFloat:=0;
       qryLancamento.ParamByName('TodosPatrocinadores').AsString:='S';
    end;

   qryLancamento.ParamByName('DATAREF').AsDate   := dDataDisp;
   qryLancamento.ParamByName('IDPESSOA').AsInteger := idEmpresa;
   qryLancamento.Open;
end;

procedure TfrmConsDisp.dbgrLancamentosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if not Highlight then
   begin
      if qryLancamentoCODLANCFINANC.AsString = 'Total Geral' then
       begin
          aBrush.Color := $0075FFFF;
       end
      else
       begin
          if qryLancamentoCODLANCFINANC.AsString = 'Total por Plano/Patro' then
             aBrush.Color := $00B9FFFF
          else
             aBrush.Color := clWindow;
       end;
   end;
end;

procedure TfrmConsDisp.btnBuscaClick(Sender: TObject);
begin
  inherited;
  if deDataDisp.Date <= qryParametrosDATABLOQDISPFINAN.AsDateTime then
   begin
      lblStatusDisp.Caption := 'Disponibilidade Bloqueada';
   end
  else
   begin
      lblStatusDisp.Caption := 'Disponibilidade em Aberto';
   end;
  FazQueryDisp(deDataDisp.Date, Sistema.idEmpresa);
end;

procedure TfrmConsDisp.bbtnImprimeClick(Sender: TObject);
var sTipo : String;
begin
  inherited;
  //
  qryRelatDisp.Close;

  if dblcPlanoPrev.Text <> '' then
   begin
      qryRelatDisp.ParamByName('IDPlanoPrev').AsFloat:=StrToFloat(dblcPlanoPrev.LookUpValue);
      qryRelatDisp.ParamByName('TodosPlanos').AsString:='N';
   end
  else
   begin
      qryRelatDisp.ParamByName('IDplanoPrev').AsFloat:=0;
      qryRelatDisp.ParamByName('TodosPlanos').AsString:='S';
   end;
  //
  if dblcPatro.Text <> '' then
   begin
      qryRelatDisp.ParamByName('IDPatro').AsFloat:=StrToFloat(dblcPatro.LookUpValue);
      qryRelatDisp.ParamByName('TodosPatrocinadores').AsString:='N';
   end
  else
   begin
      qryRelatDisp.ParamByName('IDPatro').AsFloat:=0;
      qryRelatDisp.ParamByName('TodosPatrocinadores').AsString:='S';
   end;

  qryRelatDisp.ParamByName('DATAREF').AsDate   := deDataDisp.Date;
  qryRelatDisp.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryRelatDisp.Open;
  //
  if deDataDisp.Date <= qryParametrosDATABLOQDISPFINAN.AsDateTime then
   begin
      sTipo := ' - Bloqueada';
   end
  else
   begin
      sTipo := ' - em Aberto';
   end;
  //
  ppLabel2.Caption := 'Disponibilidade Financeira em '+deDataDisp.Text+sTipo;
  if (dblcPatro.Text = '') and (dblcPlanoPrev.Text = '') then
     ppLblTituloContaCC2.Caption := 'Plano: Todos    Patrocinadora: Todas'
  else
     if (dblcPatro.Text <> '') and (dblcPlanoPrev.Text = '') then
        ppLblTituloContaCC2.Caption := 'Plano: Todos    Patrocinadora: '+dblcPatro.Text
     else
        if (dblcPatro.Text = '') and (dblcPlanoPrev.Text <> '') then
           ppLblTituloContaCC2.Caption := 'Plano: '+dblcPlanoPrev.Text+'    Patrocinadora: Todas'
        else
           ppLblTituloContaCC2.Caption := 'Plano: '+dblcPlanoPrev.Text+'    Patrocinadora: '+dblcPatro.Text;
  //
  rptRelatDisp.language := lgPortugueseBrazil;
  rptRelatDisp.Device   := dvScreen;
  rptRelatDisp.Print;
end;

procedure TfrmConsDisp.bbtnDivergentesClick(Sender: TObject);
begin
   with TfrmDisponDiverg.Create(Self) do
    try
       qryDispDiverg.Close;
       qryDispDiverg.ParamByName('MesAno').AsString:=FormatDateTime('mm/yyyy',now);
       qryDispDiverg.Open;
       if qryDispDiverg.RecordCount<>0 then
        begin
           ShowModal;
           if ModalResult=mrOK then
            begin
               deDataDisp.Date:=qryDispDiverg.FieldByName('DataDispFinanc').AsDateTime;
               btnBuscaClick(nil);
            end;
        end
       else
        MsgDlg('Não Existem Disponibilidades Divergentes.','Aviso',mtWarning,[mbOk],0);  ;
    finally
       Free;
    end;
end;


end.
