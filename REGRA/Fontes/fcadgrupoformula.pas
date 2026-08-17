unit fcadgrupoformula;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, Db, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CmEventosCadastro, ImgList;

type
  TFrmCadGrupoFormula = class(TfrmCadastroCS)
    qryCODGRUPOFORMULA: TStringField;
    qryDESCGRUPOFORMULA: TStringField;
    Label1: TLabel;
    dedCodigo: TwwDBEdit;
    Label2: TLabel;
    dedDescricao: TwwDBEdit;
    QryTrab: TwwQuery;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadGrupoFormula: TFrmCadGrupoFormula;
  vCod : String;

implementation

{$R *.DFM}

uses uDataBase, uMensErro;


procedure TFrmCadGrupoFormula.CmeCadastroInsert(Sender: TObject);
begin
     Inherited;
     dedCodigo.SetFocus;
end;

procedure TFrmCadGrupoFormula.CmeCadastroEdit(Sender: TObject);
begin
     Inherited;
     dedCodigo.SetFocus;
end;

procedure TFrmCadGrupoFormula.CmeCadastroFind(Sender: TObject);
begin
     Inherited;
     If MontaSelect.RetornouValor Then begin
        with Qry do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT CODGRUPOFORMULA, DESCGRUPOFORMULA FROM GRPFORMULA ');
             Sql.Add('WHERE CODGRUPOFORMULA = '''+MontaSelect.ValoresChave[0]+'''');
             Open;
             vCod := Qry.FieldbyName('CODGRUPOFORMULA').AsString;
        end;
     end;
end;

procedure TFrmCadGrupoFormula.CmeCadastroConfirma(Sender: TObject);
begin
  If Qry.State in [dsInsert] Then
       If (Trim(dedCodigo.Text) = '') or (dedDescricao.Text = '') Then
               MsgDlg('Existem campos em branco.','Erro',mtError,[mbOK],0)
       Else Begin
            Inherited;
       End
  Else begin
       with QryTrab do begin
            Close;
            Sql.Clear;
            SqL.Add('UPDATE GRPFORMULA SET CODGRUPOFORMULA = '''+dedCodigo.text+''',');
            SqL.Add('DESCGRUPOFORMULA = '''+dedDescricao.text+'''');
            SqL.Add('WHERE CODGRUPOFORMULA = '''+vCod+'''');
            ExecSql;
       end;
       with Qry do begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT CODGRUPOFORMULA, DESCGRUPOFORMULA FROM GRPFORMULA ');
            Sql.Add('WHERE CODGRUPOFORMULA = '''+dedCodigo.Text+'''');
            Open;
            vCod := FieldbyName('CODGRUPOFORMULA').AsString;
       end;
  end;
end;


procedure TFrmCadGrupoFormula.sbtnInserirClick(Sender: TObject);
begin
  if Qry.Active = False then
     Qry.Active := True;
  inherited;

end;

procedure TFrmCadGrupoFormula.sbtnApagarClick(Sender: TObject);
begin
     if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
     begin
          with QryTrab do begin
               Close;
               Sql.Clear;
               Sql.Add('DELETE FROM GRPFORMULA WHERE CODGRUPOFORMULA = '''+dedCodigo.text+'''');
               ExecSql;
          end;
          Qry.Close;
          Qry.Open;
     end;
end;

end.
