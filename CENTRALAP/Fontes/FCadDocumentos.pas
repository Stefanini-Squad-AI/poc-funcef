(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000 
*******************************************************************************)

unit FCadDocumentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  CmEventosCadastro, ImgList, DBCtrls;

type
  TFrmCadDocumentos = class(TFrmCadastroGridCS)
    Label1: TLabel;
    EdtDescricao: TwwDBEdit;
    qryIDDOCUMENTO: TFloatField;
    qryNOMEDOCUMENTO: TStringField;
    qryOBSERVACAO: TMemoField;
    Label2: TLabel;
    memObservacao: TDBMemo;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadDocumentos: TFrmCadDocumentos;

implementation

Uses UDataBase, FPrincipal;
{$R *.DFM}

procedure TFrmCadDocumentos.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  memObservacao.ReadOnly := False;
  qry.FieldByName('iddocumento').AsInteger := LeUltRegistro(nil,'documentos');
  qry.FieldByName('observacao').Clear;
  If EdtDescricao.CanFocus Then EdtDescricao.SetFocus;
end;

procedure TFrmCadDocumentos.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  memObservacao.ReadOnly := False;
  If EdtDescricao.CanFocus Then EdtDescricao.SetFocus;
end;

procedure TFrmCadDocumentos.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     memObservacao.Lines.Clear;
     qry.Locate('IDDOCUMENTO',MontaSelect.ValoresChave[0],[]);
  end;
end;


procedure TFrmCadDocumentos.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  memObservacao.ReadOnly := True;
end;

end.
