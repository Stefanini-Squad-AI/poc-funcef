unit FCadPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, wwdblook, StdCtrls, Mask, wwdbedit, MontaSelect, DBTables,
  Db, Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, ExtCtrls, TB97Ctls,
  TB97Tlbr, Grids, IvDictio, IvMulti, IvEMulti, CmEventosCadastro, ImgList;

type
  TfrmCadPlano = class(TfrmCadastroCS)
    GrbPlano: TGroupBox;
    DBENomeCarteira: TwwDBEdit;
    QryGestor: TwwQuery;
    DSGestor: TwwDataSource;
    qryAux: TwwQuery;
    DBLkGestor: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);

    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPlano: TfrmCadPlano;

implementation

Uses
  UmensErro,UDataBase;
{$R *.DFM}


procedure TfrmCadPlano.bbtnConfirmarClick(Sender: TObject);
begin
 if Trim(dbeNomeCarteira.Text) = '' then
  begin
   MsgDlg('Nome dO Plano deve ser informado. ','Erro',mtError,[mbOK],0);
   dbeNomeCarteira.SetFocus;
   exit;
  end;
 if ds.DataSet.State in [dsInsert] then
  if qry.FieldByName('IDPLANOINVEST').AsInteger <=0 then
   qry.FieldByName('IDPLANOINVEST').AsInteger := LeUltRegistro(nil,'PLANOINVEST');
 inherited;
end;

procedure TfrmCadPlano.CmeCadastroInsert(Sender: TObject);
var
  sSql : string ;
begin
 qry.Close;
 qry.Sql.Clear;
 sSql := 'select PI.IdPlanoInvest,PI.DescPlanoInvest,PI.IdGestorCarteira From PlanoInvest PI';
 sSql := sSql + ' where 1 = 2 ';
 qry.SQL.Add(sSQL);
 qry.Open;
 inherited;
end;


procedure TfrmCadPlano.CmeCadastroFind(Sender: TObject);
var
 sSql : string ;
begin
 if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
   qry.Close;
   qry.Sql.Clear;
   sSql := 'select PI.IdPlanoInvest,PI.DescPlanoInvest,PI.IdGestorCarteira From PlanoInvest PI';
   sSql := sSql + ' where PI.IdPlanoInvest = '''+ MontaSelect.ValoresChave[0] + '''';
   qry.SQL.Add(sSQL);
   qry.Open;
  end;
 inherited;
end;

procedure TfrmCadPlano.CmeCadastroDelete(Sender: TObject);
var
 PodeExcluir : Boolean ;
 sSql        : String ;
begin
 try
  PodeExcluir := True;
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT HPI.IDPLANOINVEST FROM HISTPLANOINVEST HPI WHERE HPI.IDPLANOINVEST = '''+qry.FieldByname('IdPLanoInvest').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty  then
   begin
    PodeExcluir := False;
    MsgDlg('Plano Utilizado em Histórico , Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
   end;
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT SPI.IDPLANOINVEST FROM SALDOPLANOINV SPI WHERE SPI.IDPLANOINVEST = '''+qry.FieldByname('IdPLanoInvest').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty  then
   begin
    PodeExcluir := False;
    MsgDlg('Plano Utilizado em Saldos de Plano, Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
   end;
  qryAux.Close;
 except raise ;
 end;
 qryAux.Close;
 if PodeExcluir then
  inherited;
end;

procedure TfrmCadPlano.FormShow(Sender: TObject);
begin
  inherited;
  QryGestor.Open;
end;

end.
