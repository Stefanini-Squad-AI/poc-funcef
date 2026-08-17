{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------

     Executa o Encerramento de Obras

	Autor             :  Vinícius Meyer Lana
	Data de Início    :  14/01/2002
	Data de Término   :  21/01/2002
--------------------------------------------------------------------------------
N. Sol..........: 258265
N. Kintana......: 983438
Data............: 14/08/2015
Responsável.....: William Moreira da Silva
Descrição.......: O Rateio pelo Plano dos imoveis, estava sendo lançados todos no planos padrão definido no CAF.
--------------------------------------------------------------------------------
N. Sol..........: 212226
N. Kintana......: 2037651
Data............: 08/04/2014
Responsável.....: Helio Lima Custódio
Descrição.......: Salvar os dados em histórico de vida útil e atualização
da taxa de depreciacao.
--------------------------------------------------------------------------------
Rotina...........: EncerraObraCAF 
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 13/03/2014
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
--------------------------------------------------------------------------------
N. Sol..........: 179583/9461
N. Kintana......: 1656762
Data............: 10/05/2012
Responsável.....: Otacilio
Descrição.......: Tratar mensagens incorretas e replicadas
--------------------------------------------------------------------------------
N. Sol..........: 172902/8222
N. Kintana......: 1577546
Data............: 04/04/2012
Responsável.....: Wylliam Leite da Silva
Descrição.......: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
SOL..........: 164246
Kintana......: 1409423
Responsável..: Helen V. Bianchi
Data.........: 05/09/2011
Descrição....: Add para aparecer apenas os Grupos Contábeis Ativos
--------------------------------------------------------------------------------
SOL..........: 864893
Kintana......: 139681
Responsável..: Felipe de Oliveira
Data.........: 23/07/2010
Descrição....: Corrigir o encerramento de obra, para contabilizar no plano de
               gestão administrativo
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27213
Responsável  : Daniel Simões
Data         : 29/02/2008
Descrição    : Passa a gravar o campo 'CODTIPIMOVELANT' na tabela
               'TRANSFBEMIMOVEL'...
--------------------------------------------------------------------------------
SOL..........: 139388
Kintana......: 766651
Responsável..: Cássio Camargo
Data.........: 08/07/2010
Descrição....: Correção dos processos de Encerramento de Obras e Estorno de
               Encerramento de Obras, para utilização da tabela
               PLANOPATROXVIGENCIABEM e PLANOPATROXVIGENCIAIMOB
-------------------------------------------------------------------------------}

unit FExecEncerraObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcLabel, mImovelObra, DBCtrls, uCMClientDataSet,
  wwdbdatetimepicker, CMDateTimePicker, fcButton, fcImgBtn, fcShapeBtn,
  wwdblook, mClasseBem, mLocalizacao, DBTables, Db, Wwdatsrc, Wwquery,
  TREdit, Grids, Wwdbigrd, Wwdbgrid, mImovel, {uCtrlCafObra,} uCtrlMovTransfBem,
  uCtrlDomBem, uCtrlGrupoContab, uCtrlConjunto, uCtrlResponsavel, uCtrlLocalizacoes,
  DBClient, uCmSqlParams, uCtrlImobObra,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab, Mask, wwdbedit, Wwdbspin,

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  uCtrlHistoricoVidaUtil;

type
  TfrmExecEncerraObra = class(TfrmSairAjudaImob)
    lblTitulo: TfcLabel;
    ntbPrincipal: TNotebook;
    molImovelObra1: TmolImovelObra;
    Label3: TLabel;
    edtDataInicio: TCMDateTimePicker;
    Label2: TLabel;
    dbmemObra: TDBMemo;
    GroupBox1: TGroupBox;
    Label52: TLabel;
    molLocalizacao1: TmolLocalizacao;
    molClasseBem1: TmolClasseBem;
    DBcboSituacao: TwwDBLookupCombo;
    Label7: TLabel;
    meObsEvento: TMemo;
    Bevel2: TBevel;
    btnContinuaSelecao: TfcShapeBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    edtDataEncerra: TCMDateTimePicker;
    Label4: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    qryGruposContabeis: TwwQuery;
    qryGruposContabeisIDGRUPO: TFloatField;
    qryGruposContabeisNOME: TStringField;
    qryGruposContabeisCLASSE: TStringField;
    qryGruposContabeisVALOR: TFloatField;
    qryGruposContabeisPERCENT: TFloatField;
    qryGruposContabeisPLACACAF: TFloatField;
    qryGruposContabeisFLGSEMPLACA: TFloatField;
    qryGruposContabeisDEPRECIACAO: TFloatField;
    qryGruposContabeisPERCENT_EFETIVO: TFloatField;
    qryGruposContabeisNOME_BEM: TStringField;
    qryGruposContabeisGRUPO_BEM: TStringField;
    dsGruposContabeis: TwwDataSource;
    updGruposContabeis: TUpdateSQL;
    Panel1: TPanel;
    fcShapeBtn4: TfcShapeBtn;
    wwDBGrid1: TwwDBGrid;
    Bevel4: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    edtTotalGrupo: TRealEdit;
    fcShapeBtn8: TfcShapeBtn;
    fcShapeBtn3: TfcShapeBtn;
    qrySomaLancObra: TwwQuery;
    qrySomaLancObraSOMAVALOFI: TFloatField;
    dsSomaLancObra: TwwDataSource;
    Label8: TLabel;
    qrySomaLancObraDESCCAFOBRA: TStringField;
    qrySomaLancObraDTAINICIOOBRA: TDateTimeField;
    edtTotObra1: TDBRealEdit;
    edtTotObra: TDBRealEdit;
    qrySomaLancObraCODSUBCONTA: TFloatField;
    qrySomaLancObraUNIDNEGOC: TFloatField;
    qryGruposContabeisIDBEM: TFloatField;
    qryGruposContabeisCC_DESMEMBRA: TFloatField;
    qrySomaLancObraDTAENCERRAOBRA: TDateTimeField;
    GroupBox2: TGroupBox;
    edtNovoImovel: TEdit;
    qrySomaLancObraFLGSTATUS: TStringField;
    lblTerreno: TLabel;
    sqlBens: TCMSqlParams;
    cdsBens: TCMClientDataSet;
    cdsLocalTransf: TCMClientDataSet;
    cdsRespTransf: TCMClientDataSet;
    cdsBemTransf: TCMClientDataSet;
    cdsGrupoTransf: TCMClientDataSet;
    cdsConjTransf: TCMClientDataSet;
    cdsHistoricoVidaUtil: TCMClientDataSet;
    cdsHistoricoVidaUtilVIDAUTIL: TFloatField;
    cdsHistoricoVidaUtilTXDEP_ANO: TFloatField;
    cdsHistoricoVidaUtilTXDEP_MES: TFloatField;
    cdsHistoricoVidaUtilVIGENTE: TStringField;
    cdsHistoricoVidaUtilTRGDTINCLUSAO: TDateTimeField;
    cdsHistoricoVidaUtilTRGUSERINCLUSAO: TStringField;
    cdsHistoricoVidaUtilHistVidaUtilIDIMOVEL: TFloatField;
    cdsHistoricoVidaUtilHIST_EVENTO: TStringField;
    dsHistoricoVidaUtil: TwwDataSource;
    StaticText1: TStaticText;
    wwDBspnVidaUtil: TwwDBSpinEdit;
    Meses: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure molImovelObra1btnBuscaImovelClick(Sender: TObject);
    procedure molImovelObra1btnLimpaImovelClick(Sender: TObject);
    procedure fcShapeBtn8Click(Sender: TObject);
    procedure fcShapeBtn3Click(Sender: TObject);
    procedure fcShapeBtn4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    fVlrTerreno : Extended;

    //CtrlCafObra : TCtrlCafObra;
    CtrlCafObra : TCtrlImobObra;
    CtrlMovTransfBem : TCtrlMovTransfBem;
    CtrlDomBem : TCtrlDomBem;
    CtrlGrupo  : TCtrlGrupoContab;
    CtrlConjunto : TCtrlConjunto;
    CtrlResponsavel : TCtrlResponsavel;
    CtrlLocalizacao : TCtrlLocalizacoes;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

    //Helio - SOL Nº 212226 KINTANA Nº 2037651
    CtrlHistoricoVidaUtil : TCtrlHistoricoVidaUtil;

    procedure AbreQueries;
    procedure FechaQueries;
    procedure Seleciona;
    procedure CalculaCamposVirtuais;
    function  RateiaGrupos: Boolean;
    function  VerificaPreenchimentoOper: boolean;
    function  TotalizaGrupo: Boolean;

//    function  CriaPrimeiroBem (var iIdConjunto, iIdImovelNovo, iIDBemOrig:Integer): Boolean;
//    function  DesmembraPrimeiroBem(const iIdConjunto, iIdImovelNovo, iIDBemOrig:Integer): Boolean;
//    function  TransfereBensdeGrupo(const iIdConjunto, iIdImovelNovo:Integer): Boolean;

    function  EncerraObraCAF(var iIdConjunto, iIdImovelNovo, iIdBemOrig:Integer): Boolean;
    function  TransfereTerreno(const iIdConjunto, iIdImovelNovo: Integer): Boolean;
    function  AlteraImovel(const iIdImovelNovo: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExecEncerraObra: TfrmExecEncerraObra;

implementation

uses dLookImobiliario, uMolduras, dImobiliario, uFuncoesImob, uMensErro, uSistema,
     uComunsImobiliario, uDataBase, DCAF, uAtivoFixo, uCAF, uModuloInvestImob, uVerificaPreenchimento,
     uEventoImovel, dBaseDados, uModuloImobiliario;

{$R *.DFM}

procedure TfrmExecEncerraObra.FormCreate(Sender: TObject);
begin
   inherited;
   ParametrosSistema;
   if ModuloImobiliario.InvestImob.iIdLocalizacao > 0 then begin
      molLocalizacao1.iPessoaLoc   := ModuloImobiliario.InvestImob.iIdPessoaLocalizacao;
      molLocalizacao1.iLocalizacao := ModuloImobiliario.InvestImob.iIdLocalizacao;
      AtribuiMolLocalizacao(molLocalizacao1.iLocalizacao, molLocalizacao1.iPessoaLoc, molLocalizacao1.edtLocalizacao, molLocalizacao1.iResponsavel, molLocalizacao1.sCodCentroCusto);
   end;

   if ModuloImobiliario.InvestImob.iIdClasseBem > 0 then begin
      molClasseBem1.iClasseBem := ModuloImobiliario.InvestImob.iIdClasseBem;
      AtribuiMolClasseBem (molClasseBem1.iClasseBem, molClasseBem1.edtClasseBem);
   end;

   //CtrlCafObra      := TCtrlCafObra.Create;
   CtrlCafObra      := TCtrlImobObra.Create;
   CtrlMovTransfBem := TCtrlMovTransfBem.Create;
   CtrlDomBem       := TCtrlDomBem.Create;
   CtrlGrupo        := TCtrlGrupoContab.Create;
   CtrlConjunto     := TCtrlConjunto.Create;
   CtrlResponsavel  := TCtrlResponsavel.Create;
   CtrlLocalizacao  := TCtrlLocalizacoes.Create;

   //Helio - SOL Nº 212226 KINTANA Nº 2037651
   CtrlHistoricoVidaUtil := TCtrlHistoricoVidaUtil.Create;

   CtrlCafObra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          ComunsImobiliario.MensErroMT);
   CtrlMovTransfBem.InitializeAs( CtrlCafObra );
   CtrlDomBem.InitializeAs( CtrlCafObra );
   CtrlGrupo.InitializeAs( CtrlCafObra );
   CtrlConjunto.InitializeAs( CtrlCafObra );
   CtrlResponsavel.InitializeAs( CtrlCafObra );
   CtrlLocalizacao.InitializeAs( CtrlCafObra );

   //Helio - SOL Nº 212226 KINTANA Nº 2037651
   CtrlHistoricoVidaUtil.InitializeAs(CtrlCafObra);
   CtrlHistoricoVidaUtil.CdsHistoricoVidaUtil := cdsHistoricoVidaUtil;
   //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

   CtrlMovTransfBem.cdsBem         := cdsBemTransf;
   CtrlMovTransfBem.cdsConjunto    := cdsConjTransf;
   CtrlMovTransfBem.cdsGrupo       := cdsGrupoTransf;
   CtrlMovTransfBem.cdsResponsavel := cdsRespTransf;
   CtrlMovTransfBem.cdsLocalizacao := cdsLocalTransf;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlLocalizacao);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
end;

procedure TfrmExecEncerraObra.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlCafObra );
  FreeAndNil( CtrlMovTransfBem );
  FreeAndNil( CtrlDomBem );
  FreeAndNil( CtrlGrupo );
  FreeAndNil( CtrlConjunto );
  FreeAndNil( CtrlResponsavel );
  FreeAndNil( CtrlLocalizacao );
  FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  FreeAndNil( CtrlHistoricoVidaUtil ); //Helio - SOL Nº 212226 KINTANA Nº 2037651
  
  inherited;
end;

procedure TfrmExecEncerraObra.AbreQueries;
var sTipoImovelAnt : string;
begin
   // Abre Tipo de Imóvel
   sTipoImovelAnt := '';
   if DBcboTipoImovel.LookupValue <> '' then sTipoImovelAnt := DBcboTipoImovel.LookupValue;
   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;
   DBcboTipoImovel.LookupValue := sTipoImovelAnt;

   // Abre Situação do Imóvel
   ParametrosSistema;
   dtmLookImobiliario.qryLookSituacao.Open;
   DBcboSituacao.LookupValue := inttostr(ModuloImobiliario.InvestImob.iIdSituacao);
end;


procedure TfrmExecEncerraObra.FechaQueries;
begin
   dtmLookImobiliario.qryLookTipoImovel.Close;
   dtmLookImobiliario.qryLookSituacao.Close;
end;


procedure TfrmExecEncerraObra.FormShow(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
   Repaint;
   Application.ProcessMessages;
   AbreQueries;
end;


procedure TfrmExecEncerraObra.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimentoOper then begin
      // OBRIGA a conversão
      if RateiaGrupos then begin
         ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
         edtNovoImovel.SetFocus;
      end;
   end;
end;

function TfrmExecEncerraObra.VerificaPreenchimentoOper: boolean;
begin
   Result := False;
   try
      if ( (molImovelObra1.iImovel <= 0) or (molImovelObra1.edtImovel.Text = '') ) then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel!', molImovelObra1.btnBuscaImovel);

      if DBcboTipoImovel.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar Tipo do Imóvel!', DBcboTipoImovel);

      if edtDataEncerra.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Encerramento!', edtDataEncerra);


       // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataEncerra.Text) then
         begin
            exit;
      end;
      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

      if edtDataEncerra.Date < edtDataInicio.Date then
         raise EValidacao.CreateVal('Data de Encerramento não deve ser Inferior a data de Início da Obra!', edtDataEncerra);


      if molLocalizacao1.edtLocalizacao.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Localização para o CAF!', molLocalizacao1.btnBuscaLocalizacao);

      if molClasseBem1.edtClasseBem.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Classe do Bem para o CAF!', molClasseBem1.btnBuscaClasseBem);

      if DBcboSituacao.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Situação do Bem para o CAF!', DBcboSituacao);
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


function TfrmExecEncerraObra.RateiaGrupos: Boolean;
var
   sParametro, sSql: String;
begin
   sParametro := '';

   // Caso o imovel seja um TERRENO, o mesmo será transferido para o novo imóvel,
   // e o valor da obra sera rateado pelos outros grupos
   {if (dtmCAF.qryImovelxBem.RecordCount = 1) and
      (dtmCAF.qryImovelXBemIXBGRUPO.AsString = 'T') then begin

      fVlrTerreno := CAF.SaldoContabilImovel(dtmCAF.qryImovelXBemIDIMOVEL.AsInteger, -1, edtDataEncerra.Date);}
   if (dtmCAF.qryObraImovelxBem.RecordCount = 1) and
      (dtmCAF.qryObraImovelXBemIXBGRUPO.AsString = 'T') then
   begin

      fVlrTerreno := CAF.SaldoContabilImovel(dtmCAF.qryObraImovelXBemIDIMOVEL.AsInteger, -1, edtDataEncerra.Date);


      lblTerreno.Caption := 'ATENÇÃO - O Imóvel associado a obra possui um TERRENO no valor de ' +
                            FormatFloat('###,###,###.00', fVlrTerreno) +#13+
                            '                  o qual será incorporado ao novo imóvel.';
   end else begin
      fVlrTerreno        := 0;
      lblTerreno.Caption := '';
      if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.IsNull then begin
         sParametro := dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsString + ',';
      end;
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOAR.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOAR.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOUTILITARIO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOUTILITARIO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOMAQUINA.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOMAQUINA.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOMOVEL.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOMOVEL.AsString + ',';
   end;

   if sParametro = '' then begin
      MsgDlg('O tipo de imóvel não possui nenhum grupo contábil associado.','Aviso',mtwarning,[mbok],0);
      Result := false;
      exit;
   end else begin
      sParametro := copy(sParametro,1,Length(sParametro)-1);
   end;

   sSql := 'SELECT '+ #13+
           '   G.IDGRUPO, G.NOME, G.CLASSE, G.FLGSEMPLACA, G.DEPRECIACAO, 0 AS PERCENT, 0 AS VALOR, '+#13+
           '   0 AS PERCENT_EFETIVO, -1 AS PLACACAF, ''                         '' AS NOME_BEM, '' '' AS GRUPO_BEM, ' + #13 +
           '   0 AS IDBEM, 0 AS CC_DESMEMBRA ' + #13 +
           'FROM ' + #13 +
           '   GRUPO G ' + #13 +
           'WHERE ' + #13 +
           '   ( G.FLGIMOVEL = 1 ) ' + #13 +
           '   AND ( TIPO = ''A'' ) ' + #13 +
           '   AND ( G.IDGRUPO IN (' + sParametro + ') ) ' + #13 +
           '   AND ( G.STATUS = ''A'')' + #13 +  //Helen SOL Nº 164246 KINTANA Nº 1409423
           'ORDER BY ' + #13 +
           '   G.NOME, G.CLASSE';

   qryGruposContabeis.SQL.Clear;
   qryGruposContabeis.SQL.Add(sSql);
   qryGruposContabeis.Open;
   CalculaCamposVirtuais;
   qryGruposContabeis.First;
   Result := true;
end;

procedure TfrmExecEncerraObra.CalculaCamposVirtuais;
var GrupoImobiliario : rGrupoBem;
begin
   qryGruposContabeis.First;
   while not qryGruposContabeis.Eof do begin
      qryGruposContabeis.Edit;
      GrupoImobiliario := CAF.GrupoImobiliario(qryGruposContabeisIDGRUPO.AsInteger, '');
      qryGruposContabeisNOME_BEM.AsString  := GrupoImobiliario.sDescricao;
      qryGruposContabeisGRUPO_BEM.AsString := GrupoImobiliario.sTipoGrupo;
      qryGruposContabeis.Post;
      qryGruposContabeis.Next;
   end;
end;



procedure TfrmExecEncerraObra.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;
   case ntbPrincipal.PageIndex of
      0: lblTitulo.Caption := 'Encerramento de Obras [ Seleção ]';
      1: lblTitulo.Caption := 'Encerramento de Obras [ Imóvel ]';
      2: lblTitulo.Caption := 'Encerramento de Obras [ Bens ]';
   end;
   Repaint;
   Application.ProcessMessages;
end;

procedure TfrmExecEncerraObra.molImovelObra1btnBuscaImovelClick(
  Sender: TObject);
begin
   inherited;
   // Executa o MontaSelect somente com as obras em aberto
   molImovelObra1.btnBuscaImovelClick(Sender, 1);
   Seleciona;

   //Helio - SOL Nº 212226 KINTANA Nº 2037651
   cdsHistoricoVidaUtil.Data       := CtrlHistoricoVidaUtil.LookupHistoricoVidaUtilVigente( molImovelObra1.iImovel );
end;


procedure TfrmExecEncerraObra.Seleciona;
begin
   // Totaliza o valor da obra
   qrySomaLancObra.Close;
   qrySomaLancObra.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qrySomaLancObra.ParamByName('PIDCAFOBRA').AsInteger := molImovelObra1.iObra;
   qrySomaLancObra.Open;

   // Abre os bens relacionados ao imovel anterior
   {with dtmCAF.qryImovelxBem do begin
      LimpaParametros(dtmCAF.qryImovelxBem);}
   with dtmCAF.qryObraImovelxBem do begin
      LimpaParametros(dtmCAF.qryObraImovelxBem);
      ParamByName('PIDIMOVEL').AsInteger := molImovelObra1.iImovel;
      Open;
   end;
end;


procedure TfrmExecEncerraObra.molImovelObra1btnLimpaImovelClick(
  Sender: TObject);
begin
   inherited;
   molImovelObra1.btnLimpaImovelClick(Sender);
   qrySomaLancObra.Close;
   //dtmCAF.qryImovelxBem.Close;
   dtmCAF.qryObraImovelxBem.Close;
   edtTotObra1.Value := 0;
end;

procedure TfrmExecEncerraObra.fcShapeBtn8Click(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TfrmExecEncerraObra.fcShapeBtn3Click(Sender: TObject);
var iIdConjunto, iIdImovelNovo, iIdBemOrig: Integer;
    bResult : boolean;
{    cdsPlanoPatroxImovel : TCmClientDataSet;
    sSql: string;}
    dDataVigencia : TDateTime;
begin
   inherited;
//   sSql := '';
//   cdsPlanoPatroxImovel := TCmClientDataSet.Create(nil);
   bResult := True;
   if edtNovoImovel.Text = '' then begin
      MsgDlg('Informe o nome do imóvel a ser criado!','Aviso',mtWarning,[mbok],0);
      Exit;
   end;

   if MsgDlg('Confirma o Encerramento da Obra ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
      Exit;
   end;

   try
//    cdsPlanoPatroxImovel.Data := CtrlCafObra.LookupPlanoPatroxImovel(molImovelObra1.iImovel);
      qryGruposContabeis.DisableControls;
      if TotalizaGrupo then begin
         try
            StartTransacao;
            bResult := EncerraObraCAF(iIdConjunto, iIdImovelNovo, iIdBemOrig);
            if bResult then bResult := TransfereTerreno(iIdConjunto, iIdImovelNovo);

//            bResult := CriaPrimeiroBem(iIdConjunto, iIdImovelNovo, iIdBemOrig);
//            if bResult then bResult := DesmembraPrimeiroBem(iIdConjunto, iIdImovelNovo, iIdBemOrig);
//            if bResult then bResult := TransfereBensdeGrupo(iIdConjunto, iIdImovelNovo);

            if bResult then bResult := AlteraImovel(iIdImovelNovo);
            if bResult then begin
            //if false then begin               //Tirado commit, William Moreira da Silva
               CommitTransacao;             //Tirado commit, William Moreira da Silva
               MsgDlg('Obra Encerrada com Sucesso!','Informação',mtInformation,[mbok],0);

// Felipe de Oliveira Sol 139681 ktn 864893 - Início

{            //Cria registros na tabela PLANOPATROXIMOVEL
            cdsPlanoPatroxImovel.First;
            while not cdsPlanoPatroxImovel.Eof do
            begin
              sSql := 'INSERT INTO PLANOPATROXIMOVEL (IDIMOVEL, IDPATRO, IDPLANOPREV, PPIPERCENTRATEIO, FLGTIPO) ' + #13 +
                      'VALUES ( ' +  IntToStr(iIdImovelNovo) + ', ' + #13
                                  + cdsPlanoPatroxImovel.FieldByName('IDPATRO').AsString + ', ' + #13
                                  + cdsPlanoPatroxImovel.FieldByName('IDPLANOPREV').asString + ', ' + #13
                                  + ComunsImobiliario.TrocaVirgPPto(cdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').asString) + ', ' + #13
                                  + QuotedStr(cdsPlanoPatroxImovel.FieldByName('FLGTIPO').asString)+ ')';
              if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                raise Exception.Create('Erro ao atualizar a tabela PLANOPATROXIMOVEL');
              cdsPlanoPatroxImovel.Next;
            end;

            dDataVigencia := Now;
            //Cria registros na tabela HSTPERCSEGREGAIMOB
            cdsPlanoPatroxImovel.First;
            while not cdsPlanoPatroxImovel.Eof do
            begin}
            //Cássio - SOL Nº 139388 KINTANA Nº 855985 - Início
              {sSql := 'INSERT INTO HSTPERCSEGREGAIMOB (IDHSTPERCSEGREGAIMOB, IDIMOVEL, DATAVIGENCIA, IDPLANOPREV, IDPATRO, PERCSEGREGAIMOV, TRGDTINCLUSAO, STATUS) ' + #13 +
                      'VALUES ( ' + InttoStr(LeUltRegistro(nil, 'HSTPERCSEGREGAIMOB')) + ', ' + #13
                                  + IntToStr(iIdImovelNovo) + ', ' + #13
                                  + 'TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVigencia))+ ', ''DD/MM/YYYY''), ' + #13 //DateTimeToStr(dDataVigencia))
                                  + cdsPlanoPatroxImovel.FieldByName('IDPLANOPREV').asString + ', ' + #13
                                  + cdsPlanoPatroxImovel.FieldByName('IDPATRO').AsString + ', ' + #13
                                  + QuotedStr(cdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').asString) + ', ' + #13
                                  + 'TO_DATE(' + QuotedStr(DateTimeToStr(dDataVigencia))+ ', ''DD/MM/YYYY HH24:MI:SS''), ' + #13
                                  + QuotedStr('Incluída') + ')';
              if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                raise Exception.Create('Erro ao atualizar a tabela HSTPERCSEGREGAIMOB');}

              {sSql := 'INSERT INTO PLANOPATROXVIGENCIAIMOB (IDPLANOPATROXVIGENCIAIMOB, IDIMOVEL, DATAVIGENCIA, IDPLANOPREV, IDPATRO, PERCENTRATEIO, TRGDTINCLUSAO) ' + #13 +
                      'VALUES ( ' + InttoStr(LeUltRegistro(nil, 'PLANOPATROXVIGENCIAIMOB')) + ', ' + #13
                                  + IntToStr(iIdImovelNovo) + ', ' + #13
                                  + 'TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVigencia))+ ', ''DD/MM/YYYY''), ' + #13 //DateTimeToStr(dDataVigencia))
                                  + cdsPlanoPatroxImovel.FieldByName('IDPLANOPREV').asString + ', ' + #13
                                  + cdsPlanoPatroxImovel.FieldByName('IDPATRO').AsString + ', ' + #13
                                  + QuotedStr(cdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').asString) + ', ' + #13
                                  + 'TO_DATE(' + QuotedStr(DateTimeToStr(dDataVigencia))+ ', ''DD/MM/YYYY HH24:MI:SS''))';
              if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                raise Exception.Create('Erro ao atualizar a tabela PLANOPATROXVIGENCIAIMOB');
            //Cássio - SOL Nº 139388 KINTANA Nº 855985 - Fim

              cdsPlanoPatroxImovel.Next;

// Felipe de Oliveira Sol 139681 ktn 864893 - Fim
            end;}

               molImovelObra1btnLimpaImovelClick(Self);
               ntbPrincipal.PageIndex := 0;
            end else begin
               RollBackTransacao;
               MsgDlg('Ocorreram ERROS no Encerramento da Obra!','Aviso',mtWarning,[mbok],0);
            end;
         except
            RollBackTransacao;
            MsgDlg('Ocorreram ERROS no Encerramento da Obra!','Aviso',mtWarning,[mbok],0);
         end;
      end;
   finally
      qryGruposContabeis.EnableControls;
      //FreeAndNil(cdsPlanoPatroxImovel);
   end;
end;


procedure TfrmExecEncerraObra.fcShapeBtn4Click(Sender: TObject);
begin
  inherited;
  TotalizaGrupo;
end;


function TfrmExecEncerraObra.TotalizaGrupo: Boolean;
var
   fTotGrupo, fMaior, fDiferenca, fTotalPercent: Extended;
begin
   qryGruposContabeis.DisableControls;
   fTotGrupo     := 0;
   fTotalPercent := 0;
   fMaior        := 0;
   qryGruposContabeis.First;
   if edtTotObra.Value <> 0 then begin
      while not qryGruposContabeis.Eof do begin
         if qryGruposContabeisPERCENT.AsFloat <> 0 then begin
            qryGruposContabeis.Edit;
            qryGruposContabeisVALOR.AsFloat   := Arredonda(edtTotObra.Value * (qryGruposContabeisPERCENT.AsFloat / 100),2);
            qryGruposContabeis.Post;
         end else begin
            qryGruposContabeis.Edit;
            qryGruposContabeisPERCENT.AsFloat := Arredonda((qryGruposContabeisVALOR.AsFloat * 100) / edtTotObra.Value, 4);
            qryGruposContabeis.Post;
         end;

         if qryGruposContabeisVALOR.AsFloat > 0 then begin
            if fMaior < qryGruposContabeisVALOR.AsFloat then fMaior := qryGruposContabeisVALOR.AsFloat;
            fTotGrupo   := fTotGrupo + qryGruposContabeisVALOR.AsFloat;
            qryGruposContabeis.Edit;
            qryGruposContabeisPERCENT_EFETIVO.AsFloat := qryGruposContabeisVALOR.AsFloat / edtTotObra.Value;
            qryGruposContabeis.Post;
            fTotalPercent := fTotalPercent + qryGruposContabeisPERCENT_EFETIVO.AsFloat;
         end;
         qryGruposContabeis.Next;
      end;
   end;

   // apurar o valor da diferença do rateio
   edtTotalGrupo.Value := fTotGrupo;
   fDiferenca := edtTotObra.Value - edtTotalGrupo.Value;

   // acertar a diferença no maior grupo
   qryGruposContabeis.First;
   // tolerar uma diferença de no máximo R$ 2,00
   if (fDiferenca >= -2) and (fDiferenca <= 2) then begin
      while (fDiferenca <> 0) do begin
         if qryGruposContabeisVALOR.AsFloat = fMaior then begin
            qryGruposContabeis.Edit;
            qryGruposContabeisVALOR.AsFloat := qryGruposContabeisVALOR.AsFloat + fDiferenca;
            fDiferenca := 0;
            // ajusta o percentual
            if fTotalPercent <> 1 then begin
               qryGruposContabeisPERCENT_EFETIVO.AsFloat := qryGruposContabeisPERCENT_EFETIVO.AsFloat + (1 - fTotalPercent);
               fTotalPercent := 1;
            end;
            qryGruposContabeis.Post;
         end;
         qryGruposContabeis.Next
      end;
   end else begin
      MsgDlg(FormatFloat ('Verificar valores lançados, apurada diferença de: #,##0.00', fDiferenca),'Aviso',mtwarning,[mbok],0);
   end;

   // calcular o total novamente para ver se esta certo - BACA
   fTotGrupo := 0;
   qryGruposContabeis.First;
   while not qryGruposContabeis.Eof do begin
      fTotGrupo := fTotGrupo + qryGruposContabeisVALOR.AsFloat;
      qryGruposContabeis.Next;
   end;

   edtTotalGrupo.Value := fTotGrupo;
   if Arredonda(edtTotObra.Value,2) <> Arredonda(edtTotalGrupo.Value,2) then
        result := false
   else result := true;
   qryGruposContabeis.EnableControls;
end;


function TfrmExecEncerraObra.EncerraObraCAF(var iIdConjunto, iIdImovelNovo, iIdBemOrig: Integer): Boolean;
var iIdMestreNovo, iIdBem, iPlanilha, iSeqPlaca  : Integer;
    sSql : String;
    cdsObra{, cdsPlanoPatro} : TCMClientDataSet;
// Felipe de Oliveira Sol 139681 ktn 864893 - Início
    cdsPlanoPatroxImovel : TCmClientDataSet;
// Felipe de Oliveira Sol 139681 ktn 864893 - Fim
    iIdimovel : integer;
    dDataVigencia : TDateTime;
    cdsTaxasDep : TCMClientDataSet; //Helio - SOL Nº 212226 KINTANA Nº 2037651
    auxTaxaDep, auxVidaUtil : Extended;//Helio - SOL Nº 212226 KINTANA Nº 2037651
begin
   Result := True;
// Felipe de Oliveira Sol 139681 ktn 864893 - Início
   cdsPlanoPatroxImovel := TCmClientDataSet.Create(nil);
// Felipe de Oliveira Sol 139681 ktn 864893 - Fim
   ParametrosSistema;
   try
      cdsObra := TCMClientDataSet.Create( Self );
//      cdsPlanoPatro := TCmClientDataSet.Create(Self);
      cdsPlanoPatroxImovel.Data := CtrlCafObra.LookupPlanoPatroxImovel(molImovelObra1.iImovel);
      try
         // Associa os cds com a função
         CtrlCafObra.cds := cdsObra;
         CtrlCafObra.cdsCafObraEncerrar := cdsBens;
//         cdsPlanoPatro.Data :=  CtrlCafObra.LookupPlanoPatroxImovel(molImovelObra1.iImovel);

         // Abre o cds da obra a ser passado na função
         cdsObra.Data := CtrlCafObra.ListaCafObra(Sistema.IdEmpresa,
                                                  molImovelObra1.iObra );
         // Abre o cds de bens resultantes vazio a ser passado na função
         sqlBens.Prepare;
         sqlBens.ParamByName('IDCAFOBRA').AsInteger := -1;
         sqlBens.ParamByName('IDPESSOA').AsInteger  := -1;
         sqlBens.Open;

         // Cria o Imovel Mestre novo
         iIdMestreNovo := CAF.CriaImovel(edtNovoImovel.Text,
                                         DBcboTipoImovel.lookupValue,
                                         -1,    {nao possui mestre}
                                         1);   {importa dados}
         if iIdMestreNovo = -1 then raise Exception.create('Erro ao criar o imovel mestre novo');

         // Cria o Imovel novo
         iIdImovelNovo := CAF.CriaImovel(edtNovoImovel.Text,
                                         DBcboTipoImovel.lookupValue,
                                         iIdMestreNovo,
                                         1,                {importa dados}
                                         edtDataInicio.Date,
                                         edtDataEncerra.Date,
                                         (edtTotObra1.Value + fVlrTerreno) );
         if iIdImovelNovo = -1 then raise Exception.create('Erro ao criar o imovel novo');

         // Vando - SOL 154328-5901 / KTN 1373449 - inicio
         CtrlCafObra.GravaPlanoPatroxImovel(molImovelObra1.iImovel, iIdImovelNovo);


         // CADASTRO DE CONJUNTO
         try
            iIdConjunto := LeUltRegistro(nil,'CONJUNTO');
            LimpaParametros(dtmCAF.qryInsConjunto);
            dtmCAF.qryInsConjunto.ParamByName('PIDCONJUNTO').AsInteger    := iIdConjunto;
            dtmCAF.qryInsConjunto.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
            dtmCAF.qryInsConjunto.ParamByName('PIDLOCALIZACAO').AsInteger := molLocalizacao1.iLocalizacao;
            dtmCAF.qryInsConjunto.ParamByName('PIDRESPONSAVEL').AsInteger := molLocalizacao1.iResponsavel;
            dtmCAF.qryInsConjunto.ParamByName('PDESCCONJUNTO').AsString   := edtNovoImovel.Text + ' - ' + edtNovoImovel.Text;
            dtmCAF.qryInsConjunto.ExecSQL;

            // Table RATEIODEPRECIACAO
            LimpaParametros(dtmCAF.qryInsRateioDepreciacao);
            dtmCAF.qryInsRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger    := iIdConjunto;
            dtmCAF.qryInsRateioDepreciacao.ParamByName('PIDEMPRESA').AsInteger     := Sistema.IdEmpresa;
            dtmCAF.qryInsRateioDepreciacao.ParamByName('PCODCENTROCUSTO').AsString := molLocalizacao1.sCodCentroCusto;
            dtmCAF.qryInsRateioDepreciacao.ParamByName('PPARTICIPACAO').AsInteger  := 100;
            dtmCAF.qryInsRateioDepreciacao.ParamByName('PDTAINICIO').AsDateTime    := edtDataEncerra.DateTime;
            dtmCAF.qryInsRateioDepreciacao.ExecSQL;
         except
            raise Exception.create('Erro ao inserir em CONJUNTO');
         end;


         //Helio - SOL Nº 212226 KINTANA Nº 2037651
         //necessario para atualizar a taxa de depreciao
         cdsTaxasDep       := TCMClientDataSet.Create( nil );
         cdsTaxasDep.Data  := CtrlDomBem.ListaBemxDep(Sistema.IdEmpresa, -99);
         //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

         // Efetua o encerramento da obra
         if edtTotObra.Value <> 0 then begin

            // Preenche o CDS de bens
            iSeqPlaca := 0;
            qryGruposContabeis.First;
            if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) then Inc(iSeqPlaca);

            while not qryGruposContabeis.Eof do begin
               if qryGruposContabeisVALOR.AsFloat > 0 then begin

                  cdsBens.Append;
                  cdsBens.FieldByName('IDPESSOA').AsInteger       := Sistema.IdEmpresa;
                  cdsBens.FieldByName('IDMODULO').AsInteger       := Sistema.IdModulo;
                  cdsBens.FieldByName('REGISTRO').AsString        := 'O';
                  cdsBens.FieldByName('CONTROLE').AsString        := 'T';
                  cdsBens.FieldByName('BAIXATOTAL').AsString      := 'N';
                  cdsBens.FieldByName('IDCONJUNTO').AsInteger     := iIdConjunto;
                  cdsBens.FieldByName('DESBEM').AsString          := edtNovoImovel.Text + ' - ' + edtNovoImovel.Text + ' - ' + qryGruposContabeisNOME_BEM.AsString;
                  cdsBens.FieldByName('VALHISTORICO').AsFloat     := qryGruposContabeisVALOR.AsFloat;
                  cdsBens.FieldByName('VALORG').AsFloat           := qryGruposContabeisVALOR.AsFloat;
                  cdsBens.FieldByName('IDGRUPOOBRA').AsInteger    := molImovelObra1.iGrupo;
                  cdsBens.FieldByName('IDGRUPO').AsInteger        := qryGruposContabeisIDGRUPO.AsInteger;
                  cdsBens.FieldByName('CLASSE').AsString          := qryGruposContabeisCLASSE.AsString;
                  cdsBens.FieldByName('TIPO_GRUPO').AsString      := qryGruposContabeisGRUPO_BEM.AsString;
                  cdsBens.FieldByName('NOMEGRUPO').AsString       := qryGruposContabeisNOME.AsString;
                  cdsBens.FieldByName('DTAINCLUSAO').AsDateTime   := edtDataEncerra.Date;
                  cdsBens.FieldByName('DATAINICIODEP').AsDateTime := edtDataEncerra.Date;
                  cdsBens.FieldByName('IDSITUACAO').AsInteger     := StrToInt(DBcboSituacao.LookupValue);
                  cdsBens.FieldByName('IDCLASSEBEM').AsInteger    := molClasseBem1.iClasseBem;
                  cdsBens.FieldByName('PLACA').AsInteger          := CAF.PlacaCaf(qryGruposContabeisIDGRUPO.AsInteger,
                                                                                  iIdImovelNovo,
                                                                                  Sistema.IdEmpresa,
                                                                                  0,
                                                                                  iSeqPlaca);
                  cdsBens.Post;
                  if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao <> 1) then Inc(iSeqPlaca);

                  //Helio - SOL Nº 212226 KINTANA Nº 2037651
                  cdsTaxasDep.EmptyDataSet;
                  cdsTaxasDep.Insert;
                  cdsTaxasDep.FieldByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
                  cdsTaxasDep.FieldByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
                  cdsTaxasDep.FieldByName('IDBEMXDEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;

                  if (cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger > 0) then
                  begin
                     auxVidaUtil := cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger*1.0;

                     auxTaxaDep := CtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorMes(auxVidaUtil);

                     cdsTaxasDep.FieldByName('TAXADEP').AsFloat := auxTaxaDep;
                  end else
                  begin
                     cdsTaxasDep.FieldByName('TAXADEP').AsFloat     := qryGruposContabeisDEPRECIACAO.AsFloat;
                  end;

                  cdsTaxasDep.Post;
                  //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651
               end;

               qryGruposContabeis.Next;
            end;

            { // Vando - SOL 154328-5901 / KTN 1373449 - inicio comentario
            // Felipe de Oliveira Sol 139681 ktn 864893 - Início
            //Cria registros na tabela PLANOPATROXIMOVEL
            cdsPlanoPatroxImovel.First;
            while not cdsPlanoPatroxImovel.Eof do
            begin
              sSql := 'INSERT INTO PLANOPATROXIMOVEL (IDIMOVEL, IDPATRO, IDPLANOPREV, PPIPERCENTRATEIO, FLGTIPO) ' + #13 +
                      'VALUES ( ' +  IntToStr(iIdImovelNovo) + ', ' + #13
                                  + cdsPlanoPatroxImovel.FieldByName('IDPATRO').AsString + ', ' + #13
                                  + cdsPlanoPatroxImovel.FieldByName('IDPLANOPREV').asString + ', ' + #13
                                  + ComunsImobiliario.TrocaVirgPPto(cdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').asString) + ', ' + #13
                                  + QuotedStr(cdsPlanoPatroxImovel.FieldByName('FLGTIPO').asString)+ ')';
              if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                raise Exception.Create('Erro ao atualizar a tabela PLANOPATROXIMOVEL');
              cdsPlanoPatroxImovel.Next;
            end;

            dDataVigencia := Now;
            //Cria registros na tabela PLANOPATROXVIGENCIAIMOB
            cdsPlanoPatroxImovel.First;
            while not cdsPlanoPatroxImovel.Eof do
            begin
              sSql := 'INSERT INTO PLANOPATROXVIGENCIAIMOB (IDPLANOPATROXVIGENCIAIMOB, IDIMOVEL, DATAVIGENCIA, IDPLANOPREV, IDPATRO, PERCENTRATEIO, TRGDTINCLUSAO) ' + #13 +
                      'VALUES ( ' + InttoStr(LeUltRegistro(nil, 'PLANOPATROXVIGENCIAIMOB')) + ', ' + #13
                                  + IntToStr(iIdImovelNovo) + ', ' + #13
                                  + 'TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVigencia))+ ', ''DD/MM/YYYY''), ' + #13 //DateTimeToStr(dDataVigencia))
                                  + cdsPlanoPatroxImovel.FieldByName('IDPLANOPREV').asString + ', ' + #13
                                  + cdsPlanoPatroxImovel.FieldByName('IDPATRO').AsString + ', ' + #13
                                  + QuotedStr(cdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').asString) + ', ' + #13
                                  + 'TO_DATE(' + QuotedStr(DateTimeToStr(dDataVigencia))+ ', ''DD/MM/YYYY HH24:MI:SS''))';
              if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                raise Exception.Create('Erro ao atualizar a tabela PLANOPATROXVIGENCIAIMOB');
              cdsPlanoPatroxImovel.Next;
            end;

            CtrlCafObra.iImovel := molImovelObra1.iImovel;
            // Felipe de Oliveira Sol 139681 ktn 864893 - Fim
            } // Vando - SOL 154328-5901 / KTN 1373449 - fim comentario

            iIdimovel := molImovelObra1.iImovel;//William Moreira da Silva - SOL 258265 PPM 983438

            CtrlCafObra.OpenTransaction := False;

            if not CtrlCafObra.ExecutaEncerramentoObra(Sistema.IdModulo,
                                                       Sistema.IdEmpresa,
                                                       Sistema.IdUsuario,
                                                       molImovelObra1.iObra,
                                                       edtDataEncerra.Date,iIdImovel) then
                raise Exception.create( CtrlCafObra.MessageInfo );

            // Cria o relacionamento na tabela IMOVELXBEM
            cdsBens.First;
            cdsTaxasDep.First; //Helio - SOL Nº 212226 KINTANA Nº 2037651
            while not cdsBens.Eof do begin
               if not cdsBens.FieldByName('IDBEM').IsNull then begin
                  with dtmCAF.qryInsImovelxbem do begin
                     LimpaParametros(dtmCAF.qryInsImovelxbem);
                     ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
                     ParamByName('PIDIMOVEL').AsInteger := iIdImovelNovo;
                     ParamByName('PIDBEM').AsInteger    := cdsBens.FieldByName('IDBEM').AsInteger;
                     ParamByName('PIXBGRUPO').AsString  := cdsBens.FieldByName('TIPO_GRUPO').AsString;
                     ExecSQL;
                  end;

                  // Atualiza o campo BEM.BAIXATOTAL para N
                  sSql := 'UPDATE BEM                '+#13+
                          '   SET BAIXATOTAL = ''N'' '+#13+
                          ' WHERE IDBEM = ' + cdsBens.FieldByName('IDBEM').AsString;
                  if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                     raise Exception.create('Erro ao atualizar o campo Bem.BaixaTotal');

                  //Helio - SOL Nº 212226 KINTANA Nº 2037651
                  // Atualiza taxa de depreciacao
                  if not cdsTaxasDep.Eof then
                  begin
                      sSql := 'UPDATE BEMXDEP                '+#13+
                          '   SET TAXADEP = ' + stringReplace(cdsTaxasDep.FieldByName('TAXADEP').AsString, ',', '.', [rfIgnoreCase, rfReplaceAll])  +#13+
                          ' WHERE IDBEM = ' + cdsBens.FieldByName('IDBEM').AsString +#13+
                          ' AND IDPESSOA = ' + cdsTaxasDep.FieldByName('IDPESSOA').AsString +#13+
                          ' AND MOECODIGO = ' + cdsTaxasDep.FieldByName('MOECODIGO').AsString +#13+
                          ' AND IDBEMXDEP = ' + cdsTaxasDep.FieldByName('IDBEMXDEP').AsString;

                      if not ExecutaQuery(dtmImobiliario.qryAux, sSql) or
                         not CtrlHistoricoVidaUtil.GravaHistoricoVidaUtil(
                                iIdImovelNovo,
                                cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger,
                                (cdsTaxasDep.FieldByName('TAXADEP').AsFloat * 12),
                                cdsTaxasDep.FieldByName('TAXADEP').AsFloat,
                                'Entrada por Encerramento de Obra', False)
                      then
                          raise Exception.create('Erro ao atualizar a depreciação.');
                  end;
                  //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651
               end;
              cdsBens.Next;
              if not cdsTaxasDep.Eof then cdsTaxasDep.Next; //Helio - SOL Nº 212226 KINTANA Nº 2037651
            end;

            // Vando - SOL 154328-5901 / KTN 1373449
            CtrlCafObra.AtualizaSegregacaoLancamentos(cdsBens.FieldByName('IDBEM').AsInteger, edtDataEncerra.DateTime);


{            // Cria o relacionamento na tabela IMOVELXBEM
            cdsBens.First;
            while not cdsBens.Eof do begin
               if not cdsBens.FieldByName('IDBEM').IsNull then begin
                  with dtmCAF.qryInsImovelxbem do begin
                     LimpaParametros(dtmCAF.qryInsImovelxbem);
                     ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
                     ParamByName('PIDIMOVEL').AsInteger := iIdImovelNovo;
                     ParamByName('PIDBEM').AsInteger    := cdsBens.FieldByName('IDBEM').AsInteger;
                     ParamByName('PIXBGRUPO').AsString  := cdsBens.FieldByName('TIPO_GRUPO').AsString;
                     ExecSQL;
                  end;

                  // Atualiza o campo BEM.BAIXATOTAL para N
                  sSql := 'UPDATE BEM                '+#13+
                          '   SET BAIXATOTAL = ''N'' '+#13+
                          ' WHERE IDBEM = ' + cdsBens.FieldByName('IDBEM').AsString;
                  if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                     raise Exception.create('Erro ao atualizar o campo Bem.BaixaTotal');
               end;
              cdsBens.Next;
            end;
               dDataVigencia := Now;
               //Cria registros na tabela PLANOPATROXBEM
                cdsPlanoPatro.First;
                while not cdsPlanoPatro.Eof do
                begin
                  sSql := 'INSERT INTO PLANOPATROXBEM (IDPLANOPREV, IDPATRO, IDBEM, IDPESSOA, PPBPERCRATEIO) ' + #13 +
                          'VALUES (' + cdsPlanoPatro.FieldByName('IDPLANOPREV').asString + ', ' + #13 +
                                       cdsPlanoPatro.FieldByName('IDPATRO').asString + ', ' + #13 +
                                       cdsBens.FieldByName('IDBEM').asString + ', ' + #13 +
                                       IntToStr(Sistema.IdEmpresa) + ', '+ #13 +
                                       ComunsImobiliario.TrocaVirgPPto(cdsPlanoPatro.FieldByName('PPIPERCENTRATEIO').asString )+ ')';
                  if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                    raise Exception.Create('Erro ao atualizar a tabela PLANOPATROXBEM');

                  //Cássio - SOL Nº 139388 KINTANA Nº 855985 - Início
                  //Atualiza tabela HSTPERCSEGREGABEM
                  {sSql := 'INSERT INTO HSTPERCSEGREGABEM(IDHSTPERCSEGREGABEM, IDBEM, DATAVIGENCIA, IDPLANOPREV, IDPATRO, PERCSEGREGABEM, IDPESSOA, STATUS) ' + #13 +
                           'VALUES (' + IntToStr(LeUltRegistro(nil, 'HSTPERCSEGREGABEM')) + ', ' + #13
                                      + cdsBens.FieldByName('IDBEM').asString + ', ' + #13
                                      + 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVigencia)) + ', ''DD/MM/YYYY''), ' + #13 //DateTimeToStr( dDataVigencia))
                                      + cdsPlanoPatro.FieldByName('IDPLANOPREV').asString + ', ' + #13
                                      + cdsPlanoPatro.FieldByName('IDPATRO').asString + ', ' + #13
                                      + QuotedStr(cdsPlanoPatro.FieldByName('PPIPERCENTRATEIO').asString) + ' ,' + #13
                                      + IntToStr(Sistema.IdEmpresa) + ', '+ #13
                                      + QuotedStr('Incluída') + ')';
                  if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                      raise Exception.Create('Erro ao atualizar a tabela HSTPERCSEGREGABEM');

                  sSql := 'INSERT INTO PLANOPATROXVIGENCIABEM(IDPLANOPATROXVIGENCIABEM, IDBEM, DATAVIGENCIA, IDPLANOPREV, IDPATRO, PERCENTRATEIO, IDPESSOA) ' + #13 +
                           'VALUES (' + IntToStr(LeUltRegistro(nil, 'PLANOPATROXVIGENCIABEM')) + ', ' + #13
                                      + cdsBens.FieldByName('IDBEM').asString + ', ' + #13
                                      + 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVigencia)) + ', ''DD/MM/YYYY''), ' + #13 //DateTimeToStr( dDataVigencia))
                                      + cdsPlanoPatro.FieldByName('IDPLANOPREV').asString + ', ' + #13
                                      + cdsPlanoPatro.FieldByName('IDPATRO').asString + ', ' + #13
                                      + QuotedStr(cdsPlanoPatro.FieldByName('PPIPERCENTRATEIO').asString) + ' ,' + #13
                                      + IntToStr(Sistema.IdEmpresa) + ')';
                  if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                      raise Exception.Create('Erro ao atualizar a tabela PLANOPATROXVIGENCIABEM');
                  //Cássio - SOL Nº 139388 KINTANA Nº 855985 - Fim
                  cdsPlanoPatro.Next;
                end;
               cdsBens.Next;
            end;}

            // Busca o ID da movimentação do encerramento da obra
            sSql := 'SELECT IDMOVIMENTACAO          '+#13+
                    '  FROM HISTORICOMOVIMENTACAO   '+#13+
                    ' WHERE IDCAFOBRA = ' + IntToStr(molImovelObra1.iObra);
            if not FazQuery(dtmImobiliario.qryAux, sSql) then
               raise Exception.create('Erro ao buscar as movimentações de Encerramento da Obra');


            // Registra o encerramento na tabela TRANSFBEMIMOVEL para posterior estorno
            if not dtmImobiliario.qryAux.IsEmpty then begin
               try
                  dtmImobiliario.qryAux.First;
                  while not dtmImobiliario.qryAux.Eof do begin
                     with dtmCAF.qryInsTransferencia do begin
                        LimpaParametros(dtmCAF.qryInsTransferencia);
                        ParamByName('PIDMOVIMENTACAO').AsFloat := dtmImobiliario.qryAux.FieldByName('IDMOVIMENTACAO').AsFloat;
                        ParamByName('PIDIMOVELORIG').AsInteger := molImovelObra1.iImovel;
                        ParamByName('PIDIMOVELDEST').AsInteger := iIdImovelNovo;
                        ParamByName('PFLGOPERACAO').AsString   := 'O';
                        ExecSQL;
                     end;
                     dtmImobiliario.qryAux.Next;
                  end;
               except
                  raise Exception.create('Erro ao atualizar as movimentações de Encerramento da Obra');
               end;
            end;

         end else begin
            // Se não houve movimentação, apenas encerra a obra sem criar imóvel ou bem
            sSql := 'UPDATE CAFOBRA     '+#13+
                    '   SET DTAENCERRAOBRA = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',edtDataEncerra.Date)) + ',''DD/MM/YYYY''), '+#13+
                    '       FLGOBRA = 1 '+#13+
                    ' WHERE IDCAFOBRA = ' + IntToStr(molImovelObra1.iObra);
            if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
              raise Exception.create('Erro ao alterar o encerramento da obra');

            //Helio - SOL Nº 212226 KINTANA Nº 2037651
            if not CtrlHistoricoVidaUtil.GravaHistoricoVidaUtilPorCds(molImovelObra1.iImovel, 'Entrada por Encerramento de Obra', False) then
               raise Exception.create('Erro ao atualizar a depreciação.');
            //END Helio - SOL Nº 212226 KINTANA Nº 2037651
         end;
      except
         on E : Exception do begin
            Result := False;
            MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
         end;
      end;
   finally
      FreeAndNil( cdsObra );
// Felipe de Oliveira Sol 139681 ktn 864893 - Início
      FreeAndNil( cdsPlanoPatroxImovel );
// Felipe de Oliveira Sol 139681 ktn 864893 - Fim
   end;
end;


function TfrmExecEncerraObra.TransfereTerreno( const iIdConjunto, iIdImovelNovo: Integer): Boolean;
var fMovGrupo, fMovConj, fMovResp, fMovLocal : Double;
    sSql        : String;
    sTipoImovel : String; // Daniel - 27213
begin
   Result := True;
   Try
      // Transfere apenas o bem TERRENO para o imovel novo
      {if (dtmCAF.qryImovelxBem.RecordCount = 1) and
         (dtmCAF.qryImovelXBemIXBGRUPO.AsString = 'T') then begin}
       if (dtmCAF.qryObraImovelxBem.RecordCount = 1) and
         (dtmCAF.qryObraImovelXBemIXBGRUPO.AsString = 'T') then
       begin

         fMovGrupo := -1;
         fMovConj  := -1;
         fMovResp  := -1;
         fMovLocal := -1;

         // Transfere tudo de uma vez
         //cdsBemTransf.Data   := CtrlDomBem.ListaBem(Sistema.IdEmpresa, dtmCAF.qryImovelXBemIDBEM.AsInteger);
         cdsBemTransf.Data   := CtrlDomBem.ListaBem(Sistema.IdEmpresa, dtmCAF.qryObraImovelXBemIDBEM.AsInteger);
         cdsGrupoTransf.Data := CtrlGrupo.ListaGrupoContab(Sistema.IdEmpresa, dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsInteger);
         cdsConjTransf.Data  := CtrlConjunto.ListaConjunto(Sistema.IdEmpresa,iIdConjunto);
         cdsRespTransf.Data  := CtrlResponsavel.ListaResponsavel(molLocalizacao1.iResponsavel);
         cdsLocalTransf.Data := CtrlLocalizacao.ListaLocalizacao(Sistema.IdEmpresa, molLocalizacao1.iLocalizacao);

         CtrlMovTransfBem.OpenTransaction := False;
         if CtrlMovTransfBem.ExecutaTransferencia( Sistema.IdModulo,
                                                   Sistema.IdEmpresa,
                                                   Sistema.IdUsuario,
                                                   //dtmCAF.qryImovelXBemIDBEM.AsInteger,
                                                    dtmCAF.qryObraImovelXBemIDBEM.AsInteger,
                                                   edtDataEncerra.Date ) < 0 then 
          begin
            // SOL 179583.9461 KTN 1656762  Otacilio ** Inicio **
            //raise Exception.Create( CtrlMovTransfBem.MessageInfo ); // Otacilio
            Result := False;
            Exit;
            // SOL 179583.9461 KTN 1656762  Otacilio ** Fim **
         end else begin
            fMovGrupo := CtrlMovTransfBem.nMovimentacao;
         end;

         // Altera o nome do bem Terreno para compatibilizar com os demais
         sSql := ' UPDATE BEM SET '+
                 ' DESBEM = ' + QuotedStr(edtNovoImovel.Text + ' - ' +
                                          edtNovoImovel.Text + ' - Terreno ') +
                 //' WHERE (IDBEM = '+IntToStr(dtmCAF.qryImovelXBemIDBEM.AsInteger)+')';
                 ' WHERE (IDBEM = '+IntToStr(dtmCAF.qryObraImovelXBemIDBEM.AsInteger)+')';
         Result := ExecutarQuery(dtmImobiliario.qryAux,sSql);
         if Result = False then raise Exception.create('Erro ao atualizar a tabela BEM');

         // Transfere o bem para o imovel novo em IMOVELxBEM
         sSql := ' UPDATE IMOVELXBEM SET '+
                 ' IDIMOVEL = ' + IntToStr(iIdImovelNovo) +
                 //' WHERE (IDBEM    = ' + IntToStr(dtmCAF.qryImovelXBemIDBEM.AsInteger) + ')' +
                 ' WHERE (IDBEM    = ' + IntToStr(dtmCAF.qryObraImovelXBemIDBEM.AsInteger) + ')' +
                 '   AND (IDIMOVEL = ' + IntToStr(molImovelObra1.iImovel) + ')';
         Result := ExecutarQuery(dtmImobiliario.qryAux,sSql);
         if Result = False then raise Exception.create('Erro ao atualizar a tabela IMOVELXBEM');

         // Grava as Transferencias em TRANSFBEMIMOVEL
         try
            with dtmCAF.qryInsTransferencia do begin
               if fMovGrupo > 0 then begin
                  LimpaParametros(dtmCAF.qryInsTransferencia);
                  ParamByName('PIDMOVIMENTACAO').AsFloat   := fMovGrupo;
                  ParamByName('PIDIMOVELORIG').AsInteger   := molImovelObra1.iImovel;
                  ParamByName('PIDIMOVELDEST').AsInteger   := iIdImovelNovo;
                  ParamByName('PFLGOPERACAO').AsString     := 'X';
                  //ParamByName('PCODTIPIMOVELANT').AsString := dtmCAF.qryImovelXBemCODTIPIMOVEL.AsString; // Daniel - 27213
                  ParamByName('PCODTIPIMOVELANT').AsString := dtmCAF.qryObraImovelXBemCODTIPIMOVEL.AsString; // Daniel - 27213
                  ExecSQL;
               end;

               // Busca os id das demais movimentações de transferência
               sSql := 'SELECT IDMOVIMENTACAO FROM HISTORICOMOVIMENTACAO ' +#13+
                       ' WHERE IDTIPOMOVIMENTACAO IN(11,12) '+#13+
                       //'   AND IDBEM = ' + dtmCAF.qryImovelXBemIDBEM.AsString +
                       '   AND IDBEM = ' + dtmCAF.qryObraImovelXBemIDBEM.AsString +
                       '   AND DATAMOVIMENTACAO = TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY',edtDataEncerra.Date)) + ',''DD/MM/YYYY'') ';
               Result := FazQuery(dtmImobiliario.qryAux,sSql);
               while not dtmImobiliario.qryAux.Eof do begin
                  LimpaParametros(dtmCAF.qryInsTransferencia);
                  ParamByName('PIDMOVIMENTACAO').AsFloat   := dtmImobiliario.qryAux.FieldByName('IDMOVIMENTACAO').AsFloat;
                  ParamByName('PIDIMOVELORIG').AsInteger   := molImovelObra1.iImovel;
                  ParamByName('PIDIMOVELDEST').AsInteger   := iIdImovelNovo;
                  ParamByName('PFLGOPERACAO').AsString     := 'X';
                  //ParamByName('PCODTIPIMOVELANT').AsString := dtmCAF.qryImovelXBemCODTIPIMOVEL.AsString; // Daniel - 27213
                  ParamByName('PCODTIPIMOVELANT').AsString := dtmCAF.qryObraImovelXBemCODTIPIMOVEL.AsString;
                  ExecSQL;

                  dtmImobiliario.qryAux.Next;
               end;
            end;
         except
            raise Exception.create('Erro ao atualizar a tabela de TRANSFERENCIA');
         end;

      end;

   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;





function TfrmExecEncerraObra.AlteraImovel(const iIdImovelNovo: Integer): Boolean;
var iEventoIni, iEventoFim : Integer;
    //cdsPlanoPatroxImovel : TCMClientDataSet;
    sSql : string;
begin
  Result := True;
  //cdsPlanoPatroxImovel := TCMClientDataSet.Create(nil);
  //try
  //  cdsPlanoPatroxImovel.Data := CtrlCafObra.LookupPlanoPatroxImovel(molImovelObra1.iImovel);
     try
        // Encerra o imovel anterior que estava em obras
        with dtmCAF.qryUpdStatusImovel do begin
           LimpaParametros (dtmCAF.qryUpdStatusImovel);
           ParamByName ('PIDIMOVEL').AsInteger := molImovelObra1.iImovel;
           ParamByName ('PFLGATIVO').AsInteger := 0;    {inativo}
           ParamByName ('PFLGSTATUS').AsString := 'T';  {Transferido}
           ExecSQL;
        end;

        // Grava o evento de Encerramento da Obra no imóvel anterior
        iEventoIni := EventoImovel.RegistraEvento(molImovelObra1.iImovel, -1,
                                                  Sistema.idUsuario, -1, -1,
                                                  edtDataEncerra.Date, -1,
                                                  'BO', 'Baixa por Encerramento de Obra',
                                                  meObsEvento.Lines.Text, 100,
                                                  0, 0, False);

        // Altera o imovel criado para Ativo - Em Carteira
        EventoImovel.AlteraSituacaoImovel(iIdImovelNovo, 'N');

        // Grava o evento de Criação do novo imóvel
        iEventoFim := EventoImovel.RegistraEvento(iIdImovelNovo, -1,
                                                  Sistema.idUsuario, -1, -1,
                                                  edtDataEncerra.Date, -1,
                                                  'EO', 'Entrada por Encerramento de Obra',
                                                  meObsEvento.Lines.Text, 100,
                                                  0, 0, False);

        // Grava relação Imovel Antigo x Imovel novo em DESMEMBRAIMOVEL
        with dtmCAF.qryInsDesmembraImovel do begin
           LimpaParametros(dtmCAF.qryInsDesmembraImovel);
           ParamByName('PIDIMOVELINI').AsInteger       := molImovelObra1.iImovel;
           ParamByName('PIDIMOVELFIM').AsInteger       := iIdImovelNovo;
           ParamByName('PIDEVENTOIMOVELINI').AsInteger := iEventoIni;
           ParamByName('PIDEVENTOIMOVELFIM').AsInteger := iEventoFim;
           ParamByName('PFLGTIPODESMEMBRA').AsString   := 'O';
           ParamByName('PDMRDATA').AsDateTime          := edtDataEncerra.Date;
           ParamByName('PDMRPERCENT').AsFloat          := 100;
           ExecSQL;
        end;

     except
        Result := False;
     end;
  //finally
  //  FreeAndNil(cdsPlanoPatroxImovel);
  //end;
end;

end.
