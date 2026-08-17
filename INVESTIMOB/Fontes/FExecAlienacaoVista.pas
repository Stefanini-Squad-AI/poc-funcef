unit FExecAlienacaoVista;

//--------------------------------------------------------------------------------
//Rotina......: -
//Nº SOL......: 172902/8222
//Nº KINTANA..: 1577546
//Data........: 28/03/2012
//Responsável.: Wylliam Leite da Silva
//Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
// ------------------------------------------------------------------------------------------------
//
//      Executa Alienação de Imóveis à Vista
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  06/12/2001
//	Data de Término   :
//
// ------------------ -------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, mImovelouMestre,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, fcButton, fcImgBtn,
  fcShapeBtn, fcLabel, ComCtrls, mImovel, Mask, DBCtrls, mImovelInativo,
  Db, Wwdatsrc, DBTables, Wwquery, mFornecedor, TREdit, wwdbedit, Wwdotdot,
  Wwdbcomb, mLocalizacao, mClasseBem, mImovelAtivo, mCliente, Wwdbspin,
  {uCtrlMovBaixa}uCtrlImobMovBaixa, uCtrlBem, uCtrlParamCAF,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab;

type
  TfrmExecAlienacaoVista = class(TfrmSairAjudaImob)
    lblTitulo: TfcLabel;
    dsImovelxbem: TwwDataSource;
    ntbPrincipal: TNotebook;
    Bevel2: TBevel;
    Bevel1: TBevel;
    btnContinuaSelecao: TfcShapeBtn;
    Bevel4: TBevel;
    Panel1: TPanel;
    dbgBens: TwwDBGrid;
    fcShapeBtn8: TfcShapeBtn;
    Bevel5: TBevel;
    fcShapeBtn2: TfcShapeBtn;
    qryUpdImovel: TwwQuery;
    molCliente1: TmolCliente;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtLinha1: TEdit;
    edtLinha2: TEdit;
    edtLinha3: TEdit;
    edtLinha4: TEdit;
    edtLinha5: TEdit;
    edtLinha6: TEdit;
    edtLinha7: TEdit;
    edtLinha8: TEdit;
    edtLinha9: TEdit;
    btnLimpaMsg: TfcShapeBtn;
    btnContinuarBol: TfcShapeBtn;
    Bevel3: TBevel;
    fcShapeBtn1: TfcShapeBtn;
    Label1: TLabel;
    meObsCar: TMemo;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    edtNumDocumento: TEdit;
    Label3: TLabel;
    edtDataAlienacao: TCMDateTimePicker;
    Label11: TLabel;
    edtVlrOper: TRealEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    meObsEvento: TMemo;
    Label22: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label5: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    Label4: TLabel;
    dblcPortForma: TwwDBLookupCombo;
    chkBoleto: TCheckBox;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    edtDataLanc: TCMDateTimePicker;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    edtVlrTotal: TRealEdit;
    cboMes: TComboBox;
    fcShapeBtn3: TfcShapeBtn;
    btnConfirma: TfcShapeBtn;
    molImovelouMestre1: TmolImovelouMestre;
    Panel2: TPanel;
    dbgImoveis: TwwDBGrid;
    qryImovel: TwwQuery;
    dsImovel: TwwDataSource;
    qryImovelIMOVEL_EXTENSO: TStringField;
    qryImovelIDIMOVEL: TFloatField;
    qryImovelVLR_IMOVEL: TFloatField;
    qryImovelPER_RATEIO: TFloatField;
    qryImovelVLR_SALDO: TFloatField;
    updImovel: TUpdateSQL;
    wwDBGridSelImovel: TwwDBGrid;
    Panel3: TPanel;
    fcShapeBtn4: TfcShapeBtn;
    fcShapeBtn5: TfcShapeBtn;
    btnSeleciona: TSpeedButton;
    btnLimpa: TSpeedButton;
    Bevel6: TBevel;
    Panel4: TPanel;
    wwDBGrid1: TwwDBGrid;
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure DBgrdBemCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdBemTopRowChanged(Sender: TObject);
    procedure fcShapeBtn8Click(Sender: TObject);
    procedure fcShapeBtn2Click(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcPortFormaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPortFormaChange(Sender: TObject);
    procedure btnContinuarBolClick(Sender: TObject);
    procedure btnLimpaMsgClick(Sender: TObject);
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure fcShapeBtn3Click(Sender: TObject);
    procedure molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
    procedure dbgImoveisRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnLimpaClick(Sender: TObject);
    procedure fcShapeBtn5Click(Sender: TObject);
    procedure fcShapeBtn4Click(Sender: TObject);


  private { Private declarations }
    iDocumento : integer;
    bFiltraBens: Boolean;

    //CtrlMovBaixa : TCtrlMovBaixa;
    CtrlMovBaixa : TCtrlImobMovBaixa;
    CtrlBem      : TCtrlBem;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

    vIDBens : array of integer;
    vValor  : array of currency;

    procedure AbreQueries;
    procedure FechaQueries;
    procedure CalcCampoVirtual;
    function  VerificaPreenchimentoOper: boolean;
    function  VerificaPreecnhimentoSelecao : boolean;
    function  VerificaPreenchimentoCar : boolean;
    function  ExisteMovimentacaoPosterior : boolean;
    function  BaixaCAF : Boolean;
    function  RegistraLancamentoImovel : Boolean;
    function  InsereBoleto(iDocumento: Integer) : Boolean;


  public { Public declarations }

  end;



var
  frmExecAlienacaoVista: TfrmExecAlienacaoVista;



implementation
{$R *.DFM}
uses
   dBaseDados, uDataBase, uModuloInvestImob, dMS, dLookImobiliario, uComunsImobiliario, uVerificaPreenchimento, uMensErro,
   dImobiliario, uFuncoesImob, uSistema, UDocumento, uMolduras, 
   DCAF, UDiasInUteis, dLancImovel, UEventoImovel, FProgresso, uModuloImobiliario;


procedure TfrmExecAlienacaoVista.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializa os CtrlObjects dos objetos a serem utilizados
  //CtrlMovBaixa := TCtrlMovBaixa.Create;
  CtrlMovBaixa := TCtrlImobMovBaixa.Create;
  CtrlBem      := TCtrlBem.Create;


  CtrlMovBaixa.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  CtrlBem.InitializeAs( CtrlMovBaixa );
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(CtrlMovBaixa);
end;

procedure TfrmExecAlienacaoVista.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlMovBaixa );
  FreeAndNil( CtrlBem );
  FreeAndNil(CtrlContab);// Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  inherited;
end;


procedure TfrmExecAlienacaoVista.AbreQueries;
begin

   // Abre tabelas LookUp
   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      ParamByName('PIDEMPRESA').AsInteger := Sistema.idEmpresa;
      Open;
   end;
   with dtmLookImobiliario.qryLookPortadorForma do begin
      LimpaParametros(dtmLookImobiliario.qryLookPortadorForma);
      ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PRECCUSTO').AsString  := 'R';
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;

   DBcboTipoRecDes.LookupValue := IntToStr(ModuloImobiliario.InvestImob.iIdRecAlienacao);
   dblcCCusto.LookupValue      := ModuloImobiliario.InvestImob.sCodCentroCusto;
   dblcPortForma.LookupValue   := inttostr(ModuloImobiliario.InvestImob.iCodPortForma);
end;

procedure TfrmExecAlienacaoVista.FechaQueries;
begin
   dtmLookImobiliario.qryLookCentroCusto.Close;
   dtmLookImobiliario.qryLookPortadorForma.Close;
end;



function TfrmExecAlienacaoVista.VerificaPreenchimentoOper: boolean;
begin
   Result := False;
   try
      if ( (molImovelouMestre1.iImovel <= 0) or (molImovelouMestre1.edtImovel.Text = '') ) then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel!', molImovelouMestre1.btnBuscaImovel);

      if ( (molCliente1.iCliente <= 0) or (molCliente1.edtRazaoSocial.Text = '') ) then
         raise EValidacao.CreateVal('É necessário indicar o Comprador!', molCliente1.btnBuscaCli);

      if edtDataAlienacao.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Alienação!', edtDataAlienacao);

      //Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataAlienacao.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataAlienacao);
      //Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

      if edtVlrOper.Value = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Valor da Operação!', edtVlrOper);

      if edtNumDocumento.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Número do Documento!', edtNumDocumento);

      if ExisteMovimentacaoPosterior then
         raise EValidacao.CreateVal('Já existe movimentação posterior a data da alienação!', edtDataAlienacao);

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

function TfrmExecAlienacaoVista.VerificaPreenchimentoCar: boolean;
begin
   Result := False;
   try
      if (DBcboTipoRecDes.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Receita!', DBcboTipoRecDes);

      if edtDataVenc.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);
       // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataVenc.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataVenc);
      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
      // verifica se o vencimento escolhido é um dia inútil
      if ModuloImobiliario.Adminimob.bFlgDiaUtilAP then begin
         if DayOfWeek(edtDataVenc.Date) in [1, 7] then
            raise EValidacao.CreateVal('A Data de Vencimento deve corresponder a um dia útil!', edtDataVenc);
      end;

      if dblcCCusto.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar um Centro de Custos!', dblcCCusto);

      if dblcPortForma.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar uma Forma de Cobrança!', dblcPortForma);
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




procedure TfrmExecAlienacaoVista.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimentoOper then begin
      bFiltraBens := True;
      dtmCaf.qryImovelXBem.Filtered := False;

      // Abre a tabela de imóveis
      LimpaParametros(qryImovel);
      if molImovelouMestre1.iMestre = -1 then begin
         frmProgresso.MostraFormProgresso('Selecionando os imóveis...',False,False);
         Application.ProcessMessages;
         qryImovel.ParamByName('PIDIMOVELMESTRE').AsFloat := molImovelouMestre1.iImovel;
      end else begin
         qryImovel.ParamByName('PIDIMOVEL').AsFloat := molImovelouMestre1.iImovel;
      end;
      qryImovel.Open;

      // Abre a tabela ImoveisxBens com um ou vários imóveis
      LimpaParametros(dtmCaf.qryImovelxBem);
      if molImovelouMestre1.iMestre = -1 then begin
         frmProgresso.MostraFormProgresso('Selecionando os bens dos imóveis...',False,False);
         Application.ProcessMessages;
         dtmCaf.qryImovelxBem.ParamByName('PIDIMOVELMESTRE').AsFloat := molImovelouMestre1.iImovel;
      end else begin
         dtmCaf.qryImovelxBem.ParamByName('PIDIMOVEL').AsFloat := molImovelouMestre1.iImovel;
      end;
      dtmCaf.qryImovelxBem.ParamByName('PBAIXATOTAL').AsString := 'N';
      dtmCaf.qryImovelxBem.Open;

      ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1
   end;
end;


procedure TfrmExecAlienacaoVista.FormShow(Sender: TObject);
begin
   inherited;
   AbreQueries;
   ntbPrincipal.PageIndex := 0;

   molImovelouMestre1.btnLimpaImovelClick( Self );
   Repaint;
   Application.ProcessMessages;

   // gerar apenas um IDDocumento para todos os lançamentos para agrupá-los
   // na contabilidade e no contas a receber
   iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);

   // preenche o número do documento = id documento
   edtNumDocumento.Text := FormatFloat('#0', iDocumento);
end;


procedure TfrmExecAlienacaoVista.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;


   // Pendência 21056 - Marcos V. Topini
   case ntbPrincipal.PageIndex of
      0 : lblTitulo.Caption := 'Alienação à Vista de Imóveis [Seleção]';
      1 : lblTitulo.Caption := 'Alienação à Vista de Imóveis [Selecão de bens]';
      2 : lblTitulo.Caption := 'Alienação à Vista de Imóveis [Car]';
      3 : lblTitulo.Caption := 'Alienação à Vista de Imóveis [Boleto]';
      4 : lblTitulo.Caption := 'Alienação à Vista de Imóveis [Bens]';
   end;
   // Fim Pendência 21056

   Repaint;
   Application.ProcessMessages;
end;


procedure TfrmExecAlienacaoVista.DBgrdBemCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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


procedure TfrmExecAlienacaoVista.DBgrdBemTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;


procedure TfrmExecAlienacaoVista.fcShapeBtn8Click(Sender: TObject);
begin
   inherited;
   // quando a forma de pagamento não gera o boleto, não pega as mensagens
   if chkBoleto.Checked then
        ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1
   else ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 2;
end;


procedure TfrmExecAlienacaoVista.fcShapeBtn2Click(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;


procedure TfrmExecAlienacaoVista.btnConfirmaClick(Sender: TObject);
var i : int64;
    bResult : Boolean;
begin
   inherited;
   if qryImovel.IsEmpty then begin
      MsgDlg ('Não foram encontrados Imóveis Ativos para alienação.','Aviso',mtWarning,[mbok],0);
      Exit;
   end;

   StartTransacao;
   try
      btnConfirma.Enabled := False;
      bResult := BaixaCAF;
      if bResult then bResult := RegistraLancamentoImovel;
      if bResult then begin
         CommitTransacao;
         frmProgresso.EscondeFormProgresso;
         MsgDlg ('Alienação registrada com sucesso.','Informação',mtInformation,[mbok],0);
         btnConfirma.Enabled := True;

         // Gera novo ID para a próxima alienação
         iDocumento           := Documento.GetCodigo(dtmImobiliario.qryAux);
         edtNumDocumento.Text := FormatFloat('#0', iDocumento);

         ntbPrincipal.PageIndex := 0;

         molImovelouMestre1.btnLimpaImovelClick( Self );
      end else begin
         RollBackTransacao;
         frmProgresso.EscondeFormProgresso;
         btnConfirma.Enabled := True;
      end;
   except
      RollBackTransacao;
      frmProgresso.EscondeFormProgresso;
      MsgDlg ('Erro ao se tentar registrar a Alienação.','Aviso',mtWarning,[mbok],0);
      btnConfirma.Enabled := True;
   end;
end;


function TfrmExecAlienacaoVista.BaixaCAF : Boolean;
var iPlanilha  : Integer;
    sObs       : String;
    i          : Integer;
begin
   iPlanilha := 0;
   Result    := True;

   sObs := copy(meObsEvento.Text,1,55);

   // Exibe caixa de dialogo com a barra de progresso
   frmProgresso.MostraFormProgresso('Preparando operação de baixa...',False,False,False);

   Application.ProcessMessages;

   try
      // Desabilita a transação do CtrlObject
      CtrlMovBaixa.OpenTransaction := False;

      for i := 0 to Length(vIdBens) - 1 do begin
         if not CtrlMovBaixa.ExecutaBaixa(Sistema.IdModulo,
                                          Sistema.IdEmpresa,
                                          Sistema.IdUsuario,
                                          vIdBens[i],
                                          1,                 // id Motivo da Baixa 1-Alienação
                                          edtDataAlienacao.date,
                                          0,                 // tipo de proporção: 0 - percentual
                                          100,               // baixa 100 %
                                          vValor[i],
                                          sObs, '',
                                          0 ) then           // deprec. pro rata na data -1
            raise Exception.create(CtrlMovBaixa.MessageInfo);
      end;
   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;



function TfrmExecAlienacaoVista.RegistraLancamentoImovel: Boolean;
var iIdLancImovel,iTotReg,iPos : Integer;
    msgRegistro : String;
begin
   iPos        := 0;
   Result      := True;
   msgRegistro := '';

   // Exibe caixa de dialogo com a barra de progresso
   frmProgresso.MostraFormProgresso('Registrando a operação na Lançamentos Imovel...',False,False);
   Application.ProcessMessages;

   // Registra cada Imovel selecionado
   qryImovel.DisableControls;
   dtmCaf.qryImovelxBem.DisableControls;
   dtmCaf.qryImovelxBem.Filtered := False;

   // Pendência 21056 - Marcos V. Topini
   // Calcula o total de registros dos bens selecionados
   while not dtmCAF.qryImovelXBem.Eof do begin
     if dtmCaf.qryImovelXBemSEL_BEM.AsInteger = 1 then
       inc(iTotReg);
     dtmCAF.qryImovelXBem.Next;
   end;
   // Fim Pendência 21056

   qryImovel.First;
   dtmCaf.qryImovelXBem.First;
   while not qryImovel.Eof do begin

      // Grava Dados em LANCAMENTOSIMOVEL
      iIdLancImovel := LeUltRegistro(nil,'LANCAMENTOSIMOVEL');
      LimpaParametros (dtmLancImovel.qryInsertLancImovel);
      dtmLancImovel.qryInsertLancImovel.ParamByName('PIDLANCIMOVEL').AsInteger      := iIdLancImovel;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PRECPAG').AsString             := 'R';
      dtmLancImovel.qryInsertLancImovel.ParamByName('PIDPESSOA').AsInteger          := Sistema.IdEmpresa;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PIDFORCLI').AsInteger          := molCliente1.iCliente;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PIDIMOVEL').AsInteger          := qryImovelIDIMOVEL.AsInteger;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PMOEDARECEB').AsInteger        := Modulo.iMoedaCorrente;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PFLGINTEGRADO').AsInteger      := 0;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PIDUSUARIOSISTEMA').AsInteger  := Sistema.IdUsuario;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PIDMODULO').AsInteger          := Sistema.IdModulo;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PFLGORIGEMLANC').AsString      := 'S';
      dtmLancImovel.qryInsertLancImovel.ParamByName('PCODCENTROCUSTO').AsString     := dblcCCusto.LookupValue;
      if dblcPortForma.LookupValue <> '' then
         dtmLancImovel.qryInsertLancImovel.ParamByName('PCODPORTFORMA').AsInteger   := StrToInt(dblcPortForma.LookupValue);
      if chkBoleto.Checked then
         dtmLancImovel.qryInsertLancImovel.ParamByName('PFLGAGRUPAR').AsString      := 'S';
      dtmLancImovel.qryInsertLancImovel.ParamByName('PDATALANCAMENTO').AsDateTime   := edtDataAlienacao.DateTime;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PDATAVENCIMENTO').AsDateTime   := edtDataVenc.DateTime;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PMESREFERENCIA').AsInteger     := DiasInUteis.ExtraiMes(edtDataAlienacao.DateTime);
      dtmLancImovel.qryInsertLancImovel.ParamByName('PANOREFERENCIA').AsInteger     := DiasInUteis.ExtraiAno(edtDataAlienacao.DateTime);
      dtmLancImovel.qryInsertLancImovel.ParamByName('PMESCOMPETENCIA').AsInteger    := cboMes.ItemIndex + 1;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PANOCOMPETENCIA').AsInteger    := word(trunc(DBspnAno.Value));
      dtmLancImovel.qryInsertLancImovel.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);
      dtmLancImovel.qryInsertLancImovel.ParamByName('PVLRLANCRECEB').AsFloat        := qryImovelVLR_IMOVEL.AsFloat;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PVLRLANCOMRECEB').AsFloat      := qryImovelVLR_IMOVEL.AsFloat;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PIDDOCUMENTO').AsInteger       := iDocumento;
      dtmLancImovel.qryInsertLancImovel.ParamByName('PNODOCUMENTO').AsInteger       := StrToInt(edtNumDocumento.text);
      dtmLancImovel.qryInsertLancImovel.ExecSQL;

      // Executa a baixa dos bens no AtivoFixo, do imóvel alienado
      while (qryImovelIMOVEL_EXTENSO.AsString = dtmCAF.qryImovelXBemIMOVEL_EXTENSO.AsString) and
            (qryImovelIDIMOVEL.AsInteger = dtmCAF.qryImovelXBemIDIMOVEL.AsInteger) and
            (not dtmCAF.qryImovelXBem.Eof) do begin

         // Pendência 21056 - Marcos Ventura Topini
         // baixar apenas os bens selecionados
         if dtmCaf.qryImovelXBemSEL_BEM.AsInteger = 1 then begin
            // Anda Progresso
            iPos := iPos + 1;
            frmProgresso.AndaFormProgresso( iPos, iTotReg );

            // grava dados em LANCIMOVELXBEM
            LimpaParametros (dtmCAF.qryInsertLancImovelxbem);
            dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDLANCIMOVEL').AsInteger := iIdLancImovel;
            dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDBEM').AsInteger        := dtmCaf.qryImovelxbemIDBEM.AsInteger;
            dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
            dtmCAF.qryInsertLancImovelxbem.ParamByName('PVLRMOV').AsFloat         := dtmCaf.qryimovelxbemVLR_BEM.AsFloat;
            dtmCAF.qryInsertLancImovelxbem.ParamByName('PFLGNUMMOV').AsInteger    := 6;   // BAIXA
            dtmCAF.qryInsertLancImovelxbem.ExecSQL;
         end;
         // Fim Pendência 21056

         dtmCaf.qryImovelxBem.next;
      end;

      // Atualiza o Status do Imóvel
      { Pendência 21056 - Marcos Ventura Topini
         Só altera o Status do imóvel se a baixa dos bens for total }
      if iTotReg = dtmCaf.qryImovelxBem.RecordCount then begin
         LimpaParametros(qryUpdImovel);
         qryUpdImovel.ParamByName ('PIDIMOVEL').AsInteger := qryImovelIDIMOVEL.AsInteger;
         qryUpdImovel.ExecSQL;
         msgRegistro := 'Alienação do Imóvel'
       end
      else
       msgRegistro := 'Baixa parcial do Imóvel';
      // Fim Pendência 21056


      // registra evento no imóvel
      UEventoImovel.EventoImovel.RegistraEvento(qryImovelIDIMOVEL.AsInteger, 0,
                                                Sistema.IdUsuario, 0, 0,
                                                edtDataAlienacao.Date,
                                                edtDataAlienacao.Date,
                                                'CA', msgRegistro,
                                                meObsEvento.Text, 0, 0,
                                                qryImovelVLR_IMOVEL.AsInteger, True);

      qryImovel.Next;
   end;

   // insere a Observação na tabela ObsLancImovel
   if length(trim(meObsCar.Text)) > 0 then FuncoesImob.InsertObsLanc(iDocumento, meObsCar.Text);

   // Insere as Mensagens do Boleto
   if Result = True then begin
      InsereBoleto(iDocumento);
   end;

   bFiltraBens := False;
   qryImovel.First;
   dtmCaf.qryImovelXBem.First;
   qryImovel.EnableControls;
   dtmCaf.qryImovelXBem.Filtered := False;
   dtmCaf.qryImovelxBem.EnableControls;
end;




procedure TfrmExecAlienacaoVista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   FechaQueries;
end;

procedure TfrmExecAlienacaoVista.dblcPortFormaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   chkBoleto.Checked := not(dtmLookImobiliario.qryLookPortadorFormaIDCONFIGBARRAS.IsNull);
end;

procedure TfrmExecAlienacaoVista.dblcPortFormaChange(Sender: TObject);
begin
   inherited;
   chkBoleto.Checked := not(dtmLookImobiliario.qryLookPortadorFormaIDCONFIGBARRAS.IsNull);
end;

procedure TfrmExecAlienacaoVista.btnContinuarBolClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1
end;

procedure TfrmExecAlienacaoVista.btnLimpaMsgClick(Sender: TObject);
begin
   inherited;
   edtLinha1.Clear;
   edtLinha2.Clear;
   edtLinha3.Clear;
   edtLinha4.Clear;
   edtLinha5.Clear;
   edtLinha6.Clear;
   edtLinha7.Clear;
   edtLinha8.Clear;
   edtLinha9.Clear;
end;

procedure TfrmExecAlienacaoVista.CalcCampoVirtual;
var fSldCtbImob, iSaldo, iSaldoImovel, iSaldoTot : Extended;
    ipos, iTotReg : Integer;
begin
   frmProgresso.MostraFormProgresso('Verificando o saldo contábil para rateio...',False,False);
   Application.ProcessMessages;

   qryImovel.DisableControls;
   qryImovel.First;
   dtmCaf.qryImovelXBem.DisableControls;
   dtmCaf.qryImovelXBem.First;
   iSaldoTot := 0;
   iPos      := 0;
   iTotReg   := 0;

   // Pendência 21056 - Marcos Ventura Topini
   // baixar apenas os bens selecionados
   while not dtmCAF.qryImovelXBem.Eof do begin
     if dtmCaf.qryImovelXBemSEL_BEM.AsInteger = 1 then
       inc(iTotReg);
     dtmCAF.qryImovelXBem.Next;
   end;
   // Fim Pendência 21056

   dtmCaf.qryImovelXBem.First;
   while not qryImovel.Eof do begin
      iSaldoImovel := 0;
      // Verifica o saldo dos bens no AtivoFixo, do imóvel alienado
      while (qryImovelIMOVEL_EXTENSO.AsString = dtmCAF.qryImovelXBemIMOVEL_EXTENSO.AsString) and
            (qryImovelIDIMOVEL.AsInteger = dtmCAF.qryImovelXBemIDIMOVEL.AsInteger) and
            (not dtmCAF.qryImovelXBem.Eof) do begin

         if dtmCaf.qryImovelXBemSEL_BEM.AsInteger = 1 then begin
            // Anda Progresso
            iPos := iPos + 1;
            frmProgresso.AndaFormProgresso( iPos, iTotReg );
            // Verifica saldo do bem
            iSaldo := CtrlBem.SaldoContabil(Sistema.IdEmpresa,
                                            dtmCaf.qryImovelXBem.FieldByName('IDBEM').AsInteger,
                                            edtDataAlienacao.Date,
                                            ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                            ModuloImobiliario.InvestImob.iIdPaisCAF );
            dtmCaf.qryImovelXBem.Edit;
            dtmCaf.qryImovelXBem.FieldByName('VLR_BEM').AsFloat := iSaldo;
            dtmCaf.qryImovelXBem.Post;

            iSaldoImovel := iSaldoImovel + iSaldo;
            iSaldoTot    := iSaldoTot    + iSaldo;
         end;

         dtmCaf.qryImovelXBem.Next;
      end;

      // Acumula o Saldo dos bens no imóvel
      qryImovel.Edit;
      qryImovelVLR_SALDO.AsFloat := iSaldoImovel;
      qryImovel.Post;

      qryImovel.Next;
   end;

   // Calcula o Valor e Percentual de Rateio dos bens
   frmProgresso.MostraFormProgresso('Calculando o rateio dos bens...',False,False);
   Application.ProcessMessages;
   iPos    := 0;
   iSaldo  := 0;
   qryImovel.First;
   dtmCaf.qryImovelxBem.First;

   // inicialização dos vetores dinâmicos
   vIDBens := nil;
   vValor  := nil;
   SetLength(vIDBens, iTotReg);
   SetLength(vValor,  iTotReg);

   while not qryImovel.eof do begin

      // Rateia o total da venda por imovel
      qryImovel.Edit;
      qryImovelPER_RATEIO.AsFloat := (qryImovelVLR_SALDO.AsFloat * 100) / iSaldoTot;
      qryImovelVLR_IMOVEL.AsFloat := Arredonda( (edtVlrOper.Value * qryImovelPER_RATEIO.AsFloat) / 100, 2);
      qryImovel.Post;

      while (qryImovelIMOVEL_EXTENSO.AsString = dtmCAF.qryImovelXBemIMOVEL_EXTENSO.AsString) and
            (qryImovelIDIMOVEL.AsInteger = dtmCAF.qryImovelXBemIDIMOVEL.AsInteger) and
            (not dtmCAF.qryImovelXBem.Eof) do begin

         if dtmCaf.qryImovelXBemSEL_BEM.AsInteger = 1 then begin

           // Anda Progresso
           iPos := iPos + 1;
           frmProgresso.AndaFormProgresso( iPos, iTotReg );

           // Rateia o valor do imóvel por bem
           dtmCAF.qryImovelXBem.Edit;
           dtmCAF.qryImovelXBem.FieldByName('IXBPERCENT').AsFloat := (dtmCAF.qryImovelXBem.FieldByName('VLR_BEM').AsFloat * 100) / qryImovelVLR_SALDO.AsFloat;
           dtmCAF.qryImovelXBem.FieldByName('VLR_BEM').AsFloat    := Arredonda( (qryImovelVLR_IMOVEL.AsFloat * dtmCAF.qryImovelXBem.FieldByName('IXBPERCENT').AsFloat) / 100, 2);
           dtmCAF.qryImovelXBem.Post;

           // Acumula valores nos vetores
           vIDBens[iPos-1] := dtmCAF.qryImovelXBem.FieldByName('IDBEM').AsInteger;
           vValor[iPos-1]  := dtmCAF.qryImovelXBem.FieldByName('VLR_BEM').AsFloat;
           iSaldo := iSaldo + dtmCAF.qryImovelXBem.FieldByName('VLR_BEM').AsFloat;
         end;

         dtmCAF.qryImovelXBem.Next;
      end;

      // Ajusta centavos final no ultimo bem
      if (dtmCAF.qryImovelXBem.eof) and (iSaldo <> edtVlrOper.Value) then begin
         iSaldo := edtVlrOper.Value - iSaldo;

         dtmCAF.qryImovelXBem.Edit;
         dtmCAF.qryImovelXBem.FieldByName('VLR_BEM').AsFloat := Arredonda(dtmCAF.qryImovelXBem.FieldByName('VLR_BEM').AsFloat + iSaldo,2);
         dtmCAF.qryImovelXBem.Post;
         vValor[iPos-1] := dtmCAF.qryImovelXBem.FieldByName('VLR_BEM').AsFloat;
      end;

      qryImovel.Next;
   end;

   qryImovel.EnableControls;
   qryImovel.First;
   dtmCaf.qryImovelXBem.EnableControls;
   dtmCaf.qryImovelXBem.First;
end;


function TfrmExecAlienacaoVista.InsereBoleto(iDocumento: Integer): Boolean;
var vMensagem : array [0..8] of string;
begin
   Result := True;
   // guarda as linhas digitadas
   vMensagem[0] := copy(edtLinha1.Text, 1, 69);
   vMensagem[1] := copy(edtLinha2.Text, 1, 69);
   vMensagem[2] := copy(edtLinha3.Text, 1, 69);
   vMensagem[3] := copy(edtLinha4.Text, 1, 69);
   vMensagem[4] := copy(edtLinha5.Text, 1, 69);
   vMensagem[5] := copy(edtLinha6.Text, 1, 69);
   vMensagem[6] := copy(edtLinha7.Text, 1, 69);
   vMensagem[7] := copy(edtLinha8.Text, 1, 69);
   vMensagem[8] := copy(edtLinha9.Text, 1, 69);

   Result := FuncoesImob.InsertMsgLanc(iDocumento, '', '', -1, vMensagem) > 0;
end;

procedure TfrmExecAlienacaoVista.fcShapeBtn1Click(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1
end;

procedure TfrmExecAlienacaoVista.fcShapeBtn3Click(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimentoCar then begin
      // Força filtro por imóvel do grid de bens
      bFiltraBens := True;
      dbgImoveisRowChanged( Self );

      // Não inclui Mensagens do Boleto quando a forma de pagamento não gerar boleto
      if chkBoleto.Checked then
           ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1
      else ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 2;
   end;
end;

procedure TfrmExecAlienacaoVista.molImovelouMestre1btnBuscaImovelClick(
  Sender: TObject);
var sFiltro : String;
begin
  inherited;
  // Filtra só os imoveis ativos
  sFiltro := dtmMS.MS_ImovelouMestre.Filtro.Text;
  dtmMS.MS_ImovelouMestre.Filtro.Add('( I.FLGATIVO = 1 ) OR ( I.IDIMOVELMESTRE IS NULL )');

  molImovelouMestre1.btnBuscaImovelClick(Sender);

  dtmMS.MS_ImovelouMestre.Filtro.Text := sFiltro;
end;

procedure TfrmExecAlienacaoVista.dbgImoveisRowChanged(Sender: TObject);
begin
  inherited;
  if bFiltraBens then begin
     dtmCaf.qryImovelXBem.DisableControls;
     dtmCaf.qryImovelXBem.Filtered := False;
     if ntbPrincipal.PageIndex = 2 then
      dtmCaf.qryImovelXBem.Filter   := 'IDIMOVEL = ' + IntToStr(qryImovelIDIMOVEL.AsInteger) + ' And SEL_BEM = 1'
     else
      dtmCaf.qryImovelXBem.Filter   := 'IDIMOVEL = ' + IntToStr(qryImovelIDIMOVEL.AsInteger);
     dtmCaf.qryImovelXBem.Filtered := True;
     dtmCaf.qryImovelXBem.EnableControls;
  end;
end;


function TfrmExecAlienacaoVista.ExisteMovimentacaoPosterior: boolean;
begin
   Result := False;
   with dtmImobiliario.qryAux do begin
      Sql.Clear;
      Sql.Add('SELECT MAX(H.DATAMOVIMENTACAO) AS ULTMOVTO');
      Sql.Add('  FROM HISTORICOMOVIMENTACAO H,');
      Sql.Add('       IMOVELXBEM IXB,');
      Sql.Add('       IMOVEL I');
      Sql.Add(' WHERE H.IDBEM = IXB.IDBEM');
      Sql.Add('   AND I.IDIMOVEL = IXB.IDIMOVEL');

      if molImovelouMestre1.iMestre > 0 then
           Sql.Add('   AND I.IDIMOVEL = ' + IntToStr(molImovelouMestre1.iImovel))
      else Sql.Add('   AND I.IDIMOVELMESTRE = ' + IntToStr(molImovelouMestre1.iImovel));

      Open;
      if FieldByName('ULTMOVTO').AsDateTime > edtDataAlienacao.Date then Result := True;
   end;
end;



procedure TfrmExecAlienacaoVista.btnSelecionaClick(Sender: TObject);
begin
   inherited;
   // Seleciona todos bens di imóvel
   dtmCaf.qryImovelxBem.DisableControls;
   dtmCaf.qryImovelxBem.First;
   while not dtmCaf.qryImovelxBem.eof do begin
      dtmCaf.qryImovelxBem.Edit;
      dtmCaf.qryImovelXBemSEL_BEM.AsInteger := 1;
      dtmCaf.qryImovelxBem.Post;
      dtmCaf.qryImovelxBem.Next;
   end;
   dtmCaf.qryImovelxBem.First;
   dtmCaf.qryImovelxBem.EnableControls;

end;

procedure TfrmExecAlienacaoVista.btnLimpaClick(Sender: TObject);
begin
   inherited;
   // Desmarca todas as parcelas
   dtmCaf.qryImovelxBem.DisableControls;
   dtmCaf.qryImovelxBem.First;
   while not dtmCaf.qryImovelxBem.eof do begin
      dtmCaf.qryImovelxBem.Edit;
      dtmCaf.qryImovelXBemSEL_BEM.Clear;
      dtmCaf.qryImovelxBem.Post;
      dtmCaf.qryImovelxBem.Next;
   end;
   dtmCaf.qryImovelxBem.First;
   dtmCaf.qryImovelxBem.EnableControls;
end;

procedure TfrmExecAlienacaoVista.fcShapeBtn5Click(Sender: TObject);
begin
  inherited;

  if VerificaPreecnhimentoSelecao then begin
     CalcCampoVirtual;
     frmProgresso.EscondeFormProgresso;

     // competência default
     edtDataLanc.Date  := edtDataAlienacao.Date;
     edtVlrTotal.Value := edtVlrOper.Value;
     cboMes.ItemIndex  := DiasInUteis.ExtraiMes(edtDataLanc.date)-1;
     DBspnAno.Value    := DiasInUteis.ExtraiAno(edtDataLanc.date);

     ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1
  end;

end;

procedure TfrmExecAlienacaoVista.fcShapeBtn4Click(Sender: TObject);
begin
  inherited;
  ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1
end;

function TfrmExecAlienacaoVista.VerificaPreecnhimentoSelecao: boolean;
begin

   try
      Result := False;
      dtmCaf.qryImovelxBem.DisableControls;
      dtmCaf.qryImovelxBem.First;
      while not dtmCaf.qryImovelxBem.eof do begin
       If dtmCaf.qryImovelXBemSEL_BEM.AsInteger = 1 then begin
         Result := true;
         break
       end;
       dtmCaf.qryImovelxBem.Next;
      end;
      dtmCaf.qryImovelxBem.First;
      dtmCaf.qryImovelxBem.EnableControls;

      if  not Result then
         raise EValidacao.CreateVal('É necessário selecionar um Imóvel!', wwDBGridSelImovel);

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

end.
