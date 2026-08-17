unit FCadMascara;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, ExtCtrls, Udatabase,
  TB97Ctls, TB97Tlbr, CmEventosCadastro, ImgList, IvDictio, IvMulti,
  IvEMulti;

type
  TfrmCadMascara = class(TfrmCadastroCS)
    qryaux: TwwQuery;
    grpMascara: TGroupBox;
    DBEdMascara: TwwDBEdit;
    procedure DBEdMascaraKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sSql        : String;
  public
    { Public declarations }
  end;

var
  frmCadMascara: TfrmCadMascara;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TfrmCadMascara.DBEdMascaraKeyPress(Sender: TObject;
  var Key: Char);
begin
 inherited;
 if  (key = '.') and (Copy(dbedMascara.Text,Length(dbedMascara.Text),1) = '.') then
  begin
   MessageBeep(0);
   ShowMessage('Digitar 9 ou . ');
   key := #0;
   Exit;
  end;
 if (key <> '9') and (key <> '.') and (key <> #8) then
  begin
   MessageBeep(0);
   ShowMessage('Digitar 9 ou . ');
   key := #0;
   Exit;
  end;
 if (key <> '9') and (Length(dbedMascara.Text) = 0)  then
  begin
   MessageBeep(0);
   ShowMessage('Digitar 9 ou . ');
   key := #0;
  end;

end;

procedure TfrmCadMascara.sbtnInserirClick(Sender: TObject);
begin
 try
  with qryAux do
   begin
    Close;
    sSql := 'Select P.IdParamInvest ,P.MascSetorEmissor from PARAMINVEST P';
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    if not IsEmpty then
     ShowMessage('Já Existe Máscara Cadastrada')
    else
     inherited;
    Close;
   end;
  except
    Raise;
  end;
end;

procedure TfrmCadMascara.bbtnConfirmarClick(Sender: TObject);
begin
 if ds.DataSet.State in [dsInsert] then
  if qry.FieldByName('IDPARAMINVEST').AsInteger <=0 then
   qry.FieldByName('IDPARAMINVEST').AsInteger := LeUltRegistro(nil,'PARAMINVEST');
 inherited;
end;

procedure TfrmCadMascara.sbtnAlterarClick(Sender: TObject);
begin
 try
  with qryAux do begin
    Close;
    sSql := 'Select SE.CodSetorEmissor from SetorEmissor SE';
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    if not IsEmpty then begin 
      ShowMessage('Máscara já em Uso');
      SbtnAlterar.Down:=False;
    end else
      inherited;
    Close;
   end;
  except
    Raise;
  end;

end;

procedure TfrmCadMascara.sbtnApagarClick(Sender: TObject);
begin
 try
  with qryAux do
   begin
    Close;
    sSql := 'Select P.IdParamInvest ,P.MascSetorEmissor from PARAMINVEST P';
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    if not IsEmpty then
     ShowMessage('Máscara já em Uso')
    else
     inherited;
    Close;
   end;
  except
    Raise;
  end;

end;

procedure TfrmCadMascara.FormShow(Sender: TObject);
begin
  inherited;
  Qry.Open;
end;

end.
