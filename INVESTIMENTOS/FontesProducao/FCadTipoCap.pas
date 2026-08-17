unit FCadTipoCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, TB97Ctls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, CmEventosCadastro, ImgList, FCadastroCSInv,
  fcLabel;

type
  TfrmCadTipoCap = class(TfrmCadastroCSInv)
    qryaux: TwwQuery;
    pnlDados: TPanel;
    Label1: TLabel;
    DBEDescTipoCapital: TwwDBEdit;
    LblCodig: TLabel;
    DBECodTipoCapital: TwwDBEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
  private
    Function  JaExiste : Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoCap: TfrmCadTipoCap;
  ssql : string ;
implementation

Uses
 UmensErro;
{$R *.DFM}

procedure TfrmCadtipocap.CmeCadastroInsert(Sender: TObject);
var
  sSql : string ;
begin
 qry.Close;
 qry.Sql.Clear;
 sSql := 'select TC.CodTpCapEmissor,TC.DescTpCapEmissor from TipoCapEmissor TC ';
 sSql := sSql + ' where 1 = 2 ';
 qry.SQL.Add(sSQL);
 qry.Open;
 inherited;
end;

procedure TfrmCadtipocap.CmeCadastroEdit(Sender: TObject);
begin
 dbeCodtipocapital.enabled := False;
 inherited;
end;

procedure TfrmCadtipocap.CmeCadastroCancel(Sender: TObject);
begin
 dbeCodtipocapital.enabled := True;
 inherited;
end;

procedure TfrmCadtipocap.CmeCadastroFind(Sender: TObject);
var
 sSql : string ;
begin
 if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
   qry.Close;
   qry.Sql.Clear;
   sSql := 'select TC.CodTpCapEmissor,TC.DescTpCapEmissor from TipoCapEmissor TC ';
   sSql := sSql + ' where TC.CodtpcapEmissor = '''+ MontaSelect.ValoresChave[0] + '''';
   qry.SQL.Add(sSQL);
   qry.Open;
  end;
 inherited;
end;



Function TfrmCadTipoCap.JaExiste : boolean;
var
 ssql       : string ;
begin
// verifica se o codigo do tipo de capital ja existe
 Result := False;
 Try
  qryAux.SQL.Clear;
  sSql := 'SELECT TP.CODTPCAPEMISSOR FROM TIPOCAPEMISSOR TP WHERE TP.CODTPCAPEMISSOR = '''+qry.FieldByname('CodTpCapEmissor').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if ( not qryAux.IsEmpty) then
   begin
    MsgDlg('Cödigo já Cadastrado ',LerMensagem(2),mtError,[mbOk],0);
    Result := True ;
    qryAux.Close;
    exit;
   end
  else
   qryAux.Close;
 Except raise ;
 end;
end;

procedure TfrmCadTipoCap.CmeCadastroDelete(Sender: TObject);
begin
 qryAux.SQL.Clear;
 sSql := 'SELECT EM.IDEMISSOR FROM EMISSOR EM WHERE EM.CODTPCAPEMISSOR = '''+qry.FieldByname('CodTpCapEmissor').AsString + '''';
 qryAux.SQL.Add(sSQL);
 qryAux.Open;
 if ( not qryAux.IsEmpty) then
  begin
   MsgDlg('Existem Emissores Cadastrados com esse Tipo',LerMensagem(2),mtError,[mbOk],0);
  end
 else
  inherited;
 qryAux.Close;
end;

procedure TfrmCadTipoCap.bbtnConfirmarClick(Sender: TObject);
begin
 if Trim(dbeDescTipoCapital.Text) = '' then
  begin
   MsgDlg('Tipo do capital deve ser informada. ','Erro',mtError,[mbOK],0);
   dbeDescTipoCapital.SetFocus;
   exit;
  end;
 if Trim(dbeCodTipoCapital.Text) = '' then
  begin
   MsgDlg('Código deve ser informado. ','Erro',mtError,[mbOK],0);
   dbeCodTipoCapital.SetFocus;
   exit;
  end;
 if qry.state in [dsInsert] then
  if JaExiste then
   begin
    sbtnAlterarClick(Self);
    Exit;
   end;
 inherited;
 dbeCodtipocapital.enabled := True;
end;

end.
