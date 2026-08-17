unit fCadPermissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Machklb, wwdblook, CmEventosCadastro, ImgList;

type
  TfrmCadPermissao = class(TfrmCadastroCS)
    QryGrupoRegra: TwwQuery;
    QryUsuario: TwwQuery;
    dedUsuario: TwwDBLookupCombo;
    Label1: TLabel;
    dedGrupo: TwwDBLookupCombo;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    cklstPermissoes: TCMchklistbox;
    procedure dedUsuarioChange(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(Grupo, Usuario : LongInt);
  public
    { Public declarations }
  end;

var
  frmCadPermissao: TfrmCadPermissao;

implementation

{$R *.DFM}

procedure TfrmCadPermissao.CmeCadastroInsert(Sender: TObject);
begin
     inherited;
     dedUsuario.SetFocus;
     cklstPermissoes.Selected[0] := False;
     cklstPermissoes.Selected[1] := False;
     cklstPermissoes.Selected[2] := False;
     cklstPermissoes.Selected[3] := False;
end;

procedure TfrmCadPermissao.CmeCadastroEdit(Sender: TObject);
begin
     inherited;
     dedUsuario.SetFocus;
end;

procedure TfrmCadPermissao.CmeCadastroConfirma(Sender: TObject);
begin
     if Qry.State in [dsEdit, dsInsert] then begin
        qry.FieldByName('FLGINSERIR').AsInteger := 0;
        qry.FieldByName('FLGALTERAR').AsInteger := 0;
        qry.FieldByName('FLGEXCLUIR').AsInteger := 0;
        qry.FieldByName('FLGPROCURAR').AsInteger := 0;
        if cklstPermissoes.Selected[0] then qry.FieldByName('FLGINSERIR').AsInteger := 1;
        if cklstPermissoes.Selected[1] then qry.FieldByName('FLGALTERAR').AsInteger := 1;
        if cklstPermissoes.Selected[2] then qry.FieldByName('FLGEXCLUIR').AsInteger := 1;
        if cklstPermissoes.Selected[3] then qry.FieldByName('FLGPROCURAR').AsInteger := 1;
     end;
     inherited;
end;

procedure TfrmCadPermissao.CmeCadastroFind(Sender: TObject);
begin
     Inherited;
     Refresh;
     if MontaSelect.RetornouValor then
        Sel(StrtoInt(MontaSelect.ValoresChave[0]), StrtoInt(MontaSelect.ValoresChave[1]));
end;

procedure TfrmCadPermissao.Sel(Grupo, Usuario : LongInt);
begin
     with Qry do begin
          Close;
          Params[0].value := Grupo;
          Params[1].value := Usuario;
          Open;
     end;
     if qry.FieldByName('FLGINSERIR').AsInteger = 0 then cklstPermissoes.Selected[0] := False
        else cklstPermissoes.Selected[0] := True;
     if qry.FieldByName('FLGALTERAR').AsInteger = 0 then cklstPermissoes.Selected[1] := False
        else cklstPermissoes.Selected[1] := True;
     if qry.FieldByName('FLGEXCLUIR').AsInteger = 0 then cklstPermissoes.Selected[2] := False
        else cklstPermissoes.Selected[2] := True;
     if qry.FieldByName('FLGPROCURAR').AsInteger = 0 then cklstPermissoes.Selected[3] := False
        else cklstPermissoes.Selected[3] := True;
end;

procedure TfrmCadPermissao.dedUsuarioChange(Sender: TObject);
begin
  inherited;
  if qry.FieldByName('FLGINSERIR').AsInteger = 0 then cklstPermissoes.Selected[0] := False
     else cklstPermissoes.Selected[0] := True;
  if qry.FieldByName('FLGALTERAR').AsInteger = 0 then cklstPermissoes.Selected[1] := False
     else cklstPermissoes.Selected[1] := True;
  if qry.FieldByName('FLGEXCLUIR').AsInteger = 0 then cklstPermissoes.Selected[2] := False
     else cklstPermissoes.Selected[2] := True;
  if qry.FieldByName('FLGPROCURAR').AsInteger = 0 then cklstPermissoes.Selected[3] := False
     else cklstPermissoes.Selected[3] := True;
end;

end.
