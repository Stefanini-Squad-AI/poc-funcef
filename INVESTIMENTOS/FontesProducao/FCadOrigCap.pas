unit FCadOrigCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, TB97Ctls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, CmEventosCadastro, ImgList, FCadastroCSInv,
  fcLabel;

type
  TfrmCadOrigCap = class(TfrmCadastroCSInv)
    qryaux: TwwQuery;
    Label2: TLabel;
    pnlDados: TPanel;
    Label1: TLabel;
    DBEOrigemCapital: TwwDBEdit;
    LblCodOrigemCapital: TLabel;
    DBECodOrigemCapital: TwwDBEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
  private
    { Private declarations }
    Function JaExiste : Boolean;

 public
    { Public declarations }
  end;

var
  frmCadOrigCap: TfrmCadOrigCap;
  ssql : String;
implementation

Uses
  UmensErro;
{$R *.DFM}

procedure TfrmCadOrigcap.CmeCadastroInsert(Sender: TObject);
var
  sSql : string ;
begin
 qry.Close;
 qry.Sql.Clear;
 sSql := 'select OC.CodOriCapEmissor,OC.DescOriCapEmissor from OrigemCapEmissor OC ';
 sSql := sSql + ' where 1 = 2 ';
 qry.SQL.Add(sSQL);
 qry.Open;
 inherited;
end;

procedure TfrmCadOrigcap.CmeCadastroEdit(Sender: TObject);
begin
 dbeCodOrigemcapital.enabled := False;
 inherited;
end;

procedure TfrmCadOrigcap.CmeCadastroCancel(Sender: TObject);
begin
 dbeCodOrigemcapital.enabled := True;
 inherited;
end;

procedure TfrmCadOrigcap.CmeCadastroFind(Sender: TObject);
var
 sSql : string ;
begin
 if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
   qry.Close;
   qry.Sql.Clear;
   sSql := 'select OC.CodOriCapEmissor,OC.DescOriCapEmissor from OrigemCapEmissor OC ';
   sSql := sSql + ' where OC.CodOricapEmissor = '''+ MontaSelect.ValoresChave[0] + '''';
   qry.SQL.Add(sSQL);
   qry.Open;
  end;
 inherited;
end;

Function TfrmCadOrigCap.JaExiste : boolean;
var
 ssql       : string ;
begin
 Result := False;
 Try
  qryAux.SQL.Clear;
  sSql := 'SELECT OC.CODORICAPEMISSOR FROM ORIGEMCAPEMISSOR OC WHERE OC.CODORICAPEMISSOR = '''+qry.FieldByname('CodOriCapEmissor').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if (not qryAux.IsEmpty) then
   begin
    MsgDlg('Cödigo já Cadastrado ',LerMensagem(2),mtError,[mbOk],0);
    Result := True;
    qryAux.Close;
    exit;
   end
  else
   qryAux.Close;
 Except raise ;
 end;

end;

  

procedure TfrmCadOrigCap.CmeCadastroDelete(Sender: TObject);
begin
 Try
  qryAux.SQL.Clear;
  sSql := 'SELECT EM.IDEMISSOR FROM EMISSOR EM WHERE EM.CODORICAPEMISSOR = '''+
          qry.FieldByname('CodOriCapEmissor').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if ( not qryAux.IsEmpty) then
   begin
    MsgDlg('Existem Emissores Cadastrados com essa Origem',LerMensagem(2),mtError,[mbOk],0);
   end
  else
   inherited;
  qryAux.Close;
 Except raise ;
 end;
end;

procedure TfrmCadOrigCap.bbtnConfirmarClick(Sender: TObject);
begin
 if Trim(dbeOrigemCapital.Text) = '' then
  begin
   MsgDlg('Origem do capital deve ser informada. ','Erro',mtError,[mbOK],0);
   dbeOrigemCapital.SetFocus;
   exit;
  end;
 if Trim(dbeCodOrigemCapital.Text) = '' then
  begin
   MsgDlg('Código deve ser informado. ','Erro',mtError,[mbOK],0);
   dbeCodOrigemCapital.SetFocus;
   exit;
  end
 else
  if qry.state in [dsInsert] then
   if JaExiste then
    begin
     sbtnAlterarClick(Self);
     exit;
    end;
 inherited;
   dbeOrigemCapital.Enabled := True;
end;

end.
