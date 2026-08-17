unit FCadTpPeriodicidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, Db, DBTables, Wwquery, StdCtrls, cmseldlg, wwidlg,
  Wwdatsrc, DBCtrls, MAHlpBtn, Buttons, ComCtrls, ToolWin,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, TB97, TB97Ctls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, CmEventosCadastro, wwDialog,
  ImgList;
/////////////////////////////////////////
//ATENÇÃO: objeto DBNAV... fora da tela//
/////////////////////////////////////////
type
  TfrmCadTpPeriodicidade = class(TfrmCadastroGrid)
    Label1: TLabel;
    Label2: TLabel;
    qry: TwwQuery;
    qryAux: TwwQuery;
    dbedDescPeriodicidade: TwwDBEdit;
    dbedQtdeMeses: TwwDBEdit;
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTpPeriodicidade: TfrmCadTpPeriodicidade;

implementation

uses UDataBase, UMensErro, USistema;

{$R *.DFM}



procedure TfrmCadTpPeriodicidade.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('idTpPeriodicidade').AsInteger := LeUltRegistro(qryAux,'TPPERIODICIDADE');
end;

procedure TfrmCadTpPeriodicidade.dsStateChange(Sender: TObject);
begin
  inherited;
  if ds.DataSet.State in [dsEdit,dsInsert]
  then dbedDescPeriodicidade.SetFocus;
end;

procedure TfrmCadTpPeriodicidade.bbtnConfirmarClick(Sender: TObject);
begin
  if Trim(dbedDescPeriodicidade.Text) = ''
  then begin
         MsgDlg('Descrição da Periodicidade não preenchida','Erro',mtError,[mbOk,mbHelp],0);
         dbedDescPeriodicidade.SetFocus;
         Exit;
       end;

  if Trim(dbedQtdeMeses.Text) = ''
  then begin
         MsgDlg('Quantidade de Meses não preenchida','Erro',mtError,[mbOk,mbHelp],0);
         dbedQtdeMeses.SetFocus;
         Exit;
       end;

  inherited;
end;

procedure TfrmCadTpPeriodicidade.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.enabled :=(( ds.dataset.active ) and (not ds.dataset.isempty));
  sbtnApagar.enabled := (( ds.dataset.active ) and (not ds.dataset.isempty));
end;

procedure TfrmCadTpPeriodicidade.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT IDTPPERIODICIDADE,NOME,QTDEMESES '+
               ' FROM '+Sistema.PrefixoServidor+'TPPERIODICIDADE ORDER BY NOME');
  qry.Open;
end;

end.
