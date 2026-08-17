unit FConsBoletaOperRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook,FPreview, Db, DBTables, Wwquery;

type
  TfrmConsBoletaOperRenFix = class(TfrmOkCancelarInv)
    Label3: TLabel;
    dblkEmissor: TwwDBLookupCombo;
    Label4: TLabel;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    Label5: TLabel;
    dtDataInicio: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dtDataFim: TCMDateTimePicker;
    bbtnImprimir: TBitBtn;
    qryPlanPrevCtbPatr: TwwQuery;
    qryInvestimento: TwwQuery;
    qryEmissor: TwwQuery;
    lblClasseTit: TLabel;
    dblkClasseTit: TwwDBLookupCombo;
    qryClasseTit: TwwQuery;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevCtbPatrIDPLANOPREV: TFloatField;
    qryPlanPrevCtbPatrIDPATRO: TFloatField;
    dblkInvestimento: TwwDBLookupCombo;
    qryEmissorIDEMISSOR: TFloatField;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryClasseTitIDCLASSETIT: TFloatField;
    qryClasseTitDESCCLASSETIT: TStringField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoQTDEOPERACAO: TFloatField;
    qryInvestimentoPUOPERACAO: TFloatField;
    qryInvestimentoVLROPERACAO: TFloatField;
    qryInvestimentoVENCOPERACAO: TDateTimeField;
    qryInvestimentoIDOPERRENFIXAPLIC: TFloatField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoBOLETA: TStringField;
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkEmissorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkEmissorExit(Sender: TObject);
    procedure dblkClasseTitCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkClasseTitExit(Sender: TObject);
    procedure dtDataInicioExit(Sender: TObject);
    procedure dtDataFimExit(Sender: TObject);
    procedure dblPlanPrevCtbPatrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblPlanPrevCtbPatrExit(Sender: TObject);
  private
    { Private declarations }
    bModal: Boolean;
    procedure PosicionaInvestimento;
    function VerificaCampos:boolean;
    procedure SetModal(bMod: Boolean);
  published
    { Published declarations }
     Property fModal: boolean read bModal write SetModal;
  public
    { Public declarations }
  end;

var
  frmConsBoletaOperRenFix: TfrmConsBoletaOperRenFix;

implementation

uses FDMRelBoletaRenFixOper, UOperComum, UMensErro, UBibliotecaInvest;


{$R *.DFM}

procedure TfrmConsBoletaOperRenFix.bbtnImprimirClick(Sender: TObject);
begin
   inherited;
   if not VerificaCampos then
      Exit;
   OperComum.LimpaParametros(DMRelBoletaRenFixOper.qryBoletaOper);
   with (DMRelBoletaRenFixOper.qryBoletaOper) do
   begin
      if Trim(dblkInvestimento.Text) <> '' then
         ParamByName('IDOPERRENFIXAPLIC').AsInteger    := StrToInt(dblkInvestimento.LookupValue);
      if Trim(dblPlanPrevCtbPatr.Text) <> '' then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
      if Trim(dblkEmissor.Text) <> '' then
         ParamByName('IDEMISSOR').AsInteger         := StrToInt(dblkEmissor.LookupValue);
      if Trim(dblkClasseTit.Text) <> '' then
         ParamByName('IDCLASSETIT').AsInteger       := StrToInt(dblkClasseTit.LookupValue);
      ParamByName('DATAINI').AsString :=  dtDataInicio.Text;
      ParamByName('DATAFIM').AsString :=  dtDataFim.Text;
      Open;
      if not IsEmpty then
      begin
         if not bModal then
            TfrmPreview.CreateModalPreview(Application,
                                           DMRelBoletaRenFixOper.rptBoletaRenFix,
                                           DMRelBoletaRenFixOper.rptBoletaRenFix.PrinterSetup.DocumentName)
         else
            DMRelBoletaRenFixOper.rptBoletaRenFix.PrintToDevices;

      end
      else
      begin
         MsgDlg('Não foi encontrada nenhuma operação com os parâmetros informados.','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dtDataInicio.CanFocus then
            dtDataInicio.SetFocus;
      end;
   end;
   if bModal then
      bbtnSair.Click;
end;

procedure TfrmConsBoletaOperRenFix.FormShow(Sender: TObject);
begin
   inherited;
   qryPlanPrevCtbPatr.Open;
   qryEmissor.Open;
   OperComum.LimpaParametros(qryInvestimento);
   qryInvestimento.Open;
   qryClasseTit.Open;

   dtDataInicio.Text := DateToStr(pRPI.DATAULTFECHRF);
   dtDataInicio.DateTime := pRPI.DATAULTFECHRF;
   dtDataFim.Text := DateToStr(pRPI.DATAULTFECHRF);
   dtDataFim.DateTime := pRPI.DATAULTFECHRF;

   if dtDataInicio.CanFocus then
      dtDataInicio.SetFocus
end;

procedure TfrmConsBoletaOperRenFix.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryPlanPrevCtbPatr.Close;
   qryEmissor.Close;
   qryInvestimento.Close;
   qryClasseTit.Close;
end;

procedure TfrmConsBoletaOperRenFix.PosicionaInvestimento;
begin
   if ((Trim(dtDataInicio.Text) <> '') AND (Trim(dtDataFim.Text) <> '')) then
   begin
      OperComum.LimpaParametros(qryInvestimento);
      qryInvestimento.ParamByName('DATAINI').AsString := dtDataInicio.Text;
      qryInvestimento.ParamByName('DATAFIM').AsString := dtDataFim.Text;
      if Trim(dblPlanPrevCtbPatr.Text) <> '' then
         qryInvestimento.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
      if Trim(dblkEmissor.Text) <> '' then
         qryInvestimento.ParamByName('IDEMISSOR').AsInteger := StrToInt(dblkEmissor.LookupValue);
      if Trim(dblkClasseTit.Text) <> '' then
         qryInvestimento.ParamByName('IDCLASSETIT').AsInteger := StrToInt(dblkClasseTit.LookupValue);
      qryInvestimento.Open;
   end;
end;

procedure TfrmConsBoletaOperRenFix.dblkEmissorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   PosicionaInvestimento;
end;

procedure TfrmConsBoletaOperRenFix.dblkEmissorExit(Sender: TObject);
begin
  inherited;
   PosicionaInvestimento;
end;

procedure TfrmConsBoletaOperRenFix.dblkClasseTitCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   PosicionaInvestimento;
end;

procedure TfrmConsBoletaOperRenFix.dblkClasseTitExit(Sender: TObject);
begin
  inherited;
   PosicionaInvestimento;
end;

function TfrmConsBoletaOperRenFix.VerificaCampos:boolean;
begin
   Result := False;
   if Trim(dtDataInicio.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataInicio.CanFocus then
         dtDataInicio.SetFocus;
      Exit;
   end;

   if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('Data Final não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Exit;
   end;
   Result := True;
end;

procedure TfrmConsBoletaOperRenFix.dtDataInicioExit(Sender: TObject);
begin
  inherited;
   if dtDataInicio.DateTime > dtDataFim.DateTime then
   begin
      dtDataFim.Text := dtDataInicio.Text;
      dtDataFim.DateTime := dtDataInicio.DateTime;
   end;

   PosicionaInvestimento;
end;

procedure TfrmConsBoletaOperRenFix.dtDataFimExit(Sender: TObject);
begin
  inherited;
   if dtDataInicio.DateTime > dtDataFim.DateTime then
   begin
      MsgDlg('A Data Inicial deve ser menor que a Data Final', 'Mensagem do Sistema', mtInformation, [mbOk],0);
      dtDataFim.Text := dtDataInicio.Text;
      dtDataFim.DateTime := dtDataInicio.DateTime;
   end;

   PosicionaInvestimento;
end;

procedure TfrmConsBoletaOperRenFix.dblPlanPrevCtbPatrCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   PosicionaInvestimento;
end;

procedure TfrmConsBoletaOperRenFix.dblPlanPrevCtbPatrExit(Sender: TObject);
begin
  inherited;
   PosicionaInvestimento;
end;

procedure TfrmConsBoletaOperRenFix.SetModal(bMod: Boolean);
begin
   bModal := bMod;
end;

end.
