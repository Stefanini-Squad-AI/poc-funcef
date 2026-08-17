//******************************************************************************
// Data      : 18/10/2006
// Codigo    : AL_1
// Pendência : 23582
// Motivo    : Implementação de Transferência entre CC e CCI
//******************************************************************************
unit FConsTransCCeCCIMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, uCtrlRendaVariavel,
  uMensErro, uCtrlInvestimento, RConsTransCCeCCI, uInvestimento, FPreview,
  uCtrlPadroes;

type
  TFrmConsTransCCeCCIMT = class(TfrmOkCancelarRelInv)
    pnlFiltros: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    lblPlanoPatroOrigem: TLabel;
    lblCarteira: TLabel;
    lblInvestimento: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    dblkPlanPatroO: TwwDBLookupCombo;
    dblkCarteira: TwwDBLookupCombo;
    dblkInvestimento: TwwDBLookupCombo;
    grdConsulta: TwwDBGrid;
    sprConsTransCCeCCIMT: TCMSqlParams;
    CdsConsTransCCeCCIMT: TCMClientDataSet;
    dsConsTransCCeCCIMT: TDataSource;
    cdsInvestimento: TCMClientDataSet;
    cdsCarteira: TCMClientDataSet;
    cdsPlanoPatro: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    dblkOperTRCCCI: TwwDBLookupCombo;
    lblOperTRCCCi: TLabel;
    CdsConsTransCCeCCIMTIDTIPOOPERACAO: TFloatField;
    CdsConsTransCCeCCIMTDATAOPERACAO: TDateTimeField;
    CdsConsTransCCeCCIMTNUMDOCUMENTO: TStringField;
    CdsConsTransCCeCCIMTQTDEOPERACAO: TFloatField;
    CdsConsTransCCeCCIMTIDINVESTIMENTO: TFloatField;
    CdsConsTransCCeCCIMTIDCARTEIRAINVEST: TFloatField;
    CdsConsTransCCeCCIMTPERCENTUAL: TFloatField;
    CdsConsTransCCeCCIMTIDCARTEIRAGERENC: TFloatField;
    CdsConsTransCCeCCIMTIDPLANPREVCTBPATR: TFloatField;
    CdsConsTransCCeCCIMTDESCCARTINVEST: TStringField;
    CdsConsTransCCeCCIMTPLANPRVCONTABPATRO: TStringField;
    CdsConsTransCCeCCIMTDESCINVESTIMENTO: TStringField;
    CdsConsTransCCeCCIMTDESCTIPOOPERACAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdConsultaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdConsultaTopRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestimento  : TCtrlInvestimento;
    CtrlRendaVariavel : TCtrlRendaVariavel;
    RelConsTransCCeCCI   : TRelConsTransCCeCCI;
  public
    { Public declarations }
  end;

var
  FrmConsTransCCeCCIMT: TFrmConsTransCCeCCIMT;
  iCarteira, iPlanPrev, iInvestimento, iTipoOperacao : Integer;


implementation

{$R *.DFM}

procedure TFrmConsTransCCeCCIMT.FormCreate(Sender: TObject);
begin
  inherited;
   RelConsTransCCeCCI   := TRelConsTransCCeCCI.Create(Self);
   CtrlInvestimento     := TCtrlInvestimento.Create;
   CtrlRendaVariavel    := TCtrlRendaVariavel.Create;

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaVariavel.InitializeAs(Padroes);

   cdsCarteira.Data     := CtrlInvestimento.ListCarteira(2, -1, 0);
   cdsInvestimento.Data := CtrlInvestimento.ListInvestimento(-1, 2);
   cdsPlanoPatro.Data   := CtrlInvestimento.ListPlanoPatro;
   CdsTipoOper.Data     := CtrlRendaVariavel.ListTipoOperRenVar('-162,-163');
end;

procedure TFrmConsTransCCeCCIMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(RelConsTransCCeCCI);
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaVariavel);
end;

procedure TFrmConsTransCCeCCIMT.grdConsultaCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
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

procedure TFrmConsTransCCeCCIMT.grdConsultaTopRowChanged(Sender: TObject);
begin
  inherited;
  TwwDBGrid(Sender).Invalidate;
end;

procedure TFrmConsTransCCeCCIMT.FormShow(Sender: TObject);
begin
  inherited;
   if edDataIni.CanFocus then
      edDataIni.SetFocus;
end;

procedure TFrmConsTransCCeCCIMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   CdsConsTransCCeCCIMT.Data := CtrlRendaVariavel.ListOperTrcCCeCCI(0, 0, -1, -1, -1);
   bt_Imprime.Enabled := False
end;

procedure TFrmConsTransCCeCCIMT.bbtnConfirmarClick(Sender: TObject);
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

  iPlanPrev := -1;
  iCarteira := -1;
  iInvestimento := -1;
  iTipoOperacao := -1;

  if Trim(dblkPlanPatroO.Text) <> '' then
     iPlanPrev := cdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;

  if Trim(dblkCarteira.Text) <> '' then
     iCarteira := cdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

  if Trim(dblkInvestimento.Text) <> '' then
     iInvestimento := cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

  if Trim(dblkOperTRCCCI.Text) <> '' then
     iTipoOperacao := CdsTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger;

  CdsConsTransCCeCCIMT.Data := CtrlRendaVariavel.ListOperTrcCCeCCI(edDataIni.Date, edDataFim.Date,
                                                                   iInvestimento, iCarteira, iPlanPrev, iTipoOperacao);

  if CdsConsTransCCeCCIMT.IsEmpty then
     bt_Imprime.Enabled := False
  else
     bt_Imprime.Enabled := True;
end;

procedure TFrmConsTransCCeCCIMT.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   if not CdsConsTransCCeCCIMT.IsEmpty then
   begin
      RelConsTransCCeCCI.CdsConsTransCCeCCIMT.Data := CdsConsTransCCeCCIMT.Data;

      RelConsTransCCeCCI.lblEmpresa.Caption := Investimentos.NomeEmpresa;
      RelConsTransCCeCCI.lblSistema.Caption := Investimentos.NomeModulo;
      RelConsTransCCeCCI.lblPeriodo.Caption := 'Período: ' + edDataIni.Text + ' a ' + edDataFim.Text;

      TFrmPreview.CreateModalPreview(Application,
                                     RelConsTransCCeCCI.rptConsTransCCeCCIMT,
                                     RelConsTransCCeCCI.rptConsTransCCeCCIMT.PrinterSetup.DocumentName);
   end;
   RelConsTransCCeCCI.CdsConsTransCCeCCIMT.EmptyDataSet;
end;

end.
