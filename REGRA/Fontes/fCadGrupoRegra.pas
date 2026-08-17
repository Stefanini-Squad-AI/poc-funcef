unit fCadGrupoRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, DBCtrls, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, CmEventosCadastro, ImgList;

type
  TfrmCadGrupoRegra = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    dedDescricao: TwwDBEdit;
    DBEdit1: TDBEdit;
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel( n : LongInt);
  public
    { Public declarations }
  end;

var
  frmCadGrupoRegra: TfrmCadGrupoRegra;

implementation

uses uDatabase, uMensErro;

{$R *.DFM}

procedure TfrmCadGrupoRegra.Sel( n : LongInt);
begin
     with Qry do begin
          Close;
          Params[0].Value := n;
          Open;
     end;
end;

procedure TfrmCadGrupoRegra.CmeCadastroInsert(Sender: TObject);
begin
     Inherited;
     dedDescricao.SetFocus;
end;

procedure TfrmCadGrupoRegra.CmeCadastroEdit(Sender: TObject);
begin
     Inherited;
     dedDescricao.SetFocus;
end;

procedure TfrmCadGrupoRegra.CmeCadastroFind(Sender: TObject);
begin
     Inherited;
     if MontaSelect.RetornouValor then
        Sel(StrtoInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadGrupoRegra.CmeCadastroConfirma(Sender: TObject);
begin
     if Qry.State in [dsEdit, dsInsert] then begin
        if dedDescricao.Text <> '' then begin
           if Qry.State = dsInsert then //Caso seja inserção pega o Sequence.
              Qry.FieldbyName('IDGRUPOREGRA').AsInteger := LeUltRegistro(nil,'GRUPOREGRA');
           Inherited;
        end else
            MsgDlg('Existem campos em branco.','Erro',mtError,[mbOK],0);
     end else
         inherited;
end;

end.