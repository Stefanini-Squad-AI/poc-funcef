//******************************************************************************
// Data     : 30/10/2006
// Código   : AL_2
// Pendencia:
// SOL      :
// Desc     : Segregação de Planos
//******************************************************************************

unit FConsLanContAtuRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Grids, Wwdbigrd, Wwdbgrid, wwdblook, CMDBLookupCombo, Db, DBTables,
  Wwquery, FPreview, Wwdatsrc, ComCtrls;

type
  TfrmConsLanContAtuRV = class(TfrmOkCancelarInv)
    pnlDados: TPanel;
    lblDtRef: TLabel;
    dtDataRef: TCMDateTimePicker;
    lblCarteira: TLabel;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    Panel1: TPanel;
    lblInvestimento: TLabel;
    pgcDetalhe: TPageControl;
    dbgLanContAtuRV: TwwDBGrid;
    dblCarteira: TwwDBLookupCombo;
    dblInvestimento: TwwDBLookupCombo;
    //AL_2
    dblPlanPatro: TwwDBLookupCombo;
    lblPlanoPatro: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgLanContAtuRVCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgLanContAtuRVTopRowChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsLanContAtuRV: TfrmConsLanContAtuRV;
  iCarteira: Integer;
  dDataAtual: TDateTime;

implementation

//AL_2
uses FDmRelLanContAtuRV, uMensErro, UOperComum, FPrincipal;

{$R *.DFM}

procedure TfrmConsLanContAtuRV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   DmRelLanContAtuRV.qryLanContAtuRV.Close;
   DmRelLanContAtuRV.qryCarteira.Close;
   DmRelLanContAtuRV.qryInvestimento.Close;
end;

procedure TfrmConsLanContAtuRV.FormShow(Sender: TObject);
begin
  inherited;
   DmRelLanContAtuRV.QryPlanoPatro.Open;
   DmRelLanContAtuRV.qryCarteira.Open;
   DmRelLanContAtuRV.qryInvestimento.Open;
end;

procedure TfrmConsLanContAtuRV.FormCreate(Sender: TObject);
begin
  inherited;
   //AL_2
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

procedure TfrmConsLanContAtuRV.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if Trim(dtDataRef.Text) = '' then
   begin
      MsgDlg('Data não informada !','Atenção ',mtWarning,[mbOK],0);
      if dtDataRef.CanFocus then
         dtDataRef.SetFocus;
      exit;
   end;

   OperComum.LimpaParametros(DmRelLanContAtuRV.qryLanContAtuRV);
   DmRelLanContAtuRV.qryLanContAtuRV.ParamByName('DATAREF').AsString := dtDataRef.Text;
   if Trim(dblCarteira.Text) <> '' then
      DmRelLanContAtuRV.qryLanContAtuRV.ParamByName('IDCARTEIRAINVEST').AsInteger :=
         DmRelLanContAtuRV.qryCarteiraIDCARTEIRAINVEST.AsInteger;
   if Trim(dblInvestimento.Text) <> '' then
      DmRelLanContAtuRV.qryLanContAtuRV.ParamByName('IDINVESTIMENTO').AsInteger :=
         DmRelLanContAtuRV.qryInvestimentoIDINVESTIMENTO.AsInteger;
   //AL_2
   if Trim(dblPlanPatro.Text) <> '' then
      DmRelLanContAtuRV.qryLanContAtuRV.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
         DmRelLanContAtuRV.QryPlanoPatroIDPLANPREVCTBPATR.AsInteger;
   DmRelLanContAtuRV.qryLanContAtuRV.Open;

   if not DmRelLanContAtuRV.qryLanContAtuRV.IsEmpty then
      bbtnImprimir.Enabled := True
   else
   begin
      bbtnImprimir.Enabled := False;
      MsgDlg('Não existem registros para a Data informada !','Atenção ',mtWarning,[mbOK],0);
   end;
end;

procedure TfrmConsLanContAtuRV.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   //AL_2
   OperComum.LimpaParametros(DmRelLanContAtuRV.QryLanContAtuRv);
   DmRelLanContAtuRV.QryLanContAtuRv.Open;

   bbtnImprimir.Enabled := False;
end;

procedure TfrmConsLanContAtuRV.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
   with DmRelLanContAtuRV do
   begin
      if not qryLanContAtuRV.IsEmpty then
      begin
         qryLanContAtuRV.DisableControls;

         TfrmPreview.CreateModalPreview(Application,
                                        rptLanContAtuRV,
                                        rptLanContAtuRV.PrinterSetup.DocumentName);
         qryLanContAtuRV.EnableControls;
      end;
   end;
end;

procedure TfrmConsLanContAtuRV.dbgLanContAtuRVCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
            ABrush.Color := $00C0FFFF (* amarelo *)
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

procedure TfrmConsLanContAtuRV.dbgLanContAtuRVTopRowChanged(
  Sender: TObject);
begin
  inherited;
   Application.ProcessMessages;
end;

end.
