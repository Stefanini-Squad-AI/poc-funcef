unit FCadOpEnvioContribPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, CMTree, DBCtrls, wwdblook, Db, DBTables,
  Wwquery, Wwdatsrc, Mask, TB97, TREdit, MontaSelect,
  TB97Tlbr, wwdbdatetimepicker, CMDateTimePicker, TEdNum, IvDictio,
  IvMulti, IvEMulti, DBGrids, wwdbedit, Wwdotdot, Wwdbcomb ;

type
  TfrmCadOpEnvioContribPatro = class(TfrmOkCancelar)
    dsGridContrib: TwwDataSource;
    qryGridContrib: TwwQuery;
    pnlParticipante: TPanel;
    Panel1: TPanel;
    wwDBGrid1: TwwDBGrid;
    cmbFlgTpVlr: TwwDBComboBox;
    Label1: TLabel;
    qrypatro: TwwQuery;
    dsPatro: TwwDataSource;
    Label2: TLabel;
    cmbpatro: TwwDBLookupCombo;
    qryGridContribFLGTPVLR: TStringField;
    qryGridContribContrib: TStringField;
    qryGridContribIDCONTRIBUICAO: TFloatField;

    procedure FormCreate(Sender: TObject);
    procedure cmbpatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnSairClick(Sender: TObject);
    procedure cmbpatroClick(Sender: TObject);
    procedure wwDBGrid1Exit(Sender: TObject);
    procedure qryGridContribBeforePost(DataSet: TDataSet);
  private
    { Private declarations }

    lIdPessjur: integer; // identificadores do participante

  public
    { Public declarations }


  end;

var
  frmCadOpEnvioContribPatro: TfrmCadOpEnvioContribPatro;
  sTextoCombo : String;

implementation

uses UMensErro, UDataBase,USistema, UAutorizacao,
  UAdmPrev,  DBaseDados;

{$R *.DFM}


procedure TfrmCadOpEnvioContribPatro.FormCreate(Sender: TObject);
begin
  inherited;


   qrygridcontrib.close;
   qrypatro.close;
   qrypatro.paramByName('IDFUNDACAO').AsInteger := iIdFundacao;
   qrypatro.open;
   cmbpatro.text := qrypatro.fieldbyname('NOME').AsString;

   qryGridContrib.close;
   qryGridContrib.parambyname('IDPESSOA').AsInteger := qrypatro.fieldbyname('IDPESSOA').AsInteger;
   qryGridContrib.open;

end;

procedure TfrmCadOpEnvioContribPatro.cmbpatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryGridContrib.close;
  qryGridContrib.parambyname('IDPESSOA').AsInteger := qrypatro.fieldbyname('IDPESSOA').AsInteger;
  qryGridContrib.open;
end;

procedure TfrmCadOpEnvioContribPatro.bbtnSairClick(Sender: TObject);
begin
  if qryGridContrib.State = dsEdit then
    qryGridContrib.Post;

  inherited;

end;

procedure TfrmCadOpEnvioContribPatro.cmbpatroClick(Sender: TObject);
begin
  inherited;
  if qryGridContrib.State = dsEdit then
    qryGridContrib.Post;
end;

procedure TfrmCadOpEnvioContribPatro.wwDBGrid1Exit(Sender: TObject);
begin
  inherited;
  if qryGridContrib.State = dsEdit then
    qryGridContrib.Post;
end;

procedure TfrmCadOpEnvioContribPatro.qryGridContribBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  // Adicionando Log Padrão
  Try
    If not Sistema.GravaLogOperacoes('Opção de Envio por Contribuição') Then
      Raise Exception.Create('Erro ao gravar Log.');
  Except
  End;

end;

end.



