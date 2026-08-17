(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000 
*******************************************************************************)

unit fCadGrupoAssunto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, CmEventosCadastro,
  ImgList, usistema;

type
  TfrmCadGrupoAssunto = class(TFrmCadastroGridCS)
    qryIDGRUPOASSUNTO: TFloatField;
    qryDESCGRUPOASSUNTO: TStringField;
    Label1: TLabel;
    EdtDescGrupo: TwwDBEdit;
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupoAssunto: TfrmCadGrupoAssunto;

implementation

{$R *.DFM}

Uses uDataBase, FPrincipal;

Procedure TfrmCadGrupoAssunto.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   qryIDGRUPOASSUNTO.AsFloat := LeultRegistro(nil,'GRUPOASSUNTO');
   If EdtDescGrupo.CanFocus Then EdtDescGrupo.SetFocus
End;

Procedure TfrmCadGrupoAssunto.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   If EdtDescGrupo.CanFocus Then EdtDescGrupo.SetFocus
End;

Procedure TfrmCadGrupoAssunto.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
   Accept := (Trim(EdtDescGrupo.Text) <> '');
End;

Procedure TfrmCadGrupoAssunto.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If MontaSelect.RetornouValor Then
     Qry.Locate('IDGRUPOASSUNTO',MontaSelect.ValoresChave[0],[]);
End;

procedure TfrmCadGrupoAssunto.CmeCadastroConfirma(Sender: TObject);
begin
  if not Sistema.GravaLogOperacoes('Operação de Cadastro de Grupo de Assuntos') then
  begin
    Raise Exception.Create('Não foi possível Gravar o Log');
    exit;
  end;
  inherited;
end;

end.
