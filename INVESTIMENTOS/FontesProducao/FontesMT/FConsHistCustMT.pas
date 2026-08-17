//******************************************************************************
// Data     : 28/09/2006
// Código   : AL_3
// Pendencia: 22967
// SOL      :
// Desc     : Segregação de Planos
//            Retirada da Implementação de CC e CCI nos saldos de Custódia
//******************************************************************************
// Data     : 30/08/2006
// Código   : AL_2
// Pendencia:
// SOL      :
// Desc     : Acerto na função de Cor do Grid
//******************************************************************************
// Data     : 25/04/2006
// Código   : AL_1
// Pendencia:
// SOL      :
// Desc     : Implementação de CC e CCI nos saldos de Custódia
//******************************************************************************
unit FConsHistCustMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Db, DBClient,
  uCMClientDataSet, uInvestimento, uCtrlInvestimento, uCtrlPadroes, DBaseDados,
  uMensErro, uSistema, uCtrlRendaVariavel, uCtrlCustodia, RHistCustodia, uCmSqlParams,
  FPreview, Wwquery, DBTables;

type
  TFrmConsHistCustMT = class(TfrmOkCancelarRelInv)
    pnlFiltros: TPanel;
    pnlGrid: TPanel;
    grdConsulta: TwwDBGrid;
    Label6: TLabel;
    edDataIni: TCMDateTimePicker;
    Label8: TLabel;
    edDataFim: TCMDateTimePicker;
    Label2: TLabel;
    dblCarteira: TwwDBLookupCombo;
    Label1: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    Label4: TLabel;
    dblCustodiante: TwwDBLookupCombo;
    Label7: TLabel;
    dblMotBlq: TwwDBLookupCombo;

    cdsCarteira: TCMClientDataSet;
    cdsCustodiante: TCMClientDataSet;
    cdsInvestimento: TCMClientDataSet;
    cdsMotivoBloq: TCMClientDataSet;
    cdsHistCustodia: TCMClientDataSet;
    dsHistCustodia: TDataSource;
    sprHistCustodia: TCMSqlParams;
    cdsPlanoPatro: TCMClientDataSet;
    Label3: TLabel;
    dblPlanoPrev: TwwDBLookupCombo;
    cdsHistCustodiaDESCCARTINVEST: TStringField;
    cdsHistCustodiaSGLCUSTODIANTE: TStringField;
    cdsHistCustodiaDESCINVESTIMENTO: TStringField;
    cdsHistCustodiaDESCMOTBLOQ: TStringField;
    cdsHistCustodiaDATAMOVCUSTOD: TDateTimeField;
    cdsHistCustodiaDESCTIPOOPERACAO: TStringField;
    cdsHistCustodiaSALDOANTERIOR: TFloatField;
    cdsHistCustodiaQTDEMOVCUSTOD: TFloatField;
    cdsHistCustodiaSALDOATUAL: TFloatField;
    cdsHistCustodiaMOVIMENTO: TStringField;
    cdsHistCustodiaIDCUSTODIA: TFloatField;
    cdsHistCustodiaIDOPERACAOINVEST: TFloatField;
    cdsHistCustodiaIDCARTEIRAINVEST: TFloatField;
    cdsHistCustodiaIDINVESTIMENTO: TFloatField;
    cdsHistCustodiaIDCUSTODIANTE: TFloatField;
    cdsHistCustodiaIDMOTIVOBLOQUEIO: TFloatField;
    cdsHistCustodiaTIPOCUSTODIA: TStringField;
    cdsHistCustodiaPLANPRVCONTABPATRO: TStringField;

    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdConsultaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdConsultaTopRowChanged(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestimento  : TCtrlInvestimento;
    CtrlRendaVariavel : TCtrlRendaVariavel;
    relHistCustodia   : TRelHistCustodia;
  public
    { Public declarations }
  end;

var
  FrmConsHistCustMT: TFrmConsHistCustMT;

implementation

{$R *.DFM}

procedure TFrmConsHistCustMT.FormCreate(Sender: TObject);
begin
   inherited;
   relHistCustodia   := TRelHistCustodia.Create(Self);
   CtrlInvestimento  := TCtrlInvestimento.Create;
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaVariavel.InitializeAs(Padroes);

   //AL_3
   cdsPlanoPatro.Data := CtrlInvestimento.ListPlanoPatro;
   cdsCarteira.Data := CtrlInvestimento.ListCarteira(2, -1, 0);
   cdsInvestimento.Data := CtrlInvestimento.ListInvestimento(-1, 2);
   cdsCustodiante.Data := CtrlInvestimento.ListCustodiante(-1);
   cdsMotivoBloq.Data := CtrlInvestimento.ListMotivoBloqueio(-1);

end;

procedure TFrmConsHistCustMT.bbtnConfirmarClick(Sender: TObject);
//AL_3
var iPlanoPrev, iCarteira, iCustodiante, iInvestimento, iMotBloq: Integer;
begin
   inherited;
   //AL_3 - Ini
   iPlanoPrev := -1;
   iCarteira := -1;
   iCustodiante := -1;
   iInvestimento := -1;
   iMotBloq := -1;

   if Trim(dblPlanoPrev.Text) <> '' then
      iPlanoPrev := cdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;

   if Trim(dblCarteira.Text) <> '' then
      iCarteira := cdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

   if Trim(dblCustodiante.Text) <> '' then
      iCustodiante := cdsCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;

   if Trim(dblInvestimento.Text) <> '' then
      iInvestimento := cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

   if Trim(dblMotBlq.Text) <> '' then
      iMotBloq := cdsMotivoBloq.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;

  cdsHistCustodia.Data := relHistCustodia.CtrlCustodia.ListaRelHistCustodia(edDataIni.Date, edDataFim.Date,
                                                                            iPlanoPrev, iCarteira, iCustodiante, iInvestimento, iMotBloq);
  if cdsHistCustodia.IsEmpty then
     bt_Imprime.Enabled := False
  else
     bt_Imprime.Enabled := True;
   //AL_3 - Fim

end;


procedure TFrmConsHistCustMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(relHistCustodia);
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaVariavel);
   inherited;
end;

procedure TFrmConsHistCustMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //AL_3
  cdsHistCustodia.Data := relHistCustodia.CtrlCustodia.ListaRelHistCustodia(0, 0, -1, -1, -1, -1);
  bt_Imprime.Enabled := False
end;

procedure TFrmConsHistCustMT.bt_ImprimeClick(Sender: TObject);
begin
   inherited;

   relHistCustodia.cdsHistCustodia.Data := cdsHistCustodia.Data;

   relHistCustodia.lblEmpresa.Caption := Investimentos.NomeEmpresa;
   relHistCustodia.lblSistema.Caption := Investimentos.NomeModulo;
   relHistCustodia.lblPeriodo.Caption := 'Período: ' + edDataIni.Text + ' a ' + edDataFim.Text;

   if not cdsHistCustodia.IsEmpty then
   begin
      TFrmPreview.CreateModalPreview(Application,
                                     relHistCustodia.rptHistCustodia,
                                     relHistCustodia.rptHistCustodia.PrinterSetup.DocumentName);
   end;
   relHistCustodia.cdsHistCustodia.EmptyDataSet;

end;

procedure TFrmConsHistCustMT.FormShow(Sender: TObject);
begin
  inherited;
  //AL_3
  cdsHistCustodia.Data := relHistCustodia.CtrlCustodia.ListaRelHistCustodia(0, 0, -1, -1, -1, -1);
end;

//AL_2
procedure TFrmConsHistCustMT.grdConsultaCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
const clYellowBaby = $00C0FFFF; //Amarelo Bebê
begin
  inherited;
  if not (gdFixed in State) then
  begin
     if TwwDBGrid(Sender).CalcCellRow = TwwDBGrid(Sender).GetActiveRow then
     begin
        if not ((gdSelected in State) or (gdFocused in State)) then
        begin
           if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
              AFont.Color := clYellowBaby
           else
              AFont.Color := clHighLightText;
        end
        else
           AFont.Color := clSilver;
        ABrush.Color := clHighLight;
     end
     else
     if not ((gdSelected in State) or (gdFocused in State)) then
     begin
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
           ABrush.Color := clYellowBaby
        else
           ABrush.Color := clWhite;
     end
     else
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;
end;

//AL_2
procedure TFrmConsHistCustMT.grdConsultaTopRowChanged(Sender: TObject);
begin
  inherited;
  TwwDBGrid(Sender).Invalidate;
end;

end.
