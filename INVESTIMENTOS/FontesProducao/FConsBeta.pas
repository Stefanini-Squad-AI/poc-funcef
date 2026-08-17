unit FConsBeta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables, Wwquery, wwdblook, FPreview,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, ComCtrls;

type
  TfrmConsBeta = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    dtDataInicio: TCMDateTimePicker;
    dtDataFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    PageControl1: TPageControl;
    tbsInvestimentos: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    dbgItens: TwwDBGrid;
    Panel2: TPanel;
    pnlInvCart: TPanel;
    dbgOperacoes: TwwDBGrid;
    tbsCarteiras: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    wwDBGrid2: TwwDBGrid;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dtDataInicioExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtDataInicioChange(Sender: TObject);
    procedure dtDataFimChange(Sender: TObject);
    procedure wwDBGrid1RowChanged(Sender: TObject);
    procedure ChageItens;    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsBeta: TfrmConsBeta;

implementation

uses FDMRelBeta, UMensErro, UBibliotecaInvest, uOperComum;

{$R *.DFM}

procedure TfrmConsBeta.FormShow(Sender: TObject);
begin
   inherited;
   dtDataInicio.Date := pRPI.DATAULTFECH;
   dtDataFim.Date := pRPI.DATAULTFECH;
end;

procedure TfrmConsBeta.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if Trim(dtDataInicio.Text) = '' then
   begin
      MsgDlg('Falta Data Inicio para o Relatório.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      dtDataInicio.SetFocus;
      exit;
   end;
   if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('Falta Data Final para o Relatório.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      dtDataFim.SetFocus;
      exit;
   end;

   OperComum.LimpaParametros(DmRelBeta.qryCarteiras);
   DmRelBeta.qryCarteiras.ParamByName('DATAINI').AsString := dtDataInicio.Text;
   DmRelBeta.qryCarteiras.ParamByName('DATAFIM').AsString := dtDataFim.Text;
   DmRelBeta.qryCarteiras.Open;
   DmRelBeta.qryCarteiras.First;

   OperComum.LimpaParametros(DmRelBeta.qryInvestimentos);
   OperComum.LimpaParametros(DmRelBeta.qryInvItens);
   DmRelBeta.qryInvestimentos.ParamByName('DATAINI').AsString := dtDataInicio.Text;
   DmRelBeta.qryInvestimentos.ParamByName('DATAFIM').AsString := dtDataFim.Text;
   DmRelBeta.qryInvItens.ParamByName('DATAINI').AsString := dtDataInicio.Text;
   DmRelBeta.qryInvItens.ParamByName('DATAFIM').AsString := dtDataFim.Text;
   DmRelBeta.qryInvestimentos.Open;

   if not (DmRelBeta.qryCarteiras.IsEmpty) then
      ChageItens;

   if not (DmRelBeta.qryInvestimentos.IsEmpty) then
      DmRelBeta.qryInvItens.Filter := 'IDINVESTIMENTO = ' +
                                      DmRelBeta.qryInvestimentosIDINVESTIMENTO.AsString;

   DmRelBeta.qryInvItens.Open;

   if ((DmRelBeta.qryCarteiras.IsEmpty) and (DmRelBeta.qryInvestimentos.IsEmpty)) then
      bbtnImprimir.Enabled := False
   else
      bbtnImprimir.Enabled := True;

end;

procedure TfrmConsBeta.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  DmRelBeta.lblTitPeriodoCart.Caption := 'Período: ' + dtDataInicio.Text + ' até ' + dtDataFim.Text;
  DmRelBeta.lblTitPeriodoInv.Caption := 'Período: ' + dtDataInicio.Text + ' até ' + dtDataFim.Text;

  TfrmPreview.CreateModalPreview(Application,
                                 DmRelBeta.rptBeta,
                                 DmRelBeta.rptBeta.PrinterSetup.DocumentName);

end;

procedure TfrmConsBeta.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   DmRelBeta.qryCarteiras.Close;
   DmRelBeta.qryInvestimentos.Close;
   DmRelBeta.qryCartItens.Close;
   DmRelBeta.qryInvItens.Close;
   bbtnImprimir.Enabled := False;
   dtDataInicio.SetFocus;
end;

procedure TfrmConsBeta.dtDataInicioExit(Sender: TObject);
begin
  inherited;
  if Trim(dtDataFim.Text) = '' then
     dtDataFim.DateTime := dtDataInicio.DateTime;
end;

procedure TfrmConsBeta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DmRelBeta.qryCarteiras.Close;
   DmRelBeta.qryInvestimentos.Close;
   DmRelBeta.qryCartItens.Close;
   DmRelBeta.qryInvItens.Close;
   inherited;
end;

procedure TfrmConsBeta.dtDataInicioChange(Sender: TObject);
begin
   inherited;
   DmRelBeta.qryCarteiras.Close;
   DmRelBeta.qryInvestimentos.Close;
   DmRelBeta.qryCartItens.Close;
   DmRelBeta.qryInvItens.Close;
   bbtnImprimir.Enabled := False;
end;

procedure TfrmConsBeta.dtDataFimChange(Sender: TObject);
begin
   inherited;
   DmRelBeta.qryCarteiras.Close;
   DmRelBeta.qryInvestimentos.Close;
   DmRelBeta.qryCartItens.Close;
   DmRelBeta.qryInvItens.Close;
   bbtnImprimir.Enabled := False;
end;

procedure TfrmConsBeta.wwDBGrid1RowChanged(Sender: TObject);
begin
  inherited;
   ChageItens
end;

procedure TfrmConsBeta.ChageItens;
begin
   OperComum.LimpaParametros(DmRelBeta.qryCartItens);
   DmRelBeta.qryCartItens.ParamByName('DATAINI').AsString := dtDataInicio.Text;
   DmRelBeta.qryCartItens.ParamByName('DATAFIM').AsString := dtDataFim.Text;
   DmRelBeta.qryCartItens.ParamByName('IDPLANPREVCTBPATR').AsInteger := DmRelBeta.qryCarteirasIDPLANPREVCTBPATR.AsInteger;
   DmRelBeta.qryCartItens.ParamByName('IDCARTEIRAINVEST').AsInteger  := DmRelBeta.qryCarteirasIDCARTEIRAINVEST.AsInteger;;
   if DmRelBeta.qryCarteirasIDCARTEIRAGERENC.IsNull then
      DmRelBeta.qryCartItens.ParamByName('IDCARTEIRAGERENC').Clear
   else
      DmRelBeta.qryCartItens.ParamByName('IDCARTEIRAGERENC').AsInteger := DmRelBeta.qryCarteirasIDCARTEIRAGERENC.AsInteger;
   DmRelBeta.qryCartItens.Open;
end;

end.
