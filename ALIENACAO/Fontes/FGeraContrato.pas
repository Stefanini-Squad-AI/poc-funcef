{-------------------------------------------------------------------------------

	Gera o Contrato de Alienação baseado na Proposta

	Autor             :  Vinícius Meyer Lana
	Data de Início    :  01/09/2001
	Data de Término   :

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 124511
Nº KINTANA..:
Data........: 12/04/2022
Responsável.: Luis Ferrari
Descrição...: Trazer somente Bem não baixado
-------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8221
Nº KINTANA..: 1577344
Data........: 20/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------
SOL  : 132206
Kintana: 766651
Responsável : Felipe de Oliveira
Data        : 24/05/2010
Descrição   : Criação de rotina que verifica se existem lançamentos no contrato
              selecionado, mostrando uma critica caso exista e evitando que o
              contrato seja feito
--------------------------------------------------------------------------------
Pendência   : 18795
Responsável : Daniel Simões
Data        : 31/01/2007
Descrição   : Não gera parcelas para "Caução", pois esta já foi gerada na
              proposta.
--------------------------------------------------------------------------------
Responsável     : Marcio Motta
Data de Início  : 12/01/2004
Data de Término :
Descrição       : Modificação ref. tratamento da condição do imóvel em
                  Penhora/Inativo na Geração do contrato
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FGeraContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls,
  MontaSelect, Db, DBTables, Wwquery, wwdblook, Wwdatsrc, TREdit,
  CMDBLookupCombo, mComprador, mProposta, wwdbedit, Wwdotdot, Wwdbcomb,
  wwdbdatetimepicker, CMDateTimePicker, uFuncoesImob, uCtrlImobMovBaixa,
  uCtrlBem, ComCtrls,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;

type
  TfrmGeraContrato = class(TfrmSairAjuda)
    btnGerar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qry: TwwQuery;
    ToolbarSep972: TToolbarSep97;
    ds: TwwDataSource;
    updQry: TUpdateSQL;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryCONNUMERO: TStringField;
    qryCONNOME: TStringField;
    qryFLGTIPOCONTRATO: TStringField;
    qryIDLOCATARIO: TFloatField;
    qryImovel: TwwQuery;
    qryCONDATAASSINATURA: TDateTimeField;
    qryFLGSTATUS: TStringField;
    qryCondPag: TwwQuery;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagDATAVENCIMENTO: TDateTimeField;
    qryCondPagTIPOCONDPAG: TStringField;
    qryVLRPROPOSTA: TFloatField;
    qryVLRCONTABIL: TFloatField;
    qryImovelIDIMOVEL: TFloatField;
    qryImovelIDIMOVELMESTRE: TFloatField;
    qryImovelIDCONTRATOIMOVEL: TFloatField;
    qryImovelVLRVENDA: TFloatField;
    qryImovelVLRCONTABIL: TFloatField;
    qryImovelFLGSTATUS: TStringField;
    qryImovelFLGATIVO: TFloatField;
    qryImovelPERCENT: TFloatField;
    pcBens: TPageControl;
    tsEvento: TTabSheet;
    tsBens: TTabSheet;
    gbObs: TGroupBox;
    meObs: TMemo;
    dbgrdBens: TwwDBGrid;
    dsBens: TwwDataSource;
    qryBens: TwwQuery;
    qryBensSEL_BEM: TFloatField;
    qryBensDESBEM: TStringField;
    qryBensNOME_GRUPO: TStringField;
    qryBensVLR_BEM: TFloatField;
    qryBensIXBGRUPO: TStringField;
    qryBensIDIMOVEL: TFloatField;
    qryBensIDBEM: TFloatField;
    qryBensIMOVEL_EXTENSO: TStringField;
    qryBensCODTIPIMOVEL: TStringField;
    qryBensIMOCODIGO: TStringField;
    qryBensIXBPERCENT: TFloatField;
    qryBensIDGRUPO: TFloatField;
    qryBensIDCONJUNTO: TFloatField;
    qryBensIDLOCALIZACAO: TFloatField;
    qryBensIDRESPONSAVEL: TFloatField;
    updBens: TUpdateSQL;
    qryImovelCODTIPIMOVEL: TStringField;
    qryImovelIMODATACOMPRA: TDateTimeField;
    qryImovelIMOVLRCOMPRA: TFloatField;
    Panel1: TPanel;
    molComprador1: TmolComprador;
    molProposta1: TmolProposta;
    GroupBox1: TGroupBox;
    edDataAssinatura: TCMDateTimePicker;
    cbBaixa: TCheckBox;
    rgTipoContrato: TRadioGroup;
    procedure btnGerarClick(Sender: TObject);
    procedure molComprador1btnBuscaFornClick(Sender: TObject);
    procedure molComprador1btnLimpaFornClick(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure molProposta1btnLimpaPropClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgrdBensDblClick(Sender: TObject);
  private
    { Private declarations }

    ParamContabeis : TParamContabeis;
    CtrlMovBaixa   : TCtrlImobMovBaixa;
    CtrlBem        : TCtrlBem;
    CtrlContab     : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344
    bBaixaBemParcial  : Boolean;

    procedure Sel( n : Double );                                                  // Abre tabelas do Form
    procedure CalcPercentRateio;                                                  // Calcula o Percentual de Rateio pelo Valor Contábil de Cada bem
    function  VerificaPreenchimento : Boolean;
    //SOL 132206 KTN 766651 Felipe de Oliveira Inicio
    Function VerificaLancamentos :Boolean;
    //SOL 132206 KTN 766651 Felipe de Oliveira Fim    
    function  GerarContrato         : Boolean;                                    // Gera o Contrato, atualizando as tabelas
    function  ExecutaEventoFlag     : Boolean;                                    // Atualiza os Flags e Registra o Evento do Imovel
    function  ExecutaBaixaCAF       : Boolean;                                    // Executa a baixa do bem no CAF
    function  ExecutaParcelas       : Boolean;                                    // Gera as parcelas das condições de pagamento do contrato
    function  BuscaContaBaixaCAF(var sContaDestino: String) : Boolean;            // Determina qual a conta para baixa do CAF ( a Vista / Parcelada )
    function  AtualizaStatusImovel(iIdImovel: Integer) : Boolean;                 // Passa o imóvel para "Em Alienação"
    function  AtualizaVlrContabilImovel(const iIdContrato, iIdImovel:Integer;     // Atualiza o valor contábil na ato da venda na
                                        const fVlrContabil:Extended) : Boolean;   // na tabela CONTRATOXIMOVEL

  public
    { Public declarations }
  end;

var
  frmGeraContrato: TfrmGeraContrato;

implementation

{$R *.DFM}

Uses uMensErro, uDataBase, UEventoImovel, USistema, uModuloImobiliario, DFinanciamento,
     DCAF, fAguarde, uCAF, UFuncAlienacao, dLookImobiliario, uComunsImobiliario,
     uVerificaPreenchimento, dImobiliario, dBaseDados;


procedure TfrmGeraContrato.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlMovBaixa := TCtrlImobMovBaixa.Create;
  CtrlBem      := TCtrlBem.Create;

  CtrlMovBaixa.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlBem.InitializeAs( CtrlMovBaixa );

  // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(CtrlMovBaixa);

  cbBaixa.Visible   := (Sistema.TipoCliente = 19991);
  dbgrdBens.Enabled := False;
end;

procedure TfrmGeraContrato.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlMovBaixa );
  FreeAndNil( CtrlBem );
  FreeAndNil(CtrlContab);// Helen - SOL: 172902/8221 KTN: 1577344
  inherited;
end;


// -- Abre as Tabelas do Formulário
//    Parâmetros:   n - Nr. do Contrato
Procedure TfrmGeraContrato.Sel( n : Double );
begin
   // Abre ContratoImovel
   LimpaParametros(qry);
   qry.Params[0].AsFloat := n;
   qry.Open;

   // Abre ContratoxImovel
   LimpaParametros(qryImovel);
   qryImovel.Params[0].AsFloat := n;
   qryImovel.Open;

   // Abre CondPagImovel
   LimpaParametros(qryCondPag);
   qryCondPag.Params[0].AsFloat := n;
   qryCondPag.Open;

   // Vinicius - 07/10/2005 - abre os bens para selecionar apenas um bem para venda
   if qryImovel.RecordCount = 1 then begin
      LimpaParametros(qryBens);
      qryBens.ParamByName('PIDIMOVEL').AsInteger := qryImovelIDIMOVEL.AsInteger;
   // Inicio SIG 124511 Ferrari
      qryBens.ParamByName('PBAIXATOTAL').AsString := 'N';
   // Fim   
      qryBens.Open;
      dbgrdBens.Enabled := True;
   end else begin
      dbgrdBens.Enabled := False;
   end;
end;


procedure TfrmGeraContrato.btnGerarClick(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimento then begin
      btnGerar.Enabled := False;

      //SOL 132206 KTN 766651 Felipe de Oliveira Início
      if VerificaLancamentos then
      begin
         MessageDlg('Os imóveis relacionados possuem lançamentos futuros. ', mtInformation, [mbOK], 0);
      end;
      //SOL 132206 KTN 766651 Felipe de Oliveira Fim


      if GerarContrato then begin
         // Limpa o formulario
         molComprador1.edtRazaoSocial.Clear;
         molProposta1.edtNomProp.Clear;
         molProposta1.edtNumProp.Clear;
         molComprador1.iComprador := -1;
         molProposta1.iProposta   := -1;
      end else begin
         btnGerar.Enabled := True;
      end;
   end;
end;

//SOL 132206 KTN 766651 Felipe de Oliveira Início
function TfrmGeraContrato.VerificaLancamentos:Boolean;
var
  qryVerificaLanc : TQuery;
begin
  Result := False;

  qryVerificaLanc := TQuery.Create(nil);
  qryVerificaLanc.DatabaseName := 'BaseDados';

  qryVerificaLanc.Close;
  qryVerificaLanc.SQL.Clear;
  qryVerificaLanc.SQL.Add(' SELECT C.IDCONTRATOIMOVEL  FROM CONTRATOXIMOVEL C, LANCAMENTOSIMOVEL L '+
                          '  WHERE C.IDCONTRATOIMOVEL = L.IDCONTRATOIMOVEL '+
                          '    AND C.IDIMOVEL = L.IDIMOVEL            '+
                          '    AND C.IDIMOVEL = :PARIDIMOVEL'+
                          '    AND L.DATALANCAMENTO >= :PARDATALANCAMENTO');
  qryVerificaLanc.ParamByName('PARIDIMOVEL').AsInteger := qryImovelIDIMOVEL.AsInteger;
  qryVerificaLanc.ParamByName('PARDATALANCAMENTO').AsDate :=  edDataAssinatura.Date;
  qryVerificaLanc.Open;

  if not qryVerificaLanc.IsEmpty then
     Result := True;

end;
//SOL 132206 KTN 766651 Felipe de Oliveira Fim

function TfrmGeraContrato.GerarContrato : Boolean;
var bResult : Boolean;
Begin
   Result := True;
   try
      StartTransacao;
      if not cbBaixa.Checked then begin

         if (ModuloImobiliario.Alienacao.bFlgIntegraAtivo) and ( rgTipoContrato.ItemIndex = 0 ) then bResult := ExecutaBaixaCAF;

         // Pendencia 21107
         if bResult then bResult := ExecutaEventoFlag;
         // Fim Pendencia 21107

         if bResult then bResult := ExecutaParcelas;
      end else begin
         if bResult and ModuloImobiliario.Alienacao.bFlgIntegraAtivo and ( rgTipoContrato.ItemIndex = 0 ) then bResult := ExecutaBaixaCAF;
      end;

      if bResult then begin
         CommitTransacao;
         frmAguarde.Apaga;
         MsgDlg('Contrato gerado com sucesso','Informação',mtInformation,[mbOK],0);
      end else begin
         RollBackTransacao;
         frmAguarde.Apaga;
         Result := False;
         MsgDlg('Ocorreram ERROS na geração do Contrato','Aviso',mtWarning,[mbOK],0);
      end;
   except
      RollBackTransacao;
      frmAguarde.Apaga;
      Result := False;
      MsgDlg('Ocorreram ERROS na geração do Contrato','Aviso',mtWarning,[mbOK],0);
   end;
end;


function TfrmGeraContrato.ExecutaEventoFlag : Boolean;
var fVlrContabil, fVlrContabilTotal : Extended;
    sSql, sTitulo : String;
    bBaixaParcial : Boolean;
begin
   Result            := True;
   fVlrContabil      := 0;
   fVlrContabilTotal := 0;
   try

      // verifica baixa parcial dos bens
      bBaixaBemParcial := False;
      if qryImovel.RecordCount = 1 then begin
         qryBens.First;
         while not qryBens.Eof do begin
            if qryBensSEL_BEM.AsInteger = 0 then bBaixaBemParcial := True;
            qryBens.Next;
         end;
         qryBens.First;
      end;

      // Atualiza a data de início das condições de pagamento com a data de assinatura
      sSql := 'UPDATE CONDPAGIMOVEL ' +
              '   SET DATAINI = TO_DATE(' + QuotedStr(DateToStr(edDataAssinatura.Date)) + ',' +
                                            QuotedStr('DD/MM/YYYY') + ') ' +
              ' WHERE IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta);
      ExecutaQuery(dtmFinanciamento.qryAux,sSql);

      if not bBaixaBemParcial then
           sTitulo := 'Contrato de Alienação'
      else sTitulo := 'Contrato de Alienação ( Venda Parcial de Bens )';

      if rgTipoContrato.ItemIndex = 1 then
         sTitulo := 'Acordo de Aluguel';

      // Registra o Evento para cada Imóvel do Contrato
      qryImovel.First;
      while not qryImovel.eof do begin

         // Verifica se todos os bens do imóvel foram baixados
         bBaixaParcial := False;
         LimpaParametros(dtmCAF.qryImovelXBem);
         dtmCAF.qryImovelXBem.ParamByName('PIDIMOVEL').AsInteger  := qryImovelIDIMOVEL.AsInteger;
         dtmCAF.qryImovelXBem.ParamByName('PBAIXATOTAL').AsString := 'N';
         dtmCAF.qryImovelXBem.Open;
         if dtmCAF.qryImovelXBem.RecordCount > 0 then begin
            bBaixaParcial := True;
            sTitulo := 'Contrato de Alienação ( Venda Parcial )';
         end;


         UEventoImovel.EventoImovel.RegistraEvento(qryImovelIDIMOVEL.AsInteger,
                                                   molProposta1.iProposta,
                                                   Sistema.IdUsuario, 0, 0,
                                                   edDataAssinatura.Date,
                                                   edDataAssinatura.Date,
                                                   'CA', sTitulo,
                                                   meObs.Text, 0, 0, 0, True);

         if rgTipoContrato.ItemIndex = 0 then begin
            if (not bBaixaBemParcial) and (not bBaixaParcial) then
               AtualizaStatusImovel(qryImovelIDIMOVEL.AsInteger);

            // Busca Valor Contabil do Imovel
            // Pend 21441 - Vinicius - 22/03/2006 - Atualiza pelo valor do imóvel depreciado até o dia anterior a venda.
            If (qryImovelIMODATACOMPRA.AsDateTime < edDataAssinatura.Date) then
              fVlrContabil      := CAF.SaldoContabilImovel(qryImovelIDIMOVEL.AsInteger, -1,
                                                           edDataAssinatura.Date -1)
            else
              fVlrContabil      := qryImovelIMOVLRCOMPRA.AsFloat;

            fVlrContabilTotal := fVlrContabilTotal + fVlrContabil;

            // Atualiza o valor contábil do imóvel em CONTRATOXIMOVEL
            if ModuloImobiliario.Alienacao.bFlgIntegraAtivo then begin
               if not AtualizaVlrContabilImovel(molProposta1.iProposta,
                                                qryImovelIDIMOVEL.AsInteger,fVlrContabil) then begin
                  MsgDlg('Não foi possível atualizar o Valor Contábil em CONTRATOXIMOVEL','Erro',mtError,[mbOK],0);
                  Result := False;
                  Exit;
               end;
            end;
         end;

         qryImovel.Next;
      end;

      // Altera o Flag de Tipo de Contrato para <C>ontrato
      // Grava o comprador , a data do contrato e atualiza o Valor Contabil Total
      qry.Edit;
      if rgTipoContrato.ItemIndex = 0 then
         qryFLGTIPOCONTRATO.AsString     := 'C'
      else
         qryFLGTIPOCONTRATO.AsString     := 'A';

      qryFLGSTATUS.AsString           := 'V';
      qryIDLOCATARIO.AsFloat          := molComprador1.iComprador;
      qryCONDATAASSINATURA.AsDateTime := edDataAssinatura.Date;
      if ModuloImobiliario.Alienacao.bFlgIntegraAtivo then  qryVLRCONTABIL.AsFloat := fVlrContabilTotal;

      qry.Post;
      qry.ApplyUpdates;
   except
      Result := False;
   end;
end;


function TfrmGeraContrato.ExecutaBaixaCAF : Boolean;
var fValResult, fValResultImob : Currency;
    fPropBaixa, fValVenda : Extended;
    iPlanilha, prg : Integer;
    sContaDestino : String;
begin
   Result := True;
   prg    := 0;

   FrmAguarde.Mostra('Baixando imóveis no Ativo Fixo...');
   FrmAguarde.Max := qryImovel.RecordCount;
   Application.ProcessMessages;

   // Efetua operação de baixa de bem para cada Imóvel do Contrato
   try
      // Define a conta contabil de destino da baixa
      if not BuscaContaBaixaCAF( sContaDestino ) then
         raise Exception.Create('Conta contábil de destino não foi parametrizada');

      qryImovel.First;
      while not qryImovel.eof do begin

         Inc(prg);
         FrmAguarde.Pos := prg;
         Application.ProcessMessages;

         // Abre Bens relativos ao imóvel alienado
         // apenas para contratos com mais de um imóvel. Contrato com um imovel foi aberto na seleção
         // permitindo a seleção dos bens.
         if qryImovel.RecordCount > 1 then begin
            LimpaParametros(qryBens);
            qryBens.ParamByName('PIDIMOVEL').AsInteger := qryImovelIDIMOVEL.AsInteger;
            qryBens.Open;
         end;
         if not qryBens.IsEmpty then begin

            // Calcula o Percentual de Rateio dos Bens pelo Valor Contábil atual
            // será utilizado para definir o valor de venda de cada bem do imóvel
            CalcPercentRateio;

            // Efetua a Baixa do imóvel no Ativo Fixo
            qryBens.First;
            while not qryBens.Eof do begin
               if qryBensSEL_BEM.AsInteger = 1 then begin
                  fPropBaixa := qryImovelPERCENT.AsFloat;
                  fValVenda  := qryBensVLR_BEM.AsFloat;

                  CtrlMovBaixa.OpenTransaction := False;
                  if not CtrlMovBaixa.ExecutaBaixa(54,    // módulo 54 - investimob
                                                   Sistema.IdEmpresa,
                                                   Sistema.IdUsuario,
                                                   qryBensIDBEM.AsInteger,
                                                   1,                 // id Motivo da Baixa 1-Alienação
                                                   edDataAssinatura.date,
                                                   0,                 // tipo de proporção: 0 - percentual
                                                   fPropBaixa,        // proporção da baixa
                                                   fValVenda,
                                                   meObs.Text, sContaDestino,
                                                   0 ) then           // deprec. pro rata na data -1
                     raise Exception.create( CtrlMovBaixa.MessageInfo );
               end;
               qryBens.next;
            end;
         end;
         qryImovel.Next;
      end;
   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;

// Calcula o Percentual de Rateio dos bem baseado no Valor contábil atual
// Será utilizado para definir o valor de venda de cada bem do imóvel para baixa no CAF
procedure TfrmGeraContrato.CalcPercentRateio;
var fSldCtbImob, iSaldo, iSaldoTot : Extended;
begin
   // Busca o Valor contábil de cada bem para definir o percentual de rateio
   with qryBens do begin
      if IsEmpty then begin
         Exit;
      end;

      First;
      iSaldoTot := 0;
      while not eof do begin
         if FieldByName('SEL_BEM').AsInteger = 1 then begin
            Edit;
            // Verifica saldo do bem
            iSaldo := CtrlBem.SaldoContabil(Sistema.IdEmpresa,
                                            FieldByName('IDBEM').AsInteger,
                                            edDataAssinatura.Date,
                                            ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                            ModuloImobiliario.InvestImob.iIdPaisCAF );
            FieldByName('VLR_BEM').AsFloat := iSaldo;
            iSaldoTot := iSaldoTot + iSaldo;
            Post;
         end;
         Next;
      end;

      // Calcula o Percentual de Rateio
      First;
      while not eof do begin
         if FieldByName('SEL_BEM').AsInteger = 1 then begin
            Edit;
            FieldByName('IXBPERCENT').AsFloat := (FieldByName('VLR_BEM').AsFloat * 100) / iSaldoTot;
            Post;
         end;
         Next;
      end;

      // Calcula o Valor da Alienação por bens
      First;
      iSaldoTot := 0;
      while not eof do begin
         Edit;
         if FieldByName('SEL_BEM').AsInteger = 1 then begin
            FieldByName('VLR_BEM').AsFloat := ComunsImobiliario.Arredonda( ((qryImovelVLRVENDA.AsFloat * FieldByName('IXBPERCENT').AsFloat) / 100), 2);
            iSaldoTot := iSaldoTot + FieldByName('VLR_BEM').AsFloat;
            Post;
         end;
         Next;
      end;

      // Ajusta centavos no ultimo bem
      if iSaldoTot <> qryImovelVLRVENDA.AsFloat then begin
         Last;
         Edit;
         FieldByName('VLR_BEM').AsFloat := FieldByName('VLR_BEM').AsFloat + (qryImovelVLRVENDA.AsFloat - iSaldoTot);
         Post;
      end;
      First;
   end;
end;


function TfrmGeraContrato.ExecutaParcelas : Boolean;
begin
  Result := True;

  // Gera as Parcelas do contrato de alienação
  try
    DtmFinanciamento.qryParc.Close;
    DtmFinanciamento.qryParc.Open;
    qryCondPag.First;
    while not qryCondPag.eof do begin
      if (qryCondPagTIPOCONDPAG.AsString<>'C') then begin // Daniel - 18795
        FuncAlienacao.GeraParcela(qryCondPagIDCONDPAGIMOVEL.AsFloat,
                                  qryCondPagDATAVENCIMENTO.AsDateTime,
                                  Date(),
                                  DtmFinanciamento.qryParc);
        DtmFinanciamento.qryParc.ApplyUpdates;
        DtmFinanciamento.qryParc.CommitUpdates;
      end;

      qryCondPag.Next;
    end;
  except
    Result := False;
  end;
end;


// -- Atualiza o Status do Imóvel para "Em Alienação"
//    Parâmetros:  iImovel  - ID do Imóvel
function TfrmGeraContrato.AtualizaStatusImovel(iIdImovel: Integer): Boolean;
var sSql : String;
begin
   Result := True;
   sSql := 'UPDATE IMOVEL ' +
           '   SET FLGSTATUS = ' + QuotedStr('A') + ',' +
           '       FLGATIVO  = 0 ' +
           ' WHERE IDIMOVEL  = ' + IntToStr(iIdImovel);

   if not ExecutaQuery(dtmFinanciamento.qryAux,sSql) then begin
      Result := False;
   end;
end;

procedure TfrmGeraContrato.molComprador1btnBuscaFornClick(Sender: TObject);
begin
   inherited;
   molComprador1.btnBuscaFornClick(Sender);
   if (molComprador1.iComprador > 0) and (molProposta1.iProposta > 0) then
        btnGerar.Enabled := True
   else btnGerar.Enabled := False;
end;

procedure TfrmGeraContrato.molComprador1btnLimpaFornClick(Sender: TObject);
begin
   inherited;
   molComprador1.btnLimpaFornClick(Sender);
   if (molComprador1.iComprador > 0) and (molProposta1.iProposta > 0) then
        btnGerar.Enabled := True
   else btnGerar.Enabled := False;
end;

procedure TfrmGeraContrato.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   // Exclusivo FUNCEF para apenas baixar um imóvel no CAF.
   if cbBaixa.Checked then
        molProposta1.btnBuscaPropClick(3,True,Sender)
   else molProposta1.btnBuscaPropClick(1,True,Sender);

   Sel(molProposta1.iProposta);

// Daniel - 18795 - Início -----------------------------------------------------
   if (molProposta1.iComprador>0) then begin
     molComprador1.edtRazaoSocial.Text := molProposta1.sComprador;
     molComprador1.iComprador          := molProposta1.iComprador;
   end;
// Daniel - 18795 - Fim --------------------------------------------------------

   if (molComprador1.iComprador > 0) and (molProposta1.iProposta > 0) then
        btnGerar.Enabled := True
   else btnGerar.Enabled := False;
end;

procedure TfrmGeraContrato.molProposta1btnLimpaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnLimpaPropClick(Sender);
   if (molComprador1.iComprador > 0) and (molProposta1.iProposta > 0) then
        btnGerar.Enabled := True
   else btnGerar.Enabled := False;
end;

procedure TfrmGeraContrato.FormShow(Sender: TObject);
begin
   inherited;
   meObs.Clear;
   meObs.Lines.Add('Aprovação de D.E.:  ');
   meObs.Lines.Add('Aprovação de C.A.:  ');
   edDataAssinatura.Date := Date();
end;

// -- Atualiza o Valor Contábil na tabela CONTRATOXIMOVEL
function TfrmGeraContrato.AtualizaVlrContabilImovel(const iIdContrato,iIdImovel: Integer;
                                                    const fVlrContabil: Extended): Boolean;
begin
   Result := True;
   try
      with dtmFinanciamento.qryAux do begin
         SQL.Clear;
         SQL.Add('UPDATE CONTRATOXIMOVEL ');
         SQL.Add('   SET VLRCONTABIL      = :pVLRCONTABIL');
         SQL.Add(' WHERE IDCONTRATOIMOVEL = :pIDCONTRATO');
         SQL.Add('   AND IDIMOVEL         = :pIDIMOVEL');
         Params[0].AsFloat   := fVlrContabil;
         Params[1].AsInteger := iIdContrato;
         Params[2].AsInteger := iIdImovel;
         ExecSQL;
      end;
   except
      Result := False;
   end;
end;


function TfrmGeraContrato.VerificaPreenchimento: Boolean;
var dPrimeiraCond : TDateTime;
begin
   Result := True;

   // Busca o vencimento da primeira parcela
   qryCondPag.First;
   dPrimeiraCond := qryCondPagDATAVENCIMENTO.AsDateTime;

   while not qryCondPag.Eof do begin
      if qryCondPagDATAVENCIMENTO.AsDateTime < dPrimeiraCond then
         dPrimeiraCond := qryCondPagDATAVENCIMENTO.AsDateTime;
      qryCondPag.Next;
   end;
   qryCondPag.First;

   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DateToStr(edDataAssinatura.Date)) then
   begin
      MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
      Result := False;
   end;
   // Helen - SOL:  172902/8221 KTN: 1577344 - Fim

   if edDataAssinatura.Date > dPrimeiraCond then begin
      MsgDlg('Data de Assinatura não deve ser superior ao vencimento do primeiro pagamento','Aviso',mtWarning,[mbOK],0);
      Result := False;
   end;

//---------- 12/01/2004 - Início-- - Marcio Motta ---------------Pendência: 15799 -----------------
   qryImovel.First;

   while not qryImovel.Eof do begin
      // verifica a existência de Imóvel MESTRE na situação de Penhor

      with DtmImobiliario.qryImovel do begin
         LimpaParametros(DtmImobiliario.qryImovel);
         ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
         ParamByName('pIdImovel').AsInteger := qryImovelIDIMOVELMESTRE.AsInteger;
         Open;
         if dtmImobiliario.qryImovelFLGSTATUS.AsString = 'P' then begin
            Result := False;
            MsgDlg('O imóvel MESTRE está em Penhora, não permitindo' + #13 +
                   'a alienação deste imóvel', 'Aviso',mtWarning ,[mbOk],0);
            Break;
         end;

        // Pendência 19876 - MARCOS TOPINI
        if ( qryImovelCODTIPIMOVEL.AsString = ModuloImobiliario.InvestImob.sCodTipImovelObra ) or
           ( qryImovelCODTIPIMOVEL.AsString = ModuloImobiliario.AdminImob.sTipoImovelPatro ) then begin
            Result := False;
            MsgDlg('Imóveis em Construção ou Locados a Patrocinadora não podem ser alienados, ' +#13+
                   'transfira primeiro o imóvel de segmento.', 'Aviso',mtWarning ,[mbOk],0);
            Break;
        end;
      end;

      // verifica a existência de Imóvel FILHO na situação de Penhor
      if (qryImovelFLGSTATUS.AsString = 'P') then begin
         Result := False;
         MsgDlg('O imóvel não pode ser alienado' + #13 +
                'porque está em Penhora.','Aviso',mtWarning,[mbOK],0);
         Break;
      end;

      // verifica a existência de contratos inativos
      if (qryImovelFLGATIVO.AsInteger = 0) then begin
         Result := False;
         MsgDlg('O imóvel não pode ser alienado porque está com o status de Inativo.','Aviso',mtWarning,[mbOK],0);
         Break;
      end;

      qryImovel.Next;
   end;
//------- Fim Implementação/Alteração - Marcio Motta ----------------------------------------------

   if Result = True then begin
      if MsgDlg('Todas as depesas operacionais relativas a venda devem ser lançadas ' + #13 +
                'no AdminImob antes da geração do contrato.(Ex: Iptu, Corretagem, etc.)' +#13+
                'Confirma a geração do Contrato ? ', 'Aviso',mtWarning ,[mbYes, mbNo],0) = mrNo then begin
         Result := False;
      end;
   end;
end;

function TfrmGeraContrato.BuscaContaBaixaCAF (var sContaDestino : String): Boolean;
var sTipoVenda, sTipoImovel : String;
    ParamContab : TParamContabeis;
    iCodErro : Integer;
begin
  Result        := True;
  sContaDestino := '';

  // Verifica o tipo de venda ( a vista / prazo )
  with dtmFinanciamento.qryAux do begin
     Close;
     Sql.Clear;
     Sql.Add('SELECT TIPOCONDPAG FROM CONDPAGIMOVEL');
     Sql.Add(' WHERE IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) );
     Open;
     if (RecordCount = 1) and (FieldByName('TIPOCONDPAG').AsString = 'V') then
          sTipoVenda := 'V'
     else sTipoVenda := 'P';
  end;

  // Busca o Tipo de Imóvel do contrato
  with dtmFinanciamento.qryAux do begin
     Close;
     Sql.Clear;
     Sql.Add('SELECT I.CODTIPIMOVEL ');
     Sql.Add('  FROM CONTRATOXIMOVEL CXI, IMOVEL I');
     Sql.Add(' WHERE CXI.IDIMOVEL = I.IDIMOVEL ');
     Sql.Add('   AND CXI.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) );
     Sql.Add('GROUP BY I.CODTIPIMOVEL');
     Open;
     if RecordCount > 1 then begin
        MsgDlg('Existem tipos de imóvel diferentes relacionados no mesmo contrato','Erro',mtError,[mbOk],0);
        Result := False;
        Exit;
     end else begin
        sTipoImovel := FieldByName('CODTIPIMOVEL').AsString;
     end;
  end;

  // Busca a Conta Contábil
  if sTipoVenda = 'V' then begin
     if ModuloImobiliario.Alienacao.iTipoRecAVista <= 0 then begin
        MsgDlg('Parametrização não encontrada para Venda a Vista','Erro',mtError,[mbOk],0);
        Result := False;
        Exit;
     end;
     // Carrega parâmetros
     iCodErro := FuncoesImob.BuscaPadrLanc('R',
                                           sTipoImovel,
                                           Sistema.IdEmpresa,
                                           Sistema.IdModulo,
                                           ModuloImobiliario.Alienacao.iTipoRecAVista,
                                           -1,
                                           molProposta1.iProposta,
                                           ParamContab);
  end else begin
     if ModuloImobiliario.Alienacao.iTipoRecAmortiz <= 0 then begin
        MsgDlg('Parametrização não encontrada para Amortização de Venda Parcelada','Erro',mtError,[mbOk],0);
        Result := False;
        Exit;
     end;
     // Carrega parâmetros
     iCodErro := FuncoesImob.BuscaPadrLanc('R',
                                           sTipoImovel,
                                           Sistema.IdEmpresa,
                                           Sistema.IdModulo,
                                           ModuloImobiliario.Alienacao.iTipoRecAmortiz,
                                           -1,
                                           molProposta1.iProposta,
                                           ParamContab);
  end;

   // trata erro
   if iCodErro < 0 then begin
      with dtmLookImobiliario do begin
         LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
         qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := sTipoImovel;
         qryLookTipoImovel.Open;

         if iCodErro = -4 then
              MsgDlg('Parametrização Duplicada para: ' + qryLookTipoImovelDESCTIPOIMOVEL.AsString,'Erro',mtError,[mbOk],0)
         else MsgDlg('Parametrização Não Encontrada para: ' + qryLookTipoImovelDESCTIPOIMOVEL.AsString,'Erro',mtError,[mbOk],0);
      end;
      Result := False;
   end else begin
      // Pend 24443 - Vinicius
      if ParamContab.iFlgIntegraContab = 1 then begin      // Parametrização COM conta de passagem
         sContaDestino := ParamContab.sContaContabilCredito;
      end else begin                                       // Parametrização SEM conta de passagem
         sContaDestino := ParamContab.sContaContabilDebito;
      end;
      // Fim 24443
   end;
end;


procedure TfrmGeraContrato.dbgrdBensDblClick(Sender: TObject);
begin
   inherited;
   // Marca ou Desmarca as parcelas para integração APENAS SE O CONTRATO TIVER UM ÚNICO IMOVEL
   if qryImovel.RecordCount = 1 then begin
      if not qryBens.IsEmpty then begin
         qryBens.Edit;
         qryBensSEL_BEM.AsInteger := (qryBensSEL_BEM.AsInteger Xor 1);
         qryBens.Post;
      end;
   end;
end;

end.
