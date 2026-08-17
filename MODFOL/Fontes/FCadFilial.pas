unit fCadFilial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables, Wwdatsrc,
  Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  checklst, DBCtrls, ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, Wwtable, TREdit, TB97Ctls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, Wwdotdot, Wwdbcomb, Wwdbspin,
  CmEventosCadastro, ImgList, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmCadFilial = class(TfrmPessoa)
    tbshFolha: TTabSheet;
    gbxFichas: TGroupBox;
    gbxHorarios: TGroupBox;
    Label2: TLabel;
    Label13: TLabel;
    dbedRegIni: TwwDBEdit;
    dbedRegFim: TwwDBEdit;
    Label14: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label15: TLabel;
    wwDBEdit3: TwwDBEdit;
    Label20: TLabel;
    wwDBEdit6: TwwDBEdit;
    Label21: TLabel;
    wwDBEdit7: TwwDBEdit;
    gbxAtividade: TGroupBox;
    Label25: TLabel;
    tblNatEmpr: TwwTable;
    tblSegAcid: TwwTable;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Label26: TLabel;
    Label27: TLabel;
    qrySindicato: TwwQuery;
    qryMoeda: TwwQuery;
    tbshGRE: TTabSheet;
    tbshGuias: TTabSheet;
    gbxGRCS: TGroupBox;
    gbxDARF: TGroupBox;
    gbxGPS: TGroupBox;
    dbgrTipEmpr: TDBRadioGroup;
    dbgrOrigCGC: TDBRadioGroup;
    dbgrCodFgts: TDBRadioGroup;
    Label30: TLabel;
    wwDBEdit11: TwwDBEdit;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label31: TLabel;
    Label32: TLabel;
    wwDBEdit12: TwwDBEdit;
    Label33: TLabel;
    DBRealEdit1: TDBRealEdit;
    Label34: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    Label35: TLabel;
    wwDBLookupCombo5: TwwDBLookupCombo;
    Label36: TLabel;
    wwDBLookupCombo6: TwwDBLookupCombo;
    Label37: TLabel;
    wwDBEdit13: TwwDBEdit;
    tblFPAS: TwwTable;
    tblCatCNAE: TwwTable;
    Label29: TLabel;
    dblcFPAS: TwwDBLookupCombo;
    Label38: TLabel;
    dblcConvPrev: TwwDBLookupCombo;
    Label39: TLabel;
    dblcCatCNAE: TwwDBLookupCombo;
    Label40: TLabel;
    dblcItemCNAE: TwwDBLookupCombo;
    qryItemCNAE: TwwQuery;
    qryConvPrev: TwwQuery;
    tblFPASIDFPAS: TFloatField;
    tblFPASDESCRICAO: TMemoField;
    tblFPASDESCPEQUENA: TStringField;
    gbxCustosEspec: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    dbedCustoRural: TwwDBEdit;
    dbedCustoPatr: TwwDBEdit;
    dbedDataIni: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblFPASCalcFields(DataSet: TDataSet);
    procedure dblcFPASCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCatCNAECloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qrySubTipoAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFilial: TfrmCadFilial;

implementation

uses uMensErro, fTelaAut, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadFilial.FormCreate(Sender: TObject);
begin
  inherited;
  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add ('FILIALPESSOA.IDFILIALPESSOA IN ' +sUsuXfilial);

  qryMoeda.Open;
  qrySindicato.Open;
  tblNatEmpr.Open;
  tblSegAcid.Open;
  tblCatCNAE.Open;
  tblFPAS.Open;

  dblcConvPrev.Enabled := not(qryConvPrev.IsEmpty);
  dblcItemCNAE.Enabled := not(qryItemCNAE.IsEmpty);
end;

procedure TfrmCadFilial.FormShow(Sender: TObject);
begin
  inherited;
{  Self.WindowState := wsNormal;
  Self.Width  := 710;
  Self.Height := 480;}
end;

procedure TfrmCadFilial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryMoeda.Close;
  qrySindicato.Close;
  tblNatEmpr.Close;
  tblSegAcid.Close;
  tblCatCNAE.Close;
  tblFPAS.Close;
  Action := caFree;
end;

procedure TfrmCadFilial.tblFPASCalcFields(DataSet: TDataSet);
begin
  inherited;
  tblFPAS.FieldByName('DESCPEQUENA').asString :=
    Copy(tblFPAS.FieldByName('DESCRICAO').asString, 1, 80);
end;

procedure TfrmCadFilial.dblcFPASCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  inherited;
  if not(qrySubTipo.IsEmpty) then
  begin
    qryConvPrev.Close;
    qryConvPrev.ParamByName('CODFPAS').asInteger := qrySubTipo.FieldByName('IDFPAS').asInteger;
    qryConvPrev.Open;
    dblcConvPrev.Enabled := not(qryConvPrev.IsEmpty);
  end;
end;

procedure TfrmCadFilial.dblcCatCNAECloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  inherited;
  if not(qrySubTipo.IsEmpty) then
  begin
    qryItemCNAE.Close;
    qryItemCNAE.ParamByName('CODCATEG').asInteger := qrySubTipo.FieldByName('IDCATCNAE').asInteger;
    qryItemCNAE.Open;
    dblcItemCNAE.Enabled := not(qryItemCNAE.IsEmpty);
  end;
end;

procedure TfrmCadFilial.qrySubTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryConvPrev.Close;
  qryConvPrev.ParamByName('CODFPAS').asInteger := qrySubTipo.FieldByName('IDFPAS').asInteger;
  qryConvPrev.Open;

  qryItemCNAE.Close;
  qryItemCNAE.ParamByName('CODCATEG').asInteger := qrySubTipo.FieldByName('IDCATCNAE').asInteger;
  qryItemCNAE.Open;
  
  dblcConvPrev.Enabled := not(qryConvPrev.IsEmpty);
  dblcItemCNAE.Enabled := not(qryItemCNAE.IsEmpty);
end;

procedure TfrmCadFilial.bbtnConfirmarClick(Sender: TObject);
begin
  if (eddbGrupo.Text = '') then
  begin
    MsgDlg('Indicar a que Empresa/Grupo/Estab. pertence','Informação',mtinformation,[mbOk],0);
    exit;
  end;
  inherited;
end;

end.
