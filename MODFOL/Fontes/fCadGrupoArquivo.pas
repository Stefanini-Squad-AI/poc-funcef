unit fCadGrupoArquivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList;

type
  TfrmCadGrupoArquivo = class(TFrmCadastroGridCS)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QryAux: TwwQuery;
    EdtCodigo: TEdit;
    EdtDescricao: TEdit;
    EdtSetor: TEdit;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure Botoes(Valor : Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupoArquivo: TfrmCadGrupoArquivo;
  Inclusao : Boolean;

implementation

uses UDatabase, UMensErro;

{$R *.DFM}

procedure TfrmCadGrupoArquivo.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then
     qry.Locate('CODGRUPOARQUIVO', MontaSelect.ValoresChave[0], []);
  SbtnProcurar.Down := False;
end;

procedure TfrmCadGrupoArquivo.bbtnConfirmarClick(Sender: TObject);
begin
     if Inclusao then begin
        with QryAux do begin
             Close;
             Sql.Clear;
             Sql.Add( 'SELECT CODGRUPOARQUIVO FROM CMPBDGRP WHERE CODGRUPOARQUIVO = '''+
                      EdtCodigo.Text+'''');
             Open;
        end;
        if QryAux.IsEmpty then begin
           with QryAux do begin
                Close;
                Sql.Clear;
                Sql.Add( 'INSERT INTO GRPARQUIVO (CODGRUPOARQUIVO, DESCGRUPOARQUIVO, SETORGRUPOS) VALUES '+
                         '('''+EdtCodigo.Text+''','''+EdtDescricao.Text+''','''+EdtSetor.Text+''')');
                ExecSql;
           end;
           Qry.Close;
           Qry.Open;

           Botoes(True);
           pnlControles.SendtoBack;
           Inclusao := False;
        end else
            MsgDlg('Já existe registro com o mesmo código.', 'Erro', mtError, [mbOk],0);
     end else begin
        if QryAux.IsEmpty then begin
           with QryAux do begin
                Close;
                Sql.Clear;
                Sql.Add( 'UPDATE GRPARQUIVO SET  '+
                         'CODGRUPOARQUIVO = '''+EdtCodigo.Text+''','+
                         'DESCGRUPOARQUIVO = '''+EdtDescricao.Text+''','+
                         'SETORGRUPOS = '''+EdtSetor.Text+''' WHERE CODGRUPOARQUIVO = '''+
                         qry.FieldbyName('CODGRUPOARQUIVO').AsString+'''');
                ExecSql;
           end;

           with QryAux do begin
                Close;
                Sql.Clear;
                Sql.Add( 'UPDATE CMPBDGRP SET '+
                         ' CODGRUPOARQUIVO = '''+EdtCodigo.Text+''''+
                         ' WHERE CODGRUPOARQUIVO = '''+qry.FieldbyName('CODGRUPOARQUIVO').AsString+'''');
                ExecSql;
           end;
           Qry.Close;
           Qry.Open;

           Botoes(True);
           pnlControles.SendtoBack;
        end else
            MsgDlg('Já existe registro com o mesmo código.', 'Erro', mtError, [mbOk],0);
     end;
end;

procedure TfrmCadGrupoArquivo.sbtnApagarClick(Sender: TObject);
begin
     if (MsgDlg('Deseja excluir registro ?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then begin
        with QryAux do begin
             Close;
             Sql.Clear;
             Sql.Add( 'SELECT CODGRUPOARQUIVO FROM CMPBDGRP WHERE CODGRUPOARQUIVO = '''+
                      Qry.FieldbyName('CODGRUPOARQUIVO').AsString+'''');
             Open;
        end;
        if QryAux.IsEmpty then begin
           with QryAux do begin
                Close;
                Sql.Clear;
                Sql.Add( 'DELETE FROM GRPARQUIVO WHERE CODGRUPOARQUIVO ='''+
                         Qry.FieldbyName('CODGRUPOARQUIVO').AsString+'''');
                ExecSql;
           end;
           Qry.Close;
           Qry.Open;
           Botoes(True);
        end else begin
            MsgDlg('Existem registro em outras tabelas relacionadas a este registro.', 'Erro', mtError, [mbOk],0);
        end;
     end;
     SbtnApagar.Down := False;
end;

procedure TfrmCadGrupoArquivo.sbtnAlterarClick(Sender: TObject);
begin
     Inclusao := False;
     dbGrd.SendtoBack;
     Botoes(False);
     EdtCodigo.Text := Qry.FieldbyName('CODGRUPOARQUIVO').AsString;
     EdtDescricao.Text := Qry.FieldbyName('DESCGRUPOARQUIVO').AsString;
     EdtSetor.Text := Qry.FieldbyName('SETORGRUPOS').AsString;
     sbtnAlterar.Down := False;
end;

procedure TfrmCadGrupoArquivo.sbtnInserirClick(Sender: TObject);
begin
  Inclusao := True;
  dbGrd.SendtoBack;
  Botoes(False);
  EdtCodigo.Text := '';
  EdtDescricao.Text := '';
  EdtSetor.Text := '';
  sbtnInserir.Down := False;
end;

procedure TfrmCadGrupoArquivo.FormCreate(Sender: TObject);
begin
  inherited;
  Inclusao := False;
  pnlControles.SendtoBack;
  Botoes(True);
end;

Procedure TfrmCadGrupoArquivo.Botoes(Valor : Boolean);
begin
     sbtnInserir.Enabled := Valor;
     if Valor then begin
        if Qry.IsEmpty then begin
           sbtnAlterar.Enabled := False;
           sbtnApagar.Enabled := False;
        end else begin
            sbtnAlterar.Enabled := True;
            sbtnApagar.Enabled := True;
        end;
     end else begin
         sbtnAlterar.Enabled := Valor;
         sbtnApagar.Enabled := Valor;
     end;
     bbtnConfirmar.Enabled := not Valor;
     bbtnCancelar.Enabled := not Valor;
     if bbtnConfirmar.Enabled then
        sbtnProcurar.Enabled := False
     else
        sbtnProcurar.Enabled := True;
end;


end.
