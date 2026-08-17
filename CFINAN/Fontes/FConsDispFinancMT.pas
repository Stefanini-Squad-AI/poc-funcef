unit FConsDispFinancMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Db, DBClient, uCMClientDataSet,
  uCtrlDispFinanc, uCtrlListTercFinanc, uCtrlParamFinanc, Wwdatsrc, ppBands,
  ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, ppTypes, uCmSqlParams;

type
  TfrmConsDispFinancMT = class(TfrmSairAjuda)
    bbtnImprime: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    bbtnDivergentes: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    btnBusca: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    lblDataDisp: TLabel;
    deDataDisp: TCMDateTimePicker;
    Label15: TLabel;
    dblcPatro: TwwDBLookupCombo;
    Label14: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    lblStatusDisp: TLabel;
    dbgrLancamentos: TwwDBGrid;
    cdsPatrocinador: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsLancamento: TCMClientDataSet;
    dsLancamento: TwwDataSource;
    dsRelatDisp: TwwDataSource;
    pplRelatDisp: TppBDEPipeline;
    pplRelatDispppField1: TppField;
    pplRelatDispppField2: TppField;
    pplRelatDispppField3: TppField;
    pplRelatDispppField4: TppField;
    pplRelatDispppField5: TppField;
    pplRelatDispppField6: TppField;
    pplRelatDispppField7: TppField;
    pplRelatDispppField8: TppField;
    pplRelatDispppField9: TppField;
    pplRelatDispppField10: TppField;
    pplRelatDispppField11: TppField;
    pplRelatDispppField12: TppField;
    pplRelatDispppField13: TppField;
    pplRelatDispppField14: TppField;
    pplRelatDispppField15: TppField;
    pplRelatDispppField16: TppField;
    pplRelatDispppField17: TppField;
    pplRelatDispppField18: TppField;
    rptRelatDisp: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLine15: TppLine;
    ppLabel24: TppLabel;
    ppLine16: TppLine;
    ppLabel25: TppLabel;
    ppLblTituloContaCC2: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    bndDetContaCC: TppDetailBand;
    dbtxtCCustoCC: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine17: TppLine;
    ppLabel32: TppLabel;
    rptContaCCLabel2: TppLabel;
    lblContCoCC: TppLabel;
    ppCalc12: TppSystemVariable;
    lblCalcCoCC: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppLabel9: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel11: TppLabel;
    ppLine2: TppLine;
    rptContaCCGroup1: TppGroup;
    rptContaCCGroupHeaderBand1: TppGroupHeaderBand;
    rptContaCCLabel1: TppLabel;
    dbtxtContaCC: TppDBText;
    rptContaCCLine2: TppLine;
    rptContaCCGroupFooterBand1: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel4: TppLabel;
    ppLabel10: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    rptContaCCLine1: TppLine;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    cdsRelatDisp: TCMClientDataSet;
    spTeste: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure dbgrLancamentosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure btnBuscaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnImprimeClick(Sender: TObject);
    procedure bbtnDivergentesClick(Sender: TObject);
  private
    { Private declarations }
    dDataBloqueioDisp : TDateTime;
    CtrlDisponFinanc  : TCtrlDisponFinanc;
    CtrlListTerceiros : TCtrlListTercFinanc;
    CtrlParamFinanc   : TCtrlParamFinanc;
  public
    { Public declarations }
  end;

var
  frmConsDispFinancMT: TfrmConsDispFinancMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro, FPreview, FDispDivergentesMT;

procedure TfrmConsDispFinancMT.FormCreate(Sender: TObject);
begin
   inherited;

   //Inicializa CtrlDisponFinanc
   CtrlDisponFinanc:=TCtrlDisponFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                              Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlDisponFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega cdsLancamento
   cdsLancamento.Data:=CtrlDisponFinanc.ListConsLancamentos(-1,0,0,0); //Vazio

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);
   //Carrega cds Patrocinador
   cdsPatrocinador.Data:=CtrlListTerceiros.ListPatrocinador;

   //Carrega cds de Plano Previdenciário
   cdsPlanoPrev.Data:=CtrlListTerceiros.ListPlanoPrev;

   //Inicializa CtrlParamFinanc
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   with TCMClientDataSet.Create(nil) do
   try
      Data:=CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);
      dDataBloqueioDisp:=FieldByName('DATABLOQDISPFINAN').AsDateTime;
   finally
      Free;
   end;

   lblStatusDisp.Caption := '';
   deDataDisp.Date := Date;
end;

procedure TfrmConsDispFinancMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlDisponFinanc.Free;
   CtrlListTerceiros.Free;
   CtrlParamFinanc.Free;
   inherited;
end;

procedure TfrmConsDispFinancMT.dbgrLancamentosCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   if not(Highlight) then
    begin
       if cdsLancamento.FieldByName('CODLANCFINANC').AsString = 'Total Geral' then
          aBrush.Color := $0075FFFF
       else
          if cdsLancamento.FieldByName('CODLANCFINANC').AsString = 'Total por Plano/Patro' then
             aBrush.Color := $00B9FFFF
          else
             aBrush.Color := clWindow;
    end;
end;

procedure TfrmConsDispFinancMT.bbtnImprimeClick(Sender: TObject);
var
   rIDPatro     : Double;
   rIDPlanoPrev : Double;
   sTipo        : String;
begin
   cdsRelatDisp.Close;

   if (Trim(dblcPatro.Text)<>'') then
       rIDPatro:=StrToFloat(dblcPatro.LookupValue)
   else
       rIDPatro:=0;

   if (Trim(dblcPlanoPrev.Text)<>'') then
       rIDPlanoPrev:=StrToFloat(dblcPlanoPrev.LookupValue)
   else
       rIDPlanoPrev:=0;

   //Carrega cdsRelatDisp
   cdsRelatDisp.Data:=CtrlDisponFinanc.ListRelatDisp(Sistema.IdEmpresa,rIDPatro,rIDPlanoPrev,
                                                     deDataDisp.Date);

   if (deDataDisp.Date<=dDataBloqueioDisp) then
      sTipo := ' - Bloqueada'
   else
      sTipo := ' - em Aberto';

   ppLabel2.Caption := 'Disponibilidade Financeira em '+deDataDisp.Text+sTipo;
   if (Trim(dblcPatro.Text)='') and (Trim(dblcPlanoPrev.Text)='') then
      ppLblTituloContaCC2.Caption := 'Plano: Todos    Patrocinadora: Todas'
   else
      if (Trim(dblcPatro.Text)<>'') and (Trim(dblcPlanoPrev.Text)='') then
         ppLblTituloContaCC2.Caption := 'Plano: Todos    Patrocinadora: '+dblcPatro.Text
      else
         if (Trim(dblcPatro.Text)='') and (Trim(dblcPlanoPrev.Text)<>'') then
            ppLblTituloContaCC2.Caption := 'Plano: '+dblcPlanoPrev.Text+'    Patrocinadora: Todas'
         else
            ppLblTituloContaCC2.Caption := 'Plano: '+dblcPlanoPrev.Text+'    Patrocinadora: '+dblcPatro.Text;

   rptRelatDisp.language := lgPortugueseBrazil;
   rptRelatDisp.Device   := dvScreen;
   TFrmPreview.CreateModalPreview(Application,rptRelatDisp,'Consulta de Disponibilidade Financeira');
end;

procedure TfrmConsDispFinancMT.bbtnDivergentesClick(Sender: TObject);
begin
   with TfrmDispDivergentesMT.Create(Self) do
    try
       cdsDispDivergentes.Close;
       cdsDispDivergentes.Data:=CtrlDisponFinanc.ListDispDivergentes(Sistema.IdEmpresa,
                                                                     FormatDateTime('mm/yyyy',now));
       if (cdsDispDivergentes.RecordCount<>0) then
        begin
           ShowModal;
           if ModalResult=mrOK then
            begin
               deDataDisp.Date:=cdsDispDivergentes.FieldByName('DataDispFinanc').AsDateTime;
               btnBuscaClick(nil);
            end;
        end
       else
        MsgDlg('Não Existem Disponibilidades Divergentes.','Aviso',mtWarning,[mbOk],0);  ;
    finally
       Free;
    end;
end;

procedure TfrmConsDispFinancMT.btnBuscaClick(Sender: TObject);
var
   rIDPatro     : Double;
   rIDPlanoPrev : Double;
begin
   if (deDataDisp.Date<=dDataBloqueioDisp) then
      lblStatusDisp.Caption := 'Disponibilidade Bloqueada'
   else
      lblStatusDisp.Caption := 'Disponibilidade em Aberto';

   if (Trim(dblcPatro.Text)<>'') then
       rIDPatro:=StrToFloat(dblcPatro.LookupValue)
   else
       rIDPatro:=0;

   if (Trim(dblcPlanoPrev.Text)<>'') then
       rIDPlanoPrev:=StrToFloat(dblcPlanoPrev.LookupValue)
   else
       rIDPlanoPrev:=0;

   //Carrega cdsLancamento
   cdsLancamento.Close;
   cdsLancamento.Data:=CtrlDisponFinanc.ListConsLancamentos(Sistema.IdEmpresa,rIDPatro,rIDPlanoPrev,
                                                            deDataDisp.Date);
end;


end.
