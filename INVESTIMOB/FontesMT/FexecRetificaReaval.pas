{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecRetificaReaval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  DBTables, Wwquery, Db, Wwdatsrc, Provider, DBClient, wwdbdatetimepicker,
  CMDateTimePicker, mImovelouMestre, mFornecedor, Grids, Wwdbigrd, Wwdbgrid, uCtrlBem,
  uCtrlEventoImovel, uCtrlMovReavaliacao;

type
  TfrmExecRetificaReaval = class(TfrmWizardMT)
    molImovelouMestre: TmolImovelouMestre;
    edtDataReavalia: TCMDateTimePicker;
    Label15: TLabel;
    cdsImovel: TClientDataSet;
    cdsImovelIMOVEL_EXTENSO: TStringField;
    cdsImovelPERCENTUAL: TFloatField;
    cdsImovelVLR_REAVALIA: TFloatField;
    cdsImovelVIDAUTIL: TFloatField;
    cdsImovelIDIMOVEL: TFloatField;
    cdsImovelALT: TFloatField;
    cdsImovelVLR_CONTABIL: TFloatField;
    dspImovel: TDataSetProvider;
    updImovel: TUpdateSQL;
    dsImovel: TwwDataSource;
    qryImovel: TwwQuery;
    qryImovelIMOVEL_EXTENSO: TStringField;
    qryImovelPERCENTUAL: TFloatField;
    qryImovelVLR_REAVALIA: TFloatField;
    qryImovelVIDAUTIL: TFloatField;
    qryImovelIDIMOVEL: TFloatField;
    qryImovelALT: TFloatField;
    qryImovelVLR_CONTABIL: TFloatField;
    cdsBem: TClientDataSet;
    dspBem: TDataSetProvider;
    updBem: TUpdateSQL;
    dsBem: TwwDataSource;
    qryBem: TwwQuery;
    dbgBens: TwwDBGrid;
    Panel3: TPanel;
    molFornecedor: TmolFornecedor;
    Label7: TLabel;
    meObsEvento: TMemo;
    qryBemIDIMOVEL: TFloatField;
    qryBemIDBEM: TFloatField;
    qryBemDESBEM: TStringField;
    qryBemDATAREAVALIACAO: TDateTimeField;
    qryBemVLR_REAVALIA: TFloatField;
    qryBemVIDAUTIL: TFloatField;
    qryBemVLR_CONTABIL: TFloatField;
    qryBemNOVAVIDAUTIL: TFloatField;
    qryBemNOVOVLR_REAVALIA: TFloatField;
    cdsBemIDIMOVEL: TFloatField;
    cdsBemIDBEM: TFloatField;
    cdsBemDESBEM: TStringField;
    cdsBemDATAREAVALIACAO: TDateTimeField;
    cdsBemVIDAUTIL: TFloatField;
    cdsBemVLR_CONTABIL: TFloatField;
    cdsBemNOVAVIDAUTIL: TFloatField;
    cdsBemNOVOVLR_REAVALIA: TFloatField;
    dbgBemResult: TwwDBGrid;
    Panel1: TPanel;
    qryBemDEPRECIACAO: TFloatField;
    cdsBemDEPRECIACAO: TFloatField;
    qryBemIDRETIFICREAV: TFloatField;
    cdsBemIDRETIFICREAV: TFloatField;
    cdsBemResult: TClientDataSet;
    dspBemResult: TDataSetProvider;
    updBemResult: TUpdateSQL;
    dsBemResult: TwwDataSource;
    qryBemResult: TwwQuery;
    qryBemResultIDBEM: TFloatField;
    qryBemResultIDIMOVEL: TFloatField;
    qryBemResultIDPESSOA: TFloatField;
    qryBemResultIDREAVALIACAO: TFloatField;
    qryBemResultDATAREAVALIACAO: TDateTimeField;
    qryBemResultIDAVALIADOR: TFloatField;
    qryBemResultVLRREAVALIA: TFloatField;
    qryBemResultVIDAUTIL: TFloatField;
    qryBemResultAJUSTEDEP: TFloatField;
    qryBemResultNOVOSALDO: TFloatField;
    cdsBemResultIDBEM: TFloatField;
    cdsBemResultIDIMOVEL: TFloatField;
    cdsBemResultIDPESSOA: TFloatField;
    cdsBemResultIDREAVALIACAO: TFloatField;
    cdsBemResultDATAREAVALIACAO: TDateTimeField;
    cdsBemResultIDAVALIADOR: TFloatField;
    cdsBemResultVLRREAVALIA: TFloatField;
    cdsBemResultVIDAUTIL: TFloatField;
    cdsBemResultAJUSTEDEP: TFloatField;
    cdsBemResultNOVOSALDO: TFloatField;
    qryBemResultDESBEM: TStringField;
    cdsBemResultDESBEM: TStringField;
    qryBemIDPESSOA: TFloatField;
    cdsBemIDPESSOA: TFloatField;
    qryInsReavalia: TwwQuery;
    qryBemResultFLGRETIFICA: TFloatField;
    cdsBemResultFLGRETIFICA: TFloatField;
    qryValCalculado: TwwQuery;
    qryValCalculadoVALOR: TFloatField;
    cdsBemVLR_REAVALIA: TFloatField;
    qryBemIXBGRUPO: TStringField;
    cdsBemIXBGRUPO: TStringField;
    procedure molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbgBensCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgBensTopRowChanged(Sender: TObject);
    procedure dbgBemResultCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure btnVoltarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    CtrlBem            : TCtrlBem;
    CtrlEventoImovel   : TCtrlEventoImovel;
    CtrlMovReavaliacao : TCtrlMovReavaliacao;

    procedure BloqueiaGrid(const bReadOnly: Boolean);
    procedure AbreQueryImovel;
    procedure AbreQueryBens;
  public
    { Public declarations }
  end;

var
  frmExecRetificaReaval: TfrmExecRetificaReaval;

implementation

{$R *.DFM}

uses
   uCAF, uFuncoesImob, uSistema, uModuloImobiliario, dBaseDados, uDataBase, uMensErro;



procedure TfrmExecRetificaReaval.AbreQueryBens;
begin
   cdsBem.Close;
   LimpaParametros(qryBem);
   qryBem.ParamByName('PIDIMOVEL').AsInteger      := molImovelouMestre.iImovel;
   qryBem.ParamByName('DDATAPROCESSO').AsDateTime := edtDataReavalia.Date;
   qryBem.Open;
   cdsBem.Open;

   cdsImovel.DisableControls;
   cdsBem.DisableControls;
   cdsBem.First;
   cdsImovel.First;
   while not cdsImovel.Eof do
   begin
      while (cdsImovel.FieldByName('IDIMOVEL').AsInteger = cdsBem.FieldByName('IDIMOVEL').AsInteger) and
            (not cdsBem.Eof) do begin
         cdsBem.Edit;
         cdsBem.FieldByName('VLR_CONTABIL').AsFloat := CtrlBem.SaldoContabil(Sistema.IdEmpresa,
                                                                             cdsBem.FieldByName('IDBEM').AsInteger,
                                                                             edtDataReavalia.Date,
                                                                             ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                                             ModuloImobiliario.InvestImob.iIdPaisCAF);
         cdsBem.Post;
         cdsBem.Next;
      end;
      cdsImovel.Next;
   end;
   cdsBem.First;
   cdsImovel.First;
   cdsImovel.EnableControls;
   cdsBem.EnableControls;

   BloqueiaGrid(True);
end;



procedure TfrmExecRetificaReaval.AbreQueryImovel;
begin
   cdsImovel.Close;
   LimpaParametros(qryImovel);
   qryImovel.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   if molImovelouMestre.iMestre = -1 then
        qryImovel.ParamByName('PIDIMOVELMESTRE').AsInteger := molImovelouMestre.iImovel
   else qryImovel.ParamByName('PIDIMOVEL').AsInteger       := molImovelouMestre.iImovel;
   qryImovel.Open;
   cdsImovel.Open;

   AbreQueryBens;
end;



procedure TfrmExecRetificaReaval.BloqueiaGrid(const bReadOnly: Boolean);
begin
   if bReadOnly then
   begin
      dbgBens.Fields[0].ReadOnly := True;
      dbgBens.Fields[1].ReadOnly := True;
      dbgBens.Fields[2].ReadOnly := True;
      dbgBens.Fields[3].ReadOnly := True;
      dbgBens.Fields[4].ReadOnly := True;
      dbgBens.Fields[5].ReadOnly := True;
      dbgBens.Fields[6].ReadOnly := False;
      dbgBens.Fields[7].ReadOnly := False;
   end
   else
   begin
      dbgBens.Fields[0].ReadOnly := False;
      dbgBens.Fields[1].ReadOnly := False;
      dbgBens.Fields[2].ReadOnly := False;
      dbgBens.Fields[3].ReadOnly := False;
      dbgBens.Fields[4].ReadOnly := False;
      dbgBens.Fields[5].ReadOnly := False;
      dbgBens.Fields[6].ReadOnly := False;
      dbgBens.Fields[7].ReadOnly := False;
   end;
end;



procedure TfrmExecRetificaReaval.molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
begin
   inherited;
   molImovelouMestre.btnBuscaImovelClick(Sender);
   if molImovelouMestre.edtImovel.Text <> '' then AbreQueryImovel;
end;



procedure TfrmExecRetificaReaval.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlBem            := TCtrlBem.Create;
   CtrlBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   CtrlEventoImovel   := TCtrlEventoImovel.Create;
   CtrlEventoImovel.InitializeAs( CtrlBem );

   CtrlMovReavaliacao := TCtrlMovReavaliacao.Create;
   CtrlMovReavaliacao.InitializeAs( CtrlBem );

   edtDataReavalia.Date := Date;
end;



procedure TfrmExecRetificaReaval.FormDestroy(Sender: TObject);
begin
   FreeAndNil( CtrlBem );
   FreeAndNil( CtrlEventoImovel );
   FreeAndNil( CtrlMovReavaliacao );
   inherited;
end;



procedure TfrmExecRetificaReaval.btnContinuarClick(Sender: TObject);
var
  bFazDepreciacao : Boolean;
begin
  bFazDepreciacao := True;
   if molImovelouMestre.edtImovel.Text = '' then
   begin
      MsgDlg('Favor informar o imóvel','InvestImob',mtInformation,[mbOK],0);
      Exit;
   end;

   if Trim(edtDataReavalia.Text) = '' then
   begin
      MsgDlg('Favor informar a data da movimentação','InvestImob',mtInformation,[mbOK],0);
      Exit;
   end;

   if molFornecedor.edtNomeFantasia.Text = '' then
   begin
      MsgDlg('Favor informar o avaliador','InvestImob',mtInformation,[mbOK],0);
      Exit;
   end;

   if Trim(meObsEvento.Text) = '' then
   begin
      MsgDlg('Favor informar as observações do evento','InvestImob',mtInformation,[mbOK],0);
      Exit;
   end;

   if cdsBem.State in dsEditModes then cdsBem.Post;

   cdsBemResult.Close;
   qryBemResult.Close;
   qryBemResult.Open;
   cdsBemResult.Open;

   cdsBem.First;

   StartTransacao;

   try
      while not cdsBem.Eof do
      begin

         if (cdsBemNOVOVLR_REAVALIA.AsCurrency <> cdsBemVLR_REAVALIA.AsCurrency) or
            (cdsBemNOVAVIDAUTIL.AsInteger <> cdsBemVIDAUTIL.AsInteger) then
         begin
            // Efetua os calculos dos novos valores
            CtrlMovReavaliacao.OpenTransaction     := False;
            CtrlMovReavaliacao.MessageInfo         := '';

            //Cássio - SOL Nº 109611 KINTANA Nº 497579 - Início
            if (cdsBemIXBGRUPO.AsString = 'T')   then
              bFazDepreciacao := False;
            //Cássio - SOL Nº 109611 KINTANA Nº 497579 - Fim

            if not CtrlMovReavaliacao.ExecutaRetificaReaval(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                                            cdsBemIDBEM.AsInteger, cdsBemDATAREAVALIACAO.AsDateTime,
                                                            edtDataReavalia.Date, cdsBemNOVOVLR_REAVALIA.AsCurrency,
                                                            cdsBemNOVAVIDAUTIL.AsInteger, Copy(meObsEvento.Text,1,60),1, bFazDepreciacao) then
               Raise Exception.Create(CtrlMovReavaliacao.MessageInfo);

            LimpaParametros(qryValCalculado);
            qryValCalculado.ParamByName('PIDBEM').AsInteger             := cdsBemIDBEM.AsInteger;
            qryValCalculado.ParamByName('PDATAMOVIMENTACAO').AsDateTime := edtDataReavalia.Date;
            qryValCalculado.Open;

            cdsBemResult.Append;

            cdsBemResultIDBEM.AsInteger            := cdsBemIDBEM.AsInteger;
            cdsBemResultIDIMOVEL.AsInteger         := cdsBemIDIMOVEL.AsInteger;
            cdsBemResultIDPESSOA.AsInteger         := cdsBemIDPESSOA.AsInteger;
            cdsBemResultDATAREAVALIACAO.AsDateTime := edtDataReavalia.Date;
            cdsBemResultIDAVALIADOR.AsInteger      := molFornecedor.iFornecedor;
            cdsBemResultIDREAVALIACAO.AsInteger    := cdsBemIDRETIFICREAV.AsInteger;
            cdsBemResultFLGRETIFICA.AsInteger      := 1;
            cdsBemResultDESBEM.AsString            := cdsBemDESBEM.AsString;
            cdsBemResultVLRREAVALIA.AsFloat        := cdsBemNOVOVLR_REAVALIA.AsCurrency;
            cdsBemResultVIDAUTIL.AsInteger         := cdsBemNOVAVIDAUTIL.AsInteger;
            cdsBemResultAJUSTEDEP.AsFloat          := qryValCalculadoVALOR.AsFloat;
            cdsBemResultNOVOSALDO.AsFloat          := CtrlBem.SaldoContabil(Sistema.IdEmpresa,
                                                                            cdsBem.FieldByName('IDBEM').AsInteger,
                                                                            edtDataReavalia.Date,
                                                                            ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                                            ModuloImobiliario.InvestImob.iIdPaisCAF);
            cdsBemResult.Post;

         end;
         cdsBem.Next;
      end;

      cdsBem.First;

      inherited;
   except
      MsgDlg('Erro ao efetuar os cálculos da retificação de reavaliação'+#13+
             CtrlMovReavaliacao.MessageInfo,'InvestImob',mtError,[mbOK],0);
      if dtmBaseDados.dbBaseDados.InTransaction then
         RollBackTransacao;
   end;
end;



procedure TfrmExecRetificaReaval.btnConfirmarClick(Sender: TObject);
var
   iIdReavalia : Integer;
begin

   try
      cdsBemResult.DisableControls;
      cdsBemResult.First;
      while not cdsBemResult.eof do
      begin

         LimpaParametros(qryInsReavalia);
         qryInsReavalia.ParamByName('PIDPESSOA').AsInteger         := cdsBemResultIDPESSOA.AsInteger;
         qryInsReavalia.ParamByName('PIDIMOVEL').AsInteger         := cdsBemResultIDIMOVEL.AsInteger;
         qryInsReavalia.ParamByName('PIDBEM').AsInteger            := cdsBemResultIDBEM.AsInteger;
         qryInsReavalia.ParamByName('PIDREAVALIACAO').AsInteger    := cdsBemResultIDREAVALIACAO.AsInteger;
         qryInsReavalia.ParamByName('PDATAREAVALIACAO').AsDateTime := cdsBemResultDATAREAVALIACAO.AsDateTime;
         qryInsReavalia.ParamByName('PVLRREAVALIA').AsFloat        := cdsBemResultVLRREAVALIA.AsFloat;
         qryInsReavalia.ParamByName('PVIDAUTIL').AsInteger         := cdsBemResultVIDAUTIL.AsInteger;
         qryInsReavalia.ParamByName('PIDAVALIADOR').AsInteger      := cdsBemResultIDAVALIADOR.AsInteger;
         qryInsReavalia.ParamByName('PFLGRETIFICA').AsInteger      := cdsBemResultFLGRETIFICA.AsInteger;
         qryInsReavalia.ExecSQL;

         cdsBemResult.Next;
      end;
      cdsBemResult.First;
      cdsBemResult.EnableControls;

      CtrlEventoImovel.OpenTransaction := False;
      CtrlEventoImovel.RegistraEvento(molImovelouMestre.iImovel,
                                      -1,
                                      -1,
                                      -1,
                                      Sistema.IdUsuario,
                                      'RV',
                                      'Retificação de Reavaliação',
                                      meObsEvento.Text,
                                      edtDataReavalia.Date);
      if dtmBaseDados.dbBaseDados.InTransaction then
         CommitTransacao;

      MsgDlg('Retificação efetuada com sucesso','InvestImob',mtInformation,[mbOK],0);

      molImovelouMestre.btnLimpaImovelClick(Sender);
      molFornecedor.btnLimpaFornClick(Sender);
      meObsEvento.Lines.Clear;
      AbreQueryImovel;
      IrParaPagina(0);
   except
      if dtmBaseDados.dbBaseDados.InTransaction then
         RollBackTransacao;
      MsgDlg('Erro ao gravar a retificação de reavaliação','InvestImob',mtError,[mbOK],0);
   end;

end;



procedure TfrmExecRetificaReaval.dbgBensCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   ABrush.Color := $00C0FFFF; // amarelo claro
   if (Field = cdsBemNOVOVLR_REAVALIA) or (Field = cdsBemNOVAVIDAUTIL) then ABrush.Color := clWindow;
end;



procedure TfrmExecRetificaReaval.dbgBensTopRowChanged(Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecRetificaReaval.dbgBemResultCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState;Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo claro
         end
         else
         begin
            ABrush.Color := clWindow;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecRetificaReaval.btnVoltarClick(Sender: TObject);
begin
   if dtmBaseDados.dbBaseDados.InTransaction then
      RollBackTransacao;
   inherited;
end;



procedure TfrmExecRetificaReaval.bbtnSairClick(Sender: TObject);
begin
   if dtmBaseDados.dbBaseDados.InTransaction then
      RollBackTransacao;
   inherited;
end;



end.
