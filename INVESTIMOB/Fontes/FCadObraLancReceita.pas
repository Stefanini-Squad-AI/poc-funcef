{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. Sol..........: 172902/8222
N. Kintana......: 1577546
Data............: 04/04/2012
Responsável.....: Wylliam Leite da Silva
Descrição.......: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadObraLancReceita;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, Db, DBTables, Wwquery, CmEventosCadastro, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  Grids, Wwdbigrd, Wwdbgrid, TB97, ComCtrls, ExtCtrls, mImovelObra,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, wwdbedit, Wwdbspin,
  wwdblook, mFornecedor, DBCtrls, fcLabel, mCliente, fcButton, fcImgBtn,
  fcShapeBtn, mSubConta, {uCtrlCafObra,} uCtrlImobObra,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab;

type
  TfrmCadObraLancReceita = class(TfrmCadastroDetalhe)
    molImovelObra1: TmolImovelObra;
    Label1: TLabel;
    Label2: TLabel;
    DtaInicioObra: TCMDateTimePicker;
    qryObraEtapa: TwwQuery;
    qryObraEtapaDESCOBRATIPOETAPA: TStringField;
    qryObraEtapaIDOBRATIPOETAPA: TFloatField;
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
    pagControle: TPageControl;
    tsLanca: TTabSheet;
    tsBoleto: TTabSheet;
    molCliente1: TmolCliente;
    Label6: TLabel;
    edtNumDocumento: TEdit;
    Label22: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label4: TLabel;
    cmbObraEtapa: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    edtVlrTotal: TRealEdit;
    cboMes: TComboBox;
    edtDataLanc: TCMDateTimePicker;
    Label8: TLabel;
    DBcboCentroCusto: TwwDBLookupCombo;
    Label26: TLabel;
    DBcboPortadorForma: TwwDBLookupCombo;
    chkBoleto: TCheckBox;
    memObs: TMemo;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label3: TLabel;
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
    qryCODDOCUMENTO: TFloatField;
    Label7: TLabel;
    dbCboGrupoContabil: TwwDBLookupCombo;
    molSubConta1: TmolSubConta;
    qryGrupoContabil: TwwQuery;
    qryGrupoContabilNOME: TStringField;
    qryGrupoContabilCLASSE: TStringField;
    qryGrupoContabilIDGRUPO: TFloatField;
    qryObraNOMESUBCONTA: TStringField;
    qryCLASSE: TStringField;
    qryDESC_GRUPO: TStringField;
    qryDATALANCAMENTO: TDateTimeField;
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
    procedure DBcboPortadorFormaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboPortadorFormaChange(Sender: TObject);
    procedure btnLimpaMsgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
    function  GravaLancamento : Boolean;
    function  GravaMensagemBoleto( const iDocumento: Int64): Boolean;

  public
    { Public declarations }
  end;

var
  frmCadObraLancReceita: TfrmCadObraLancReceita;

implementation

uses uMensErro, uSistema, uFuncoesImob, dLookImobiliario, dImobiliario, uDocumento,
     UDiasInUteis, uComunsImobiliario, uVerificaPreenchimento, dLancImovel, uDataBase, DCAF,
     uModuloInvestImob, uModuloImobiliario, dBaseDados;

{$R *.DFM}


procedure TfrmCadObraLancReceita.FormCreate(Sender: TObject);
begin
   inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   {CtrlCafObra := TCtrlCafObra.Create;
   CtrlCafObra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          ComunsImobiliario.MensErroMT);}
   CtrlCafObra := TCtrlImobObra.Create;
   CtrlCafObra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          ComunsImobiliario.MensErroMT);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlCafObra);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
end;

procedure TfrmCadObraLancReceita.FormDestroy(Sender: TObject);
begin
   FreeAndNil( CtrlCafObra );
   FreeAndNil(CtrlContab);  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   inherited;
end;


procedure TfrmCadObraLancReceita.molImovelObra1btnBuscaImovelClick(
  Sender: TObject);
begin
   inherited;
   // Abre o MontaSelect exibindo todas as obras (em aberto ou encerradas)
   molImovelObra1.btnBuscaImovelClick(Sender, 0);
   Seleciona(molImovelObra1.iObra);
end;

procedure TfrmCadObraLancReceita.Seleciona(const iIDObra:Integer);
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


procedure TfrmCadObraLancReceita.AbreQueries;
var iPFAnt : Integer;
    sCCAnt, sRecDesAnt : string;
begin
   // Tipo de Receita
   if DBcboTipoRecDes.LookupValue <> '' then sRecDesAnt := DBcboTipoRecDes.LookupValue;
   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PRECCUSTO').AsString := 'R';
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;
   if length(trim(sRecDesAnt)) > 0 then DBcboTipoRecDes.LookupValue := sRecDesAnt;

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

   if DBcboPortadorForma.LookupValue <> '' then iPFAnt := StrToInt(DBcboPortadorForma.LookupValue);
   with dtmLookImobiliario.qryLookPortadorForma do begin
      LimpaParametros(dtmLookImobiliario.qryLookPortadorForma);
      ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   // Traz também o Centro de Custo default, de acordo com os parâmetros do Sistema
   if iPFAnt > 0 then begin
      DBcboPortadorForma.LookupValue := IntToStr(iPFAnt);
   end else begin
      if not(dtmLookImobiliario.qryLookPortadorFormaCODPORTFORMA.isNull) then begin
         DBcboPortadorForma.LookupValue := IntToStr(dtmLookImobiliario.qryLookPortadorFormaCODPORTFORMA.AsInteger);
      end;
   end;

   // Abre Etapa da Obra
   qryObraEtapa.Open;
end;


procedure TfrmCadObraLancReceita.FechaQueries;
begin
   dtmLookImobiliario.qryLookFormaRecPag.Close;
   dtmLookImobiliario.qryLookCentroCusto.Close;
   qryObraEtapa.Close;
end;


procedure TfrmCadObraLancReceita.FormShow(Sender: TObject);
begin
   inherited;
   pnlGrd.BringToFront;
   dbgrd.SetFocus;
   sbtnInserir.Enabled := False;
   sbtnApagar.Enabled  := False;
   pagControle.ActivePageIndex := 0;
   AbreQueries;
   Seleciona(-1);

   // define competência default
   cboMes.ItemIndex := DiasInUteis.ExtraiMes(Date())-1;
   DBspnAno.Value   := DiasInUteis.ExtraiAno(Date());
end;

procedure TfrmCadObraLancReceita.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   bAbreQry := False;
   pnlControles.BringToFront;
   sbtnInserir.Enabled := False;
   sbtnApagar.Enabled  := False;
   edtDataLanc.Date    := Date();
   molCliente1.btnBuscaCli.SetFocus;
end;

procedure TfrmCadObraLancReceita.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   Panel1.Enabled := True;   
   if bAbreQry then Seleciona(molImovelObra1.iObra);
   pnlGrd.BringToFront;
   dbgrd.SetFocus;
end;

procedure TfrmCadObraLancReceita.bbtnConfirmarClick(Sender: TObject);
begin
   // Valida Campos do Lançamento
   try

      if molCliente1.edtNomeFantasia.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Cliente / Debitado!', molCliente1.btnBuscaCli);

      if edtNumDocumento.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Número do Documento!', edtNumDocumento);

      if DBcboTipoRecDes.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Receita!', DBcboTipoRecDes);

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

       if (DBcboCentroCusto.LookupValue = '') then
          raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentroCusto);

       if (DBcboPortadorForma.LookupValue = '') then
          raise EValidacao.CreateVal('É necessário indicar a Forma de Cobrança!', DBcboPortadorForma);

       // Verifica a exixtência de Desmembramentos ou reavaliações posteriores ao lançamento
       with dtmCAF do begin
          LimpaParametros(dtmCAF.qryLookObraLanc);
          qryLookObraLanc.ParamByName('PCAFOBRA').AsInteger   := molImovelObra1.iObra;
          qryLookObraLanc.ParamByName('PDTLIMITE').AsDateTime := edtDataLanc.Date;
          qryLookObraLanc.Open;
          if not qryLookObraLanc.IsEmpty then
             raise EValidacao.CreateVal('Existem desmembramentos / reavaliações posterior ao lançamento!', edtDataLanc);
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


procedure TfrmCadObraLancReceita.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   FechaQueries;
end;

procedure TfrmCadObraLancReceita.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   AbreNovoRegistro;
end;

procedure TfrmCadObraLancReceita.AbreNovoRegistro;
begin
   // gerar apenas um IDDocumento para todos os lançamentos para agrupá-los
   // na contabilidade e no contas a pagar
   iDocumento           := Documento.GetCodigo(dtmImobiliario.qryAux);
   edtNumDocumento.Text := FormatFloat('#0', iDocumento);

   Panel1.Enabled := False;
   edtDataVenc.Clear;
   edtVlrTotal.Clear;
end;

procedure TfrmCadObraLancReceita.molImovelObra1btnLimpaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelObra1.btnLimpaImovelClick(Sender);
  Seleciona(-1)
end;

function TfrmCadObraLancReceita.GravaLancamento : Boolean;
var iIDObraLanc : Extended;
    iIDLancImovel : Integer;
    fVlrReceita : Extended;
begin
   Result := True;
   try
      StartTransacao;
      // Grava Lançamento no CAF
      iIDObraLanc := 0;
      fVlrReceita := (edtVlrTotal.Value * -1);  // multiplica por -1 para inverter as contas

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
                                                 fVlrReceita,
                                                 '',
                                                 edtNumDocumento.Text, '', -1,
                                                 molCliente1.iCliente, '', 0, molImovelObra1.iImovel );
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
            ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);
            ParamByName('PRECPAG').AsString             := 'R';
            ParamByName('PMOEDAPAGAR').AsInteger        := Modulo.iMoedaCorrente;
            ParamByName('PIDFORCLI').AsInteger          := molCliente1.iCliente;
            ParamByName('PFLGINTEGRADO').AsInteger      := 0;
            ParamByName('PFLGORIGEMLANC').AsString      := 'O';
            ParamByName('PIDUSUARIOSISTEMA').AsInteger  := Sistema.IdUsuario;
            ParamByName('PIDDOCUMENTO').AsInteger       := iDocumento;
            ParamByName('PNODOCUMENTO').AsFloat         := StrToFloat(edtNumDocumento.text);
            ParamByName('PIDMODULO').AsInteger          := Sistema.IdModulo;
            ParamByName('PVLRLANCOMRECEB').AsFloat      := edtVlrTotal.Value;
            ParamByName('PVLRLANCRECEB').AsFloat        := edtVlrTotal.Value;
            ParamByName('PCODCENTROCUSTO').AsString     := DBcboCentroCusto.LookupValue;

            if DBcboPortadorForma.LookupValue <> '' then
               ParamByName('PCODPORTFORMA').AsInteger   := StrToInt(DBcboPortadorForma.LookupValue);
            if chkBoleto.Checked then
               ParamByName('PFLGAGRUPAR').AsString      := 'S';

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

         // Grava a Mensagem do Boleto
         if chkBoleto.Checked then begin
            if not GravaMensagemBoleto(iDocumento) then
               raise Exception.Create('Erro ao gravar a Mensagem do Boleto');
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
end;

procedure TfrmCadObraLancReceita.sbtnApagarClick(Sender: TObject);
var iResult    : Integer;
    sMsg, sSql : string;
    bIntegrado : Boolean;
begin
   inherited;
   if qryIDLANCIMOVEL.IsNull then begin
      MsgDlg('Lançamento interno do sistema não pode ser excluído.','Aviso',mtWarning,[mbOk],0);
      sbtnApagar.Enabled := True;
      Exit;
   end;

   if MsgDlg('Confirma a Exclusão do Lançamento?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
      sbtnApagar.Enabled := True;
      Exit;
   end;

   try
      try
         StartTransacao;

         // Exclui a referencia da Planilha do CAF no Documento que será excluído
         sSql := 'UPDATE LANCTODOCUM SET PLNCODIGO = NULL    '+#13+
                 ' WHERE PLNCODIGO = ( SELECT PLNCODIGO      '+#13+
                 '                       FROM CAFOBRALANC    '+#13+
                 '                      WHERE IDLANCIMOVEL = '+ qryIDLANCIMOVEL.AsString +')';
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

         // Exclui lançamento no Lançamento Imóvel
         iResult := FuncoesImob.ExcluiLancImovel(qryIDDOCUMENTO.AsInteger,
                                                 qryPLNCODIGO.AsInteger,
                                                 qryDTALANCAMENTO.AsDateTime,
                                                 (not qryCODDOCUMENTO.IsNull),
                                                 (not qryPLNCODIGO.IsNull),
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
     Seleciona(molImovelObra1.iObra);
     if qry.RecordCount > 0 then sbtnApagar.Enabled := True;
   end;
end;



procedure TfrmCadObraLancReceita.DBcboPortadorFormaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   chkBoleto.Checked   := not(dtmLookImobiliario.qryLookPortadorFormaIDCONFIGBARRAS.IsNull);
   tsBoleto.TabVisible := chkBoleto.Checked;
end;

procedure TfrmCadObraLancReceita.DBcboPortadorFormaChange(Sender: TObject);
begin
   inherited;
   chkBoleto.Checked   := not(dtmLookImobiliario.qryLookPortadorFormaIDCONFIGBARRAS.IsNull);
   tsBoleto.TabVisible := chkBoleto.Checked;
end;

procedure TfrmCadObraLancReceita.btnLimpaMsgClick(Sender: TObject);
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

function TfrmCadObraLancReceita.GravaMensagemBoleto(const iDocumento: Int64): Boolean;
var vMensagem : Array of String;
begin
   Result := True;

   // guarda as linhas digitadas
   SetLength(vMensagem, 9);
   vMensagem[0]   := copy(edtLinha1.Text, 1, 69);
   vMensagem[1]   := copy(edtLinha2.Text, 1, 69);
   vMensagem[2]   := copy(edtLinha3.Text, 1, 69);
   vMensagem[3]   := copy(edtLinha4.Text, 1, 69);
   vMensagem[4]   := copy(edtLinha5.Text, 1, 69);
   vMensagem[5]   := copy(edtLinha6.Text, 1, 69);
   vMensagem[6]   := copy(edtLinha7.Text, 1, 69);
   vMensagem[7]   := copy(edtLinha8.Text, 1, 69);
   vMensagem[8]   := copy(edtLinha9.Text, 1, 69);

   Result := FuncoesImob.InsertMsgLanc(iDocumento, '', '', -1, vMensagem) > 0;
end;

end.
