unit FCadItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, Db, Wwdatsrc, DBTables, Wwquery, mRegraDB, wwdblook,
  wwdbedit, Wwdbspin, StdCtrls, Mask, ExtCtrls, fcLabel, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, DBCtrls;

type
  TFrmOkCancelarImob1 = class(TFrmOkCancelarImob)
    Bevel2: TBevel;
    lbNomItem: TfcLabel;
    Label4: TLabel;
    lbGrupo: TLabel;
    chkCentraliza: TCheckBox;
    pnlCContabilBaixa: TPanel;
    lblCCDebFinan: TLabel;
    btnBuscaContaCBaixa: TBitBtn;
    btnLimpaContaCBaixa: TBitBtn;
    edtContaCBaixa: TMaskEdit;
    GrpbPeriodicidade: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DBspnParcelas: TwwDBSpinEdit;
    DBspnNumPeriodicidade: TwwDBSpinEdit;
    DBcboGrupoLanc: TwwDBLookupCombo;
    molRegraCalculo: TmolRegraDB;
    molRegraDevQuitacaoAnt: TmolRegraDB;
    molRegraCalculoDiario: TmolRegraDB;
    GrpRubricas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    DBcboRubNormal: TwwDBLookupCombo;
    DBcboRubAtraso: TwwDBLookupCombo;
    DBcboRubDevolucao: TwwDBLookupCombo;
    DBcboRubSaldo: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    lblSeqCalculo: TLabel;
    Label5: TLabel;
    DBspnSeqCalculo: TwwDBSpinEdit;
    DBspnPrioridade: TwwDBSpinEdit;
    qry: TwwQuery;
    dts: TwwDataSource;
    upd: TUpdateSQL;
    rdgTipoItem: TDBRadioGroup;
    RdGrpIncidencia: TDBRadioGroup;
    DBrdgAgrupadoDestacado: TDBRadioGroup;
    rdgNaturezaItem: TDBRadioGroup;
    rdgTrataSaldo: TDBRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOkCancelarImob1: TFrmOkCancelarImob1;

implementation

{$R *.DFM}

end.
