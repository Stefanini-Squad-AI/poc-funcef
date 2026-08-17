{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     Desmembramento de Obras

	Autor             :  Vinícius Meyer Lana
	Data de Início    :  31/03/2003
	Data de Término   :  01/04/2003

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina...........: .dfm (cdsPlanoPatroxImovel), CriaImoveisEConjuntos, GravaPlanoPatroDesmembra
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 13/03/2014
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
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


unit fExecDesmembraObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  TREdit, wwdbdatetimepicker, CMDateTimePicker, DBCtrls, mImovelObra,
  Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery, uCMClientDataSet,
  uCtrlCafObra, uCtrlMovDesmembramento, uCtrlImobObra,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab, DBClient;

type
  TfrmExecDesmembraObra = class(TfrmWizardMT)
    molImovelObra1: TmolImovelObra;
    Label2: TLabel;
    dbmemObra: TDBMemo;
    DtaInicioObra: TCMDateTimePicker;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label3: TLabel;
    Label8: TLabel;
    edtNumObras: TRealEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edtDataOper: TCMDateTimePicker;
    Panel7: TPanel;
    dbgObras: TwwDBGrid;
    qrySomaLancObra: TwwQuery;
    qrySomaLancObraSOMAVALOFI: TFloatField;
    qrySomaLancObraDESCCAFOBRA: TStringField;
    qrySomaLancObraDTAINICIOOBRA: TDateTimeField;
    qrySomaLancObraCODSUBCONTA: TFloatField;
    qrySomaLancObraUNIDNEGOC: TFloatField;
    qrySomaLancObraDTAENCERRAOBRA: TDateTimeField;
    qrySomaLancObraFLGSTATUS: TStringField;
    dsSomaLancObra: TwwDataSource;
    edtTotObra1: TDBRealEdit;
    updObraResult: TUpdateSQL;
    dsObraResult: TwwDataSource;
    qryObraResult: TwwQuery;
    qryObraResultIDOBRA: TFloatField;
    qryObraResultIDOBRA_RESULT: TFloatField;
    qryObraResultNOME_OBRA: TStringField;
    qryObraResultPERCENT_DESMEMBRA: TFloatField;
    qryObraResultNUM_OBRA_RESULT: TFloatField;
    qrySomaLancObraDTAULTIMOLANC: TDateTimeField;
    qryObraResultIDIMOVEL_RESULT: TFloatField;
    qryObraResultNOME_IMOVEL: TStringField;
    qryObraResultIDIMOVELMESTRE: TFloatField;
    qryObraResultIDCONJUNTO_RESULT: TFloatField;
    GroupBox4: TGroupBox;
    memEvento: TMemo;
    lblTerreno: TLabel;
    cdsPlanoPatroxImovel: TCMClientDataSet;
    procedure molImovelObra1btnBuscaImovelClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    //CtrlCafObra : TCtrlCafObra;
    CtrlCafObra : TCtrlImobObra;
    CtrlMovDesmembramento: TCtrlMovDesmembramento;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

    procedure Seleciona(const iObra: Integer);
    function  VerificaPreenchimento : Boolean;
    function  VerificaPreenchimentoDesmembra: Boolean;
    procedure CriaObrasResult(const iQtde:Integer);
    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;
    function  ExecutaDesmembraObra : Boolean;
    function  ExecutaDesmembraTerreno : Boolean;
    function  RegistraEventoTerreno(const iImovel:Integer; const sTipo:String;
                                      var iEvento:int64) : Boolean;
    function  CriaImoveisEConjuntos(const bCriaConjunto: Boolean) : Boolean;
    function  ExecutaDesmembraTerrenoCAF : Boolean;
    function  GravaDesmembraImovel( const iEventoOrigem: int64) : Boolean;
    //procedure  GravaPlanoPatroDesmembra;  // Vando - SOL 154328-5901 / KTN 1373449 - movida para CtrlImobObra
  public
    { Public declarations }
  end;

var
  frmExecDesmembraObra: TfrmExecDesmembraObra;

implementation

uses uSistema, dCAF, uMensErro, uFuncoesImob, uComunsImobiliario, uVerificaPreenchimento, uDataBase,
     dLookImobiliario, dImobiliario, uEventoImovel, uCAF, dBaseDados, uModuloImobiliario;

{$R *.DFM}


procedure TfrmExecDesmembraObra.FormCreate(Sender: TObject);
begin
   inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   //CtrlCafObra := TCtrlCafObra.Create;
   CtrlCafObra := TCtrlImobObra.Create;
   CtrlMovDesmembramento := TCtrlMovDesmembramento.Create;
   CtrlCafObra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          ComunsImobiliario.MensErroMT);
   CtrlMovDesmembramento.InitializeAs( CtrlCafObra );
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlCafObra);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
end;

procedure TfrmExecDesmembraObra.FormDestroy(Sender: TObject);
begin
   FreeAndNil( CtrlCafObra );
   FreeAndNil( CtrlMovDesmembramento );
   FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   inherited;
end;


procedure TfrmExecDesmembraObra.molImovelObra1btnBuscaImovelClick(Sender: TObject);
begin
  inherited;
  // Abre o MontaSelect exibindo apenas as obras encerradas
  molImovelObra1.btnBuscaImovelClick(Sender, 1);
  Seleciona(molImovelObra1.iObra);
end;

procedure TfrmExecDesmembraObra.Seleciona(const iObra: Integer);
begin
   // Totaliza o valor da obra
   qrySomaLancObra.Close;
   qrySomaLancObra.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qrySomaLancObra.ParamByName('PIDCAFOBRA').AsInteger := molImovelObra1.iObra;
   qrySomaLancObra.Open;

   // Abre os bens relacionados ao imovel anterior
   with dtmCAF.qryImovelxBem do begin
      LimpaParametros(dtmCAF.qryImovelxBem);
      ParamByName('PIDIMOVEL').AsInteger := molImovelObra1.iImovel;
      Open;
   end;
end;

procedure TfrmExecDesmembraObra.btnContinuarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      CriaObrasResult(word(trunc(edtNumObras.Value)));

      // Exibe mensagem de desmembramento do Terreno
      if dtmCAF.qryImovelxBem.IsEmpty then
           lblTerreno.Visible := False
      else lblTerreno.Visible := True;

      inherited;
      dbgObras.SetFocus;
   end;
end;

function TfrmExecDesmembraObra.VerificaPreenchimento: Boolean;
begin
   Result := False;
   try
      if ( length(trim(molImovelObra1.edtImovel.Text)) = 0 ) then
         raise EValidacao.CreateVal('É necessário indicar a Obra!', molImovelObra1.btnBuscaImovel);
      if ( edtDataOper.Date = 0 ) then
         raise EValidacao.CreateVal('É necessário indicar a Data da Operação!', edtDataOper);

      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataOper.Text) then
      begin
         Result := False;
         exit;
      end;
      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

      if ( edtDataOper.Date < qrySomaLancObraDTAULTIMOLANC.AsDateTime ) then
         raise EValidacao.CreateVal('Existem lançamentos para a obra com data posterior a data da operação!', edtDataOper);
      if ( edtNumObras.Value < 2 ) then
         raise EValidacao.CreateVal('É necessário que o Nº de obras novas seja pelo menos 2 (duas)!', edtNumObras);
      if ( MemEvento.Text = '' ) then
         raise EValidacao.CreateVal('Informe o Evento do Desmembramento!', MemEvento);
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

procedure TfrmExecDesmembraObra.CriaObrasResult(const iQtde: Integer);
var i : Integer;
    fPercent : Double;
begin
   fPercent := ComunsImobiliario.Arredonda(100 / iQtde, 4);
   qryObraResult.Close;
   qryObraResult.Open;

   for i := 1 to iQtde do begin
      // grava as obras resultantes virtualmente
      qryObraResult.Insert;
      qryObraResultNUM_OBRA_RESULT.AsInteger := i;
      qryObraResultIDOBRA.AsInteger          := molImovelObra1.iObra;
      qryObraResultIDIMOVELMESTRE.AsInteger  := molImovelObra1.iMestre;
      qryObraResultNOME_IMOVEL.AsString      := molImovelObra1.sImovel;
      qryObraResultNOME_OBRA.AsString        := molImovelObra1.sDescObra + '  -  ' + IntToStr(i);
      qryObraResultPERCENT_DESMEMBRA.AsFloat := fPercent;
      qryObraResult.Post;
   end;
   qryObraResult.First;
end;


procedure TfrmExecDesmembraObra.DesabilitaBotoes;
begin
  btnConfirmar.Enabled := False;
  btnVoltar.Enabled    := False;
end;

procedure TfrmExecDesmembraObra.HabilitaBotoes;
begin
  btnConfirmar.Enabled := True;
  btnVoltar.Enabled    := True;
end;

procedure TfrmExecDesmembraObra.btnConfirmarClick(Sender: TObject);
var bResult : Boolean;
begin
  inherited;
  qryObraResult.DisableControls;
  DesabilitaBotoes;
  bResult := True;
  try
     if VerificaPreenchimentoDesmembra then begin

        if MsgDlg('Confirma o Desmembramento da Obra ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

           try
             StartTransacao;
             bResult := ExecutaDesmembraObra;
             if bResult then bResult := ExecutaDesmembraTerreno;

             if bResult then begin
               //GravaPlanoPatroDesmembra;  // Vando - SOL 154328-5901 / KTN 1373449
               CommitTransacao;
               molImovelObra1.btnLimpaImovelClick( Self );
               Seleciona( -1 );
               IrParaPagina(0,'Desmembramento Realizado com Sucesso !')
             end else begin
               raise Exception.Create('');
             end;
           except
              RollBackTransacao;
              MsgDlg('Houve ERRO durante a tentativa de desmembramento do Imóvel!', 'Erro', mtError, [mbOk], 0);
              HabilitaBotoes;
           end;
        end;
     end;
  finally
     qryObraResult.EnableControls;
  end;
end;

function TfrmExecDesmembraObra.VerificaPreenchimentoDesmembra: Boolean;
var fTotPercent : Extended;
    bNomeBranco : Boolean;
begin
  Result      := True;
  fTotPercent := 0;
  bNomeBranco := False;
  // Verifica Percental de Rateio
  with qryObraResult do begin
    First;
    while not Eof do begin
      fTotPercent := fTotPercent + qryObraResultPERCENT_DESMEMBRA.AsFloat;
      if qryObraResultNUM_OBRA_RESULT.AsString = '' then bNomeBranco := True;
      Next;
    end;
    First;
  end;
  if fTotPercent <> 100 then begin
    MsgDlg('Percentual de rateio não perfaz 100%', 'Aviso', mtWarning, [mbOk], 0);
    Result := False;
  end;
  if bNomeBranco then begin
    MsgDlg('Informe a descrição de todas as obras resultantes', 'Aviso', mtWarning, [mbOk], 0);
    Result := False;
  end;
end;

function TfrmExecDesmembraObra.ExecutaDesmembraObra: Boolean;
var i              : Integer;
    vTipoProporcao : array of integer;
    vProporcao     : array of currency;
    vDescObra      : array of string;
    vIDObraResult  : array of integer;
    cdsObra, cdsFilhos : TCMClientDataSet;
begin
   Result := True;
   try
      try
         // Cria os cds para integração com o Ativo Fixo
         cdsObra   := TCMClientDataSet.Create( nil );
         cdsFilhos := TCMClientDataSet.Create( nil );
         CtrlCafObra.cds := cdsObra;
         CtrlCafObra.cdsObraFilhos := cdsFilhos;

         // Determina o tamanho do vetor
         i := StrToInt(FloatToStr(edtNumObras.Value));
         if i < 2 then raise Exception.create('O bem deve ser desmembrado em pelo menos 2 novas obras!');

         cdsObra.Data   := CtrlCafObra.ListaCafObra( Sistema.IdEmpresa, molImovelObra1.iObra );
         cdsFilhos.Data := CtrlCafObra.ListaObraFilhos;

         // carrega o cds com as obras Resultantes
         i := 0;
         qryObraResult.First;
         cdsFilhos.EmptyDataSet;
         while not(qryObraResult.EOF) do begin
            if qryObraResultPERCENT_DESMEMBRA.AsFloat > 0 then begin
               cdsFilhos.Insert;
               cdsFilhos.FieldByName('DESCCAFOBRA').AsString    := qryObraResultNOME_OBRA.AsString;
               cdsFilhos.FieldByName('TIPOPROPORCAO').AsInteger := 0;
               cdsFilhos.FieldByName('PROPORCAO').AsFloat       := qryObraResultPERCENT_DESMEMBRA.AsFloat;
               cdsFilhos.Post;
            end;
            qryObraResult.Next;
         end;

         CtrlCafObra.OpenTransaction := False;
         if not CtrlCafObra.ExecutaDesmembraObra(Sistema.IdModulo,
                                                 Sistema.IdEmpresa,
                                                 molImovelObra1.iObra,
                                                 edtDataOper.Date,
                                                 qrySomaLancObraSOMAVALOFI.AsFloat ) then begin
            raise Exception.Create( CtrlCafObra.MessageInfo );
         end;

         // Grava os IDs dos Obras na tabela de obras resultantes
         i := 0;
         qryObraResult.First;
         cdsFilhos.First;
         while not(qryObraResult.EOF) do begin
            if qryObraResultPERCENT_DESMEMBRA.AsFloat > 0 then begin
               qryObraResult.Edit;
               qryObraResultIDOBRA_RESULT.asInteger := cdsFilhos.FieldByName('IDOBRARESULT').AsInteger;
               qryObraResult.Post;
               cdsFilhos.Next;
            end;
            qryObraResult.Next;
         end;
      except
         on E : Exception do begin
            Result := False;
            MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
         end;
      end;
   finally
      FreeAndNil( cdsObra );
      FreeAndNil( cdsFilhos );
   end;
end;


function TfrmExecDesmembraObra.ExecutaDesmembraTerreno: Boolean;
var iEventoOrigem : int64;
    fSaldoTerreno : Extended;
    bPossuiBens   : Boolean;
begin
  Result := True;

  // Abre a tabela de bens do imovel associado a obra
  LimpaParametros(dtmCAF.qryImovelXBem);
  dtmCAF.qryImovelXBem.ParamByName('PIDIMOVEL').AsInteger := molImovelObra1.iImovel;
  dtmCAF.qryImovelXBem.Open;

  // Verifica se o imovel associado possui bens para serem desmembrados
  if dtmCAF.qryImovelXBem.IsEmpty then
       bPossuiBens := False
  else bPossuiBens := True;

  // Se o terreno possuir bens, desmembra os mesmos.
  try
     // Se o terreno possuir mais de um terreno... ALGO ERRADO... NÃO PROCESSA DESMEMBRAMENTO
     if dtmCAF.qryImovelXBem.RecordCount > 1 then
        raise Exception.Create('O imóvel associado possui mais de um bem além do terreno. Verifique!');

     // Altera a situação e registra evento no terreno original
     if not RegistraEventoTerreno(molImovelObra1.iImovel,'O',iEventoOrigem) then
        raise Exception.Create('Erro ao registrar o evento de desmembramento do Terreno');

     // Altera a situação e registra evento no terreno original
     if not CriaImoveisEConjuntos(bPossuiBens) then
        raise Exception.Create('Erro ao criar os desmembramentos do terreno associado a obra');

     // Altera a situação e registra evento no terreno original
     if bPossuiBens then begin
        if not ExecutaDesmembraTerrenoCAF then
           raise Exception.Create('Erro ao desmembrar o terreno no Ativo Fixo');
     end;

     // Altera a situação e registra evento no terreno original
     if not GravaDesmembraImovel(iEventoOrigem) then
        raise Exception.Create('Erro ao registrar a tabela DesmembraImovel');

  except
     on E : Exception do begin
        Result := False;
        MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
     end;
  end;
end;

function TfrmExecDesmembraObra.RegistraEventoTerreno(const iImovel: Integer; const sTipo: String;
                                                       var iEvento: int64): Boolean;
var fSaldoImovel : currency;
begin
   try
      Result       := True;
      iEvento      := 0;
      fSaldoImovel := 0;
      if sTipo = 'O' then begin
         EventoImovel.AlteraSituacaoImovel(iImovel, 'D');
         // Registra o evento desmembramento "DM" no imóvel original
         iEvento := EventoImovel.RegistraEvento(iImovel, -1, Sistema.idUsuario, -1,
                                 -1, edtDataOper.Date, -1, 'BD', 'Baixa por Desmembramento de Obras',
                                 memEvento.Text, 100, fSaldoImovel, 0, False);
      end else begin
         // Registra o evento desmembramento "DM" no imóvel resultante
         EventoImovel.AlteraSituacaoImovel(iImovel, 'O');
         iEvento := EventoImovel.RegistraEvento(iImovel, -1, Sistema.idUsuario, -1,
                                 -1, edtDataOper.Date, -1, 'ED', 'Entrada por Desmembramento de Obras',
                                 memEvento.Text, 100, 0, fSaldoImovel, False);
      end;
   except
      iEvento := 0;
      Result  := False;
   end;
end;

function TfrmExecDesmembraObra.CriaImoveisEConjuntos(const bCriaConjunto: Boolean): Boolean;
var iIDConjunto,iIDImovel, iCont : Integer;
    sSQL  : string;            // Vando - SOL 154328-5901 / KTN 1373449
begin
   Result := True;
   qryObraResult.First;
   iCont := 0;
   try
      // cria no banco cada imóvel resultante e define a situação do mesmo
      while not qryObraResult.EOF do begin
         Inc(iCont);
         iIDImovel := CAF.CriaImovel(qryObraResultNOME_IMOVEL.AsString,
                                     '',  {tipo de imovel = imovel anterior}
                                     qryObraResultIDIMOVELMESTRE.asInteger,
                                     molImovelObra1.iImovel, -1, -1, -1, iCont);
         if iIDImovel > 0 then begin
            iIdConjunto := 0;

            // Vando - SOL 154328-5901 / KTN 1373449 - inicio
            CtrlCafObra.GravaPlanoPatroxImovel(molImovelObra1.iImovel, iIDImovel);

            if bCriaConjunto then begin
               // Cria o Conjunto equivalente no banco para o imóvel
               iIdConjunto := LeUltRegistro(nil,'CONJUNTO');
               LimpaParametros(dtmCAF.qryInsConjunto);
               dtmCAF.qryInsConjunto.ParamByName('PIDCONJUNTO').AsInteger    := iIdConjunto;
               dtmCAF.qryInsConjunto.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
               dtmCAF.qryInsConjunto.ParamByName('PIDLOCALIZACAO').AsInteger := dtmCAF.qryImovelXBemIDLOCALIZACAO.AsInteger;
               dtmCAF.qryInsConjunto.ParamByName('PIDRESPONSAVEL').AsInteger := dtmCAF.qryImovelXBemIDRESPONSAVEL.AsInteger;
               dtmCAF.qryInsConjunto.ParamByName('PDESCCONJUNTO').AsString   := molImovelObra1.sMestre + ' - ' + qryObraResultNOME_IMOVEL.AsString;
               dtmCAF.qryInsConjunto.ExecSQL;


               // Abre RATEIODEPRECIACAO do grupo original para copiar os Centros de Custos
               LimpaParametros(dtmCAF.qryRateioDepreciacao);
               dtmCAF.qryRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger := dtmCAF.qryImovelXBemIDCONJUNTO.AsInteger;
               dtmCAF.qryRateioDepreciacao.Open;

               // Cria RATEIODEPRECIACAO para todos os centro de custos existentes anteriormente
               while not dtmCAF.qryRateioDepreciacao.eof do begin
                  LimpaParametros(dtmCAF.qryInsRateioDepreciacao);
                  dtmCAF.qryInsRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger    := iIdConjunto;
                  dtmCAF.qryInsRateioDepreciacao.ParamByName('PIDEMPRESA').AsInteger     := Sistema.IdEmpresa;
                  dtmCAF.qryInsRateioDepreciacao.ParamByName('PCODCENTROCUSTO').AsString := dtmCAF.qryRateioDepreciacaoCODCENTROCUSTO.AsString;
                  dtmCAF.qryInsRateioDepreciacao.ParamByName('PPARTICIPACAO').AsInteger  := dtmCAF.qryRateioDepreciacaoPARTICIPACAO.AsInteger;
                  dtmCAF.qryInsRateioDepreciacao.ParamByName('PDTAINICIO').AsDateTime    := edtDataOper.DateTime;
                  dtmCAF.qryInsRateioDepreciacao.ExecSQL;
                  dtmCAF.qryRateioDepreciacao.Next;
               end;
            end;

            // grava o ID do imovel gerado na tabela virtual
            qryObraResult.Edit;
            qryObraResultIDIMOVEL_RESULT.AsFloat := iIDImovel;
            if iIdConjunto > 0 then qryObraResultIDCONJUNTO_RESULT.AsFloat := iIdConjunto;
            qryObraResult.Post;

         end else begin
            raise Exception.Create('Erro ao criar os novos terrenos');
         end;
         qryObraResult.Next;
      end;
   except
      Result := False;
   end;
end;

function TfrmExecDesmembraObra.ExecutaDesmembraTerrenoCAF: Boolean;
var
   iBemOrigem  : int64;
   i,iSeqPlaca : integer;
   iMovimento  : Integer;
   fRegistros  : double;
   vPlacas     : array of Extended;
   vConjuntos  : array of integer;
   vGrupos     : array of integer;
   vNomesBens  : array of string;
   vPercent    : array of currency;
   vIDBens     : array of integer;
   vSaldoBens  : array of currency;
   cdsGerBens  : TCMClientDataSet;
begin
   Result := True;
   try
      try
         // Cria, abre vazio e associa o cds de bens desmembrados
         cdsGerBens := TCMClientDataSet.Create( nil );
         CtrlMovDesmembramento.cdsGerBens := cdsGerBens;
         cdsGerBens.Data := CtrlMovDesmembramento.GetDataPacket(
                            ' SELECT B.IDBEM, B.PLACA, B.DESBEM, B.IDCONJUNTO, '+
                            '        C.DESCCONJUNTO, B.IDGRUPO, G.CLASSE,      '+
                            '        G.NOME, (0.0000) AS PROPORCAO             '+
                            '   FROM BEM B, CONJUNTO C, GRUPO G                '+
                            '  WHERE B.IDBEM = -2                              '+
                            '    AND B.IDCONJUNTO = C.IDCONJUNTO               '+
                            '    AND B.IDGRUPO    = G.IDGRUPO                  ');

         // Executa o desmembramento para cada bem original
         dtmCAF.qryImovelXBem.First;
         while not(dtmCAF.qryImovelXBem.EOF) do begin
            iBemOrigem := dtmCAF.qryImovelXBemIDBEM.AsInteger;

            // Determina o tamanho do vetor
            i := StrToInt(FloatToStr(edtNumObras.Value));
            if i < 2 then raise Exception.create('O bem deve ser desmembrado em pelo menos 2 novas obras!');

            // carrega o cds com os bens resultantes
            iSeqPlaca := 0;
            cdsGerBens.EmptyDataSet;
            qryObraResult.First;
            if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) then Inc(iSeqPlaca);

            while not(qryObraResult.EOF) do begin
               if qryObraResultPERCENT_DESMEMBRA.AsFloat > 0 then begin
                  cdsGerBens.Insert;
                  cdsGerBens.FieldByName('IDCONJUNTO').AsInteger := qryObraResultIDCONJUNTO_RESULT.AsInteger;
                  cdsGerBens.FieldByName('IDGRUPO').AsInteger    := dtmCAF.qryImovelXBemIDGRUPO.AsInteger;
                  cdsGerBens.FieldByName('DESBEM').AsString      := dtmCAF.qryImovelXBemDESBEM.AsString;
                  cdsGerBens.FieldByName('PROPORCAO').AsFloat    := qryObraResultPERCENT_DESMEMBRA.AsFloat;
                  cdsGerBens.FieldByName('PLACA').AsFloat        := CAF.PlacaCaf(dtmCAF.qryImovelXBemIDGRUPO.AsInteger,
                                                                                 molImovelObra1.iImovel,
                                                                                 Sistema.IdEmpresa, 0,
                                                                                 iSeqPlaca);
                  cdsGerBens.Post;
                  if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao <> 1) then Inc(iSeqPlaca);
               end;
               qryObraResult.Next;
            end;

            CtrlMovDesmembramento.OpenTransaction := False;
            if not CtrlMovDesmembramento.ExecutaDesmembramento(Sistema.IdModulo,
                                                               Sistema.IdEmpresa,
                                                               Sistema.IdUsuario,
                                                               iBemOrigem,
                                                               edtDataOper.Date ) then begin
               raise Exception.Create( CtrlMovDesmembramento.MessageInfo );
            end;


            // Grava os IDs dos Bens na tabela IMOVELXBEM
            cdsGerBens.First;
            qryObraResult.First;
            while not(qryObraResult.EOF) do begin
               if qryObraResultPERCENT_DESMEMBRA.AsFloat > 0 then begin
                  LimpaParametros(dtmCAF.qryInsImovelxbem);
                  dtmCAF.qryInsImovelxbem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
                  dtmCAF.qryInsImovelxbem.ParamByName('PIDIMOVEL').AsInteger := qryObraResultIDIMOVEL_RESULT.AsInteger;
                  dtmCAF.qryInsImovelxbem.ParamByName('PIDBEM').AsInteger    := cdsGerBens.FieldByName('IDBEM').AsInteger;
                  dtmCAF.qryInsImovelxbem.ParamByName('PIXBGRUPO').AsString  := dtmCAF.qryImovelXBemIXBGRUPO.AsString;
                  dtmCAF.qryInsImovelxbem.ExecSql;

                  // Vando - SOL 154328-5901 / KTN 1373449
                  CtrlCafObra.AtualizaSegregacaoLancamentos(cdsGerBens.FieldByName('IDBEM').AsInteger, edtDataOper.DateTime);

                  cdsGerBens.Next;
               end;
               qryObraResult.Next;
            end;

            dtmCAF.qryImovelXBem.Next;
         end;
      except
         on E : Exception do begin
            Result := False;
            MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
         end;
      end;
   finally
      FreeAndNil( cdsGerBens );
   end;
end;

function TfrmExecDesmembraObra.GravaDesmembraImovel(const iEventoOrigem: int64): Boolean;
var i, iEventoResult : int64;
    fAreaTotal, fAreaNova : Extended;
    sSql : String;
    _cds : TCMClientDataSet;
begin
   Result := True;
   try
      // Busca area total do Imovel Original para ser reateado entre os desmembrados
      fAreaTotal := 0;
      sSql := 'SELECT IMOAREA FROM IMOVEL ' +
              ' WHERE IDIMOVEL = ' + IntToStr(molImovelObra1.iImovel);
      if FazQuery(dtmImobiliario.qryAux,sSql) then
           fAreaTotal := dtmImobiliario.qryAux.FieldByName('IMOAREA').AsFloat
      else raise Exception.Create('');

      // Executa ultimas alterações
      i := 0;
      qryObraResult.First;
      while not(qryObraResult.EOF) do
      begin
         if qryObraResultPERCENT_DESMEMBRA.AsFloat > 0 then begin

            // Registra o Evento no imovel resultante
            if not RegistraEventoTerreno(qryObraResultIDIMOVEL_RESULT.AsInteger,'R',iEventoResult) then
               raise Exception.Create('');

            // Rateia a Area Total do Imovel original pelos Novos Imoveis
            fAreaNova := ( fAreaTotal * qryObraResultPERCENT_DESMEMBRA.AsFloat ) / 100;
            sSql := 'UPDATE IMOVEL ' +
                    '   SET IMOAREA = ' + FloatToStr(Arredonda(fAreaNova,0)) +
                    ' WHERE IDIMOVEL = ' + IntToStr(qryObraResultIDIMOVEL_RESULT.AsInteger);
            if not ExecutarQuery(dtmImobiliario.qryAux,sSql) then
               raise Exception.Create('');

            // Abre cadastro da obra original para atualizar valores nos filhos
            LimpaParametros(dtmCAF.qryLookObra);
            dtmCAF.qryLookObra.ParamByName('PIDCAFOBRA').AsInteger := molImovelObra1.iObra;
            dtmCAF.qryLookObra.Open;

            // Associa o terreno desmembrado à obra desmembrada
            sSql := 'UPDATE CAFOBRA ' +
                    '   SET IDIMOVEL = ' + IntToStr(qryObraResultIDIMOVEL_RESULT.AsInteger) + ',';

            if not dtmCAF.qryLookObraUNIDNEGOC.IsNull then
               sSql := sSql + ' UNIDNEGOC   = ' +  IntToStr(dtmCAF.qryLookObraUNIDNEGOC.AsInteger) + ',';
            if not dtmCAF.qryLookObraIDGRUPO.IsNull then
               sSql := sSql + ' IDGRUPO     = ' +  IntToStr(dtmCAF.qryLookObraIDGRUPO.AsInteger) + ',';
            if not dtmCAF.qryLookObraCODSUBCONTA.IsNull then
               sSql := sSql + ' CODSUBCONTA = ' +  IntToStr(dtmCAF.qryLookObraCODSUBCONTA.AsInteger) + ',';

            sSql := sSql + '    IDTIPOCUSTORECIMO = ' +  IntToStr(dtmCAF.qryLookObraIDTIPOCUSTORECIMO.AsInteger) +
                        ' WHERE IDCAFOBRA = ' + IntToStr(qryObraResultIDOBRA_RESULT.AsInteger);
            if not ExecutarQuery(dtmImobiliario.qryAux,sSql) then
               raise Exception.Create('');

            // Registra o desmembramento na tabela DESMEMBRAIMOVEL
            with dtmCAF.qryInsDesmembraImovel do begin
               LimpaParametros(dtmCAF.qryInsDesmembraImovel);
               ParamByName('PIDIMOVELINI').AsInteger       := molImovelObra1.iImovel;
               ParamByName('PIDIMOVELFIM').AsInteger       := qryObraResultIDIMOVEL_RESULT.AsInteger;
               ParamByName('PIDEVENTOIMOVELINI').AsInteger := iEventoOrigem;
               ParamByName('PIDEVENTOIMOVELFIM').AsInteger := iEventoResult;
               ParamByName('PFLGTIPODESMEMBRA').AsString   := 'D';
               ParamByName('PDMRDATA').AsDateTime          := edtDataOper.Date;
               ParamByName('PDMRPERCENT').AsFloat          := qryObraResultPERCENT_DESMEMBRA.AsFloat;
               ExecSQL;
            end;
            Inc(i);
         end;
         qryObraResult.Next;
      end;
   except
      Result := False;
   end;
end;


{// Vando - SOL 154328-5901 / KTN 1373449 - inicio
procedure TfrmExecDesmembraObra.GravaPlanoPatroDesmembra(iIdImovelNovo : integer);
var
  sSQL : string;
  _cds : TCMClientDataSet;
begin
  _cds := TCMClientDataSet.Create(nil);
  try
    qryObraResult.First;
    while not(qryObraResult.EOF) do
    begin
      sSQL := 'SELECT IDPLANOPREV, IDPATRO, PPIPERCENTRATEIO, FLGTIPO ' +
                     '  FROM PLANOPATROXIMOVEL ' +
                     ' WHERE IDIMOVEL = ' + IntToStr(molImovelObra1.iImovel);
      _cds.Data := CtrlCafObra.GetDataPacket(sSQL);

      while not _cds.Eof do
      begin
        //Cria registros na tabela PLANOPATROXIMOVEL a partir do imovel origem
        sSql := 'INSERT INTO PLANOPATROXIMOVEL ' +
                ' VALUES (' + IntToStr(qryObraResultIDIMOVEL_RESULT.AsInteger) + ','
                            + _cds.FieldByName('IDPATRO').asString + ','
                            + _cds.FieldByName('IDPLANOPREV').AsString + ','
                            + ComunsImobiliario.TrocaVirgPPto(_cds.FieldByName('PPIPERCENTRATEIO').asString) + ','
                            + QuotedStr(_cds.FieldByName('FLGTIPO').asString)+ ')';
        if not ExecutarQuery(dtmImobiliario.qryAux,sSql) then
           raise Exception.Create('Erro ao atualizar a tabela PLANOPATROXIMOVEL');
        _cds.Next;
      end;
      qryObraResult.Next;
    end;
  finally
    FreeAndNil(_cds);
  end;

end;
} // Vando - SOL 154328-5901 / KTN 1373449 - fim

end.
