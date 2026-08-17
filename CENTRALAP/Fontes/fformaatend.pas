(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 14/09/2000
   Inclusão da coluna FLGEMITERUBS: Autoriza a emissão da RUBS no momento do
   Atendimento
*******************************************************************************)

unit fformaatend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList, usistema;

type
  TFrmFormaAtend = class(TFrmCadastroGridCS)
    DbeDescricao: TDBEdit;
    Label1: TLabel;
    qryIDTIPOATEND: TFloatField;
    qryNOME: TStringField;
    DBCheckBox1: TDBCheckBox;
    qryFLGEMITERUBS: TStringField;
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
  FrmFormaAtend: TFrmFormaAtend;

implementation

Uses UDataBase, FPrincipal;
{$R *.DFM}

procedure TFrmFormaAtend.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryidtipoatend.AsInteger := LeUltRegistro(nil,'TIPOATEND') ;
  qryFLGEMITERUBS.AsString := 'N';
  If DbeDescricao.CanFocus Then DbeDescricao.SetFocus;
end;

procedure TFrmFormaAtend.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If DbeDescricao.CanFocus Then DbeDescricao.SetFocus;
end;

procedure TFrmFormaAtend.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     qry.Locate('IDTIPOATEND',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmFormaAtend.CmeCadastroConfirma(Sender: TObject);
begin
  if not Sistema.GravaLogOperacoes('Operação de Cadastro de Forma de Atendimento') then
  begin
    Raise Exception.Create('Não foi possível Gravar o Log');
    exit;
  end;
  inherited;
end;

end.
