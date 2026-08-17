unit fCadTipoRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, DBCtrls, Mask, wwdbedit, StdCtrls, Db, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CmEventosCadastro, ImgList;

type
  TfrmCadTipoRegra = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbmemSQLRegra: TDBMemo;
    dbedDescTpRegra: TwwDBEdit;
    dbeIdTpRegra: TDBEdit;
    dedGrupo: TwwDBLookupCombo;
    Label4: TLabel;
    QryGrupoRegra: TwwQuery;
    procedure dedGrupoChange(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel( n : LongInt );
  public
    { Public declarations }
  end;

var
  frmCadTipoRegra: TfrmCadTipoRegra;

implementation

{$R *.DFM}

uses uDataBase, uMensErro, fAguarde;

procedure TfrmCadTipoRegra.Sel( n : LongInt );
Begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Open;
End;

procedure TfrmCadTipoRegra.CmeCadastroInsert(Sender: TObject);
var
   vSeq : LongInt;
begin
     frmAguarde.Mostra('Procurando Sequence ...');
     frmAguarde.Refresh;
     repeat
           vSeq := LeUltRegistro(nil,'TIPOREGRA');
           with Qry do begin
                Close;
                ParambyName('ID').AsInteger := vSeq;
                Open;
           end;
     until Qry.IsEmpty;
     frmAguarde.Apaga;

     Inherited;
     qry.FieldByName('IDTIPOREGRA').asInteger := vSeq;
     dbedDescTpRegra.SetFocus;
end;

procedure TfrmCadTipoRegra.CmeCadastroEdit(Sender: TObject);
begin
     Inherited;
     dbedDescTpRegra.SetFocus;
end;

procedure TfrmCadTipoRegra.CmeCadastroFind(Sender: TObject);
begin
     Inherited;
     If MontaSelect.RetornouValor Then
        Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipoRegra.CmeCadastroConfirma(Sender: TObject);
begin
  If qry.State in [dsEdit,dsInsert] Then
       If (Trim(dbedDescTpRegra.Text) = '') Then
               MsgDlg('Existem campos em branco.','Erro',mtError,[mbOK],0)
       Else Begin
            Inherited;
       End
  Else
     Inherited;
end;

procedure TfrmCadTipoRegra.dedGrupoChange(Sender: TObject);
begin
  inherited;
  if Qry.State in [dsInsert, dsEdit] then
     if dedGrupo.Text = '' then
        qry.FieldbyName('IDGRUPOREGRA').AsString := '';
end;

end.
