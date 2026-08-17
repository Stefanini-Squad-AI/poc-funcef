unit fParamContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, CMProcuraMask, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables,
  Wwquery, wwdblook, Gauges, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamContab = class(TfrmOkCancelar)
    grpPeriodo: TGroupBox;
    eDataMov: TCMDateTimePicker;
    rdgGrupo: TRadioGroup;
    rdgMovim: TRadioGroup;
    qryBem: TwwQuery;
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
    qryCtaCtbGrp: TwwQuery;
    qryCtaCtbGrpIDTIPOMOVIMENTACAO: TFloatField;
    qryCtaCtbGrpPLANO: TFloatField;
    qryCtaCtbGrpPLACONTA: TStringField;
    qryCtaCtbGrpTIPOLANCAMENTO: TStringField;
    qryCcRd: TwwQuery;
    qryCcRdCODCENTROCUSTO: TStringField;
    qryCcRdNOME: TStringField;
    qryCcRdTIPO: TStringField;
    qryCcRdPARTICIPACAO: TFloatField;
    qryCcRdIDCONJUNTO: TFloatField;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    iPlanoConta : Integer;
  end;

var
  frmParamContab: TfrmParamContab;

implementation

{$R *.DFM}

uses dRelOperCaf, uSistema, uMensErro, uFuncaoGeral, dAtivoFixo;

procedure TfrmParamContab.FormCreate(Sender: TObject);
begin
   inherited;
   if not qryBem.Prepared then
      qryBem.Prepare;
   if not qryCtaCtbGrp.Prepared then
      qryCtaCtbGrp.Prepare;
   if not qryCcRd.Prepared then
      qryCcRd.Prepare;
   eDataMov.Date := Date;   
end;
//========================================================================================
procedure TfrmParamContab.FormActivate(Sender: TObject);
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
procedure TfrmParamContab.bbtnConfirmarClick(Sender: TObject);
Var
   sObrigaCC,
   sNomeConta,
   sObrigaSubConta : String;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   pnlStatus.Visible := True;
   prgBar.Progress   := 0;
   lblStatus.Caption := 'Preparando os Bens x Contas Contábeis ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   dtmRelOperCaf.qryParamContab.Close;
   dtmRelOperCaf.qryParamContab.Open;
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
   while not qryBem.EOF do
   begin
      lblStatus.Caption := 'Verificando o Bem ' + qryBemPLACA.AsString;
      prgBar.Progress := prgBar.Progress + 1;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      // Captura os Flags de verificação de Conta Contábil
      //-------------------------------------------------------------------------------
      FuncaoGeral.TestaContaCC(True,
                               qryBemPLANO.AsInteger,
                               qryBemPLACONTA.AsString,
                               sObrigaCC, sNomeConta, sObrigaSubConta);
      //-------------------------------------------------------------------------------
      // Verifica se a conta contábil possui Centro de Custo, se a conta obriga
      //-------------------------------------------------------------------------------
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
               with dtmRelOperCaf.qryParamContab do
               begin
                  Append;
                  FieldByName('PLACA').AsFloat          := qryBemPLACA.AsFloat;
                  FieldByName('DESBEM').AsString        := qryBemDESBEM.AsString;
                  FieldByName('GRUPOCONTABIL').AsString := trim(qryBemDESCGRUPO.AsString) + ' - Conta ' + qryBemPLACONTA.AsString + ' - [' + qryBemTIPOLANCAMENTO.AsString + ']';
                  FieldByName('CCUSTO').AsString        := 'Associe o Centro de Custo ' + qryBemCODCENTROCUSTO.AsString + ' - ' + qryBemNOME.AsString + ' no Plano de Contas Contábeis';
                  Post;
               end;
            end;
         end;
      end;
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
                  with dtmRelOperCaf.qryParamContab do
                  begin
                     Append;
                     FieldByName('PLACA').AsFloat          := qryBemPLACA.AsFloat;
                     FieldByName('DESBEM').AsString        := qryBemDESBEM.AsString;
                     FieldByName('GRUPOCONTABIL').AsString := trim(qryBemDESCGRUPO.AsString) + ' - Conta ' + qryBemPLACONTA.AsString + ' - [' + qryBemTIPOLANCAMENTO.AsString + ']';
                     FieldByName('SUBCONTA').AsString      := 'A SubConta é obrigatória e não está cadastrada';
                     Post;
                  end;
               end else
               begin
                  with dtmRelOperCaf.qryParamContab do
                  begin
                     Append;
                     FieldByName('PLACA').AsFloat          := qryBemPLACA.AsFloat;
                     FieldByName('DESBEM').AsString        := qryBemDESBEM.AsString;
                     FieldByName('GRUPOCONTABIL').AsString := trim(qryBemDESCGRUPO.AsString) + ' - Conta ' + qryBemPLACONTA.AsString + ' - [' + qryBemTIPOLANCAMENTO.AsString + ']';
                     FieldByName('SUBCONTA').AsString      := 'Associe a SubConta ' + qryBemCODSUBCONTA.AsString + ' no Plano de Contas Contábeis';
                     Post;
                  end;
               end;
            end;
         end;
      end;
      qryBem.Next;
   end;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := False;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmParamContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryBem.Close;
   qryCtaCtbGrp.Close;
   qryCcRd.Close;
   qryBem.UnPrepare;
   qryCtaCtbGrp.UnPrepare;
   qryCcRd.UnPrepare;
end;

end.

