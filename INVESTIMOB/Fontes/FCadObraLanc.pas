unit FCadObraLanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, Db, DBTables, Wwquery, CmEventosCadastro, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  Grids, Wwdbigrd, Wwdbgrid, TB97, ComCtrls, ExtCtrls, mImovelObra,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, wwdbedit, Wwdbspin,
  wwdblook, mFornecedor, DBCtrls, fcLabel;

type
  TfrmCadObraLanc = class(TfrmCadastroDetalhe)
    molImovelObra1: TmolImovelObra;
    Label1: TLabel;
    Label2: TLabel;
    DtaInicioObra: TCMDateTimePicker;
    molFornecedor1: TmolFornecedor;
    Label10: TLabel;
    DBcboFormaRecPag: TwwDBLookupCombo;
    lblContaBancaria: TLabel;
    dbCboContaBancaria: TwwDBLookupCombo;
    Label6: TLabel;
    edtNumDocumento: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    edtVlrTotal: TRealEdit;
    cboMes: TComboBox;
    Label14: TLabel;
    memObs: TMemo;
    Label13: TLabel;
    edtReferenciaAP: TEdit;
    Label4: TLabel;
    cmbObraEtapa: TwwDBLookupCombo;
    Label8: TLabel;
    DBcboCentroCusto: TwwDBLookupCombo;
    qryObraEtapa: TwwQuery;
    qryObraEtapaDESCOBRATIPOETAPA: TStringField;
    qryObraEtapaIDOBRATIPOETAPA: TFloatField;
    edtDataLanc: TCMDateTimePicker;
    qryIDCAFOBRA: TFloatField;
    qryDTALANCAMENTO: TDateTimeField;
    qryDTANOTA: TDateTimeField;
    qryNUMNOTA: TStringField;
    qryVALOFI: TFloatField;
    qryNOME: TStringField;
    qryObra: TwwQuery;
    dsObra: TwwDataSource;
    qryObraDESCCAFOBRA: TStringField;
    qryObraDTAINICIOOBRA: TDateTimeField;
    qryObraIDTIPOCUSTORECIMO: TFloatField;
    dbmemObra: TDBMemo;
    qryIDLANCIMOVEL: TFloatField;
    qryIDOBRALANC: TFloatField;
    qryIDDOCUMENTO: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryFLGINTEGRADO: TFloatField;
    lblEncerrado: TfcLabel;
    qryObraDTAENCERRAOBRA: TDateTimeField;
    qryObraUNIDNEGOC: TFloatField;
    qryObraCODSUBCONTA: TFloatField;
    qryObraIDGRUPO: TFloatField;
    qryFLGDESMEMBOBRA: TFloatField;
    procedure molImovelObra1btnBuscaImovelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure molImovelObra1btnLimpaImovelClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure DBcboFormaRecPagCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }

    iDocumento : Integer;
    bAbreQry   : Boolean;

    procedure Seleciona(const iIdObra:Integer);
    procedure AbreQueries;
    procedure FechaQueries;
    procedure AbreNovoRegistro;
    function  GravaLancamento : Boolean;
    procedure VerificaContaBancaria;

  public
    { Public declarations }
  end;

var
  frmCadObraLanc: TfrmCadObraLanc;

implementation

uses uMensErro, uSistema, uFuncoesImob, dLookImobiliario, dImobiliario, uDocumento,
     UDiasInUteis, uComunsImobiliario, dLancImovel, uDataBase, DCAF,
     uAtivoFixo, uModulo;

{$R *.DFM}

procedure TfrmCadObraLanc.molImovelObra1btnBuscaImovelClick(
  Sender: TObject);
begin
   inherited;
   // Abre o MontaSelect exibindo todas as obras (em aberto ou encerradas)
   molImovelObra1.btnBuscaImovelClick(Sender, 0);
   Seleciona(molImovelObra1.iObra);
end;

procedure TfrmCadObraLanc.Seleciona(const iIDObra:Integer);
begin
   // Abre tabela de obras
   LimpaParametros(qryObra);
   qryObra.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qryObra.ParamByName('PIDCAFOBRA').AsInteger := iIdObra;
   qryObra.Open;

   // Abre tabela de lançamentos
   LimpaParametros(qry);
   qry.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qry.ParamByName('PIDCAFOBRA').AsInteger := iIdObra;
   qry.Open;

   // Verifica Encerramento da Obra
   if qryObraDTAENCERRAOBRA.IsNull then begin
      lblEncerrado.Caption := '';
   end else begin
      lblEncerrado.Caption := 'Encerrada em ' + DateToStr(qryObraDTAENCERRAOBRA.AsDateTime);
   end;

   // Habilita Botoes
   if (iIdObra > 0) and (qryObraDTAENCERRAOBRA.IsNull) then begin
      if qry.RecordCount > 0 then
           sbtnApagar.Enabled := True
      else sbtnApagar.Enabled := False;
      sbtnInserir.Enabled := True;
      dbgrd.SetFocus;
   end else begin
      sbtnInserir.Enabled   := False;
      sbtnApagar.Enabled    := False;
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
   end;
end;


procedure TfrmCadObraLanc.AbreQueries;
var
   sFormaAnt      : string;
   sCCAnt         : string;
begin
   // Forma de Pagamento ---------------------------------------------------------------------------
   sFormaAnt := '';
   if DBcboFormaRecPag.LookupValue <> '' then sFormaAnt := DBcboFormaRecPag.LookupValue;
   with dtmLookImobiliario.qryLookFormaRecPag do begin
      LimpaParametros(dtmLookImobiliario.qryLookFormaRecPag);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString     := 'P';
      Open;
   end;
   if DBcboFormaRecPag.LookupValue = '' then DBcboFormaRecPag.LookupValue := sFormaAnt;

   // Centro de Custo ------------------------------------------------------------------------------
   sCCAnt := '';
   if DBcboCentroCusto.LookupValue <> '' then sCCAnt := DBcboCentroCusto.LookupValue;
   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      ParamByName('PIDEMPRESA').AsInteger := Sistema.idEmpresa;
      Open;
   end;
   if DBcboCentroCusto.LookupValue = '' then DBcboCentroCusto.LookupValue := sCCAnt;
   if DBcboCentroCusto.LookupValue = '' then begin
      if not(dtmImobiliario.qryParamImobCODCENTROCUSTO.isNULL) then begin
         DBcboCentroCusto.LookupValue := dtmImobiliario.qryParamImobCODCENTROCUSTO.AsString;
      end;
   end;

   // Abre Etapa da Obra
   qryObraEtapa.Open;
end;


procedure TfrmCadObraLanc.FechaQueries;
begin
   dtmLookImobiliario.qryLookFormaRecPag.Close;
   dtmLookImobiliario.qryLookCentroCusto.Close;
   qryObraEtapa.Close;
end;


procedure TfrmCadObraLanc.FormShow(Sender: TObject);
begin
   inherited;
   pnlGrd.BringToFront;
   dbgrd.SetFocus;
   sbtnInserir.Enabled := False;
   sbtnApagar.Enabled  := False;
   AbreQueries;
   Seleciona(-1);

   // define competência default
   cboMes.ItemIndex := DiasInUteis.ExtraiMes(Date())-1;
   DBspnAno.Value   := DiasInUteis.ExtraiAno(Date());
end;

procedure TfrmCadObraLanc.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   bAbreQry := False;
   pnlControles.BringToFront;
   sbtnInserir.Enabled := False;
   sbtnApagar.Enabled  := False;
   edtDataLanc.Date    := Date();
   molFornecedor1.btnBuscaForn.SetFocus;
end;

procedure TfrmCadObraLanc.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if bAbreQry then Seleciona(molImovelObra1.iObra);
   pnlGrd.BringToFront;
   dbgrd.SetFocus;
end;

procedure TfrmCadObraLanc.bbtnConfirmarClick(Sender: TObject);
begin
   // Valida Campos do Lançamento
   try
      if molFornecedor1.edtNomeFantasia.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Fornecedor / Favorecido!', molFornecedor1.btnBuscaForn);

      if edtNumDocumento.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Número do Documento!', edtNumDocumento);

      if cmbObraEtapa.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Etapa da Obra!', cmbObraEtapa);

      if edtDataVenc.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      if edtDataLanc.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Data do Lançamento!', edtDataLanc);

      if edtDataVenc.Date < edtDataLanc.Date then
         raise EValidacao.CreateVal('Data de vencimento não deve ser inferior a data de Lançamento!', edtDataVenc);

      if edtDataLanc.Date < dtaInicioObra.Date then
         raise EValidacao.CreateVal('Data de Lançamento não deve ser inferior a data de Início da Obra!', edtDataLanc);

      if edtVlrTotal.Value = 0 then
         raise EValidacao.CreateVal('É necessário indicar o valor do Lançamento!', edtVlrTotal);

      ParametrosSistema;

      // verifica se o vencimento escolhido é um dia inútil
      if dtmImobiliario.qryParamImobFLGDIAUTILAP.AsString = 'S' then begin
         if DayOfWeek(edtDataVenc.Date) in [1, 7] then
            raise EValidacao.CreateVal('A Data de Vencimento deve corresponder a um dia útil!', edtDataVenc);
      end;

      // verifica o preenchimento dos campos abrigatórios p/ APs
      if dtmImobiliario.qryParamImobFLGUSAAP.Asinteger = 1 then begin
         if (DBcboFormaRecPag.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar a Forma de Pagamento!', DBcboFormaRecPag);

         if ( dbCboContaBancaria.Enabled ) and ( dbCboContaBancaria.LookupValue = '' ) then
            raise EValidacao.CreateVal('É necessário indicar a conta bancária!', dbCboContaBancaria);

         if (length(trim(edtReferenciaAP.Text)) = 0) then
            raise EValidacao.CreateVal('É necessário indicar a Referência / Processo!', edtReferenciaAP);

         if (DBcboCentroCusto.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentroCusto);
      end;
   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
       	 Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   if GravaLancamento then begin
      MsgDlg('Lançamento Efetuado com Sucesso!','Informação',mtInformation,[mbOk],0);
      bAbreQry := True;
      AbreNovoRegistro;
   end else begin
      MsgDlg('Ocorreram ERROS ao Efetuar o Lançamento!','Aviso',mtWarning,[mbOk],0);
   end;

end;


procedure TfrmCadObraLanc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   FechaQueries;
end;

procedure TfrmCadObraLanc.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   AbreNovoRegistro;
end;

procedure TfrmCadObraLanc.AbreNovoRegistro;
begin
   // gerar apenas um IDDocumento para todos os lançamentos para agrupá-los
   // na contabilidade e no contas a pagar
   iDocumento           := Documento.GetCodigo(dtmImobiliario.qryAux);
   edtNumDocumento.Text := FormatFloat('#0', iDocumento);

   edtDataVenc.Clear;
   edtVlrTotal.Clear;
end;

procedure TfrmCadObraLanc.molImovelObra1btnLimpaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelObra1.btnLimpaImovelClick(Sender);
  Seleciona(-1)
end;

function TfrmCadObraLanc.GravaLancamento : Boolean;
var iIDObraLanc, iSubConta, iIDLancImovel : Integer;
    cAtivoFixo : TAtivoFixo;
begin
   Result := True;
   if qryObraCODSUBCONTA.AsInteger > 0 then
        iSubConta := qryObraCODSUBCONTA.AsInteger
   else iSubConta := -1;

   try
      try
         StartTransacao;
         // Grava Lançamento no CAF
         cAtivoFixo  := TAtivoFixo.Create;
         iIDObraLanc := 0;
         iIDObraLanc := cAtivoFixo.ExecutaLancObra(Sistema.IdModulo,
                                                   Sistema.IdEmpresa,
                                                   molImovelObra1.iObra,
                                                   StrToInt(cmbObraEtapa.LookupValue),
                                                   qryObraIDGRUPO.AsInteger,
                                                   iSubConta,
                                                   qryObraUNIDNEGOC.AsInteger,
                                                   edtDataLanc.Date,
                                                   edtVlrTotal.Value,
                                                   edtNumDocumento.Text,
                                                   '', -1,
                                                   molFornecedor1.iFornecedor,
                                                   '', True);
         if iIDObraLanc <= 0 then raise Exception.Create(cAtivoFixo.MensagemErro);

         // Grava Lançamentos Imovel
         if Result = True then begin
            iIdLancImovel := LeUltRegistro(nil,'LANCAMENTOSIMOVEL');
            LimpaParametros (dtmLancImovel.qryLancImovel);

            with dtmLancImovel.qryInsertLancImovel do begin
               ParamByName('PIDLANCIMOVEL').AsInteger      := iIdLancImovel;
               ParamByName('PIDPESSOA').AsInteger          := Sistema.IdEmpresa;
               ParamByName('PIDIMOVEL').AsInteger          := molImovelObra1.iImovel;
               ParamByName('PDATALANCAMENTO').AsDateTime   := edtDataLanc.DateTime;
               ParamByName('PDATAVENCIMENTO').AsDateTime   := edtDataVenc.DateTime;
               ParamByName('PMESCOMPETENCIA').AsInteger    := cboMes.ItemIndex + 1;
               ParamByName('PANOCOMPETENCIA').AsInteger    := word(trunc(DBspnAno.Value));
               ParamByName('PMESREFERENCIA').AsInteger     := DiasInUteis.ExtraiMes(edtDataLanc.DateTime);
               ParamByName('PANOREFERENCIA').AsInteger     := DiasInUteis.ExtraiAno(edtDataLanc.DateTime);
               ParamByName('PIDTIPOCUSTORECIMO').AsInteger := qryObraIDTIPOCUSTORECIMO.AsInteger;
               ParamByName('PRECPAG').AsString             := 'P';
               ParamByName('PMOEDAPAGAR').AsInteger        := Modulo.iMoedaCorrente;
               ParamByName('PIDFORCLI').AsInteger          := molFornecedor1.iFornecedor;
               ParamByName('PFLGINTEGRADO').AsInteger      := 0;
               ParamByName('PFLGORIGEMLANC').AsString      := 'O';
               ParamByName('PIDUSUARIOSISTEMA').AsInteger  := Sistema.IdUsuario;
               ParamByName('PIDDOCUMENTO').AsInteger       := iDocumento;
               ParamByName('PNODOCUMENTO').AsInteger       := StrToInt(edtNumDocumento.text);
               ParamByName('PIDMODULO').AsInteger          := Sistema.IdModulo;
               ParamByName('PVLRLANCPAGAR').AsFloat        := edtVlrTotal.Value;
               ParamByName('PVLRLANCOMPAGAR').AsFloat      := edtVlrTotal.Value;
               ParamByName('PCODFORMA').AsInteger          := StrToInt(DBcboFormaRecPag.LookupValue);
               ParamByName('PCODCENTROCUSTO').AsString     := DBcboCentroCusto.LookupValue;
               ParamByName('PREFERENCIAAP').AsString       := edtReferenciaAP.Text;
               if dbCboContaBancaria.Value <> '' then
                  ParamByName('PIDCBANCARIA').AsInteger    := StrToInt(dbCboContaBancaria.LookupValue);

               try
                 ExecSQL;
               except
                 Raise Exception.Create('Erro ao atualizar a tabela de LANCAMENTOS IMOVEL');
               end;
            end;

            // insere a Observação na tabela ObsLancImovel
            if length(trim(memObs.Text)) > 0 then FuncoesImob.InsertObsLanc(iDocumento, memObs.Text);

            // Atualiza o ID do Lancamento Imovel na tabela de Lançamento Obra
            with dtmCAF.qryUpdObraLanc do begin
               ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
               ParamByName('PIDOBRALANC').AsInteger   := iIDObraLanc;
               ParamByName('PIDLANCIMOVEL').AsInteger := iIDLancImovel;
               try
                 ExecSQL;
               except
                 Raise Exception.Create('Erro ao atualizar a tabela de o Nr. do Lançamento na tabela de OBRAS');
               end;
            end;

            CommitTransacao;
         end;
      except
         on E : Exception do begin
            RollBackTransacao;
            Result := False;
            MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
         end;
      end;
   finally
     FreeAndNil( cAtivoFixo );
   end;
end;

procedure TfrmCadObraLanc.sbtnApagarClick(Sender: TObject);
var iResult : Integer;
    sMsg : string;
    cAtivoFixo : TAtivoFixo;
begin
   inherited;
   if qryFLGDESMEMBOBRA.AsInteger <> 0 then begin
      MsgDlg('Lançamento referente a Entrada por Desmembramento não pode ser excluído.','Aviso',mtWarning,[mbOk],0);
      sbtnApagar.Enabled := True;      
      Exit;
   end;

   if MsgDlg('Confirma a Exclusão do Lançamento?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
      sbtnApagar.Enabled := True;
      Exit;
   end;

   try
      try
         cAtivoFixo := TAtivoFixo.Create;

         StartTransacao;
         // Exclui lançamento no CAF
         iResult := cAtivoFixo.EstornaLancObra(Sistema.IdModulo,
                                               Sistema.IdEmpresa,
                                               qryIDCAFOBRA.AsInteger,
                                               qryDTALANCAMENTO.AsDateTime,
                                               qryDTALANCAMENTO.AsDateTime,
                                               qryIDOBRALANC.AsInteger,True);
         if iResult = -1 then raise Exception.Create(cAtivoFixo.MensagemErro);

         // Exclui lançamento no Lançamento Imóvel
         iResult := FuncoesImob.ExcluiLancImovel(qryIDDOCUMENTO.AsInteger,
                                                 qryPLNCODIGO.AsInteger,
                                                 qryDTALANCAMENTO.AsDateTime,
                                                 qryFLGINTEGRADO.IsNull,
                                                 sMsg);
         if iResult = 1 then raise Exception.Create(sMsg);

         CommitTransacao;
         MsgDlg('Lançamento Excluído com Sucesso!','Informação',mtInformation,[mbOk],0);
      except
         on E : Exception do begin
            RollBackTransacao;
            MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
         end;
      end;
   finally
     FreeAndNil( cAtivoFixo );

     Seleciona(molImovelObra1.iObra);
     if qry.RecordCount > 0 then sbtnApagar.Enabled := True;
   end;
end;


procedure TfrmCadObraLanc.VerificaContaBancaria;
begin
   if (molFornecedor1.iFornecedor <> -1) and (DBcboFormaRecPag.LookupValue <> '') and (dtmLookImobiliario.qryLookFormaRecPagFLGDADOSBANCARIOS.AsString = 'S') then begin

      lblContaBancaria.Enabled := true;
      dbCboContaBancaria.Enabled := true;

      LimpaParametros(dtmLookImobiliario.qryLookContaBancaria);
      dtmLookImobiliario.qryLookContaBancaria.ParamByName('PIDPESSOA').AsInteger := molFornecedor1.iFornecedor;
      dtmLookImobiliario.qryLookContaBancaria.Open;
      if dtmLookImobiliario.qryLookContaBancaria.RecordCount > 1 then begin
         dtmLookImobiliario.qryLookContaBancaria.First;
         while not dtmLookImobiliario.qryLookContaBancaria.Eof do begin
            if dtmLookImobiliario.qryLookContaBancariaFLGCONTAPREF.AsInteger = 1 then begin
               dbCboContaBancaria.LookupValue := inttostr(dtmLookImobiliario.qryLookContaBancariaIDCBANCARIA.AsInteger);
               exit;
            end;
            dtmLookImobiliario.qryLookContaBancaria.Next;
         end;
      end else if dtmLookImobiliario.qryLookContaBancaria.RecordCount = 1 then begin
         dbCboContaBancaria.LookupValue := inttostr(dtmLookImobiliario.qryLookContaBancariaIDCBANCARIA.AsInteger);
      end;
   end else begin
      lblContaBancaria.Enabled := false;
      dbCboContaBancaria.Enabled := false;
      dtmLookImobiliario.qryLookContaBancaria.Close;
      dbCboContaBancaria.LookupValue := '';
   end;
end;

procedure TfrmCadObraLanc.DBcboFormaRecPagCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   VerificaContaBancaria;
end;

end.
