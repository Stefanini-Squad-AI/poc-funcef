// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 16/12/2005
// Rotina      : Tela
// Pendência   : 21042
// Descricao   : COLOQUEI NO GRID Idade na Aposentadoria (campo IDADEAPOS)
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 13/17/2005
// Rotina      : Tela
// Pendência   :
// Descricao   : COLOQUEI NO GRID DE ATUALIZAÇÃO AS RESERVAS COM CEA E A CONTRIB EXTRA
//------------------------------------------------------------------------------

unit FAcertoManualSimulacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Mask, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwquery, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmAcertoManualSimulacao = class(TfrmSairAjuda)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edMesAno: TMaskEdit;
    bbtnBuscaDados: TBitBtn;
    dsDados: TwwDataSource;
    qryDados: TwwQuery;
    updDados: TUpdateSQL;
    dbgrdDados: TwwDBGrid;
    bbtnGravar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormShow(Sender: TObject);
    procedure bbtnBuscaDadosClick(Sender: TObject);
    procedure bbtnGravarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcertoManualSimulacao: TfrmAcertoManualSimulacao;

implementation

uses UMensErro;

{$R *.DFM}

procedure TfrmAcertoManualSimulacao.FormShow(Sender: TObject);
begin
  inherited;
  if qryDados.Active and qryDados.UpdatesPending then qryDados.CancelUpdates;
  qryDados.Close;
  qryDados.ParamByName('ANOMESREF').AsString := '0000/00';
  qryDados.Open;

end;

procedure TfrmAcertoManualSimulacao.bbtnBuscaDadosClick(Sender: TObject);
begin
  inherited;
  if   (qryDados.Active) and (not qryDados.IsEmpty) and (qryDados.UpdatesPending)
  then begin
     if MsgDlg('Todas as alterações feitas até o momento serão perdidas. Deseja gravá-las ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
     then qryDados.ApplyUpdates
     else qryDados.CancelUpdates;
  end;
  qryDados.Close;
  qryDados.ParamByName('ANOMESREF').AsString := Copy(edMesAno.Text,4,4)+'/'+Copy(edMesAno.Text,1,2);
  qryDados.Open;

end;

procedure TfrmAcertoManualSimulacao.bbtnGravarClick(Sender: TObject);
begin
  inherited;
  if   MsgDlg('Confirma gravação das alterações ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
  then qryDados.ApplyUpdates
  else qryDados.CancelUpdates;

end;

procedure TfrmAcertoManualSimulacao.bbtnSairClick(Sender: TObject);
begin
  inherited;
  if   (qryDados.Active) and (not qryDados.IsEmpty) and (qryDados.UpdatesPending)
  then begin
     if MsgDlg('Todas as alterações feitas até o momento serão perdidas. Deseja gravá-las ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
     then qryDados.ApplyUpdates
     else qryDados.CancelUpdates;
  end;

end;

end.
