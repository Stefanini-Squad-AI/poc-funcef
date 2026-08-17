unit FCadRegrasTabuaServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook, CMDBLookupCombo,
  Grids, Wwdbigrd, Wwdbgrid, DBClient;

type
  TfrmCadRegrasTabuaServico = class(TfrmCadastroCS)
    Label3: TLabel;
    CMDBLookupCombo1: TCMDBLookupCombo;
    GroupBox1: TGroupBox;
    DbGrdDet: TwwDBGrid;
    ClntDtStCondicaoAjuste: TClientDataSet;
    qryLkpRotinaCalculo: TwwQuery;
    qrySQ_VERSAO_COMUTACAO: TFloatField;
    qryCD_GRUPO_FORMULA: TFloatField;
    qryCD_FORMULA: TFloatField;
    qryNR_ORDEM_FORMULA: TFloatField;
    qryCD_FORMULA_AJUSTE: TFloatField;
    qryIR_CONDICAO_AJUSTE: TStringField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERINCLUSAO: TStringField;
    qrylkpCondicaoAjuste: TStringField;
    qryLkpRotinaCalculoCD_FORMULA: TFloatField;
    qryLkpRotinaCalculoNO_FORMULA: TStringField;
    qryLkpRotinaCalculoDS_FORMULA: TMemoField;
    qryLkpRotinaCalculoNO_VARIAVEL_RESULT: TStringField;
    qryLkpRotinaCalculoNO_VARIAVEL_INICIAL: TStringField;
    qryLkpRotinaCalculoNO_VARIAVEL_FINAL: TStringField;
    qryLkpRotinaCalculoIR_GRUPO_FORMULA: TStringField;
    qryLkpAjusteCalculo: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    MemoField1: TMemoField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    qrylkpRotinaCalculo2: TStringField;
    qrylkpAjusteCalculo2: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRegrasTabuaServico: TfrmCadRegrasTabuaServico;

implementation

{$R *.DFM}

procedure TfrmCadRegrasTabuaServico.FormCreate(Sender: TObject);
begin
  ClntDtStCondicaoAjuste.CreateDataSet;
  ClntDtStCondicaoAjuste.AppendRecord(['Z', 'Valor Zero']);
  ClntDtStCondicaoAjuste.AppendRecord(['N', 'Valor Negativo']);

  qryLkpRotinaCalculo.Open;
  qryLkpAjusteCalculo.Open;

  inherited;
end;

procedure TfrmCadRegrasTabuaServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClntDtStCondicaoAjuste.Close;
  qryLkpRotinaCalculo.Close;
  qryLkpAjusteCalculo.Close;

  inherited;
end;

end.
