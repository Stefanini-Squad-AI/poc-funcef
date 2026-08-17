{------------------------------------------------------------------------------
  Autor  : Antonio Marcos (amf)
  Data   : 09.10.2007
  Pend.  : 26542
  Descr. : Não estava associando com o grid de fornecedores e preços.
-------------------------------------------------------------------------------
  Autor  : Antonio Marcos (amf)
  Data   : 29.08.2007
  Pend.  : 26235
  Descr. : Não estava exibindo as informações de observação da cotação e
           justificativa da Ordem de Compras.
--------------------------------------------------------------------------------}


unit FRADConsultaCotacaoComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBTables, Wwquery, uCmSqlParams, Wwdatsrc, DBClient,
  uCMClientDataSet, StdCtrls, ComCtrls, wwriched, Grids, Wwdbigrd,
  Wwdbgrid, Buttons, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, TB97, uCtrlRADConsModulos, uCtrlPadroes;

type
  TfrmRADConsultaCotacaoComp = class(TfrmSairAjuda)
    Panel1: TPanel;
    Splitter1: TSplitter;
    plnTitulo: TPanel;
    Label4: TLabel;
    LbProc: TLabel;
    BtnSelProc: TSpeedButton;
    lbStatus: TLabel;
    grdArt: TwwDBGrid;
    GrdCotacao: TwwDBGrid;
    Panel5: TPanel;
    lblobs: TLabel;
    Label5: TLabel;
    wwDBRichEdit1: TwwDBRichEdit;
    wwDBRichEdit2: TwwDBRichEdit;
    cdsSumario: TCMClientDataSet;
    dsSumario: TwwDataSource;
    cdsOc: TCMClientDataSet;
    dsOc: TwwDataSource;
    sqlOc: TCMSqlParams;
    dsOC_X: TwwDataSource;
    qryOC: TwwQuery;
    qryOCRAZAOSOCIAL: TStringField;
    qryOCNOME: TStringField;
    qryOCENDERECO: TStringField;
    qryOCCOMPLEMENTO: TStringField;
    qryOCBAIRRO: TStringField;
    qryOCCEP: TStringField;
    qryOCCODESTADO: TStringField;
    qryOCEMAIL: TStringField;
    qryOCCIDADE: TStringField;
    qryOCTELEFONE: TStringField;
    qryOCDDD: TStringField;
    qryOCNUMOC: TFloatField;
    qryOCIDFORCLI: TFloatField;
    qryOCOCATENDIDA: TStringField;
    qryOCFLGIMPRESSA: TStringField;
    qryOCFLGCOMSEMOC: TStringField;
    qryOCFLGCOMSEMCOT: TStringField;
    qryOCOBSOC: TStringField;
    qryOCDATAOC: TDateTimeField;
    qryOCCODARTIGO: TStringField;
    qryOCVALORUN: TFloatField;
    qryOCQTDEENTREGA: TFloatField;
    qryOCDATAENTREGA: TDateTimeField;
    qryOCPRAZOENTREGA: TFloatField;
    qryOCTOTIMP: TFloatField;
    qryOCTOTITEM: TFloatField;
    qryOCVALTOTITEM: TFloatField;
    qryOCTOTOC: TFloatField;
    qryOCNUMDOCUMENTO: TStringField;
    qryOCCODMEDIDA: TStringField;
    qryOCDESCRCOMPL: TMemoField;
    qryOCOBSITEMOC: TStringField;
    qryOCCONTATO: TStringField;
    qryOCFRETE: TStringField;
    qryOCDESCRICAO: TMemoField;
    cdsList: TCMClientDataSet;
    dsList: TwwDataSource;
    CMSqlParams1: TCMSqlParams;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure cdsListAfterScroll(DataSet: TDataSet);

  private
    bVerifStatus: boolean;

    RADConsultaCompras: TCtrlRAdConsultaCompras;

    FIdProcesso: Integer;
    iCodProcesso: integer;

    procedure dsListDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GrdCotacaoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure SetIdProcesso(const Value: Integer);
    procedure StatusProcesso;

  public

    property IdProcesso: Integer read FIdProcesso write SetIdProcesso;

    procedure SelecionarCotacaoCompras;
  end;

var
  frmRADConsultaCotacaoComp: TfrmRADConsultaCotacaoComp;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, Math, dBaseDados{, DCompras};


procedure TfrmRADConsultaCotacaoComp.FormCreate(Sender: TObject);
begin
  inherited;
  RADConsultaCompras := TCtrlRADConsultaCompras.Create;
  RADConsultaCompras.InitializeAs(Padroes);

  //amf 08.12.2006 23860 - Sumario/Cotação no modo consulta
  Label5.Visible := true;
  lblobs.Visible := true;
  wwDBRichEdit1.visible := true;
  wwDBRichEdit2.visible := true;

  bVerifStatus        := False;
  lbStatus.Visible    := False;
end;

procedure TfrmRADConsultaCotacaoComp.SelecionarCotacaoCompras;
begin
  iCodProcesso    := RADConsultaCompras.GetNumProcessoCompras(IdProcesso);
  lbProc.Caption  := IntToStr(iCodProcesso);
  StatusProcesso;
  cdsList.Data    := RADConsultaCompras.SelectItensSumario(iCodProcesso);
  cdsSumario.Data := RadConsultaCompras.SelectListSumario(cdsList.FieldByName('CODPROCESSO').AsInteger,
                                                          cdsList.FieldByName('IDPROCXART').AsInteger);
end;


procedure TfrmRADConsultaCotacaoComp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(RADConsultaCompras);
  inherited;
end;

procedure TfrmRADConsultaCotacaoComp.dsListDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (cdsList.State <> dsInactive) And ( Not bVerifStatus ) Then
  begin
    cdsSumario.Data := RadConsultaCompras.SelectListSumario(cdsList.FieldByName('CODPROCESSO').AsInteger,
                                                            cdsList.FieldByName('IDPROCXART').AsInteger);

    TStringField(cdsSumario.FieldByName('STATUS')).Alignment := taCenter;
    TFloatField(cdsSumario.FieldByName('PRECOAVALORPRES')).DisplayFormat := '#,##0.00';
    TFloatField(cdsSumario.FieldByName('PRECOTOTAL')).DisplayFormat      := '#,##0.00';
    TFloatField(cdsSumario.FieldByName('PRECO')).DisplayFormat           := '#,##0.00';
  end;
end;

procedure TfrmRADConsultaCotacaoComp.GrdCotacaoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  IF (Field.FieldName = 'STATUS') Then
     Begin
         If Field.AsString = 'S' Then
            ABrush.Color  := $0080FFFF
         Else
         If Field.AsString = 'U' Then
            ABrush.Color  := $00B7C1FF
         Else
         If Field.AsString = 'C' Then
            ABrush.Color  := $0080FF80;
         If Highlight Then
            AFont.Color := clBlack;
     End;
end;

procedure TfrmRADConsultaCotacaoComp.FormShow(Sender: TObject);
begin
  inherited;
  Self.Caption          := 'Consulta Sumário de Cotação';
  Self.HelpContext      := 1130039;
  bbtnAjuda.HelpContext := 1130019;
  Application.ProcessMessages;
end;


procedure TfrmRADConsultaCotacaoComp.SetIdProcesso(const Value: Integer);
begin
  FIdProcesso := Value;
end;


procedure TfrmRADConsultaCotacaoComp.StatusProcesso;
begin
   lbStatus.Visible := True;
   if (RADConsultaCompras.Status  = 'P') then
      lbStatus.Caption := 'Pendente de Cotação'
   else if (RADConsultaCompras.Status  = 'C') then
           lbStatus.Caption := 'Em Cotação'
   else if (RADConsultaCompras.Status  = 'S') then
           lbStatus.Caption := 'Sumário já Calculado'
   else if (RADConsultaCompras.Status  = 'O') then
           lbStatus.Caption := 'Pronta para Gerar O.C.'
   else if (RADConsultaCompras.Status  = 'F') then
           lbStatus.Caption := 'O.C. Já Gerada';
end;

procedure TfrmRADConsultaCotacaoComp.cdsListAfterScroll(DataSet: TDataSet);
begin
  //amf 26542 09.10.2007 - corrige a associação com o fornecedor
  if (cdsList.State <> dsInactive) And ( Not bVerifStatus ) Then
  begin
    cdsSumario.Data := RadConsultaCompras.SelectListSumario(cdsList.FieldByName('CODPROCESSO').AsInteger,
                                                            cdsList.FieldByName('IDPROCXART').AsInteger);

    TStringField(cdsSumario.FieldByName('STATUS')).Alignment := taCenter;
    TFloatField(cdsSumario.FieldByName('PRECOAVALORPRES')).DisplayFormat := '#,##0.00';
    TFloatField(cdsSumario.FieldByName('PRECOTOTAL')).DisplayFormat      := '#,##0.00';
    TFloatField(cdsSumario.FieldByName('PRECO')).DisplayFormat           := '#,##0.00';
  end;

end;

end.
