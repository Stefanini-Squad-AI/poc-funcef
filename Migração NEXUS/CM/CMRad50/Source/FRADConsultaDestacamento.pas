{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Andre Mesquita                  }
{ Criado Em: 29/03/2007                                 }
{                                                       }
{*******************************************************}

{-------------------------------------------------------------------------------
 Data       : 19/09/2007
 Autor      : andré tavares
 Pendência  : 26377
 Descrição  : Troquei os componentes de contrle das colunas JUSTIFICATIVA e OBSERVACAO por dbMemo,
 pois estava sendo utilizado o dbEdit e estava causando uma exceção
--------------------------------------------------------------------------------}


unit FRADConsultaDestacamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TREdit,
  Db, DBClient, uCMClientDataSet, uCtrlRADConsModulos, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, uCmSqlParams,
  Wwdatsrc, uCtrlPadroes, dxEdLib, dxCntner, dxEditor, dxDBELib;

type
  TfrmRADConsultaDestacamento = class(TfrmSairAjuda)
    pnlMestre: TPanel;
    Panel2: TPanel;
    pgctrlDetalhe: TPageControl;
    tsCalendario: TTabSheet;
    dbgrdCalendario: TwwDBGrid;
    tsTrecho: TTabSheet;
    dbgrdTrecho: TwwDBGrid;
    cdsDestacamento: TCMClientDataSet;
    cdsCalendario: TCMClientDataSet;
    cdsTrecho: TCMClientDataSet;
    GroupBox3: TGroupBox;
    dbrgObjetivo: TDBRadioGroup;
    gbxPeriodo: TGroupBox;
    Label2: TLabel;
    dbdtIni: TCMDateTimePicker;
    dbdtFim: TCMDateTimePicker;
    edtAcerto: TDBRealEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    dbedCargo: TDBEdit;
    dbedLotac: TDBEdit;
    dbedDestacado: TwwDBEdit;
    qryDestacamento: TCMSqlParams;
    qryCalendario: TCMSqlParams;
    qryTrecho: TCMSqlParams;
    cdsCalendarioIDDESTACAMENTO: TFloatField;
    cdsCalendarioDATADESTACAMENTO: TDateTimeField;
    cdsCalendarioFLGDIARIA: TFloatField;
    cdsCalendarioTRGDTINCLUSAO: TDateTimeField;
    cdsCalendarioTRGUSERINCLUSAO: TStringField;
    cdsCalendarioVLRDIARIA: TFloatField;
    cdsCalendarioVLRHOTEL: TFloatField;
    cdsCalendarioVLRDESLOCAMENTO: TFloatField;
    cdsCalendarioPCDIARIA: TFloatField;
    cdsCalendarioPCHOTEL: TFloatField;
    cdsCalendarioPCDESLOCAMENTO: TFloatField;
    cdsTrechoIDDESTACAMENTO: TFloatField;
    cdsTrechoNUMSEQ: TFloatField;
    cdsTrechoIDCIDADES: TFloatField;
    cdsTrechoDATAINI: TDateTimeField;
    cdsTrechoINDTRANSPORTE: TFloatField;
    cdsTrechoFLGTRANSPORTE: TFloatField;
    cdsTrechoVLRTRANSPORTE: TFloatField;
    cdsTrechoVLREMBARQUE: TFloatField;
    cdsTrechoVLRDESEMBARQUE: TFloatField;
    cdsTrechoTRGDTINCLUSAO: TDateTimeField;
    cdsTrechoTRGUSERINCLUSAO: TStringField;
    dsDestacamento: TwwDataSource;
    dsCalendario: TwwDataSource;
    dsTrecho: TwwDataSource;
    cdsCalendarioQUEMPAGA: TStringField;
    cdsTrechoTRANSPORTE: TStringField;
    cdsTrechoRESPTRANSPORTE: TStringField;
    cdsTrechoNOME: TStringField;
    tsAcerto: TTabSheet;
    GroupBox6: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    dbedAliment: TDBRealEdit;
    dbedOutras: TDBRealEdit;
    dbrgTipoAcerto: TDBRadioGroup;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    edtSumDiarias: TRealEdit;
    Label3: TLabel;
    edtSaldo: TDBRealEdit;
    lblTipo: TLabel;
    dbedObserv: TDBMemo;
    dbedJustificativa: TDBMemo;
    cdsDestacamentoIDDESTACAMENTO: TFloatField;
    cdsDestacamentoIDPROCESSO: TFloatField;
    cdsDestacamentoIDPESSOA: TFloatField;
    cdsDestacamentoFLGFUNCIONARIO: TFloatField;
    cdsDestacamentoDATAINI: TDateTimeField;
    cdsDestacamentoDATAFIM: TDateTimeField;
    cdsDestacamentoOBSERVACAO: TMemoField;
    cdsDestacamentoVLRACERTO: TFloatField;
    cdsDestacamentoINDACERTO: TStringField;
    cdsDestacamentoJUSTIFICATIVA: TMemoField;
    cdsDestacamentoTRGDTINCLUSAO: TDateTimeField;
    cdsDestacamentoTRGUSERINCLUSAO: TStringField;
    cdsDestacamentoINDOBJETIVO: TFloatField;
    cdsDestacamentoFLGLANCAFOLHA: TFloatField;
    cdsDestacamentoFLGGERAAP: TFloatField;
    cdsDestacamentoVALALIMENT: TFloatField;
    cdsDestacamentoVALOUTROS: TFloatField;
    cdsDestacamentoDATAEMAILACERTO: TDateTimeField;
    cdsDestacamentoCODDOCACERTO: TFloatField;
    cdsDestacamentoCODDOCDESTAC: TFloatField;
    cdsDestacamentoIDUSUARIOSISTEMA: TFloatField;
    cdsDestacamentoIDPROCESSOACERTO: TFloatField;
    cdsDestacamentoNOME: TStringField;
    cdsDestacamentoID_CARGO: TFloatField;
    cdsDestacamentoCODCENTROCUSTO: TStringField;
    cdsDestacamentoNM_CENTRO_CUSTO: TStringField;
    cdsDestacamentoNM_CARGO: TStringField;
    TabSheet1: TTabSheet;
    gbxCAP: TGroupBox;
    Shape17: TShape;
    Shape14: TShape;
    Shape16: TShape;
    Shape15: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Shape3: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    lblStatusDestacamento: TLabel;
    lblStatusAcerto: TLabel;
    Shape12: TShape;
    Label25: TLabel;
    Shape13: TShape;
    Label26: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Shape18: TShape;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    Shape19: TShape;
    Shape20: TShape;
    lblTipoAcerto: TLabel;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Label13: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    cdsDestacamentoUSUARIODESTAC: TStringField;
    cdsDestacamentoUSUARIOACERTO: TStringField;
    cdsDestacamentoDOCDESTAC: TFloatField;
    cdsDestacamentoDOCACERTO: TFloatField;
    cdsTotCalendario: TCMClientDataSet;
    DBText7: TDBText;
    DBText8: TDBText;
    cdsTotTrecho: TCMClientDataSet;
    dsTotTrecho: TwwDataSource;
    dsTotCalendario: TwwDataSource;
    edtTotalAcerto: TdxDBEdit;
    lblSaldo: TLabel;
    tbsDespViagem: TTabSheet;
    CdsDespesas: TCMClientDataSet;
    dsDespesas: TwwDataSource;
    dbgrdDesp: TwwDBGrid;
    wwIButton1: TwwIButton;
    procedure cdsDestacamentoCalcFields(DataSet: TDataSet);
    procedure dbgrdCalendarioUpdateFooter(Sender: TObject);
    procedure dbgrdDespUpdateFooter(Sender: TObject); //andre tavares - pendencia ???? - 09/10/2007

    procedure dbgrdTrechoUpdateFooter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FIdProcesso: integer;
    FIdDestacamento : Integer;
    RADConsultaDestacamento: TCtrlRADConsultaDestacamento;
    procedure SetIdProcesso(const Value: integer);
    function SomaValorTotal : Single;
  public
    property IdProcesso: integer read FIdProcesso write SetIdProcesso;
    property IdDestacamento : Integer read FIdDestacamento;
    procedure SelecionarDestacamento(const iRADRef : Integer);
  end;

var
  frmRADConsultaDestacamento: TfrmRADConsultaDestacamento;

implementation

{$R *.DFM}

uses uSistema, DBaseDados, uMensErro;

{ TfrmRADConsultaDestacamento }

procedure TfrmRADConsultaDestacamento.SelecionarDestacamento(const iRADRef : Integer);
begin
  FIdDestacamento      := RADConsultaDestacamento.getDestacamento(FIdProcesso, iRADRef);
  cdsDestacamento.Data := RADConsultaDestacamento.ListaDestacamento(FIdDestacamento);
  cdsCalendario.Data   := RADConsultaDestacamento.ListaCalendario(FIdDestacamento);
  cdsTrecho.Data       := RADConsultaDestacamento.ListaTrecho(FIdDestacamento);

  //início - andre tavares - pendência ???? - 09/10/2007
  cdsTotCalendario.data := RADConsultaDestacamento.ListaTotValoresCalendario(FIdDestacamento);
  cdsTotTrecho.data     := RADConsultaDestacamento.ListaTotValoresTrecho(FIdDestacamento);

  TFloatField(cdsTotCalendario.FieldByName('VLRDIARIA')).DisplayFormat := '###,##0.00';
  TFloatField(cdsTotTrecho.FieldByName('TOTTRECHO')).DisplayFormat     := '###,##0.00';
  TFloatField(cdsDestacamento.FieldByName('VLRACERTO')).DisplayFormat  := '###,##0.00';

  lblsaldo.Caption      := FormatFloat('###,###0.00', cdsTotCalendario.fieldByName('VLRDIARIA').asFloat +
                                                      cdsTotTrecho.fieldByName('TOTTRECHO').asFloat -
                                                      cdsDestacamento.fieldbyName('VLRACERTO').asFloat);

  CdsDespesas.Data      := RADConsultaDestacamento.listarDespesas(FIdDestacamento);

  lblStatusDestacamento.Caption := RADConsultaDestacamento.buscarStatusRAD(cdsDestacamento.fieldByName('IDPROCESSO').asInteger);
  lblStatusAcerto.Caption       := RADConsultaDestacamento.buscarStatusRAD(cdsDestacamento.fieldByName('IDPROCESSOACERTO').asInteger);
  //fim - andre tavares - pendência ???? - 09/10/2007


  edtSumDiarias.Value  := SomaValorTotal;
  pgctrlDetalhe.ActivePage := tsCalendario;

  lblTipo.Caption := '';
  if FIdDestacamento > 0 then begin
     edtSaldo.Value := ABS( edtSumDiarias.Value - edtAcerto.Value );
     if ( edtSumDiarias.Value - edtAcerto.Value ) > 0 then
          lblTipo.Caption := 'a Receber'
     else lblTipo.Caption := 'a Pagar';
  end;
end;

procedure TfrmRADConsultaDestacamento.SetIdProcesso(const Value: integer);
begin
  FIdProcesso := Value;
end;

procedure TfrmRADConsultaDestacamento.cdsDestacamentoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('NM_CARGO').AsString :=
    RADConsultaDestacamento.getDescricaoCargo(
                                     DataSet.FieldByName('ID_CARGO').AsInteger);
  DataSet.FieldByName('NM_CENTRO_CUSTO').AsString :=
    RADConsultaDestacamento.getDescricaoCentroCusto(
                                DataSet.FieldByName('CODCENTROCUSTO').AsInteger);
end;

procedure TfrmRADConsultaDestacamento.dbgrdCalendarioUpdateFooter(
  Sender: TObject);
var
  fDiaria,
  fHotel,
  fDeslocamento : Single;
  cdsTemp       : TCMClientDataSet;
begin
  inherited;
  fDiaria       := 0;
  fHotel        := 0;
  fDeslocamento := 0;
  try
    try
       cdsTemp          := TCMClientDataSet.Create( nil );
       cdsTemp.Data     := cdsCalendario.Data;
       cdsTemp.DisableControls;
       cdsTemp.First;
       while not cdsTemp.Eof do
         begin
           fDiaria       := fDiaria       + (cdsTemp.FieldByName('VLRDIARIA'{ivlm}).AsFloat * (cdsTemp.FieldByName('PCDIARIA'{ivlm}).AsFloat/100));
           fHotel        := fHotel        + (cdsTemp.FieldByName('VLRHOTEL'{ivlm}).AsFloat * (cdsTemp.FieldByName('PCHOTEL'{ivlm}).AsFloat/100));
           fDeslocamento := fDeslocamento + (cdsTemp.FieldByName('VLRDESLOCAMENTO'{ivlm}).AsFloat * (cdsTemp.FieldByName('PCDESLOCAMENTO'{ivlm}).AsFloat/100));
           cdsTemp.Next;
         end;
       // end while

       dbgrdCalendario.ColumnByName('VLRDIARIA'{ivlm}).FooterValue       := FormatFloat('###,###0.00'{ivlm}, fDiaria);
       dbgrdCalendario.ColumnByName('VLRHOTEL'{ivlm}).FooterValue        := FormatFloat('###,###0.00'{ivlm}, fHotel);
       dbgrdCalendario.ColumnByName('VLRDESLOCAMENTO'{ivlm}).FooterValue := FormatFloat('###,###0.00'{ivlm}, fDeslocamento);
    except
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;

procedure TfrmRADConsultaDestacamento.dbgrdTrechoUpdateFooter(
  Sender: TObject);
var
  fTransporte,
  fEmbarque,
  fDesembarque : Single;
  cdsTemp       : TCMClientDataSet;
begin
  inherited;
  fTransporte  := 0;
  fEmbarque    := 0;
  fDesembarque := 0;
  try
    try
       cdsTemp          := TCMClientDataSet.Create( nil );
       cdsTemp.Data     := cdsTrecho.Data;
       cdsTemp.DisableControls;
       cdsTemp.First;
       while not cdsTemp.Eof do
         begin
           fTransporte  := fTransporte  + cdsTemp.FieldByName('VLRTRANSPORTE'{ivlm}).AsFloat;
           fEmbarque    := fEmbarque    + cdsTemp.FieldByName('VLREMBARQUE'{ivlm}).AsFloat;
           fDesembarque := fDesembarque + cdsTemp.FieldByName('VLRDESEMBARQUE'{ivlm}).AsFloat;
           cdsTemp.Next;
         end;
       // end while

       dbgrdTrecho.ColumnByName('VLRTRANSPORTE'{ivlm}).FooterValue  := FormatFloat('###,###0.00'{ivlm}, fTransporte);
       dbgrdTrecho.ColumnByName('VLREMBARQUE'{ivlm}).FooterValue    := FormatFloat('###,###0.00'{ivlm}, fEmbarque);
       dbgrdTrecho.ColumnByName('VLRDESEMBARQUE'{ivlm}).FooterValue := FormatFloat('###,###0.00'{ivlm}, fDesembarque);

    except
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;

function TfrmRADConsultaDestacamento.SomaValorTotal : Single;
var
  subTotal1,
  subTotal2,
  total : Single;
  bm : TBookMark;
begin
  // Totaliza o CALENDÁRIO
  cdsCalendario.DisableControls;
  bm := cdsCalendario.getBookMark;

  cdsCalendario.First;
  subTotal1 := 0;
  While not cdsCalendario.Eof do
    begin
      subTotal1 := subTotal1 + (cdsCalendario.FieldByName('VLRDIARIA'{ivlm}).AsFloat *
                               (cdsCalendario.FieldByName('PCDIARIA'{ivlm}).AsFloat/100));
      subTotal1 := subTotal1 + (cdsCalendario.FieldByName('VLRHOTEL'{ivlm}).AsFloat *
                               (cdsCalendario.FieldByName('PCHOTEL'{ivlm}).AsFloat/100));
      subTotal1 := subTotal1 + (cdsCalendario.FieldByName('VLRDESLOCAMENTO'{ivlm}).AsFloat *
                               (cdsCalendario.FieldByName('PCDESLOCAMENTO'{ivlm}).AsFloat/100));
      cdsCalendario.Next;
    end;
  // end while

  cdsCalendario.GotoBookmark(bm);
  cdsCalendario.EnableControls;
  cdsCalendario.FreeBookMark(bm);

  // Totaliza o TRECHO

  cdsTrecho.DisableControls;
  bm := cdsTrecho.getBookMark;

  cdsTrecho.First;
  subTotal2 := 0;
  While not cdsTrecho.Eof do
    begin
      subTotal2 := subTotal2 + cdsTrecho.FieldByName('VLRTRANSPORTE'{ivlm}).AsFloat;
      subTotal2 := subTotal2 + cdsTrecho.FieldbyName('VLREMBARQUE'{ivlm}).AsFloat;
      subTotal2 := subTotal2 + cdsTrecho.FieldbyName('VLRDESEMBARQUE'{ivlm}).AsFloat;
      cdsTrecho.Next;
    end;
  // end while

  cdsTrecho.GotoBookmark(bm);
  cdsTrecho.EnableControls;
  cdsTrecho.FreeBookMark(bm);

  // Total GERAL
  total := subTotal1 + subTotal2;

  Result := total;
end;

procedure TfrmRADConsultaDestacamento.FormCreate(Sender: TObject);
begin
  inherited;
  RADConsultaDestacamento := TCtrlRADConsultaDestacamento.Create;
  RADConsultaDestacamento.InitializeAs(Padroes);
end;

procedure TfrmRADConsultaDestacamento.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(RADConsultaDestacamento);
end;


//andre tavares - pendencia ???? - 09/10/2007
procedure TfrmRADConsultaDestacamento.dbgrdDespUpdateFooter(Sender: TObject);
var
  fDespesa: Extended;
  cdsTemp : TCMClientDataSet;
begin
  inherited;
  if dbgrdDesp.DataSource.DataSet.IsEmpty then
  begin
    dbgrdDesp.ColumnByName('VALOR').FooterValue := FormatFloat('###,###0.00', 0);
    exit;
  end;

  fDespesa := 0;
  try
    cdsTemp          := TCMClientDataSet.Create( nil );
    cdsTemp.Data     := CdsDespesas.Data;
    cdsTemp.DisableControls;
    cdsTemp.First;
    while not cdsTemp.Eof do
    begin
      fDespesa := fDespesa + cdsTemp.FieldByName('VALOR').AsFloat;
      cdsTemp.Next;
    end;
    // end while
    dbgrdDesp.ColumnByName('VALOR').FooterValue := FormatFloat('###,##0.00', fDespesa);
  finally
    FreeAndNil( cdsTemp );
  end;
end;



end.
