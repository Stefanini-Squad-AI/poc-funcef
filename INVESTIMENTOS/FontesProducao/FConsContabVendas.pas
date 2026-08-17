//******************************************************************************
// Data     : 07/01/2005
// Motivo   : Implementação do Relatório de Lancamentos Contábeis de OPE de RV
//******************************************************************************

unit FConsContabVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, ComCtrls, Db, DBTables, Wwquery,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid,
  Wwdatsrc, Gauges, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Menus, FPreview;

type
  TfrmConsContabVendas = class(TfrmOkCancelarInv)
    PnlSelecao: TPanel;
    lblDataRef: TLabel;
    lblCarteira: TLabel;
    dDataRef: TCMDateTimePicker;
    dblCarteira: TwwDBLookupCombo;
    pnlGrid: TPanel;
    dbgOrdens: TwwDBGrid;
    btImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    lblInvestimento: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgOrdensTopRowChanged(Sender: TObject);
    procedure dbgOrdensCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
  private
    { Private declarations }
    sData: String;
    bFechada: Boolean;
    procedure AbreQuery;
    procedure FechaQuery;
  public
    { Public declarations }
  end;

var
  frmConsContabVendas: TfrmConsContabVendas;

implementation

uses UBibliotecaInvest, DBaseDados, ComObj, UDataBase, UMensErro,
     UOperComum, FDmRelContabVendas;

{$R *.DFM}

{ TfrmConsCartGerenc }

procedure TfrmConsContabVendas.AbreQuery;
begin
   if (Trim(dDataRef.Text) = '') then
   begin
      MsgDlg('Data não Selecionada.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      if dDataRef.CanFocus then
         dDataRef.SetFocus;
      Exit;
   end;

   with DmRelContabVendas do
   begin
      OperComum.LimpaParametros(qryOrdens);
      qryOrdens.ParamByName('IDCARTEIRAINVEST').AsInteger  := qryCarteiraIDCARTEIRAINVEST.AsInteger;
      qryOrdens.ParamByName('DATA').AsString := dDataRef.Text;
      qryOrdens.Open;

      if qryOrdens.IsEmpty then
         btImprimir.Enabled := False
      else
         btImprimir.Enabled := True;

      bFechada := False;
      dbgOrdens.FixedCols := 0;
   end;
end;

procedure TfrmConsContabVendas.FechaQuery;
begin
   if not bFechada then
   begin
      OperComum.LimpaParametros(DmRelContabVendas.qryOrdens);
      DmRelContabVendas.qryOrdens.Open;
      btImprimir.Enabled := False;
   end;
   bFechada := True;
   dbgOrdens.FixedCols := 0;
end;

procedure TfrmConsContabVendas.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  FechaQuery;
end;

procedure TfrmConsContabVendas.btImprimirClick(Sender: TObject);
begin
   inherited;
   DmRelContabVendas.lblDataOper.Caption := 'Operações Realizadas em: ' + dDataRef.Text;

   DmRelContabVendas.qryOrdens.DisableControls;
   TfrmPreview.CreateModalPreview(Application,
                                  DmRelContabVendas.rptContabVendas,
                                  DmRelContabVendas.rptContabVendas.PrinterSetup.DocumentName);
   DmRelContabVendas.qryOrdens.EnableControls;

   frmConsContabVendas.WindowState := wsMaximized;
end;

procedure TfrmConsContabVendas.FormShow(Sender: TObject);
begin
  inherited;
   DmRelContabVendas.QryCarteira.Open;
   DmRelContabVendas.qryInvestimento.Open;
end;

procedure TfrmConsContabVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DmRelContabVendas.qryOrdens.close;
   DmRelContabVendas.QryCarteira.Open;
   DmRelContabVendas.qryInvestimento.Open;
end;

procedure TfrmConsContabVendas.dbgOrdensTopRowChanged(Sender: TObject);
begin
  inherited;
   Application.ProcessMessages;
end;

procedure TfrmConsContabVendas.dbgOrdensCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   // Pinta o Grid Zebrado de Amarelo Bebe e Branco
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
            ABrush.Color := $00C0FFFF (* amarelo bebê *)
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

end.



