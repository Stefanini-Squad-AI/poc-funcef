unit FPessoaGestor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, StdCtrls, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables,
  Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  checklst, DBCtrls, ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, UMensErro, TB97Ctls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmPessoaGestor = class(TfrmPessoa)
    qryAux: TwwQuery;

    Procedure CmeCadastroDelete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoaGestor: TfrmPessoaGestor;

implementation

{$R *.DFM}
procedure TfrmPessoaGestor.CmeCadastroDelete(Sender: TObject);
var
 PodeExcluir : boolean ;
 sSql        : String ;
begin
 try
  PodeExcluir := True;
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT FI.IDFUNDOINVEST, FI.IDGESTORCARTEIRA FROM CM.FUNDOINVEST FI WHERE FI.IDGESTORCARTEIRA = '''+qrySubTipo.FieldByname('IdGestorCarteira').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty  then
   begin
    PodeExcluir := False;
    MsgDlg('Gestor já tem Fundo Associado , Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
   end;
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT PI.IDPLANOINVEST, PI.IDGESTORCARTEIRA FROM CM.PLANOINVEST PI WHERE PI.IDGESTORCARTEIRA = '''+qrySubTipo.FieldByname('IdGestorCarteira').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty  then
   begin
    PodeExcluir := False;
    MsgDlg('Gestor já tem Plano Associado , Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
   end;
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT CI.IDCARTEIRAINVEST, CI.IDGESTORCARTEIRA FROM CM.CARTEIRAINVEST CI WHERE CI.IDGESTORCARTEIRA = '''+qrySubTipo.FieldByname('IdGestorCarteira').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty  then
   begin
    PodeExcluir := False;
    MsgDlg('Gestor já tem Carteira Associada , Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
   end;
  if PodeExcluir then
   inherited;
  qryAux.Close;
 except raise ;
 end;
end;

end.
