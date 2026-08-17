{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. Sol..........: 172902/8222
N. Kintana......: 1577546
Data............: 04/04/2012
Responsável.....: Wylliam Leite da Silva
Descrição.......: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
N. Sol..........: 143302
N. Kintana......: 927548
Data............: 03/09/2010
Responsável.....: Renan Cristiano
Descrição.......: Correção na rotina de exclusão de Lançamentos em Obras.
  Ao tentar excluir um lançamento depois de feito a integração dele, o sistema
  apresentava erro "Integrity Constraint CM.R_10617" devido o documento ainda
  existir na tabela (CCBAIXASXDOCUM).
--------------------------------------------------------------------------------}
unit FCadObraLancDespesa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, Db, DBTables, Wwquery, CmEventosCadastro, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  Grids, Wwdbigrd, Wwdbgrid, TB97, ComCtrls, ExtCtrls, mImovelObra,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, wwdbedit, Wwdbspin,
  wwdblook, mFornecedor, DBCtrls, fcLabel, MontaSelect, mSubConta, uCMTypes,
  {uCtrlCafObra,} uCtrlImobObra,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab;

type
  TfrmCadObraLancDespesa = class(TfrmCadastroDetalhe)
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
    qryCODDOCUMENTO: TFloatField;
    Label7: TLabel;
    dbCboGrupoContabil: TwwDBLookupCombo;
    qryGrupoContabil: TwwQuery;
    qryGrupoContabilCLASSE: TStringField;
    qryGrupoContabilNOME: TStringField;
    qryGrupoContabilIDGRUPO: TFloatField;
    molSubConta1: TmolSubConta;
    qryObraNOMESUBCONTA: TStringField;
    qryCLASSE: TStringField;
    qryDESC_GRUPO: TStringField;
    Label3: TLabel;
    edtNumAP: TEdit;
    qryDATALANCAMENTO: TDateTimeField;
    qryMESCOMPETENCIA: TFloatField;
    qryANOCOMPETENCIA: TFloatField;
    qryIDFORCLI: TFloatField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryRAZAOSOCIAL: TStringField;
    qryCODFORMA: TFloatField;
    qryIDOBRATIPOETAPA: TFloatField;
    qryIDCBANCARIA: TFloatField;
    qryIDGRUPO: TFloatField;
    qryREFERENCIAAP: TStringField;
    qryCODCENTROCUSTO: TStringField;
    qryNUMAPALT: TFloatField;
    qryOBS: TMemoField;
    qryCODSUBCONTA: TFloatField;
    qryNOMESUBCONTA: TStringField;
    qryObraCODTIPIMOVEL: TStringField;
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
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure molFornecedor1btnBuscaFornClick(Sender: TObject);
  private
    { Private declarations }

    iDocumento : Integer;
    bAbreQry   : Boolean;

    //CtrlCafObra : TCtrlCafObra;
    CtrlCafObra : TCtrlImobObra;
    CtrlContab  : TCtrlContab;// Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

    procedure Seleciona(const iIdObra:Integer);
    procedure AbreQueries;
    procedure FechaQueries;
    procedure AbreNovoRegistro;
    procedure AbreAlteraRegistro;
    function  BuscaNumAp(const iDocumento: Integer): Integer;
    function  DocumentoPago(const iDocumento: Integer): Boolean;
    function  GravaLancamento(const bTransacao:Boolean = True) : Boolean;
    function  ExcluiLancamento(const bTransacao:Boolean = True): Boolean;
    procedure VerificaContaBancaria;

  public
    { Public declarations }
  end;

var
  frmCadObraLancDespesa: TfrmCadObraLancDespesa;

implementation

uses uMensErro, uSistema, uFuncoesImob, dLookImobiliario, dImobiliario, uDocumento,
     UDiasInUteis, uComunsImobiliario, uVerificaPreenchimento, dLancImovel, uDataBase, DCAF,
     uModuloInvestImob, uModuloImobiliario, dBaseDados;

{$R *.DFM}


procedure TfrmCadObraLancDespesa.FormCreate(Sender: TObject);
begin
   inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   //CtrlCafObra := TCtrlCafObra.Create;
   CtrlCafObra := TCtrlImobObra.Create;
   CtrlCafObra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          ComunsImobiliario.MensErroMT);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlCafObra);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
end;

procedure TfrmCadObraLancDespesa.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlCafObra );
  FreeAndNil(CtrlContab);  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  inherited;
end;


procedure TfrmCadObraLancDespesa.molImovelObra1btnBuscaImovelClick(
  Sender: TObject);
begin
   inherited;
   // Abre o MontaSelect exibindo todas as obras (em aberto ou encerradas)
   molImovelObra1.btnBuscaImovelClick(Sender, 0);
   Seleciona(molImovelObra1.iObra);
end;

procedure TfrmCadObraLancDespesa.Seleciona(const iIDObra:Integer);
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

   // Carrega valor Default para Grupo Contábil
   LimpaParametros(qryGrupoContabil);
   qryGrupoContabil.ParamByName('CODTIPIMOVEL').AsString := qryObraCODTIPIMOVEL.AsString;
   qryGrupoContabil.Open;
   dbCboGrupoContabil.LookupValue := qryObraIDGRUPO.AsString;

   // Carrega valor default para SubConta
   if qryObraCODSUBCONTA.AsInteger > 0 then begin
      molSubConta1.iSubConta := qryObraCODSUBCONTA.AsInteger;
      molSubConta1.sSubConta := qryObraNOMESUBCONTA.AsString;
      molSubConta1.edtSubConta.Text := molSubConta1.sSubConta;
   end else begin
      molSubConta1.btnLimpaSubContaClick( Self );
   end;

   // Verifica Encerramento da Obra
   if qryObraDTAENCERRAOBRA.IsNull then begin
      lblEncerrado.Caption := '';
   end else begin
      lblEncerrado.Caption := 'Encerrada em ' + DateToStr(qryObraDTAENCERRAOBRA.AsDateTime);
   end;

   // Habilita Botoes
   if (iIdObra > 0) and (qryObraDTAENCERRAOBRA.IsNull) then begin
      if qry.IsEmpty then begin
         sbtnApagar.Enabled  := False;
         sbtnAlterar.Enabled := False;
      end else begin
         sbtnApagar.Enabled  := True;
         sbtnAlterar.Enabled := True;
      end;
      sbtnInserir.Enabled := True;
      dbgrd.SetFocus;
   end else begin
      sbtnInserir.Enabled   := False;
      sbtnApagar.Enabled    := False;
      sbtnAlterar.Enabled   := False;      
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
   end;
end;


procedure TfrmCadObraLancDespesa.AbreQueries;
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
      if ModuloImobiliario.InvestImob.sCodCentroCusto <> '' then begin
         DBcboCentroCusto.LookupValue := ModuloImobiliario.InvestImob.sCodCentroCusto;
      end;
   end;

   // Abre Etapa da Obra
   qryObraEtapa.Open;
end;


procedure TfrmCadObraLancDespesa.FechaQueries;
begin
   dtmLookImobiliario.qryLookFormaRecPag.Close;
   dtmLookImobiliario.qryLookCentroCusto.Close;
   qryObraEtapa.Close;
end;


procedure TfrmCadObraLancDespesa.FormShow(Sender: TObject);
begin
   inherited;
   pnlGrd.BringToFront;
   dbgrd.SetFocus;
   sbtnInserir.Enabled := False;
   sbtnApagar.Enabled  := False;
   sbtnAlterar.Enabled := False;   
   AbreQueries;
   Seleciona(-1);

   // define competência default
   cboMes.ItemIndex := DiasInUteis.ExtraiMes(Date())-1;
   DBspnAno.Value   := DiasInUteis.ExtraiAno(Date());
end;

procedure TfrmCadObraLancDespesa.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   bAbreQry := False;
   pnlControles.BringToFront;
   sbtnInserir.Enabled := False;
   sbtnApagar.Enabled  := False;
   sbtnAlterar.Enabled := False;
   edtDataLanc.Date    := Date();
   molFornecedor1.btnBuscaForn.SetFocus;
end;

procedure TfrmCadObraLancDespesa.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   Panel1.Enabled := True;   
   if bAbreQry then Seleciona(molImovelObra1.iObra);
   pnlGrd.BringToFront;
   dbgrd.SetFocus;
end;

procedure TfrmCadObraLancDespesa.bbtnConfirmarClick(Sender: TObject);
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

       // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataVenc.Text) then
         begin
            exit;
         end;
       // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

      if edtDataLanc.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Data do Lançamento!', edtDataLanc);

       // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataLanc.Text) then
         begin
            exit;
         end;
       // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

      if edtDataVenc.Date < edtDataLanc.Date then
         raise EValidacao.CreateVal('Data de vencimento não deve ser inferior a data de Lançamento!', edtDataVenc);

      if edtDataLanc.Date < dtaInicioObra.Date then
         raise EValidacao.CreateVal('Data de Lançamento não deve ser inferior a data de Início da Obra!', edtDataLanc);

      if edtVlrTotal.Value = 0 then
         raise EValidacao.CreateVal('É necessário indicar o valor do Lançamento!', edtVlrTotal);

      if (dbCboGrupoContabil.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Grupo Contábil para o Lançamento!', dbCboGrupoContabil);

      // verifica se o vencimento escolhido é um dia inútil
      if ModuloImobiliario.Adminimob.bFlgDiaUtilAP then begin
         if DayOfWeek(edtDataVenc.Date) in [1, 7] then
            raise EValidacao.CreateVal('A Data de Vencimento deve corresponder a um dia útil!', edtDataVenc);
      end;

      // Verifica a exixtência de Desmembramentos ou reavaliações posteriores ao lançamento
      with dtmCAF do begin
         LimpaParametros(dtmCAF.qryLookObraLanc);
         qryLookObraLanc.ParamByName('PCAFOBRA').AsInteger   := molImovelObra1.iObra;
         qryLookObraLanc.ParamByName('PDTLIMITE').AsDateTime := edtDataLanc.Date;
         qryLookObraLanc.Open;
         if not qryLookObraLanc.IsEmpty then
            raise EValidacao.CreateVal('Existem desmembramentos / reavaliações posterior ao lançamento!', edtDataLanc);
      end;

      // verifica o preenchimento dos campos abrigatórios p/ APs
      if ModuloImobiliario.Adminimob.bFlgUsaAP then begin
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

   // Insere Registro
   if CmeCadastro.Operacao = opInserir then begin
      if GravaLancamento then begin
         MsgDlg('Lançamento Efetuado com Sucesso!','Informação',mtInformation,[mbOk],0);
         bAbreQry := True;
         AbreNovoRegistro;
      end else begin
         MsgDlg('Ocorreram ERROS ao Efetuar o Lançamento!','Aviso',mtWarning,[mbOk],0);
      end;
   end;

   // Altera Registro
   if CmeCadastro.Operacao = opAlterar then begin
      try
         StartTransacao;

         // Exclui o registro anterior
         if not ExcluiLancamento( False ) then
            raise Exception.create('Erro ao excluir o registro anterior');

         // Grava o novo registro
         if not GravaLancamento( False ) then
            raise Exception.create('Erro ao Alterar o Lançamento');

         CommitTransacao;

         MsgDlg('Lançamento Alterado com Sucesso!','Informação',mtInformation,[mbOk],0);
         bAbreQry := True;
         AbreNovoRegistro;
      except
         on E : Exception do begin
            RollBackTransacao;
            MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
         end;
      end;
   end;
end;


procedure TfrmCadObraLancDespesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   FechaQueries;
end;

procedure TfrmCadObraLancDespesa.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   AbreNovoRegistro;
end;

procedure TfrmCadObraLancDespesa.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   AbreAlteraRegistro;
end;

procedure TfrmCadObraLancDespesa.AbreNovoRegistro;
begin
   // gerar apenas um IDDocumento para todos os lançamentos para agrupá-los
   // na contabilidade e no contas a pagar
   iDocumento           := Documento.GetCodigo(dtmImobiliario.qryAux);
   edtNumDocumento.Text := FormatFloat('#0', iDocumento);

   Panel1.Enabled := False;
   edtDataVenc.Clear;
   edtVlrTotal.Clear;
end;

procedure TfrmCadObraLancDespesa.AbreAlteraRegistro;
var iNumAp : Integer;
begin
   // Carrega as informações existentes para alteração
   iDocumento := qryIDDOCUMENTO.AsInteger;
   edtNumDocumento.Text := FormatFloat('#0', iDocumento);

   molFornecedor1.iFornecedor := qryIDFORCLI.AsInteger;
   molFornecedor1.edtNomeFantasia.Text := qryNOME.AsString;
   molFornecedor1.edtRazaoSocial.Text  := qryRAZAOSOCIAL.AsString;

   if qryCODSUBCONTA.AsInteger > 0 then begin
      molSubConta1.iSubConta := qryCODSUBCONTA.AsInteger;
      molSubConta1.sSubConta := qryNOMESUBCONTA.AsString;
      molSubConta1.edtSubConta.Text := molSubConta1.sSubConta;
   end else begin
      molSubConta1.btnLimpaSubContaClick( Self );
   end;

   DBcboFormaRecPag.LookupValue   := qryCODFORMA.AsString;
   cmbObraEtapa.LookupValue       := qryIDOBRATIPOETAPA.AsString;
   dbCboContaBancaria.LookupValue := qryIDCBANCARIA.AsString;
   dbCboGrupoContabil.LookupValue := qryIDGRUPO.AsString;
   edtReferenciaAP.Text           := qryREFERENCIAAP.AsString;
   DBcboCentroCusto.LookupValue   := qryCODCENTROCUSTO.AsString;
   memObs.Text                    := qryOBS.AsString;

   cboMes.ItemIndex  := qryMESCOMPETENCIA.AsInteger -1;
   DBspnAno.Value    := qryANOCOMPETENCIA.AsInteger;
   edtDataVenc.Date  := qryDATAVENCIMENTO.AsDateTime;
   edtDataLanc.Date  := qryDATALANCAMENTO.AsDateTime;
   edtVlrTotal.Value := qryVALOFI.AsFloat;

   // Verifica se o lançamento já foi integrado e guarda o nr. da AP
   if qryFLGINTEGRADO.IsNull then begin
      // Guarda o Nr. da AP já impressa
      iNumAp := BuscaNumAp(qryCODDOCUMENTO.AsInteger);
      if iNumAP > 0 then
           edtNumAP.Text := FormatFloat('#0', iNumAp )
      else edtNumAp.Clear;
   end else begin
      if qryNUMAPALT.IsNull then
           edtNumAP.Clear
      else edtNumAP.Text := FormatFloat('#0',qryNUMAPALT.AsInteger);
   end;

   // Confirma a alteração de um documento já integrado
   if qryFLGINTEGRADO.IsNull then begin
      MsgDlg('A alteração de um documento já integrado implicará na EXCLUSÃO ' + #13#10 +
             'das integrações já realizadas, sendo necessário que o documento' + #13#10 +
             'seja integrado novamente.' , 'Atenção', mtWarning, [mbOk],0);
   end;
end;


procedure TfrmCadObraLancDespesa.molImovelObra1btnLimpaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelObra1.btnLimpaImovelClick(Sender);
  Seleciona(-1)
end;

function TfrmCadObraLancDespesa.GravaLancamento(const bTransacao:Boolean) : Boolean;
var iIDObraLanc : Extended;
    iIDLancImovel : Integer;
begin
   Result := True;
   try
      if bTransacao then StartTransacao;
      // Grava Lançamento no CAF
      iIDObraLanc := 0;
      CtrlCafObra.OpenTransaction := False;
      iIdObraLanc := CtrlCafObra.ExecutaLancObra(Sistema.IdModulo,
                                                 Sistema.IdEmpresa,
                                                 Sistema.IdUsuario,
                                                 molImovelObra1.iObra,
                                                 StrToInt(cmbObraEtapa.LookupValue),
                                                 StrToInt(dbCboGrupoContabil.LookupValue),
                                                 molSubConta1.iSubConta,
                                                 qryObraUNIDNEGOC.AsInteger,
                                                 edtDataLanc.Date,
                                                 edtVlrTotal.Value,
                                                 '',
                                                 edtNumDocumento.Text, '', -1,
                                                 molFornecedor1.iFornecedor, '', 0, molImovelObra1.iImovel );
      if iIDObraLanc <= 0 then raise Exception.Create( CtrlCafObra.MessageInfo );

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
            ParamByName('PNODOCUMENTO').AsFloat         := StrToFloat(edtNumDocumento.text);
            ParamByName('PIDMODULO').AsInteger          := Sistema.IdModulo;
            ParamByName('PVLRLANCPAGAR').AsFloat        := edtVlrTotal.Value;
            ParamByName('PVLRLANCOMPAGAR').AsFloat      := edtVlrTotal.Value;
            ParamByName('PCODFORMA').AsInteger          := StrToInt(DBcboFormaRecPag.LookupValue);
            ParamByName('PCODCENTROCUSTO').AsString     := DBcboCentroCusto.LookupValue;
            ParamByName('PREFERENCIAAP').AsString       := edtReferenciaAP.Text;
            if dbCboContaBancaria.Value <> '' then
               ParamByName('PIDCBANCARIA').AsInteger    := StrToInt(dbCboContaBancaria.LookupValue);
            if edtNumAp.Text <> '' then
               ParamByName('PNUMAPALT').AsInteger       := StrToInt(edtNumAP.text);
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
            ParamByName('PIDOBRALANC').AsFloat     := iIDObraLanc;
            ParamByName('PIDLANCIMOVEL').AsInteger := iIDLancImovel;
            try
              ExecSQL;
            except
              Raise Exception.Create('Erro ao atualizar a tabela de o Nr. do Lançamento na tabela de OBRAS');
            end;
         end;

         if bTransacao then CommitTransacao;
      end;
   except
      on E : Exception do begin
         if bTransacao then RollBackTransacao;
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;


function TfrmCadObraLancDespesa.ExcluiLancamento(const bTransacao:Boolean): Boolean;
var iResult    : Integer;
    sMsg, sSql : string;
begin
   try
      Result := True;
      if bTransacao then StartTransacao;

      // Exclui a referencia da Planilha do CAF no Documento que será excluído
      sSql := 'UPDATE LANCTODOCUM SET PLNCODIGO = NULL    '+#13+
              ' WHERE PLNCODIGO = ( SELECT PLNCODIGO      '+#13+
              '                       FROM CAFOBRALANC    '+#13+
              '                      WHERE IDLANCIMOVEL = '+ qryIDLANCIMOVEL.AsString + ')';
      if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
         raise Exception.Create('Erro ao excluir a ref. da Planilha no Documento');

      // Exclui lançamento no CAF
      CtrlCafObra.OpenTransaction := False;
      if not CtrlCafObra.EstornaLancObra( Sistema.IdModulo,
                                          Sistema.IdEmpresa,
                                          Sistema.IdUsuario,
                                          qryIDCAFOBRA.AsInteger,
                                          qryDTALANCAMENTO.AsDateTime,
                                          qryDTALANCAMENTO.AsDateTime,
                                          qryIDOBRALANC.AsInteger ) then begin
          raise Exception.Create( CtrlCafObra.MessageInfo );
      end;

      //Renan Cristiano Sol 143302 Kintana 927548 Inicio.
      if (not qryCODDOCUMENTO.IsNull) then begin //se documento estiver integrado
        //Exclui documento
        sSql := 'DELETE FROM CCBAIXASXDOCUM WHERE CODDOCUMENTO = '+ qryIDDOCUMENTO.AsString;
        if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
           raise Exception.Create('Erro ao excluir documento');
      end;
      //Renan Cristiano Sol 143302 Kintana 927548 Fim.

      // Exclui lançamento no Lançamento Imóvel
      iResult := FuncoesImob.ExcluiLancImovel(qryIDDOCUMENTO.AsInteger,
                                              qryPLNCODIGO.AsInteger,
                                              qryDTALANCAMENTO.AsDateTime,
                                              (not qryCODDOCUMENTO.IsNull),
                                              (not qryPLNCODIGO.IsNull),
                                              sMsg,
                                              qryIDLANCIMOVEL.AsInteger);
      if iResult = 1 then raise Exception.Create(sMsg);

      if bTransacao then CommitTransacao;
   except
      on E : Exception do begin
         Result := False;
         if bTransacao then RollBackTransacao;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;

procedure TfrmCadObraLancDespesa.sbtnApagarClick(Sender: TObject);
begin
   if qryIDLANCIMOVEL.IsNull then begin
      MsgDlg('Lançamento interno do sistema não pode ser excluído.','Aviso',mtWarning,[mbOk],0);
      sbtnApagar.Enabled := True;
      sbtnApagar.Down    := False;
      Exit;
   end;
   if DocumentoPago(qryCODDOCUMENTO.AsInteger) then begin
      MsgDlg('Este documento já foi pago. Não pode ser excluído.','Aviso',mtWarning,[mbOk],0);
      sbtnApagar.Enabled := True;
      sbtnApagar.Down    := False;
      Exit;
   end;

   inherited;

   if MsgDlg('Confirma a Exclusão do Lançamento?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
      sbtnApagar.Enabled := True;
      Exit;
   end;

   if ExcluiLancamento then begin
      MsgDlg('Lançamento Excluído com Sucesso!','Informação',mtInformation,[mbOk],0);
      Seleciona(molImovelObra1.iObra);
      if not qry.IsEmpty then begin
         sbtnApagar.Enabled  := True;
         sbtnAlterar.Enabled := True;
      end;
   end;
end;


procedure TfrmCadObraLancDespesa.VerificaContaBancaria;
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

procedure TfrmCadObraLancDespesa.DBcboFormaRecPagCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   VerificaContaBancaria;
end;

procedure TfrmCadObraLancDespesa.sbtnAlterarClick(Sender: TObject);
begin
   if DocumentoPago(qryCODDOCUMENTO.AsInteger) then begin
      MsgDlg('Este documento já foi pago. Não pode ser alterado.','Aviso',mtWarning,[mbOk],0);
      sbtnAlterar.Enabled := True;
      sbtnAlterar.Down    := False;
   end else begin
      inherited;
      bAbreQry := False;
      pnlControles.BringToFront;
      sbtnInserir.Enabled := False;
      sbtnApagar.Enabled  := False;
      sbtnAlterar.Enabled := False;
      molFornecedor1.btnBuscaForn.SetFocus;
   end;
end;



function TfrmCadObraLancDespesa.BuscaNumAp(const iDocumento: Integer): Integer;
var sSql : String;
begin
   Result := -1;
   sSql := 'SELECT NUMAPGR FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(iDocumento);
   FazQuery(dtmImobiliario.qryAux, sSql);
   if ( not dtmImobiliario.qryAux.IsEmpty ) and ( dtmImobiliario.qryAux.FieldByName('NUMAPGR').AsInteger > 0 ) then begin
      Result := dtmImobiliario.qryAux.FieldByName('NUMAPGR').AsInteger;
   end;
end;

function TfrmCadObraLancDespesa.DocumentoPago(const iDocumento: Integer): Boolean;
var sSql : String;
begin
   Result := False;
   sSql   := 'SELECT SUM(VLRLIQUIDO) AS TOT_PAGO FROM LANCTODOCUM '+#13+
             ' WHERE RTRIM(OPERACAO) = ''5'' AND CODDOCUMENTO = ' + IntToStr(iDocumento);
   FazQuery(dtmImobiliario.qryAux, sSql);
   Result := dtmImobiliario.qryAux.FieldByName('TOT_PAGO').AsInteger <> 0;
end;

procedure TfrmCadObraLancDespesa.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (qryIDLANCIMOVEL.IsNull) or (not qryObraDTAENCERRAOBRA.IsNull) then begin
     sbtnApagar.Enabled  := False;
     sbtnAlterar.Enabled := False;
  end else begin
     sbtnApagar.Enabled  := True;
     sbtnAlterar.Enabled := True;
  end;
end;


procedure TfrmCadObraLancDespesa.molFornecedor1btnBuscaFornClick(
  Sender: TObject);
begin
  inherited;
  molFornecedor1.btnBuscaFornClick(Sender);

end;

end.
