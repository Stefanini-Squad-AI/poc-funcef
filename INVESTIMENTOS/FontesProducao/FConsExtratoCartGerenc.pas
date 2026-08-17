//******************************************************************************
// Autor    : Ismael Filipe Rolando Aguiar
// Data     : 24/01/2005
//******************************************************************************
unit FConsExtratoCartGerenc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid,
  ComCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker, Db, DBTables,
  Wwquery;

type
  TfrmConsExtratoCartGerenc = class(TfrmOkCancelarRelInv)
    pnlCombo: TPanel;
    pgcExtrato: TPageControl;
    tbEstoqueIni: TTabSheet;
    dbgEstoqueIni: TwwDBGrid;
    tbLancamentos: TTabSheet;
    dbgLancamentos: TwwDBGrid;
    DBGridIButton: TwwIButton;
    tbEstoqueFim: TTabSheet;
    dbgEstoqueFim: TwwDBGrid;
    l1: TLabel;
    edDataIni: TCMDateTimePicker;
    l2: TLabel;
    l3: TLabel;
    dblTipoOperacao: TwwDBLookupCombo;
    edDataFim: TCMDateTimePicker;
    l4: TLabel;
    dblCarteira: TwwDBLookupCombo;
    l6: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryTipoOperacao: TwwQuery;
    qryCarteiraIDCARTEIRAGERENC: TFloatField;
    qryCarteiraDESCCARTGERENC: TStringField;
    Label4: TLabel;
    dblEmissor: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsExtratoCartGerenc: TfrmConsExtratoCartGerenc;

implementation

{$R *.DFM}

procedure TfrmConsExtratoCartGerenc.FormShow(Sender: TObject);
begin
   inherited;
   qryCarteira.Open;
   qryTipoOperacao.Open;
   qryInvestimento.Open;

   pgcExtrato.ActivePage := tbLancamentos;

  {edtCPQtd.Value := 0;
   edtCPVal.Value := 0;
   edtVDQtd.Value := 0;
   edtVDVal.Value := 0;}
end;

end.
