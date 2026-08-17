//------------------------------------------------------------------------------
// ALTERAÇÕES / CORREÇÕES / IMPLEMENTAÇÕES :
//------------------------------------------------------------------------------
// Pendências : 21683
// Autor      : Peterson Victor
// Data       : 30/05/2016
// Descrição  : alteração da regra para data limite
//------------------------------------------------------------------------------
// Pendências :
// Autor      : Daniel Simões                                                
// Data       : 21/03/2006
// Descrição  : Adicionado botões de marcar/desmarcar tudo no grid do formulário...
//------------------------------------------------------------------------------

unit fExecResiduo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  mProposta, Grids, Wwdbigrd, Wwdbgrid, DBTables, Db, Wwquery, Wwdatsrc,
  TREdit, wwdblook, CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker, uCtrlOperImob,
  uFuncoesImob, uCtrlPadroes, {uCtrlDocumento}uCtrlImobDocumento, uCtrlPadrLancImovel,
  {uCtrlLancamento}uCtrlImobLancamento, uCtrlParamIntegra, dbClient, uComunsImobiliarioDB,
   // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;

type
  TfrmExecResiduo = class(TfrmWizardMT)
    molProposta1: TmolProposta;
    Panel1: TPanel;
    pnlResiduo: TPanel;
    grdParc: TwwDBGrid;
    dsParc: TwwDataSource;
    qryParc: TwwQuery;
    UpdParc: TUpdateSQL;
    qryParcCHKINTEGRA: TFloatField;
    qryParcIDCONTRATOIMOVEL: TFloatField;
    qryParcNUMCONTRATO: TStringField;
    qryParcNOMECONTRATO: TStringField;
    qryParcNOMEMESTRE: TStringField;
    qryParcCODTIPIMOVEL: TStringField;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcNUMPARCELA: TFloatField;
    qryParcNUMPARCELAS: TFloatField;
    qryParcVLRPRESTACAO: TFloatField;
    qryParcVLRPRESTATUALIZADA: TFloatField;
    qryParcVLRRESIDUO: TFloatField;
    qryParcVLRRESIDUOATUALI: TFloatField;
    qryParcIDPESSOA: TFloatField;
    qryParcRAZAOSOCIAL: TStringField;
    qryParcFLGTIPOLANC: TFloatField;
    qryParcCODPORTFORMA: TFloatField;
    qryParcCODFORMA: TFloatField;
    tsCobranca: TTabSheet;
    fcLabel2: TfcLabel;
    tsMensagem: TTabSheet;
    fcLabel3: TfcLabel;
    Label2: TLabel;
    edDataVencto: TCMDateTimePicker;
    Label26: TLabel;
    dbcboPortadorForma: TCMDBLookupCombo;
    gbMensagem: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    edtln9: TEdit;
    edtln8: TEdit;
    edtln7: TEdit;
    edtln6: TEdit;
    edtln5: TEdit;
    edtln4: TEdit;
    edtln3: TEdit;
    edtln2: TEdit;
    edtln1: TEdit;
    Label3: TLabel;
    edComprador: TEdit;
    Label1: TLabel;
    edVlrTotal: TRealEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edDataI: TCMDateTimePicker;
    edDataF: TCMDateTimePicker;
    qryLookPortadorForma: TwwQuery;
    qryLookPortadorFormaDESCRICAO: TStringField;
    qryLookPortadorFormaCODPORTFORMA: TFloatField;
    qryLookPortadorFormaCODFORMA: TFloatField;
    chkBoleto: TCheckBox;
    qryLookPortadorFormaIDCONFIGBARRAS: TFloatField;
    Label6: TLabel;
    edtComprador: TEdit;
    Label7: TLabel;
    dblcCondPag: TCMDBLookupCombo;
    qryCondPag: TwwQuery;
    qryCondPagDSCCOND: TStringField;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagIDCONDINICIAL: TFloatField;
    rgTipo: TRadioGroup;
    tsAbono: TTabSheet;
    fcLabel4: TfcLabel;
    GroupBox1: TGroupBox;
    memAbono: TMemo;
    gbCorrecao: TGroupBox;
    edDtLimite: TCMDateTimePicker;
    qryParcFORMACALCULO: TFloatField;
    qryParcFLGRESIDUOINCORP: TStringField;
    qryParcINDCORRECAO: TFloatField;
    qryParcMESREFREAJUSTE: TFloatField;
    qryDadosCliente: TwwQuery;
    qryDadosClienteIDPAIS: TFloatField;
    qryDadosClienteIDCIDADES: TFloatField;
    qryDadosClienteCODESTADO: TStringField;
    Panel2: TPanel;
    sbMarcaTodas: TSpeedButton;
    sbDesmarcaTodas: TSpeedButton;
    qryParcFLGTIPOCONTRATO: TStringField;
    edVlrResiduo: TRealEdit;
    Label8: TLabel;
    chkCorrecao: TCheckBox;
    qryParcTOT_ALTERADOR: TFloatField;
    qryParcIDLANCOPERNORMAL: TFloatField;
    qryParcIDLANCOPERADIANTO: TFloatField;
    qryParcNUMLANCTO: TFloatField;
    qryParcCODDOCUMENTO: TFloatField;
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure grdParcDblClick(Sender: TObject);
    procedure grdParcCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdParcTopRowChanged(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbcboPortadorFormaChange(Sender: TObject);
    procedure dbcboPortadorFormaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbMarcaTodasClick(Sender: TObject);
    procedure sbDesmarcaTodasClick(Sender: TObject);
    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
  private
    { Private declarations }
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344
    
    ParamContabeis : TParamContabeisMT;
    iCodTipoDoc    : Integer;

    liRetFuncao,liEmpresa,liExercicio,liPeriodo : LongInt;
    iPlanilha : Integer;

    //CtrlDocumento      : TCtrlDocumento;
    CtrlDocumento      : TCtrlImobDocumento;
    CtrlPadrLancImovel : TCtrlPadrLancImovel;
    //CtrlLancamento     : TCtrlLancamento;
    CtrlLancamento     : TCtrlImobLancamento;
    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
    ComunsImobiliarioDB : TComunsImobiliarioDB;

    procedure AbreParcelas;
    procedure ProcessaMensagem(iDocumento: Int64);
    procedure CorrigeResiduo;
    function  InicializaParam(const iTipoLanc:Integer): Boolean;  // Busca dados da parametrização contabil
    function  VerificaPreenchimento : Boolean;
    function  Processa : Boolean;
    function  Abona: Boolean;
    function  DesfazAbono: boolean;
    function  LancCar: Int64;
    function  LancContab(iDocumento: Int64): Integer;
    function  GravaIntegra(iCodDocumento:Int64; iPlnCodigo:Integer): Boolean;

    procedure MontaQuery;
    procedure MontaQueryCBS;

    procedure AtualizaGrid;
  public
    { Public declarations }
  end;

var
  frmExecResiduo: TfrmExecResiduo;

implementation

uses uDataBase, dBaseDados, uSistema, uComunsImobiliario, uMensErro,
     uFuncAlienacao, dLookImobiliario, uModuloImobiliario, uModuloAlienacao,
     uIntegraBack, DFinanciamento, uVerificaPreenchimento, uCalcDocumento,
  dLancImovel;

{$R *.DFM}

procedure TfrmExecResiduo.molProposta1btnBuscaPropClick(Sender: TObject);
begin
  inherited;
  molProposta1.btnBuscaPropClick(2,True,Sender);
  edtComprador.Text := molProposta1.sComprador;
  
  LimpaParametros(qryCondPag);
  qryCondPag.Params[0].AsFloat := molProposta1.iProposta;
  qryCondPag.Open;
end;

procedure TfrmExecResiduo.grdParcDblClick(Sender: TObject);
begin
  inherited;
  // Marca ou Desmarca as parcelas para integração
  if not qryParc.IsEmpty then begin
     qryParc.Edit;
     qryParcCHKINTEGRA.AsInteger := (qryParcCHKINTEGRA.AsInteger Xor 1);
     qryParc.Post;
  end;
end;

procedure TfrmExecResiduo.grdParcCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWindow;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmExecResiduo.grdParcTopRowChanged(Sender: TObject);
begin
  inherited;
  // acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecResiduo.btnContinuarClick(Sender: TObject);
begin
  if VerificaPreenchimento then begin
     if PagControle.ActivePage = tabSelecao then begin
        AbreParcelas;

        // Marchetti - Pendencia 23210
        sbMarcaTodas.Enabled    := True;
        sbDesmarcaTodas.Enabled := True;
        grdParc.Enabled         := True;
        pnlResiduo.Caption      := 'Parcelas com Resíduo';

        if rgTipo.ItemIndex = 2 then
        begin
           pnlResiduo.Caption := 'Parcelas com Resíduo abonado';
           if (ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) or
              (ModuloImobiliario.Alienacao.iIDOperAbonoResN > 0) then
           begin
              if not qryParc.IsEmpty then
              begin
                 sbMarcaTodas.Click;
                 sbMarcaTodas.Enabled    := False;
                 sbDesmarcaTodas.Enabled := False;
                 grdParc.Enabled         := False;
              end;
           end;
        end;
        // Fim Marchetti - Pendencia 23210

        inherited;
     end else if PagControle.ActivePage = TabSheet1 then begin
        if rgTipo.ItemIndex = 0 then begin
           edComprador.Text  := molProposta1.sComprador;
           edDataVencto.Date := Date;
           inherited;
        end else if rgTipo.ItemIndex = 1 then begin
           PagControle.ActivePage := tsAbono;
           btnContinuar.Enabled := False;
           btnConfirmar.Enabled := True;
        end else begin
           btnContinuar.Enabled := False;
           btnConfirmar.Enabled := True;
        end;
     end else inherited;
     if PagControle.ActivePage = tsMensagem then begin
        btnContinuar.Enabled := False;
        btnConfirmar.Enabled := True;
     end;
  end;
end;

function TfrmExecResiduo.VerificaPreenchimento: Boolean;
var bMarcada : Boolean;
begin
   Result := False;
   try
      // Valida pagina de SELECAO
      if PagControle.ActivePageIndex = 0 then begin
         if molProposta1.iProposta <= 0 then
            raise EValidacao.CreateVal('Selecione um Contrato',molProposta1.btnBuscaProp);

         if dblcCondPag.Text = '' then
            raise EValidacao.CreateVal('Selecione uma Condição de Pagamento',dblcCondPag);

         if (edDataF.Text <> '') and (edDataF.Date < edDataI.Date) then
            raise EValidacao.CreateVal('A data final não pode ser menor que a data inicial',edDataF);
         // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
         if (edDataI.Text <> '') then
         begin
             if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edDataI.Text) then
                raise EValidacao.CreateVal('Período contábil bloqueado.',edDataI);
         end;
         // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

      end;

      // Valida pagina de PARCELAS
      if PagControle.ActivePageIndex = 1 then begin
         qryParc.DisableControls;
         bMarcada           := False;
         edVlrTotal.Value   := 0;
         edVlrResiduo.Value := 0;
         qryParc.First;
         while not qryParc.eof do begin
            if qryParcCHKINTEGRA.AsFloat = 1 then begin
               bMarcada           := True;
               edVlrTotal.Value   := edVlrTotal.Value + qryParcVLRRESIDUOATUALI.AsFloat;
               edVlrResiduo.Value := edVlrResiduo.Value + qryParcVLRRESIDUO.AsFloat;
            end;
            qryParc.Next;
         end;
         qryParc.First;
         qryParc.EnableControls;

         if not bMarcada then begin
            if rgTipo.ItemIndex = 0 then
                 raise EValidacao.CreateVal('Selecione os resíduos a serem cobrados', grdParc)
            else raise EValidacao.CreateVal('Selecione os resíduos a serem abonados', grdParc);
         end;
      end;

      // Valida pagina de COBRANCA
      if PagControle.ActivePageIndex = 2 then begin
         if (edDataVencto.Text = '') then
            raise EValidacao.CreateVal('Informe a data de vencimento', edDataVencto);

         // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
         if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edDataVencto.Text) then
            raise EValidacao.CreateVal('Período contábil bloqueado.',edDataVencto);
         // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

         if (dbcboPortadorForma.Text = '') then
            raise EValidacao.CreateVal('Selecione a forma de cobrança', dbcboPortadorForma);
      end;

      // Valida pagina de ABONO
      if PagControle.ActivePage = tsAbono then begin
         if (memAbono.Text = '') then
            raise EValidacao.CreateVal('Informe O motivo do abono', memAbono);
      end;

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

procedure TfrmExecResiduo.AbreParcelas;
begin

   // Marchetti - Pendencia 24964
   if Sistema.TipoCliente = 19981 then MontaQueryCBS
   else                                MontaQuery;
   // Fim Marchetti - Pendencia 24964

   LimpaParametros(qryParc);
   qryParc.ParamByName('PIDCONTRATO').AsInteger := molProposta1.iProposta;
   qryParc.ParamByName('PIDCONDPAG').AsInteger  := qryCondPagIDCONDINICIAL.AsInteger;
   if edDataI.Text <> '' then
      qryParc.ParamByName('pDATAI').AsDateTime  := edDataI.Date;
   if edDataF.Text <> '' then
      qryParc.ParamByName('pDATAF').AsDateTime  := edDataF.Date;

   if rgTipo.ItemIndex in[0,1] then
        qryParc.ParamByName('pFLGRESIDUO').AsString := 'N'
   else qryParc.ParamByName('pFLGRESIDUO').AsString := 'A';

   if (ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0)then
   begin
      qryParc.ParamByName('pDATAD').DataType   := ftDate;
      qryParc.ParamByName('pDATAD').paramType  := ptInput;
      qryParc.ParamByName('pDATAD').AsDateTime := edDtLimite.Date;
   end;

   // Marchetti - Pendencia 23210
   if (rgTipo.ItemIndex = 2) and
      ((ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) or
       (ModuloImobiliario.Alienacao.iIDOperAbonoResN > 0)) then
   begin
      qryParc.ParamByName('pDATAD').DataType   := ftDate;
      qryParc.ParamByName('pDATAD').paramType  := ptInput;
      qryParc.ParamByName('pDATAD').AsDateTime := edDtLimite.Date;
   end;
   // Fim Marchetti - Pendencia 23210

   qryParc.Open;

   AtualizaGrid;

   if (ModuloImobiliario.Alienacao.iTipoOperAtualRes <= 0) and (chkCorrecao.Checked) then
      CorrigeResiduo
end;

procedure TfrmExecResiduo.FormCreate(Sender: TObject);
begin
  inherited;

  //CtrlDocumento      := TCtrlDocumento.Create;
  CtrlDocumento      := TCtrlImobDocumento.Create;
  CtrlPadrLancImovel := TCtrlPadrLancImovel.Create(Sistema.IDEmpresa,Sistema.IDModulo);
  //CtrlLancamento     := TCtrlLancamento.Create;
  CtrlLancamento     := TCtrlImobLancamento.Create;
  //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
  CtrlDocumento.InitializeAs(Padroes);
  CtrlPadrLancImovel.InitializeAs(Padroes);
  CtrlLancamento.InitializeAs(Padroes);
  //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela

  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IdEmpresa, Sistema.IdModulo,
                                                     Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro);

  // Abre tabelas de Lookup
  with qryLookPortadorForma do begin
     LimpaParametros(qryLookPortadorForma);
     Params[0].asInteger := Sistema.idEmpresa;
     Open;
  end;
  LimpaParametros(qryCondPag);
  qryCondPag.Params[0].AsFloat := molProposta1.iProposta;
  qryCondPag.Open;

  edDtLimite.Date    := Date;
  gbCorrecao.Enabled := (ModuloImobiliario.Alienacao.iTipoOperAtualRes <= 0);
  // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
end;

procedure TfrmExecResiduo.dbcboPortadorFormaChange(Sender: TObject);
begin
  inherited;
  chkBoleto.Checked := not(qryLookPortadorFormaIDCONFIGBARRAS.IsNull);
  if chkBoleto.Checked then begin
     btnContinuar.Enabled := True;
     btnConfirmar.Enabled := False;
  end else begin
     btnContinuar.Enabled := False;
     btnConfirmar.Enabled := True;
  end;
end;

procedure TfrmExecResiduo.dbcboPortadorFormaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  chkBoleto.Checked := not(qryLookPortadorFormaIDCONFIGBARRAS.IsNull);
  if chkBoleto.Checked then begin
     btnContinuar.Enabled := True;
     btnConfirmar.Enabled := False;
  end else begin
     btnContinuar.Enabled := False;
     btnConfirmar.Enabled := True;
  end;
end;

procedure TfrmExecResiduo.btnConfirmarClick(Sender: TObject);
begin
  if VerificaPreenchimento then begin
     inherited;
     if rgTipo.ItemIndex = 0 then begin
        if MsgDlg('Confirma o lançamento no Contas a Receber ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
           if Processa then IrParaPagina(0,'Lançamento Efetuado com Sucesso');
        end;
     end else if rgTipo.ItemIndex = 1 then begin
        if MsgDlg('Confirma o Abono dos Resíduos ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
           if Abona then IrParaPagina(0,'Abono Efetuado com Sucesso');
        end;
     end else begin
        if MsgDlg('Confirma a Exclusão do Abono dos Resíduos ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
           if DesfazAbono then IrParaPagina(0,'Exclusão dos Abono Efetuado com Sucesso');
        end;
     end;
  end;
end;

function TfrmExecResiduo.Processa : Boolean;
var sMens         : String;
    iCodDocumento : Int64;
begin
   Result := True;
   try
      // Testa pelo período se é possivel contabilizar
      liEmpresa   := Sistema.IdEmpresa;

      // Busca os parametros da Contabilização  ->  Tipo 11 Correção Monetária
      if not InicializaParam( 11 ) then
         raise Exception.create('Erro na inicialização dos parâmetros');

      StartTransacao;
      iCodDocumento := LancCar;

      // Processa Mensagens para o Boleto
      ProcessaMensagem(iCodDocumento);

      // Grava o Registro em PARCFINANCIMOV
      if not GravaIntegra(iCodDocumento,0 ) then
         raise Exception.create('Erro ao integrar o documento');

      CommitTransacao;
   except
      on E : Exception do begin
         Result := False;
         RollBackTransacao;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;

procedure TfrmExecResiduo.ProcessaMensagem(iDocumento: Int64);
var vMensagem : array[0..8] of string;
    i : Integer;
begin
   for i := 0 to 8 do vMensagem[i] := TEdit(FindComponent('edtln'+inttostr(i+1))).Text;
   FuncAlienacao.InsereMsgBoleto(iDocumento, vMensagem);
end;


function TfrmExecResiduo.InicializaParam(const iTipoLanc: Integer): Boolean;
var
   TipoRec   : Integer;
   iTipoParc : Integer;
   iCodErro  : Integer;
   sTipo     : String;
begin
   Result := True;
   if qryParcFLGTIPOCONTRATO.AsString = 'C' then
   begin
      Case iTipoLanc of
         1 : TipoRec := 0;                                              // Saldo Inicial
         2 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecSinal;      // Sinal
         3 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortiz;    // Parcela Gerada
         4 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecProjecao;   // Projecao de parcelas
         5 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortExtra; // Amortização Extra
         6 : TipoRec := 0;                                              // Pagamentos Extras - Divergências
         7 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAVista;     // Venda a Vista
         8 : TipoRec := 0;                                              // Caução
         9 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortiz;    // Parcela Antecipada
        10 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecJuros;      // Provisionamento de Juros das parcelas
        11 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecCorrecao;   // Correção das parcelas
      end;
   end
   else
   begin
      Case iTipoLanc of
         1 : TipoRec := 0;                                               // Saldo Inicial
         2 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;     // Sinal
         3 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;     // Parcela Gerada
         4 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;     // Projecao de parcelas
         5 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;     // Amortização Extra
         6 : TipoRec := 0;                                               // Pagamentos Extras - Divergências
         7 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;     // Venda a Vista
         8 : TipoRec := 0;                                               // Caução
         9 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;     // Parcela Antecipada
        10 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecJurosAC;     // Provisionamento de Juros das parcelas
        11 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecCorrecaoAC;  // Correção das parcelas
      end;
   end;
   // Carrega o tipo ParamContabeis com os parametros
   if TipoRec = 0 then begin
      MsgDlg('Nenhuma Parametrização Definida para Correção Monetária.' ,'Aviso',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   end;

   // Carrega o tipo de documento padrão para o tipo de receita
   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PIDMODULO').AsInteger          := Sistema.IdModulo;
   dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := TipoRec;
   dtmLookImobiliario.qryLookTipoRecDes.Open;

   iCodTipoDoc := dtmLookImobiliario.qryLookTipoRecDesCODTIPDOC.AsInteger;

   if not CtrlPadrLancImovel.BuscaPadrLancContabil(ParamContabeis,
                                                   iCodErro,
                                                   'R',
                                                   False,
                                                   Sistema.idEmpresa,
                                                   Sistema.idModulo,
                                                   TipoRec,
                                                   qryParcCODTIPIMOVEL.AsString,
                                                   -1,
                                                   molProposta1.iProposta) then
   begin
      Result := False;
   end;


   // trata erro
   if iCodErro < 0 then begin
      with dtmLookImobiliario do begin
         LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
         qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := qryParcCODTIPIMOVEL.AsString;
         qryLookTipoImovel.Open;

         if iCodErro = -4 then begin
            MsgDlg('Parametrização Duplicada para : ' + #13#10 +
                   qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' +
                   qryLookTipoRecDesDESCCUSTORECIMO.AsString,'Aviso',mtWarning,[mbOk],0);
         end else begin
            MsgDlg('Parametrização Não Encontrada para : ' + #13#10 +
                   qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' +
                   qryLookTipoRecDesDESCCUSTORECIMO.AsString,'Aviso',mtWarning,[mbOk],0);
         end;
      end;
      Result := False;
      Exit;
   end;
end;

function TfrmExecResiduo.LancCar: Int64;
var
   iCodDoc, iNumLancto  : Int64;
   sOperacao            : String;
   iSubContaDebCred     : Integer;
   iValor               : Double;
   dDataLimite          : TDateTime;
   sDataProgramada      : String;
   _cdsIntegra          : TClientDataSet;
   dVlrTotal, dVlrPlano : Double;
begin
   iCodDoc := CtrlDocumento.GetSequenceDocumento;
   sOperacao := '2 ';
   dVlrTotal := 0;
   dVlrPlano := 0;
   _cdsIntegra := TClientDataSet.Create(nil);

   try
     if ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0 then begin
        iPlanilha := -1;
     end else begin
        iPlanilha := LancContab(iCodDoc);
        if iPlanilha <= 0 then begin
           Result := -1;
           Abort;
        end;
     end;

     if iCodDoc <= 0 then begin
        Result := -1;
        Abort;
     end else begin
        Result := iCodDoc;
     end;

     // tenta converter a subcontadebcred se não conseguir atribui -1
     if ParamContabeis.sSubContaDebCred = '' then
          iSubContaDebCred := -1
     else iSubContaDebCred := strtoint(ParamContabeis.sSubContaDebCred);

     // Define o Historico do CAR
     ParamContabeis.sHistoricoCapCar := 'Correcao do Contrato ' + molProposta1.sNumContrato +
                                        ' - ' + modulo.sPlanoPatro;

     // Marchetti - Pendencia 20478
     LimpaParametros(qryDadosCliente);
     with qryDadosCliente do
     begin
        ParamByName('IDPESSOA').AsInteger := qryParcIDPESSOA.AsInteger;
        Open;
     end;

     LimpaParametros(dtmLancImovel.qryLancImovel);
     dtmLancImovel.qryLancImovel.ParamByName('PIDPESSOA').AsInteger         := Sistema.IdEmpresa;
     dtmLancImovel.qryLancImovel.ParamByName('PIDMODULO').AsInteger         := Sistema.IdModulo;
     dtmLancImovel.qryLancImovel.ParamByName('PIDCONTRATOIMOVEL').AsInteger := qryParcIDCONTRATOIMOVEL.AsInteger;
     dtmLancImovel.qryLancImovel.Open;

     // Verifica o parametro para a data programada do documento
     dDataLimite  := CalcDocumento.DataLimite(edDataVencto.Date,
                                              qryDadosClienteIDCIDADES.AsInteger,
                                              qryDadosClienteIDPAIS.AsInteger,
                                              dtmLancImovel.qryLancImovelCONDIASTOLERANCIA.AsInteger,
                                              dtmLancImovel.qryLancImovelCONDIASREPASSE.AsInteger,
                                              qryDadosClienteCODESTADO.AsString,
                                              dtmLancImovel.qryLancImovelFLGTIPODIATOLERA.AsString,
                                              True, False, False);

     // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
     if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DateToStr(dDataLimite)) then
     begin
        MsgDlg('Período contábil bloqueado - Data Limite.','Aviso',mtWarning,[mbOk],0);
        Result := -1;
        Abort;
     end;
     // Helen - SOL: 172902/8221 KTN: 1577344 - Fim


     if ModuloImobiliario.Alienacao.FLGTIPODATAPROG = 'V' then
        sDataProgramada := FormatDateTime('dd/mm/yyyy',edDataVencto.Date)
     else
        sDataProgramada := FormatDateTime('dd/mm/yyyy', dDataLimite);


     // Parâmetros do CtrlDocumento
     CtrlDocumento.OpenTransaction := False;
     //CtrlDocumento.Prepare( OpDocumento, odlEfetivo, sdocAberto );
     CtrlDocumento.Prepare( OpDocumentoImob, odlEfetivoImob, sdocAbertoImob );
     CtrlDocumento.UsaPlanoPatro := Sistema.UsaPlanoPatro;
     CtrlDocumento.IdUsuario     := Sistema.idUsuario;
     CtrlDocumento.IdEspAcesso   := Sistema.idEspAcesso;
     CtrlDocumento.IdModulo      := Sistema.idModulo;

     // Seta valores para Documento
     CtrlDocumento.SetValues(iCodDoc,
                             iCodDoc, '', '',
                             'R',
                             sOperacao,'','',
                             ParamContabeis.sContaDebCred,
                             ParamContabeis.sCentroCustoDebCred,
                             '','','','','','', '', '',
                             edDataVencto.Date,
                             StrToDate(sDataProgramada),
                             StrToDate(sDataProgramada),
                             0,
                             0,0,0,0,0,0,0,
                             iCodTipoDoc,
                             Sistema.idEmpresa,
                             Sistema.idModulo,
                             molProposta1.iComprador,
                             0,
                             -1,
                             ParamContabeis.iUnidNegoc,
                             IntegraBack.Plano,
                             0, 0, Modulo.iMoedaCorrente, 0, 0,
                             Sistema.idUsuario, Sistema.idEmpresa, 1, 0,
                             iSubContaDebCred,
                             qryLookPortadorFormaCODPORTFORMA.AsInteger,
                             0,0, qryLookPortadorFormaCODFORMA.AsInteger,
                             ParamContabeis.iIdSegregaCriter,
                             ParamContabeis.sContaContabilAntecipa ); // Daniel Simões - 17/03/2006

     CtrlDocumento.Lanctodocum.SetValues(StrToDate(sDataProgramada),
                                         iCodDoc, 0,
                                         edVlrTotal.Value,
                                         0,
                                         edVlrTotal.Value,
                                         ParamContabeis.iUnidNegoc,
                                         ParamContabeis.iPlanilha,
                                         0,
                                         Sistema.idUsuario,
                                         Sistema.idEmpresa, 0,0,
                                         iCodTipoDoc,0,0,
                                         sOperacao, '','','',
                                         ParamContabeis.sHistoricoCapCar,
                                         '','','','D',
                                         Sistema.idModulo,
                                         IntegraBack.Plano,
                                         Sistema.UsaPlanoPatro, False, -1);

     _cdsIntegra.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(qryParcIDCONTRATOIMOVEL.AsInteger);
     while not _cdsIntegra.Eof do
     begin
      if _cdsIntegra.RecNo = _cdsIntegra.RecordCount then
        dVlrPlano := edVlrTotal.Value - dVlrTotal
      else
        dVlrPlano := ((edVlrTotal.Value * _cdsIntegra.FieldByName('PERCENTRATEIO').asFloat)/100);
      dVlrTotal := dVlrTotal + dVlrPlano;

      CtrlDocumento.Rateiodocum.SetValues(//edVlrTotal.value,
                                          dVlrPlano,
                                          0,
                                          0,
                                          0,
                                          Sistema.IdEmpresa,
                                          iCodDoc,
                                          ParamContabeis.iUnidNegoc,
                                          0,Sistema.idUsuario,
                                          -1,
                                          IntegraBack.Plano,
                                          //IntegraBack.PlanoPrevGlobal,
                                          //IntegraBack.PatroGlobal,
                                          _cdsIntegra.FieldByName('IDPLANOPREV').asInteger,
                                          _cdsIntegra.FieldByName('IDPATRO').asInteger,
                                          ModuloImobiliario.Alienacao.iPrograma,
                                          0,
                                          Sistema.IdEmpresa,
                                          ParamContabeis.sCodTipRecDes,
                                          'R',
                                          ParamContabeis.sCodCentroRespon,
                                          ModuloImobiliario.Alienacao.sCentroCusto, // André Pontes - 09/06/2005 - pendência 19283
                                          '', True, -1, -1, qryParcIDCONTRATOIMOVEL.AsInteger
                                          );

      _cdsIntegra.Next;
     end;

     if not CtrlDocumento.Insert then
        Result := -1;
   finally
    FreeAndNil(_cdsIntegra);
   end;
end;

function TfrmExecResiduo.LancContab(iDocumento: Int64): Integer;
var
  iPlnCodigo : Integer;
  iCodDoc    : Int64;
  sMens      : String;

  iSubContaCredito : Double;
  iSubContaDebito  : Double;
  dValorTotal      : Double;
  dValor           : Double;

  _cdsIntegra : TClientDataSet;
begin
   Result     := 0;
   iPlnCodigo := 0;
   iCodDoc    := iDocumento;

   iSubContaCredito := -1;
   iSubContaDebito  := -1;

   dValor      := 0;
   dValorTotal := 0;

   if ParamContabeis.sSubContaDebito  <> '' then iSubContaCredito := StrToFloat(ParamContabeis.sSubContaDebito);
   if ParamContabeis.sSubContaCredito <> '' then iSubContaDebito  := StrToFloat(ParamContabeis.sSubContaCredito);

   _cdsIntegra := TClientDataSet.Create(nil);
   try
     // Define o Historico contábil para Correção
     ParamContabeis.sHistoricoCtb := 'CORREÇÃO MONETÁRIA do Contrato ' + molProposta1.sNumContrato +
                                     ' - ' + molProposta1.sComprador;
     _cdsIntegra.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(qryParcIDCONTRATOIMOVEL.asInteger);
     while not _cdsIntegra.Eof do
     begin
      if _cdsIntegra.RecNo = _cdsIntegra.RecordCount then
          dValor := (edVlrTotal.Value - edVlrResiduo.Value) - dValorTotal
        else
          dValor := (((edVlrTotal.Value - edVlrResiduo.Value) * _cdsIntegra.FieldByName('PERCENTRATEIO').asFloat)/100);
        dValorTotal := dValorTotal + dValor;

      if CtrlLancamento.InsereLancaContab ('2',
                                           Sistema.IdEmpresa,
                                           Sistema.IdModulo,
                                           Sistema.idUsuario,
                                           IntegraBack.Plano,
                                           ParamContabeis.iUnidNegoc,
                                           iSubContaDebito,
                                           iSubContaCredito,
                                           //IntegraBack.PlanoPrevGlobal,
                                           _cdsIntegra.FieldByName('IDPLANOPREV').AsInteger,
                                           //IntegraBack.PatroGlobal,
                                           _cdsIntegra.FieldByName('IDPATRO').AsInteger,
                                           ParamContabeis.iPlanilha, 0,
                                           DateToStr(Date),
                                           FormatFloat('#0', iCodDoc),
                                           ParamContabeis.sHistoricoCtb, '', '', '', '',
                                           '03',
                                           ParamContabeis.sCentroCustoDebito, ParamContabeis.sContaContabilDebito,
                                           ParamContabeis.sCentroCustoCredito,
                                           ParamContabeis.sContaContabilCredito, '',
                                           dValor, False,
                                           Sistema.UsaPlanoPatro,
                                           ParamContabeis.iIdSegregaCriter, -1, -1, -1, True, -1, False,
                                           (edVlrTotal.Value - edVlrResiduo.Value)) then
      begin
        if CtrlLancamento.RetornoPlnCodigo > 0 then
          ParamContabeis.iPlanilha := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));
      end;
      _cdsIntegra.Next;
     end;
     iPlnCodigo := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));

     Result := iPlnCodigo;
   finally
    FreeAndNil(_cdsIntegra);
   end;
end;

function TfrmExecResiduo.GravaIntegra(iCodDocumento: Int64; iPlnCodigo: Integer): Boolean;
var sSql : String;
    iParcCobranca : Integer;
    dDataLimite : TDateTime;
begin
   Result := True;

   // Verifica o parametro para a data programada do documento
   dDataLimite  := CalcDocumento.DataLimite(edDataVencto.Date,
                                            qryDadosClienteIDCIDADES.AsInteger,
                                            qryDadosClienteIDPAIS.AsInteger,
                                            dtmLancImovel.qryLancImovelCONDIASTOLERANCIA.AsInteger,
                                            dtmLancImovel.qryLancImovelCONDIASREPASSE.AsInteger,
                                            qryDadosClienteCODESTADO.AsString,
                                            dtmLancImovel.qryLancImovelFLGTIPODIATOLERA.AsString,
                                            True, False, False);
   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DateToStr(dDataLimite)) then
      raise Exception.Create('Período contábil bloqueado - Data Limite.');
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

   // grava o registro da parcela de cobranca de resíduo
   iParcCobranca := LeUltRegistro(nil,'PARCFINANCIMOV');
   LimpaParametros(dtmFinanciamento.qryInsParcela);
   dtmFinanciamento.qryInsParcela.ParamByName('PIDPARCFINANCIMOV').AsInteger := iParcCobranca;
   dtmFinanciamento.qryInsParcela.ParamByName('PIDCONDPAGIMOVEL').AsInteger  := qryParcIDCONDPAGIMOVEL.AsInteger;;
   if iCodDocumento > 0 then
      dtmFinanciamento.qryInsParcela.ParamByName('PCODDOCUMENTO').AsInteger  := iCodDocumento;
   if iPlnCodigo > 0 then
      dtmFinanciamento.qryInsParcela.ParamByName('PPLNCODIGO').AsInteger     := iPlnCodigo;
   dtmFinanciamento.qryInsParcela.ParamByName('PVLRPRESTACAO').AsFloat       := edVlrTotal.Value;
   dtmFinanciamento.qryInsParcela.ParamByName('PDATAVENCIMENTO').AsDateTime  := edDataVencto.DateTime;
   dtmFinanciamento.qryInsParcela.ParamByName('PDATALANCINTEGRA').AsDateTime := edDataVencto.DateTime;
   dtmFinanciamento.qryInsParcela.ParamByName('PNUMPARCELA').AsInteger       := 0;
   dtmFinanciamento.qryInsParcela.ParamByName('PFLGTIPOLANC').AsInteger      := 10;
   dtmFinanciamento.qryInsParcela.ParamByName('PFLGLANCINTEGRA').AsInteger   := 2;
   dtmFinanciamento.qryInsParcela.ParamByName('PDATALIMITE').AsDateTime      := dDataLimite;

   dtmFinanciamento.qryInsParcela.ExecSql;

   // Atualiza o Flag de cobrança na tabela de Parcelas e grava tabela PARCEXTRAIMOVEL
   with qryParc do begin
      DisableControls;
      First;
      while not eof do begin
         if FieldByName('CHKINTEGRA').AsInteger = 1 then begin
            try
               // Atualiza o Flag de RESÍDUO na parcela
               sSql := 'UPDATE PARCFINANCIMOV ' +
                       '   SET FLGRESIDUOINCORP = ' + QuotedStr('C') +
                       ' WHERE IDPARCFINANCIMOV = ' + IntToStr(qryParc.FieldByName('IDPARCFINANCIMOV').AsInteger);
               ExecutarQuery(dtmFinanciamento.qryAux,sSql);

               // Insere registro na tabela PARCEXTRAIMOVEL
               LimpaParametros(dtmFinanciamento.qryInsParcExtra);
               dtmFinanciamento.qryInsParcExtra.ParamByName('PIDPARCEXTRAIMOV').AsInteger  := LeUltRegistro(nil,'PARCEXTRAIMOV');
               dtmFinanciamento.qryInsParcExtra.ParamByName('PIDPARCCOBRANCA').AsInteger   := iParcCobranca;
               dtmFinanciamento.qryInsParcExtra.ParamByName('PIDPARCCOBRADA').AsInteger    := qryParc.FieldByName('IDPARCFINANCIMOV').AsInteger;
               dtmFinanciamento.qryInsParcExtra.ParamByName('PFLGTIPOCOBRANCA').AsString   := 'R';
               dtmFinanciamento.qryInsParcExtra.ParamByName('PDATACOBRANCA').AsDateTime    := edDataVencto.Date;
               dtmFinanciamento.qryInsParcExtra.ExecSql;

            except
               Result := False;
            end;
         end;
         Next;
      end;
      First;
      EnableControls;
   end;
end;

procedure TfrmExecResiduo.btnVoltarClick(Sender: TObject);
begin
  if (rgTipo.ItemIndex = 1) and (PagControle.ActivePage = tsAbono) then
     PagControle.ActivePageIndex := 2;
  inherited;

end;

function TfrmExecResiduo.Abona: Boolean;
var
    sSql                   : String;
    fTotalRes, fTotalResAd : Currency;
    dData                  : TDateTime;
    fIdLancOperNormal      : Extended;
    fIdLancOperAdianto     : Extended;
    //_cdsAux                : TClientDataSet;
    //dVlrPlano, dVlrTotal   : Double;
    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
    CtrlOperImob       : TCtrlOperImob;
begin
   Result := True;

//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela   

//   _cdsAux := TClientDataSet.Create(nil);

   //try
     StartTransacao;
     try
        //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela - Inicio
        CtrlOperImob       := TCtrlOperImob.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, Sistema.IDEspAcesso, ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal, Sistema.UsaPlanoPatro);
        CtrlOperImob.InitializeAs(Padroes);

        //Peterson Victor - SIG21683 - Inicio
        {
        if ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0 then
           edDtLimite.Date := CtrlOperImob.UltimoFechamento
        else
           edDtLimite.Date := Date;
        }
        //Peterson Victor - SIG21683 - FIM

        edDtLimite.Date := Date;

        if edDtLimite.Text = '' then edDtLimite.Date := Date;

        if edDtLimite.Text = '' then
           dData := Date()
        else
           dData := edDtLimite.Date;
        //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela - Fim

        // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
        if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DateToStr(dData)) then
           raise Exception.Create('Período contábil bloqueado - Data Limite.');
        // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

        // Atualiza o Flag de cobrança na tabela de Parcelas e grava tabela PARCEXTRAIMOVEL
        //with qryParc do begin
           qryParc.DisableControls;
           qryParc.First;
           fTotalRes    := 0;
           fTotalResAd  := 0;
           //dVlrPlano := 0;
           //dVlrTotal := 0;
           while not qryParc.eof do begin
              if qryParc.FieldByName('CHKINTEGRA').AsInteger = 1 then begin
                 // Atualiza o Flag de RESÍDUO na parcela
                 sSql := 'UPDATE PARCFINANCIMOV ' +
                         '   SET FLGRESIDUOINCORP = ' + QuotedStr('A') +
                         ' WHERE IDPARCFINANCIMOV = ' + qryParc.FieldByName('IDPARCFINANCIMOV').AsString;
                 ExecutarQuery(dtmFinanciamento.qryAux,sSql);

                 sSql := 'DELETE FROM LANCOPERDIAIMOB ' +#13+
                         ' WHERE FLGTIPO = ''S''      ' +#13+
                         '   AND IDPARCFINANCIMOV = ' + qryParc.FieldByName('IDPARCFINANCIMOV').AsString;
                 ExecutarQuery(dtmFinanciamento.qryAux,sSql);

                 // Grava o Motivo do abono
                 CalcDocumento.GravarMotivoConciliacao(-1,
                                                       qryParc.FieldByName('IDPARCFINANCIMOV').AsInteger,
                                                       Sistema.IdUsuario, -1, -1, -1,
                                                       qryParc.FieldByName('VLRRESIDUOATUALI').AsFloat,
                                                       memAbono.Text, 'E', dData );

                 // Marchetti - Pendencia 23210
                 if qryParcTOT_ALTERADOR.AsCurrency <> 0 then
                    CalcDocumento.GravarMotivoConciliacao(qryParcCODDOCUMENTO.AsInteger,
                                                          qryParc.FieldByName('IDPARCFINANCIMOV').AsInteger,
                                                          Sistema.IdUsuario, -1, qryParcNUMLANCTO.AsInteger, -1,
                                                          qryParcTOT_ALTERADOR.AsCurrency,
                                                          memAbono.Text, 'U', dData );
                 // Fim Marchetti - Pendencia 23210

                 fTotalRes   := fTotalRes   + qryParcVLRRESIDUOATUALI.AsCurrency;
                 fTotalResAd := fTotalResAd + qryParcTOT_ALTERADOR.AsCurrency;
              end;
              qryParc.Next;
           end;
           qryParc.First;
           qryParc.EnableControls;
        //end;

        fIdLancOperNormal      := -1;
        fIdLancOperAdianto     := -1;

        //_cdsAux.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(qryParc.FieldByName('IDCONTRATOIMOVEL').AsInteger);

        // Marchetti - Pendencia 23210
        if (fTotalRes <= fTotalResAd) and (ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) then
        begin
          {while not _cdsAux.Eof do
          begin
            if _cdsAux.RecNo = _cdsAux.RecordCount then
              dVlrPlano := fTotalResAd - dVlrTotal
            else
              dVlrPlano := ((fTotalResAd * _cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100);
            dVlrTotal := dVlrTotal + dVlrPlano;
           }
            if not CtrlOperImob.GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                     -1,                                                     // dDataBaixa
                                                     ModuloImobiliario.Alienacao.iIDOperAbonoResA,           // iIdOper
                                                     0,                                                      // fVlrDia,
                                                     fTotalResAd,                                          // fVlrAcum
                                                     fTotalResAd,                                          // fVlrTotAcum ???
                                                     qryParc.FieldByName('CODTIPIMOVEL').AsString,           // sTipoImovel
                                                     qryParc.FieldByName('IDCONTRATOIMOVEL').AsInteger,      // iIdContrato
                                                     -1,                                                     // iIdForCli
                                                     -1,                                                     // iCodDocum
                                                     False,                                                  // bGravaDiaNull
                                                     -1,                                                     // IDParcela
                                                     qryParcIDCONDPAGIMOVEL.asInteger,
                                                     False)then//,
                                                     //_cdsAux.FieldByName('IDPATRO').asInteger,
                                                     //_cdsAux.FieldByName('IDPLANOPREV').asInteger) then
               Raise Exception.Create(CtrlOperImob.MessageInfo);
          //  _cdsAux.Next;
         // end;
          fIdLancOperAdianto := CtrlOperImob.IDLancOperDiaImob;
        end;

        if (fTotalRes > fTotalResAd) then
        begin
          //while not _CdsAux.Eof do
          //begin
            if (fTotalResAd <> 0) and (ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) then
            begin
              {if _cdsAux.RecNo = _cdsAux.RecordCount then
                dVlrPlano := fTotalResAd - dVlrTotal
              else
                dVlrPlano := ((fTotalResAd * _cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100);
              dVlrTotal := dVlrTotal + dVlrPlano;}

              if not CtrlOperImob.GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                       -1,                                                     // dDataBaixa
                                                       ModuloImobiliario.Alienacao.iIDOperAbonoResA,           // iIdOper
                                                       0,                                                      // fVlrDia,
                                                       fTotalResAd,                                            // fVlrAcum
                                                       fTotalResAd,                                            // fVlrTotAcum ???
                                                       qryParc.FieldByName('CODTIPIMOVEL').AsString,           // sTipoImovel
                                                       qryParc.FieldByName('IDCONTRATOIMOVEL').AsInteger,      // iIdContrato
                                                       -1,                                                     // iIdForCli
                                                       -1,                                                     // iCodDocum
                                                       False,                                                  // bGravaDiaNull
                                                       -1,                                                     // IDParcela
                                                       qryParcIDCONDPAGIMOVEL.asInteger,
                                                       False) then
                Raise Exception.Create(CtrlOperImob.MessageInfo);
              fIdLancOperAdianto := CtrlOperImob.IDLancOperDiaImob;
            end;

            if (ModuloImobiliario.Alienacao.iIDOperAbonoResN > 0) then
            begin
              {if _cdsAux.RecNo = _cdsAux.RecordCount then
                dVlrPlano := (fTotalRes - fTotalResAd) - dVlrTotal
              else
                dVlrPlano := (((fTotalRes - fTotalResAd) * _cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100);
              dVlrTotal := dVlrTotal + dVlrPlano;}

              if not CtrlOperImob.GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                       -1,                                                     // dDataBaixa
                                                       ModuloImobiliario.Alienacao.iIDOperAbonoResN,           // iIdOper
                                                       0,                                                      // fVlrDia,
                                                       fTotalRes - fTotalResAd,                                // fVlrAcum
                                                       fTotalRes - fTotalResAd,                                // fVlrTotAcum ???
                                                       qryParc.FieldByName('CODTIPIMOVEL').AsString,           // sTipoImovel
                                                       qryParc.FieldByName('IDCONTRATOIMOVEL').AsInteger,      // iIdContrato
                                                       -1,                                                     // iIdForCli
                                                       -1,                                                     // iCodDocum
                                                       False,                                                  // bGravaDiaNull
                                                       -1,                                                     // IDParcela
                                                       qryParcIDCONDPAGIMOVEL.asInteger,
                                                       False) then
                Raise Exception.Create(CtrlOperImob.MessageInfo);
              fIdLancOperNormal := CtrlOperImob.IDLancOperDiaImob;
            end;
           //_cdsAux.Next;
          //end;
        end;

        if (ModuloImobiliario.Alienacao.iIDOperAbonoResN > 0) or
           (ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) then
        begin
            if not CtrlOperImob.GravaLancOperImob(CtrlOperImob.ProgressFileName,
                                                  [ModuloImobiliario.Alienacao.iIDOperAbonoResN,
                                                   ModuloImobiliario.Alienacao.iIDOperAbonoResA],
                                                  dData,
                                                  2, False,
                                                  qryParc.FieldByName('IDCONTRATOIMOVEL').AsInteger) then
               Raise Exception.Create(CtrlOperImob.MessageInfo);

            if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                                ModuloImobiliario.Alienacao.iIDOperAbonoResN,
                                                ModuloImobiliario.Alienacao.iIDOperAbonoResA,
                                                -1, -1, -1,
                                                '', dData, False) then
               Raise Exception.Create(CtrlOperImob.MessageInfo + ' - Não foi possível contabilizar o abono');
        end;

        //with qryParc do begin
           qryParc.DisableControls;
           qryParc.First;
           while not qryParc.eof do begin
              if qryParc.FieldByName('CHKINTEGRA').AsInteger = 1 then
              begin

                 if fIdLancOperNormal > 0 then
                 begin
                    // Atualiza o Flag de RESÍDUO na parcela
                    sSql := 'UPDATE PARCFINANCIMOV ' +
                            '   SET IDLANCOPERNORMAL = ' + FloatToStr(fIdLancOperNormal) +
                    //Cássio - SOL Nº 124540 KINTANA Nº 633512 - Inclusão do campo VLRTOTALRESIDUO
                    //        '       , VLRTOTALRESIDUO = ' + FloatToStr(dVlrTotal) +
                            ' WHERE IDPARCFINANCIMOV = ' + qryParc.FieldByName('IDPARCFINANCIMOV').AsString;
                    ExecutarQuery(dtmFinanciamento.qryAux,sSql);
                 end;

                 if fIdLancOperAdianto > 0 then
                 begin
                    // Atualiza o Flag de RESÍDUO na parcela
                    sSql := 'UPDATE PARCFINANCIMOV ' +
                            '   SET IDLANCOPERADIANTO = ' + FloatToStr(fIdLancOperAdianto) +
                            //Cássio - SOL Nº 124540 KINTANA Nº 633512 - Inclusão do campo VLRTOTALRESIDUO
                    //        '       , VLRTOTALRESIDUO = ' + FloatToStr(dVlrTotal) +
                            ' WHERE IDPARCFINANCIMOV  = ' + qryParc.FieldByName('IDPARCFINANCIMOV').AsString;
                    ExecutarQuery(dtmFinanciamento.qryAux,sSql);
                 end;
              end;
              qryParc.Next;
           end;
           qryParc.First;
           qryParc.EnableControls;
        //end;

        // Fim Marchetti - Pendencia 23210

        CommitTransacao;
     except
        on E : Exception do begin
           Result := False;
           RollBackTransacao;
           MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
        end;
     end;
     //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela     
     FreeAndNil(CtrlOperImob);
   //finally
   // FreeAndNil(_cdsAux);
   //end;
end;

function TfrmExecResiduo.DesfazAbono: boolean;
var sSql : String;
    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
    CtrlOperImob       : TCtrlOperImob;
begin
   Result := True;
   try
      //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela - Inicio
      CtrlOperImob       := TCtrlOperImob.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, Sistema.IDEspAcesso, ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal, Sistema.UsaPlanoPatro);
      CtrlOperImob.InitializeAs(Padroes);

      //Peterson Victor - SIG21683 - Inicio
      {
      if ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0 then
         edDtLimite.Date := CtrlOperImob.UltimoFechamento
      else
         edDtLimite.Date := Date;
      }
      //Peterson Victor - SIG21683 - Fim

      edDtLimite.Date := Date;

      if edDtLimite.Text = '' then edDtLimite.Date := Date;
      //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela - Fim

      // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edDtLimite.Text) then
        raise Exception.Create('Período contábil bloqueado - Data Limite.');
      // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

      // Atualiza o Flag de cobrança na tabela de Parcelas e grava tabela PARCEXTRAIMOVEL
      with qryParc do begin
         DisableControls;
         First;
         while not eof do begin
            if FieldByName('CHKINTEGRA').AsInteger = 1 then begin
               // Atualiza o Flag de RESÍDUO na parcela
               sSql := 'UPDATE PARCFINANCIMOV ' +
                       '   SET IDLANCOPERNORMAL = NULL, IDLANCOPERADIANTO = NULL, FLGRESIDUOINCORP = ' + QuotedStr('N') +
                       ' WHERE IDPARCFINANCIMOV = ' + qryParc.FieldByName('IDPARCFINANCIMOV').AsString;

               ExecutarQuery(dtmFinanciamento.qryAux,sSql);

               // Grava o Motivo do abono
               CalcDocumento.ApagarMotivoConciliacao(-1,
                                                     qryParc.FieldByName('IDPARCFINANCIMOV').AsInteger,
                                                     'E');

               // Marchetti - Pendencia 23210
               CalcDocumento.ApagarMotivoConciliacao(qryParcCODDOCUMENTO.AsInteger,
                                                     qryParc.FieldByName('IDPARCFINANCIMOV').AsInteger,
                                                     'U');
               // Fim Marchetti - Pendencia 23210
            end;
            Next;
         end;

         // Marchetti - Pendencia 23210
         if (ModuloImobiliario.Alienacao.iIDOperAbonoResN > 0) or
            (ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) then
         begin
             if not CtrlOperImob.Reprocessamento(CtrlOperImob.ProgressFileName,
                                                 [ModuloImobiliario.Alienacao.iIDOperAbonoResN,
                                                  ModuloImobiliario.Alienacao.iIDOperAbonoResA],
                                                  edDtLimite.Date,
                                                  qryParc.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                  False, True, True) then
                Raise Exception.Create(CtrlOperImob.MessageInfo);

             if not CtrlOperImob.GravaLancOperImob(CtrlOperImob.ProgressFileName,
                                                   [ModuloImobiliario.Alienacao.iIDOperAbonoResN,
                                                    ModuloImobiliario.Alienacao.iIDOperAbonoResA],
                                                   edDtLimite.Date,
                                                   2, False,
                                                   qryParc.FieldByName('IDCONTRATOIMOVEL').AsInteger) then
                Raise Exception.Create(CtrlOperImob.MessageInfo);


             if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                                 ModuloImobiliario.Alienacao.iIDOperAbonoResN,
                                                 ModuloImobiliario.Alienacao.iIDOperAbonoResA,
                                                 -1, -1, -1,
                                                 '', edDtLimite.Date, False) then
                Raise Exception.Create(CtrlOperImob.MessageInfo + ' - Não foi possível contabilizar o abono');
         end;

         // Fim Marchetti - Pendencia 23210
         First;
         EnableControls;
      end;

      CommitTransacao;
   except
      on E : Exception do begin
         Result := False;
         RollBackTransacao;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
   //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
   FreeAndNil(CtrlOperImob);
end;

procedure TfrmExecResiduo.CorrigeResiduo;
var bEof : Boolean;
    fVlrTotal, fCM : Extended;
    dInicio, dLimite : TDateTime;
    iCondPag, iIndice, iMesRef : Integer;
    iRecAlt, iRecNo : TBookmark;
    fTotRes, fTotResAtual, fTotResAd : Extended;
begin
   // corrige resíduo em atraso até o dia...
   if  edDtLimite.Text = '' then
        dLimite := Date()
   else dLimite := edDtLimite.Date;

   fTotRes      := 0;
   fTotResAtual := 0;
   fTotResAd    := 0;
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.eof do begin
      fVlrTotal := 0;
      fCM       := 0;
      iCondPag  := qryParcIDCONDPAGIMOVEL.AsInteger;
      while (qryParcIDCONDPAGIMOVEL.AsInteger = iCondPag) and (not qryParc.eof) do begin
         if qryParcFLGRESIDUOINCORP.AsString = 'N' then begin
            iIndice  := qryParcINDCORRECAO.AsInteger;
            iMesRef  := qryParcMESREFREAJUSTE.AsInteger;
            dInicio  := qryParcDATAVENCIMENTO.AsDateTime;

            fTotRes := fTotRes + qryParcVLRRESIDUO.AsFloat;            

            if (qryParcVLRRESIDUO.AsFloat > 0) then
            begin
               if (dInicio < dLimite) then begin
                  fCM := ComunsImobiliario.Arredonda(
                         CalcDocumento.CalcCM(qryParcVLRRESIDUO.AsFloat, iIndice,
                                              dInicio + 1, dLimite, iMesRef), 2);
                  if fCM > 0 then begin
                     qryParc.Edit;
                     qryParcVLRRESIDUOATUALI.AsFloat := qryParcVLRRESIDUO.AsFloat + fCM;
                     qryParc.Post;
                     fTotResAtual := fTotResAtual + qryParcVLRRESIDUO.AsFloat + fCM;
                     fTotResAd    := fTotResAd + qryParcTOT_ALTERADOR.AsFloat;
                  end;
               end
               else
               begin
                  fTotResAtual := fTotResAtual + qryParcVLRRESIDUO.AsFloat;
                  qryParc.Edit;
                  qryParcVLRRESIDUOATUALI.AsFloat := qryParcVLRRESIDUO.AsFloat;
                  qryParc.Post;
               end;
            end;
         end;
         qryParc.Next;
      end;
   end;

   grdParc.ColumnByName('VLRRESIDUO').FooterValue := FormatFloat('###,###0.00', fTotRes);
   grdParc.ColumnByName('VLRRESIDUOATUALI').FooterValue := FormatFloat('###,###0.00', fTotResAtual);
   grdParc.ColumnByName('TOT_ALTERADOR').FooterValue := FormatFloat('###,###0.00', fTotResAd);

   qryParc.First;
   qryParc.EnableControls;
end;


procedure TfrmExecResiduo.MontaQuery;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                                       + #13 +
   '     (0) CHKINTEGRA, '                                                                         + #13 +
   '     MIN(CI.IDCONTRATOIMOVEL)   AS IDCONTRATOIMOVEL, '                                         + #13 +
   '     MIN(CI.CONNUMERO)          AS NUMCONTRATO, '                                              + #13 +
   '     MIN(CI.CONNOME)            AS NOMECONTRATO, '                                             + #13 +
   '     MIN(IM.NOMEMESTRE)         AS NOMEMESTRE, '                                               + #13 +
   '     MIN(IM.CODTIPIMOVEL)       AS CODTIPIMOVEL, '                                             + #13 +
   '     PR.IDPARCFINANCIMOV, '                                                                    + #13 +
   '     PR.IDCONDPAGIMOVEL, '                                                                     + #13 +
   '     MIN(PR.DATAVENCIMENTO)     AS DATAVENCIMENTO, '                                           + #13 +
   '     MIN(PR.NUMPARCELA)         AS NUMPARCELA, '                                               + #13 +
   '     MIN(CP.NUMPARCELAS)        AS NUMPARCELAS, '                                              + #13 +
   '     MIN(CP.FORMACALCULO)       AS FORMACALCULO, '                                             + #13 +
   '     MIN(CP.INDCORRECAO)        AS INDCORRECAO, '                                              + #13 +
   '     MIN(CP.MESREFREAJUSTE)     AS MESREFREAJUSTE, '                                           + #13 +
   '     MIN(PR.VLRPRESTACAO)       AS VLRPRESTACAO, '                                             + #13 +
   '     MIN(NVL(PR.FLGRESIDUOINCORP,''N'')) AS FLGRESIDUOINCORP, '                                + #13 +
   '     MIN(PR.VLRPRESTATUALIZADA) AS VLRPRESTATUALIZADA, '                                       + #13 +
   '     ROUND(MIN(PR.VLRRESIDUO),2) AS VLRRESIDUO, '                                              + #13;

   if ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0 then begin
      sSQL := sSQL +
      '     ROUND(NVL(MIN(PR.VLRRESIDUO),0)+NVL(MIN(RES.VLRRESIDUO),0),2) AS VLRRESIDUOATUALI, '                 + #13
   end else begin
      sSQL := sSQL +
      '     (0)                          AS VLRRESIDUOATUALI, '                                    + #13;
   end;

   sSQL := sSQL +
   '     MIN(CI.IDLOCATARIO)        AS IDPESSOA, '                                                 + #13 +
   '     MIN(P.RAZAOSOCIAL)         AS RAZAOSOCIAL, '                                              + #13 +
   '     MIN(PR.FLGTIPOLANC)        AS FLGTIPOLANC, '                                              + #13 +
   '     DECODE(MIN(CI.CODPORTFORMA), NULL, -1, MIN(CI.CODPORTFORMA)) AS CODPORTFORMA, '           + #13 +
   '     DECODE(MIN(PF.CODFORMA), NULL, -1, MIN(PF.CODFORMA)) AS CODFORMA, '                       + #13 +
   '     CI.FLGTIPOCONTRATO, '                                                                     + #13 +
   '     MIN(NVL(ALT.TOT_ALTERADOR,0))     AS TOT_ALTERADOR, '                                     + #13 +
   '     MIN(PR.IDLANCOPERNORMAL)          AS IDLANCOPERNORMAL, '                                  + #13 +
   '     MIN(PR.IDLANCOPERADIANTO)         AS IDLANCOPERADIANTO, '                                 + #13 +
   '     MIN(ALT.NUMLANCTO)                AS NUMLANCTO, '                                         + #13 +
   '     MIN(ALT.CODDOCUMENTO)             AS CODDOCUMENTO '                                       + #13 +

   'FROM '                                                                                         + #13 +
   '     PARCFINANCIMOV PR, '                                                                      + #13 +
   '     CONDPAGIMOVEL CP, '                                                                       + #13 +
   '     CONTRATOIMOVEL CI, '                                                                      + #13 +
   '     PESSOA P, '                                                                               + #13 +
   '     PORTADORFORMA PF, '                                                                       + #13;

   if ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0 then
   begin
      sSQL := sSQL +
      '     ( SELECT /*+ INDEX (L) */                 '                                            + #13 +
      '              L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRRESIDUO     '                        + #13 +
      '         FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,                 '                        + #13 +
      '              ( SELECT MAX(L2.DATAOPER) AS DTAPUR                  '                        + #13 +
      '                  FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2       '                        + #13 +
      '                 WHERE P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +
      '                   AND ( L2.IDOPERACAO = P2.IDOPERATUALRES)      '                          + #13 +
      '                   AND ( (:pDATAD IS NOT NULL AND DATAOPER <= :pDATAD) OR '                 + #13 +
      '                         (:pDATAD IS NULL AND DATAOPER <= SYSDATE) ) ) D  '                 + #13 +
      '        WHERE L.DATAOPER = D.DTAPUR    '                                                    + #13 +
      '          AND P.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)                                  + #13 +
      '          AND ( L.IDOPERACAO = P.IDOPERATUALRES )  '                                        + #13 +
      '        GROUP BY L.IDPARCFINANCIMOV                  '                                      + #13 +
      '      ) RES,                                         '                                      + #13;
   end;

   sSQL := sSQL +
   '     ( SELECT CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '                                      + #13 +
   '              M.IMONOME            AS NOMEMESTRE, '                                            + #13 +
   '              I.CODTIPIMOVEL       AS CODTIPIMOVEL '                                           + #13 +
   '       FROM '                                                                                  + #13 +
   '              CONTRATOXIMOVEL CXI, '                                                           + #13 +
   '              IMOVEL I, '                                                                      + #13 +
   '              IMOVEL M  '                                                                      + #13 +
   '       WHERE '                                                                                 + #13 +
   '              CXI.IDIMOVEL = I.IDIMOVEL AND '                                                  + #13 +
   '              I.IDIMOVELMESTRE = M.IDIMOVEL ) IM, '                                            + #13 +
   '     ( '                                                                                       + #13 +
   '      SELECT PR.CODDOCUMENTO, MIN(L.NUMLANCTO) AS NUMLANCTO, NVL(SUM(VALOR),0) AS TOT_ALTERADOR ' + #13 +
   '      FROM LANCTODOCUM L, PARCFINANCIMOV PR '                                                  + #13 +
   '      WHERE L.CODDOCUMENTO = PR.CODDOCUMENTO '                                                 + #13 +
   '      AND   L.CODALTERADOR = ' + IntToStr(ModuloImobiliario.Alienacao.iCodAlteradorAdRes)      + #13 +
   '      AND   (NVL(PR.FLGRESIDUOINCORP,''N'') = :pFLGRESIDUO) '                                  + #13 +
   '      AND ((:pDATAI IS NULL) OR (PR.DATAVENCIMENTO >= :pDATAI)) '                              + #13 +
   '      AND ((:pDATAF IS NULL) OR (PR.DATAVENCIMENTO <= :pDATAF)) '                              + #13 +
   '      AND ((:pIDCONDPAG IS NULL) OR (PR.IDCONDPAGIMOVEL = :pIDCONDPAG)) '                      + #13;

   if rgTipo.ItemIndex in [0,1] then
      sSQL := sSQL + '      AND NOT EXISTS (SELECT 1 FROM CONCILIADOC'                             + #13
   else
      sSQL := sSQL + '      AND EXISTS (SELECT 1 FROM CONCILIADOC'                                 + #13;

   sSQL := sSQL +
   '                      WHERE IDDOCUMENTO = PR.CODDOCUMENTO'                                     + #13 +
   '                      AND FLGTIPO       = ''U'''                                               + #13 +
   '                     AND   NUMLANCTO    = L.NUMLANCTO)'                                        + #13 +
   '      GROUP BY PR.CODDOCUMENTO '                                                               + #13 +
   '     ) ALT '                                                                                   + #13 +
   'WHERE  (NVL(PR.FLGRESIDUOINCORP,''N'') = :pFLGRESIDUO) '                                       + #13 +
   '   AND ( ( CP.FORMACALCULO IN(1,4,8,9,10,12,13,17) AND NVL(PR.VLRRESIDUO,0) <> 0) OR (NVL(PR.VLRRESIDUOATUALI,0) <> 0) ) ' + #13 +
   '   AND (PR.FLGLANCINTEGRA > 1) '                                                               + #13 +
   '   AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL) '                                           + #13 +
   '   AND (CP.IDCONDPAGIMOVEL = PR.IDCONDPAGIMOVEL) '                                             + #13 +
   '   AND (CI.IDLOCATARIO = P.IDPESSOA) '                                                         + #13 +
   '   AND (CI.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL(+)) '                                        + #13 +
   '   AND (CI.CODPORTFORMA = PF.CODPORTFORMA(+)) '                                                + #13 +
   '   AND ((:pDATAI IS NULL) OR (PR.DATAVENCIMENTO >= :pDATAI)) '                                 + #13 +
   '   AND ((:pDATAF IS NULL) OR (PR.DATAVENCIMENTO <= :pDATAF)) '                                 + #13 +
   '   AND ((:pIDPESSOA IS NULL) OR (CI.IDLOCATARIO = :pIDPESSOA)) '                               + #13 +
   '   AND ((:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pIDRESPONSAVEL)) '                   + #13 +
   '   AND ((:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pIDADMINIMOVEL)) '                   + #13 +
   '   AND ((:pIDCONTRATO IS NULL) OR (CI.IDCONTRATOIMOVEL = :pIDCONTRATO)) '                      + #13 +
   '   AND (PR.CODDOCUMENTO = ALT.CODDOCUMENTO(+))'                                                + #13 +
   '   AND ((:pIDCONDPAG IS NULL) OR (PR.IDCONDPAGIMOVEL = :pIDCONDPAG)) '                         + #13;


   if rgTipo.ItemIndex = 2 then
   begin
      if (ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) or
         (ModuloImobiliario.Alienacao.iIDOperAbonoResN > 0) then
      begin

         if (ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) and (ModuloImobiliario.Alienacao.iIDOperAbonoResN > 0) then
         begin
            sSQL := sSQL +
            '   AND (' + #13 +
            '        (PR.IDLANCOPERNORMAL = (SELECT L.IDLANCOPERDIAIMOB' + #13 +
            '                                FROM   LANCOPERDIAIMOB L' + #13 +
            '                                WHERE  L.DATAOPER = :pDATAD' + #13 +
            '                                AND    L.IDCONTRATOIMOVEL = :pIDCONTRATO' + #13 +
            '                                AND    L.IDOPERACAO = ' + IntToStr(ModuloImobiliario.Alienacao.iIDOperAbonoResN) + '))' + #13 +
            '     OR (PR.IDLANCOPERADIANTO = (SELECT L.IDLANCOPERDIAIMOB' + #13 +
            '                                 FROM   LANCOPERDIAIMOB L' + #13 +
            '                                 WHERE  L.DATAOPER = :pDATAD' + #13 +
            '                                 AND    L.IDCONTRATOIMOVEL = :pIDCONTRATO' + #13 +
            '                                 AND    L.IDOPERACAO = ' + IntToStr(ModuloImobiliario.Alienacao.iIDOperAbonoResA) + '))' + #13 +
            '       )' + #13;
         end;

         if (ModuloImobiliario.Alienacao.iIDOperAbonoResN > 0) and (ModuloImobiliario.Alienacao.iIDOperAbonoResN < 0) then
         begin
            sSQL := sSQL +
            '   AND (' + #13 +
            '        (PR.IDLANCOPERNORMAL = (SELECT L.IDLANCOPERDIAIMOB' + #13 +
            '                                FROM   LANCOPERDIAIMOB L' + #13 +
            '                                WHERE  L.DATAOPER = :pDATAD' + #13 +
            '                                AND    L.IDCONTRATOIMOVEL = :pIDCONTRATO' + #13 +
            '                                AND    L.IDOPERACAO = ' + IntToStr(ModuloImobiliario.Alienacao.iIDOperAbonoResN) + '))' + #13 +
            '       )' + #13;
         end;

         if (ModuloImobiliario.Alienacao.iIDOperAbonoResN < 0) and (ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) then
         begin
            sSQL := sSQL +
            '   AND (' + #13 +
            '        (PR.IDLANCOPERADIANTO = (SELECT L.IDLANCOPERDIAIMOB' + #13 +
            '                                 FROM   LANCOPERDIAIMOB L' + #13 +
            '                                 WHERE  L.DATAOPER = :pDATAD' + #13 +
            '                                 AND    L.IDCONTRATOIMOVEL = :pIDCONTRATO' + #13 +
            '                                 AND    L.IDOPERACAO = ' + IntToStr(ModuloImobiliario.Alienacao.iIDOperAbonoResA) + '))' + #13 +
            '       )' + #13;
         end;
      end;
   end;

   if ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0 then
   begin
      sSQL := sSQL +
      '   AND PR.IDPARCFINANCIMOV = RES.IDPARCFINANCIMOV(+) '                                      + #13;
   end;


   sSQL := sSQL +
   'GROUP BY PR.IDCONDPAGIMOVEL, PR.IDPARCFINANCIMOV, CI.FLGTIPOCONTRATO '                         + #13 +
   'ORDER BY DATAVENCIMENTO '                                                                      + #13;

   qryParc.Sql.Text := sSQL;
end;



procedure TfrmExecResiduo.FormDestroy(Sender: TObject);
begin
   FreeAndNil(CtrlDocumento);
   FreeAndNil(CtrlPadrLancImovel);
   FreeAndNil(CtrlLancamento);
   //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
   FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
   inherited;
end;

procedure TfrmExecResiduo.sbMarcaTodasClick(Sender: TObject);
begin
  inherited;
   // Marca tudo...
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.eof do begin
      qryParc.Edit;
      qryParcCHKINTEGRA.AsInteger := 1;
      qryParc.Post;
      qryParc.Next;
   end;
   qryParc.First;
   qryParc.EnableControls;
end;

procedure TfrmExecResiduo.sbDesmarcaTodasClick(Sender: TObject);
begin
  inherited;
   // Desmarca tudo...
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.eof do begin
      qryParc.Edit;
      qryParcCHKINTEGRA.Clear;
      qryParc.Post;
      qryParc.Next;
   end;
   qryParc.First;
   qryParc.EnableControls;
end;



procedure TfrmExecResiduo.MontaQueryCBS;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                                       + #13 +
   '     (0) CHKINTEGRA, '                                                                         + #13 +
   '     MIN(CI.IDCONTRATOIMOVEL)   AS IDCONTRATOIMOVEL, '                                         + #13 +
   '     MIN(CI.CONNUMERO)          AS NUMCONTRATO, '                                              + #13 +
   '     MIN(CI.CONNOME)            AS NOMECONTRATO, '                                             + #13 +
   '     MIN(IM.NOMEMESTRE)         AS NOMEMESTRE, '                                               + #13 +
   '     MIN(IM.CODTIPIMOVEL)       AS CODTIPIMOVEL, '                                             + #13 +
   '     PR.IDPARCFINANCIMOV, '                                                                    + #13 +
   '     PR.IDCONDPAGIMOVEL, '                                                                     + #13 +
   '     MIN(PR.DATAVENCIMENTO)     AS DATAVENCIMENTO, '                                           + #13 +
   '     MIN(PR.NUMPARCELA)         AS NUMPARCELA, '                                               + #13 +
   '     MIN(CP.NUMPARCELAS)        AS NUMPARCELAS, '                                              + #13 +
   '     MIN(CP.FORMACALCULO)       AS FORMACALCULO, '                                             + #13 +
   '     MIN(CP.INDCORRECAO)        AS INDCORRECAO, '                                              + #13 +
   '     MIN(CP.MESREFREAJUSTE)     AS MESREFREAJUSTE, '                                           + #13 +
   '     MIN(PR.VLRPRESTACAO)       AS VLRPRESTACAO, '                                             + #13 +
   '     MIN(NVL(PR.FLGRESIDUOINCORP,''N'')) AS FLGRESIDUOINCORP, '                                + #13 +
   '     MIN(PR.VLRPRESTATUALIZADA) AS VLRPRESTATUALIZADA, '                                       + #13 +
   '     ROUND(MIN(NVL(PR.VLRRESIDUO,0)+NVL(PR.VLRCORRSALDO,0)),2) AS VLRRESIDUO, '                              + #13;

   if ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0 then begin
      sSQL := sSQL +
      '     ROUND(NVL(MIN(PR.VLRCORRSALDO),0)+NVL(MIN(PR.VLRRESIDUO),0)+NVL(MIN(RES.VLRRESIDUO),0),2) AS VLRRESIDUOATUALI, ' + #13
   end else begin
      sSQL := sSQL +
      '     (0)                          AS VLRRESIDUOATUALI, '                                    + #13;
   end;

   sSQL := sSQL +
   '     MIN(CI.IDLOCATARIO)        AS IDPESSOA, '                                                 + #13 +
   '     MIN(P.RAZAOSOCIAL)         AS RAZAOSOCIAL, '                                              + #13 +
   '     MIN(PR.FLGTIPOLANC)        AS FLGTIPOLANC, '                                              + #13 +
   '     DECODE(MIN(CI.CODPORTFORMA), NULL, -1, MIN(CI.CODPORTFORMA)) AS CODPORTFORMA, '           + #13 +
   '     DECODE(MIN(PF.CODFORMA), NULL, -1, MIN(PF.CODFORMA)) AS CODFORMA, '                       + #13 +
   '     CI.FLGTIPOCONTRATO, '                                                                     + #13 +
   '     MIN(NVL(ALT.TOT_ALTERADOR,0))     AS TOT_ALTERADOR, '                                     + #13 +
   '     MIN(PR.IDLANCOPERNORMAL)          AS IDLANCOPERNORMAL, '                                  + #13 +
   '     MIN(PR.IDLANCOPERADIANTO)         AS IDLANCOPERADIANTO, '                                 + #13 +
   '     MIN(ALT.NUMLANCTO)                AS NUMLANCTO, '                                         + #13 +
   '     MIN(ALT.CODDOCUMENTO)             AS CODDOCUMENTO '                                       + #13 +
   'FROM '                                                                                         + #13 +
   '     PARCFINANCIMOV PR, '                                                                      + #13 +
   '     CONDPAGIMOVEL CP, '                                                                       + #13 +
   '     CONTRATOIMOVEL CI, '                                                                      + #13 +
   '     PESSOA P, '                                                                               + #13 +
   '     PORTADORFORMA PF, '                                                                       + #13;

   if ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0 then
   begin
      sSQL := sSQL +
      '     ( SELECT /*+ INDEX (L) */                 '                                            + #13 +
      '              L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRRESIDUO     '                        + #13 +
      '         FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,                 '                        + #13 +
      '              ( SELECT MAX(L2.DATAOPER) AS DTAPUR                  '                        + #13 +
      '                  FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2       '                        + #13 +
      '                 WHERE P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +
      '                   AND ( L2.IDOPERACAO = P2.IDOPERATUALRES)      '                          + #13 +
      '                   AND (:pIDCONTRATO IS NULL OR L2.IDCONTRATOIMOVEL = :pIDCONTRATO) '       + #13 +
      '                   AND ( (:pDATAD IS NOT NULL AND DATAOPER <= :pDATAD) OR '                 + #13 +
      '                         (:pDATAD IS NULL AND DATAOPER <= SYSDATE) ) ) D  '                 + #13 +
      '        WHERE L.DATAOPER = D.DTAPUR    '                                                    + #13 +
      '          AND P.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)                                  + #13 +
      '          AND ( L.IDOPERACAO = P.IDOPERATUALRES )  '                                        + #13 +
      '          AND (:pIDCONTRATO IS NULL OR L.IDCONTRATOIMOVEL = :pIDCONTRATO) '                 + #13 +
      '        GROUP BY L.IDPARCFINANCIMOV                  '                                      + #13 +
      '      ) RES,                                         '                                      + #13;
   end;

   sSQL := sSQL +
   '     ( SELECT CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '                                      + #13 +
   '              M.IMONOME            AS NOMEMESTRE, '                                            + #13 +
   '              I.CODTIPIMOVEL       AS CODTIPIMOVEL '                                           + #13 +
   '       FROM '                                                                                  + #13 +
   '              CONTRATOXIMOVEL CXI, '                                                           + #13 +
   '              IMOVEL I, '                                                                      + #13 +
   '              IMOVEL M  '                                                                      + #13 +
   '       WHERE '                                                                                 + #13 +
   '              CXI.IDIMOVEL = I.IDIMOVEL AND '                                                  + #13 +
   '              (:pIDCONTRATO IS NULL OR L.IDCONTRATOIMOVEL = :pIDCONTRATO) AND '                + #13 +
   '              I.IDIMOVELMESTRE = M.IDIMOVEL ) IM, '                                            + #13 +
   '     ('                                                                                        + #13 +
   '      SELECT PR.CODDOCUMENTO, MIN(L.NUMLANCTO) AS NUMLANCTO, NVL(SUM(VALOR),0) AS TOT_ALTERADOR'  + #13 +
   '      FROM LANCTODOCUM L, PARCFINANCIMOV PR'                                                   + #13 +
   '      WHERE L.CODDOCUMENTO = PR.CODDOCUMENTO'                                                  + #13 +
   '      AND   L.CODALTERADOR = ' + IntToStr(ModuloImobiliario.Alienacao.iCodAlteradorAdRes)      + #13 +
   '      AND   (NVL(PR.FLGRESIDUOINCORP,''N'') = :pFLGRESIDUO)'                                   + #13 +
   '      AND ((:pDATAI IS NULL) OR (PR.DATAVENCIMENTO >= :pDATAI)) '                              + #13 +
   '      AND ((:pDATAF IS NULL) OR (PR.DATAVENCIMENTO <= :pDATAF)) '                              + #13 +
   '      AND ((:pIDCONDPAG IS NULL) OR (PR.IDCONDPAGIMOVEL = :pIDCONDPAG)) '                      + #13;

   if rgTipo.ItemIndex in [0,1] then
      sSQL := sSQL + '      AND NOT EXISTS (SELECT 1 FROM CONCILIADOC'                             + #13
   else
      sSQL := sSQL + '      AND EXISTS (SELECT 1 FROM CONCILIADOC'                                 + #13;

   sSQL := sSQL + 
   '                      WHERE IDDOCUMENTO = PR.CODDOCUMENTO'                                     + #13 +
   '                      AND FLGTIPO       = ''U'''                                               + #13 +
   '                     AND   NUMLANCTO    = L.NUMLANCTO)'                                        + #13 +
   '      GROUP BY PR.CODDOCUMENTO'                                                                + #13 +
   '      ) ALT'                                                                                   + #13 +
   'WHERE  (NVL(PR.FLGRESIDUOINCORP,''N'') = :pFLGRESIDUO) '                                       + #13 +
   '   AND ( ( CP.FORMACALCULO IN(14,16) AND (NVL(PR.VLRRESIDUO,0)+NVL(PR.VLRCORRSALDO,0)) <> 0) OR (NVL(PR.VLRRESIDUOATUALI,0) <> 0) ) ' + #13 +
   '   AND (PR.FLGLANCINTEGRA > 1) '                                                               + #13 +
   '   AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL) '                                           + #13 +
   '   AND (CP.IDCONDPAGIMOVEL = PR.IDCONDPAGIMOVEL) '                                             + #13 +
   '   AND (CI.IDLOCATARIO = P.IDPESSOA) '                                                         + #13 +
   '   AND (CI.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL(+)) '                                        + #13 +
   '   AND (CI.CODPORTFORMA = PF.CODPORTFORMA(+)) '                                                + #13 +
   '   AND ((:pDATAI IS NULL) OR (PR.DATAVENCIMENTO >= :pDATAI)) '                                 + #13 +
   '   AND ((:pDATAF IS NULL) OR (PR.DATAVENCIMENTO <= :pDATAF)) '                                 + #13 +
   '   AND ((:pIDPESSOA IS NULL) OR (CI.IDLOCATARIO = :pIDPESSOA)) '                               + #13 +
   '   AND ((:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pIDRESPONSAVEL)) '                   + #13 +
   '   AND ((:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pIDADMINIMOVEL)) '                   + #13 +
   '   AND ((:pIDCONTRATO IS NULL) OR (CI.IDCONTRATOIMOVEL = :pIDCONTRATO)) '                      + #13 +
   '   AND (PR.CODDOCUMENTO = ALT.CODDOCUMENTO(+)) '                                               + #13 +

   '   AND ((:pIDCONDPAG IS NULL) OR (PR.IDCONDPAGIMOVEL = :pIDCONDPAG)) '                         + #13;

   if rgTipo.ItemIndex = 2 then
   begin
      if (ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) or
         (ModuloImobiliario.Alienacao.iIDOperAbonoResN > 0) then
      begin

         if (ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) and (ModuloImobiliario.Alienacao.iIDOperAbonoResN > 0) then
         begin
            sSQL := sSQL +
            '   AND (' + #13 +
            '        (PR.IDLANCOPERNORMAL = (SELECT L.IDLANCOPERDIAIMOB' + #13 +
            '                                FROM   LANCOPERDIAIMOB L' + #13 +
            '                                WHERE  L.DATAOPER = :pDATAD' + #13 +
            '                                AND    L.IDCONTRATOIMOVEL = :pIDCONTRATO' + #13 +
            '                                AND    L.IDOPERACAO = ' + IntToStr(ModuloImobiliario.Alienacao.iIDOperAbonoResN) + '))' + #13 +
            '     OR (PR.IDLANCOPERADIANTO = (SELECT L.IDLANCOPERDIAIMOB' + #13 +
            '                                 FROM   LANCOPERDIAIMOB L' + #13 +
            '                                 WHERE  L.DATAOPER = :pDATAD' + #13 +
            '                                 AND    L.IDCONTRATOIMOVEL = :pIDCONTRATO' + #13 +
            '                                 AND    L.IDOPERACAO = ' + IntToStr(ModuloImobiliario.Alienacao.iIDOperAbonoResA) + '))' + #13 +
            '       )' + #13;
         end;

         if (ModuloImobiliario.Alienacao.iIDOperAbonoResN > 0) and (ModuloImobiliario.Alienacao.iIDOperAbonoResN < 0) then
         begin
            sSQL := sSQL +
            '   AND (' + #13 +
            '        (PR.IDLANCOPERNORMAL = (SELECT L.IDLANCOPERDIAIMOB' + #13 +
            '                                FROM   LANCOPERDIAIMOB L' + #13 +
            '                                WHERE  L.DATAOPER = :pDATAD' + #13 +
            '                                AND    L.IDCONTRATOIMOVEL = :pIDCONTRATO' + #13 +
            '                                AND    L.IDOPERACAO = ' + IntToStr(ModuloImobiliario.Alienacao.iIDOperAbonoResN) + '))' + #13 +
            '       )' + #13;
         end;

         if (ModuloImobiliario.Alienacao.iIDOperAbonoResN < 0) and (ModuloImobiliario.Alienacao.iIDOperAbonoResA > 0) then
         begin
            sSQL := sSQL +
            '   AND (' + #13 +
            '        (PR.IDLANCOPERADIANTO = (SELECT L.IDLANCOPERDIAIMOB' + #13 +
            '                                 FROM   LANCOPERDIAIMOB L' + #13 +
            '                                 WHERE  L.DATAOPER = :pDATAD' + #13 +
            '                                 AND    L.IDCONTRATOIMOVEL = :pIDCONTRATO' + #13 +
            '                                 AND    L.IDOPERACAO = ' + IntToStr(ModuloImobiliario.Alienacao.iIDOperAbonoResA) + '))' + #13 +
            '       )' + #13;
         end;
      end;
   end;

   if ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0 then
   begin
      sSQL := sSQL +
      '   AND PR.IDPARCFINANCIMOV = RES.IDPARCFINANCIMOV(+) '                                      + #13;
   end;

   sSQL := sSQL +
   'GROUP BY PR.IDCONDPAGIMOVEL, PR.IDPARCFINANCIMOV, CI.FLGTIPOCONTRATO '                         + #13 +
   'ORDER BY DATAVENCIMENTO '                                                                      + #13;

   qryParc.Sql.Text := sSQL;
end;

//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela

procedure TfrmExecResiduo.AtualizaGrid;
var bEof : Boolean;
    fVlrTotal, fCM : Extended;
    dInicio, dLimite : TDateTime;
    iCondPag, iIndice, iMesRef : Integer;
    iRecAlt, iRecNo : TBookmark;
    fTotRes, fTotResAtual, fTotResAd : Extended;
begin
   // corrige resíduo em atraso até o dia...
   if  edDtLimite.Text = '' then
        dLimite := Date()
   else dLimite := edDtLimite.Date;

   fTotRes      := 0;
   fTotResAtual := 0;
   fTotResAd    := 0;
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.eof do begin
      fVlrTotal := 0;
      fCM       := 0;
      iCondPag  := qryParcIDCONDPAGIMOVEL.AsInteger;
      while (qryParcIDCONDPAGIMOVEL.AsInteger = iCondPag) and (not qryParc.eof) do begin
         if qryParcFLGRESIDUOINCORP.AsString = 'N' then begin
            iIndice  := qryParcINDCORRECAO.AsInteger;
            iMesRef  := qryParcMESREFREAJUSTE.AsInteger;
            dInicio  := qryParcDATAVENCIMENTO.AsDateTime;

            if (qryParcVLRRESIDUO.AsFloat > 0) then
            begin
               qryParc.Edit;
               qryParcVLRRESIDUOATUALI.AsFloat := qryParcVLRRESIDUO.AsFloat;
               qryParc.Post;
               fTotRes := fTotRes + qryParcVLRRESIDUO.AsFloat;
               fTotResAtual := fTotResAtual + qryParcVLRRESIDUO.AsFloat;
               fTotResAd    := fTotResAd + qryParcTOT_ALTERADOR.AsFloat;
            end;
         end;
         qryParc.Next;
      end;
   end;

   grdParc.ColumnByName('VLRRESIDUO').FooterValue := FormatFloat('###,###0.00', fTotRes);
   grdParc.ColumnByName('VLRRESIDUOATUALI').FooterValue := FormatFloat('###,###0.00', fTotResAtual);
   grdParc.ColumnByName('TOT_ALTERADOR').FooterValue := FormatFloat('###,###0.00', fTotResAd);

   qryParc.First;
   qryParc.EnableControls;
end;

end.
