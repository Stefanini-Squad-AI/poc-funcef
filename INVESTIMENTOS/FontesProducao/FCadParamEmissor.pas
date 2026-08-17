unit FCadParamEmissor;
// Cadastra os parametros que podem ser utilizados poe emissores .
// com a regra associada .
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook, UmensErro, UDataBase,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CmEventosCadastro,
  ImgList ;

type
  TfrmCadParamEmissor = class(TfrmCadastroCS)
    QryRegras: TwwQuery;
    qryAux: TwwQuery;
    qryIDPARAMEMISSOR: TFloatField;
    qryDESCPARAMEMISSOR: TStringField;
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
    procedure FormActivate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadParamEmissor: TfrmCadParamEmissor;
  ssql : String;

implementation

uses DBaseDados;

//uses DBaseDados;

{$R *.DFM}

procedure TfrmCadParamEmissor.CmeCadastroInsert(Sender: TObject);
var
  sSql : string ;
begin
  qry.Close;
  qry.Sql.Clear;
  sSql := 'select PE.IdparamEmissor, PE.DescParamEmissor, PE.IdRegra From Paramemissor PE ';
  sSql := sSql + ' where 1 = 2 ';
  qry.SQL.Add(sSQL);
  qry.Open;
 inherited;
{  R. Mc's
  Me humilhar não vai,
  vai tirar o caralho,
  levanta seu rabo racista e sai ... 
}
end;

procedure TfrmCadParamEmissor.CmeCadastroConfirma(Sender: TObject);
begin
 dtmBaseDados.DbBaseDados.ApplyUpdates([qry]);
end;

procedure TfrmCadParamEmissor.CmeCadastroEdit(Sender: TObject);
begin
 inherited;
 WWdbeDescricao.SetFocus;
end;
procedure TfrmCadParamEmissor.CmeCadastroFind(Sender: TObject);
var
 sSql : string ;
begin
 if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
   qry.Close;
   qry.Sql.Clear;
   sSql := 'select PE.IdparamEmissor, PE.DescParamEmissor, PE.IdRegra From Paramemissor PE ';
   sSql := sSql + 'where PE.IdParamEmissor = '''+ MontaSelect.ValoresChave[0] + '''';
   qry.SQL.Add(sSQL);
   qry.Open;
   inherited;
  end;
end;

procedure TfrmCadParamEmissor.CmeCadastroDelete(Sender: TObject);
begin
 try
  qryAux.SQL.Clear;
  sSql := 'SELECT PXE.IDPARAMEMISSOR FROM PARAMXEMISSOR PXE WHERE PXE.IDPARAMEMISSOR = '''+qry.FieldByname('IdParamEmissor').AsString + '''';
  sSql := sSql + ' UNION SELECT VPE.IDPARAMEMISSOR FROM VALPARAMXEMISSOR VPE WHERE VPE.IDPARAMEMISSOR = '''+qry.FieldByname('IdParamEmissor').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty  then
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


procedure TfrmCadParamEmissor.bbtnConfirmarClick(Sender: TObject);
begin
 if Trim(wwdbeDescricao.Text) = '' then
  begin
   MsgDlg('Descrição deve ser informada. ','Erro',mtError,[mbOK],0);
   wwdbeDescricao.SetFocus;
   exit;
  end;
 if ds.DataSet.State in [dsInsert] then
  if qry.FieldByName('IDPARAMEMISSOR').AsInteger <=0 then
   qry.FieldByName('IDPARAMEMISSOR').AsInteger := LeUltRegistro(nil,'PARAMEMISSOR');
 inherited;
// wwDBEDescricao.SetFocus;
end;

procedure TfrmCadParamEmissor.FormActivate(Sender: TObject);
begin
	inherited;
   QryRegras.Open;
end;

procedure TfrmCadParamEmissor.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  wwDBEDescricao.SetFocus;
end;

end.
