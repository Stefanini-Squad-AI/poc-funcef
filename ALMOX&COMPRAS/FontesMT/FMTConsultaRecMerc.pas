unit FMTConsultaRecMerc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdbedit, Mask, CMProcuraSubTipo,
  TREdit, Db, Wwdatsrc, DBClient, uCMClientDataSet, MontaSelect,
  uCmSqlParams;

type
  TFrmMTConsultaRecMerc = class(TfrmSairAjuda)
    MontaSelect: TMontaSelect;
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    cdsItemNota: TCMClientDataSet;
    dsDet: TwwDataSource;
    dsAgregNota: TwwDataSource;
    dsContab: TwwDataSource;
    cdsAgregNotaTela: TCMClientDataSet;
    CdsContab: TCMClientDataSet;
    pnlMestre: TPanel;
    lblNumDoc: TLabel;
    lblBarra: TLabel;
    lblValor: TLabel;
    lblEmissao: TLabel;
    lblData: TLabel;
    dbenNumDoc: TDBRealEdit;
    dblcFornCli: TCMProcuraForCli;
    dbeCompl: TwwDBEdit;
    dbeValorCorrente: TDBRealEdit;
    chkCap: TCheckBox;
    dbeDataEmi: TCMDateTimePicker;
    dbeDataLanc: TCMDateTimePicker;
    CdsCAP: TCMClientDataSet;
    PageControl1: TPageControl;
    TabItens: TTabSheet;
    TabAgrerg: TTabSheet;
    TabCAP: TTabSheet;
    TabSheet4: TTabSheet;
    dbgrdDet: TwwDBGrid;
    grdAgreg: TwwDBGrid;
    Label11: TLabel;
    Label14: TLabel;
    LblFormaPag: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    cbEnglobParc: TCheckBox;
    dbeDataVenc: TCMDateTimePicker;
    EdHist: TEdit;
    DblcCodForma: TwwDBLookupCombo;
    dbclTipoDoc: TwwDBLookupCombo;
    memObsCap: TMemo;
    edRef: TEdit;
    GpConta: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edtBanco: TEdit;
    edtAgencia: TEdit;
    edtConta: TEdit;
    edtDescTipoConta: TEdit;
    dblcPortForma: TwwDBLookupCombo;
    EdLinhaDig: TEdit;
    EdCodBarra: TEdit;
    dbgContab: TwwDBGrid;
    BtnSel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    spListItemRecMerc: TCMSqlParams;
    spListRecMerc: TCMSqlParams;
    spListContab: TCMSqlParams;
    spListDadosCAP: TCMSqlParams;
    spGetAgregNota: TCMSqlParams;
    spContaCaixa: TCMSqlParams;
    spFormaPag: TCMSqlParams;
    CdsContaCaixa: TCMClientDataSet;
    cdsFormaPag: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    spTipoDoc: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( n : Double );
  public
    { Public declarations }
  end;

var
  FrmMTConsultaRecMerc: TFrmMTConsultaRecMerc;

implementation

{$R *.DFM}

uses uSistema;

procedure TFrmMTConsultaRecMerc.FormCreate(Sender: TObject);
begin
  inherited;
  // preparação da Tela e seus Componentes Locais
  MontaSelect.Filtro.Add('NFRECEBDEVOL.IDPESSOA = '+IntToStr(Sistema.Idempresa));

  MontaSelect.Filtro.Add('NFRECEBDEVOL.FLGTIPONOTA = ''R''');

  spFormaPag.Prepare;
  spFormaPag.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  spFormaPag.Open;

  spContaCaixa.Open;

  spTipoDoc.Open;

  Sel(-1);

  PageControl1.ActivePageIndex := 0;

end;

procedure TFrmMTConsultaRecMerc.BtnSelClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then
     Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmMTConsultaRecMerc.Sel(n: Double);
begin
   splistRecMerc.Prepare;
   splistRecMerc.ParamByName('IDNFRECEBDEVOL').AsFloat := n;
   splistRecMerc.Open;

   splistItemRecMerc.Prepare;
   splistItemRecMerc.ParamByName('IDNFRECEBDEVOL').AsFloat := n;
   splistItemRecMerc.Open;

   spGetAgregNota.Prepare;
   spGetAgregNota.ParamByName('IDNFRECEBDEVOL').AsFloat := n;
   spGetAgregNota.Open;

   spListContab.Prepare;
   spListContab.ParamByName('PLNCODIGO').AsFloat := Cds.FieldByName('PLNCODIGO').AsFloat;
   spListContab.Open;

   spListDadosCAP.Prepare;
   spListDadosCAP.ParamByName('CODDOCUMENTO').AsFloat :=  Cds.FieldByName('CODDOCUMENTO').AsFloat;
   spListDadosCAP.Open;

   If Not CdsCAP.IsEmpty Then
      Begin
         EdHist.Text               := CdsCAP.FieldByName('HISTORICOCOMPL').asString;
         edCodBarra.Text           := CdsCAP.FieldByName('NUMLEITCODBARRAS').asString;
         EdLinhaDig.Text           := CdsCAP.FieldByName('NUMDIGCODBARRAS').asString;
         DblcCodForma.LookupValue  := CdsCAP.FieldByName('CODFORMA').asString;
         memObsCap.Text            := CdsCAP.FieldByName('OBS').asString;
         edRef.Text                := CdsCAP.FieldByName('REFERENCIA').asString;
         dblcPortForma.LookupValue := CdsCAP.FieldByName('CODPORTFORMA').asString;
         dbclTipoDoc.LookupValue   := CdsCAP.FieldByName('CODTIPDOC').asString;
         cbEnglobParc.Checked      := Trim(CdsCAP.FieldByName('OPERACAO').asString) = '1';
      End
   Else
      Begin
         EdHist.Clear;
         edCodBarra.Clear;
         EdLinhaDig.Clear;
         DblcCodForma.text := '';
         dblcPortForma.text := '';
         memObsCap.Lines.Clear;
         edRef.Clear;
         cbEnglobParc.Checked := False;
      End;
end;

end.
