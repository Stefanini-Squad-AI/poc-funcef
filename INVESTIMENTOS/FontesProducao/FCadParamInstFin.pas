unit FCadParamInstFin;
// Cadastra os parametros que podem ser utilizados poe emissores .
// com a regra associada .
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook, UmensErro, UDataBase,
  TB97Ctls, TB97Tlbr, CmEventosCadastro, ImgList, IvDictio, IvMulti,
  IvEMulti ;

type
  TfrmCadParamInstFin = class(TfrmCadastroCS)
    QryRegras: TwwQuery;
    qryAux: TwwQuery;
    QryRegrasIDREGRA: TFloatField;
    QryRegrasNOMEREGRA: TStringField;
    qryIDPARAMINSTFIN: TFloatField;
    qryDESCPARAMINSTFIN: TStringField;
    qryIDREGRA: TFloatField;
    GroupBox1: TGroupBox;
    LbLDescParamEmissor: TLabel;
    wwDBEDescricao: TwwDBEdit;
    LblIdRegra: TLabel;
    wwDBLookupcbRegra: TwwDBLookupCombo;
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 frmCadParamInstFin: TfrmCadParamInstFin;
 ssql : String;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TfrmCadParamInstFin.CmeCadastroFind(Sender: TObject);
var
 sSql : string ;
begin
 if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
   qry.Close;
   qry.Sql.Clear;
   sSql := 'select PI.IdparamInstFin, PI.DescParamInstFin, PI.IdRegra From ParamInstFin PI ';
   sSql := sSql + 'where PI.IdParamInstFin = '''+ MontaSelect.ValoresChave[0] + '''';
   qry.SQL.Add(sSQL);
   qry.Open;
   inherited;
  end;
end;

procedure TfrmCadParamInstFin.CmeCadastroInsert(Sender: TObject);
var
  sSql : string ;
begin
  qry.Close;
  qry.Sql.Clear;
  sSql := 'select PI.IdparamInstFin, PI.DescParamInstFin, PI.IdRegra From ParamInstFin PI ';
  sSql := sSql + ' where 1 = 2 ';
  qry.SQL.Add(sSQL);
  qry.Open;
 inherited;
end;

procedure TfrmCadParamInstFin.CmeCadastroConfirma(Sender: TObject);
begin
 dtmBaseDados.DbBaseDados.ApplyUpdates([qry]);
end;

procedure TfrmCadParamInstFin.CmeCadastroEdit(Sender: TObject);
begin
 inherited;
 WWdbeDescricao.SetFocus;
end;

procedure TfrmCadParamInstFin.CmeCadastroDelete(Sender: TObject);
begin
 try
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT PXI.IDPARAMINSTFIN FROM PARAMXINSTFIN PXI WHERE PXI.IDPARAMINSTFIN = '''+qry.FieldByname('IdParamInstFin').AsString + '''';
  sSql := sSql + ' UNION SELECT VPI.IDPARAMINSTFIN FROM VALPARAMXINSTFIN VPI WHERE VPI.IDPARAMINSTFIN = '''+qry.FieldByname('IdParamInstFin').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if ( not qryAux.IsEmpty) then
   begin
    MsgDlg('Parâmetro Utilizado , Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
   end
  else
   inherited;
  qryAux.Close;
 except raise ;
 end;
 qryAux.Close;
end;

procedure TfrmCadParamInstFin.bbtnConfirmarClick(Sender: TObject);
begin
 if Trim(wwdbeDescricao.Text) = '' then
  begin
   MsgDlg('Descrição deve ser informada. ','Erro',mtError,[mbOK],0);
   wwdbeDescricao.SetFocus;
   exit;
  end;
 if ds.DataSet.State in [dsInsert] then
  if qry.FieldByName('IDPARAMINSTFIN').AsInteger <=0 then
   qry.FieldByName('IDPARAMINSTFIN').AsInteger := LeUltRegistro(nil,'PARAMINSTFIN');
 inherited;
end;

procedure TfrmCadParamInstFin.sbtnApagarClick(Sender: TObject);
begin
 try
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT PXI.IDPARAMINSTFIN FROM PARAMXINSTFIN PXI WHERE PXI.IDPARAMINSTFIN = '''+qry.FieldByname('IdParamInstFin').AsString + '''';
  sSql := sSql + ' UNION SELECT VPI.IDPARAMINSTFIN FROM VALPARAMXINSTFIN VPI WHERE VPI.IDPARAMINSTFIN = '''+qry.FieldByname('IdParamInstFin').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if ( not qryAux.IsEmpty) then
   begin
    MsgDlg('Parâmetro Utilizado , Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
   end
  else
   inherited;
  qryAux.Close;
 except raise ;
 end;
 qryAux.Close;
end;

procedure TfrmCadParamInstFin.FormShow(Sender: TObject);
begin
  inherited;
  QryRegras.Open;
end;

procedure TfrmCadParamInstFin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryRegras.Close;
end;

end.
