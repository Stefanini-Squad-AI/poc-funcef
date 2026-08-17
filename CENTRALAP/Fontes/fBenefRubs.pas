unit fBenefRubs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList, Db,
  Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery,
  MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls;

type
  TfrmBenefRub = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    DBEDTbeneficio: TwwDBEdit;
    DBEDTbenefRub: TwwDBEdit;
    qryIDBENEFICIO: TFloatField;
    qryNOME: TStringField;
    qryDESCRUB: TStringField;
    qryFLGRUBSREGRA: TFloatField;
    CheckBoxTemRegra: TCheckBox;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CheckBoxTemRegraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBenefRub: TfrmBenefRub;

implementation

uses FPrincipal;

{$R *.DFM}

procedure TfrmBenefRub.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    qry.close;
    qry.ParamByName('IDBENEFICIO').asInteger := strToInt(MontaSelect.ValoresChave[0]);
    qry.Open;
    checkBoxTemRegra.Checked := not ((qryFLGRUBSREGRA.asInteger = 0) or (qryFLGRUBSREGRA.isNull))
  end;
end;

procedure TfrmBenefRub.CheckBoxTemRegraClick(Sender: TObject);
begin
  inherited;
  if qry.state = dsEdit then
  begin
    if checkBoxTemRegra.Checked then
      qryFLGRUBSREGRA.asInteger := 1
    else
      qryFLGRUBSREGRA.asInteger := 0;
  end;
end;

end.
