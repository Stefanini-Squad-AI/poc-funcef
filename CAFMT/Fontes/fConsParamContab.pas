unit fConsParamContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcLabel, Mask, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery, MontaSelect, Gauges,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmConsParamContab = class(TfrmSairAjuda)
    pnlDados: TPanel;
    pnlValores: TPanel;
    dbgHistorico: TwwDBGrid;
    qryDivergencias: TwwQuery;
    dsDivergencias: TwwDataSource;
    eDataMov: TCMDateTimePicker;
    bbtnExecuta: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qryBem: TwwQuery;
    qryCtaCtbGrp: TwwQuery;
    qryCcRd: TwwQuery;
    qryCcRdCODCENTROCUSTO: TStringField;
    qryCcRdNOME: TStringField;
    qryCcRdTIPO: TStringField;
    qryCcRdPARTICIPACAO: TFloatField;
    qryCcRdIDCONJUNTO: TFloatField;
    rdgGrupo: TRadioGroup;
    qryCtaCtbGrpIDTIPOMOVIMENTACAO: TFloatField;
    qryCtaCtbGrpPLANO: TFloatField;
    qryCtaCtbGrpPLACONTA: TStringField;
    qryCtaCtbGrpTIPOLANCAMENTO: TStringField;
    updDivergencias: TUpdateSQL;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    Label1: TLabel;
    rdgMovim: TRadioGroup;
    qryBemIDBEM: TFloatField;
    qryBemIDPESSOA: TFloatField;
    qryBemIDGRUPO: TFloatField;
    qryBemIDCONJUNTO: TFloatField;
    qryBemCODSUBCONTA: TFloatField;
    qryBemPLACA: TFloatField;
    qryBemDESBEM: TStringField;
    qryBemDESCGRUPO: TStringField;
    qryBemIDTIPOMOVIMENTACAO: TFloatField;
    qryBemPLANO: TFloatField;
    qryBemPLACONTA: TStringField;
    qryBemTIPOLANCAMENTO: TStringField;
    qryBemCODCENTROCUSTO: TStringField;
    qryBemNOME: TStringField;
    bbtnCancelar: TBitBtn;
    qryDivergenciasPLACA: TFloatField;
    qryDivergenciasGRUPOCONTABIL: TStringField;
    qryDivergenciasCCUSTO: TStringField;
    qryDivergenciasSUBCONTA: TStringField;
    qryDivergenciasDESBEM: TStringField;
    procedure bbtnExecutaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eDataMovEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iPlanoConta : Integer;
    bCancela : Boolean;
  end;

var
  frmConsParamContab: TfrmConsParamContab;

implementation

uses dAtivoFixo, uSistema, uFuncaoGeral;

{$R *.DFM}

procedure TfrmConsParamContab.FormCreate(Sender: TObject);
begin
   inherited;
   qryBem.Prepare;
   qryCtaCtbGrp.Prepare;
   qryCcRd.Prepare;
   qryDivergencias.Prepare;
   qryDivergencias.Open;
   eDataMov.Date := Date;
end;
//========================================================================================
procedure TfrmConsParamContab.FormActivate(Sender: TObject);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Captura o Plano de Contas Vigente
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
      iPlanoConta := FieldByName('PLANOVIGENTE').AsInteger;
   end;
end;
//========================================================================================
procedure TfrmConsParamContab.bbtnExecutaClick(Sender: TObject);
Var
   sObrigaCC,
   sNomeConta,
   sObrigaSubConta : String;
   iIdBem          : Integer;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   bCancela := False;
   pnlStatus.Visible := True;
   prgBar.Progress   := 0;
   lblStatus.Caption := 'Preparando os Bens x Contas Contábeis ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryDivergencias.Close;
   qryDivergencias.Open;
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   if rdgGrupo.ItemIndex = 0 then
   begin
      if rdgMovim.ItemIndex = 0 then
         qryBem.SQL.Strings[10] :=  ' AND (CTMG.IDTIPOMOVIMENTACAO IN (01,03))'
      else
      if rdgMovim.ItemIndex = 1 then
         qryBem.SQL.Strings[10] :=  ' AND (CTMG.IDTIPOMOVIMENTACAO IN (06,25,24,26,30,31))'
      else
      if rdgMovim.ItemIndex = 2 then
         qryBem.SQL.Strings[10] :=  ' AND (CTMG.IDTIPOMOVIMENTACAO IN (14,15,21))'
      else
      if rdgMovim.ItemIndex = 3 then
         qryBem.SQL.Strings[10] :=  ' AND (CTMG.IDTIPOMOVIMENTACAO IN (08))'
      else
      if rdgMovim.ItemIndex = 4 then
         qryBem.SQL.Strings[10] :=  ' AND (CTMG.IDTIPOMOVIMENTACAO IN (09))'
      else
      if rdgMovim.ItemIndex = 5 then
         qryBem.SQL.Strings[10] :=  ' ';
   end else
   begin
      if rdgMovim.ItemIndex = 0 then
         qryBem.SQL.Strings[10] :=  ' AND (CTMG.IDTIPOMOVIMENTACAO IN (01,03))'
      else
      if rdgMovim.ItemIndex = 1 then
         qryBem.SQL.Strings[10] :=  ' AND (CTMG.IDTIPOMOVIMENTACAO IN (06,25,24,26,20,28,27,26,37,38,39,40,30,31))'
      else
      if rdgMovim.ItemIndex = 2 then
         qryBem.SQL.Strings[10] :=  ' AND (CTMG.IDTIPOMOVIMENTACAO IN (14,18,35,15,22,34,21,19,36))'
      else
      if rdgMovim.ItemIndex = 3 then
         qryBem.SQL.Strings[10] :=  ' AND (CTMG.IDTIPOMOVIMENTACAO IN (08))'
      else
      if rdgMovim.ItemIndex = 4 then
         qryBem.SQL.Strings[10] :=  ' AND (CTMG.IDTIPOMOVIMENTACAO IN (09))'
      else
      if rdgMovim.ItemIndex = 5 then
         qryBem.SQL.Strings[10] :=  ' ';
   end;
   //-------------------------------------------------------------------------------------
   qryBem.ParamByName('PIDPESSOA').asInteger  := Sistema.IdEmpresa;
   qryBem.ParamByName('PDATAMOV').asDateTime  := eDataMov.Date;
   qryBem.ParamByName('PFLGIMOVEL').AsInteger := rdgGrupo.ItemIndex;
   qryBem.ParamByName('PPLANO').AsInteger     := iPlanoConta;
   qryBem.Open;
   //-------------------------------------------------------------------------------------
   prgBar.MaxValue := qryBem.RecordCount;
   iIdBem := 0;
   while not qryBem.EOF do
   begin
      lblStatus.Caption := 'Verificando o Bem ' + qryBemPLACA.AsString;
      prgBar.Progress := prgBar.Progress + 1;
      Application.ProcessMessages;
      //-------------------------------------------------------------------------------
      if qryBemIDBEM.AsInteger <> iIdBem then
      begin
         iIdBem := qryBemIDBEM.AsInteger;
         //-------------------------------------------------------------------------------
         // Captura os Flags de verificação de Conta Contábil
         //-------------------------------------------------------------------------------
         FuncaoGeral.TestaContaCC(True,
                                  qryBemPLANO.AsInteger,
                                  qryBemPLACONTA.AsString,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //-------------------------------------------------------------------------------
         // Verifica se a conta contábil possui SubConta
         //-------------------------------------------------------------------------------
         if sObrigaSubConta = 'S' then
         begin
            with dtmAtivoFixo.qryContasxSubC do
            begin
               Close;
               ParamByName('PIDEMPRESA').asInteger   := qryBemIDPESSOA.AsInteger;
               ParamByName('PPLANO').asInteger       := qryBemPLANO.AsInteger;
               ParamByName('PPLACONTA').asString     := qryBemPLACONTA.AsString;
               ParamByName('PCODSUBCONTA').asInteger := qryBemCODSUBCONTA.AsInteger;
               Open;
               if isEmpty then
               begin
                  if qryBemCODSUBCONTA.IsNull then
                  begin
                     qryDivergencias.Append;
                     qryDivergenciasPLACA.AsFloat          := qryBemPLACA.AsFloat;
                     qryDivergenciasDESBEM.AsString        := qryBemDESBEM.AsString;
                     qryDivergenciasGRUPOCONTABIL.AsString := trim(qryBemDESCGRUPO.AsString) + ' - Conta ' + qryBemPLACONTA.AsString + ' - [' + qryBemTIPOLANCAMENTO.AsString + ']';
                     qryDivergenciasSUBCONTA.AsString      := 'A SubConta é obrigatória e não está cadastrada';
                     qryDivergencias.Post;
                  end else
                  begin
                     qryDivergencias.Append;
                     qryDivergenciasPLACA.AsFloat          := qryBemPLACA.AsFloat;
                     qryDivergenciasDESBEM.AsString        := qryBemDESBEM.AsString;
                     qryDivergenciasGRUPOCONTABIL.AsString := trim(qryBemDESCGRUPO.AsString) + ' - Conta ' + qryBemPLACONTA.AsString + ' - [' + qryBemTIPOLANCAMENTO.AsString + ']';
                     qryDivergenciasSUBCONTA.AsString      := 'Associe a SubConta ' + qryBemCODSUBCONTA.AsString + ' no Plano de Contas Contábeis';
                     qryDivergencias.Post;
                  end;
               end;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Verifica se a conta contábil possui Centro de Custo, se a conta obriga
      //----------------------------------------------------------------------------------
      if sObrigaCC = 'S' then
      begin
         with dtmAtivoFixo.qryContasxCc do
         begin
            Close;
            ParamByName('PIDEMPRESA').asInteger      := qryBemIDPESSOA.AsInteger;
            ParamByName('PPLANO').asInteger          := qryBemPLANO.AsInteger;
            ParamByName('PPLACONTA').asString        := qryBemPLACONTA.AsString;
            ParamByName('PCODCENTROCUSTO').asString  := qryBemCODCENTROCUSTO.AsString;
            Open;
            if isEmpty then
            begin
               qryDivergencias.Append;
               qryDivergenciasPLACA.AsFloat          := qryBemPLACA.AsFloat;
               qryDivergenciasDESBEM.AsString        := qryBemDESBEM.AsString;
               qryDivergenciasGRUPOCONTABIL.AsString := trim(qryBemDESCGRUPO.AsString) + ' - Conta ' + qryBemPLACONTA.AsString + ' - [' + qryBemTIPOLANCAMENTO.AsString + ']';
               qryDivergenciasCCUSTO.AsString        := 'Associe o Centro de Custo ' + qryBemCODCENTROCUSTO.AsString + ' - ' + qryBemNOME.AsString + ' no Plano de Contas Contábeis';
               qryDivergencias.Post;
            end;
         end;
      end;
      qryBem.Next;
      if bCancela then break;
   end;
   pnlStatus.Visible := False;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmConsParamContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryBem.Close;
   qryCtaCtbGrp.Close;
   qryCcRd.Close;
   qryDivergencias.Close;
   qryBem.UnPrepare;
   qryCtaCtbGrp.UnPrepare;
   qryCcRd.UnPrepare;
   qryDivergencias.UnPrepare;
end;
//========================================================================================
procedure TfrmConsParamContab.eDataMovEnter(Sender: TObject);
begin
   inherited;
   qryDivergencias.Close;
   qryDivergencias.Open;
end;
//========================================================================================
procedure TfrmConsParamContab.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   bCancela := True;
end;

end.

