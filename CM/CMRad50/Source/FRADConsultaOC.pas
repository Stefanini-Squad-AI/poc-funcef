unit FRADConsultaOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, DBCtrls, ComCtrls, StdCtrls, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Mask, TB97Ctls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, DBClient, uCMClientDataSet, Wwdatsrc, 
  uCtrlRADConsModulos, uCtrlPadroes;

type
  TfrmRADConsultaOC = class(TfrmSairAjuda)
    Panel1: TPanel;
    plnItem: TPanel;
    Splitter1: TSplitter;
    PgOC: TPageControl;
    TabItem: TTabSheet;
    GrdItem: TwwDBGrid;
    TabOBS: TTabSheet;
    memObsOC: TDBMemo;
    PgItem: TPageControl;
    TabPrazoEnt: TTabSheet;
    GrdPrazoEnt: TwwDBGrid;
    TabPrazoPag: TTabSheet;
    GrdPrazoPag: TwwDBGrid;
    TabAgreg: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    TabObsItem: TTabSheet;
    dbreOBS: TDBRichEdit;
    Panel5: TPanel;
    DBText1: TDBText;
    Label2: TLabel;
    Label1: TLabel;
    edData: TDBEdit;
    edFron: TDBEdit;
    dsOC: TwwDataSource;
    dsItemOC: TwwDataSource;
    dsPrazoEntOC: TwwDataSource;
    dsPrazoPagOC: TwwDataSource;
    dsAgregItemOC: TwwDataSource;
    cdsPrazoPagOC: TCMClientDataSet;
    cdsPrazoEntOC: TCMClientDataSet;
    CdsOC: TCMClientDataSet;
    cdsAgregItemOC: TCMClientDataSet;
    cdsSCItemOC: TCMClientDataSet;
    cdsItemOC: TCMClientDataSet;
    cdsSCIOrigem: TCMClientDataSet;
    edNumOC: TDBEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Panel6: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    Label8: TLabel;
    Panel7: TPanel;
    Label6: TLabel;
    Panel3: TPanel;
    procedure dsItemOCDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure GrdItemCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormDestroy(Sender: TObject);
    procedure cdsItemOCAfterOpen(DataSet: TDataSet);
    procedure GrdItemUpdateFooter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FIdProcesso : integer;
    FNumOC      : integer;
    RADConsultaCompras: TCtrlRADConsultaCompras;
    procedure SetIdProcesso(Values: integer);
    procedure SelFilhos(IdItemOC: Double);
  public
    { Public declarations }
    property IdProcesso: integer read FIdProcesso write SetIdProcesso;
    procedure SelecionarOC;
  end;

var
  frmRADConsultaOC: TfrmRADConsultaOC;

implementation

{$R *.DFM}

uses
   DBaseDados, uSistema, uMensErro;


procedure TFrmRADConsultaOC.SelFilhos(IdItemOC: Double);
begin
   cdsPrazoEntOC.Filtered  := False;
   cdsPrazoEntOC.Filter    := 'IDITEMOC = ' + FloatToStr(IdItemOC);
   cdsPrazoEntOC.Filtered  := True;

   cdsPrazoPagOC.Filtered  := False;
   cdsPrazoPagOC.Filter    := 'IDITEMOC = ' + FloatToStr(IdItemOC);
   cdsPrazoPagOC.Filtered  := True;

   cdsAgregItemOC.Filtered := False;
   cdsAgregItemOC.Filter   := 'IDITEMOC = ' + FloatToStr(IdItemOC);
   cdsAgregItemOC.Filtered := True;

   cdsSCItemOC.Filtered    := False;
   cdsSCItemOC.Filter      := 'IDITEMOC = ' + FloatToStr(IdItemOC);
   cdsSCItemOC.Filtered    := True;
end;



procedure TFrmRADConsultaOC.dsItemOCDataChange(Sender: TObject; Field: TField);
begin
   inherited;
   if dsItemOC.DataSet.State = dsBrowse then
      SelFilhos(cdsItemOC.FieldByName('IDITEMOC').AsFloat);
end;


procedure TFrmRADConsultaOC.FormShow(Sender: TObject);
begin
   inherited;
   Self.Caption := 'Consulta O.C.';
   GrdItem.Hint := 'Duplo qlique para Vizualizar a S.C.I.' + #13 +
                    'Clicque com o botão direito para Vizualizar a Cotação.';
end;



procedure TFrmRADConsultaOC.GrdItemCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   if (Field.FieldName = 'STATUS') then
   begin
      if Field.AsString = 'P' then
         ABrush.Color  := $0080FFFF
      else
      if Field.AsString = 'C' then
         ABrush.Color  := $008080FF
      else
      if Field.AsString = 'R' then
         ABrush.Color  := $0080FF80
      else
      if Field.AsString = 'A' then
         ABrush.Color  := ClAqua;

      if Highlight then AFont.Color := clBlack;
   end;
end;

procedure TFrmRADConsultaOC.FormDestroy(Sender: TObject);
begin
  FreeAndNil(RADConsultaCompras);
  inherited;
end;


procedure TFrmRADConsultaOC.cdsItemOCAfterOpen(DataSet: TDataSet);
begin
  inherited;
  //  Rodolpho da Silva P: 19276 - 08/06/2005
  TFloatField(DataSet.FieldByName('VALORUN')).DisplayFormat := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('TOTAL')).DisplayFormat   := '#,##0.00;(#,##0.00)';
end;




procedure TFrmRADConsultaOC.GrdItemUpdateFooter(Sender: TObject);
//  Rodolpho da Silva P: 19276 - 08/06/2005´- Todo o procedimento
var
   CdsAux: TCMClientDataSet;
   fTotal: Double;

begin
  inherited;
  try
    CdsAux := TCMClientDataSet.Create(nil);
    fTotal := 0;

    CdsAux.Data := cdsItemOC.Data;

    while not CdsAux.Eof do
    begin
       fTotal := fTotal + CdsAux.FieldByName('TOTAl').AsFloat;

       CdsAux.Next;
    end;

    (sender as TwwDBGrid).ColumnByName('TOTAL').FooterValue := FormatFloat('#,##0.00', fTotal);
  finally
     FreeAndNil(CdsAux);
  end;
end;


procedure TfrmRADConsultaOC.SelecionarOC;
begin
   FNumOC := RADConsultaCompras.GetOrdemCompras(IdProcesso);
   cdsOC.Data          := RADConsultaCompras.SelectOC(FNumOC , True);
   cdsItemOC.Data      := RADConsultaCompras.SelectItemOC(FNumOC);
   TField(cdsItemOC.FieldByName('STATUS')).Alignment := taCenter;

   cdsPrazoEntOC.Data  := RADConsultaCompras.SelectPrazoEntregaOC(FNumOC);
   cdsPrazoPagOC.Data  := RADConsultaCompras.SelectPrazoPgtoOC(FNumOC);
   cdsAgregItemOC.Data := RADConsultaCompras.SelectAgregItemOC(FNumOC);
   cdsSCItemOC.Data    := RADConsultaCompras.SelectSCItemOC(FNumOC);

   cdsItemOC.First;

   cdsSCIOrigem.Data   := RADConsultaCompras.SelectSCIOrigem(cdsItemOC.FieldByName('IDITEMOC').AsInteger);
end;


procedure TfrmRADConsultaOC.SetIdProcesso(Values: integer);
begin
   FIdProcesso := Values;
end;

procedure TfrmRADConsultaOC.FormCreate(Sender: TObject);
begin
  inherited;
  RADConsultaCompras := TCtrlRADConsultaCompras.Create;
  RADConsultaCompras.InitializeAs(Padroes);
end;

end.
