//******************************************************************************
// Data     : 22/11/2006
// Pendencia: 23787
// SOL      : 43633
// Desc     : Implementação da Consulta
//******************************************************************************

unit FConsTransfPlanosRFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, uCtrlRendaFixa, FPreview, uMensErro, RConsTransPlanosRF,
  uCtrlInvestimento, uInvestimento, uCtrlPadroes;

type
  TfrmConsTransfPlanosRFMT = class(TfrmOkCancelarRelInv)
    cdsPlanoPatroO: TCMClientDataSet;
    cdsInvestimento: TCMClientDataSet;
    dsConsTransPlanosRFMT: TDataSource;
    CdsConsTransPlanosRFMT: TCMClientDataSet;
    sprConsTransPlanosRFMT: TCMSqlParams;
    pnlFiltros: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    lblPlanoPatroOrigem: TLabel;
    lblInvestimento: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    dblkPlanPatroO: TwwDBLookupCombo;
    dblkInvestimento: TwwDBLookupCombo;
    pnlGrid: TPanel;
    grdConsulta: TwwDBGrid;
    lblClasse: TLabel;
    dblkClasseTit: TwwDBLookupCombo;
    CdsClasseTit: TCMClientDataSet;
    CdsConsTransPlanosRFMTBOLETA: TStringField;
    CdsConsTransPlanosRFMTPLANOPATROORIG: TStringField;
    CdsConsTransPlanosRFMTPLANOPATRODEST: TStringField;
    CdsConsTransPlanosRFMTDESCCLASSETIT: TStringField;
    CdsConsTransPlanosRFMTDESCINVESTIMENTO: TStringField;
    CdsConsTransPlanosRFMTDATAOPERACAO: TDateTimeField;
    CdsConsTransPlanosRFMTVENCOPERACAO: TDateTimeField;
    CdsConsTransPlanosRFMTQTDEOPERACAO: TFloatField;
    CdsConsTransPlanosRFMTVLROPERACAO: TFloatField;
    CdsConsTransPlanosRFMTIDPLANPREVCTBPATR: TFloatField;
    CdsConsTransPlanosRFMTIDPLANPREVCTBPATR_1: TFloatField;
    CdsConsTransPlanosRFMTIDCLASSETIT: TFloatField;
    CdsConsTransPlanosRFMTIDINVESTIMENTO: TFloatField;
    CdsConsTransPlanosRFMTPERCTRANSF: TFloatField;
    procedure grdConsultaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdConsultaTopRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
    CtrlRendaFixa          : TCtrlRendaFixa;
    CtrlInvestimento       : TCtrlInvestimento;
    RelConsTransPlanosRF   : TRelConsTransPlanosRF;
  public
    { Public declarations }
  end;

var
   frmConsTransfPlanosRFMT: TfrmConsTransfPlanosRFMT;
   iClasseTit, iPlanPrevOrig, iInvestimento : Integer;

implementation

{$R *.DFM}

procedure TfrmConsTransfPlanosRFMT.grdConsultaCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
            ABrush.Color := $00C0FFFF // amarelo bebê
         else
            ABrush.Color := clWhite;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmConsTransfPlanosRFMT.grdConsultaTopRowChanged(
  Sender: TObject);
begin
  inherited;
  TwwDBGrid(Sender).Invalidate;
end;

procedure TfrmConsTransfPlanosRFMT.FormShow(Sender: TObject);
begin
  inherited;
   if edDataIni.CanFocus then
      edDataIni.SetFocus;
end;

procedure TfrmConsTransfPlanosRFMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   CdsConsTransPlanosRFMT.Data := CtrlRendaFixa.ListOperTrcPlanos(0, 0, -1, -1, -1);
   bt_Imprime.Enabled := False
end;

procedure TfrmConsTransfPlanosRFMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRendaFixa        := TCtrlRendaFixa.Create;
   CtrlInvestimento     := TCtrlInvestimento.Create;
   RelConsTransPlanosRF := TRelConsTransPlanosRF.Create(Self);

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaFixa.InitializeAs(Padroes);

   cdsInvestimento.Data := CtrlInvestimento.ListInvestimento(-1, 1);
   cdsPlanoPatroO.Data  := CtrlInvestimento.ListPlanoPatro;
   CdsClasseTit.Data    := CtrlRendaFixa.ListClasseRenFix;
end;

procedure TfrmConsTransfPlanosRFMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlRendaFixa);
   FreeAndNil(RelConsTransPlanosRF);
   FreeAndNil(CtrlInvestimento);
end;

procedure TfrmConsTransfPlanosRFMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Trim(edDataIni.Text) = '' then
  begin
      MsgDlg('Informe a Data Inicial.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if edDataIni.CanFocus then
         edDataIni.SetFocus;
      Exit;
  end;

  if Trim(edDataFim.Text) = '' then
  begin
      MsgDlg('Informe a Data Final.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if edDataFim.CanFocus then
         edDataFim.SetFocus;
      Exit;
  end;

  if Trim(dblkClasseTit.Text) = '' then
     iClasseTit := -1
  else
     iClasseTit := CdsClasseTit.FieldByName('IDCLASSETIT').AsInteger;

  if Trim(dblkPlanPatroO.Text) = '' then
     iPlanPrevOrig := -1
  else
     iPlanPrevOrig := cdsPlanoPatroO.FieldByName('IDPLANPREVCTBPATR').AsInteger;

  if Trim(dblkInvestimento.Text) = '' then
     iInvestimento := -1
  else
     iInvestimento := cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

  CdsConsTransPlanosRFMT.Data := CtrlRendaFixa.ListOperTrcPlanos(edDataIni.Date, edDataFim.Date,
                                                                 iInvestimento, iClasseTit, iPlanPrevOrig);

  if CdsConsTransPlanosRFMT.IsEmpty then
     bt_Imprime.Enabled := False
  else
     bt_Imprime.Enabled := True;
end;

procedure TfrmConsTransfPlanosRFMT.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   if not CdsConsTransPlanosRFMT.IsEmpty then
   begin
      RelConsTransPlanosRF.CdsConsTransPlanosRFMT.Data := CdsConsTransPlanosRFMT.Data;

      RelConsTransPlanosRF.lblEmpresa.Caption := Investimentos.NomeEmpresa;
      RelConsTransPlanosRF.lblSistema.Caption := Investimentos.NomeModulo;
      RelConsTransPlanosRf.lblPeriodo.Caption := 'Período: ' + edDataIni.Text + ' a ' + edDataFim.Text;

      TFrmPreview.CreateModalPreview(Application,
                                     RelConsTransPlanosRF.rptConsTransPlanosRFMT,
                                     RelConsTransPlanosRF.rptConsTransPlanosRFMT.PrinterSetup.DocumentName);
   end;
   RelConsTransPlanosRF.CdsConsTransPlanosRFMT.EmptyDataSet;
end;

end.
