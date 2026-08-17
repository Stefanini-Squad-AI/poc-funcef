unit FCadGrupoRelatorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, CmEventosCadastro,
  ImgList;

type
  TFrmCadGrupoRelatorio = class(TFrmCadastroGridCS)
    qryIDGRUPORELATORIO: TFloatField;
    qryORIGEMCMGR: TFloatField;
    qryDESCRICAO: TStringField;
    GroupBox1: TGroupBox;
    EdtGrupo: TwwDBEdit;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadGrupoRelatorio: TFrmCadGrupoRelatorio;

implementation

Uses uDataBase;

{$R *.DFM}

procedure TFrmCadGrupoRelatorio.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Qry.FieldByName('IDGRUPORELATORIO').AsInteger := LeUltRegistro(nil,'GrupoRelatorio');
  Qry.FieldByName('ORIGEMCMGR').AsInteger := 0;
  EdtGrupo.SetFocus;
end;

procedure TFrmCadGrupoRelatorio.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  EdtGrupo.SetFocus;
end;

procedure TFrmCadGrupoRelatorio.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Qry.Locate('IDGRUPORELATORIO',MontaSelect.ValoresChave[0],[]);
end;


end.
