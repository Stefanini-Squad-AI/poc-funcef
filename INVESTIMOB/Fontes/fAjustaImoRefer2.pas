unit fAjustaImoRefer2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, ComCtrls, Gauges,
  Db, DBTables, Wwquery, CMDateTimePicker, wwdblook, wwdbdatetimepicker;

type
  TfrmAjustaImoRefer2 = class(TfrmSairAjuda)
    qryImovel: TwwQuery;
    qryReavaliacao: TwwQuery;
    qryBem: TwwQuery;
    qryImovelMestre: TwwQuery;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    PageControl1: TPageControl;
    TabSldCtb: TTabSheet;
    Label2: TLabel;
    Grupo: TLabel;
    edDataBase: TCMDateTimePicker;
    Label8: TLabel;
    cmbImoMestre: TwwDBLookupCombo;
    bbtnCancelar: TBitBtn;
    bbtnConfirmar: TBitBtn;
    qryAcrescimoValor: TwwQuery;
    cmbImovel: TwwDBLookupCombo;
    qryRemHistMovBem: TwwQuery;
    updBem: TUpdateSQL;
    updReavaliacao: TUpdateSQL;
    updAcrescimoValor: TUpdateSQL;
    qryHistMovBem: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbImoMestreChange(Sender: TObject);
  private
    { Private declarations }
    MessageInfo : String;
    function RegistraMovimentacao(iBem, iEmpresaProp, iModulo,
                                  iTipoMovimentacao : Integer;
                                  dDataMovimentacao : TDate;
                                  iReavalAcresc : LongInt;
                                  fValOfi, fValFis, fValGer : Extended;
                                  dDataUltDep : TDate;
                                  iGrupAnt, iConjAnt, iLocalAnt, iRespAnt : LongInt;
                                  fPlacaAnt : Extended;
                                  iPlanilha, iEstorno : LongInt;
                                  fTaxaDepAnt, fValorgLaudo : Extended;
                                  sObsReaval : String; iTipDepProRata : Integer;
                                  bMostraMsg: boolean) : Integer;
  public
    { Public declarations }
  end;

var
  frmAjustaImoRefer2: TfrmAjustaImoRefer2;

implementation

uses
   uSistema, dBaseDados, uDatabase, dAtivoFixo, uMensErro, uAtivoFixo;

{$R *.DFM}

procedure TfrmAjustaImoRefer2.FormCreate(Sender: TObject);
begin
   inherited;
   qryBem.Prepare;
   qryReavaliacao.Prepare;
   qryAcrescimoValor.Prepare;
   qryImovelMestre.Prepare;
   qryImovel.Prepare;
   qryRemHistMovBem.Prepare;
   //-------------------------------------------------------------------------------------
   edDataBase.Text := '';
   qryImovelMestre.Open;
   qryImovel.Open;
end;
//========================================================================================
procedure TfrmAjustaImoRefer2.cmbImoMestreChange(Sender: TObject);
begin
   inherited;
   qryImovel.Close;
   if not qryImovelMestre.FieldByName('IDIMOVEL').IsNull then
   begin
      qryImovel.ParamByName('IDIMOVELMESTRE').AsFloat := qryImovelMestre.FieldByName('IDIMOVEL').AsFloat;
      qryImovel.Open;
   end else
   begin
      qryImovel.ParamByName('IDIMOVELMESTRE').Clear;
      qryImovel.Open;
   end;
end;
//========================================================================================
procedure TfrmAjustaImoRefer2.bbtnConfirmarClick(Sender: TObject);
var
   fValDif  : Extended;
   iSeqHist : Integer;

begin
   inherited;
   prgBar.Progress   := 0;
   prgbar.MaxValue   := 1;
   lblStatus.Caption := 'Iniciando ...';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   try
      //----------------------------------------------------------------------------------
      // Posiciona os Bens do Imóvel Mestre que será ajustado
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('IDIMOMESTRE').AsInteger  := qryImovelMestre.FieldByName('IDIMOVEL').AsInteger;
      qryBem.ParamByName('DATASLD').AsDateTime     := edDataBase.Date;
      //----------------------------------------------------------------------------------
      if cmbImovel.Text <> '' then
      begin
         qryBem.SQL.Strings[8] := ' AND (I.IDIMOVEL = ' + qryImovel.FieldByName('IDIMOVEL').AsString + ') ';
      end else
      begin
         qryBem.SQL.Strings[8] := ' ';
      end;
      //----------------------------------------------------------------------------------
      qryBem.Open;
      if qryBem.IsEmpty then
         Raise Exception.Create('Este imóvel não foi baixado');
      prgBar.Progress := 0;
      prgbar.MaxValue := qryBem.RecordCount;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      StartTransacao;
      while not qryBem.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Processando Placa ' + trim(qryBem.FieldByName('PLACA').AsString) + '                      ';
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Processa a diferença na Aquisicao
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('VALORG').AsCurrency <> 0 then
         begin
            fValDif := 0 - qryBem.FieldByName('VALORG').AsCurrency;
            iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                             qryBem.FieldByName('IDPESSOA').AsInteger,
                                             Sistema.IdModulo,41,edDataBase.Date, -1,
                                             fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                             True);
            if iSeqHist <= 0 then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            qryBem.Edit;
            qryBem.FieldByName('VALORG').AsCurrency := qryBem.FieldByName('VALORG').AsCurrency + fValDif;
            qryBem.Post;
            qryBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('CMBEM').AsCurrency <> 0 then
         begin
            fValDif := 0 - qryBem.FieldByName('CMBEM').AsCurrency;
            iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                             qryBem.FieldByName('IDPESSOA').AsInteger,
                                             Sistema.IdModulo,42,edDataBase.Date, -1,
                                             fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                             True);
            if iSeqHist <= 0 then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            qryBem.Edit;
            qryBem.FieldByName('CMBEM').AsCurrency := qryBem.FieldByName('CMBEM').AsCurrency + fValDif;
            qryBem.Post;
            qryBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('DEPLANC').AsCurrency <> 0 then
         begin
            fValDif := 0 - qryBem.FieldByName('DEPLANC').AsCurrency;
            iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                             qryBem.FieldByName('IDPESSOA').AsInteger,
                                             Sistema.IdModulo,43,edDataBase.Date, -1,
                                             fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                             True);
            if iSeqHist <= 0 then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            qryBem.Edit;
            qryBem.FieldByName('DEPLANC').AsCurrency := qryBem.FieldByName('DEPLANC').AsCurrency + fValDif;
            qryBem.Post;
            qryBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('CMDEP').AsCurrency <> 0 then
         begin
            fValDif := 0 - qryBem.FieldByName('CMDEP').AsCurrency;
            iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                             qryBem.FieldByName('IDPESSOA').AsInteger,
                                             Sistema.IdModulo,44,edDataBase.Date, -1,
                                             fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                             True);
            if iSeqHist <= 0 then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            qryBem.Edit;
            qryBem.FieldByName('CMDEP').AsCurrency := qryBem.FieldByName('CMDEP').AsCurrency + fValDif;
            qryBem.Post;
            qryBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         // Processa a Diferença nas Reavaliações
         //-------------------------------------------------------------------------------
         qryReavaliacao.Close;
         qryReavaliacao.ParamByName('PIDBEM').AsInteger    := qryBem.FieldByName('IDBEM').AsInteger;
         qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := qryBem.FieldByName('IDPESSOA').AsInteger;
         qryReavaliacao.Open;
         while not qryReavaliacao.EOF do
         begin
            lblStatus.Caption := 'Processando Placa ' + trim(qryBem.FieldByName('PLACA').AsString) + ' - Reavaliações       ';
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            if qryReavaliacao.FieldByName('VALORG').AsCurrency <> 0 then
            begin
               fValDif := 0 - qryReavaliacao.FieldByName('VALORG').AsCurrency;
               iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                                qryBem.FieldByName('IDPESSOA').AsInteger,
                                                Sistema.IdModulo,45,edDataBase.Date, qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                                fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                                True);
               if iSeqHist <= 0 then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               qryReavaliacao.Edit;
               qryReavaliacao.FieldByName('VALORG').AsCurrency := qryReavaliacao.FieldByName('VALORG').AsCurrency + fValDif;
               qryReavaliacao.Post;
               qryReavaliacao.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if qryReavaliacao.FieldByName('CMBEM').AsCurrency <> 0 then
            begin
               fValDif := 0 - qryReavaliacao.FieldByName('CMBEM').AsCurrency;
               iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                                qryBem.FieldByName('IDPESSOA').AsInteger,
                                                Sistema.IdModulo,46,edDataBase.Date, qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                                fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                                True);
               if iSeqHist <= 0 then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               qryReavaliacao.Edit;
               qryReavaliacao.FieldByName('CMBEM').AsCurrency := qryReavaliacao.FieldByName('CMBEM').AsCurrency + fValDif;
               qryReavaliacao.Post;
               qryReavaliacao.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if qryReavaliacao.FieldByName('DEPLANC').AsCurrency <> 0 then
            begin
               fValDif := 0 - qryReavaliacao.FieldByName('DEPLANC').AsCurrency;
               iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                                qryBem.FieldByName('IDPESSOA').AsInteger,
                                                Sistema.IdModulo,47,edDataBase.Date, qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                                fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                                True);
               if iSeqHist <= 0 then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               qryReavaliacao.Edit;
               qryReavaliacao.FieldByName('DEPLANC').AsCurrency := qryReavaliacao.FieldByName('DEPLANC').AsCurrency + fValDif;
               qryReavaliacao.Post;
               qryReavaliacao.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if qryReavaliacao.FieldByName('CMDEP').AsCurrency <> 0 then
            begin
               fValDif := 0 - qryReavaliacao.FieldByName('CMDEP').AsCurrency;
               iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                                qryBem.FieldByName('IDPESSOA').AsInteger,
                                                Sistema.IdModulo,48,edDataBase.Date, qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                                fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                                True);
               if iSeqHist <= 0 then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               qryReavaliacao.Edit;
               qryReavaliacao.FieldByName('CMDEP').AsCurrency := qryReavaliacao.FieldByName('CMDEP').AsCurrency + fValDif;
               qryReavaliacao.Post;
               qryReavaliacao.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            qryReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // Processa a Diferença nos Acrescimos de Valor
         //-------------------------------------------------------------------------------
         qryAcrescimoValor.Close;
         qryAcrescimoValor.ParamByName('PIDBEM').AsInteger    := qryBem.FieldByName('IDBEM').AsInteger;
         qryAcrescimoValor.ParamByName('PIDPESSOA').AsInteger := qryBem.FieldByName('IDPESSOA').AsInteger;
         qryAcrescimoValor.Open;
         while not qryAcrescimoValor.EOF do
         begin
            lblStatus.Caption := 'Processando Placa ' + trim(qryBem.FieldByName('PLACA').AsString) + ' - Acréscimos de Valor';
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            if qryAcrescimoValor.FieldByName('VALORG').AsCurrency <> 0 then
            begin
               fValDif := 0 - qryAcrescimoValor.FieldByName('VALORG').AsCurrency;
               iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                                qryBem.FieldByName('IDPESSOA').AsInteger,
                                                Sistema.IdModulo,49,edDataBase.Date, qryAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger,
                                                fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                                True);
               if iSeqHist <= 0 then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               qryAcrescimoValor.Edit;
               qryAcrescimoValor.FieldByName('VALORG').AsCurrency := qryAcrescimoValor.FieldByName('VALORG').AsCurrency + fValDif;
               qryAcrescimoValor.Post;
               qryAcrescimoValor.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if qryAcrescimoValor.FieldByName('CMBEM').AsCurrency <> 0 then
            begin
               fValDif := 0 - qryAcrescimoValor.FieldByName('CMBEM').AsCurrency;
               iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                                qryBem.FieldByName('IDPESSOA').AsInteger,
                                                Sistema.IdModulo,50,edDataBase.Date, qryAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger,
                                                fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                                True);
               if iSeqHist <= 0 then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               qryAcrescimoValor.Edit;
               qryAcrescimoValor.FieldByName('CMBEM').AsCurrency := qryAcrescimoValor.FieldByName('CMBEM').AsCurrency + fValDif;
               qryAcrescimoValor.Post;
               qryAcrescimoValor.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if qryAcrescimoValor.FieldByName('DEPLANC').AsCurrency <> 0 then
            begin
               fValDif := 0 - qryAcrescimoValor.FieldByName('DEPLANC').AsCurrency;
               iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                                qryBem.FieldByName('IDPESSOA').AsInteger,
                                                Sistema.IdModulo,51,edDataBase.Date, qryAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger,
                                                fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                                True);
               if iSeqHist <= 0 then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               qryAcrescimoValor.Edit;
               qryAcrescimoValor.FieldByName('DEPLANC').AsCurrency := qryAcrescimoValor.FieldByName('DEPLANC').AsCurrency + fValDif;
               qryAcrescimoValor.Post;
               qryAcrescimoValor.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if qryAcrescimoValor.FieldByName('CMDEP').AsCurrency <> 0 then
            begin
               fValDif := 0 - qryAcrescimoValor.FieldByName('CMDEP').AsCurrency;
               iSeqHist := RegistraMovimentacao(qryBem.FieldByName('IDBEM').AsInteger,
                                                qryBem.FieldByName('IDPESSOA').AsInteger,
                                                Sistema.IdModulo,52,edDataBase.Date, qryAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger,
                                                fValDif, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                                True);
               if iSeqHist <= 0 then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               qryAcrescimoValor.Edit;
               qryAcrescimoValor.FieldByName('CMDEP').AsCurrency := qryAcrescimoValor.FieldByName('CMDEP').AsCurrency + fValDif;
               qryAcrescimoValor.Post;
               qryAcrescimoValor.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            qryAcrescimoValor.Next;
         end;
         //------------------------------------------------------------------------------- 
         qryBem.Next;
      end;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      StartTransacao;
      //----------------------------------------------------------------------------------
      prgBar.Progress := 0;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      qryBem.First;
      while not qryBem.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Atualizando Saldo da Placa ' + trim(qryBem.FieldByName('PLACA').AsString) + '                      ';
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                 qryBem.FieldByName('IDPESSOA').AsInteger,
                                                 qryBem.FieldByName('IDBEM').AsInteger,
                                                 edDataBase.Date,0,0,0,0,0,0,0,0,0,0,0,0,
                                                 qryBem.FieldByName('IDGRUPO').AsInteger,
                                                 qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                 qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 2) then
            Raise Exception.Create('AtualizaSaldoContabBem');
         //-------------------------------------------------------------------------------
         qryBem.Next;
      end;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      On E : Exception do
      begin
         RollBackTransacao;
         MsgDlg('Erro Grave - Excessão : ' + #13 + #13 + E.Message + #13 + #13 +
                'Processamento Abortado.', 'Erro', mtError, [mbOk], 0);
      end;
   end;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmAjustaImoRefer2.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   prgBar.Progress   := 0;
   prgbar.MaxValue   := 1;
   lblStatus.Caption := 'Iniciando ...';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Posiciona os Bens do Imóvel Mestre que será ajustado
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('IDIMOMESTRE').AsInteger  := qryImovelMestre.FieldByName('IDIMOVEL').AsInteger;
   qryBem.ParamByName('DATASLD').AsDateTime     := edDataBase.Date;
   //-------------------------------------------------------------------------------------
   if cmbImovel.Text <> '' then
   begin
      qryBem.SQL.Strings[8] := ' AND (I.IDIMOVEL = ' + qryImovel.FieldByName('IDIMOVEL').AsString + ') ';
   end else
   begin
      qryBem.SQL.Strings[8] := ' ';
   end;
   qryBem.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Progress := 0;
   prgbar.MaxValue := qryBem.RecordCount;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   try
      StartTransacao;
      //----------------------------------------------------------------------------------
      while not qryBem.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Removendo os Lançamentos da Placa ' + trim(qryBem.FieldByName('PLACA').AsString) + '                      ';
         Application.ProcessMessages;
         qryHistMovBem.Close;
         qryHistMovBem.ParamByName('IDBEM').AsFloat      := qryBem.FieldByName('IDBEM').AsFloat;
         qryHistMovBem.ParamByName('IDPESSOA').AsFloat   := qryBem.FieldByName('IDPESSOA').AsFloat;
         qryHistMovBem.ParamByName('DATAMOV').AsDateTime := edDataBase.Date;
         qryHistMovBem.Open;
         while not qryHistMovBem.EOF do
         begin
            if qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 41 then
            begin
               qryBem.Edit;
               qryBem.FieldByName('VALORG').AsCurrency := qryBem.FieldByName('VALORG').AsCurrency -
                                                          qryHistMovBem.FieldByName('VALOFI').AsFloat;
               qryBem.Post;
               qryBem.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 42 then
            begin
               qryBem.Edit;
               qryBem.FieldByName('CMBEM').AsCurrency := qryBem.FieldByName('CMBEM').AsCurrency -
                                                         qryHistMovBem.FieldByName('VALOFI').AsFloat;
               qryBem.Post;
               qryBem.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 43 then
            begin
               qryBem.Edit;
               qryBem.FieldByName('DEPLANC').AsCurrency := qryBem.FieldByName('DEPLANC').AsCurrency -
                                                           qryHistMovBem.FieldByName('VALOFI').AsFloat;
               qryBem.Post;
               qryBem.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 44 then
            begin
               qryBem.Edit;
               qryBem.FieldByName('CMDEP').AsCurrency := qryBem.FieldByName('CMDEP').AsCurrency -
                                                         qryHistMovBem.FieldByName('VALOFI').AsFloat;
               qryBem.Post;
               qryBem.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            // Processa a Diferença nas Reavaliações
            //----------------------------------------------------------------------------
            qryReavaliacao.Close;
            qryReavaliacao.ParamByName('PIDBEM').AsInteger    := qryBem.FieldByName('IDBEM').AsInteger;
            qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := qryBem.FieldByName('IDPESSOA').AsInteger;
            qryReavaliacao.Open;
            while not qryReavaliacao.EOF do
            begin
               if (qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 45) and
                  (qryHistMovBem.FieldByName('IDREAVALACRESC').AsInteger = qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) then
               begin
                  qryReavaliacao.Edit;
                  qryReavaliacao.FieldByName('VALORG').AsCurrency := qryReavaliacao.FieldByName('VALORG').AsCurrency -
                                                                     qryHistMovBem.FieldByName('VALOFI').AsFloat;
                  qryReavaliacao.Post;
                  qryReavaliacao.ApplyUpdates;
               end;
               //-------------------------------------------------------------------------
               if (qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 46) and
                  (qryHistMovBem.FieldByName('IDREAVALACRESC').AsInteger = qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) then
               begin
                  qryReavaliacao.Edit;
                  qryReavaliacao.FieldByName('CMBEM').AsCurrency := qryReavaliacao.FieldByName('CMBEM').AsCurrency -
                                                                    qryHistMovBem.FieldByName('VALOFI').AsFloat;
                  qryReavaliacao.Post;
                  qryReavaliacao.ApplyUpdates;
               end;
               //-------------------------------------------------------------------------
               if (qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 47) and
                  (qryHistMovBem.FieldByName('IDREAVALACRESC').AsInteger = qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) then
               begin
                  qryReavaliacao.Edit;
                  qryReavaliacao.FieldByName('DEPLANC').AsCurrency := qryReavaliacao.FieldByName('DEPLANC').AsCurrency -
                                                                      qryHistMovBem.FieldByName('VALOFI').AsFloat;
                  qryReavaliacao.Post;
                  qryReavaliacao.ApplyUpdates;
               end;
               //-------------------------------------------------------------------------
               if (qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 48) and
                  (qryHistMovBem.FieldByName('IDREAVALACRESC').AsInteger = qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) then
               begin
                  qryReavaliacao.Edit;
                  qryReavaliacao.FieldByName('CMDEP').AsCurrency := qryReavaliacao.FieldByName('CMDEP').AsCurrency -
                                                                    qryHistMovBem.FieldByName('VALOFI').AsFloat;
                  qryReavaliacao.Post;
                  qryReavaliacao.ApplyUpdates;
               end;
               //-------------------------------------------------------------------------
               qryReavaliacao.Next
            end;
            //----------------------------------------------------------------------------
            // Processa a Diferença nos Acréscimos
            //----------------------------------------------------------------------------
            qryAcrescimoValor.Close;
            qryAcrescimoValor.ParamByName('PIDBEM').AsInteger    := qryBem.FieldByName('IDBEM').AsInteger;
            qryAcrescimoValor.ParamByName('PIDPESSOA').AsInteger := qryBem.FieldByName('IDPESSOA').AsInteger;
            qryAcrescimoValor.Open;
            while not qryAcrescimoValor.EOF do
            begin
               if (qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 49) and
                  (qryHistMovBem.FieldByName('IDREAVALACRESC').AsInteger = qryAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger) then
               begin
                  qryAcrescimoValor.Edit;
                  qryAcrescimoValor.FieldByName('VALORG').AsCurrency := qryAcrescimoValor.FieldByName('VALORG').AsCurrency -
                                                                        qryHistMovBem.FieldByName('VALOFI').AsFloat;
                  qryAcrescimoValor.Post;
                  qryAcrescimoValor.ApplyUpdates;
               end;
               //-------------------------------------------------------------------------
               if (qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 50) and
                  (qryHistMovBem.FieldByName('IDREAVALACRESC').AsInteger = qryAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger) then
               begin
                  qryAcrescimoValor.Edit;
                  qryAcrescimoValor.FieldByName('CMBEM').AsCurrency := qryAcrescimoValor.FieldByName('CMBEM').AsCurrency -
                                                                       qryHistMovBem.FieldByName('VALOFI').AsFloat;
                  qryAcrescimoValor.Post;
                  qryAcrescimoValor.ApplyUpdates;
               end;
               //-------------------------------------------------------------------------
               if (qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 51) and
                  (qryHistMovBem.FieldByName('IDREAVALACRESC').AsInteger = qryAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger) then
               begin
                  qryAcrescimoValor.Edit;
                  qryAcrescimoValor.FieldByName('DEPLANC').AsCurrency := qryAcrescimoValor.FieldByName('DEPLANC').AsCurrency -
                                                                         qryHistMovBem.FieldByName('VALOFI').AsFloat;
                  qryAcrescimoValor.Post;
                  qryAcrescimoValor.ApplyUpdates;
               end;
               //-------------------------------------------------------------------------
               if (qryHistMovBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 52) and
                  (qryHistMovBem.FieldByName('IDREAVALACRESC').AsInteger = qryAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger) then
               begin
                  qryAcrescimoValor.Edit;
                  qryAcrescimoValor.FieldByName('CMDEP').AsCurrency := qryAcrescimoValor.FieldByName('CMDEP').AsCurrency -
                                                                       qryHistMovBem.FieldByName('VALOFI').AsFloat;
                  qryAcrescimoValor.Post;
                  qryAcrescimoValor.ApplyUpdates;
               end;
               //-------------------------------------------------------------------------
               qryAcrescimoValor.Next
            end;
            //----------------------------------------------------------------------------
            if qryHistMovBem.FieldByName('FLGNCAF').AsInteger = 0 then
            begin
               //-------------------------------------------------------------------------
               // Remove os lançamentos da modelagem antiga
               //-------------------------------------------------------------------------
               dtmAtivoFixo.qryLegRemValMov.ParamByName('PIDMOV').AsInteger    := qryHistMovBem.FieldByName('IDMOVIMENTACAO').AsInteger;
               dtmAtivoFixo.qryLegRemValMov.ExecSQL;
               dtmAtivoFixo.qryLegRemDepBem.ParamByName('PIDMOV').AsInteger    := qryHistMovBem.FieldByName('IDMOVIMENTACAO').AsInteger;
               dtmAtivoFixo.qryLegRemDepBem.ExecSQL;
               dtmAtivoFixo.qryLegRemDepReav.ParamByName('PIDMOV').AsInteger   := qryHistMovBem.FieldByName('IDMOVIMENTACAO').AsInteger;
               dtmAtivoFixo.qryLegRemDepReav.ExecSQL;
               dtmAtivoFixo.qryLegRemDepAcresc.ParamByName('PIDMOV').AsInteger := qryHistMovBem.FieldByName('IDMOVIMENTACAO').AsInteger;
               dtmAtivoFixo.qryLegRemDepAcresc.ExecSQL;
            end;
            //----------------------------------------------------------------------------
            qryHistMovBem.Next;
         end;
         //-------------------------------------------------------------------------------
         qryRemHistMovBem.Close;
         qryRemHistMovBem.ParamByName('IDBEM').AsFloat      := qryBem.FieldByName('IDBEM').AsFloat;
         qryRemHistMovBem.ParamByName('IDPESSOA').AsFloat   := qryBem.FieldByName('IDPESSOA').AsFloat;
         qryRemHistMovBem.ParamByName('DATAMOV').AsDateTime := edDataBase.Date;
         qryRemHistMovBem.ExecSQL;
         if qryRemHistMovBem.RowsAffected <= 0 then
            Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryBem.Next;
      end;
      CommitTransacao;
      StartTransacao;
      //----------------------------------------------------------------------------------
      prgBar.Progress := 0;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      qryBem.First;
      while not qryBem.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Atualizando Saldo da Placa ' + trim(qryBem.FieldByName('PLACA').AsString) + '                      ';
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                 qryBem.FieldByName('IDPESSOA').AsInteger,
                                                 qryBem.FieldByName('IDBEM').AsInteger,
                                                 edDataBase.Date,0,0,0,0,0,0,0,0,0,0,0,0,
                                                 qryBem.FieldByName('IDGRUPO').AsInteger,
                                                 qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                 qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 2) then
            Raise Exception.Create('AtualizaSaldoContabBem');
         //-------------------------------------------------------------------------------
         qryBem.Next;
      end;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      On E : Exception do
      begin
         RollBackTransacao;
         MsgDlg('Erro Grave - Excessão : ' + #13 + #13 + E.Message + #13 + #13 +
                'Processamento Abortado.', 'Erro', mtError, [mbOk], 0);
      end;
   end;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmAjustaImoRefer2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryBem.Close;
   qryReavaliacao.Close;
   qryAcrescimoValor.Close;
   qryImovelMestre.Close;
   qryImovel.Close;
   qryHistMovBem.Close;
   qryBem.Unprepare;
   qryReavaliacao.Unprepare;
   qryAcrescimoValor.Unprepare;
   qryImovelMestre.Unprepare;
   qryImovel.Unprepare;
   qryHistMovBem.UnPrepare;
   qryRemHistMovBem.UnPrepare;
end;
//========================================================================================
function TfrmAjustaImoRefer2.RegistraMovimentacao(iBem, iEmpresaProp, iModulo,
                                                  iTipoMovimentacao : Integer;
                                                  dDataMovimentacao : TDate;
                                                  iReavalAcresc : LongInt;
                                                  fValOfi, fValFis, fValGer : Extended;
                                                  dDataUltDep : TDate;
                                                  iGrupAnt, iConjAnt, iLocalAnt, iRespAnt : LongInt;
                                                  fPlacaAnt : Extended;
                                                  iPlanilha, iEstorno : LongInt;
                                                  fTaxaDepAnt, fValorgLaudo : Extended;
                                                  sObsReaval : String; iTipDepProRata : Integer;
                                                  bMostraMsg: boolean) : Integer;
var
   iMovimentacao           : LongInt;
   qryRegistraMovimentacao : TwwQuery;

begin
   try
      if not dtmAtivoFixo.qryRegistraMovimentacao.Prepared then
         dtmAtivoFixo.qryRegistraMovimentacao.Prepare;
      //----------------------------------------------------------------------------------
      iMovimentacao           := LeUltRegistro(nil, 'HISTORICOMOVIMENTACAO');
      qryRegistraMovimentacao := TwwQuery(dtmAtivoFixo.qryRegistraMovimentacao);
      //----------------------------------------------------------------------------------
      with qryRegistraMovimentacao do
      begin
         Close;
         ParamByName('MOVIMENTACAO').asInteger      := iMovimentacao;
         ParamByName('BEM').asInteger               := iBem;
         ParamByName('EMPRESAPROP').asInteger       := iEmpresaProp;
         ParamByName('MODULO').asInteger            := iModulo;
         ParamByName('TIPOMOVIMENTACAO').asInteger  := iTipoMovimentacao;
         ParamByName('DATAMOVIMENTACAO').asDateTime := dDataMovimentacao;
         //-------------------------------------------------------------------------------
         // Códigos :
         // 0 - [DataMovimentacao - 1] , 1 - [DataMovimentacao] , 2 - [Fechamento]
         //-------------------------------------------------------------------------------
         ParamByName('TIPDEPPRORATA').asInteger     := iTipDepProRata;
         //-------------------------------------------------------------------------------
         if iReavalAcresc = -1 then
            ParamByName('IDREAVALACRESC').Clear
         else
            ParamByName('IDREAVALACRESC').AsInteger := iReavalAcresc;
         //-------------------------------------------------------------------------------
         if abs(fValOfi) >= 0.01 then
         begin
            ParamByName('VALOFI').AsCurrency := strtofloat(FormatFloat('#0.00',((fValOfi * 100) / 100)));
            ParamByName('VALGER').AsCurrency := strtofloat(FormatFloat('#0.00',((fValGer * 100) / 100)));
            ParamByName('VALFIS').AsCurrency := strtofloat(FormatFloat('#0.00',((fValFis * 100) / 100)));
         end else
         begin
            ParamByName('VALOFI').AsFloat := fValOfi;
            ParamByName('VALGER').AsFloat := fValGer;
            ParamByName('VALFIS').AsFloat := fValFis;
         end;
         //-------------------------------------------------------------------------------
         if dDataUltDep = -1 then
            ParamByName('DATAULTDEP').Clear
         else
            ParamByName('DATAULTDEP').AsDateTime := dDataUltDep;
         //-------------------------------------------------------------------------------
         if iGrupAnt = -1 then
            ParamByName('IDGRUPANT').Clear
         else
            ParamByName('IDGRUPANT').AsInteger := iGrupAnt;
         //-------------------------------------------------------------------------------
         if iConjAnt = -1 then
            ParamByName('IDCONJANT').Clear
         else
            ParamByName('IDCONJANT').AsInteger := iConjAnt;
         //-------------------------------------------------------------------------------
         if iLocalAnt = -1 then
            ParamByName('IDLOCALANT').Clear
         else
            ParamByName('IDLOCALANT').AsInteger := iLocalAnt;
         //-------------------------------------------------------------------------------
         if iRespAnt = -1 then
            ParamByName('IDRESPANT').Clear
         else
            ParamByName('IDRESPANT').AsInteger := iRespAnt;
         //-------------------------------------------------------------------------------
         if fPlacaAnt = -1 then
            ParamByName('PLACAANT').Clear
         else
            ParamByName('PLACAANT').AsFloat := fPlacaAnt;
         //-------------------------------------------------------------------------------
         if fTaxaDepAnt = -1 then
            ParamByName('TAXADEPANT').Clear
         else
            ParamByName('TAXADEPANT').AsFloat := fTaxaDepAnt;
         //-------------------------------------------------------------------------------
         if fValorgLaudo = -1 then
            ParamByName('VALORGLAUDO').Clear
         else
            ParamByName('VALORGLAUDO').AsFloat := fValorgLaudo;
         //-------------------------------------------------------------------------------
         ParamByName('OBSREAVAL').AsString := sObsReaval;
         //-------------------------------------------------------------------------------
         if iPlanilha = -1 then
            ParamByName('PLANILHA').Clear
         else
            ParamByName('PLANILHA').asInteger := iPlanilha;
         //-------------------------------------------------------------------------------
         // Registra para o trigger da tabela que é o NOVO CAF que está sendo executado
         //-------------------------------------------------------------------------------
         ParamByName('FLGNCAF').asInteger := 1;
         //-------------------------------------------------------------------------------
         ExecSQL;
         if RowsAffected = 0 then
            Raise Exception.Create('RegistraMovimentacao : Erro na gravação');
      end;
      Result := iMovimentacao;
   except
      On E : Exception do
      begin
         Result := -1;
         MessageInfo := E.Message;
      end;
   end;
end;


end.
