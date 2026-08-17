// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Alteração    : FormShow
//Pendência    : SIG 91832
//Responsável  : Andre Imakawa
//Data         : 16/09/2019
//Descrição    : Correção de Inssuficienty Memory nos objetos TwwQuery
//------------------------------------------------------------------------------
//Alteração    : bbtnProcessarClick
//Pendência    : SIG 82723
//Responsável  : Andre Imakawa
//Data         : 27/02/2019
//Descrição    : Alteração do caminho default para gravar o arquivo.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 13/07/2007
// Rotina      : Qry
// Pendência   : 21964 (ReAbertura)
// Descricao   : Novos parametros para o IntBanco.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 31/05/2007
// Rotina      : Qry
// Pendência   : 21964 (ReAbertura)
// Descricao   : Novos parametros para o IntBanco.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 23/10/2006
// Rotina      : ProcessaArquivobanco
// Pendência   : 22675
// Descricao   : Filtrar na qryDadosRec apenas o documento referente a CPF.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/10/2006
// Rotina      : ProcessaArquivobanco
// Pendência   : 23561
// Descricao   : Não fazer quebra de valores por plano. Esta correção visa
//  suportar mais de um plano previdenciario.
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : AlimentaQryDocTxt
//  Pendência  : 21776
//  Data       : 15/03/2006
//  Descricao  : Passar float alternativo de TED para a rotina de geração da
//               CMINTBANCO.
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : bbtnProcessarClick
//  Pendência  : 20586
//  Data       : 28/10/2005
//  Descricao  : Passar para a função UltDiaUtilAnterior da DiasUteis os parâme_
//               tros da fundação.
//------------------------------------------------------------------------------

unit fGeraArquivoRemessa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
  UDiasUteis, MontaSelect, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Usistema, dbasedados, BfDialogs, BrowseFolder, uProcuraDir, UMensErro,
  uCtrlIntBanco, fAguarde, uDatabase, uObjFolha, uConstFolha,
  Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, DBClient, uCMClientDataSet, Provider;

type
  TfrmGeraArquivoRemessa = class(TfrmOkCancelar)
    qryHist: TwwQuery;
    qryPortador1: TwwQuery;
    qryRecebedor: TwwQuery;
    QryDocTxt1: TwwQuery;
    qryPortadorForma: TwwQuery;
    qryDadosRec: TwwQuery;
    updDoc: TUpdateSQL;
    bbtnProcessar: TBitBtn;
    bbtnOutro: TBitBtn;
    msAssistido: TMontaSelect;
    qryDadosAg: TwwQuery;
    pgcComponentes: TPageControl;
    tbsOpcoes: TTabSheet;
    tbsResultado: TTabSheet;
    pnlSelecao: TPanel;
    grpHistorico: TGroupBox;
    dblkfolha: TwwDBLookupCombo;
    grpBanco: TGroupBox;
    grpParticip: TGroupBox;
    Label3: TLabel;
    edNomeAssist: TLabel;
    spbRecebedor: TSpeedButton;
    edMatricula: TEdit;
    edNome: TEdit;
    pnlProcesso: TPanel;
    lbProcessando: TLabel;
    mmResult: TMemo;
    pbarProcesso: TProgressBar;
    pdirdlgPasta: TProcuraDirDlg;
    qryAux: TwwQuery;
    dspPortador: TDataSetProvider;
    cdsPortador: TCMClientDataSet;
    dsPortador: TwwDataSource;
    dbgPortadorForma: TwwDBGrid;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    pnlLblDiretorio: TPanel;
    lblDiretorio: TLabel;
    btnEscolheDir: TBitBtn;
    GroupBox1: TGroupBox;
    edDataFolha: TCMDateTimePicker;
    dspDocTxt: TDataSetProvider;
    cdsDocTxt: TCMClientDataSet;
    procedure dblkfolhaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnProcessarClick(Sender: TObject);
    procedure bbtnOutroClick(Sender: TObject);
    procedure spbRecebedorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEscolheDirClick(Sender: TObject);
    procedure dbgPortadorFormaFieldChanged(Sender: TObject; Field: TField);
  private
    { Private declarations }
    sMesReferencia : string;
    iidRecebedor, iNumRegistro : integer;
    iseqdoctxt : longint;
    procedure AlimentaQryDocTxt;
    function TiraZerosEsquerda(stexto : string) : string;
    procedure MsgErro(sMsg: String);
  public
    { Public declarations }
    fCtrlIntBanco: TCtrlIntBanco;
    sPortadorSel, sclauportador: string;
    procedure ObtemPortador;
    procedure AbrePortador;
    procedure AbreRecebedor;
  end;

implementation

{$R *.DFM}

procedure TfrmGeraArquivoRemessa.FormShow(Sender: TObject);
begin
  inherited;
  qryHist.open;
  AbrePortador;
  //qryRecebedor.prepare;   // Andre Imakawa - SIG 91832
  //qryDadosRec.prepare;    // Andre Imakawa - SIG 91832
  qryPortadorForma.Close;
  qryPortadorForma.Open;
end;

procedure TfrmGeraArquivoRemessa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Canclose:=bbtnSair.enabled;
end;

procedure TfrmGeraArquivoRemessa.dblkfolhaChange(Sender: TObject);
begin
  AbrePortador;
end;

function TfrmGeraArquivoRemessa.TiraZerosEsquerda(stexto : string) : string;
begin
  while copy(sTexto,1,1) = '0' do
    delete(sTexto,1,1);
  result:=sTexto;
end;

procedure TfrmGeraArquivoRemessa.AlimentaQryDocTxt;
 var sLogradouro, sNumero, sComplemento, sBairro,
     sCidade, sCodestado, sCep, sNumdocumento, sNomeRecebedor,
     sMatricula, sContaCorrente, sAgencia, sBanco, sTipoConta, sNomeAgencia : string;
Begin
  sLOGRADOURO := '';
  sNUMERO     := '';
  sCOMPLEMENTO:= '';
  sBAIRRO     := '';
  sCIDADE     := '';
  sCODESTADO  := '';
  sCEP        := '';
  sNumdocumento:='';
  qryDadosRec.Close;
  qryDadosRec.parambyname('IDRESPONSAVEL').asinteger:=
    qryRecebedor.fieldbyname('IDRESPONSAVEL').asinteger;
  qryDadosRec.Open;

  if not qryDadosRec.isempty then
  begin
    sLOGRADOURO    := qryDadosRec.FieldByName('LOGRADOURO').AsString;
    sNUMERO        := qryDadosRec.FieldByName('NUMERO').AsString;
    sCOMPLEMENTO   := qryDadosRec.FieldByName('COMPLEMENTO').AsString;
    sBAIRRO        := qryDadosRec.FieldByName('BAIRRO').AsString;
    sCIDADE        := qryDadosRec.FieldByName('CIDADE').AsString;
    sCODESTADO     := qryDadosRec.FieldByName('CODESTADO').AsString;
    sCEP           := qryDadosRec.FieldByName('CEP').AsString;
    sNumdocumento  := qryDadosRec.FieldByName('NUMDOCUMENTO').AsString;
    while length(sNumdocumento) < 11 do
      sNumdocumento:='0'+sNumDocumento;
    sNomeRecebedor := qryDadosRec.FieldByName('NOME').AsString;
  end
  else
  begin
    mmResult.lines.add('Informações do recebedor '+
                       qryRecebedor.fieldbyname('IDRESPONSAVEL').asstring+
                       ' inexistentes (linha ignorada).');
    exit;
  end;

  qryDadosAg.close;
  qryDadosAg.SQL.clear;
  qryDadosAg.SQL.add('SELECT 1 AS TIPOCONTA, PA.NOME AS NOMEAGENCIA ');
  qryDadosAg.SQL.add('FROM AGENCIABANCARIA AG, BANCO BA, PESSOA PA ');
  qryDadosAg.SQL.add('WHERE AG.NUMAGENCIA = '''+qryRecebedor.fieldbyname('NUMAGENCIA').asstring+'''');
  qryDadosAg.SQL.add('AND BA.NUMBANCO = '''+qryRecebedor.fieldbyname('NUMBANCO').asstring+'''');
  qryDadosAg.SQL.add('AND BA.IDPESSOA = AG.IDBANCO ');
  qryDadosAg.SQL.add('AND PA.IDPESSOA = AG.IDPESSOA ');
  qryDadosAg.Open;

  if not qryDadosAg.isempty then
  begin
    sTipoConta   := qryDadosAg.FieldByName('TIPOCONTA').AsString;
    sNomeAgencia := qryDadosAg.FieldByName('NOMEAGENCIA').AsString;
  end
  else
  begin
    mmResult.lines.add('Informações de banco e agência '+
                       qryRecebedor.fieldbyname('NUMBANCO').asstring+'/'+
                       qryRecebedor.fieldbyname('NUMAGENCIA').asstring+
                       ' inexistentes (linha ignorada).');
    exit;
  end;

  sBanco:=qryRecebedor.FieldByName('NUMBANCO').AsString;
  sAgencia:=qryRecebedor.FieldByName('NUMAGENCIA').AsString;
  while length(sAgencia) < 5 do
    sAgencia:=sAgencia+'&';
  sContaCorrente:=qryRecebedor.FieldByName('CONTACORRENTE').AsString;
  try
    inc(iseqdoctxt);
    cdsDocTxt.Insert;
    cdsDocTxt.FieldByName('CONTALIQUIDO').AsString:='';
    cdsDocTxt.FieldByName('IDPESSOA').AsInteger:=
      qryRecebedor.fieldbyname('IDRESPONSAVEL').asinteger;
    if trim(sNomeRecebedor) <> '' then
      cdsDocTxt.FieldByName('NOME').AsString:=sNomeRecebedor;
    if trim(sNomeRecebedor) <> '' then
      cdsDocTxt.FieldByName('RAZAOSOCIAL').AsString:=sNomeRecebedor;
    if trim(sNumdocumento) <> '' then
      cdsDocTxt.FieldByName('NUMDOCUMENTO').AsString:=sNumdocumento;
    if trim(sContaCorrente) <> '' then
      cdsDocTxt.FieldByName('CONTACORRENTE').AsString:=sContaCorrente;
    if trim(sBanco) <> '' then
      cdsDocTxt.FieldByName('CODBANCOFAVORECIDO').AsString:=sBanco;
    if trim(sAgencia) <> '' then
      cdsDocTxt.FieldByName('NUMAGENCIA').AsString:=sAgencia;
    cdsDocTxt.FieldByName('IDFORCLI').AsInteger:=
      qryRecebedor.fieldbyname('IDRESPONSAVEL').asinteger;
    if trim(sTipoConta) <> '' then
      cdsDocTxt.FieldByname('TIPOCONTA').AsString:=sTipoConta;
    if trim(sNomeAgencia) <> '' then
      cdsDocTxt.FieldByName('NOMEAGENCIA').AsString:=sNomeAgencia;
    if trim(sLOGRADOURO) <> '' then
      cdsDocTxt.FieldByName('LOGRADOURO').AsString:=sLOGRADOURO;
    if trim(sNUMERO) <> '' then
      cdsDocTxt.FieldByName('NUMERO').AsString:=sNUMERO;
    if trim(sCOMPLEMENTO) <> '' then
      cdsDocTxt.FieldByName('COMPLEMENTO').AsString:=sCOMPLEMENTO;
    if trim(sBAIRRO) <> '' then
      cdsDocTxt.FieldByName('BAIRRO').AsString:=sBAIRRO;
    if trim(sCIDADE) <> '' then
      cdsDocTxt.FieldByName('CIDADE').AsString:=sCIDADE;
    if trim(sCODESTADO) <> '' then
      cdsDocTxt.FieldByName('CODESTADO').AsString:=sCODESTADO;
    if trim(sCEP) <> '' then
      cdsDocTxt.FieldByName('CEP').AsString:=sCEP;
    sMatricula:=qryRecebedor.fieldbyname('MATRICULA').asstring;
    if sMatricula = '' then
    begin
      if FazQuery(qryAux, 'SELECT MATRICULA FROM ELEGPATRO WHERE IDPESSOA = '+
                  qryRecebedor.fieldbyname('IDTITULAR').asstring) then
        sMatricula:=qryAux.fieldbyname('MATRICULA').asstring;
    end;
    cdsDocTxt.FieldByName('CODDOCUMENTO').asstring:=sMatricula; // Identificador para retorno.
    cdsDocTxt.FieldByName('VALOR').AsFloat:=
      qryRecebedor.fieldbyname('VALORPROVENTO').asfloat;
    cdsDocTxt.FieldByName('VALORDESCONTO').AsFloat:= 0;
    cdsDocTxt.FieldByName('VALORJUROS').AsFloat:= 0;
    cdsDocTxt.FieldByName('DATAVENCTO').AsString:=edDataFolha.Text;
    cdsDocTxt.FieldByName('DATAPROGRAMADA').AsString:=edDataFolha.Text;
    cdsDocTxt.FieldByName('TIPOMOEDA').AsInteger:= 0;
    cdsDocTxt.FieldByName('NUMLOTE').AsInteger:= 0;
    cdsDocTxt.FieldByName('CODPORTFORMA').AsInteger:=
      cdsPortador.fieldbyname('CODPORTFORMA').asinteger;
    cdsDocTxt.FieldByName('CODPORTADOR').AsInteger:=
      cdsPortador.fieldbyname('CODPORTFORMA').asinteger;
    cdsDocTxt.FieldByName('CODFORMAPAGTO').AsInteger:=
      qryPortadorForma.FieldByName('CODFORMAPAGTO').AsInteger;
    cdsDocTxt.FieldByName('CODTIPOPAGTO').AsInteger:=
      qryPortadorForma.FieldByName('CODTIPOPAGTO').AsInteger;
    cdsDocTxt.FieldByName('FLGEMITEAVISO').AsString:=
      qryPortadorForma.FieldByName('FLGEMITEAVISO').AsString;
    cdsDocTxt.FieldByName('CODARQUIVOREMESSA').AsInteger:=
      qryPortadorForma.FieldByName('CODARQUIVOREMESSA').AsInteger;
    cdsDocTxt.FieldByName('IDBANCO').AsInteger:=
      qryPortadorForma.FieldByName('IDBANCO').AsInteger;  //Portador Forma
    cdsDocTxt.FieldByName('NOCONTACORR').AsString:=
      qryPortadorForma.FieldByName('NOCONTACORR').AsString;
    //USAR FLOAT ALTERNATIVO DE TED
    cdsDocTxt.FieldByName('DMAISALT').asinteger:=
      qryPortadorForma.FieldByName('DMAISALT').asinteger;
    cdsDocTxt.FieldByName('CODFORMAPGTOALT').asinteger:=
      qryPortadorForma.FieldByName('CODFORMAPGTOALT').asinteger;
    cdsDocTxt.FieldByName('VALORMAXIMO').asfloat:=
      qryPortadorForma.FieldByName('VALORMAXIMO').asfloat;
    cdsDocTxt.FieldByName('CODBARRA').AsString:='';
    cdsDocTxt.FieldByName('CODBARRAVALOR').AsString:='';
    cdsDocTxt.FieldByName('NODOCUMENTO').asstring:=
                  qryRecebedor.fieldbyname('IDTITULAR').asstring+'-'+
                  qryRecebedor.fieldbyname('IDRESPONSAVEL').asstring+'-';
    cdsDocTxt.FieldByName('COMPLDOCUMENTO').AsString:=
      Copy(sMesReferencia,6,2);  // Codigo que aparece no relatorio
    cdsDocTxt.FieldByName('TIPO').AsString:='F';
    cdsDocTxt.FieldByName('NUMEMPRESABANCO').AsString:=
      qryPortadorForma.FieldByName('NUMEMPRESABANCO').AsString;
    cdsDocTxt.FieldByName('DEBCRE').AsString:='';
    cdsDocTxt.FieldByName('LIVRE').AsString:=
      copy(inttostr(qryRecebedor.fieldbyname('IDRESPONSAVEL').asinteger)+
           inttostr(iseqdoctxt),1,25);
    cdsDocTxt.Post;
    inc(iNumRegistro);
  except
    mmResult.lines.add('Problema na geração da informação de pagamento do recebedor '+
                       qryRecebedor.fieldbyname('IDRESPONSAVEL').asstring+
                       ' (linha ignorada).')
  end;
end;

procedure TfrmGeraArquivoRemessa.bbtnProcessarClick(Sender: TObject);
 var sPathArquivoRem : string;
     iCodArquivoRemessa, iControleRemessa : integer;
     ddatafloat : tdatetime;
     lii : integer;
begin
  if (Trim(dblkfolha.Text) = '') then
  begin
    MsgDlg('Preencha o Histórico da Folha de Benefício','Erro',mtError,[mbOk,mbHelp],0);
    pgcComponentes.activepage:=tbsOpcoes;
    dblkfolha.SetFocus;
    Exit;
  end;

  ObtemPortador;
  if (sPortadorSel = '') then
  begin
    MsgDlg('Preencha o(s) Contas Caixa x Forma de Pagamento desejados',
      'Erro', mtError, [mbOk,mbHelp], 0);
    pgcComponentes.activepage:=tbsOpcoes;
    dbgPortadorForma.SetFocus;
    Exit;
  end;

  if (Trim(edDataFolha.Text) = '') then
  begin
    MsgDlg('Preencha a Data de previsão de pagamento','Erro',mtError,[mbOk,mbHelp],0);
    pgcComponentes.activepage:=tbsOpcoes;
    edDataFolha.SetFocus;
    Exit;
  end;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Geração de arquivo bancário.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  If not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;

  cdsPortador.disablecontrols;
  cdsPortador.first;
  while not cdsPortador.eof do
  begin
    if (cdsPortador.fieldbyname('SEL').asinteger = 1) then
    begin
      try
        try
          sMesReferencia:=qryHist.fieldbyname('MESREFERENCIA').asstring;

          pgcComponentes.activepage:=tbsResultado;
          lbProcessando.visible:=true;
          pbarProcesso.visible:=true;
          bbtnProcessar.enabled:=false;
          bbtnSair.enabled:=false;
          iNumRegistro:=0;
          pbarProcesso.Position:=pbarProcesso.Min;
          self.update;

          mmResult.setfocus;
          mmResult.Lines.Add('---------------------------------------------------------------');
          mmResult.Lines.Add('Início da geração: '+
            formatdatetime('dd/mm/yyyy hh:nn:ss', now));
          mmResult.Lines.Add('  Histórico da Folha de Benefício : '+
            qryHist.fieldbyname('HISTORICO').asstring);
          mmResult.Lines.Add('  Contas Caixa x Forma de Pagamento : '+
            cdsPortador.fieldbyname('DESCRICAO').asstring);
          if not SistemaFolha.FlgAgrupaArqDocAlt then
            mmResult.Lines.Add('  Documento : '+
              cdsPortador.fieldbyname('CODDOCUMENTO').asstring);
          application.processmessages;

          cdsDocTxt.Close;
          cdsDocTxt.Open;

          qryPortadorForma.Locate('CODPORTFORMA',
            cdsPortador.fieldbyname('CODPORTFORMA').asinteger,[]);
          iCodArquivoRemessa:=
            qryPortadorForma.FieldByName('CodArquivoRemessa').AsInteger;
          iControleRemessa:=
            qryPortadorForma.FieldByName('ControleRemessa').AsInteger;

          AbreRecebedor;

          pbarProcesso.Max:=qryRecebedor.recordcount;
          iseqdoctxt:=0;
          while not qryRecebedor.eof do
          begin
            if pbarProcesso.Position mod 100 = 0 then
              application.processmessages;
            AlimentaQryDocTxt;
            qryRecebedor.next;
            pbarProcesso.Position:=pbarProcesso.Position+1;
          end;

          fCtrlIntBanco:=TCtrlIntBanco.Create;
          fCtrlIntBanco.Initialize(DtmBaseDados.DbBaseDados, True,
            Sistema.ConnectionType, Sistema.ConnectionSide,
            Sistema.AppRemoteServer, True, MsgErro );

          fCtrlIntBanco.FechaQryTexto:=true;

          if qryPortadorForma.FieldByName('PATHARQUIVOREM').isnull or
             (qryPortadorForma.FieldByName('PATHARQUIVOREM').asstring = '') then
            //sPathArquivoRem:='C:\'                                             // Andre Imakawa - SIG 82723
            sPathArquivoRem := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) // Andre Imakawa - SIG 82723
          else
            sPathArquivoRem:=qryPortadorForma.FieldByName('PATHARQUIVOREM').asstring;

          cdsDocTxt.First;
          fCtrlIntBanco.IndiceDoBanco:=iCodArquivoRemessa;
          if fCtrlIntBanco.VerficaDadosEmpresa('P',
               cdsPortador.FieldByName('CodPortForma').AsInteger) then
            if fCtrlIntBanco.ValidaRemessa('P', cdsDocTxt.data, false) then
            begin
              FrmAguarde.Apaga;
              fCtrlIntBanco.ExibeArquivoGerado:=false;

              ddatafloat := StrToDate(edDataFolha.Text);

              fCtrlIntBanco.iFloatExterno    := cdsPortador.FieldByName('DFLOATPAGTO').AsInteger;
              fCtrlIntBanco.iFloatExternoAlt := cdsPortador.FieldByName('DFLOATPAGTOALTER').AsInteger;

              fCtrlIntBanco.IdentficaOrigem:='18';

              fCtrlIntBanco.MontaPagamentoEletronico(iCodArquivoRemessa,
                iControleRemessa, cdsDocTxt.data, sPathArquivoRem);
            end
            else
            begin
              mmResult.Lines.Add('Erro na geração do arquivo de remessa.');
              mmResult.Lines.Add('');
            end;
          FrmAguarde.Apaga;
        except
          On E:Exception Do
          Begin
            MsgDlg('Erro no processo de geração do Arquivo de Remessa de Pagamento',
                   'Erro',mtError,[mbOk,mbHelp],0);
            mmResult.Lines.Add('Erro: ' + E.Message);

          end;
        end;
      finally
        mmResult.Lines.Add('Término da geração: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
        mmResult.Lines.Add('---------------------------------------------------------------');
        mmResult.Lines.Add('');
      end;
    end;
    cdsPortador.next;
  end;
  cdsPortador.enablecontrols;

  fCtrlIntBanco.Free;
  bbtnSair.enabled:=true;
  lbProcessando.visible:=false;
  pbarProcesso.visible:=false;
  bbtnOutro.visible:=true;
  bbtnProcessar.enabled:=true;
  bbtnProcessar.visible:=false;
  dblkfolha.text:='';
  edDataFolha.text:='';
  AbrePortador;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure TfrmGeraArquivoRemessa.bbtnOutroClick(Sender: TObject);
begin
  bbtnProcessar.visible:=true;
  bbtnOutro.visible:=false;
  pgcComponentes.activepage:=tbsOpcoes;
end;

procedure TfrmGeraArquivoRemessa.spbRecebedorClick(Sender: TObject);
begin
  inherited;
  if dblkfolha.text = '' Then Exit;
  msAssistido.filtro.clear;
  msAssistido.filtro.add('HISTRUBSAL.IDHSTFOLHABENEF = '+
    qryHist.fieldbyname('IDHSTFOLHABENEF').asstring);
  msAssistido.filtro.add('HISTRUBSAL.CODPORTFORMA = '+
    cdsPortador.fieldbyname('CODPORTFORMA').asstring);
  msAssistido.filtro.add('HISTRUBSAL.IDTITULAR = ELEGPATRO.IDPESSOA');
  msAssistido.filtro.add('HISTRUBSAL.IDTITULAR = ELEGPATRO.IDPESSOA');
  msAssistido.filtro.add('ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA');
  msAssistido.filtro.add('ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA');
  msAssistido.filtro.add('ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR');
  msAssistido.Executar;
  if msAssistido.RetornouValor Then
  Begin
    iidRecebedor:=StrtoInt(msAssistido.ValoresChave[0]);
    edMatricula.Text:=msAssistido.ValoresChave[1];
    edNome.Text:=msAssistido.ValoresChave[2];
  end;
end;

procedure TfrmGeraArquivoRemessa.FormCreate(Sender: TObject);
begin
  inherited;
  pgcComponentes.activepage:=tbsOpcoes;
end;

procedure TfrmGeraArquivoRemessa.btnEscolheDirClick(Sender: TObject);
begin
  inherited;
  pdirdlgPasta.Directory:=lblDiretorio.caption;
  if pdirdlgPasta.Execute then
    lblDiretorio.caption:=pdirdlgPasta.Directory;
end;

procedure TfrmGeraArquivoRemessa.AbrePortador;
var ssql: string;
begin
  if SistemaFolha.FlgAgrupaArqDocAlt then
  begin
    ssql:=
      'SELECT 0 AS SEL, HFB.MESREFERENCIA AS MESCOBRANCA, '+_clinefeed+
      '       HCAP.IDHSTFOLHABENEF, '+_clinefeed+
      '       HCAP.CODPORTFORMA, '+_clinefeed+
      '       SUM(HCAP.VALORDOC) AS VALORDOC, '+_clinefeed+
      '       HCAP.DFLOATPAGTO, '+_clinefeed+
      '       HCAP.DFLOATPAGTOALTER, '                                      + _clinefeed + 
      '       P.DESCRICAO '+_clinefeed+
      'FROM HSTFOLHABENEF HFB, '+_clinefeed+
      '     HSTFOLHABENEFCAP HCAP, '+_clinefeed+
      '     PORTADORFORMA P '+_clinefeed+
      'WHERE HFB.IDHSTFOLHABENEF = '+
        inttostr(qryHist.fieldbyname('IDHSTFOLHABENEF').asinteger)+' '+_clinefeed+
      'AND HFB.IDHSTFOLHABENEF = HCAP.IDHSTFOLHABENEF '+_clinefeed+
      'AND HCAP.CODPORTFORMA = P.CODPORTFORMA '+_clinefeed+
      'AND HCAP.TIPOPORTADOR = ''A'' '+_clinefeed;

    if dblkfolha.text = '' then
      ssql:=ssql+
        'AND (1 = 2) '+_clinefeed;

    ssql:=ssql+
      'GROUP BY HFB.MESREFERENCIA, '+_clinefeed+
      '         HCAP.IDHSTFOLHABENEF, '+_clinefeed+
      '         HCAP.CODPORTFORMA, '+_clinefeed+
      '         HCAP.DFLOATPAGTO, '+_clinefeed+
      '         HCAP.DFLOATPAGTOALTER, '                                    + _clinefeed +  
      '         P.DESCRICAO '+_clinefeed+
      'ORDER BY P.DESCRICAO '+_clinefeed;
  end
  else
  begin
    ssql:=
      'SELECT DISTINCT 0 AS SEL, HFB.MESREFERENCIA AS MESCOBRANCA, '+_clinefeed+
      '       HCAP.IDHSTFOLHABENEF, '+_clinefeed+
      '       HCAP.CODPORTFORMA, '+_clinefeed+
      '       HCAP.CODDOCUMENTO, '+_clinefeed+
      '       HCAP.VALORDOC, '+_clinefeed+
      '       HCAP.DFLOATPAGTO, '+_clinefeed+
      '       HCAP.DFLOATPAGTOALTER, '                                      + _clinefeed +  
      '       P.DESCRICAO '+_clinefeed+
      'FROM HSTFOLHABENEF HFB, '+_clinefeed+
      '     HSTFOLHABENEFCAP HCAP, '+_clinefeed+
      '     PORTADORFORMA P '+_clinefeed+
      'WHERE HFB.IDHSTFOLHABENEF = '+
        inttostr(qryHist.fieldbyname('IDHSTFOLHABENEF').asinteger)+' '+_clinefeed+
      'AND HFB.IDHSTFOLHABENEF = HCAP.IDHSTFOLHABENEF '+_clinefeed+
      'AND HCAP.CODPORTFORMA = P.CODPORTFORMA '+_clinefeed+
      'AND HCAP.TIPOPORTADOR = ''A'' '+_clinefeed;

    if dblkfolha.text = '' then
      ssql:=ssql+
        'AND (1 = 2) '+_clinefeed;

    ssql:=ssql+
      'ORDER BY P.DESCRICAO '+_clinefeed;
  end;

  cdsPortador.close;
  qryPortador1.sql.clear;
  qryPortador1.sql.add(ssql);
  cdsPortador.open;

  dbgPortadorForma.enabled:=cdsPortador.recordcount > 0;
  dbgPortadorForma.selected.clear;
  dbgPortadorForma.Selected.add('SEL'#9'7'#9'Seleção'#9'F');
  dbgPortadorForma.Selected.add('CODPORTFORMA'#9'8'#9'Código'#9'F');

  If not SistemaFolha.FlgAgrupaArqDocAlt Then
  begin
    dbgPortadorForma.Selected.add('DESCRICAO'#9'36'#9'Descrição'#9'F');
    dbgPortadorForma.Selected.add('CODDOCUMENTO'#9'10'#9'Documento'#9'F');
    dbgPortadorForma.selected.add('VALORDOC'#9'11'#9'Valor'#9'F');
  end
  else
  begin
    dbgPortadorForma.Selected.add('DESCRICAO'#9'46'#9'Descrição'#9'F');
    dbgPortadorForma.selected.add('VALORDOC'#9'11'#9'Valor'#9'F');
  end;

  dbgPortadorForma.RedrawGrid;
end;

procedure TfrmGeraArquivoRemessa.AbreRecebedor;
var ssql: string;
begin
  ssql:=
    'SELECT G.IDPESSJUR, G.IDTITULAR, G.IDRESPONSAVEL, '+_clinefeed+
    '       G.NOME, G.NUMDOCUMENTO, G.NUMBANCO, G.NUMAGENCIA, '+_clinefeed+
    '       G.CONTACORRENTE, G.VALORPROVENTO, G.MATRICULA '+_clinefeed+
    'FROM ( '+_clinefeed+
    'SELECT HS.IDPESSJUR, HS.IDTITULAR, '+_clinefeed+
    '       HS.IDRESPONSAVEL, P.NOME, P.NUMDOCUMENTO, '+_clinefeed+
    '       HS.NUMBANCO, HS.NUMAGENCIA, HS.CONTACORRENTE, D.MATRICULA, '+_clinefeed+
    '       SUM(DECODE(PR.FLGDESCONTO,0, '+_clinefeed+
    '                  DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO,0), '+_clinefeed+
    '                  DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO*-1,0))) VALORPROVENTO '+_clinefeed+
    'FROM HISTRUBSAL HS, PROVDESC PR, PESSOA P, DEPENTIT D '+_clinefeed+
    'WHERE (HS.IDHSTFOLHABENEF = '+
      inttostr(qryHist.fieldbyname('IDHSTFOLHABENEF').asinteger)+') '+_clinefeed+
    'AND (HS.CODPORTFORMA = '+
      inttostr(cdsPortador.fieldbyname('CODPORTFORMA').asinteger)+') '+_clinefeed;

  if not SistemaFolha.FlgAgrupaArqDocAlt then
    ssql:=ssql+
      'AND (HS.CODDOCUMENTO = '+inttostr(
        cdsPortador.fieldbyname('CODDOCUMENTO').asinteger)+') '+_clinefeed;

  if (edMatricula.text <> '') then
    ssql:=ssql+
      'AND (HS.IDRESPONSAVEL = '+inttostr(iidRecebedor)+') '+_clinefeed; 

  ssql:=ssql+
    'AND (HS.IDTITULAR = D.IDTITULAR(+)) '+_clinefeed+
    'AND (HS.IDRESPONSAVEL = D.IDPESSOA(+)) '+_clinefeed+
    'AND (NVL(HS.FLGESTORNO,0) = 0) '+_clinefeed+
    'AND (PR.IDPROVENTO = HS.IDRUBRICA) '+_clinefeed+
    'AND (PR.FLGESPECIAL = 0) '+_clinefeed+
    'AND (HS.IDRESPONSAVEL = P.IDPESSOA) '+_clinefeed+
    'GROUP BY HS.IDPESSJUR, HS.IDTITULAR, P.NOME, '+_clinefeed+
    '         D.MATRICULA, HS.IDRESPONSAVEL, '+_clinefeed+
    '         HS.NUMBANCO, HS.NUMAGENCIA, HS.CONTACORRENTE, P.NUMDOCUMENTO '+_clinefeed+
    ') G '+_clinefeed+
    'WHERE G.VALORPROVENTO >= 0.01 '+_clinefeed+
    'ORDER BY G.NOME, G.IDPESSJUR, G.IDTITULAR, G.IDRESPONSAVEL '+_clinefeed;

  qryRecebedor.close;
  qryRecebedor.sql.clear;
  qryRecebedor.sql.add(ssql);
  qryRecebedor.open;
end;

procedure TfrmGeraArquivoRemessa.ObtemPortador;
var iquant: integer;
    lcodportforma: integer;
begin
  sPortadorSel:='';
  iquant:=0;
  lcodportforma:=cdsPortador.fieldbyname('CODPORTFORMA').asinteger;
  cdsPortador.disablecontrols;
  cdsPortador.first;
  while not cdsPortador.eof do
  begin
    if (cdsPortador.fieldbyname('SEL').asinteger = 1) then
    begin
      inc(iquant);
      sPortadorSel:=sPortadorSel+inttostr(cdsPortador.fieldbyname('CODPORTFORMA').asinteger)+',';
    end;
    cdsPortador.next;
  end;
  cdsPortador.locate('CODPORTFORMA', vararrayof([lcodportforma]), []);
  cdsPortador.enablecontrols;
  if sPortadorSel <> '' then
  begin
    delete(sPortadorSel,length(sPortadorSel),1);
    if iquant = 1 then
      sclauportador:=' = '+sportadorsel
    else
      sclauportador:=' IN ('+sportadorsel+') ';
  end;
end;

procedure TfrmGeraArquivoRemessa.dbgPortadorFormaFieldChanged(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Field = cdsPortador.fieldbyname('SEL') then
  begin
    ObtemPortador;
  end;
end;

procedure TfrmGeraArquivoRemessa.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FGERAARQUIVOREMESSA                                                    |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   PROCESSA A GERAÇÃO DOS ARQUIVOS BANCÁRIOS PARA VERSÕES DA FOLHA JÁ EFETI-  |
| VADAS. FILTRO POR PORTADOR FORMA.                                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/02/2002 A 18/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12c                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - FILTRAR PAGAMENTOS MAIORES DO QUE 0 AO GERAR ARQUIVO TEXTO PARA BANCO.     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/02/2002 A 26/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12d                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCOU-SE O FILTRO DE PAGAMENTOS ZERADOS NA QRYRECEBEDOR. ALTEROU-SE O    |
| ORDER BY PARA APENAS O NOME.                                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/08/2002 A 22/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSAO DA COLUNA CODPORTADOR NA QUERY QRYDOCTXT COM O MESMO VALOR DA     |
| COLUNA CODPORTFORMA.                                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/10/2002 A 08/10/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - IDENTIFICA ORIGEM PARA O OBJETO DE BANCO COMO FOLHA DE BENEFÍCIOS.         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/06/2003 A 04/06/2003                         |
| PENDÊNCIA: 14016                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05c                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| ADAPTAÇÃO PARA NÃO UTILIZAR BANCOPORTFORMA. CRIA PASTA PARA RESULTADO.       |
| ALTERAÇÃO NA PROCURA DE PASTA PARA GRAVAÇÃO DOS ARQUIVOS                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/08/2003 A 06/08/2003                         |
| PENDÊNCIA: 14782                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAR IDTITULAR NO CAMPO NODOCUMENTO DO ARQUIVO ELETRONICO.              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/08/2004 A 27/08/2004                         |
| PENDÊNCIA: 17496                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| PERMITIR A SELEÇÃO DE VÁRIOS PORTADORES DE PAGAMENTO AO MESMO TEMPO.         |
| USAR CTRLINTBANCO EM 3 CAMADAS AO INVÉS DA IEACM.                            |
| INCLUSÃO DO CDSPORTADOR. CONTROLE DE GERAÇÃO DO ARQUIVO PELO CDSPORTADOR.    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uString pela   |
| uBiblioteca.                                                                 |
|                                                                              |
|------------------------------------------------------------------------------}
