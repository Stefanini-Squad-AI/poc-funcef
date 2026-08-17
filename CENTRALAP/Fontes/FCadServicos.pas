(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000 
*******************************************************************************)

unit FCadServicos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  CmEventosCadastro, ImgList, wwdblook;

type
  TFrmCadServicos = class(TFrmCadastroGridCS)
    EdtDescricao: TwwDBEdit;
    Nome: TLabel;
    qryIDSERVICOS: TFloatField;
    qryNOME: TStringField;
    dblkpRegra: TwwDBLookupCombo;
    Label1: TLabel;
    QryRegra: TwwQuery;
    qryIDREGRA: TFloatField;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadServicos: TFrmCadServicos;

implementation

Uses UDataBase, FPrincipal;

{$R *.DFM}

procedure TFrmCadServicos.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('idservicos').AsInteger := LeUltRegistro(nil,'BENEFICIO');
  If EdtDescricao.CanFocus Then EdtDescricao.SetFocus;
end;

procedure TFrmCadServicos.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If EdtDescricao.CanFocus Then EdtDescricao.SetFocus;
end;

procedure TFrmCadServicos.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     qry.Locate('IDSERVICOS',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadServicos.FormCreate(Sender: TObject);
begin
  inherited;
  With QryRegra Do
     Begin
       If Active Then Close;
       If Not Prepared Then Prepare;
       Open;
     End;
end;

end.
