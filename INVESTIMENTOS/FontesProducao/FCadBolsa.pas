unit FCadBolsa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, StdCtrls, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables,
  Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  checklst, DBCtrls, ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, UMensErro, TB97Ctls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit;

type
  TfrmCadBolsa = class(TfrmPessoa)
    TbsBolsa: TTabSheet;
    QryProcuraBolsa: TwwQuery;
    QryAux: TwwQuery;
    Label13: TLabel;
    DBESIGLA: TwwDBEdit;
    Label2: TLabel;
    QryBuscaMoeda: TwwQuery;
    DbLkcBuscaMoeda: TwwDBLookupCombo;
    QryBuscaCustodiante: TwwQuery;
    Label11: TLabel;
    DbLkcBuscaCust: TwwDBLookupCombo;

    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);

    procedure FormActivate(Sender: TObject);
    function JaExiste : boolean ;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBolsa: TfrmCadBolsa;

implementation

Uses UBibliotecaInvest;
{$R *.DFM}

procedure TfrmCadBolsa.CmeCadastroConfirma(Sender: TObject);
begin
 if qrysubtipo.FieldByName('SglBolsaValores').AsString = '' then
  begin
   MsgDlg('Sigla da Bolsa de Valores deve ser Informada', 'Aviso', mtError, [mbOk, mbHelp], 0);
   pgctrlDetalhe.activepage := TbsBolsa;
   dbeSigla.setfocus;
   exit;
  end
 else
  if (ds.dataset.state  in [dsInsert, dsEdit]) then
   if JaExiste then
    if (MsgDlg('Existe Bolsa de Valores Cadastrada com essa Sigla . Deseja Gravar ?', 'Aviso', mtWarning, [mbYes,mbNo],0) = mrYes) then
    else
     begin
      pgctrlDetalhe.activepage := TbsBolsa;
      dbeSigla.setfocus;
      exit;
     end;
 inherited
end;

procedure TfrmCadBolsa.CmeCadastroDelete(Sender: TObject);
var
 PodeExcluir : boolean ;
 sSql        : String ;
begin
 try
  PodeExcluir := True;
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT NC.IDBOLSAVALORES, NC.IDCORRETVALORES FROM NUMCORRETORA NC WHERE NC.IDBOLSAVALORES = '''+qrySubTipo.FieldByname('IdBolsaValores').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty  then
   begin
    PodeExcluir := False;
    MsgDlg('Bolsa com Corretoras Associadas, Não pode ser Excluída',LerMensagem(2),mtError,[mbOk],0);
   end;
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT IDBOLSAVALORES, IDEMISSOR FROM EMISSORXBOLSA WHERE IDBOLSAVALORES = '''+qrySubTipo.FieldByname('IdBolsaValores').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty  then
   begin
    PodeExcluir := False;
    MsgDlg('Bolsa com Emissores Associados, Não pode ser Excluída',LerMensagem(2),mtError,[mbOk],0);
   end;
  if PodeExcluir then
   inherited;
  qryAux.Close;
  except raise ;
  end;
end;

procedure TfrmCadBolsa.FormActivate(Sender: TObject);
begin
 inherited;
  pgctrlDetalhe.activepage := TbsBolsa;
  QryBuscaMoeda.Open;
end;

Function TfrmCadBolsa.JaExiste;
var
 ssql : string ;
begin
 Result := False ;
 Try
  qryProcuraBolsa.Sql.Clear;
  sSql := 'SELECT B.IDBOLSAVALORES,B.SGLBOLSAVALORES FROM BOLSAVALORES B WHERE B.SGLBOLSAVALORES = '''+qrySubTipo.FieldByname('SglBolsavalores').AsString + '''';
  qryProcuraBolsa.SQL.Add(sSQL);
  qryProcuraBolsa.Open;
  Result := not qryProcuraBolsa.IsEmpty;
  qryProcuraBolsa.Close;
 Except raise ;
 end;
end;

procedure TfrmCadBolsa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryBuscaMoeda.Close;
  QryBuscaCustodiante.Close;
end;

procedure TfrmCadBolsa.FormShow(Sender: TObject);
begin
  inherited;
  QryBuscaCustodiante.Open;
end;

procedure TfrmCadBolsa.sbtnInserirClick(Sender: TObject);
begin
  inherited;
// Busca Moeda Preferencial
  If FazQuery(QryAux,'SELECT MOECODIGO FROM PARAMINVEST') Then Begin
    QrySubTipo.FieldByName('MOECODIGO').AsInteger :=
      QryAux.FieldByName('MOECODIGO').AsInteger; 
  End;
end;

procedure TfrmCadBolsa.bbtnConfirmarClick(Sender: TObject);
begin
  If Trim(DbeSigla.Text) = '' then begin
    MsgDlg('Sigla da Bolsa deve ser Informada', 'Aviso', mtError, [mbOk], 0);
    PgctrlDetalhe.activepage := TbsBolsa;
    DbeSigla.SetFocus;
    Exit;
  end;
  inherited;
end;

end.

