unit FExecAcrescimo;

//	-------------------------------------------------------------------------------------------------
//
//	   Acréscimo de Valor
//
//	Autor          :  André Pontes
//	Data de Início	:  08/11/1999
//	Data de Término:  09/11/1999
//
//	Modificações	:  19/11/1999  1) Possibilidade de se agregar um novo bem a um imóvel que já possua bens
//                   08/02/2001  2) Substituição das ComboBoxes por MontaSelects
//                   10/02/2001  3) Campos necessários às APs, com tratamento
//
//
// -------------------------------------------------------------------------------------------------



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Mask, wwdblook, StdCtrls, TREdit, Db,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdbedit, Wwdotdot, Wwdbcomb,
  wwriched, FCadastroMestreDetImob, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmExecAcrescimoValor = class(TfrmCadastroMestreDetImob)
    updImovelxBem: TUpdateSQL;
    qryImovelxBem: TwwQuery;
    Label49: TLabel;
    btnBuscaBem: TBitBtn;
    DBedtDescricaoBem: TDBEdit;
    Label36: TLabel;
    Label48: TLabel;
    DBcboGrupo: TwwDBComboBox;
    qryIDOPERACAOINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryEMPRESAPROP: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryQTDEOPERACAO: TFloatField;
    qryPRECOUNITOPERACAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryIDINSTFIN: TFloatField;
    qryDATAVENCOPER: TDateTimeField;
    qryIDFORCLI: TFloatField;
    qryVLROPERACAOOM: TFloatField;
    qryMOECODIGO: TFloatField;
    qryPreencheBem: TwwQuery;
    qryPreencheBemIDBEM: TFloatField;
    qryPreencheBemIDPESSOA: TFloatField;
    qryPreencheBemPLACA: TFloatField;
    qryPreencheBemDESBEM: TStringField;
    qryImovelxBemIDBEM: TFloatField;
    qryImovelxBemIDIMOVEL: TFloatField;
    qryImovelxBemIDPESSOA: TFloatField;
    qryImovelxBemIXBGRUPO: TStringField;
    tbsOperacao: TTabSheet;
    Label5: TLabel;
    lblData: TLabel;
    Label3: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    btnBuscaImovel: TBitBtn;
    DBcboMoeda: TwwDBLookupCombo;
    DBcboTipoOper: TwwDBLookupCombo;
    DBedtDataVenc: TCMDateTimePicker;
    Label12: TLabel;
    Label1: TLabel;
    DBedtObsOper: TDBEdit;
    Label23: TLabel;
    qryOBSERVACAO: TStringField;
    qryImovelxBemIXBPERCENT: TFloatField;
    qryForCliXTipoOper: TwwQuery;
    qryForCliXTipoOperIDTIPOINVEST: TFloatField;
    qryForCliXTipoOperIDTIPOOPERACAO: TFloatField;
    qryForCliXTipoOperEMPRESAPROP: TFloatField;
    qryForCliXTipoOperIDFORCLI: TFloatField;
    qryForCliXTipoOperIDTIPOCLIENTE: TFloatField;
    DBedtPlaca: TDBEdit;
    DBRealEdit1: TDBRealEdit;
    Label2: TLabel;
    Label4: TLabel;
    DBedtVlrOMBem: TDBRealEdit;
    Label6: TLabel;
    qryImovelxBemVLRBEM: TFloatField;
    qryImovelxBemVLROMBEM: TFloatField;
    edtMoedaBem: TEdit;
    DBedtDataOper: TCMDateTimePicker;
    Label15: TLabel;
    qryImovelxBemCONTROLE: TStringField;
    qryImovelxBemREGISTRO: TStringField;
    sbtnNovoBem: TToolbarButton97;
    qryRegistraOperXAcrescimo: TwwQuery;
    btnBuscaForCli: TBitBtn;
    DBedtImovel: TDBEdit;
    edtCarteira: TDBEdit;
    edtTipoImovel: TDBEdit;
    qryDESCCARTINVEST: TStringField;
    qryDESCTIPOIMOVEL: TStringField;
    DBedtForCli: TDBEdit;
    tbsAP: TTabSheet;
    Label8: TLabel;
    DBcboCentroCustoAP: TwwDBLookupCombo;
    memObs: TMemo;
    Label7: TLabel;
    DBcboFormaRecPag: TwwDBLookupCombo;
    Label10: TLabel;
    Label9: TLabel;
    edtReferenciaAP: TEdit;
    Label11: TLabel;
    DBedtVlrOM: TDBEdit;
    DBedtVlrOper: TDBEdit;
    qryIMOVEL_EXTENSO: TStringField;
    qryNF_FORCLI: TStringField;
    qryRS_FORCLI: TStringField;
    edtNumDocumento: TDBEdit;
    DBEdit1: TDBEdit;
    ToolbarSep976: TToolbarSep97;
    qryDOCUMENTO_INVEST: TStringField;
    qryNUMDOCUMENTO: TFloatField;

    procedure btnBuscaBemClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure DBedtVlrOMExit(Sender: TObject);
    procedure DBcboMoedaExit(Sender: TObject);
    procedure DBcboMoedaEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbcDetalheChange(Sender: TObject);
    procedure qryImovelxBemCalcFields(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure DBcboTipoOperCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBcboMoedaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBedtVlrOMBemExit(Sender: TObject);
    procedure DBedtDataVencExit(Sender: TObject);
    procedure DBedtDataOperExit(Sender: TObject);
    procedure sbtnNovoBemClick(Sender: TObject);
    procedure btnBuscaForCliClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);


  private { Private declarations }
    grdDetAtual : TwwDBGrid;
    qryDetAtual : TwwQuery;

    bIntegraCAPCAR, bIntegraCAF : boolean;

    iImovel, iOperacao, iCarteira      : int64;
    fTotAcrescimoOM, fTotAcrescimo     : currency;
    sMoedaIni, sMoedaFim               : string;
    sTipoImovel                        : string;


    procedure BuscaBem;
    function Efetiva: boolean;
    function BuscaForCli: integer;

    function GeraOperacao: boolean;
    function IntegraCAF(sObs: string): boolean;
    procedure RegistraOperXAcrescimo(iAcrescimo: integer);

    procedure ConverteValorOperacao;
    procedure ConverteValorBem;

    function VerificaPreenchimento: boolean;
    function VerificaPreenchimentoDetalhe: boolean;

    procedure AbreQueries;
    procedure FechaDetalhes;
    procedure FechaQueries;

  public { Public declarations }

  end;




var
  frmExecAcrescimoValor: TfrmExecAcrescimoValor;



implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, UModulo, uComunsImobiliario, uVerificaPreenchimento,
  UDocumento, UIntegraBack, uOperComum, FCadastroCS, uAtivoFixo, uFuncoesImob,
  FCadBem, dLookImobiliario, DMS, dImobiliario;



procedure TfrmExecAcrescimoValor.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   sbtnAlterar.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnProcurar.Enabled := False;
end;



procedure TfrmExecAcrescimoValor.CmeCadastroFind(Sender: TObject);
var
   sMestre: string;
begin
   inherited;

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if MontaSelect.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      FechaDetalhes;

      iOperacao := StrToInt(MontaSelect.ValoresChave[0]);
		with qry do begin
         LimpaParametros(qry);
         Params[0].asInteger := iOperacao;
         Open;
      end;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecAcrescimoValor.CmeCadastroInsert(Sender: TObject);
begin
   FechaDetalhes;

   // define logo o id do registro que se está inserindo, para poder gravar nos detalhes
   iOperacao := LeUltRegistro(nil, 'OPERACAOINVEST');

	with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDOPERACAOINVEST').asInteger := iOperacao;
      Open;
   end;

   inherited;
   AbreQueries;

   qryNUMDOCUMENTO.AsFloat := FuncoesImob.GeraNoDocumento('P');

   tbcDetalheChange(tbcDetalhe);
   if DBcboTipoOper.CanFocus then DBcboTipoOper.SetFocus;
end;



procedure TfrmExecAcrescimoValor.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   tbcDetalheChange(tbcDetalhe);
   if DBcboTipoOper.CanFocus then DBcboTipoOper.SetFocus;
end;



procedure TfrmExecAcrescimoValor.CmeCadastroConfirma(Sender: TObject);
begin
	if CmeCadastro.Operacao = opInserir then begin

      StartTransacao;

      try

         qryIDOPERACAOINVEST.asInteger   := iOperacao;
         qryEMPRESAPROP.asInteger        := Sistema.idEmpresa;
         qryIDTIPOINVEST.asInteger       := 3;

         if Modulo.bIntegraGestao then qryIDCARTEIRAINVEST.asInteger := iCarteira;

         qry.ApplyUpdates;

         if Efetiva then begin

            if Modulo.bIntegraAtivo then qryImovelxBem.ApplyUpdates;

            CommitTransacao;

            Screen.Cursor := crDefault;
            MsgDlg('A Operação foi registrada.', 'Informação', mtInformation, [mbOk], 0);

         end else begin

            // se houve problema, faz Cancel
            RollBackTransacao;

            qryImovelxBem.CancelUpdates;
            qry.CancelUpdates;

            Screen.Cursor := crDefault;
            MsgDlg('O Operação não foi registrada.', 'Erro', mtError, [mbOk], 0);
            Repaint;

         end;

      except
         // se houve problema, faz Cancel
         RollBackTransacao;

         qryImovelxBem.CancelUpdates;
         qry.CancelUpdates;

         Screen.Cursor := crDefault;
         MsgDlg('Falha de gravação. A Operação não foi registrada.', 'Erro', mtError, [mbOk], 0);
         Repaint;
         Raise;
         Repaint;
      end;

   end;
end;



procedure TfrmExecAcrescimoValor.CmeCadastroCancel(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;

   inherited;

	// fecha e abre as queries principal contendo zero registros
	with qryImovelxBem do begin
      LimpaParametros(qryImovelxBem);
      ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      ParamByName('PIDIMOVEL').asInteger := 0;
      Open;
   end;

	with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDOPERACAOINVEST').asInteger := Sistema.idEmpresa;
      Open;
   end;

   Screen.Cursor := crDefault;
end;



procedure TfrmExecAcrescimoValor.CmeDetalheInsert(Sender: TObject);
begin
   inherited;

   if qryDetAtual = qryImovelxBem then begin
      DBcboGrupo.Enabled   := True;
      btnBuscaBem.Enabled  := True;

      if DBcboGrupo.CanFocus then DBcboGrupo.SetFocus;
   end;
end;



procedure TfrmExecAcrescimoValor.CmeDetalheEdit(Sender: TObject);
begin
   inherited;

   if qryDetAtual = qryImovelxBem then begin
      DBcboGrupo.Enabled   := False;
      btnBuscaBem.Enabled  := False;

      if DBedtVlrOMBem.CanFocus then DBedtVlrOMBem.SetFocus;
   end;
end;



procedure TfrmExecAcrescimoValor.CmeDetalheConfirma(Sender: TObject);
begin
	if ( (qryDetAtual <> nil) and (qryDetAtual.State in [dsInsert, dsEdit]) ) then begin

      if ( (qryDetAtual = qryImovelxBem) and (Modulo.bIntegraAtivo) ) then begin
         qryImovelxBemIDIMOVEL.asInteger := iImovel;
         qryImovelxBemIDPESSOA.asInteger := Sistema.idEmpresa;
      end;

      inherited;

      // totaliza os acréscimos (bem a bem) a cada gravação
      if qryDetAtual = qryImovelxBem then begin
         with qryImovelxBem do begin
            First;

            fTotAcrescimoOM   := 0;
            fTotAcrescimo     := 0;

            while not(EOF) do begin
               fTotAcrescimoOM   := fTotAcrescimoOM + qryImovelxBemVLROMBEM.asFloat;
               fTotAcrescimo     := fTotAcrescimo + qryImovelxBemVLRBEM.asFloat;

               Next;
            end;

         end;

         if qry.State in [dsInsert, dsEdit] then begin
            qryVLROPERACAOOM.asFloat  := fTotAcrescimoOM;
            qryVLROPERACAO.asFloat    := fTotAcrescimo;
         end;
      end;

   end;
end;



function TfrmExecAcrescimoValor.Efetiva: boolean;
begin
   Result := False;

   Screen.Cursor := crHourGlass;

   try
      try

         // Operação
         if not(GeraOperacao) then Exit;

         Result := True;

      except
         Result := False;
         Screen.Cursor := crDefault;
         Raise;
         Exit;
      end;

   finally
      Screen.Cursor := crDefault;
   end;
end;



function TfrmExecAcrescimoValor.BuscaForCli: integer;
begin
   with qryForCliXTipoOper do begin
      LimpaParametros(qryForCliXTipoOper);
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('TIPOOPER').asInteger      := StrToInt(DBcboTipoOper.LookupValue);
      Open;

      Result := -1;
      if not(isEmpty) then Result := qryForCliXTipoOperIDFORCLI.asInteger;

      Close;
   end;
end;



function TfrmExecAcrescimoValor.GeraOperacao: boolean;
var
   iPlano, iPlanilhaOper   : integer;
   iDocumentoOper          : integer;
   iResultOper             : shortint;
   sHistOper, sErro        : string;
   sObsOper, sRecPag       : string;
   dDataVencOper           : TDateTime;
   fNumDoc                 : extended;
   iFaturaOper             : integer;
begin
   Result := False;

   iPlano         := IntegraBack.Plano;
   iPlanilhaOper  := -1;
   fNumDoc        := 1;
   iFaturaOper    := -1;
   fNumDoc        := qryNUMDOCUMENTO.asFloat;
   sObsOper       := qryOBSERVACAO.asString;

   if ( (qryVLROPERACAO.asFloat <= 0) and (bIntegraCAPCAR) ) then begin

      Screen.Cursor := crDefault;
      MsgDlg('Não é possível lançar uma Operação desse tipo com valor negativo ou igual a ZERO.', 'Erro', mtError, [mbOk], 0);
      Repaint;

   end else begin

      // contabiliza, lança no CaP/CaR
      iResultOper := FuncoesImob.LancaOperInvest(Sistema.idEmpresa, Sistema.idModulo, 3{TipoInvest},
                     StrToInt(DBcboTipoOper.LookupValue), iOperacao, qryIDFORCLI.asInteger, iCarteira,
                     StrToInt(DBcboMoeda.LookupValue), iImovel, Modulo.iPrograma, Modulo.iPatroGlobal,
                     Modulo.iPlanoPrevGlobal, sTipoImovel, '', 'T'{tipo parcela},
                     DBcboCentroCustoAP.LookupValue, copy(qryOBSERVACAO.asString, 1, 60), edtReferenciaAP.Text,
                     memObs.Text, qryVLROPERACAOOM.asFloat, qryVLROPERACAO.asFloat, qryDATAOPERACAO.asDateTime,
                     qryDATAVENCOPER.asDateTime, True, False, iPlano, iPlanilhaOper,
                     iDocumentoOper, iFaturaOper, fNumDoc, sHistOper, sErro);

      if iResultOper >= -2 then begin

         // aqui, integra antes com o Ativo para o caso de venda, onde o Lucro precisa ser alimentado
         // antes da baixa
         if ( Modulo.bIntegraAtivo and bIntegraCAF ) then begin
            // se a operação gerar mudança nos valores do Ativo Fixo
            if not(IntegraCAF(sObsOper)) then Exit;
         end;

         if Modulo.bIntegraGestao then begin
            // movimenta Carteira e grava histórico
            if OperComum.AlimentaCarteira(Sistema.idEmpresa, Sistema.idModulo, iImovel,
            3{TipoInvest}, iOperacao, -1{LancImovel}, StrToInt(DBcboTipoOper.LookupValue), iCarteira,
            -1{DespesaOper}, -1{DespesaCarteira}, iPlanilhaOper, iDocumentoOper, IntegraBack.Plano,
            qryDATAOPERACAO.AsDateTime, qryVLROPERACAO.asCurrency, 0, Modulo.fVlrPrimeiraCota,
            0, 0, 0, 0, 0, 0, 0, 'M'{NaturMov}, 'M'{NaturOper}, ''{Lote}, sHistOper, 'OPE'{TipoMov},
            ''{flgCustodia}, sRecPag, True) <= 0 then Exit;
         end;

         Result := True;

      end else begin
         Case iResultOper of
            -3: MsgDlg('Houve falha na gravação da Operação!', 'Erro', mtError, [mbOk], 0);
            -4: MsgDlg('Foi encontrada ambigüidade nos padrões de lançamento da Operação!', 'Erro', mtError, [mbOk], 0);
            -5: MsgDlg('Não foi encontrado padrão de lançamento para a Operação desejada! Favor rever o cadastro.', 'Erro', mtError, [mbOk], 0);
            -6: MsgDlg('Não foi possível efetuar o lançamento contábil da Operação!', 'Erro', mtError, [mbOk], 0);
            -7: MsgDlg('Não foi possível efetuar o lançamento de Contas a Pagar/Receber da Operação!', 'Erro', mtError, [mbOk], 0);
         end;
      end;

   end;
end;



function TfrmExecAcrescimoValor.IntegraCAF(sObs: string): boolean;
var
   iBem, iAcrescimo  : integer;
   fTaxa             : double;
   fValor            : currency;
   sControle         : string;
   sRegistro         : string;
begin
   Result := False;

   try

      with qryImovelxBem do begin

         First;
         while not(EOF) do begin

            iBem        := qryImovelxBemIDBEM.asInteger;
            fValor      := qryImovelxBemVLRBEM.asFloat;
            sControle   := qryImovelxBemCONTROLE.asString;
            sRegistro   := qryImovelxBemREGISTRO.asString;

            // Tenta acrescer ou dar entrada em um bem de acordo com o status dele
            if ( (sControle = 'F') and (sRegistro = 'I') ) then begin // bem recém-cadastrado pelo Imobiliário
               if fValor > 0 then begin
                  if AtivoFixo.ExecutaEntradaTotal(Sistema.idModulo, Sistema.idEmpresa, iBem,
                  qryDATAOPERACAO.asDateTime, fValor, -1{SubConta}, -1, True) < 0 then Exit;
               end;
            end;

            if (sControle = 'T') then begin // bem já em Controle Total pelo Ativo
               if fValor > 0 then begin

                  iAcrescimo  := AtivoFixo.ExecutaAcrescimo(Sistema.idModulo, Sistema.idEmpresa, iBem,
                  qryDATAOPERACAO.asDateTime, fValor, sObs, -1, fTaxa, True);

                  if iAcrescimo > 0 then begin
                     RegistraOperXAcrescimo(iAcrescimo);
                  end else begin
                     Exit;
                  end;
               end;
            end;

            Next;

         end;
      end;

   except
      Screen.Cursor := crDefault;
      Raise;
      Exit;
   end;

   Result := True;
end;



procedure TfrmExecAcrescimoValor.RegistraOperXAcrescimo(iAcrescimo: integer);
begin
   with qryRegistraOperXAcrescimo do begin
      LimpaParametros(qryRegistraOperXAcrescimo);
      ParamByName('OPERACAO').asInteger   := iOperacao;
      ParamByName('ACRESCIMO').asInteger  := iAcrescimo;
      ExecSQL;
      Close;
   end;
end;



procedure TfrmExecAcrescimoValor.BuscaBem;
begin
   dtmMS.MS_Bem.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Bem.RetornouValor then begin
      Screen.Cursor := crHourGlass;

      qryImovelxBemIDBEM.asInteger := StrToInt(dtmMS.MS_Bem.ValoresChave[0]);

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecAcrescimoValor.ConverteValorOperacao;
var
   fValor, fValorOM  : currency;
   sMensagem         : string;
begin
   fValorOM    := qryVLROPERACAOOM.asFloat;
   fValor      := FuncoesImob.ConverteMoeda(qryMOECODIGO.AsInteger, fValorOM, DBedtDataVenc.Date, True);

   // verifica se houve conversão com a cotação de hoje...
   if fValor = -1 then begin
      sMensagem   := 'Não existe cotação atualizada para a Moeda selecionada!' + chr(13) +
                     'Deseja utilizar a última cotação cadastrada?';

      // não havendo, pergunta se deseja-se usar a última cotação cadastrada...
      if MsgDlg(sMensagem, 'Aviso', mtWarning, [mbYes, mbNo], 0) = mrYes then begin;
         Repaint;
         // tenta a conversão com a última cotação cadastrada...
         fValor := FuncoesImob.ConverteMoeda(qryMOECODIGO.AsInteger, fValorOM, qryDATAVENCOPER.AsDateTime, False);

         // se mesmo assim não for possível:
         if fValor = -1 then begin
            sMensagem   := 'Não existe cotação para a Moeda selecionada!' + chr(13) +
                           'Favor verificar.';

            MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
            Repaint;

            DBcboMoeda.SetFocus;

         end else begin

            qryVLROPERACAO.asFloat  := fValor;
            DBedtVlrOM.Modified     := False;

         end;

      end else begin
         // não se desejando fazer conversão pela última cotação cadastrada:
         Repaint;
         DBcboMoeda.SetFocus;
      end;

   end else begin

      // houve conversão; preenche os valores de acordo com pagar/receber
      qryVLROPERACAO.asFloat := fValor;
      DBedtVlrOM.Modified := False;

   end;
end;



procedure TfrmExecAcrescimoValor.ConverteValorBem;
var
   fValor, fValorOM  : currency;
   sMensagem         : string;
begin
   fValorOM    := DBedtVlrOMBem.Value;

   fValor      := FuncoesImob.ConverteMoeda(qryMOECODIGO.AsInteger, fValorOM, qryDATAVENCOPER.AsDateTime, True);

   // verifica se houve conversão com a cotação de hoje...
   if fValor = -1 then begin
      sMensagem   := 'Não existe cotação atualizada para a Moeda selecionada!' + chr(13) +
                     'Deseja utilizar a última cotação cadastrada?';

      // não havendo, pergunta se deseja-se usar a última cotação cadastrada...
      if MsgDlg(sMensagem, 'Aviso', mtWarning, [mbYes, mbNo], 0) = mrYes then begin;
         Repaint;
         // tenta a conversão com a última cotação cadastrada...
         fValor := FuncoesImob.ConverteMoeda(qryMOECODIGO.AsInteger, fValorOM, qryDATAVENCOPER.asDateTime, False);

         // se mesmo assim não for possível:
         if fValor = -1 then begin
            sMensagem   := 'Não existe cotação para a Moeda selecionada!' + chr(13) +
                           'Favor verificar.';

            MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
            Repaint;

            if DBcboMoeda.CanFocus then DBcboMoeda.SetFocus;

         end else begin

            qryImovelxBem.FieldByName('VLRBEM').asFloat  := fValor;
            DBedtVlrOMBem.Modified                       := False;

         end;

      end else begin
         // não se desejando fazer conversão pela última cotação cadastrada:
         Repaint;
         if DBcboMoeda.CanFocus then DBcboMoeda.SetFocus;
      end;

   end else begin

      // houve conversão; preenche os valores de acordo com pagar/receber
      qryImovelxBemVLRBEM.asFloat   := fValor;
      DBedtVlrOMBem.Modified        := False;

   end;
end;



function TfrmExecAcrescimoValor.VerificaPreenchimento: boolean;
var
   fTotRateioImovel : currency;
begin
   Result := False;

	try

      if ( DBcboTipoOper.LookupValue = '' )  then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação de Investimento!', DBcboTipoOper);

      if ( qryIDINVESTIMENTO.isNULL ) then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel!', btnBuscaImovel);

      if Modulo.bIntegraGestao then begin

         if ( qryIDCARTEIRAINVEST.isNULL ) then
            raise EValidacao.CreateVal('O Imóvel precisa pertencer pertencer a alguma Carteira de Investimentos!', btnBuscaImovel);

         if ( qryDESCTIPOIMOVEL.IsNull ) then
            raise EValidacao.CreateVal('O Imóvel precisa ter seu Tipo atribuído!', btnBuscaImovel);

      end;

      if DBcboMoeda.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Moeda da Operação!', DBcboMoeda);

      if qryDATAVENCOPER.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', DBedtDataVenc);

      if bIntegraCAPCAR then begin

         if ( qryVLROPERACAO.asFloat <= 0 ) then
            raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação de Investimento!', DBcboTipoOper);

         if ( qryIDFORCLI.isNULL ) then
            raise EValidacao.CreateVal('É necessário indicar o Credor/Debitado da Operação!', btnBuscaForCli);

      end;

      if qryOBSERVACAO.isNULL then
         raise EValidacao.CreateVal('É necessário preencher o campo "Observações"!', DBedtObsOper);

	except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

// Rateio dos Bens ---------------------------------------------------------------------------------

   if ( (Modulo.bIntegraAtivo) and (bIntegraCAF) ) then begin

      with qryImovelxBem do begin
         First;

         fTotRateioImovel  := 0;
         while not(EOF) do begin
            fTotRateioImovel  := fTotRateioImovel + FieldByName('IXBPERCENT').asFloat;
            Next;
         end;
      end;

      if fTotRateioImovel <> 100 then begin
         MsgDlg('O total do rateio dos Bens não perfaz 100%!', 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecAcrescimoValor.VerificaPreenchimentoDetalhe: boolean;
begin
   Result := False;

   // só verifica se estiver fazendo uma inclusão ou alteração
	if ( (qryDetAtual <> nil) and (qryDetAtual.State in [dsInsert, dsEdit]) ) then begin

// Bem ---------------------------------------------------------------------------------------------

      if qryDetAtual = qryImovelxBem then begin

         try

            if qryImovelxBemIXBGRUPO.isNULL then
               raise EValidacao.CreateVal('É necessário indicar o Grupo ao qual pertence o Bem!', DBcboGrupo);

            if qryImovelxBemIDBEM.isNULL then
               raise EValidacao.CreateVal('É necessário indicar o Bem!', btnBuscaBem);

            if qryImovelxBemVLRBEM.isNULL then
               raise EValidacao.CreateVal('É necessário indicar valor a ser acrescido ao Bem!', DBedtVlrOMBem);

         except

            on ev : EValidacao do begin
               if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
               Repaint;
               tbcDetalhe.TabIndex        := 1;
               pgctrlDetalhe.ActivePage   := tbsDet;
               if ev.Control.CanFocus then ev.Control.SetFocus;
               Exit;
            end;

         end;
      end;

// -------------------------------------------------------------------------------------------------

   end;

   Result := True;
end;



procedure TfrmExecAcrescimoValor.AbreQueries;
var
   sFormaAnt   : string;
   sCCAnt      : string;
begin
   with dtmLookImobiliario.qryLookTipoOperInvest do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoOperInvest);
      ParamByName('PNATUREZAOPERACAO').asString := 'M';
      ParamByName('PRECPAG').asString           := 'P';
      Open;
   end;

   dtmLookImobiliario.qryLookMoeda.Open;

   // Forma de Pagamento
   if DBcboFormaRecPag.LookupValue <> '' then sFormaAnt := DBcboFormaRecPag.LookupValue;
   with dtmLookImobiliario.qryLookFormaRecPag do begin
      LimpaParametros(dtmLookImobiliario.qryLookFormaRecPag);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString     := 'P';
      Open;
   end;
   if length(trim(sFormaAnt)) > 0 then DBcboFormaRecPag.LookupValue := sFormaAnt;

   // Centro de Custo
   if DBcboCentroCustoAP.LookupValue <> '' then sCCAnt := DBcboCentroCustoAP.LookupValue;
   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      ParamByName('PIDEMPRESA').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   // Traz também o Centro de Custo default, de acordo com os parâmetros do Sistema
   if length(trim(sCCAnt)) > 0 then begin
      DBcboCentroCustoAP.LookupValue := sCCAnt;
   end else begin
      if not(dtmImobiliario.qryParamImobCODCENTROCUSTO.isNULL) then begin
         DBcboCentroCustoAP.LookupValue := dtmImobiliario.qryParamImobCODCENTROCUSTO.AsString;
      end;
   end;
end;



procedure TfrmExecAcrescimoValor.FechaDetalhes;
begin
   qryImovelxBem.Close;
end;



procedure TfrmExecAcrescimoValor.FechaQueries;
var
   i : integer;
begin

   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;

   dtmLookImobiliario.qryLookTipoOperInvest.Close;
   dtmLookImobiliario.qryLookMoeda.Close;
end;



procedure TfrmExecAcrescimoValor.btnBuscaBemClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_Bem.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Bem.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      qryImovelxBemIDBEM.asInteger    := StrToInt(dtmMS.MS_Bem.ValoresChave[0]);
      qryImovelxBemCONTROLE.asString  := dtmMS.MS_Bem.ValoresChave[1];
      qryImovelxBemREGISTRO.asString  := dtmMS.MS_Bem.ValoresChave[2];

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecAcrescimoValor.bbtnConfirmarClick(Sender: TObject);
begin
   if ( VerificaPreenchimento and VerificaPreenchimentoDetalhe ) then begin
      Screen.Cursor := crHourGlass;

      inherited;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecAcrescimoValor.btnBuscaImovelClick(Sender: TObject);
var
   sMestre: string;
begin
   if qry.State in [dsInsert, dsEdit] then begin

      dtmMS.MS_ImovelAtivo.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
      if dtmMS.MS_ImovelAtivo.RetornouValor then begin

         Screen.Cursor := crHourGlass;

         iImovel  := StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[1]);
         sMestre  := dtmMS.MS_ImovelAtivo.ValoresChave[2];

         qryIMOVEL_EXTENSO.AsString    := dtmMS.MS_ImovelAtivo.ValoresChave[2] + ' - ' +
                                          dtmMS.MS_ImovelAtivo.ValoresChave[3];
         edtCarteira.Text              := dtmMS.MS_ImovelAtivo.ValoresChave[11];
         edtTipoImovel.Text            := dtmMS.MS_ImovelAtivo.ValoresChave[6];

         qryIDINVESTIMENTO.asInteger   := iImovel;
         sTipoImovel                   := dtmMS.MS_ImovelAtivo.ValoresChave[4];
         qryDESCTIPOIMOVEL.AsString    := sTipoImovel;

         if (dtmMS.MS_ImovelAtivo.ValoresChave[5] <> '') then begin
            iCarteira                     := StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[5]);
            qryIDCARTEIRAINVEST.asInteger := iCarteira;
         end;

         // abre a query de Bens
         with qryImovelxBem do begin
            LimpaParametros(qryImovelxBem);
            ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
            ParamByName('PIDIMOVEL').asInteger := iImovel;
            Open;
         end;

         Screen.Cursor := crDefault;
      end;

   end;

   btnBuscaImovel.SetFocus;
end;



procedure TfrmExecAcrescimoValor.FormCreate(Sender: TObject);
begin
   inherited;

	// adiciona o filtro por Empresa Proprietária nos MontaSelects
	MontaSelect.Filtro.Add('V.EMPRESAPROP = ' + IntToStr(Sistema.idEmpresa));
end;



procedure TfrmExecAcrescimoValor.sbtnApagarClick(Sender: TObject);
begin
   if CmeCadastro.Operacao = opIdle then begin

      CmeCadastro.Operacao := opApagar;

      if MsgDlg('Deseja realmente estornar esta Operação?', 'Estorno', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      end;

      if qry.isEmpty then begin
         CmeCadastro.Operacao := opVazio;
      end else begin
         CmeCadastro.Operacao := opIdle;
      end;

      CmeCadastro.AtualizaBotoes(self);
   end;
end;



procedure TfrmExecAcrescimoValor.DBedtVlrOMExit(Sender: TObject);
begin
   inherited;

   if ( ( sMoedaIni <> sMoedaFim) or (DBedtVlrOM.Modified) ) then begin
      if ( (DBcboMoeda.LookupValue <> '' ) and (qryVLROPERACAOOM.AsFloat > 0) ) then begin
         // se a Moeda e o ValorOM preenchidos, converte o valor
         ConverteValorOperacao;
      end;
   end;
end;



procedure TfrmExecAcrescimoValor.DBcboMoedaExit(Sender: TObject);
begin
   inherited;

   sMoedaFim := DBcboMoeda.LookupValue;
   if ( ( sMoedaIni <> sMoedaFim) or (DBedtVlrOM.Modified) ) then begin
      if ( (DBcboMoeda.LookupValue <> '' ) and (qryVLROPERACAOOM.AsFloat > 0) ) then begin
         // se a Moeda e o ValorOM preenchidos, converte o valor
         ConverteValorOperacao;
      end;
   end;
end;



procedure TfrmExecAcrescimoValor.DBcboMoedaEnter(Sender: TObject);
begin
   inherited;
   sMoedaIni := DBcboMoeda.LookupValue;
end;



procedure TfrmExecAcrescimoValor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Modulo.bIntegraGestao then begin
      // atualiza os saldos das carteiras
      OperComum.AtualizaSaldos(Modulo.fVlrPrimeiraCota, -1);
   end;

   FechaQueries;

   inherited;
end;



procedure TfrmExecAcrescimoValor.tbcDetalheChange(Sender: TObject);
begin
   Repaint;

   // para contornar a inconveniente gravação de registros em branco
   CmeDetalhe.Cancel(Self);

   // código para replicar o controle de query detalhe atual (presente no CadMestreDetalheCS):
   // a variável do pai que tem a mesma função não está disponível para os filhos
   grdDetAtual := TwwDBGrid(TComponent(sender).Owner.FindComponent(tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex]));
   if grdDetAtual <> nil then begin
	   qryDetAtual	:= TwwQuery(grdDetAtual.DataSource.DataSet);
   end else begin
      qryDetAtual	:= nil;
   end;

	inherited;

   // controle de habilitação dos botões detalhe
   sbtnInsDet.Visible      := True;
   sbtnAltDet.Visible      := True;
   sbtnExcluiDet.Visible   := True;
end;



procedure TfrmExecAcrescimoValor.qryImovelxBemCalcFields(DataSet: TDataSet);
begin
   inherited;

   if not(qryImovelxBemIDBEM.isNULL) then begin

      with qryPreencheBem do begin
         LimpaParametros(qryPreencheBem);
         ParamByName('PIDBEM').asInteger := qryImovelxBemIDBEM.asInteger;
         Open;
      end;

      qryImovelxBem.FieldByName('Placa').asFloat  := qryPreencheBemPLACA.asFloat;
      qryImovelxBem.FieldByName('Desc').asString  := qryPreencheBemDESBEM.asString;

   end;

   qryImovelxBem.FieldByName('Grupo').AsString := FuncoesImob.GrupoExtenso(qryImovelxBemIXBGRUPO.asString);
end;



procedure TfrmExecAcrescimoValor.bbtnOkDetClick(Sender: TObject);
begin
   if VerificaPreenchimentoDetalhe then inherited;
end;



procedure TfrmExecAcrescimoValor.DBcboTipoOperCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // armazena a Natureza da Operação (da Operação Principal)
   if DBcboTipoOper.LookupValue <> '' then begin
      bIntegraCAPCAR := dtmLookImobiliario.qryLookTipoOperInvestFLGGERACAPCAR.asInteger = 1;
      bIntegraCAF    := dtmLookImobiliario.qryLookTipoOperInvestFLGGERACAF.asInteger = 1;
   end else begin
      bIntegraCAPCAR := False;
      bIntegraCAF    := False;
   end;
end;



procedure TfrmExecAcrescimoValor.DBcboMoedaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if DBcboMoeda.LookupValue <> '' then begin
      edtMoedaBem.Text  := DBcboMoeda.Text;
   end else begin
      edtMoedaBem.Text  := '';
   end;
end;



procedure TfrmExecAcrescimoValor.DBedtVlrOMBemExit(Sender: TObject);
begin
   inherited;

   if ( ( sMoedaIni <> sMoedaFim) or (DBedtVlrOMBem.Modified) ) then begin
      if ( (DBcboMoeda.LookupValue <> '' ) and (DBedtVlrOMBem.Value > 0) ) then begin
         // se a Moeda e o ValorOM preenchidos, converte o valor
         ConverteValorBem;
      end;
   end;
end;



procedure TfrmExecAcrescimoValor.DBedtDataVencExit(Sender: TObject);
begin
   inherited;
   qryDATAOPERACAO.asDateTime := qryDATAVENCOPER.asDateTime;
end;



procedure TfrmExecAcrescimoValor.DBedtDataOperExit(Sender: TObject);
begin
   inherited;
   qryDATAVENCOPER.asDateTime := qryDATAOPERACAO.asDateTime;
end;



procedure TfrmExecAcrescimoValor.sbtnNovoBemClick(Sender: TObject);
begin
   inherited;

   Screen.Cursor := crHourGlass;

   Application.CreateForm(TfrmCadBem, frmCadBem);
   sbtnNovoBem.Down := False;
   frmCadBem.ShowModal;

   Repaint;

   Screen.Cursor := crDefault;
end;



procedure TfrmExecAcrescimoValor.btnBuscaForCliClick(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then begin

      dtmMS.MS_Forn.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca,
      if dtmMS.MS_Forn.RetornouValor then begin

         Screen.Cursor := crHourGlass;

         qryIDFORCLI.asInteger   := StrToInt(dtmMS.MS_Forn.ValoresChave[0]);
         qryNF_FORCLI.asString   := dtmMS.MS_Forn.ValoresChave[1];
         qryRS_FORCLI.AsString   := dtmMS.MS_Forn.ValoresChave[2];

      end;

   end;

   Screen.Cursor := crDefault;
end;



end.
