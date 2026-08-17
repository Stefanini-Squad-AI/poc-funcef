unit FExecBaixaBem;

//	-------------------------------------------------------------------------------------------------
//
//	   Cadastro de Despesas por Tipo de Operação
//
//	Autor             :	André Pontes
//	Data de Início    :  20/01/2000
//	Data de Término   :  21/01/2000
//
//	Modificações      :  24/01/2000  1) Filtragem dos tipos de rubrica de lucro/prejuízo, baseada no
//                                     tipo de operação e na natureza das rubricas ('O'/'U')
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, DBCtrls, Db, DBTables, Wwquery, Wwdatsrc, Mask, MontaSelect;

type
  TOperacao = (opVazio, opIdle, opInserir, opAlterar, opProcurar, opApagar);

  TfrmExecBaixaBem = class(TfrmOkCancelar)
    pgcBens: TPageControl;
    tbsBens: TTabSheet;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInserir: TSpeedButton;
    sbtnAlterar: TSpeedButton;
    sbtnApagar: TSpeedButton;
    qry: TwwQuery;
    qryLookTipoOper: TwwQuery;
    qryLookTipoDespesa: TwwQuery;
    upd: TUpdateSQL;
    ds: TwwDataSource;
    qryLookTipoOperIDTIPOINVEST: TFloatField;
    qryLookTipoOperIDTIPOOPERACAO: TFloatField;
    qryLookTipoOperDESCTIPOOPERACAO: TStringField;
    qryLookTipoOperRECPAG: TStringField;
    pnlDetalhe: TPanel;
    DBgrd: TwwDBGrid;
    Panel1: TPanel;
    Label5: TLabel;
    btnBuscaImovel: TBitBtn;
    edtNomeMestre: TEdit;
    edtNomeImovel: TEdit;
    Label1: TLabel;
    DBedtPlaca: TDBEdit;
    Label36: TLabel;
    Label49: TLabel;
    DBedtDescricaoBem: TDBEdit;
    Label48: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Bevel1: TBevel;
    spdSelecionar: TSpeedButton;
    DBcboMoeda: TwwDBLookupCombo;
    qryGrupo: TStringField;
    qryIDBEM: TFloatField;
    qryIDIMOVEL: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIXBGRUPO: TStringField;
    qryPLACA: TFloatField;
    qryDESBEM: TStringField;
    qryLookMoeda: TwwQuery;
    qryLookMoedaMOESIGLA: TStringField;
    qryLookMoedaMOECODIGO: TFloatField;
    qryLookMoedaMOEDESC: TStringField;
    Label14: TLabel;
    DBcboForCliOper: TwwDBLookupCombo;
    qryLookTipoOperNATUREZAOPERACAO: TStringField;
    qryInsertRubrica: TwwQuery;
    qryLookForCli: TwwQuery;
    qryLookForCliIDFORCLI: TFloatField;
    qryLookForCliIDPESSOA: TFloatField;
    qryLookForCliNOME: TStringField;
    edtVlrOM: TRealEdit;
    edtVlr: TRealEdit;
    qryLookTipoOperFLGGERACAF: TFloatField;
    qryLookTipoDespesaIDTIPODESPINVEST: TFloatField;
    qryLookTipoDespesaDESCTIPODESPINV: TStringField;
    qryLookTipoDespesaNATUREZAOPERACAO: TStringField;
    qryLookTipoDespesaIDTIPOOPERACAO: TFloatField;
    qryLookTipoDespesaRECPAG: TStringField;
    Label3: TLabel;
    Label7: TLabel;
    lblLucroPreju: TLabel;
    Label42: TLabel;
    edtDataVenc: TCMDateTimePicker;
    edtDataOper: TCMDateTimePicker;
    DBcboLucroPreju: TwwDBLookupCombo;
    DBcboTipoOper: TwwDBLookupCombo;
    qryLookTipoOperFLGGERACAPCAR: TFloatField;
    qryInsertOperacao: TwwQuery;
    Label8: TLabel;
    edtObservacao: TEdit;

    // procedimentos definidos
    procedure AtualizaBotoes;

    procedure CmeCadastro.Edit (Self);
    procedure CmeCadastro.Confirma(Self);
    procedure CmeCadastro.Cancel(Self);
    procedure CmeCadastro.Delete(Self);

    procedure LimpaCampos;
    function VerificaPreenchimento: boolean;

    function GeraOperacao: boolean;
    function RegistraDespesa(fLucroPreju: currency): integer;
    function IntegraCAF(fVlrCAF: currency): boolean;

    procedure ConverteValorBaixa;

    procedure AbreQueries;
    procedure FechaQueries;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBgrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdTopRowChanged(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure spdSelecionarClick(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure edtVlrOMExit(Sender: TObject);
    procedure DBcboTipoOperCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure edtDataOperExit(Sender: TObject);



  private { Private declarations }
   iImovel, iCarteira, iMoeda : integer;
   iOperacao, iTipoOper       : integer;
   sTipoImovel, sNaturezaOper : string;
   dDataOper, dDataVencOper   : TDateTime;

   procedure HabilitaOkCancelar(bHabilita: Boolean);


  public { Public declarations }
    CmeCadastro.Operacao : TOperacao;
    FazendoCloseOpen : Boolean;

  end;



var
  frmExecBaixaBem: TfrmExecBaixaBem;



implementation
{$R *.DFM}
Uses
  uSistema, uMensErro, uDatabase, dBaseDados, uModulo, uComunsImobiliario, uVerificaPreenchimento,
  uAutorizacao, uIntegraBack, uOperComum, uAtivoFixo, uFuncoesImob, dLookImobiliario;



procedure TfrmExecBaixaBem.HabilitaOkCancelar(bHabilita: Boolean);
begin
   bbtnConfirmar.Enabled := bHabilita;
   bbtnCancelar.Enabled  := bHabilita;
end;



procedure TfrmExecBaixaBem.CmeCadastroAtualizaBotoes(Sender: TObject);
var
   ConfirmaVisible : Boolean;
begin
   { Configura o estado dos botões }

   sbtnInserir.Enabled     := False;
   sbtnAlterar.Enabled     := False;
   sbtnApagar.Enabled      := False;
   spdSelecionar.Enabled   := False;

   case CmeCadastro.Operacao of

      opVazio:
      begin
         sbtnInserir.Down        := False;
         sbtnAlterar.Down        := False;
         sbtnApagar.Down         := False;
         spdSelecionar.Down      := False;
         sbtnInserir.Enabled     := True;
         sbtnAlterar.Enabled     := False;
         sbtnApagar.Enabled      := False;
         spdSelecionar.Enabled   := False;

         ConfirmaVisible := False;
      end;

      opIdle:
      begin
         HabilitaOkCancelar(False);

         sbtnInserir.Down     := False;
         sbtnAlterar.Down     := False;
         sbtnApagar.Down      := False;
         spdSelecionar.Down   := False;
         sbtnInserir.Enabled  := True;

         if (qry.Active) and (not qry.IsEmpty) then begin
            sbtnAlterar.Enabled     := True;
            sbtnApagar.Enabled      := True;
            spdSelecionar.Enabled   := True;
         end else begin
            sbtnAlterar.Enabled     := False;
            sbtnApagar.Enabled      := False;
            spdSelecionar.Enabled   := False;
         end;
         ConfirmaVisible := False;
      end;

      opInserir :
      begin
         HabilitaOkCancelar(True);
         sbtnInserir.Down        := True;
         sbtnInserir.Enabled     := True;
         ConfirmaVisible         := True;
      end;

      opAlterar :
      begin
         HabilitaOkCancelar(True);
         sbtnAlterar.Down        := True;
         sbtnAlterar.Enabled     := True;
         spdSelecionar.Down      := True;
         spdSelecionar.Enabled   := True;
         ConfirmaVisible         := True;
      end;

      opProcurar :
      begin
         HabilitaOkCancelar(True);
         ConfirmaVisible := False;
      end;

      opApagar :
      begin
         HabilitaOkCancelar(True);
         sbtnApagar.Down         := False;
         sbtnApagar.Enabled      := True;
         ConfirmaVisible         := False;
      end;

      else begin
         ConfirmaVisible := False;
         HabilitaOkCancelar(True);
      end;

   end;

   bbtnConfirmar.Enabled   := ConfirmaVisible;
   bbtnCancelar.Enabled    := ConfirmaVisible;

   AutorizarForm(afSoDesabilitar);

   if ( (length(trim(edtNomeMestre.Text)) > 0) and (length(trim(edtNomeImovel.Text)) > 0) ) then begin

      // habilita a inserção se os parâmetros estiverem preenchidos
      sbtnInserir.Enabled     := True;

      // só habilita alteração e exclusão se houver registros na query
      if not(qry.IsEmpty) then begin
         sbtnAlterar.Enabled     := True;
         sbtnApagar.Enabled      := True;
         spdSelecionar.Enabled   := True;
      end;

   end else begin

      // desabilita tudo os parâmetros não estiverem preenchidos
      sbtnInserir.Enabled     := False;
      sbtnAlterar.Enabled     := False;
      sbtnApagar.Enabled      := False;
      spdSelecionar.Enabled   := True;

   end;
end;



procedure TfrmExecBaixaBem.CmeCadastroEdit(Sender: TObject);
begin
   DBgrd.Enabled := False;

   qry.Edit;

   if edtVlrOM.CanFocus then edtVlrOM.SetFocus;
end;



procedure TfrmExecBaixaBem.CmeCadastroConfirma(Sender: TObject);
begin
   try
      qry.ApplyUpdates; 
   except
      Raise;
      Repaint;
   end;

   with qry do begin
      qry.Close;
      if not(Prepared) then Prepare;
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('IMOVEL').asInteger        := iImovel;
      Open;
   end;

   LimpaCampos;

   pnlDetalhe.Enabled   := False;
   DBgrd.Enabled        := True;
end;



procedure TfrmExecBaixaBem.CmeCadastroCancel(Sender: TObject);
begin
   if qry.Active then qry.CancelUpdates;

   LimpaCampos;

   pnlDetalhe.Enabled   := False;
   DBgrd.Enabled        := True;
end;



procedure TfrmExecBaixaBem.CmeCadastroDelete(Sender: TObject);
begin
   qry.Delete;
   CmeCadastro.Confirma(Self);
   pnlDetalhe.Enabled := False;
end;



procedure TfrmExecBaixaBem.LimpaCampos;
begin
   DBcboTipoOper.LookupValue     := '';
   DBcboTipoOper.Clear;

   DBcboLucroPreju.LookupValue   := '';
   DBcboLucroPreju.Clear;

   edtDataOper.Clear;
   edtDataVenc.Clear;

   edtVlrOM.Value := 0;
   edtVlr.Value   := 0;

   DBcboForCliOper.LookupValue   := '';
   DBcboForCliOper.Clear;

   edtObservacao.Clear;
end;



function TfrmExecBaixaBem.VerificaPreenchimento: boolean;
begin
   Result := False;

	try

      if ( (length(trim(DBcboTipoOper.Text)) = 0) or (DBcboTipoOper.LookupValue = '') ) then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação!', DBcboTipoOper);

      if ( (length(trim(DBcboLucroPreju.Text)) = 0) or (DBcboLucroPreju.LookupValue = '') ) then
         raise EValidacao.CreateVal('É necessário indicar a Rubrica que será usada para o lançamento do lucro/prejuízo!', DBcboLucroPreju);

      if length(trim(edtDataOper.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Operação!', edtDataOper);

      if length(trim(edtDataVenc.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Operação!', edtDataVenc);

      if edtVlrOM.Value = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Valor de baixa do Bem!', edtVlrOM);

      if ( (length(trim(DBcboMoeda.Text)) = 0) or (DBcboMoeda.LookupValue = '') ) then
         raise EValidacao.CreateVal('É necessário indicar o Valor OM de baixa do Bem!', DBcboMoeda);

   except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecBaixaBem.GeraOperacao: boolean;
var
   iPlano, iPlanilhaOper, iForCliOper  : integer;
   iTipoLucroPreju, iDocumentoOper     : integer;
   iFaturaOper                         : integer;
   iResultOper                         : shortint;
   fVlrOperOM, fVlrOper, fQuant        : currency;
   sHistOper, sErro, sRecPag           : string;
   bParcelado                          : boolean;
   fNoDoc                              : extended;
begin
   Result := False;

   bParcelado           := False;

   fVlrOperOM           := edtVlrOM.Value;
   fVlrOper             := edtVlr.Value;
   fQuant               := 0;
   dDataOper            := edtDataOper.Date;
   dDataVencOper        := edtDataVenc.Date;

   iPlano               := IntegraBack.Plano;
   iPlanilhaOper        := -1;
   iFaturaOper          := -1;
   fNoDoc               := 0;

   iForCliOper          := -1;
   if DBcboForCliOper.LookupValue <> '' then iForCliOper := StrToInt(DBcboForCliOper.LookupValue);

   iTipoOper            := StrToInt(DBcboTipoOper.LookupValue);
   sNaturezaOper        := qryLookTipoOperNATUREZAOPERACAO.asString;

   iMoeda := -1;
   if DBcboMoeda.LookupValue <> '' then iMoeda := StrToInt(DBcboMoeda.LookupValue);
   // para efeito de CAP/CAR, se a moeda for nula...
   if iMoeda = Modulo.iMoedaCorrente then iMoeda := -1;
   if iMoeda = -1 then fVlrOperOM := 0;

   // grava a Operacao
   with qryInsertOperacao do begin
      Close;
      if not(Prepared) then Prepare;

      ParamByName('IDOPERACAOINVEST').asInteger := iOperacao;
      ParamByName('IDINVESTIMENTO').asInteger   := iImovel;
      ParamByName('EMPRESAPROP').asInteger      := Sistema.idEmpresa;

      ParamByName('IDCARTEIRAINVEST').asInteger := iCarteira;
      ParamByName('IDTIPOINVEST').asInteger     := 3;
      ParamByName('IDTIPOOPERACAO').asInteger   := StrToInt(DBcboTipoOper.LookupValue);
      ParamByName('DATAOPERACAO').asDateTime    := dDataOper;
      ParamByName('DATAVENCOPER').asDateTime    := dDataVencOper;
      ParamByName('QTDEOPERACAO').asFloat       := fQuant;
      ParamByName('VLROPERACAO').asFloat        := fVlrOper;
      ParamByName('VLROPERACAOOM').asFloat      := fVlrOperOM;
      ParamByName('PRECOUNITOPERACAO').asFloat  := 0;

      ParamByName('MOECODIGO').asInteger        := iMoeda;
      if iMoeda = -1 then ParamByName('MOECODIGO').Clear;

      ParamByName('IDFORCLI').asInteger         := iForCliOper;
      if iForCliOper = -1 then ParamByName('IDFORCLI').Clear;

      ParamByName('IDCUSTODIANTE').Clear;
      ParamByName('IDINSTFIN').Clear;
      ParamByName('NUMDOCUMENTO').Clear;

      ParamByName('OBSERVACAO').asString        := edtObservacao.Text;

      ExecSQL;
   end;

   // contabiliza, lança no CaP/CaR
   iResultOper := OperComum.LancaOperInvest(Sistema.idEmpresa, Sistema.idModulo, 3{TipoInvest},
   iTipoOper, iOperacao, iForCliOper, iCarteira, iMoeda, iImovel, sTipoImovel, ''{Complemento}, 'T',
   fVlrOperOM, fVlrOper, dDataOper, dDataVencOper, True, bParcelado, iPlano, iPlanilhaOper,
   iDocumentoOper, iFaturaOper, fNoDoc, sHistOper, sErro);

   if iResultOper >= -2 then begin

      // aqui, integra antes com o Ativo para o caso de venda, onde o Lucro precisa ser alimentado
      // antes da baixa
      if Modulo.bIntegraAtivo then begin
         if qryLookTipoOperFLGGERACAF.asInteger = 1 then begin
            // se a operação gerar mudança nos valores do Ativo Fixo
            if not(IntegraCAF(fVlrOper)) then Exit;
         end;
      end;

      if ( (Modulo.bIntegraGestao) and not(bParcelado) ) then begin

         sRecPag  := qryLookTipoOperRECPAG.asString;

         // movimenta Carteira e grava histórico
         if not(OperComum.AlimentaCarteira(Sistema.idEmpresa, Sistema.idModulo, iImovel,
         3{TipoInvest}, iOperacao, -1{LancImovel}, iTipoOper, iCarteira, -1{DespesaOper},
         -1{DespesaCarteira}, iPlanilhaOper, iDocumentoOper, IntegraBack.Plano, dDataOper, fVlrOper,
         fQuant, Modulo.fVlrPrimeiraCota, 0, 0, 0, 0, 0, 0, 0, sNaturezaOper{NaturezaMovimento},
         sNaturezaOper{NaturezaOperacao}, ''{Lote}, sHistOper{Historico}, 'OPE'{TipoMovimento},
         ''{flgCustodia}, sRecPAg{RecPag}, True)) then Exit;

         OperComum.AtualizaSaldos(Modulo.fVlrPrimeiraCota, -1);
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
      Repaint;
   end;
end;



function TfrmExecBaixaBem.RegistraDespesa(fLucroPreju: currency): integer;
var
   iRubrica : integer;
begin
   with qryInsertRubrica do begin
      Close;
      if not(Prepared) then Prepare;

      iRubrica                               := LeUltRegistro(nil, 'DESPOPERINVEST');

      ParamByName('IDRUBRICA').asInteger     := iRubrica;
      ParamByName('MOEDA').Clear;
      ParamByName('FORCLI').Clear;
      ParamByName('TIPORUBRICA').asInteger   := StrToInt(DBcboLucroPreju.LookupValue);
      ParamByName('VALOR').asFloat           := fLucroPreju;
      ParamByName('VALOROM').Clear;
      ParamByName('DATAVENC').asDateTime     := edtDataVenc.Date;
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('TIPOOPER').asInteger      := iTipoOper;
      ParamByName('IDOPERACAO').asInteger    := iOperacao;
      ParamByName('DATAOPER').asDateTime     := edtDataOper.Date;

      ExecSQL;
   end;

   Result := iRubrica;
end;



function TfrmExecBaixaBem.IntegraCAF(fVlrCAF: currency): boolean;
var
   iPlanilhaLucroPreju     : integer;
   iBem, iLucroPreju       : integer;
   fLucroPreju, fVlrBem    : currency;
   fLucroPrejuAtivo        : currency;
   sNaturezaLucroPreju     : string;
begin
   Result := False;

   iBem                 := qryIDBEM.asInteger;
   iPlanilhaLucroPreju  := -1;

   // executa a baixa
   if not(AtivoFixo.ExecutaBaixa(Sistema.idModulo, Sistema.idEmpresa, iBem, -1, dDataOper,
   100, fVlrCAF, '', True, fLucroPrejuAtivo, fLucroPreju, iPlanilhaLucroPreju)) then Exit;

   // lança na Carteira o Lucro / Prejuízo
   if Modulo.bIntegraGestao then begin

      fLucroPreju          := Arredonda(abs(fLucroPreju), 2);
      iLucroPreju          := RegistraDespesa(fLucroPreju);
      sNaturezaLucroPreju  := qryLookTipoDespesaNATUREZAOPERACAO.asString;

      // movimenta Carteira e grava histórico
      if not(OperComum.AlimentaCarteira(Sistema.idEmpresa, Sistema.idModulo, iImovel,
      3{TipoInvest}, iOperacao, -1{LancImovel}, iTipoOper, iCarteira, iLucroPreju, -1{DespesaCarteira},
      iPlanilhaLucroPreju, -1{Documento}, IntegraBack.Plano, dDataOper, fLucroPreju, 0{QuantInvest},
      Modulo.fVlrPrimeiraCota, 0, 0, 0, 0, 0, 0, 0, sNaturezaLucroPreju{NaturezaMovimento},
      sNaturezaOper{NaturezaOperacao}, ''{Lote}, 'Lucro / Prejuízo de Alienação de Imóveis'{Historico},
      'MVI'{TipoMovimento}, ''{flgCustodia}, ''{RecPag}, True)) then Exit;

      OperComum.AtualizaSaldos(Modulo.fVlrPrimeiraCota, -1);
   end;

   Result := True;
end;



procedure TfrmExecBaixaBem.AbreQueries;
begin
   qryLookMoeda.Open;
   qryLookTipoOper.Open;
end;



procedure TfrmExecBaixaBem.FechaQueries;
begin
   qry.Close;
   qry.unPrepare;

   qryLookMoeda.Close;
   qryLookMoeda.unPrepare;

   qryLookTipoOper.Close;
   qryLookTipoOper.unPrepare;

   qryLookTipoDespesa.Close;
   qryLookTipoDespesa.unPrepare;
end;



procedure TfrmExecBaixaBem.FormCreate(Sender: TObject);
begin
   inherited;

   FazendoCloseOpen := False;

   if qry.isEmpty then begin
      CmeCadastro.Operacao := opVazio
   end else begin
      CmeCadastro.Operacao := opIdle;
   end;

   AtualizaBotoes;
end;



procedure TfrmExecBaixaBem.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin

      Screen.Cursor := crHourGlass;

      case MsgDlg('Deseja realmente baixar esse Bem?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) of

         mrYes:
         begin
            StartTransacao;

            iOperacao := LeUltRegistro(nil, 'OPERACAOINVEST');

            try
               // Operação (inclui lucro/prejuízo)
               if not(GeraOperacao) then begin
                  CmeCadastro.Cancel(Self);

                  RollBackTransacao;
               end else begin
                  qry.Delete;
                  CmeCadastro.Confirma(Self);

                  CommitTransacao;
               end;

            except;
               RollBackTransacao;
               LimpaCampos;
               Raise;
            end;

         end;

         mrNo: CmeCadastro.Cancel(Self);

      end;

      if qry.isEmpty then begin
         CmeCadastro.Operacao := opVazio
      end else begin
         CmeCadastro.Operacao := opIdle;
      end;

      AtualizaBotoes;

      Screen.Cursor := crDefault;

      inherited;
   end;
end;



procedure TfrmExecBaixaBem.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   CmeCadastro.Cancel(Self);

   if qry.isEmpty then begin
      CmeCadastro.Operacao  := opVazio
   end else begin
      CmeCadastro.Operacao := opIdle;
   end;

   AtualizaBotoes;
end;



procedure TfrmExecBaixaBem.DBgrdCalcCellColors(Sender: TObject; Field: TField;
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



procedure TfrmExecBaixaBem.DBgrdTopRowChanged(Sender: TObject);
begin
   inherited;
   
   // acerta as cores quando muda a linha da grid
   DBgrd.Invalidate;
end;



procedure TfrmExecBaixaBem.FormShow(Sender: TObject);
begin
   inherited;

   with qryLookForCli do begin
      LimpaParametros(qryLookForCli);
      ParamByName('EMPRESAPROP').asInteger := Sistema.idEmpresa;
      Open;
   end;
end;



procedure TfrmExecBaixaBem.btnBuscaImovelClick(Sender: TObject);
begin
   dtmLookImobiliario.MS_ImovelAtivo.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   if dtmLookImobiliario.MS_ImovelAtivo.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovel              := StrToInt(dtmLookImobiliario.MS_ImovelAtivo.ValoresChave[1]);
      edtNomeMestre.Text   := dtmLookImobiliario.MS_ImovelAtivo.ValoresChave[2];
      edtNomeImovel.Text   := dtmLookImobiliario.MS_ImovelAtivo.ValoresChave[3];
      iCarteira            := StrToInt(dtmLookImobiliario.MS_ImovelAtivo.ValoresChave[6]);
      sTipoImovel          := dtmLookImobiliario.MS_ImovelAtivo.ValoresChave[4];

      AbreQueries;

      with qry do begin
         LimpaParametros(qry);
         ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
         ParamByName('IMOVEL').asInteger        := iImovel;
         Open;
      end;

      if qry.isEmpty then begin
         CmeCadastro.Operacao := opVazio;
      end else begin
         CmeCadastro.Operacao := opIdle;
      end;

      AtualizaBotoes;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecBaixaBem.spdSelecionarClick(Sender: TObject);
begin
   inherited;

   if not(CmeCadastro.Operacao in [opIdle, opVazio]) then bbtnCancelarClick(Self);

   if not(qry.isEmpty) then begin
      CmeCadastro.Operacao := opAlterar;
      AtualizaBotoes;

      LimpaCampos;
      CmeCadastro.Edit(Self);

      pnlDetalhe.Enabled := True;
      if DBcboTipoOper.CanFocus then DBcboTipoOper.SetFocus;
   end;
end;



procedure TfrmExecBaixaBem.qryCalcFields(DataSet: TDataSet);
var
  sGrupo: string;
begin
   inherited;

   if not(qryIXBGRUPO.isNULL) then begin
      sGrupo := qryIXBGRUPO.asString;

      case sGrupo[1] of
         'A': qryGrupo.asString := 'Ar-Condicionado';
         'E': qryGrupo.asString := 'Edificação';
         'T': qryGrupo.asString := 'Terreno';
         'I': qryGrupo.asString := 'Instalações Gerais';
         'L': qryGrupo.asString := 'Instalações Elétricas';
         'M': qryGrupo.asString := 'Máquinas e Equip.';
         'V': qryGrupo.asString := 'Veículos';
      end;

   end;
end;



procedure TfrmExecBaixaBem.edtVlrOMExit(Sender: TObject);
begin
   inherited;

   if ( (length(trim(DBcboMoeda.Text)) > 0 ) and (edtVlrOM.Value > 0) ) then begin
      // se a Moeda e o ValorOM preenchidos, converte o valor
      ConverteValorBaixa;
   end;
end;



procedure TfrmExecBaixaBem.ConverteValorBaixa;
var
   fValor, fValorOM  : currency;
   sMensagem         : string;
begin
   iMoeda      := StrToInt(DBcboMoeda.LookupValue);
   fValorOM    := edtVlrOM.Value;
   fValor      := FuncoesImob.ConverteMoeda(iMoeda, fValorOM, edtDataOper.Date, True);

   // verifica se houve conversão com a cotação de hoje...
   if fValor = -1 then begin
      sMensagem   := 'Não existe cotação atualizada para a Moeda selecionada!' + chr(13) +
                     'Deseja utilizar a última cotação cadastrada?';

      // não havendo, pergunta se deseja-se usar a última cotação cadastrada...
      if MsgDlg(sMensagem, 'Aviso', mtWarning, [mbYes, mbNo], 0) = mrYes then begin;
         Repaint;
         // tenta a conversão com a última cotação cadastrada...
         fValor := FuncoesImob.ConverteMoeda(iMoeda, fValorOM, edtDataOper.Date, False);

         // se mesmo assim não for possível:
         if fValor = -1 then begin
            sMensagem   := 'Não existe cotação para a Moeda selecionada!' + chr(13) +
                           'Favor verificar.';

            MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
            Repaint;

            DBcboMoeda.SetFocus;

         end else begin

            edtVlr.Value      := fValor;
            edtVlrOM.Modified := False;

         end;

      end else begin
         // não se desejando fazer conversão pela última cotação cadastrada:
         Repaint;
         DBcboMoeda.SetFocus;
      end;

   end else begin

      // houve conversão; preenche os valores de acordo com pagar/receber
      edtVlr.Value      := fValor;
      edtVlrOM.Modified := False;

   end;
end;



procedure TfrmExecBaixaBem.DBcboTipoOperCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   with qryLookTipoDespesa do begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('TIPOOPER').asInteger   := StrToInt(DBcboTipoOper.LookupValue);
      Open;
   end;

   if qryLookTipoOperFLGGERACAPCAR.asInteger = 1 then begin
      DBcboForCliOper.Enabled       := True;
   end else begin
      DBcboForCliOper.Clear;
      DBcboForCliOper.LookupValue   := '';
      DBcboForCliOper.Enabled       := False;
   end;
end;



procedure TfrmExecBaixaBem.edtDataOperExit(Sender: TObject);
begin
   inherited;

   // preenche por default a data de vencimento com a data da operacao
   if ( (length(trim(edtDataOper.Text)) > 0) and (length(trim(edtDataVenc.Text)) = 0) ) then edtDataVenc.Date := edtDataOper.Date;
end;



end.
