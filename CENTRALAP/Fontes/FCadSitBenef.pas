(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000
*******************************************************************************)

unit FCadSitBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  CmEventosCadastro, ImgList;

type
  TFrmCadSitBenef = class(TFrmCadastroGridCS)
    Label2: TLabel;
    EdtDescricao: TwwDBEdit;
    qryIDSITBENEF: TFloatField;
    qryDESCRICAO: TStringField;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadSitBenef: TFrmCadSitBenef;

implementation

Uses UDataBase, FPrincipal;

{$R *.DFM}

procedure TFrmCadSitBenef.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  If EdtDescricao.CanFocus Then EdtDescricao.SetFocus;
  qry.FieldByName('IDSITBENEF').AsInteger := LeUltRegistro(nil,'SITBENEF');
end;

procedure TFrmCadSitBenef.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If EdtDescricao.CanFocus Then EdtDescricao.SetFocus;
end;

procedure TFrmCadSitBenef.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     qry.Locate('idsitbenef',MontaSelect.ValoresChave[0],[]);
end;

end.
 
