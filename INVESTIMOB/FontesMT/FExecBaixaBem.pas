unit FExecBaixaBem;
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência    : 172902/8222
Responsável  : Wylliam Leite da Silva
Data         : 04/04/2012
Descrição    : Bloqueio para data bloqueada na contabilidade
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

//***************************************************************************************
//Rotina:            DesfazBaixaBem e VerificaEventosBaixa (uCtrlEventoImovel)
//Nº SOL:            127793
//Nº KINTANA         679702
//Data da Alteração: 29/01/2010
//Responsável:       Cássio Camargo
//Descrição:         Inclusão de rotina que verifica se existem evento de baixa de bens
//                   relacionado e o exclui durante o processo que desfaz a baixa, onde
//                   a data de movimentação seja a mesma
//**************************************************************************************


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mImovelouMestre, Grids, Wwdbigrd, Wwdbgrid, Db,
  Wwdatsrc, DBTables, Wwquery, mImovelAtivo, CMProcuraMask, uCtrlBem, {uCtrlMovBaixa} uCtrlImobMovBaixa,
  uSistema, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, DBClient,
  uCMClientDataSet, uCtrlEventoImovel, uIntegraBack, wwdblook, MontaSelect, uVerificaPreenchimento,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab;

type
  TfrmExecBaixaBem = class(TfrmOkCancelar)
    GroupBox2: TGroupBox;
    memEvento: TMemo;
    rdgTipoMov: TRadioGroup;
    edtDataMovim: TCMDateTimePicker;
    Label3: TLabel;
    dsContaDestino: TwwDataSource;
    cdsContaDestino: TCMClientDataSet;
    sqlContaDestino: TCMSqlParams;
    edContaDestino: TCMProcuraMaskContabil;
    cdsMotivoBaixa: TCMClientDataSet;
    sqlMotivoBaixa: TCMSqlParams;
    MSBem: TMontaSelect;
    edtBem: TEdit;
    Label1: TLabel;
    spdPesquisa: TBitBtn;
    cmbMotivoBaixa: TwwDBLookupCombo;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spdPesquisaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlBem      : TCtrlBem;
    //CtrlMovBaixa : TCtrlMovBaixa;
    CtrlMovBaixa : TCtrlImobMovBaixa;
    CtrlEventoImovel    : TCtrlEventoImovel;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

    iPessoa        : Integer;
    iBem           : Integer;
    sBem           : String;
    iLocalizacao   : Integer;
    iConjunto      : Integer;
    iGrupo         : Integer;
    sContaContabil : String;
    iImovel        : Integer;
    sContaDestino  : String;

    procedure LimpaCampos(bTodos : Boolean);
    function EfetuaBaixaBem : Boolean;
    function DesfazBaixaBem : Boolean;
    function VerificaPreenchimento : Boolean;
    procedure MontaFiltro(iTipo : Integer);
  public
    { Public declarations }
  end;

var
  frmExecBaixaBem: TfrmExecBaixaBem;

implementation

{$R *.DFM}

uses uDatabase, dBaseDados, uMensErro;

procedure TfrmExecBaixaBem.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlBem               := TCtrlBem.Create;
   CtrlBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   //CtrlMovBaixa          := TCtrlMovBaixa.Create;
   CtrlMovBaixa          := TCtrlImobMovBaixa.Create;
   CtrlMovBaixa.InitializeAs(CtrlBem);

   CtrlEventoImovel    := TCtrlEventoImovel.Create;
   CtrlEventoImovel.InitializeAs(CtrlBem);

   edContaDestino.Mascara := Trim(IntegraBack.MascaraPlano);
   edContaDestino.Plano   := IntegraBack.Plano;
   sqlMotivoBaixa.Open;

   LimpaCampos(True);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlEventoImovel);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
end;



procedure TfrmExecBaixaBem.FormDestroy(Sender: TObject);
begin
   FreeAndNil( CtrlBem );
   FreeAndNil( CtrlMovBaixa );
   FreeAndNil( CtrlEventoImovel );
   FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   inherited;
end;



function TfrmExecBaixaBem.DesfazBaixaBem: Boolean;
begin
   if not VerificaPreenchimento then
   begin
      Result := False;
      Exit;
   end;

   Result := True;
   try

      StartTransacao;

      if edContaDestino.Conta.Numero = '' then
         sContaContabil := sContaDestino
      else
         if trim(edContaDestino.Conta.Numero) <> sContaDestino then
            sContaContabil := trim(edContaDestino.Conta.Numero);

      CtrlMovBaixa.OpenTransaction := False;
      if not CtrlMovBaixa.EstornaBaixa(Sistema.IdModulo,
                                       Sistema.IdEmpresa,
                                       Sistema.IdUsuario,
                                       iBem,
                                       edtDataMovim.Date,
                                       Date) then
         raise Exception.create(CtrlMovBaixa.MessageInfo);

      CtrlEventoImovel.OpenTransaction := False;

      //Cássio - SOL Nº 127793 KTN Nº 679702 - Início
      if not CtrlEventoImovel.VerificaEventosBaixa('BB', edtDataMovim.Date, iImovel) then
      begin
        if not CtrlEventoImovel.RegistraEvento(iImovel,
                                               -1,
                                               -1,-1,Sistema.IdUsuario,'BB','Desfazer Baixa de Bem',
                                               memEvento.Lines.Text,
                                               edtDataMovim.Date,-1,-1,-1,-1,-1,False) then
          raise Exception.create(CtrlEventoImovel.MessageInfo);
      end;
      //Cássio - SOL Nº 127793 KTN Nº 679702 - Fim.

      CommitTransacao;
      MsgDlg('Desfeita a baixa com sucesso','Aviso',mtInformation,[mbOK],0);
      LimpaCampos(True);
   except
      on E : Exception do begin
         RollBackTransacao;
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;



function TfrmExecBaixaBem.EfetuaBaixaBem: Boolean;
begin
   if not VerificaPreenchimento then
   begin
      Result := False;
      Exit;
   end;

   Result := True;
   try

      StartTransacao;

      if edContaDestino.Conta.Numero = '' then
         sContaContabil := sContaDestino
      else
         if trim(edContaDestino.Conta.Numero) <> sContaDestino then
            sContaContabil := trim(edContaDestino.Conta.Numero);

      CtrlMovBaixa.OpenTransaction := False;
      if not CtrlMovBaixa.ExecutaBaixa(Sistema.IdModulo,
                                       Sistema.IdEmpresa,
                                       Sistema.IdUsuario,
                                       iBem,
                                       1,                 // id Motivo da Baixa 1-Alienação
                                       edtDataMovim.Date,
                                       0,                 // tipo de proporção: 0 - percentual
                                       100,               // baixa 100 %
                                       0,
                                       Trim(copy(memEvento.Text,1,55)), sContaContabil,
                                       0 ) then           // deprec. pro rata na data -1
         raise Exception.create(CtrlMovBaixa.MessageInfo);

      CtrlEventoImovel.OpenTransaction := False;
      if not CtrlEventoImovel.RegistraEvento(iImovel,
                                             -1,
                                             -1,-1,Sistema.IdUsuario,'BB','Baixa de Bem',
                                             memEvento.Lines.Text,
                                             edtDataMovim.Date,-1,-1,-1,-1,-1,False) then
         raise Exception.create(CtrlEventoImovel.MessageInfo);

      CommitTransacao;
      MsgDlg('Bem baixado com sucesso','Aviso',mtInformation,[mbOK],0);
      LimpaCampos(True);

   except
      on E : Exception do begin
         RollBackTransacao;
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;



procedure TfrmExecBaixaBem.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if rdgTipoMov.ItemIndex = 0 then EfetuaBaixaBem;
   if rdgTipoMov.ItemIndex = 1 then DesfazBaixaBem;
end;



procedure TfrmExecBaixaBem.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   LimpaCampos(False);

   MontaFiltro(rdgTipoMov.ItemIndex);

   MSBem.Executar;
   if MSBem.RetornouValor then
   begin
      iPessoa      := StrToInt(MSBem.ValoresChave[0]);
      iBem         := StrToInt(MSBem.ValoresChave[1]);
      sBem         := MSBem.ValoresChave[3];
      iLocalizacao := StrToInt(MSBem.ValoresChave[4]);
      iConjunto    := StrToInt(MSBem.ValoresChave[5]);
      iGrupo       := StrToInt(MSBem.ValoresChave[6]);
      iImovel      := StrToInt(MSBem.ValoresChave[7]);

      edtBem.Text := sBem;

      cdsContaDestino.Close;
      sqlContaDestino.Prepare;
      sqlContaDestino.ParamByName('IDGRUPO').AsInteger            := iGrupo;
      sqlContaDestino.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := 06;  // Baixa Custo
      sqlContaDestino.ParamByName('TIPOLANCAMENTO').AsString      := 'D'; // Conta Saída Padrão
      sqlContaDestino.ParamByName('PLANO').AsInteger              := IntegraBack.Plano;
      sqlContaDestino.Open;

      sContaDestino := cdsContaDestino.FieldByName('PLACONTA').AsString;
   end;
end;



function TfrmExecBaixaBem.VerificaPreenchimento: Boolean;
begin
   Result := True;

   try
      if iBem = -1 then
         raise EValidacao.CreateVal('Selecione o Bem a ser baixado', spdPesquisa);

      if (rdgTipoMov.ItemIndex = 0) and (Trim(cmbMotivoBaixa.Text) = '') then
         raise EValidacao.CreateVal('Selecione o motivo da baixa', cmbMotivoBaixa);

      if edtDataMovim.Text = '' then
         raise EValidacao.CreateVal('Informe a data da movimentação', edtDataMovim);

      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataMovim.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataMovim);
      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

      if memEvento.Lines.Count = 0 then
         raise EValidacao.CreateVal('Favor informar a observação para o Evento', memEvento);

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Result := False;
      end;
   end;
end;



procedure TfrmExecBaixaBem.LimpaCampos(bTodos: Boolean);
begin
   iPessoa        := -1;
   iBem           := -1;
   sBem           := '';
   iLocalizacao   := -1;
   iConjunto      := -1;
   iGrupo         := -1;
   sContaContabil := '';
   iImovel        := -1;

   if bTodos then
   begin
      edtBem.Clear;
      cmbMotivoBaixa.LookupValue  := '';
      cmbMotivoBaixa.Text         := '';
      edtDataMovim.Clear;
      memEvento.Clear;
      edContaDestino.Clear;
   end;
end;



procedure TfrmExecBaixaBem.MontaFiltro(iTipo: Integer);
begin
   MSBem.Filtro.Clear;

   MSBem.Filtro.Add('BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO');
   MSBem.Filtro.Add('BEM.IDPESSOA=CONJUNTO.IDPESSOA');
   MSBem.Filtro.Add('BEM.IDBEM = IXB.IDBEM');
   MSBem.Filtro.Add('IXB.IDIMOVEL = I.IDIMOVEL');
   MSBem.Filtro.Add('I.IDIMOVELMESTRE = IM.IDIMOVEL');
   MSBem.Filtro.Add('CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)');
   MSBem.Filtro.Add('CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA(+)');
   MSBem.Filtro.Add('CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)');
   MSBem.Filtro.Add('BEM.IDGRUPO=GRUPO.IDGRUPO(+)');
   MSBem.Filtro.Add('BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)');
   MSBem.Filtro.Add('BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)');
   MSBem.Filtro.Add('BEM.IDMODULO = 54');
   MSBem.Filtro.Add('1=1');

   if iTipo = 0 then MSBem.Filtro.Add('BEM.BAIXATOTAL=''N''');
   if iTipo = 1 then MSBem.Filtro.Add('BEM.BAIXATOTAL=''S''');
end;



procedure TfrmExecBaixaBem.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos(True);
end;


end.
