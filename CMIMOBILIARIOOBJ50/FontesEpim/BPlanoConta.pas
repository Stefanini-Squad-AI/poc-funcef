unit BPlanoConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, CMTree, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
  fcButton, fcImgBtn, fcShapeBtn, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid;

type
  TbusPlanoconta = class(TfrmSairAjuda)
    Panel1: TPanel;
    Panel3: TPanel;
    ToolbarSep971: TToolbarSep97;
    btnOk: TBitBtn;
    dsPlanoConta: TwwDataSource;
    treeContaContabil: TCMTreeView;
    qryLookPlanoConta: TwwQuery;
    qryLookPlanoContaPLANO: TFloatField;
    qryLookPlanoContaPLACONTA: TStringField;
    qryLookPlanoContaPLATIPO: TStringField;
    qryLookPlanoContaPLANOME: TStringField;

    procedure FormShow(Sender: TObject);

  private { Private declarations }

  public { Public declarations }

  end;


var
  busPlanoconta: TbusPlanoconta;


implementation
{$R *.DFM}
uses
   uFuncoesImob, uIntegraBack, uSistema, uMensErro;



procedure TbusPlanoconta.FormShow(Sender: TObject);
begin
   inherited;

   if not(qryLookPlanoConta.Active) then begin
      LimpaParametros(qryLookPlanoConta);
      qryLookPlanoConta.ParamByName('PPLANO').asInteger := IntegraBack.Plano;
      qryLookPlanoConta.Open;

      treeContaContabil.Mascara := IntegraBack.MascaraPlano;
      qryLookPlanoContaPLACONTA.EditMask := IntegraBack.MascaraPlano + ';0;_';

      treeContaContabil.MontaArvore;
   end;
end;



end.
