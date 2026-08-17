unit FCadPadraoContabil;

//	-------------------------------------------------------------------------------------------------
//
//	   Cadastro de Padrões de Lançamento
//
//	Autor             :	André Pontes
//	Data de Início    :  03/07/1999
//	Data de Término   :  03/07/1999
//
//	Modificações      :  05/07/1999  1) Critérios para esconder "orelhas" de Débito/Crédito/CAPCAR
//                                  2) Critérios para gravação de NULL
//                      17/07/1999  3) Correção da gravação do FLGPAGRECNAO
//                      19/07/1999  4) Correção dos critérios de gravação dos parâmetros contábeis
//                      06/10/1999  5) Na combo de Tipo de Recebimento / Desembolso, agora é exibido
//                                     também o código
//                      06/11/1999  6) Mudança de 'Tipo de Despesa' p/ 'Tipo de Rubrica'
//                                  7) Combo de Tipo de Rubrica agora está fora do TabControl
//                                  8) Correção do VerificaPreenchimento
//                      02/02/2000  9) Novo campo: TipCodigo (TipoPer)
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, DBCtrls, wwdblook, ExtCtrls, Buttons, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, TB97, Db, DBTables, Wwquery, Mask, Wwdatsrc, MontaSelect,
  FOkCancelarImob;

type
  TTipoConta = (tcCredito, tcDebito);
  TOperacao = (opVazio, opIdle, opInserir, opAlterar, opProcurar, opApagar);

  TfrmCadPadraoContabil = class(TFrmOkCancelarImob)
    Label1: TLabel;
    pgcIntegra: TPageControl;
    tbsIntegra: TTabSheet;
    Label4: TLabel;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInserir: TSpeedButton;
    sbtnAlterar: TSpeedButton;
    sbtnApagar: TSpeedButton;
    DBcboTipoOperacao: TwwDBLookupCombo;
    pgcPadraoLanc: TPageControl;
    tbsGeral: TTabSheet;
    Label15: TLabel;
    tbsDebito: TTabSheet;
    tbsCAPCAR: TTabSheet;
    Label26: TLabel;
    Label19: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    lblContaDebito: TLabel;
    mskContaDebito: TMaskEdit;
    btnBuscaContaDebito: TBitBtn;
    DBcboSubContaD: TwwDBLookupCombo;
    DBcboCentroCustoD: TwwDBLookupCombo;
    qryConta: TwwQuery;
    qryContaPLANO: TFloatField;
    qryContaPLACONTA: TStringField;
    qryContaPLANOME: TStringField;
    qryContaPLATIPO: TStringField;
    qryContaPLACCUST: TStringField;
    qryContaPLASUBCONTA: TStringField;
    qryLookTipoRecDes: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    qryLookCentroCusto: TwwQuery;
    StringField6: TStringField;
    StringField7: TStringField;
    qryLookSubConta: TwwQuery;
    Label6: TLabel;
    DBcboForCli: TwwDBLookupCombo;
    DBedtHistorico: TDBEdit;
    qryLookCentroRespon: TwwQuery;
    qryLookCentroResponNOME: TStringField;
    qryLookCentroResponCODCENTRORESPON: TStringField;
    qryLookUnidNegocio: TwwQuery;
    qryLookUnidNegocioNOME: TStringField;
    qryLookUnidNegocioUNIDNEGOC: TFloatField;
    qry: TwwQuery;
    upd: TUpdateSQL;
    ds: TwwDataSource;
    qryLookDespXTipoOper: TwwQuery;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField8: TStringField;
    MontaSelectConta: TMontaSelect;
    DBgrdHistorico: TwwDBGrid;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label2: TLabel;
    tbsCredito: TTabSheet;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    lblContaCredito: TLabel;
    mskContaCredito: TMaskEdit;
    btnBuscaContaCredito: TBitBtn;
    DBcboSubContaC: TwwDBLookupCombo;
    DBcboCentroCustoC: TwwDBLookupCombo;
    rdgRecPag: TDBRadioGroup;
    qryIDPADRLANCCONT: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDTIPODESPINVEST: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryCODTIPTITULO: TStringField;
    qryIDFORCLI: TFloatField;
    qryTIPLANCINVEST: TStringField;
    qryTIPMOVCARTINV: TStringField;
    qryRECPAG: TStringField;
    qryIDPESSOA: TFloatField;
    qryCODTIPRECDES: TStringField;
    qryHISTLANCINVEST: TStringField;
    qryFLGPAGRECNAO: TStringField;
    qryPLANO: TFloatField;
    qryCONTADOPERFIN: TStringField;
    qryCONTACOPERFIN: TStringField;
    qryIDEMPRESA: TFloatField;
    qryCENCUSTDINVEST: TStringField;
    qryCENCUSTCINVEST: TStringField;
    qryCODSUBCONTAD: TFloatField;
    qryCODSUBCONTAC: TFloatField;
    qryCODCENTRORESPON: TStringField;
    qryUNIDNEGOC: TFloatField;
    qryLookDespXTipoOperNATUREZAOPERACAO: TStringField;
    qryLookTipoImovel: TwwQuery;
    qryCODTIPIMOVEL: TStringField;
    Label12: TLabel;
    DBcboUnidNegoc: TwwDBLookupCombo;
    qryLookTipoImovelDESCTIPOIMOVEL: TStringField;
    qryLookDespXTipoOperRECPAG: TStringField;
    lblTipo: TLabel;
    DBcboDespesa: TwwDBLookupCombo;
    Bevel1: TBevel;
    Label3: TLabel;
    Label13: TLabel;
    qryLookTipOper: TwwQuery;
    qryLookTipOperTIPDESCRICAO: TStringField;
    qryLookTipOperTIPCODIGO: TStringField;
    DBcboTipOper: TwwDBLookupCombo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    qryTIPCODIGO: TStringField;
    qryVerificaConta: TwwQuery;
    dsTipoOperacao: TwwDataSource;
    qryLookTipoOperacao: TwwQuery;
    qryLookTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryLookTipoOperacaoIDTIPOINVEST: TFloatField;
    qryLookTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryLookTipoOperacaoRECPAG: TStringField;
    qryLookTipoOperacaoNATUREZAOPERACAO: TStringField;
    qryLookTipoOperacaoFLGGERACONTAB: TFloatField;
    qryLookTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryLookForCli: TwwQuery;
    qryLookForCliNOME: TStringField;
    qryLookForCliIDPESSOA: TFloatField;

    procedure btnBuscaContaDebitoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure DBcboTipoOperacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBgrdHistoricoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean;AFont: TFont; ABrush: TBrush);
    procedure DBgrdHistoricoTopRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBcboDespesaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure btnBuscaContaCreditoClick(Sender: TObject);
    procedure qryBeforeEdit(DataSet: TDataSet);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure mskContaCreditoExit(Sender: TObject);
    procedure mskContaDebitoExit(Sender: TObject);


  private { Private declarations }
    bObrigaSubConta     : boolean;
    bObrigaCentroCusto  : boolean;

    procedure HabilitaOkCancelar(bHabilita: Boolean);

    procedure AtualizaBotoes;

    procedure FazerInsert;
    procedure FazerEdit;
    procedure FazerConfirma;
    procedure FazerCancel;
    procedure FazerDelete;

    procedure FiltraRecPag;

    function VerificaPreenchimento: boolean;

    function VerificaContaContabil(tConta: TTipoconta): boolean;
    procedure FiltraContabilidade(tConta: TTipoconta);

    procedure AbreQueries;
    procedure FechaQueries;


  public { Public declarations }
    Operacao         : TOperacao;
    FazendoCloseOpen : Boolean;

  end;



var
  frmCadPadraoContabil: TfrmCadPadraoContabil;



implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, UModulo, uComunsImobiliario, uVerificaPreenchimento,
  UAutorizacao, UIntegraBack, uFuncoesImob;



procedure TfrmCadPadraoContabil.HabilitaOkCancelar(bHabilita: Boolean);
begin
   bbtnConfirmar.Enabled := bHabilita;
   bbtnCancelar.Enabled  := bHabilita;
end;



procedure TfrmCadPadraoContabil.FazerInsert;
begin
   DBgrdHistorico.Enabled := False;

	AbreQueries;

	// abre a query principal contendo zero registros
   qry.Open;

   FazerCancel;
   qry.Insert;

   qry.FieldByName('IDTIPOINVEST').asInteger    := 3;
   qry.FieldByName('IDTIPOOPERACAO').asInteger  := StrToInt(DBcboTipoOperacao.LookupValue);

   qry.FieldByName('IDPESSOA').asInteger        := Sistema.idEmpresa;
   qry.FieldByName('IDEMPRESA').asInteger       := Sistema.idEmpresa;
end;



procedure TfrmCadPadraoContabil.FazerEdit;
begin
   DBgrdHistorico.Enabled := False;

   qry.Edit;

   DBcboTipoOperacao.Enabled := False;
end;



procedure TfrmCadPadraoContabil.FazerConfirma;
begin
   if qry.State = dsInsert then begin
      // grava o id
      qry.FieldByName('IDPADRLANCCONT').asInteger := LeUltRegistro(nil, 'PADRLANCCONTINV');
   end;

   if qry.State in [dsInsert, dsEdit] then begin

      // grava o Tipo de Lançamento e o Tipo de Movimentação
      qry.FieldByName('TIPLANCINVEST').asString := 'N';

      if qry.FieldByName('IDTIPODESPINVEST').isNULL then begin
         qry.FieldByName('TIPMOVCARTINV').asString := 'OPE';
         qry.FieldByName('FLGPAGRECNAO').asString  := qryLookTipoOperacao.FieldByName('RECPAG').asString;
      end else begin
         qry.FieldByName('TIPMOVCARTINV').asString := 'DOP';
         qry.FieldByName('FLGPAGRECNAO').asString  := qryLookDespXTipoOper.FieldByName('RECPAG').asString;
      end;

      // gravação dos parâmetros contábeis
      if ( tbsDebito.TabVisible and tbsCredito.TabVisible ) then begin
         // grava as contas contábeis
         qry.FieldByName('PLANO').asInteger        := IntegraBack.Plano;
         qry.FieldByName('CONTADOPERFIN').asString := mskContaDebito.Text;
         qry.FieldByName('CONTACOPERFIN').asString := mskContaCredito.Text;
      end else begin
         qry.FieldByName('PLANO').Value            := NULL;
         qry.FieldByName('CONTADOPERFIN').Value    := NULL;
         qry.FieldByName('CONTACOPERFIN').Value    := NULL;
         qry.FieldByName('CODSUBCONTAD').Value     := NULL;
         qry.FieldByName('CENCUSTDINVEST').Value   := NULL;
         qry.FieldByName('CODSUBCONTAC').Value     := NULL;
         qry.FieldByName('CENCUSTCINVEST').Value   := NULL;
      end;

      // processamento para gravação de NULL nos parâmetros de CAPCAR
      if not(tbsCAPCAR.TabVisible) then begin
         qry.FieldByName('CODTIPRECDES').Value     := NULL;
         qry.FieldByName('CODCENTRORESPON').Value  := NULL;
      end;

   end;

   try
      AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
   except
      Raise;
      Repaint;
   end;

   with qry do begin
      LimpaParametros(qry);
      ParamByName('INVEST').asInteger  := 3;
      ParamByName('OPER').asInteger    := StrToInt(DBcboTipoOperacao.LookupValue);
      Open;
   end;

   DBcboTipoOperacao.Enabled  := True;
   DBgrdHistorico.Enabled     := True;

   mskContaDebito.Clear;
   mskContaCredito.Clear;
end;



procedure TfrmCadPadraoContabil.FazerCancel;
begin
   if qry.Active then qry.CancelUpdates;

   DBcboTipoOperacao.Enabled  := True;
   DBgrdHistorico.Enabled     := True;
end;



procedure TfrmCadPadraoContabil.FazerDelete;
begin
   qry.Delete;
   FazerConfirma;
end;



procedure TfrmCadPadraoContabil.FiltraRecPag;
var
   sRecPag : string;
begin
   sRecPag := qryLookTipoOperacao.FieldByName('RECPAG').asString;

   with qryLookTipoRecDes do begin
      LimpaParametros(qryLookTipoRecDes);

      Params[0].asInteger     := Sistema.idEmpresa;

      if DBcboTipoOperacao.LookupValue <> '' then begin
         Params[1].asString   := sRecPag
      end else begin
         Params[1].asString   := '';
      end;

      Open;
   end;

   // mascara os Tipos de Recebimento / Desembolso
   Case sRecPag[1] of
      'P': qryLookTipoRecDes.FieldByName('CODTIPRECDES').EditMask   := trim(Modulo.sMascaraDesemb) + ';0; ';
      'R': qryLookTipoRecDes.FieldByName('CODTIPRECDES').EditMask   := trim(Modulo.sMascaraReceb) + ';0; ';
   end;
end;



function TfrmCadPadraoContabil.VerificaPreenchimento: boolean;
begin
   Result := False;

// -- Painel Principal -----------------------------------------------------------------------------

	try

      if DBcboTipoOperacao.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação!', DBcboTipoOperacao);

   except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;


// -- página Geral -----------------------------------------------------------------------------

	try

      if ( tbsDebito.TabVisible and tbsCredito.TabVisible ) then begin

         if ( (qry.FieldByName('HISTLANCINVEST').isNULL) ) then
            raise EValidacao.CreateVal('É necessário indicar o Histórico!', DBcboUnidNegoc);

         if ( (qry.FieldByName('UNIDNEGOC').isNULL) or (DBcboUnidNegoc.LookupValue = '') ) then
            raise EValidacao.CreateVal('É necessário indicar a Atividade / Projeto!', DBcboUnidNegoc);

      end;

   except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         pgcPadraoLanc.ActivePage := tbsGeral;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

// -- página de Débito -----------------------------------------------------------------------------

	try

      if ( tbsDebito.TabVisible and tbsCredito.TabVisible ) then begin

         if length(trim(mskContaDebito.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar a Conta Contábil de débito!', btnBuscaContaDebito);

         if DBcboCentroCustoD.Enabled then
            if DBcboCentroCustoD.LookupValue = '' then
               raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentroCustoD);

         if length(trim(DBcboTipOper.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação (Contábil)!', DBcboTipOper);

      end;

   except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         pgcPadraoLanc.ActivePage := tbsDebito;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

// -- página de Crédito ----------------------------------------------------------------------------

	try

      if ( tbsDebito.TabVisible and tbsCredito.TabVisible ) then begin

         if length(trim(mskContaCredito.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar a Conta Contábil de crébito!', btnBuscaContaCredito);

         if DBcboCentroCustoC.Enabled then
            if DBcboCentroCustoC.LookupValue = '' then
               raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentroCustoC);

         if length(trim(DBcboTipOper.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação (Contábil)!', DBcboTipOper);

      end;

   except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         pgcPadraoLanc.ActivePage := tbsCredito;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

// -- página de CaP/CaR ----------------------------------------------------------------------------

	try

      if ( tbsCAPCAR.TabVisible ) then begin

         if DBcboTipoRecDes.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário indicar o Tipo de Recebimento / Desembolso!', DBcboTipoRecDes);

         if DBcboCentroRespon.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário indicar o Centro de Responsabilidade!', DBcboCentroRespon);

      end;

   except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         pgcPadraoLanc.ActivePage := tbsCAPCAR;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

// -------------------------------------------------------------------------------------------------

   Result := True;
end;



function TfrmCadPadraoContabil.VerificaContaContabil(tConta: TTipoconta): boolean;
var
   s:     string;
   mask: TMaskEdit;
begin
   Result := False;
   Screen.Cursor := crHourGlass;

   try

      try

         Case tConta of
            tcCredito: mask   := mskContaCredito;
            tcDebito: mask    := mskContaDebito;
            else mask := nil;
         end;

         s := trim(mask.Text);
         if length(s) > 0 then begin

            // verifica se existe a conta digitada (para ser + rápido', a query só dá COUNT)
            with qryVerificaConta do begin
               LimpaParametros(qryVerificaConta);
               Params[0].asInteger  := IntegraBack.Plano;
               Params[1].asString   := s;
               Open;

               // se não há registros, a Conta não existe
               if qryVerificaConta.isEmpty then begin
                  raise EValidacao.CreateVal('Essa Conta Contábil não é válida!', mask);
               end else begin

                  bObrigaSubConta := FieldByName('PLASUBCONTA').asString = 'S';
                  bObrigaCentroCusto := FieldByName('PLACCUST').asString = 'S';

                  Case tConta of
                     tcCredito:  lblContaCredito.Caption := FieldByName('PLANOME').asString;
                     tcDebito:   lblContaDebito.Caption  := FieldByName('PLANOME').asString;
                  end;
               end;

            end;

         end else begin

            Case tConta of
               tcCredito:  lblContaCredito.Caption := '';
               tcDebito:   lblContaDebito.Caption  := '';
            end;

         end;

      except

         on ev : EValidacao do begin
            Screen.Cursor := crDefault;
            if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
            Repaint;
            if ev.Control.CanFocus then ev.Control.SetFocus;
            Exit;
         end;

      end;

      Result := True;

   finally
      qryVerificaConta.Close;
      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmCadPadraoContabil.FiltraContabilidade(tConta: TTipoconta);
begin
   // verifica se a Conta admite SubContas; se admitir, abre a tabela SubConta e habilita as combos
   Case tConta of

      tcCredito:
      if bObrigaSubConta then begin
         qryLookSubConta.Open;
         DBcboSubContaC.Enabled   := True;
      end else begin
         qryLookSubConta.Close;
         DBcboSubContaC.Clear;
         DBcboSubContaC.Enabled   := False;
      end;

      tcDebito:
      if bObrigaSubConta then begin
         qryLookSubConta.Open;
         DBcboSubContaD.Enabled   := True;
      end else begin
         qryLookSubConta.Close;
         DBcboSubContaD.Clear;
         DBcboSubContaD.Enabled   := False;
      end;

   end;

   Case tConta of

      tcCredito:
      if bObrigaCentroCusto then begin
         with qryLookCentroCusto do begin
            LimpaParametros(qryLookCentroCusto);
            Params[1].asString   := trim(mskContaCredito.Text);
            Params[2].asInteger  := Sistema.idEmpresa;
            Open;
         end;
         qryLookCentroCusto.Open;
         DBcboCentroCustoC.Enabled   := True;
      end else begin
         qryLookCentroCusto.Close;
         DBcboCentroCustoC.Clear;
         DBcboCentroCustoC.Enabled   := False;
      end;

      tcDebito:
      if bObrigaCentroCusto then begin
         with qryLookCentroCusto do begin
            LimpaParametros(qryLookCentroCusto);
            Params[1].asString   := trim(mskContaDebito.Text);
            Params[2].asInteger  := Sistema.IdEmpresa;
            Open;
         end;
         qryLookCentroCusto.Open;
         DBcboCentroCustoD.Enabled   := True;
      end else begin
         qryLookCentroCusto.Close;
         DBcboCentroCustoD.Clear;
         DBcboCentroCustoD.Enabled   := False;
      end;
   end;
end;



procedure TfrmCadPadraoContabil.AbreQueries;
begin
   with qryLookUnidNegocio do begin
      LimpaParametros(qryLookUnidNegocio);
      Params[0].asInteger := Sistema.idEmpresa;
      Open;
   end;

   with qryLookCentroRespon do begin
      LimpaParametros(qryLookCentroRespon);
      Params[0].asInteger := Sistema.idEmpresa;
      Open;
   end;

   qryLookTipOper.Open;
   qryLookTipoImovel.Open;
   qryLookForCli.Open;
   qryLookTipoOperacao.Open;
end;



procedure TfrmCadPadraoContabil.FechaQueries;
begin
   qry.Close;
   qry.Unprepare;

   qryLookTipoOperacao.Close;
   qryLookTipoOperacao.Unprepare;

   qryLookDespXTipoOper.Close;
   qryLookDespXTipoOper.Unprepare;
end;



procedure TfrmCadPadraoContabil.AtualizaBotoes;
var
   ConfirmaVisible : Boolean;
begin
   { Configura o estado dos botões }

   sbtnInserir.Enabled  := False;
   sbtnAlterar.Enabled  := False;
   sbtnApagar.Enabled   := False;

   case Operacao of

      opVazio:
      begin
         sbtnInserir.Down     := False;
         sbtnAlterar.Down     := False;
         sbtnApagar.Down      := False;
         sbtnInserir.Enabled  := True;
         sbtnAlterar.Enabled  := False;
         sbtnApagar.Enabled   := False;

         ConfirmaVisible := False;
      end;

      opIdle:
      begin
         HabilitaOkCancelar(False);

         sbtnInserir.Down     := False;
         sbtnAlterar.Down     := False;
         sbtnApagar.Down      := False;
         sbtnInserir.Enabled  := True;

         if (qry.Active) and (not qry.IsEmpty) then begin
            sbtnAlterar.Enabled  := True;
            sbtnApagar.Enabled   := True;
         end else begin
            sbtnAlterar.Enabled  := False;
            sbtnApagar.Enabled   := False;
         end;
         ConfirmaVisible := False;
      end;

      opInserir :
      begin
         HabilitaOkCancelar(True);
         sbtnInserir.Down     := True;
         sbtnInserir.Enabled  := True;
         ConfirmaVisible      := True;
      end;

      opAlterar :
      begin
         HabilitaOkCancelar(True);
         sbtnAlterar.Down     := True;
         sbtnAlterar.Enabled  := True;
         ConfirmaVisible      := True;
      end;

      opProcurar :
      begin
         HabilitaOkCancelar(True);
         ConfirmaVisible := False;
      end;

      opApagar :
      begin
         HabilitaOkCancelar(True);
         sbtnApagar.Down      := False;
         sbtnApagar.Enabled   := True;
         ConfirmaVisible      := False;
      end;

      else begin
         ConfirmaVisible := False;
         HabilitaOkCancelar(True);
      end;

   end;

   bbtnConfirmar.Enabled   := ConfirmaVisible;
   bbtnCancelar.Enabled    := ConfirmaVisible;

   AutorizarForm(afSoDesabilitar);

   if DBcboTipoOperacao.LookupValue <> '' then begin

      // habilita a inserção se os parâmetros estiverem preenchidos
      sbtnInserir.Enabled     := True;

      // só habilita alteração e exclusão se houver registros na query
      if not(qry.IsEmpty) then begin
         sbtnAlterar.Enabled  := True;
         sbtnApagar.Enabled   := True;
      end;

   end else begin

      // desabilita tudo os parâmetros não estiverem preenchidos
      sbtnInserir.Enabled     := False;
      sbtnAlterar.Enabled     := False;
      sbtnApagar.Enabled      := False;

   end;
end;



procedure TfrmCadPadraoContabil.btnBuscaContaDebitoClick(Sender: TObject);
begin
   inherited;
   MontaSelectConta.Executar;
   Repaint;
   if MontaSelectConta.RetornouValor then begin
      mskContaDebito.Text := MontaSelectConta.ValoresChave[0];
      if mskContaDebito.CanFocus then mskContaDebito.SetFocus;
   end;
end;



procedure TfrmCadPadraoContabil.FormCreate(Sender: TObject);
begin
   inherited;

   if Modulo.bIntegraContab then begin
      mskContaDebito.EditMask    := trim(IntegraBack.MascaraPlano) + ';0; ';
      mskContaCredito.EditMask   := trim(IntegraBack.MascaraPlano) + ';0; ';

      MontaSelectConta.Mascaras[0] := trim(IntegraBack.MascaraPlano) + ';0; ';
      MontaSelectConta.Filtro.Add('PLANOCONTA.PLANO = ' + IntToStr(IntegraBack.Plano));
   end;

   tbsDebito.TabVisible    := False;
   tbsCredito.TabVisible   := False;
   tbsCAPCAR.TabVisible    := False;

   FazendoCloseOpen := False;

   if qry.isEmpty then begin
      Operacao := opVazio
   end else begin
      Operacao := opIdle;
   end;

   AtualizaBotoes;
end;



procedure TfrmCadPadraoContabil.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin

      Screen.Cursor := crHourGlass;

      FazerConfirma;

      if qry.IsEmpty then begin
         Operacao := opVazio
      end else begin
         Operacao := opIdle;
      end;

      AtualizaBotoes;

      Screen.Cursor := crDefault;

      inherited;
   end;
end;



procedure TfrmCadPadraoContabil.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   FazerCancel;

   if qry.isEmpty then begin
      Operacao  := opVazio
   end else begin
       Operacao := opIdle;
   end;

   AtualizaBotoes;
end;



procedure TfrmCadPadraoContabil.sbtnInserirClick(Sender: TObject);
begin
   inherited;

   Operacao  := opInserir;

   AtualizaBotoes;
   FazerInsert;
end;



procedure TfrmCadPadraoContabil.sbtnAlterarClick(Sender: TObject);
begin
   inherited;

   if not(Operacao in [opIdle, opVazio]) then bbtnCancelarClick(Self);

   if not(qry.isEmpty) then begin
      Operacao := opAlterar;
      AtualizaBotoes;
      FazerEdit;
   end;
end;



procedure TfrmCadPadraoContabil.sbtnApagarClick(Sender: TObject);
begin
   inherited;

   if Operacao = opIdle then begin
      Operacao := opApagar;
      AtualizaBotoes;

      if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then FazerDelete;

      if qry.IsEmpty then begin
         Operacao := opVazio;
      end else begin
         Operacao := opIdle;
      end;

   end;

   AtualizaBotoes;
end;



procedure TfrmCadPadraoContabil.DBcboTipoOperacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   qry.Close;
   pgcIntegra.Enabled := DBcboTipoOperacao.LookupValue <> '';

   AbreQueries;

   if DBcboTipoOperacao.LookupValue <> '' then begin

      with qry do begin
         LimpaParametros(qry);
         ParamByName('INVEST').asInteger  := 3;
         ParamByName('OPER').asInteger    := StrToInt(DBcboTipoOperacao.LookupValue);
         Open;
      end;

      with qryLookDespXTipoOper do begin
         LimpaParametros(qryLookDespXTipoOper);
         ParamByName('INVEST').asInteger  := 3;
         ParamByName('OPER').asInteger    := StrToInt(DBcboTipoOperacao.LookupValue);
         Open;
      end;

   end;


   if ( (DBcboDespesa.LookupValue = '') or (length(trim(DBcboDespesa.Text)) = 0) ) then begin

      tbsDebito.TabVisible    := ( (Modulo.bIntegraContab) and (qryLookTipoOperacao.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCredito.TabVisible   := ( (Modulo.bIntegraContab) and (qryLookTipoOperacao.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCAPCAR.TabVisible    := ( (Modulo.bIntegraCAPCAR) and (qryLookTipoOperacao.FieldByName('FLGGERACAPCAR').asInteger = 1) );

   end else begin

      tbsDebito.TabVisible    := ( (Modulo.bIntegraContab) and (qryLookDespXTipoOper.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCredito.TabVisible   := ( (Modulo.bIntegraContab) and (qryLookDespXTipoOper.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCAPCAR.TabVisible    := ( (Modulo.bIntegraCAPCAR) and (qryLookDespXTipoOper.FieldByName('FLGGERACAPCAR').asInteger = 1) );

   end;

   if qry.isEmpty then begin
      Operacao := opVazio;
   end else begin
      Operacao := opIdle;
   end;

   AtualizaBotoes;

   FiltraRecPag;
end;



procedure TfrmCadPadraoContabil.DBgrdHistoricoCalcCellColors(Sender: TObject; Field: TField;
State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadPadraoContabil.DBgrdHistoricoTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   DBgrdHistorico.Invalidate;
end;



procedure TfrmCadPadraoContabil.FormShow(Sender: TObject);
begin
   inherited;
   Repaint;
   Screen.Cursor := crHourGlass;
   AbreQueries;
   Screen.Cursor := crDefault;
end;



procedure TfrmCadPadraoContabil.DBcboDespesaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if ( (DBcboDespesa.LookupValue = '') or (length(trim(DBcboDespesa.Text)) = 0) ) then begin

      tbsDebito.TabVisible    := ( (Modulo.bIntegraContab) and (qryLookTipoOperacao.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCredito.TabVisible   := ( (Modulo.bIntegraContab) and (qryLookTipoOperacao.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCAPCAR.TabVisible    := ( (Modulo.bIntegraCAPCAR) and (qryLookTipoOperacao.FieldByName('FLGGERACAPCAR').asInteger = 1) );

   end else begin

      tbsDebito.TabVisible    := ( (Modulo.bIntegraContab) and (qryLookDespXTipoOper.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCredito.TabVisible   := ( (Modulo.bIntegraContab) and (qryLookDespXTipoOper.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCAPCAR.TabVisible    := ( (Modulo.bIntegraCAPCAR) and (qryLookDespXTipoOper.FieldByName('FLGGERACAPCAR').asInteger = 1) );

   end;
end;




procedure TfrmCadPadraoContabil.btnBuscaContaCreditoClick(Sender: TObject);
begin
   inherited;
   MontaSelectConta.Executar;
   Repaint;
   if MontaSelectConta.RetornouValor then begin
      mskContaCredito.Text := MontaSelectConta.ValoresChave[0];
      mskContaCredito.SetFocus;
   end;
end;



procedure TfrmCadPadraoContabil.qryBeforeEdit(DataSet: TDataSet);
begin
   inherited;

   mskContaDebito.Text  := qry.FieldByName('CONTADOPERFIN').asString;
   mskContaCredito.Text := qry.FieldByName('CONTACOPERFIN').asString;
end;



procedure TfrmCadPadraoContabil.dsDataChange(Sender: TObject; Field: TField);
begin
   inherited;

   // preeenche a conta contábil de débito
   mskContaDebito.Text        := qry.FieldByName('CONTADOPERFIN').asString;
   mskContaDebito.Modified    := False;

   // preeenche a conta contábil de crédito
   mskContaCredito.Text       := qry.FieldByName('CONTACOPERFIN').asString;
   mskContaCredito.Modified   := False;

   if ( (DBcboDespesa.LookupValue = '') or (length(trim(DBcboDespesa.Text)) = 0) ) then begin

      tbsDebito.TabVisible    := ( (Modulo.bIntegraContab) and (qryLookTipoOperacao.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCredito.TabVisible   := ( (Modulo.bIntegraContab) and (qryLookTipoOperacao.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCAPCAR.TabVisible    := ( (Modulo.bIntegraCAPCAR) and (qryLookTipoOperacao.FieldByName('FLGGERACAPCAR').asInteger = 1) );

   end else begin

      tbsDebito.TabVisible    := ( (Modulo.bIntegraContab) and (qryLookDespXTipoOper.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCredito.TabVisible   := ( (Modulo.bIntegraContab) and (qryLookDespXTipoOper.FieldByName('FLGGERACONTAB').asInteger = 1) );
      tbsCAPCAR.TabVisible    := ( (Modulo.bIntegraCAPCAR) and (qryLookDespXTipoOper.FieldByName('FLGGERACAPCAR').asInteger = 1) );

   end;
end;



procedure TfrmCadPadraoContabil.mskContaCreditoExit(Sender: TObject);
begin
   inherited;

   if mskContaCredito.Modified then begin
      if qry.State in [dsInsert, dsEdit] then begin
         if VerificaContaContabil(tcCredito) then begin
            FiltraContabilidade(tcCredito);
            if DBcboSubContaC.Enabled then begin
               DBcboSubContaC.SetFocus;
            end else begin
               if DBcboCentroCustoC.Enabled then DBcboCentroCustoC.SetFocus;
            end;
         end;
      end;
      mskContaCredito.Modified := False;
   end;
end;



procedure TfrmCadPadraoContabil.mskContaDebitoExit(Sender: TObject);
begin
   inherited;

   if mskContaDebito.Modified then begin
      if qry.State in [dsInsert, dsEdit] then begin
         if VerificaContaContabil(tcDebito) then begin
            FiltraContabilidade(tcDebito);
            if DBcboSubContaD.Enabled then begin
               DBcboSubContaD.SetFocus;
            end else begin
               if DBcboCentroCustoD.Enabled then DBcboCentroCustoD.SetFocus;
            end;
         end;
      end;
      mskContaDebito.Modified := False;
   end;
end;



end.
