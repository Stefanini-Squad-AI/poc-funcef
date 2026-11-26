// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 23.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FConsDOCAlimReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid, Wwdatsrc;

type
  TfrmConsDOCAlimReserva = class(TfrmSairAjuda)
    qryPatro: TwwQuery;
    qryPlanPrev: TwwQuery;
    dbgrdDocumentos: TwwDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    EDANOMES: TEdit;
    dblkpcmbPatro: TwwDBLookupCombo;
    dblkpcmbPlano: TwwDBLookupCombo;
    qryDocumentos: TwwQuery;
    bbtnProcurar: TBitBtn;
    dsDocumentos: TwwDataSource;
    Panel1: TPanel;
    Label3: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;

    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure dbgrdDocumentosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);


  private // Private declarations


  public  // Public declarations


  end;



var
  frmConsDOCAlimReserva: TfrmConsDOCAlimReserva;



implementation
{$R *.DFM}
uses
  UMensErro, UAdmPrev;



procedure TfrmConsDOCAlimReserva.FormShow(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPatro.Open;
  qryPlanPrev.Close;
  qryPlanprev.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPlanprev.Open;
  qryDocumentos.Close;
  qryDocumentos.ParamByName('AnoMesCobranca').AsString  := '0000/00';
  qryDocumentos.ParamByName('IdPessJur').AsInteger      := -1;
  qryDocumentos.ParamByName('IdPlanoPrev').AsInteger    := -1;
  qryDocumentos.Open;
end;



procedure TfrmConsDOCAlimReserva.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  if Trim(edAnoMes.Text) = ''
  then begin
    MsgDlg('Preencha o Ano/Mês de Cobrança.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  if Trim(dblkpcmbPatro.Text) = ''
  then begin
    MsgDlg('Preencha a Patrocinadora.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  if Trim(dblkpcmbPlano.Text) = ''
  then begin
    MsgDlg('Preencha o Plano Previdenciário.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  qryDocumentos.Close;
  qryDocumentos.ParamByName('AnoMesCobranca').AsString   := edAnoMes.Text;
  qryDocumentos.ParamByName('IdPessJur').AsInteger       := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryDocumentos.ParamByName('IdPlanoPrev').AsInteger     := qryPlanPrev.FieldByName('IdPlanoPrev').AsInteger;
  qryDocumentos.Open;
end;



procedure TfrmConsDOCAlimReserva.dbgrdDocumentosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if (not qryDocumentos.Active) or (qryDocumentos.FieldByName('Status').AsString = '')
  then Exit;

  if qryDocumentos.FieldByName('Status').AsInteger = 0
  then ABrush.Color := clRed
  else if qryDocumentos.FieldByName('Status').AsInteger = 1
  then ABrush.Color := clYellow
  else ABrush.Color := clTeal;
end;



end.