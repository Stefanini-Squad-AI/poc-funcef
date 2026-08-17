unit fTratamentoConvenio;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Responsável: Everson Luiz Pereira da Cunha
//  Pendência  : SIG TIBERO
//  Data       : 23/02/2018
//  Descricao  : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//               Retirada de INDEX, +rule etc.
//               Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------
//  Autor      : Luiz Carlos
//  Rotina     : bbtnConfirmarClick
//  Pendência  : SIG58556
//  Data       : 22/11/2017
//  Descricao  : Ajuste no campo de plano contabil para segregacao contabil
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : bbtnConfirmarClick
//  Pendência  : 21136 (Reabertura)
//  Data       : 10/04/2007
//  Descricao  : Corrige o erro no fechamento de convênio referente a folha de abono
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Ajuste em querys
// Data      : 15/01/2007
// Pendencia : 18554
// Alteração : Tratar o campo SITENVIO como CHAR, colocando plics quando
//   necessário.
//-----------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 13/11/2006
// Rotina      : bbtnConfirmarClick
// Pendência   : 21559
// Descricao   : Gravar o campo IdSeqInternoFB na inclusão de registros na
//   RUBRICAINDIV e na Tmpdesc.
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : bbtnConfirmarClick
//  Pendência  : 21136
//  Data       : 14/19/2006
//  Descricao  : Corrige o erro no fechamento de convênio referente a folha de abono
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : Controle geração de documentos financeiros e Parametrização
//  Pendência  : 22073
//  Data       : 12/04/2006 a 02/05/2006
//  Descricao  : Tratar convênios com rubrica livre, ou seja o layout fixa
//               posição do código. A rubrica normal e de devolução não são
//               pré-definidas. Tratar também parametrização das rubricas,
//               quando existe variação entre planos.
// OBS.: A pendencia 18472 ficou resolvida junto com esta 22073.
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : Várias que lançam documento
//  Pendência  : 20827
//  Data       : 28/11/2005
//  Descricao  : Lançar UNIDNEGOC na CCBAIXASXDOCUM. Quando a UNIDNEGOC não é
//               necessária usar o valor padrão ao invés de -1.
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : RecuperaInformacoes
//  Pendência  : 20586
//  Data       : 28/10/2005
//  Descricao  : Passar para a função UltDiaUtilAnterior da DiasUteis os parâme_
//               tros da fundação.
//------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, fcTreeView, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Spin, fcButton, fcImgBtn, fcShapeBtn,
  Db, DBTables, Wwquery, Udatabase, DBaseDados, fcdbtreeview, Wwdatsrc,
  UModulo, UMensErro, uIntegraBack, DBClient, USistema,
  uCtrlDocumento, uCtrlPadroes, uCtrlImpostoRetido,
  Provider, UObjFolha, uAdmPrevFB, ULancContab, uString, wwdbdatetimepicker,
  CMDateTimePicker, Mask, wwdbedit, Wwdotdot, Wwdbcomb, uConstFolha;

type tCAPConvenio = class
     private
       idfavorecido  : integer;
       idrubnormal   : integer;
       idrubdevol    : integer;
       trataresiduo  : Integer;
       GeraCAP       : Integer;
       GeraCAR       : Integer;
       iPortFormaCAP : Integer;
       iPortFormaCAR : Integer;
       iNatureza     : Integer;
       datapagto     : tdatetime;
       splaconta     : string;
       dvalorpgimp   : double;
       dvalordvimp   : double;
       dvalorliqimp  : double;
       dvalorpgproc  : double;
       dvalordvproc  : double;
       dvalorliqproc : double;
       dvalorpghist  : double;
       dvalordvhist  : double;
       dvalorliqhist : double;
       FFlgGeraDOC: boolean;
       FFlgRubricaLivre: boolean;
       FFlgMultiplaConta: boolean;
       FPlacontaTemp: string;
       procedure SetFlgGeraDOC(const Value: boolean);
       procedure SetFlgMultiplaConta(const Value: boolean);
       procedure SetFlgRubricaLivre(const Value: boolean);
       procedure SetPlacontaTemp(const Value: string);
     public
       icoddocumento : integer;
       lstRubEmDoc: tstringlist; 
       constructor Create(aidfavorecido, aidrubnormal, aidrubdevol,
         atrataresiduo, ageracap,ageracar, aPortFormaCAP, aPortFormaCAR, aNatureza: integer;
         adatapagto: tdatetime; asplaconta: string;
         advalorpgimp, advalordvimp, advalorpgproc, advalordvproc: double;
         abFlgRubricaLivre: boolean 
         );
       procedure AdicionaValor(advalorpgimp, advalordvimp,
         advalorpgproc, advalordvproc: double);
       property FlgGeraDOC: boolean read FFlgGeraDOC write SetFlgGeraDOC; 
       property FlgRubricaLivre: boolean read FFlgRubricaLivre write SetFlgRubricaLivre; 
       property FlgMultiplaConta: boolean read FFlgMultiplaConta write SetFlgMultiplaConta; 
       property PlacontaTemp: string read FPlacontaTemp write SetPlacontaTemp; 
       destructor Destroy; override; 
       function RetornaListaRubrica: string; 
     end;

type tCAPConvenio_Continuado = class
     private
       idfavorecido  : integer;
       idrubrica     : integer;
       trataresiduo  : Integer;
       GeraCAP       : Integer;
       GeraCAR       : Integer;
       iPortFormaCAP : Integer;
       iPortFormaCAR : Integer;
       iNatureza     : Integer;
       datapagto     : tdatetime;
       splaconta     : string;
       caracnatureza : String;
       dvalorpgimp   : double;
       dvalordvimp   : double;
       dvalorliqimp  : double;
       dvalorpgproc  : double;
       dvalordvproc  : double;
       dvalorliqproc : double;
       dvalorpghist  : double;
       dvalordvhist  : double;
       dvalorliqhist : double;
     public
         icoddocumento : integer;
       constructor Create(aidfavorecido, aidrubrica, atrataresiduo,
         ageracap,ageracar, aPortFormaCAP, aPortFormaCAR, aNatureza: integer;
         adatapagto: tdatetime; asplaconta, acaracnatureza: string;
         advalorpgimp, advalordvimp, advalorpgproc, advalordvproc: double);
       procedure AdicionaValor_Continuado(advalorpgimp, advalordvimp,
         advalorpgproc, advalordvproc: double);
     end;

type tListaCAPConvenio = class(tstringlist)
     public
       destructor Destroy; override;
       function VerificaLista(aidfavorecido, aidrubnormal, aidrubdevol,
         atrataresiduo,aGeracap,ageracar,aPortFormaCAP, aPortFormaCAR, aNatureza: integer;
         adatapagto: tdatetime; asplaconta: string; advalorpgimp, advalordvimp,
         advalorpgproc, advalordvproc: double;
         abFlgRubricaLivre: boolean; 
         aiflgdesconto: integer //usada apenas quando for rubrica livre
         ): integer;
       procedure Limpa;
     end;

type tListaCAPConvenio_Continuado = class(tstringlist)
     public
       destructor Destroy; override;
       function VerificaLista_Continuado(aidfavorecido, aidrubrica,atrataresiduo,
         aGeracap,aGeracar,aPortFormaCAP, aPortFormaCAR, aNatureza: integer;
         adatapagto: tdatetime; asplaconta,acaracNatureza: string; advalorpgimp, advalordvimp,
         advalorpgproc, advalordvproc: double): integer;
       procedure Limpa_Continuado;
     end;

type
  TfrmTratamentoConvenio = class(TfrmOkCancelar)
    fctvInformacoes: TfcTreeView;
    qryAux: TwwQuery;
    sdFile: TSaveDialog;
    qryAux1: TwwQuery;
    pnlParametros: TPanel;
    fcbtnRecupera: TfcShapeBtn;
    fcbtnSalvar: TfcShapeBtn;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    fcbtnExpande: TfcShapeBtn;
    fcbtnComprime: TfcShapeBtn;
    qryConvLote: TwwQuery;
    updConvLote: TUpdateSQL;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    lblContabil: TLabel;
    lblfinanc: TLabel;
    qryAux2: TwwQuery;
    qryLote: TwwQuery;
    qryTmpDesc: TwwQuery;
    qryRubricaXPlano: TwwQuery;
    qryAux3: TwwQuery;
    qryaux4: TwwQuery;
    qryconvlote2: TwwQuery;
    UpdConvLote2: TUpdateSQL;
    qryAux5: TwwQuery;
    memResult: TMemo;
    qryPlano: TwwQuery;
    gboxDataPagamento: TGroupBox;
    dtpDtPagamento: TCMDateTimePicker;
    gboxIndicaAbono: TGroupBox;
    cbboxAbono: TwwDBComboBox;
    gboxDataLancamento: TGroupBox;
    dtpDtLancamento: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure fcbtnRecuperaClick(Sender: TObject);
    procedure fcbtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fcbtnExpandeClick(Sender: TObject);
    procedure fcbtnComprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure VerificaAbono(Sender: TObject);
  private
    { Private declarations }
    iidlotetmpdesc: Integer;
    iidloterubricaindiv: Integer;
    listaCAPConvenio: tListaCAPConvenio;
    listaCAPConvenio_Continuado: tListaCAPConvenio_Continuado;
    lListaAuxiliar:TStringList;
    lFaltaParametro: Boolean;
    iPlano,
    iPortFormaFav: Integer;
    iPortFormaFavRec: Integer;
    jahMostrouP,jahMostrouR: Boolean;
    ctrlDocumento: tctrlDocumento; //SUBSTITUI ROTINAS DE LANÇAMENTO DE DOCUMENTOS DE 2 PARA 3 CAMADAS.
    ctrlImpostoRetido: tctrlImpostoRetido;

    gsmesabono: string; 

    procedure RecuperaInformacoes(
      asMes: string;
      asMesAbono: string;
      aiOpcaoBusca: integer
      );
    function VerificaPlanoConta(asconta: string; aiplanoconta: integer): boolean;

    Function GravaLote(numLote, idlayout: longint; sMesref: String; Valtotal: Real ; RegTotal: longint; arqdescricao: String): Boolean;
    procedure InsereContabil(qry: twwquery; var ssql: string);
    function VerificaContabil(iIdPessjur,iIdRubrica,iIdPlanoprev: Integer): Boolean;

    function PegaCodDocumento(ListaCAP: tstringlist;
      aidfavorecido, aidrubrica: integer): integer; 
  public
    { Public declarations }
  end;

var
  frmTratamentoConvenio: TfrmTratamentoConvenio;

implementation

{$R *.DFM}

constructor tCAPConvenio.Create(aidfavorecido, aidrubnormal, aidrubdevol,
  atrataresiduo, ageracap,ageracar, aPortFormaCAP, aPortFormaCAR, aNatureza: integer;
  adatapagto: tdatetime; asplaconta: string; advalorpgimp, advalordvimp,
  advalorpgproc, advalordvproc: double;
  abFlgRubricaLivre: boolean 
  );
begin
  idfavorecido:=aidfavorecido;
  idrubnormal:=aidrubnormal;
  idrubdevol:=aidrubdevol;
  trataresiduo:=atrataresiduo;
  geracap:=ageracap;
  geracar:=ageracar;
  iPortFormaCAP:=aPortFormaCAP;
  iPortFormaCAR:=aPortFormaCAR;
  iNatureza:=aNatureza;
  datapagto:=adatapagto;
  splaconta:=asplaconta;
  dvalorpgimp:=advalorpgimp;
  dvalorpgproc:=advalorpgproc;
  dvalordvimp:=advalordvimp;
  dvalordvproc:=advalordvproc;
  dvalorliqimp:=advalorpgimp-advalordvimp;
  dvalorliqproc:=advalorpgproc-advalordvproc;
  FlgGeraDOC:=false; 
  lstRubEmDoc:=tstringlist.create; 
  FlgRubricaLivre:=abFlgRubricaLivre; 
end;


destructor tCAPConvenio.Destroy;
begin
  lstRubEmDoc:=tstringlist.create;
  inherited;
end;

constructor tCAPConvenio_Continuado.Create(aidfavorecido, aidrubrica,
  atrataresiduo, ageracap,ageracar, aPortFormaCAP, aPortFormaCAR, aNatureza: integer;
  adatapagto: tdatetime; asplaconta,acaracnatureza: string; advalorpgimp, advalordvimp,
  advalorpgproc, advalordvproc: double);
begin
  idfavorecido:=aidfavorecido;
  idrubrica:=aidrubrica;
  datapagto:=adatapagto;
  splaconta:=asplaconta;
  caracnatureza:=acaracnatureza;
  trataresiduo:=atrataresiduo;
  geracap:=ageracap;
  geracar:=ageracar;
  iPortFormaCAP:=aPortFormaCAP;
  iPortFormaCAR:=aPortFormaCAR;
  iNatureza:=aNatureza;
  dvalorpgimp:=advalorpgimp;
  dvalorpgproc:=advalorpgproc;
  dvalordvimp:=advalordvimp;
  dvalordvproc:=advalordvproc;
  dvalorliqimp:=advalorpgimp-advalordvimp;
  dvalorliqproc:=advalorpgproc-advalordvproc;
end;

procedure tCAPConvenio.AdicionaValor(advalorpgimp, advalordvimp, advalorpgproc,
  advalordvproc: double);
begin
  dvalorpgimp:=dvalorpgimp+advalorpgimp;
  dvalorpgproc:=dvalorpgproc+advalorpgproc;
  dvalordvimp:=dvalordvimp+advalordvimp;
  dvalordvproc:=dvalordvproc+advalordvproc;
  dvalorliqimp:=dvalorpgimp-dvalordvimp;
  dvalorliqproc:=dvalorpgproc-dvalordvproc;
end;

procedure tCAPConvenio_Continuado.AdicionaValor_Continuado(advalorpgimp, advalordvimp, advalorpgproc,
  advalordvproc: double);
begin
  dvalorpgimp:=dvalorpgimp+advalorpgimp;
  dvalorpgproc:=dvalorpgproc+advalorpgproc;
  dvalordvimp:=dvalordvimp+advalordvimp;
  dvalordvproc:=dvalordvproc+advalordvproc;
  dvalorliqimp:=dvalorpgimp-dvalordvimp;
  dvalorliqproc:=dvalorpgproc-dvalordvproc;
end;

procedure tListaCAPConvenio.Limpa;
 var lii: longint;
begin
  for lii:=0 to count-1 do
    objects[lii].free;
  self.clear;
end;

procedure tListaCAPConvenio_Continuado.Limpa_Continuado;
 var lii: longint;
begin
  for lii:=0 to count-1 do
    objects[lii].free;
  self.clear;
end;

destructor tListaCAPConvenio.Destroy;
begin
  Limpa;
  inherited;
end;

destructor tListaCAPConvenio_Continuado.Destroy;
begin
  Limpa_Continuado;
  inherited;
end;

function tListaCAPConvenio.VerificaLista(aidfavorecido, aidrubnormal,
  aidrubdevol, atrataresiduo, aGeracap, ageracar, aPortFormaCAP,
  aportformacar, aNatureza: integer;
  adatapagto: tdatetime; asplaconta: string;
  advalorpgimp, advalordvimp, advalorpgproc, advalordvproc: double;
  abFlgRubricaLivre: boolean; 
  aiflgdesconto: integer //usada apenas quando for rubrica livre
  ): integer;
var lii, lindex: longint;
    objCAPConvenio: tCAPConvenio;
    bachou: boolean;
begin
  bachou:=false;
  for lii:=0 to count-1 do
  begin
    objCAPConvenio:=(objects[lii] as tCAPConvenio);
    
    if abFlgRubricaLivre then
    begin
      if (objCAPConvenio.idfavorecido = aidfavorecido) and
         (objCAPConvenio.datapagto = adatapagto) then
      begin
        bachou:=true;
        lindex:=lii;
        break;
      end;
    end
    else
    begin
    
      if (objCAPConvenio.idfavorecido = aidfavorecido) and
         (objCAPConvenio.idrubnormal = aidrubnormal) and
         (objCAPConvenio.idrubdevol = aidrubdevol) and
         (objCAPConvenio.datapagto = adatapagto) and
         (objCAPConvenio.splaconta = asplaconta) then
      begin
        bachou:=true;
        lindex:=lii;
        break;
      end;
    end;
  end;

  //VERIFICA NOS CASOS DE RUBRICA LIVRE SE É DEVOLUÇÃO
  if abFlgRubricaLivre and (aidrubdevol = 0) and (aiflgdesconto = 0) then
  begin
    advalordvimp:=advalorpgimp;
    advalorpgimp:=0;
    advalordvproc:=advalorpgproc;
    advalorpgproc:=0;
  end;

  if not bachou then
  begin
    objCAPConvenio:=tCAPConvenio.Create(aidfavorecido, aidrubnormal,
      aidrubdevol, atrataresiduo, ageracap, ageracar, aPortFormaCAP,
      aPortFormaCar, aNatureza, adatapagto,
      asplaconta, advalorpgimp, advalordvimp, advalorpgproc, advalordvproc,
      abFlgRubricaLivre 
      );
    addobject('', objCAPConvenio);
    lindex:=count-1;
  end
  else
  begin
    objCAPConvenio:=(objects[lindex] as tCAPConvenio);
    objCAPConvenio.AdicionaValor(advalorpgimp, advalordvimp,
      advalorpgproc, advalordvproc);
  end;

  //VERIFICA NOS CASOS DE RUBRICA LIVRE SE É DEVOLUÇÃO
  if abFlgRubricaLivre then
  begin
    if objCAPConvenio.lstRubEmDoc.indexof(inttostr(aidrubnormal)) < 0 then
    begin
      objCAPConvenio.FlgGeraDOC:=true;
      objCAPConvenio.lstRubEmDoc.add(inttostr(aidrubnormal));
    end;
  end;
  result:=lindex;
end;

function tListaCAPConvenio_Continuado.VerificaLista_Continuado(aidfavorecido,
  aidrubrica, atrataresiduo, ageracap,ageracar, aPortFormaCAP,
  aPortFormaCAR, aNatureza: integer;
  adatapagto: tdatetime; asplaconta, acaracnatureza: string;
  advalorpgimp, advalordvimp, advalorpgproc, advalordvproc: double): integer;
var lii, lindex: longint;
    objCAPConvenio_Continuado: tCAPConvenio_Continuado;
    bachou: boolean;
begin
  bachou:=false;
  try
    for lii:=0 to count-1 do
    begin
      objCAPConvenio_Continuado:=(objects[lii] as tCAPConvenio_Continuado);
      if (objCAPConvenio_Continuado.idfavorecido = aidfavorecido) and
         (objCAPConvenio_Continuado.idrubrica = aidrubrica) and
         (objCAPConvenio_Continuado.caracnatureza=aCaracNatureza) and
         (objCAPConvenio_Continuado.datapagto = adatapagto) and
         (objCAPConvenio_Continuado.splaconta = asplaconta) then
      begin
        bachou:=true;
        lindex:=lii;
        break;
      end;
    end;
  except
    raise
  end;
  if not bachou then
  begin
    objCAPConvenio_Continuado:=tCAPConvenio_Continuado.Create(aidfavorecido,
      aidrubrica, atrataresiduo, aGeracap, ageracar, aPortFormaCAP,
      aPortFormaCAR, aNatureza, adatapagto,
      asplaconta, acaracnatureza, advalorpgimp, advalordvimp,
      advalorpgproc, advalordvproc);
    addobject('', objCAPConvenio_Continuado);
    lindex:=count-1;
  end
  else
  begin
    objCAPConvenio_Continuado:=(objects[lindex] as tCAPConvenio_Continuado);
    objCAPConvenio_Continuado.AdicionaValor_Continuado(advalorpgimp,
      advalordvimp, advalorpgproc, advalordvproc);
  end;
  result:=lindex;
end;

procedure TfrmTratamentoConvenio.FormCreate(Sender: TObject);
 var d,m,a: word;
begin
  inherited;
  ctrlDocumento:=tctrlDocumento.create;
  ctrlDocumento.InitializeAs(Padroes);
  ctrlImpostoRetido:=tctrlImpostoRetido.create;
  ctrlImpostoRetido.InitializeAs(Padroes);

  DecodeDate(date, a, m, d);
  if (m >= 1) and (m <= 12) then
  begin
    cmbMes.ItemIndex:=m-1;
    cmbMes.Text:=cmbMes.Items[cmbMes.ItemIndex];
    spnedAno.Text:=IntToStr(a);
  end;

  VerificaAbono(sender); 

  listaCAPConvenio:=tListaCAPConvenio.create;
  listaCAPConvenio_Continuado:=tListaCAPConvenio_Continuado.create;
  lListaAuxiliar:=tstringlist.create;
end;

procedure TfrmTratamentoConvenio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  listaCAPConvenio.free;
  listaCAPConvenio_continuado.free;
  ctrlDocumento.Free; 
  ctrlImpostoRetido.free; 
end;

procedure TfrmTratamentoConvenio.fcbtnRecuperaClick(Sender: TObject);
 var smes: string;
     lssql: string;
begin
  inherited;
  llistaAuxiliar.clear;
  lFaltaParametro:= false;
  memresult.lines.clear;
  jaHMostrouP:= false;
  jaHMostrouR:= false;
  if cmbMes.ItemIndex <= 8 then
    sMes:=spnedAno.Text+'/0'+IntToStr(cmbMes.ItemIndex+1)
  else
    sMes:=spnedAno.Text+'/'+IntToStr(cmbMes.ItemIndex+1);

  
  gsmesabono:=spnedAno.Text+'/13';

  if cbboxAbono.enabled and (cbboxAbono.itemindex = 2) then
    lssql:=
      'select descricao '+
      'from processoconvenio '+
      'where mes = '+QuotedStr(gsmesabono)
  else
    lssql:=
      'select descricao '+
      'from processoconvenio '+
      'where mes = '+QuotedStr(sMes);

  if FazQuery(qryAux, lssql) then
    MsgDlg('O Pagamento dos Convênios para este mês já foi processado. '+
      'Verifique as informações na tela de Consulta de Pagamento de Convênios.',
      'Informação', mtWarning, [mbOk,mbHelp], 0)
  else
  begin
    RecuperaInformacoes(
      sMes,
      gsmesabono,
      cbboxAbono.itemindex
      );
    bbtnConfirmar.enabled:= not lfaltaparametro;
  end;
end;

procedure TfrmTratamentoConvenio.RecuperaInformacoes(
  asMes: string;
  asMesAbono: string;
  aiOpcaoBusca: integer
  );
 var nconv, ndoc, nr, nv, n1, node: tfcTreeNode;
     nTeste:  tfcTreeNode;
     indoc, idia, imes, iano, imax, lii, lij, lnivel0, nTipo: integer;
     liindex: integer;
     //para rubrica normal
     timp_n, tnproc_n, tprocint_n, tprocexcesso_n: integer;
     vimp_n, vnproc_n, vproc_n, vexcesso_n: double;
     //para rubrica devolucao
     timp_d, tnproc_d, tprocint_d, tprocexcesso_d: integer;
     vimp_d, vnproc_d, vproc_d, vexcesso_d: double;
     ssql, splacontanorm, splacontadev,cChave: string;
     dtpagto: tdatetime;
     objCAPConvenio: tCAPConvenio;
     objCAPConvenio_Continuado: tCAPConvenio_Continuado;
     vrubpagar, vrubdevolver: double;

     lProcAvulso, lProcContinuado, lprocContinuado2: Boolean;
     nPosicao: Integer;

     lbFlgRubricaLivre: boolean; 

  procedure PegaDadosRubrica(idrub, idlote, idfav: integer;
    var timp, tnproc, tprocint, tprocexcesso: integer;
    var vimp, vnproc, vproc, vexcesso: double);
    var  v1, vr1, v2, vr2: double;
    var sMes: String;
  begin
    v1:=0; vr1:=0; v2:=0; vr2:=0;

    if cmbMes.ItemIndex <= 8 then
      sMes:=spnedAno.Text+'/0'+IntToStr(cmbMes.ItemIndex+1)
    else
      sMes:=spnedAno.Text+'/'+IntToStr(cmbMes.ItemIndex+1);

    If lprocAvulso then
    begin
      if FazQuery(qryAux1, 'select count(*) as total, sum(valor) as valor, '+
                                  'sum(valorrecebido) as valorrec, sitenvio '+
                           'from tmpdesc '+
                           'where idlote = '+inttostr(idlote)+' '+
                           'and mescobranca = '+QuotedStr(sMes)+' '+ 
                           'and idprovento = '+inttostr(idrub)+' '+
                           'and idfavorecido = '+inttostr(idfav)+' '+
                           'and flgtipodesc = ''C'' '+
                           'and flgdescfolha = ''B'' '+
                           'group by sitenvio') then
      begin
        while not qryAux1.eof do
        begin
          if (qryAux1.fieldbyname('sitenvio').asstring = '0') then
          begin
            tnproc:=qryAux1.fieldbyname('total').asinteger;
            vnproc:=qryAux1.fieldbyname('valor').asfloat;
          end;
          if (qryAux1.fieldbyname('sitenvio').asstring = '1') then
          begin
            tprocexcesso:=qryAux1.fieldbyname('total').asinteger;
            v1:=qryAux1.fieldbyname('valor').asfloat;
            vr1:=qryAux1.fieldbyname('valorrec').asfloat;
          end;
          if (qryAux1.fieldbyname('sitenvio').asstring = '2') then
          begin
            tprocint:=qryAux1.fieldbyname('total').asinteger;
            v2:=qryAux1.fieldbyname('valor').asfloat;
            vr2:=qryAux1.fieldbyname('valorrec').asfloat;
          end;
          qryAux1.next;
        end;
        timp:=tnproc+tprocexcesso+tprocint;
        vimp:=vnproc+v1+v2;
        vproc:=vr1+vr2;
        vexcesso:=v1+v2-vr1-vr2;
      end;
    end;

    If lprocContinuado then
    begin
      if FazQuery(qryAux1, 'select count(*) as total, sum(h.valorprovento) as valor, '+
                                  'sum(h.valorrecebido) as valorrec '+
                           'from histrubsal h, rubricaindiv ri '+
                           'where h.mescobranca = '+QuotedStr(sMes)+' '+
                           'and h.idrubrica = '+inttostr(idrub)+' '+
                           'and h.idfavorecido = '+inttostr(idfav)+' '+
                           'and h.idmodulo = 18 '+
                           'and h.idhstfolhabenef is not null '+
                           'and (h.flgestorno = 0 or h.flgestorno is null) '+
                           'and ri.idfavorecido = h.idfavorecido '+
                           'and ri.idlote = '+inttostr(idlote)+' '+
                           'and ri.idrubrica = h.idrubrica '+
                           'and ri.idtitular = h.idtitular '+
                           'and ri.idpessoa = h.idpessoa '+
                           'and ri.anomesref = h.mescobranca ') then
      begin
        If not qryAux1.eof then
        begin
          vproc   :=qryAux1.fieldbyname('valor').asfloat;
          vexcesso:=(qryAux1.fieldbyname('valor').asfloat-
            qryAux1.fieldbyname('valorrec').asfloat);
          tprocint:= qryAux1.fieldbyname('total').asInteger;
        end;
      end;

      if FazQuery(qryAux2, 'select count(*) as total, sum(ri.valorrubrica) as valor '+
                           'from rubricaindiv ri '+
                           'where ri.anomesref = '+QuotedStr(sMes)+' '+
                           'and ri.idlote = '+inttostr(idlote)+' '+
                           'and ri.idrubrica = '+inttostr(idrub)+' '+
                           'and ri.idfavorecido = '+inttostr(idfav)) then
      begin
        If not qryAux2.eof then
        begin
          timp:= qryAux2.fieldbyname('total').asInteger;
          vimp:= qryAux2.fieldbyname('valor').asFloat;
          vnproc:=vimp-vproc;
          tnproc:=timp-tprocint;
        end;
      end;
    end;

    If lprocContinuado2 then
    begin
      if FazQuery(qryAux1, 'select count(*) as total, sum(h.valorprovento) as valor, '+
                                  'sum(h.valorrecebido) as valorrec '+
                           'from histrubsal h '+
                           'where h.mescobranca = '+QuotedStr(sMes)+' '+
                           'and h.idrubrica = '+inttostr(idrub)+' '+
                           'and h.idfavorecido = '+inttostr(idfav)+' '+
                           'and h.idmodulo = 18 '+
                           'and h.idhstfolhabenef is not null '+
                           'and (h.flgestorno = 0 or h.flgestorno is null) ') then
      begin
        If not qryAux1.eof then
        begin
          vproc   :=qryAux1.fieldbyname('valor').asfloat;
          vexcesso:=(qryAux1.fieldbyname('valor').asfloat-
            qryAux1.fieldbyname('valorrec').asfloat);
          tprocint:= qryAux1.fieldbyname('total').asInteger;
        end;
      end;
      timp := 0;
      vimp := 0;
      vnproc:= 0;
      tnproc:= 0;
    end;
  end;

  procedure PegaContaContabil(pidrubrica: integer; var psplaconta: string);
  Var sSql: String;
  begin
    if FazQuery(qryAux1, 'select distinct r.placontac, r.placontad, p.flgdesconto '+
                         'from rubricaxplano r, provdesc p '+
                         'where r.idrubrica = '+inttostr(pidrubrica)+' '+
                         'and r.idrubrica = p.idprovento ') then
    begin
      if qryAux1.fieldbyname('flgdesconto').asinteger = 0 then
        psplaconta:=qryAux1.fieldbyname('placontad').asstring
      else
        psplaconta:=qryAux1.fieldbyname('placontac').asstring;
    end;
  end;

  Function VerificaParametros(pidrubrica: integer): Boolean;
  var sConta, sCodCCusto: String;
  begin
    result:= true;
    If Sistemafolha.FLGINTEGRACONTABIL = 1 then
    begin
      // Verifica se existem contas contabeis diferentes para uma mesma rubrica
      // ou se a conta está ausente.
      if FazQuery(qryAux1, 'select distinct r.placontac, r.placontad, p.flgdesconto, '+
                           ' r.CODCENTROCUSTOD, r.CODCENTROCUSTOC ' +
                           'from rubricaxplano r, provdesc p '+
                           'where r.idrubrica = '+inttostr(pidrubrica)+' '+
                           'and r.idrubrica = p.idprovento ') then
      begin
        while not qryAux1.eof do
        begin
          If ((trim(qryAux1.fieldbyname('placontad').asstring) = '') and
             (trim(qryAux1.fieldbyname('placontac').asstring) = '')) then
          begin
            memresult.lines.add('Erro. A rubrica '+inttostr(pidrubrica)+
              ' não possui conta contábil parametrizada. ');
            result:= false;
          end
          else
          begin
            If qryAux1.fieldbyname('flgdesconto').asInteger = 0 {D} then
            begin
              sConta    := qryAux1.fieldbyname('placontad').asstring;
              sCodCCusto:= qryAux1.fieldbyname('CODCENTROCUSTOD').asstring;
            end
            else {C}
            begin
              sConta    := qryAux1.fieldbyname('placontac').asstring;
              sCodCCusto:= qryAux1.fieldbyname('CODCENTROCUSTOC').asstring;
            end;

            if not VerificaPlanoConta(sConta, iplano) then
            begin
              memresult.lines.add(
                'Erro: A conta contábil '+sConta+' da rubrica '+
                inttostr(pidrubrica)+
                ' não pertence ao plano contábil corrente ');
              result:= false;
            end
            else
            begin
              if qryPlano.fieldbyname('plainativa').asstring = 'I' then
              begin
                memresult.lines.add(
                  'Erro: A conta contábil '+sConta+' da rubrica '+
                  inttostr(pidrubrica)+
                  ' está inativa ');
                result:= false;
              end
              else
              begin
                if qryPlano.fieldbyname('platipo').asstring = 'S' then
                begin
                  memresult.lines.add(
                    'Erro: A conta contábil '+sConta+' da rubrica '+
                    inttostr(pidrubrica)+
                    ' é uma conta sintética ');
                  result:= false;
                end
                else
                begin
                  if qryPlano.fieldbyname('placcust').asstring = 'S' then
                  begin
                    if sCodCCusto = '' then
                    begin
                      memresult.lines.add(
                        'Erro: A conta contábil '+sConta+' da rubrica '+
                        inttostr(pidrubrica)+
                        ' obriga Centro de custo. ');
                      result:= false;
                    end;
                  end;
                end;
              end;
            end;
          end;
        //fazer a verificação para todas as linhas buscadas da rubricaxplano
          qryAux1.next;
        end;
      end
      else
      begin
        memresult.lines.add('Erro. A rubrica '+inttostr(pidrubrica)+
          ' não foi encontrada na tabela RUBRICAXPLANO. ');
        result:= false;
      end;
    end;  // contabil
    If Sistemafolha.FLGINTEGRAFINANC = 1 then
    begin
      // Contas a Pagar
      If SistemaFolha.TIPDOCCONVP = 0 then
      begin
        If not JahMostrouP then
        begin
          memresult.lines.add('Erro. O Tipo do Documento Padrão para '+
            'Pagamento de Convênio não está definido nos Parâmetros Globais');
          jahMostrouP:= true;
        end;
        result:= false;
      end;
      if FazQuery(qryAux1,'select distinct r.codtiprecdesfav, p.flgdesconto, '+
                          'nvl(r.unidnegoc,0) as unidnegoc, r.codtiprecdes, R.CODCENTRORESPON '+
                          'from rubricaxplano r, provdesc p '+
                          'where r.idrubrica = '+inttostr(pidrubrica)+' '+
                          'and r.idrubrica = p.idprovento ') then
      begin
        If FazQuery(qryAux2,'select usacrespon,usaabc '+
                            'from paramglobal ') then
        begin
          If trim(qryaux2.fieldbyname('USACRESPON').asstring) = 'S' then
          begin
            If trim(qryAux1.fieldbyname('CODCENTRORESPON').asstring) = '' then
            begin
              memresult.lines.add('Erro. A rubrica '+inttostr(pidrubrica)+
                ' não está com o código do tipo do '+
                'Centro de Responsabilidade parametrizado .');
              result:= false;
            end;
          end;
          If trim(qryaux2.fieldbyname('USAABC').asString) = 'S' then
          begin
            If qryAux1.fieldbyname('UNIDNEGOC').Value <= 0 then
            begin
              memresult.lines.add('Erro. A rubrica '+inttostr(pidrubrica)+
                ' não está com o código de Atividade/Projeto parametrizado.');
              result:= false;
            end;
          end;
        end
        else
        begin
          memresult.lines.add('Erro. A tabela PARAMGLOBAL  não foi encontrada.');
          result:= false;
        end;

        If trim(qryaux1.fieldbyname('CODTIPRECDESFAV').asstring) = '' then
        begin
          memresult.lines.add('Erro. A rubrica '+inttostr(pidrubrica)+
            ' não está com o código do tipo de recebimento/desembolso '+
            'parametrizado para o Favorecido.');
          result:= false;
        end;
        If trim(qryaux1.fieldbyname('CODTIPRECDES').asstring) = '' then
        begin
          memresult.lines.add('Erro. A rubrica '+inttostr(pidrubrica)+
            ' não está com o código do tipo de '+
            'recebimento/desembolso parametrizado.');
          result:= false;
        end;
      end
      else
      begin
        memresult.lines.add('Erro. A rubrica '+inttostr(pidrubrica)+
          ' não foi encontrada na tabela RUBRICAXPLANO. ');
        result:= false;
      end;
      // Contas a Receber
      If SistemaFolha.TIPDOCCONVR = 0 then
      begin
        If not JahMostrouR then
        begin
          memresult.lines.add('Erro. O Tipo do Documento Padrão para '+
            'Recebimento de Convênio não está definido nos Parâmetros Globais');
          jahMostrouR:= true;
        end;
        result:= false;
      end;
      if not FazQuery(qryAux1,'select distinct r.CODTIPRECDESCAR, r.CODTIPRECDESFAVCAR '+
                              'from rubricaxplano r, provdesc p '+
                              'where r.idrubrica = '+inttostr(pidrubrica)+' '+
                              'and r.idrubrica = p.idprovento ') then
      begin
        memresult.lines.add('Erro. A rubrica '+inttostr(pidrubrica)+
          ' não foi encontrada na tabela RUBRICAXPLANO. ');
        result:= false;
      end;
    end; // financeiro
  end; // principal

begin
  fctvInformacoes.Items.clear;
  listaCAPConvenio.Limpa;

  lProcAvulso     := false;
  lProcContinuado := false;
  lproccontinuado2:= false;

  qryConvLote.close;
  qryConvLote.open;

  qryConvLote2.close;
  qryConvLote2.open;

  
  case aiopcaobusca of
  0: begin {com abono}
       ssql:=
         'select distinct t.idfavorecido, p.nome '+
         'from ctrlinterface c, tmpdesc t, pessoa p '+
         'where c.mesreferencia = '+QuotedStr(asMes)+' '+
         'and c.idreferencia is not null '+
         'and c.tipo = ''B'' '+
         'and t.idlote = c.idlote '+
         'and t.mescobranca = c.mesreferencia '+ 
         'and t.idfavorecido = p.idpessoa ';
     end;
  1: begin {sem abono}
       ssql:=
         'select distinct t.idfavorecido, p.nome '+
         'from ctrlinterface c, tmpdesc t, pessoa p '+
         'where c.mesreferencia = '+QuotedStr(asMes)+' '+
         'and c.idreferencia is not null '+
         'and c.tipo = ''B'' '+
         'and t.idlote = c.idlote '+
         'and t.mescobranca = c.mesreferencia '+ 
         'and t.mesreferencia <> '+quotedstr(asMesAbono)+' '+
         'and t.idfavorecido = p.idpessoa ';
     end;
  2: begin {apenas abono}
       ssql:=
         'select distinct t.idfavorecido, p.nome '+
         'from ctrlinterface c, tmpdesc t, pessoa p '+
         'where c.mesreferencia = '+QuotedStr(asMes)+' '+
         'and c.idreferencia is not null '+
         'and c.tipo = ''B'' '+
         'and t.idlote = c.idlote '+
         'and t.mescobranca = c.mesreferencia '+ 
         'and t.mesreferencia = '+quotedstr(asMesAbono)+' '+
         'and t.idfavorecido = p.idpessoa ';
     end;
  end;

  //Verifica favorecidos de convênios avulsos
  if FazQuery(qryAux, ssql) then
  begin
    while not qryAux.eof do
    begin
      node:=fctvInformacoes.Items.Insert(nil,qryAux.fieldbyname('nome').asstring);
      node.StringData:=inttostr(qryAux.fieldbyname('idfavorecido').asinteger)+'-0';
      llistaAuxiliar.add(inttostr(qryAux.fieldbyname('idfavorecido').asinteger)+'-0');
      qryAux.next;
    end;
  end;

  //Verifica favorecidos de convênios permanentes
  if FazQuery(qryAux5,
       'select distinct r.idfavorecido, p.nome '+
       'from ctrlinterface c, rubricaindiv r, pessoa p '+
       'where c.mesreferencia = '+QuotedStr(asMes)+' '+
       'and c.idreferencia is not null '+
       'and c.tipo = ''B'' '+
       'and r.idlote = c.idlote '+
       'and r.idfavorecido = p.idpessoa ') then
  begin
    while not qryAux5.eof do
    begin
      If not (QryAux.Locate('IDFAVORECIDO',qryaux5.fieldbyname('IDFAVORECIDO').asInteger,[loPartialKey])) then
      begin
        node:=fctvInformacoes.Items.Insert(nil,qryAux5.fieldbyname('nome').asstring);
        node.StringData:=inttostr(qryAux5.fieldbyname('idfavorecido').asinteger)+'-1';
      end;
      llistaAuxiliar.add(inttostr(qryAux5.fieldbyname('idfavorecido').asinteger)+'-1');
      qryAux5.next;
    end;
  end;

  
  case aiopcaobusca of
  0: begin {com abono}
       ssql:=
         ' SELECT DISTINCT HS.IDFAVORECIDO, PE.NOME '+
         ' FROM HISTRUBSAL HS, PESSOA PE '+
         ' WHERE HS.MESCOBRANCA = '+QuotedStr(asMes)+' '+
         ' AND HS.IDFAVORECIDO IN (SELECT LC.IDFAVORECIDO FROM  LAYOUTDESCONTO LD, '+
         ' LAYOUTXCOLUNAS LC, PESSOA PE '+
         ' WHERE LD.IDLAYOUT = LC.IDLAYOUT AND '+
         ' LC.IDFAVORECIDO = PE.IDPESSOA AND LD.FLGTIPOCONVENIO = 1) AND '+
         ' HS.IDMODULO = 18 AND '+
         ' HS.IDFAVORECIDO = PE.IDPESSOA  ';
     end;
  1: begin {sem abono}
       ssql:=
         ' SELECT DISTINCT HS.IDFAVORECIDO, PE.NOME '+
         ' FROM HISTRUBSAL HS, PESSOA PE '+
         ' WHERE HS.MESCOBRANCA = '+QuotedStr(asMes)+' '+
         ' AND HS.MES <> '+quotedstr(asMesAbono)+' '+
         ' AND HS.IDFAVORECIDO IN (SELECT LC.IDFAVORECIDO FROM  LAYOUTDESCONTO LD, '+
         ' LAYOUTXCOLUNAS LC, PESSOA PE '+
         ' WHERE LD.IDLAYOUT = LC.IDLAYOUT AND '+
         ' LC.IDFAVORECIDO = PE.IDPESSOA AND LD.FLGTIPOCONVENIO = 1) AND '+
         ' HS.IDMODULO = 18 AND '+
         ' HS.IDFAVORECIDO = PE.IDPESSOA  ';
     end;
  2: begin {apenas abono}
       ssql:=
         ' SELECT DISTINCT HS.IDFAVORECIDO, PE.NOME '+
         ' FROM HISTRUBSAL HS, PESSOA PE '+
         ' WHERE HS.MESCOBRANCA = '+QuotedStr(asMes)+' '+
         ' AND HS.MES = '+quotedstr(asMesAbono)+' '+
         ' AND HS.IDFAVORECIDO IN (SELECT LC.IDFAVORECIDO FROM  LAYOUTDESCONTO LD, '+
         ' LAYOUTXCOLUNAS LC, PESSOA PE '+
         ' WHERE LD.IDLAYOUT = LC.IDLAYOUT AND '+
         ' LC.IDFAVORECIDO = PE.IDPESSOA AND LD.FLGTIPOCONVENIO = 1) AND '+
         ' HS.IDMODULO = 18 AND '+
         ' HS.IDFAVORECIDO = PE.IDPESSOA  ';
     end;
  end;

  // Verifica favorecidos de convênios permanentes que não possuem lotes de importação
  if FazQuery(qryAux4, ssql) then
  begin
    while not qryAux4.eof do
    begin
      If not (QryAux5.Locate('IDFAVORECIDO',
        qryaux4.fieldbyname('IDFAVORECIDO').asInteger, [loPartialKey])) then
      begin
        node:=fctvInformacoes.Items.Insert(nil,qryAux4.fieldbyname('nome').asstring);
        node.StringData:=inttostr(qryAux4.fieldbyname('idfavorecido').asinteger)+'-2';
        llistaAuxiliar.add(inttostr(qryAux4.fieldbyname('idfavorecido').asinteger)+'-2');
      end;
      qryAux4.next;
    end;
  end;

  if fctvInformacoes.Items.count = 0 then
  begin
    MsgDlg('Nenhuma informação de convênio a processar no mês selecionado.',
           'Informação',mtWarning,[mbOk,mbHelp],0);
    exit;
  end;

  lii:=0;
  // Monta os Favorecidos e os seus convenios relacionados
  repeat
    if fctvInformacoes.Items[lii].level = 0 then
    begin
      lnivel0:=lii;
      nTeste:= fctvInformacoes.Items[lii];
      nPosicao:= Pos('-',nteste.Stringdata);
      nTipo:= 0;
      repeat
        cChave:= Copy(nTeste.StringData,1,nPosicao-1)+'-'+Inttostr(nTipo);
        if llistaAuxiliar.indexof(cChave) >= 0 then
        begin
          If nTipo = 0 then
          begin
            lProcContinuado := false;
            lProcContinuado2:= false;
            lProcAvulso     := true;
          end
          else
          begin
            If nTipo = 1 then
            begin
              lProcContinuado := true;
              lproccontinuado2:= false;
              lProcAvulso     := false;
            end
            else
            begin
              lProcContinuado := false;
              lproccontinuado2:= true;
              lProcAvulso     := false;
            end;
          end;

          sSql:=
            'SELECT DISTINCT L.IDLAYOUT, L.DESCRICAO, '+_clinefeed+
            '       NVL(L.FLGTIPOCONVENIO,0) AS FLGTIPOCONVENIO, '+_clinefeed+
            '       L.FLGGERACPAGAR, L.FLGGERACRECEBER, '+_clinefeed+
            '       NVL(L.CODPORTFORMAFAV,0) AS CODPORTFORMAFAV, '+_clinefeed+
            '       NVL(L.CODPORTFORMAFVREC,0) AS CODPORTFORMAFVREC, '+_clinefeed+
            '       NVL(L.FLGTRATARESIDUO,0) AS FLGTRATARESIDUO, '+_clinefeed+
            '       L.FLGMESPAGTO, L.DIAPAGAMENTO, L.FLGDIAUTIL, '+_clinefeed+
            '       LC.COLRUBRICA, LC.TAMRUBRICA, LC.IDRUBRICA AS IDRUBORIGINAL, '+_clinefeed; 
          If lProcavulso then
            ssql:=ssql+
              '       C.IDLOTE, NVL(LC.IDRUBRICA,T.IDPROVENTO) AS IDRUBRICA, LC.IDRUBRICADEVOL, '+_clinefeed;
          If lProccontinuado then
            ssql:=ssql+
              '       C.IDLOTE, RI.IDRUBRICA AS IDRUBRICAINDIV,LC.CARACNATUREZA , '+_clinefeed;
          If lProccontinuado2 then
            ssql:=ssql+
              '       H.LOTEORIGINAL AS IDLOTE, H.IDRUBRICA AS IDRUBRICA, '+_clinefeed;
          If SistemaFolha.FlgUsaCodRubExt = 0 then
          begin
            If (lProccontinuado or lproccontinuado2) then
              sSql:=sSql+'       PDI.DESCRICAO AS DESCRUBRICAINDIV, '+_clinefeed+
                         '       PDI.FLGDESCONTO, '+_clinefeed+
                         '       NVL(PDI.IDPROVENTO,0) AS CODRUBRICAINDIV, '+_clinefeed;
            If lProcAvulso then
              ssql:=ssql+ '       PDN.DESCRICAO AS DESCRRUBNORMAL, '+_clinefeed+
                          '       PDN.FLGDESCONTO, '+_clinefeed+
                          '       PDD.DESCRICAO AS DESCRRUBDEVOL, '+_clinefeed+
                          '       PDN.IDPROVENTO AS CODRUBNORMALEXIB, '+_clinefeed+
                          '       PDD.IDPROVENTO AS CODRUBDEVOLEXIB, '+_clinefeed;
          end
          else
          begin
            If (lProccontinuado or lproccontinuado2) then
              sSql:=sSql+'       PDI.DESCRPROVDESC AS DESCRUBRICAINDIV, '+_clinefeed+
                         '       PDI.FLGDESCONTO, '+_clinefeed+
                         '       PDI.CODPROVDESC AS CODRUBRICAINDIV, '+_clinefeed;
            If lProcAvulso then
              ssql:=ssql+'       PDN.DESCRPROVDESC AS DESCRRUBNORMAL, '+_clinefeed+
                         '       PDN.FLGDESCONTO, '+_clinefeed+
                         '       PDD.DESCRPROVDESC AS DESCRRUBDEVOL, '+_clinefeed+
                         '       PDN.CODPROVDESC AS CODRUBNORMALEXIB, '+_clinefeed+
                         '       PDD.CODPROVDESC AS CODRUBDEVOLEXIB, '+_clinefeed;
          end;
          sSql:=sSql+'       DECODE(L.FLGTIPOCONVENIO,1,''Permanente'',''Avulso'') AS DESCRTIPO, '+_clinefeed+
                     '       DECODE(L.FLGGERACPAGAR,0,''Automático'', ''Manual'') AS TIPOCAP, '+_clinefeed+
                     '       DECODE(l.FLGGERACRECEBER,0,''Automático'', ''Manual'') AS TIPOCAR, '+_clinefeed+
                     '       DECODE(l.flgtrataresiduo,1,''Trata excesso de débito'','+_clinefeed+
                     '       ''Não trata excesso de débito'') AS DESCREXCESSO '+_clinefeed+
                     'FROM LAYOUTDESCONTO L, LAYOUTXCOLUNAS LC, '+_clinefeed;
          If lprocAvulso then
            ssql:=ssql+'     CTRLINTERFACE C,PROVDESC PDN, PROVDESC PDD, TMPDESC T '+_clinefeed;
          If (lProccontinuado or lproccontinuado2 ) then
          begin
            If lprocavulso then
              ssql:=ssql+',';
            ssql:= ssql+' PROVDESC PDI '+_clinefeed;
            If lproccontinuado then
              ssql:=ssql +' CTRLINTERFACE C, RUBRICAINDIV RI '+_clinefeed;
            If lproccontinuado2 then
              ssql:=ssql+ ' HISTRUBSAL H ';
          end;

          If (lprocavulso or lproccontinuado) then
            ssql:=ssql+'WHERE C.MESREFERENCIA = '+QuotedStr(asMes)+' '+
                       'AND C.IDREFERENCIA = L.IDLAYOUT '+
                       'AND C.TIPO = ''B'' '
          else
            ssql:= ssql + 'WHERE H.MESCOBRANCA = '+QuotedStr(asMes)+' '+
                           ' AND H.IDFAVORECIDO = '+ copy(nteste.Stringdata,1,nPosicao-1)+' '+
                           ' AND H.IDMODULO = 18 '+ 
                           ' AND ((H.FLGESTORNO = 0) OR (H.FLGESTORNO IS NULL)) '+
                           ' AND H.IDFAVORECIDO = LC.IDFAVORECIDO '+
                           ' AND H.IDRUBRICA = LC.IDRUBRICA '+
                           ' AND LC.IDLAYOUT = L.IDLAYOUT '+
                           ' AND (PDI.IDPROVENTO = LC.IDRUBRICA) ';

          
          case aiopcaobusca of
          1: begin {sem abono}
               if lprocAvulso then
                 ssql:=ssql+
                   ' AND T.MESREFERENCIA <> '+quotedstr(asMesAbono)+' ';
               if lproccontinuado2 then
                 ssql:=ssql+
                   ' AND H.MES <> '+quotedstr(asMesAbono)+' ';
             end;
          2: begin {apenas abono}
               if lprocAvulso then
                 ssql:=ssql+
                   ' AND T.MESREFERENCIA = '+quotedstr(asMesAbono)+' ';
               if lproccontinuado2 then
                 ssql:=ssql+
                   ' AND H.MES = '+quotedstr(asMesAbono)+' ';
             end;
          end;

          if lProcavulso then
            ssql:=ssql+'AND T.IDLOTE = C.IDLOTE '+
                       'AND PDN.IDPROVENTO = NVL(LC.IDRUBRICA,T.IDPROVENTO) '+
                       'AND PDD.IDPROVENTO(+) = LC.IDRUBRICADEVOL '+
                       'AND T.IDFAVORECIDO = '+copy(nteste.Stringdata,1,nPosicao-1)+' '+
                       'AND LC.IDLAYOUT = L.IDLAYOUT ';
          if lproccontinuado then
            ssql:=ssql+'AND C.IDLOTE = RI.IDLOTE '+
                       'AND PDI.IDPROVENTO = RI.IDRUBRICA '+
                       'AND RI.IDFAVORECIDO = '+copy(nteste.Stringdata,1,nPosicao-1)+' '+
                       'AND LC.IDLAYOUT = L.IDLAYOUT ';

          If FazQuery(qryAux,sSql) then
          begin
            imax:=0;
            while not qryAux.eof do
            begin
              if imax < length(qryAux.fieldbyname('descricao').asstring) then
                imax:=length(qryAux.fieldbyname('descricao').asstring);
              qryAux.next;
            end;

            qryAux.first;
            while not qryAux.eof do
            begin
              timp_n:=0; tnproc_n:=0; tprocint_n:=0; tprocexcesso_n:=0;
              vimp_n:=0; vproc_n:=0; vnproc_n:=0; vexcesso_n:=0;
              timp_d:=0; tnproc_d:=0; tprocint_d:=0; tprocexcesso_d:=0;
              vimp_d:=0; vproc_d:=0; vnproc_d:=0; vexcesso_d:=0;
              nconv:=fctvInformacoes.Items.AddChild(fctvInformacoes.Items[lnivel0],
                AE(qryAux.fieldbyname('descricao').asstring,imax)+
                ' Geração do CAP: '+qryAux.fieldbyname('TIPOCAP').asstring+' | '+
                ' Geração do CAR: '+qryAux.fieldbyname('TIPOCAR').asstring+' | '+
                ' (Dia Pagto:'+qryAux.fieldbyname('diapagamento').asstring+' | '+
                qryAux.fieldbyname('descrtipo').asstring+' | '+
                qryAux.fieldbyname('descrexcesso').asstring+') - Lote '+
                qryAux.fieldbyname('idlote').asstring);
              nconv.StringData:=inttostr(qryAux.fieldbyname('idlayout').asinteger);

              //trata rubrica normal - avulso
              If lProcAvulso then
              begin
                if not qryAux.fieldbyname('idrubrica').isnull then
                begin
                  //NÃO PRECISA CHECAR PARÂMETROS SE NÃO GERA CONTAS A PAGAR
                  If (qryaux.fieldbyname('FLGGERACPAGAR').asInteger = 0) then
                  begin
                    If not VerificaParametros(qryAux.fieldbyname('idrubrica').asinteger) then
                    begin
                       lfaltaparametro:= true;
                    end;
                  end;
                  PegaContaContabil(qryAux.fieldbyname('idrubrica').asinteger,
                    splacontanorm);
                  n1:=fctvInformacoes.Items.AddChild(nconv,'Rubrica Normal: '+
                  qryAux.fieldbyname('codrubnormalexib').asstring+'-'+
                  qryAux.fieldbyname('descrrubnormal').asstring+' - Conta contábil: '+splacontanorm);
                  n1.StringData:='N'+qryAux.fieldbyname('idrubrica').asstring; {idrubrica}

                  nr:=fctvInformacoes.Items.AddChild(n1,'Registros');
                  nr.StringData:='NR'; {tag indica ramo de registro para rubrica}
                  nv:=fctvInformacoes.Items.AddChild(n1,'Valores Monetários');
                  nv.StringData:='NV'; {tag indica ramo de valores para rubrica}

                  //pega valores totais
                  PegaDadosRubrica(qryAux.fieldbyname('idrubrica').asinteger,
                    qryAux.fieldbyname('idlote').asinteger,
                    strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1)),
                    timp_n, tnproc_n, tprocint_n, tprocexcesso_n,
                    vimp_n, vnproc_n, vproc_n, vexcesso_n);

                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Importado',27)+'-'+
                    AD(inttostr(timp_n),10)+' registros');
                  node.StringData:='NRI'; {tag que indica registros importados}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total não Processado',27)+'-'+
                    AD(inttostr(tnproc_n),10)+' registros');
                  node.StringData:='NRNP'; {tag que indica registros não processados}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Processado Parcial',27)+'-'+
                    AD(inttostr(tprocexcesso_n),10)+' registros');
                  node.StringData:='NRPP'; {tag que indica registros processados parcialmente}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Processado Integral',27)+'-'+
                    AD(inttostr(tprocint_n),10)+' registros');
                  node.StringData:='NRPI'; {tag que indica registros processados integralmente}

                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor Importado',27)+'- '+
                    AD(floattostrf(vimp_n,ffCurrency,18,2),18));
                  node.StringData:='NVI'; {tag que indica valor importado}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor não Processado',27)+'- '+
                    AD(floattostrf(vnproc_n,ffCurrency,18,2),18));
                  node.StringData:='NVNP'; {tag que indica valor não processado}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor em excesso de débito',27)+'- '+
                    AD(floattostrf(vexcesso_n,ffCurrency,18,2),18));
                  node.StringData:='NVPP'; {tag que indica valor processado parcialmente}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor Líquido Processado',27)+'- '+
                    AD(floattostrf(vproc_n,ffCurrency,18,2),18));
                  node.StringData:='NVPI'; {tag que indica valor processado integralmente}
                end;
              end;

              //trata rubrica normal - continuado
              If lProcContinuado then
              begin
                if ((not qryAux.fieldbyname('idrubricaindiv').isnull) and (qryAux.fieldbyname('caracnatureza').isnull)) then
                begin
                  If (qryaux.fieldbyname('FLGGERACPAGAR').asInteger = 0) then
                  begin
                    If not VerificaParametros(qryAux.fieldbyname('idrubricaindiv').asinteger) then
                    begin
                       lfaltaParametro:= true;
                    end;
                  end;
                  PegaContaContabil(qryAux.fieldbyname('idrubricaindiv').asinteger,
                    splacontanorm);
                  n1:=fctvInformacoes.Items.AddChild(nconv,'Rubrica: '+
                    qryAux.fieldbyname('codrubricaindiv').asstring+'-'+
                    qryAux.fieldbyname('descrubricaindiv').asstring+
                    ' - Conta contábil: '+splacontanorm);
                  n1.StringData:='N'+
                    qryAux.fieldbyname('idrubricaindiv').asstring; {idrubrica}

                  nr:=fctvInformacoes.Items.AddChild(n1,'Registros');
                  nr.StringData:='NR'; {tag indica ramo de registro para rubrica}
                  nv:=fctvInformacoes.Items.AddChild(n1,'Valores Monetários');
                  nv.StringData:='NV'; {tag indica ramo de valores para rubrica}

                  //pega valores totais
                  PegaDadosRubrica(qryAux.fieldbyname('idrubricaindiv').asinteger,
                  qryAux.fieldbyname('idlote').asinteger,
                  strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1)),
                  timp_n, tnproc_n, tprocint_n, tprocexcesso_n,
                  vimp_n, vnproc_n, vproc_n, vexcesso_n);

                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Importado',27)+'-'+
                    AD(inttostr(timp_n),10)+' registros');
                  node.StringData:='NRI'; {tag que indica registros importados}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total não Processado',27)+'-'+
                    AD(inttostr(tnproc_n),10)+' registros');
                  node.StringData:='NRNP'; {tag que indica registros não processados}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Processado ',27)+'-'+
                    AD(inttostr(tprocint_n),10)+' registros');
                  node.StringData:='NRPI'; {tag que indica registros processados integralmente}

                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor Importado',27)+'- '+
                    AD(floattostrf(vimp_n,ffCurrency,18,2),18));
                  node.StringData:='NVI'; {tag que indica valor importado}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor não Processado',27)+'- '+
                    AD(floattostrf(vnproc_n,ffCurrency,18,2),18));
                  node.StringData:='NVNP'; {tag que indica valor não processado}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor em excesso de débito',27)+'- '+
                    AD(floattostrf(vexcesso_n,ffCurrency,18,2),18));
                  node.StringData:='NVPP'; {tag que indica valor processado parcialmente}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor Líquido Processado',27)+'- '+
                    AD(floattostrf(vproc_n,ffCurrency,18,2),18));
                  node.StringData:='NVPI'; {tag que indica valor processado integralmente}
                end;
              end;

              //trata rubrica normal - continuado sem importacao
              If lProcContinuado2 then
              begin
                if (not qryAux.fieldbyname('idrubrica').isnull) then
                begin
                  If (qryaux.fieldbyname('FLGGERACPAGAR').asInteger = 0) then
                  begin
                    If not VerificaParametros(qryAux.fieldbyname('idrubrica').asinteger) then
                    begin
                      lFaltaparametro:= true;
                    end;
                  end;
                  PegaContaContabil(qryAux.fieldbyname('idrubrica').asinteger,
                    splacontanorm);
                  n1:=fctvInformacoes.Items.AddChild(nconv,'Rubrica: '+
                    qryAux.fieldbyname('codrubricaindiv').asstring+'-'+
                    qryAux.fieldbyname('descrubricaindiv').asstring+
                    ' - Conta contábil: '+splacontanorm);
                  n1.StringData:='N'+
                    qryAux.fieldbyname('idrubrica').asstring; {idrubrica}

                  nr:=fctvInformacoes.Items.AddChild(n1,'Registros');
                  nr.StringData:='NR'; {tag indica ramo de registro para rubrica}
                  nv:=fctvInformacoes.Items.AddChild(n1,'Valores Monetários');
                  nv.StringData:='NV'; {tag indica ramo de valores para rubrica}

                  //pega valores totais
                  PegaDadosRubrica(qryAux.fieldbyname('idrubrica').asinteger,
                    qryAux.fieldbyname('idlote').asinteger,
                    strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1)),
                    timp_n, tnproc_n, tprocint_n, tprocexcesso_n,
                    vimp_n, vnproc_n, vproc_n, vexcesso_n);

                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Importado',27)+'-'+
                    AD(inttostr(timp_n),10)+' registros');
                  node.StringData:='NRI'; {tag que indica registros importados}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total não Processado',27)+'-'+
                    AD(inttostr(tnproc_n),10)+' registros');
                  node.StringData:='NRNP'; {tag que indica registros não processados}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Processado ',27)+'-'+
                    AD(inttostr(tprocint_n),10)+' registros');
                  node.StringData:='NRPI'; {tag que indica registros processados integralmente}

                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor Importado',27)+'- '+
                    AD(floattostrf(vimp_n,ffCurrency,18,2),18));
                  node.StringData:='NVI'; {tag que indica valor importado}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor não Processado',27)+'- '+
                    AD(floattostrf(vnproc_n,ffCurrency,18,2),18));
                  node.StringData:='NVNP'; {tag que indica valor não processado}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor em excesso de débito',27)+'- '+
                    AD(floattostrf(vexcesso_n,ffCurrency,18,2),18));
                  node.StringData:='NVPP'; {tag que indica valor processado parcialmente}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor Líquido Processado',27)+'- '+
                    AD(floattostrf(vproc_n,ffCurrency,18,2),18));
                  node.StringData:='NVPI'; {tag que indica valor processado integralmente}
                end;
              end;

              If lProcAvulso then
              begin
                //trata rubrica de devolução - avulso
                if not qryAux.fieldbyname('idrubricadevol').isnull then
                begin
                  If (qryaux.fieldbyname('FLGGERACPAGAR').asInteger = 0) then
                  begin
                    if not VerificaParametros(qryAux.fieldbyname('idrubricadevol').asinteger) then
                    begin
                      lFaltaParametro:= true;
                    end;
                  end;
                  PegaContaContabil(qryAux.fieldbyname('idrubricadevol').asinteger,
                    splacontadev);

                  n1:=fctvInformacoes.Items.AddChild(nconv,'Rubrica Devolução: '+
                    qryAux.fieldbyname('codrubdevolexib').asstring+'-'+
                    qryAux.fieldbyname('descrrubdevol').asstring+
                    ' - Conta contábil: '+splacontadev);
                  n1.StringData:='D'+
                    qryAux.fieldbyname('idrubricadevol').asstring; {idrubrica}

                  nr:=fctvInformacoes.Items.AddChild(n1,'Registros');
                  nr.StringData:='DR'; {tag indica ramo de registro para rubrica}
                  nv:=fctvInformacoes.Items.AddChild(n1,'Valores Monetários');
                  nv.StringData:='DV'; {tag indica ramo de valores para rubrica}
                  //pega valores totais
                  PegaDadosRubrica(qryAux.fieldbyname('idrubricadevol').asinteger,
                    qryAux.fieldbyname('idlote').asinteger,
                    strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1)),
                    timp_d, tnproc_d, tprocint_d, tprocexcesso_d,
                    vimp_d, vnproc_d, vproc_d, vexcesso_d);

                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Importado',27)+'-'+
                    AD(inttostr(timp_d),10)+' registros');
                  node.StringData:='DRI'; {tag que indica registros importados}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total não Processado',27)+'-'+
                    AD(inttostr(tnproc_d),10)+' registros');
                  node.StringData:='DRNP'; {tag que indica registros não processados}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Processado Parcial',27)+'-'+
                    AD(inttostr(tprocexcesso_d),10)+' registros');
                  node.StringData:='DRPP'; {tag que indica registros processados parcialmente}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Processado Integral',27)+'-'+
                    AD(inttostr(tprocint_d),10)+' registros');
                  node.StringData:='DRPI'; {tag que indica registros processados integralmente}

                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor Importado',27)+'- '+
                    AD(floattostrf(vimp_d,ffCurrency,18,2),18));
                  node.StringData:='DVI'; {tag que indica valor importado}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor não Processado',27)+'- '+
                    AD(floattostrf(vnproc_d,ffCurrency,18,2),18));
                  node.StringData:='DVNP'; {tag que indica valor não processado}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor em excesso de débito',27)+'- '+
                    AD(floattostrf(vexcesso_d,ffCurrency,18,2),18));
                  node.StringData:='DVPP'; {tag que indica valor processado parcialmente}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor Líquido Processado',27)+'- '+
                    AD(floattostrf(vproc_d,ffCurrency,18,2),18));
                  node.StringData:='DVPI'; {tag que indica valor processado integralmente}
                end;
              end;

              If lProcContinuado then
              begin
                //trata rubrica de devolução - continuado
                if not qryAux.fieldbyname('caracnatureza').isnull then
                begin
                  If (qryaux.fieldbyname('FLGGERACPAGAR').asInteger = 0) then
                  begin
                    If not VerificaParametros(qryAux.fieldbyname('idrubricaindiv').asinteger) then
                    begin
                       lFaltaParametro:= true;
                    end;
                  end;
                  PegaContaContabil(qryAux.fieldbyname('idrubricaindiv').asinteger,
                    splacontadev);

                  n1:=fctvInformacoes.Items.AddChild(nconv,'Rubrica Devolução: '+
                     qryAux.fieldbyname('codrubricaindiv').asstring+'-'+
                     qryAux.fieldbyname('descrubricaindiv').asstring+' - Conta contábil: '+splacontanorm);
                     n1.StringData:='D'+qryAux.fieldbyname('idrubricaindiv').asstring; {idrubrica}
                  nr:=fctvInformacoes.Items.AddChild(n1,'Registros');
                  nr.StringData:='DR'; {tag indica ramo de registro para rubrica}
                  nv:=fctvInformacoes.Items.AddChild(n1,'Valores Monetários');
                  nv.StringData:='DV'; {tag indica ramo de valores para rubrica}
                  //pega valores totais
                  PegaDadosRubrica(qryAux.fieldbyname('idrubricaIndiv').asinteger,
                    qryAux.fieldbyname('idlote').asinteger,
                    strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1)),
                    timp_d, tnproc_d, tprocint_d, tprocexcesso_d,
                    vimp_d, vnproc_d, vproc_d, vexcesso_d);

                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Importado',27)+'-'+
                    AD(inttostr(timp_d),10)+' registros');
                  node.StringData:='DRI'; {tag que indica registros importados}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total não Processado',27)+'-'+
                    AD(inttostr(tnproc_d),10)+' registros');
                  node.StringData:='DRNP'; {tag que indica registros não processados}
                  node:=fctvInformacoes.Items.AddChild(nr,
                    AE('Total Processado Integral',27)+'-'+
                    AD(inttostr(tprocint_d),10)+' registros');
                  node.StringData:='DRPI'; {tag que indica registros processados integralmente}

                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor Importado',27)+'- '+
                    AD(floattostrf(vimp_d,ffCurrency,18,2),18));
                  node.StringData:='DVI'; {tag que indica valor importado}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor não Processado',27)+'- '+
                    AD(floattostrf(vnproc_d,ffCurrency,18,2),18));
                  node.StringData:='DVNP'; {tag que indica valor não processado}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor em excesso de débito',27)+'- '+
                    AD(floattostrf(vexcesso_d,ffCurrency,18,2),18));
                  node.StringData:='DVPP'; {tag que indica valor processado parcialmente}
                  node:=fctvInformacoes.Items.AddChild(nv,
                    AE('Valor Líquido Processado',27)+'- '+
                    AD(floattostrf(vproc_d,ffCurrency,18,2),18));
                  node.StringData:='DVPI'; {tag que indica valor processado integralmente}
                end;
              end;

              if dtpDtPagamento.text = '' then
              begin
                idia:=qryAux.fieldbyname('diapagamento').asinteger;
                imes:=cmbMes.ItemIndex+1;
                if qryAux.fieldbyname('flgmespagto').asinteger = 1 then
                  inc(imes);
                iano:=strtoint(spnedAno.Text);
                if imes > 12 then
                begin
                  imes:=1;
                  inc(iano);
                end;
                repeat
                  try
                    dtpagto:=encodedate(iano, imes, idia);
                    break;
                  except
                    dec(idia);
                    if idia <= 0 then
                      break;
                  end;
                until false;

                (* Gera contas a pagar automático *)
                If (qryaux.fieldbyname('FLGGERACPAGAR').asInteger = 0) And
                   (Not DiasUteis.DiaUtil(dtpagto, SistemaFolha.CidadeEmpresa, SistemaFolha.PaisEmpresa, SistemaFolha.UFEmpresa,true,true,false)) And
                   (Not qryAux.fieldbyname('flgdiautil').IsNull) then
                begin
                  (* FlgDiaUtil - Valor: 0 = Anterior 1 = Posterior *)
                  If qryAux.fieldbyname('flgdiautil').asinteger = 0 then
                    dtpagto:= DiasUteis.UltDiaUtilAnterior(dtpagto, SistemaFolha.CidadeEmpresa, SistemaFolha.PaisEmpresa, SistemaFolha.UFEmpresa, true,true,false)
                  else
                    If qryAux.fieldbyname('flgdiautil').asinteger = 1 then
                      dtpagto:= DiasUteis.PrimeiroDiaUtilPosterior(dtpagto,SistemaFolha.CidadeEmpresa, SistemaFolha.PaisEmpresa, SistemaFolha.UFEmpresa,true,true,false); 
                end;
                (* Fim do Tratamento da data de pagamento *)
              end
              else
                dtpagto:=dtpDtPagamento.Date;

              (* Portador Forma do Favorecido - Contas a Pagar e Receber*)
              iPortFormaFav   := StrToIntDef(qryaux.fieldbyname('CODPORTFORMAFAV').AsString,0);
              iPortFormaFavRec:= StrToIntDef(qryaux.fieldbyname('CODPORTFORMAFVREC').AsString,0);
              //VERIFICAR PARAMETRIZAÇÃO DO PORTADOR FORMA DE PAGAMENTO E DE RECEBIMENTO VINCULADOS AO CONVÊNIO
              If (qryaux.fieldbyname('FLGGERACPAGAR').asInteger = 0) then
              begin
                If iPortFormaFav<=0 then
                begin
                  memresult.lines.add('Erro. Deve-se parametrizar o '+
                    'Portador Forma de Pagamento do convênio:'+
                    qryaux.fieldbyname('descricao').asstring);
                  iPortFormaFav:=-1;
                  lfaltaparametro:= true;
                end;
              end;
              If (qryaux.fieldbyname('FLGGERACRECEBER').asInteger = 0) then
              begin
                If iPortFormaFavRec<=0 then
                begin
                  memresult.lines.add('Erro. Deve-se parametrizar o '+
                    'Portador Forma de Recebimento do convênio:'+
                    qryaux.fieldbyname('descricao').asstring);
                  iPortFormaFavRec:=-1;
                  lfaltaparametro:= true;
                end;
              end;
              (* Fim do Tratamento do Portador Forma do Favorecido *)

              If lProcAvulso then
              begin
                
                lbFlgRubricaLivre:=
                  (qryAux.fieldbyname('IDRUBORIGINAL').asinteger = 0) and
                  (qryAux.fieldbyname('IDRUBRICADEVOL').asinteger = 0) and
                  (qryAux.fieldbyname('COLRUBRICA').asinteger > 0) and
                  (qryAux.fieldbyname('TAMRUBRICA').asinteger > 0);

                liindex:=ListaCAPConvenio.VerificaLista(
                  strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1)),
                  qryAux.fieldbyname('idrubrica').asinteger,
                  qryAux.fieldbyname('idrubricadevol').asinteger,
                  qryAux.fieldbyname('flgtrataresiduo').asinteger,
                  qryaux.fieldbyname('FLGGERACPAGAR').asInteger,
                  qryaux.fieldbyname('FLGGERACRECEBER').asInteger,
                  iPortFormaFav,
                  IPortFormaFavRec,
                  qryaux.fieldbyname('FLGDESCONTO').asInteger,
                  dtpagto, splacontanorm,
                  vimp_n, vimp_d, vproc_n, vproc_d,
                  lbFlgRubricaLivre, 
                  qryAux.fieldbyname('FLGDESCONTO').asinteger 
                  );

                if (ListaCAPConvenio.objects[liindex] as tCAPConvenio).PlacontaTemp = '' then
                begin
                  (ListaCAPConvenio.objects[liindex] as tCAPConvenio).PlacontaTemp:=splacontanorm;
                end
                else
                  if (ListaCAPConvenio.objects[liindex] as tCAPConvenio).PlacontaTemp <> splacontanorm then
                    (ListaCAPConvenio.objects[liindex] as tCAPConvenio).FlgMultiplaConta:=true;

                //grava informações sobre o lote processado para a rubrica normal
                if not qryAux.fieldbyname('idrubrica').isnull then
                begin
                  qryConvLote.append;
                  qryConvLote.fieldbyname('IDFUNDACAO').asinteger  :=iidfundacao;
                  qryConvLote.fieldbyname('IDPROCCONV').asinteger  :=0;
                  qryConvLote.fieldbyname('IDLOTE').asinteger      :=
                  qryAux.fieldbyname('idlote').asinteger;
                  qryConvLote.fieldbyname('IDLAYOUT').asinteger    :=
                    qryAux.fieldbyname('idlayout').asinteger;
                  qryConvLote.fieldbyname('IDFAVORECIDO').asinteger:=
                    strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1));
                  qryConvLote.fieldbyname('IDRUBRICA').asinteger   :=
                    qryAux.fieldbyname('idrubrica').asinteger;
                  qryConvLote.fieldbyname('TOTALIMPORTADO').asinteger:=timp_n;
                  qryConvLote.fieldbyname('TOTALNAOPROC').asinteger  :=tnproc_n;
                  qryConvLote.fieldbyname('TOTALPROCINTEG').asinteger:=tprocint_n;
                  qryConvLote.fieldbyname('TOTALPROCPARC').asinteger :=tprocexcesso_n;
                  qryConvLote.fieldbyname('VALORIMPORTADO').asfloat:=vimp_n;
                  qryConvLote.fieldbyname('VALORNAOPROC').asfloat  :=vnproc_n;
                  qryConvLote.fieldbyname('VALORPROCINTEG').asfloat:=vproc_n;
                  qryConvLote.fieldbyname('VALORPROCPARC').asfloat :=vexcesso_n;
                  qryConvLote.fieldbyname('FLGTIPOCONVENIO').asinteger:=
                    qryAux.fieldbyname('FLGTIPOCONVENIO').asinteger;
                  qryConvLote.fieldbyname('FLGTRATARESIDUO').asinteger:=
                    qryAux.fieldbyname('FLGTRATARESIDUO').asinteger;
                  qryConvLote.fieldbyname('IDLOTEEXCESSO').clear;
                  qryConvLote.fieldbyname('CODDOCUMENTO').clear;
                  qryConvLote.fieldbyname('IndiceCAP').asinteger:=liindex;
                  qryConvLote.fieldbyname('CARACNATUREZA').asString  := '';
                  qryConvLote.post;
                end;

                //grava informações sobre o lote processado para a rubrica devolução
                if not qryAux.fieldbyname('idrubricadevol').isnull then
                begin
                  qryConvLote.append;
                  qryConvLote.fieldbyname('IDFUNDACAO').asinteger  :=iidfundacao;
                  qryConvLote.fieldbyname('IDPROCCONV').asinteger  :=0;
                  qryConvLote.fieldbyname('IDLOTE').asinteger      :=
                    qryAux.fieldbyname('idlote').asinteger;
                  qryConvLote.fieldbyname('IDLAYOUT').asinteger    :=
                    qryAux.fieldbyname('idlayout').asinteger;
                  qryConvLote.fieldbyname('IDFAVORECIDO').asinteger:=
                    strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1));
                  qryConvLote.fieldbyname('IDRUBRICA').asinteger   :=
                    qryAux.fieldbyname('idrubricadevol').asinteger;
                  qryConvLote.fieldbyname('TOTALIMPORTADO').asinteger:=timp_d;
                  qryConvLote.fieldbyname('TOTALNAOPROC').asinteger  :=tnproc_d;
                  qryConvLote.fieldbyname('TOTALPROCINTEG').asinteger:=tprocint_d;
                  qryConvLote.fieldbyname('TOTALPROCPARC').asinteger :=tprocexcesso_d;
                  qryConvLote.fieldbyname('VALORIMPORTADO').asfloat:=vimp_d;
                  qryConvLote.fieldbyname('VALORNAOPROC').asfloat  :=vnproc_d;
                  qryConvLote.fieldbyname('VALORPROCINTEG').asfloat:=vproc_d;
                  qryConvLote.fieldbyname('VALORPROCPARC').asfloat :=vexcesso_d;
                  qryConvLote.fieldbyname('FLGTIPOCONVENIO').asinteger:=
                    qryAux.fieldbyname('FLGTIPOCONVENIO').asinteger;
                  qryConvLote.fieldbyname('FLGTRATARESIDUO').asinteger:=
                    qryAux.fieldbyname('FLGTRATARESIDUO').asinteger;
                  qryConvLote.fieldbyname('IDLOTEEXCESSO').clear;
                  qryConvLote.fieldbyname('CODDOCUMENTO').clear;
                  qryConvLote.fieldbyname('IndiceCAP').asinteger:=liindex;
                  qryConvLote.fieldbyname('CARACNATUREZA').asString  := '';
                  qryConvLote.post;
                end;
              end;

              If lProcContinuado then
              begin
                liindex:=ListaCAPConvenio_Continuado.VerificaLista_Continuado(
                  strtoint(Copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1)),
                  qryAux.fieldbyname('idrubricaindiv').asinteger,
                  qryAux.fieldbyname('flgtrataresiduo').asinteger,
                  qryaux.fieldbyname('FLGGERACPAGAR').asInteger,
                  qryaux.fieldbyname('FLGGERACRECEBER').asInteger,
                  iPortFormaFav,
                  iPortFormaFavRec,
                  qryaux.fieldbyname('FLGDESCONTO').asInteger,
                  dtpagto, splacontanorm,qryAux.fieldbyname('caracnatureza').asstring,
                  vimp_n, vimp_d, vproc_n, vproc_d);

                //grava informações sobre o lote processado para a rubrica normal
                if ((not qryAux.fieldbyname('idrubricaindiv').isnull) and
                    (qryAux.fieldbyname('caracnatureza').isnull)) then
                begin
                  qryConvLote2.append;
                  qryConvLote2.fieldbyname('IDFUNDACAO').asinteger    := iidfundacao;
                  qryConvLote2.fieldbyname('IDPROCCONV').asinteger    := 0;
                  qryConvLote2.fieldbyname('IDLOTE').asinteger        := qryAux.fieldbyname('idlote').asinteger;
                  qryConvLote2.fieldbyname('IDLAYOUT').asinteger      := qryAux.fieldbyname('idlayout').asinteger;
                  qryConvLote2.fieldbyname('IDFAVORECIDO').asinteger  := strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nPosicao-1));
                  qryConvLote2.fieldbyname('IDRUBRICA').asinteger     := qryAux.fieldbyname('idrubricaindiv').asinteger;
                  qryConvLote2.fieldbyname('TOTALIMPORTADO').asinteger:=timp_n;
                  qryConvLote2.fieldbyname('TOTALNAOPROC').asinteger  :=tnproc_n;
                  qryConvLote2.fieldbyname('TOTALPROCINTEG').asinteger:=tprocint_n;
                  qryConvLote2.fieldbyname('TOTALPROCPARC').asinteger :=tprocexcesso_n;
                  qryConvLote2.fieldbyname('VALORIMPORTADO').asfloat  :=vimp_n;
                  qryConvLote2.fieldbyname('VALORNAOPROC').asfloat    :=vnproc_n;
                  qryConvLote2.fieldbyname('VALORPROCINTEG').asfloat  :=vproc_n;
                  qryConvLote2.fieldbyname('VALORPROCPARC').asfloat   :=vexcesso_n;
                  qryConvLote2.fieldbyname('FLGTIPOCONVENIO').asinteger:=qryAux.fieldbyname('FLGTIPOCONVENIO').asinteger;
                  qryConvLote2.fieldbyname('FLGTRATARESIDUO').asinteger:=qryAux.fieldbyname('FLGTRATARESIDUO').asinteger;
                  qryConvLote2.fieldbyname('IDLOTEEXCESSO').clear;
                  qryConvLote2.fieldbyname('CODDOCUMENTO').clear;
                  qryConvLote2.fieldbyname('IndiceCAP').asinteger     :=liindex;
                  qryConvLote2.fieldbyname('CARACNATUREZA').asString  := '';
                  qryConvLote2.post;
                end;

                //grava informações sobre o lote processado para a rubrica devolução
                if ((not qryAux.fieldbyname('idrubricaindiv').isnull) and
                    (not qryAux.fieldbyname('caracnatureza').isnull))  then
                begin
                  qryConvLote2.append;
                  qryConvLote2.fieldbyname('IDFUNDACAO').asinteger  :=iidfundacao;
                  qryConvLote2.fieldbyname('IDPROCCONV').asinteger  :=0;
                  qryConvLote2.fieldbyname('IDLOTE').asinteger      :=
                    qryAux.fieldbyname('idlote').asinteger;
                  qryConvLote2.fieldbyname('IDLAYOUT').asinteger    :=
                    qryAux.fieldbyname('idlayout').asinteger;
                  qryConvLote2.fieldbyname('IDFAVORECIDO').asinteger:=
                    strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1));
                  qryConvLote2.fieldbyname('IDRUBRICA').asinteger   :=
                    qryAux.fieldbyname('idrubricaindiv').asinteger;
                  qryConvLote2.fieldbyname('TOTALIMPORTADO').asinteger:=timp_n;
                  qryConvLote2.fieldbyname('TOTALNAOPROC').asinteger  :=tnproc_n;
                  qryConvLote2.fieldbyname('TOTALPROCINTEG').asinteger:=tprocint_n;
                  qryConvLote2.fieldbyname('TOTALPROCPARC').asinteger :=tprocexcesso_n;
                  qryConvLote2.fieldbyname('VALORIMPORTADO').asfloat:=vimp_n;
                  qryConvLote2.fieldbyname('VALORNAOPROC').asfloat  :=vnproc_n;
                  qryConvLote2.fieldbyname('VALORPROCINTEG').asfloat:=vproc_n;
                  qryConvLote2.fieldbyname('VALORPROCPARC').asfloat :=vexcesso_n;
                  qryConvLote2.fieldbyname('FLGTIPOCONVENIO').asinteger:=
                    qryAux.fieldbyname('FLGTIPOCONVENIO').asinteger;
                  qryConvLote2.fieldbyname('FLGTRATARESIDUO').asinteger:=
                    qryAux.fieldbyname('FLGTRATARESIDUO').asinteger;
                  qryConvLote2.fieldbyname('IDLOTEEXCESSO').clear;
                  qryConvLote2.fieldbyname('CODDOCUMENTO').clear;
                  qryConvLote2.fieldbyname('IndiceCAP').asinteger:=liindex;
                  qryConvLote2.fieldbyname('CARACNATUREZA').asString  :=qryAux.fieldbyname('CARACNATUREZA').asString;
                  qryConvLote2.post;
                end;
              end;

              If lProcContinuado2 then
              begin
                liindex:=ListaCAPConvenio_Continuado.VerificaLista_Continuado(
                  strtoint(Copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1)),
                  qryAux.fieldbyname('idrubrica').asinteger,
                  qryAux.fieldbyname('flgtrataresiduo').asinteger,
                  qryaux.fieldbyname('FLGGERACPAGAR').asInteger,
                  qryaux.fieldbyname('FLGGERACRECEBER').asInteger,
                  iPortFormaFav,
                  IPortFormaFavRec,
                   qryaux.fieldbyname('FLGDESCONTO').asInteger,
                  dtpagto, splacontanorm,'',
                  vimp_n, vimp_d, vproc_n, vproc_d);
              end;
              lii:=lii+11;
              qryAux.next;
            end;
          end;
        end;
        inc(nTipo)
      until nTipo = 2
    end;
    inc(lii);
  until lii = fctvInformacoes.Items.count;
  //-----------------------------------------------------------------------//
  // Monta os dados relativos ao Financeiro
  try
    lii:=0;
    repeat
      if fctvInformacoes.Items[lii].level = 0 then
      begin
        lnivel0:=lii;
        nconv:=nil;
        indoc:=0;
        nTeste:= fctvInformacoes.Items[lii];
        nPosicao:= Pos('-',nteste.Stringdata);
        nTipo:= 0;
        repeat
          cChave:= Copy(nTeste.StringData,1,nPosicao-1)+'-'+InttoStr(nTipo);
          If lListaAuxiliar.Indexof(cChave) >= 0 then
          begin
            If nTipo = 0 then
            begin
              lProcContinuado := false;
              lProcContinuado2:= false;
              lProcAvulso     := true;
            end
            else
            begin
              If nTipo = 1 then
              begin
                lProcContinuado := true;
                lproccontinuado2:= false;
                lProcAvulso     := false;
              end
              else
              begin
                lProcContinuado := false;
                lproccontinuado2:= true;
                lProcAvulso     := false;
              end;
            end;
            If lprocavulso then
            begin
              //APURA VALOR PARA CONVENIOS DE RUBRICA LIVRE
              vrubpagar:=0; vrubdevolver:=0;
              for lij:=0 to ListaCAPConvenio.count-1 do
              begin
                objCAPConvenio:=(ListaCAPConvenio.objects[lij] as tCAPConvenio);
                if objCAPConvenio.FlgRubricaLivre then
                begin
                  nPosicao:= Pos('-',fctvInformacoes.Items[lnivel0].StringData);
                  if (objCAPConvenio.idfavorecido =
                     strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1))) then
                  begin
                    //agrupa por flgdesconto
                    ssql:='select sum(valorprovento) as valor, flgdesconto '+
                          'from histrubsal '+
                          'where mescobranca = '+QuotedStr(asMes)+' '+
                          'and idfavorecido = '+inttostr(objCAPConvenio.idfavorecido)+' '+
                          'and idrubrica in ('+objCAPConvenio.RetornaListaRubrica+') '+
                          'and idmodulo = 18 '+
                          'and (flgestorno = 0 or flgestorno is null) '+
                          'and idhstfolhabenef is not null ';

                    case aiopcaobusca of
                    1: begin {sem abono}
                         ssql:=ssql+
                           ' and mes <> '+quotedstr(asMesAbono)+' ';
                       end;
                    2: begin {apenas abono}
                         ssql:=ssql+
                           ' and mes = '+quotedstr(asMesAbono)+' ';
                       end;
                    end;

                    ssql:=ssql+
                      'group by flgdesconto ';

                    if FazQuery(qryAux, ssql) then
                    begin
                      while not qryAux.eof do
                      begin
                        if qryaux.fieldbyname('flgdesconto').asinteger = 1 then
                          vrubpagar:=vrubpagar+qryAux.fieldbyname('valor').asfloat
                        else
                          vrubdevolver:=vrubdevolver+qryAux.fieldbyname('valor').asfloat;
                        qryAux.next;
                      end;
                    end;
                  end;
                end;
              end; //for lij:=0 to ListaCAPConvenio.count-1 do

              //ATRIBUI VALOR APURADO PARA CONVENIOS DE RUBRICA LIVRE
              for lij:=0 to ListaCAPConvenio.count-1 do
              begin
                objCAPConvenio:=(ListaCAPConvenio.objects[lij] as tCAPConvenio);
                if objCAPConvenio.FlgRubricaLivre then
                begin
                  nPosicao:= Pos('-',fctvInformacoes.Items[lnivel0].StringData);
                  if (objCAPConvenio.idfavorecido =
                     strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1))) then
                  begin
                    objCAPConvenio.dvalorpghist:=vrubpagar;
                    objCAPConvenio.dvalordvhist:=vrubdevolver;
                    objCAPConvenio.dvalorliqhist:=vrubpagar-vrubdevolver;
                  end;
                end;
              end; //for lij:=0 to ListaCAPConvenio.count-1 do

              for lij:=0 to ListaCAPConvenio.count-1 do
              begin
                objCAPConvenio:=(ListaCAPConvenio.objects[lij] as tCAPConvenio);
                //NÃO CRIAR NÓ SE CAP MANUAL
                if objCAPConvenio.GeraCAP = 0 then
                begin
                  nPosicao:= Pos('-',fctvInformacoes.Items[lnivel0].StringData);
                  if (objCAPConvenio.idfavorecido =
                     strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1))) then
                  begin
                    if objCAPConvenio.idrubnormal > 0 then
                      if objCAPConvenio.lstRubEmDoc.indexof(inttostr(objCAPConvenio.idrubnormal)) < 0 then
                      begin
                        objCAPConvenio.FlgGeraDOC:=true;
                        objCAPConvenio.lstRubEmDoc.add(inttostr(objCAPConvenio.idrubnormal));
                      end;
                    if objCAPConvenio.idrubdevol > 0 then
                      if objCAPConvenio.lstRubEmDoc.indexof(inttostr(objCAPConvenio.idrubdevol)) < 0 then
                      begin
                        objCAPConvenio.FlgGeraDOC:=true;
                        objCAPConvenio.lstRubEmDoc.add(inttostr(objCAPConvenio.idrubdevol));
                      end;
                    //GERAR DOCUMENTO A PAGAR OU DEVOLVER PARA CONVÊNIOS COM RUBRICA LIVRE
                    if objCAPConvenio.FlgRubricaLivre then
                    begin
                      if (indoc = 0) then
                      begin
                        If objCapConvenio.dvalorliqhist > 0 then
                        begin
                          nconv:=fctvInformacoes.Items.AddChild(
                            fctvInformacoes.Items[lnivel0],
                            'Documentos a Pagar');
                          nconv.StringData:='CAP';
                        end
                        else
                        begin
                          nconv:=fctvInformacoes.Items.AddChild(
                            fctvInformacoes.Items[lnivel0], 'Documentos a Receber');
                          nconv.StringData:='CAR';
                        end;
                        inc(indoc);
                        ndoc:=fctvInformacoes.Items.AddChild(
                          nconv, 'Documento '+inttostr(indoc));
                        ndoc.StringData:='HDOC';
                        node:=fctvInformacoes.Items.AddChild(ndoc,AE('Várias Rubricas',16));
                        node.StringData:='DRN';
                        node:=fctvInformacoes.Items.AddChild(ndoc,
                          AE('Data Pagamento',16)+': '+
                          formatdatetime('dd/mm/yyyy',objCAPConvenio.datapagto));
                        node.StringData:='DDT';
                        if not objCAPConvenio.FlgMultiplaConta then
                          node:=fctvInformacoes.Items.AddChild(ndoc,
                            AE('Conta Baixa',16)+': '+
                            splacontanorm)
                        else
                          node:=fctvInformacoes.Items.AddChild(ndoc,AE('Várias Contas de Baixa',30));
                        node.StringData:='DCB';
                        if objCAPConvenio.dvalorpghist > 0 then
                        begin
                          node:=fctvInformacoes.Items.AddChild(ndoc,
                            AE('Valor Processado a pagar',33)+' - '+
                            AD(floattostrf(objCAPConvenio.dvalorpghist,ffCurrency,18,2),18));
                          node.StringData:='DVPP';
                        end;
                        if objCAPConvenio.dvalordvhist > 0 then
                        begin
                          node:=fctvInformacoes.Items.AddChild(ndoc,
                            AE('Valor Processado a devolver',33)+' - '+
                            AD(floattostrf(objCAPConvenio.dvalordvhist,ffCurrency,18,2),18));
                          node.StringData:='DVPP';
                        end;
                        If objCAPConvenio.dvalorliqhist > 0 then
                          node:=fctvInformacoes.Items.AddChild(ndoc,
                            AE('Valor Líquido Processado a pagar',33)+' - '+
                            AD(floattostrf(abs(objCAPConvenio.dvalorliqhist),ffCurrency,18,2),18))
                        else
                          node:=fctvInformacoes.Items.AddChild(ndoc,
                            AE('Valor Líquido Processado a receber',33)+' - '+
                            AD(floattostrf(abs(objCAPConvenio.dvalorliqhist),ffCurrency,18,2),18));
                        node.StringData:='DVPL';
                      end;
                    end
                    else
                    begin
                      if nconv = nil then
                      begin
                        If objCapConvenio.Inatureza = 1 then
                        begin
                          nconv:=fctvInformacoes.Items.AddChild(
                            fctvInformacoes.Items[lnivel0],
                            'Documentos a Pagar');
                          nconv.StringData:='CAP';
                        end
                        else
                        begin
                          nconv:=fctvInformacoes.Items.AddChild(
                            fctvInformacoes.Items[lnivel0], 'Documentos a Receber');
                          nconv.StringData:='CAR';
                        end;
                      end;
                      inc(indoc);
                      ndoc:=fctvInformacoes.Items.AddChild(
                        nconv, 'Documento '+inttostr(indoc));
                      ndoc.StringData:='HDOC';
                      node:=fctvInformacoes.Items.AddChild(ndoc,
                        AE('Rubrica Normal',16)+': '+
                        inttostr(objCAPConvenio.idrubnormal));
                      node.StringData:='DRN';
                      if objCAPConvenio.idrubdevol > 0 then
                      begin
                        node:=fctvInformacoes.Items.AddChild(ndoc,
                          AE('Rubrica Devolução',16)+': '+
                          inttostr(objCAPConvenio.idrubdevol));
                        node.StringData:='DRD';
                      end;
                      node:=fctvInformacoes.Items.AddChild(ndoc,
                        AE('Data Pagamento',16)+': '+
                        formatdatetime('dd/mm/yyyy',objCAPConvenio.datapagto));
                      node.StringData:='DDT';
                      node:=fctvInformacoes.Items.AddChild(ndoc,
                        AE('Conta Baixa',16)+': '+
                        splacontanorm);
                      node.StringData:='DCB';

                      ssql:='select sum(valorprovento) as valor from histrubsal '+
                            'where mescobranca = '+QuotedStr(asMes)+' '+
                            'and idfavorecido = '+inttostr(objCAPConvenio.idfavorecido)+' '+
                            'and idrubrica = '+inttostr(objCAPConvenio.idrubnormal)+' '+
                            'and idmodulo = 18 '+
                            'and (flgestorno = 0 or flgestorno is null) '+
                            'and idhstfolhabenef is not null ';

                      case aiopcaobusca of
                      1: begin {sem abono}
                           ssql:=ssql+
                             ' and mes <> '+quotedstr(asMesAbono)+' ';
                         end;
                      2: begin {apenas abono}
                           ssql:=ssql+
                             ' and mes = '+quotedstr(asMesAbono)+' ';
                         end;
                      end;

                      if FazQuery(qryAux, ssql) then
                        objCAPConvenio.dvalorpghist:=qryAux.fieldbyname('valor').asfloat;
                      If objCapConvenio.Inatureza = 1 then
                        node:=fctvInformacoes.Items.AddChild(ndoc,
                          AE('Valor Processado a pagar',33)+' - '+
                          AD(floattostrf(objCAPConvenio.dvalorpghist,ffCurrency,18,2),18))
                      else
                        node:=fctvInformacoes.Items.AddChild(ndoc,
                          AE('Valor Processado a receber',33)+' - '+
                          AD(floattostrf(objCAPConvenio.dvalorpghist,ffCurrency,18,2),18));
                      node.StringData:='DVPP';
                      if objCAPConvenio.idrubdevol > 0 then
                      begin
                        ssql:='select sum(valorprovento) as valor from histrubsal '+
                              'where mescobranca = '+QuotedStr(asMes)+' '+
                              'and idfavorecido = '+inttostr(objCAPConvenio.idfavorecido)+' '+
                              'and idrubrica = '+inttostr(objCAPConvenio.idrubdevol)+' '+
                              'and idmodulo = 18 '+
                              'and (flgestorno = 0 or flgestorno is null) '+
                              'and idhstfolhabenef is not null ';
                        
                        case aiopcaobusca of
                        1: begin {sem abono}
                             ssql:=ssql+
                               ' and mes <> '+quotedstr(asMesAbono)+' ';
                           end;
                        2: begin {apenas abono}
                             ssql:=ssql+
                               ' and mes = '+quotedstr(asMesAbono)+' ';
                           end;
                        end;

                        if FazQuery(qryAux, ssql) then
                          objCAPConvenio.dvalordvhist:=qryAux.fieldbyname('valor').asfloat;
                      end;
                      node:=fctvInformacoes.Items.AddChild(ndoc,
                        AE('Valor Processado a devolver',33)+' - '+
                        AD(floattostrf(objCAPConvenio.dvalordvhist,ffCurrency,18,2),18));
                      node.StringData:='DVPP';
                      objCAPConvenio.dvalorliqhist:=
                        objCAPConvenio.dvalorpghist-objCAPConvenio.dvalordvhist;
                      If objCapConvenio.Inatureza = 1 then
                        node:=fctvInformacoes.Items.AddChild(ndoc,
                          AE('Valor Líquido Processado a pagar',33)+' - '+
                          AD(floattostrf(objCAPConvenio.dvalorliqhist,ffCurrency,18,2),18))
                      else
                        node:=fctvInformacoes.Items.AddChild(ndoc,
                          AE('Valor Líquido Processado a receber',33)+' - '+
                          AD(floattostrf(objCAPConvenio.dvalorliqhist,ffCurrency,18,2),18));

                      node.StringData:='DVPL';
                    end; 
                  end;
                end;
              end; //for lij:=0 to ListaCAPConvenio.count-1 do
            end;

            If lproccontinuado then
            begin
              for lij:=0 to ListaCAPConvenio_Continuado.count-1 do
              begin
                objCAPConvenio_Continuado:=(ListaCAPConvenio_Continuado.objects[lij] as tCAPConvenio_Continuado);
                nPosicao:= Pos('-',fctvInformacoes.Items[lnivel0].StringData);
                if (objCAPConvenio_Continuado.idfavorecido =
                   strtoint(copy(fctvInformacoes.Items[lnivel0].StringData,1,nposicao-1))) then
                begin
                  if objCAPConvenio.lstRubEmDoc.indexof(inttostr(objCAPConvenio.idrubnormal)) < 0 then
                  begin
                    objCAPConvenio.FlgGeraDOC:=true;
                    objCAPConvenio.lstRubEmDoc.add(inttostr(objCAPConvenio.idrubnormal));
                    if nconv = nil then
                    begin
                      If objCapConvenio_Continuado.Inatureza = 1 then
                      begin
                        nconv:=fctvInformacoes.Items.AddChild(fctvInformacoes.Items[lnivel0],
                          'Documentos a Pagar');
                        nconv.StringData:='CAP';
                      end
                      else
                      begin
                        nconv:=fctvInformacoes.Items.AddChild(fctvInformacoes.Items[lnivel0],
                          'Documentos a Receber');
                        nconv.StringData:='CAR';
                      end;
                    end;
                    inc(indoc);
                    ndoc:=fctvInformacoes.Items.AddChild(nconv,
                      'Documento '+inttostr(indoc));
                    ndoc.StringData:='HDOC';

                    if (Trim(objCAPConvenio_Continuado.Caracnatureza) = '') then
                    begin
                      node:=fctvInformacoes.Items.AddChild(ndoc,
                        AE('Rubrica Normal',16)+': '+
                        inttostr(objCAPConvenio_Continuado.idrubrica));
                      node.StringData:='DRN';
                    end
                    else
                    begin
                      node:=fctvInformacoes.Items.AddChild(ndoc,
                        AE('Rubrica Devolução',16)+': '+
                        inttostr(objCAPConvenio_Continuado.idrubrica));
                      node.StringData:='DRD';
                    end;
                    node:=fctvInformacoes.Items.AddChild(ndoc,
                      AE('Data Pagamento',16)+': '+
                      formatdatetime('dd/mm/yyyy',objCAPConvenio_Continuado.datapagto));
                    node.StringData:='DDT';
                    node:=fctvInformacoes.Items.AddChild(ndoc,
                      AE('Conta Baixa',16)+': '+
                      splacontanorm);
                    node.StringData:='DCB';

                    if (Trim(objCAPConvenio_Continuado.Caracnatureza) = '') then
                    begin
                      ssql:='select sum(valorprovento) as valor from histrubsal '+
                            'where mescobranca = '+QuotedStr(asMes)+' '+
                            'and idfavorecido = '+inttostr(objCAPConvenio_Continuado.idfavorecido)+' '+
                            'and idrubrica = '+inttostr(objCAPConvenio_Continuado.idrubrica)+' '+
                            'and idmodulo = 18 '+
                            'and (flgestorno = 0 or flgestorno is null) '+
                            'and idhstfolhabenef is not null ';

                      
                      case aiopcaobusca of
                      1: begin {sem abono}
                           ssql:=ssql+
                             ' and mes <> '+quotedstr(asMesAbono)+' ';
                         end;
                      2: begin {apenas abono}
                           ssql:=ssql+
                             ' and mes = '+quotedstr(asMesAbono)+' ';
                         end;
                      end;

                      if FazQuery(qryAux, ssql) then
                        objCAPConvenio_Continuado.dvalorpghist:=qryAux.fieldbyname('valor').asfloat;
                      If objCapConvenio_Continuado.Inatureza = 1 then
                        node:=fctvInformacoes.Items.AddChild(ndoc,
                          AE('Valor Processado a pagar',33)+' - '+
                          AD(floattostrf(objCAPConvenio_Continuado.dvalorpghist,ffCurrency,18,2),18))
                      else
                        node:=fctvInformacoes.Items.AddChild(ndoc,
                          AE('Valor Processado a receber',33)+' - '+
                          AD(floattostrf(objCAPConvenio_Continuado.dvalorpghist,ffCurrency,18,2),18));
                      node.StringData:='DVPP';
                    end;

                    if (Trim(objCAPConvenio_Continuado.Caracnatureza) <> '') then
                    begin
                      ssql:='select sum(valorprovento) as valor from histrubsal '+
                            'where mescobranca = '+QuotedStr(asMes)+' '+
                            'and idfavorecido = '+inttostr(objCAPConvenio_Continuado.idfavorecido)+' '+
                            'and idrubrica = '+inttostr(objCAPConvenio_Continuado.idrubrica)+' '+
                            'and idmodulo = 18 '+
                            'and (flgestorno = 0 or flgestorno is null) '+
                            'and idhstfolhabenef is not null ';

                      
                      case aiopcaobusca of
                      1: begin {sem abono}
                           ssql:=ssql+
                             ' and mes <> '+quotedstr(asMesAbono)+' ';
                         end;
                      2: begin {apenas abono}
                           ssql:=ssql+
                             ' and mes = '+quotedstr(asMesAbono)+' ';
                         end;
                      end;

                      if FazQuery(qryAux, ssql) then
                        objCAPConvenio_Continuado.dvalordvhist:=qryAux.fieldbyname('valor').asfloat;
                    end;
                    node:=fctvInformacoes.Items.AddChild(ndoc,
                      AE('Valor Processado a devolver',33)+' - '+
                      AD(floattostrf(objCAPConvenio_Continuado.dvalordvhist,ffCurrency,18,2),18));
                    node.StringData:='DVPP';

                    objCAPConvenio_Continuado.dvalorliqhist:=
                      objCAPConvenio_Continuado.dvalorpghist-
                      objCAPConvenio_Continuado.dvalordvhist;
                    If objCapConvenio_Continuado.Inatureza = 1 then
                      node:=fctvInformacoes.Items.AddChild(ndoc,
                        AE('Valor Líquido Processado a pagar',33)+' - '+
                        AD(floattostrf(objCAPConvenio_Continuado.dvalorliqhist,ffCurrency,18,2),18))
                    else
                      node:=fctvInformacoes.Items.AddChild(ndoc,
                        AE('Valor Líquido Processado a receber',33)+' - '+
                        AD(floattostrf(objCAPConvenio_Continuado.dvalorliqhist,ffCurrency,18,2),18));
                    node.StringData:='DVPL';
                  end; 
                end;
              end; //for lij:=0 to ListaCAPConvenio_Continuado.count-1 do
            end;
          end;
          inc(nTipo);
        until ntipo = 2;
      end;
      inc(lii);
    until lii = fctvInformacoes.Items.count;
  finally
  end;
end;

Function TfrmTratamentoConvenio.GravaLote(numLote, idlayout: longint;
  sMesref: String; Valtotal: Real ; RegTotal: longint; arqdescricao: String): Boolean;
Var sDescricao, sSQLValues: String;
begin
  sDescricao:='Execesso de Debito - '+arqdescricao;
  sSQlValues:= ''''+sMesref+''',';
  sSQlValues:= sSQLValues + '''B'',';
  sSQLValues:= sSQLValues +inttostr(iidFundacao)+',0,0,0,0,';
  sSQLValues:= sSQLValues + 'NULL,NULL,NULL,NULL,';
  sSQLValues:= sSQLValues + IntToStr(numLote)+',';
  sSQLValues:= sSQLValues + IntToStr(RegTotal)+',';
  sSQLValues:= sSQLValues + Oranumero(FloatToStr(ValTotal))+',';
  sSQLValues:= sSQLValues + 'NULL,NULL,0,'''+sDescricao+''',NULL,'+inttostr(idLayout);
  qryLote.Close;
  qryLote.SQL.Clear;
  qryLote.SQL.Add(
    'INSERT INTO CTRLINTERFACE ' +
    '(MESREFERENCIA,TIPO,IDPESSOA,FLGIDATMP,FLGVOLTATMP,FLGIDAINTERFACE,'+
    'FLGVOLTAINTERFACE,DATAIDATMP,DATAVOLTATMP,DATAIDAINTERFACE,'+
    'DATAVOLTAINTERFA,IDLOTE,NUMREG,VLRTOTAL,FLGEMITIUCC,DATAEMITIUCC,'+
    'FLGPREPARADO,DESCRICAO,DATAPREPARO,IDREFERENCIA)' +
    ' VALUES (' + sSQLValues + ')');
  try
    qryLote.execsql;
    result:= true;
  except
    result:= false;
  end;
end;

function TfrmTratamentoConvenio.VerificaContabil(iIdPessjur,iIdRubrica,iIdPlanoprev: Integer): Boolean;
begin
  with qryRubricaXPlano do
  begin
    Close;
    ParamByName('IDPESSJUR').AsInteger:= iidpessjur;
    ParamByName('IDRUBRICA').AsInteger:= iidrubrica;
    ParamByName('IDPLANOPREV').AsInteger:= iidplanoprev;
    try
      Open;
      result:= true;
    except
      result:= false;
    end;
  end;
end;

procedure TfrmTratamentoConvenio.InsereContabil(qry: twwquery; var ssql: string);
begin
  //CODCENTRORESPON
  if not qry.fieldbyname('CODCENTRORESPON').isnull then
    ssql:=ssql+QuotedStr(qry.fieldbyname('CODCENTRORESPON').AsString)+', '
  else
    ssql:=ssql+'NULL, ';
  //UNIDNEGOC
  if not qry.fieldbyname('UNIDNEGOC').isnull then
    ssql:=ssql+inttostr(qry.fieldbyname('UNIDNEGOC').AsInteger)+', '
  else
    ssql:=ssql+'NULL, ';
  //CODTIPRECDES
  if not qry.fieldbyname('CODTIPRECDES').isnull then
    ssql:=ssql+QuotedStr(qry.fieldbyname('CODTIPRECDES').AsString)+', '
  else
    ssql:=ssql+'NULL, ';
  //RECPAG
  if not qry.fieldbyname('RECPAG').isnull then
    ssql:=ssql+QuotedStr(qry.fieldbyname('RECPAG').AsString)+', '
  else
    ssql:=ssql+'NULL, ';
  //PLACONTAD
  if not qry.fieldbyname('PLACONTAD').isnull then
    ssql:=ssql+QuotedStr(qry.fieldbyname('PLACONTAD').AsString)+', '
  else
    ssql:=ssql+'NULL, ';
  //PLANO
  if not qry.fieldbyname('PLANO').isnull then
    ssql:=ssql+inttostr(qry.fieldbyname('PLANO').AsInteger)+', '
  else
    ssql:=ssql+'NULL, ';
  //PLACONTAC
  if not qry.fieldbyname('PLACONTAC').isnull then
    ssql:=ssql+QuotedStr(qry.fieldbyname('PLACONTAC').AsString)+') '
  else
    ssql:=ssql+'NULL) ';
end;

procedure TfrmTratamentoConvenio.bbtnConfirmarClick(Sender: TObject);
var bcomerro: boolean;
    iNumLancto, lii, iprocconv, iMes, iAno: integer;
    snomefav, ssqlvalues, ssql, sNoDocumento, smes, smesIndiv: string;
    objCAPConvenio: tCAPConvenio;
    objCAPConvenio_Continuado: tCAPConvenio_Continuado;
    liseq, liCodForma, lidContaBancaria: integer; 
    licoddocumento: integer; 

  Function FRetornaSeqRubIndiv: String;
  begin
    qryAux3.Close;
    qryAux3.SQL.Clear;
    qryAux3.SQL.Add(
      ' SELECT MAX(SEQRUBRICAINDIV) AS SEQRUBRICAINDIV '+
      ' FROM RUBRICAINDIV '+
      ' WHERE IDTITULAR = ' + inttoStr(qryAux2.fieldbyname('IDTITULAR').asInteger)+
      ' AND IDEMPRESA   = ' + IntToStr(qryAux2.fieldbyname('IDEMPRESA').asInteger)+
      ' AND IDRUBRICA   = ' + IntToStr(qryAux2.fieldbyname('IDRUBRICA').asInteger));
    qryAux3.Open;
    if (not qryAux3.IsEmpty) and
       (qryAux3.FieldByName('SEQRUBRICAINDIV').AsInteger > 0 ) then
      result:=IntToStr(qryAux3.FieldByName('SEQRUBRICAINDIV').AsInteger + 1)
    else
      result:='1';
    qryAux3.Close;
  end;

  procedure InsereRubricaindiv;
  var ssqlRubIndiv: String;
  begin
    imes:=cmbMes.ItemIndex+1;
    inc(imes);
    iano:=strtoint(spnedAno.Text);
    if imes > 12 then
    begin
      imes:=1;
      inc(iano);
    end;
    If iMes > 9 then
      sMesIndiv:= IntToStr(iMes)
    else
      sMesIndiv:= '0'+Inttostr(iMes);

    iidLoterubricaindiv:=LeUltRegistro(nil,'CTRLINTERFACE');
    GravaLote(iidLoteRubricaindiv, qryAux2.fieldbyname('IDREFERENCIA').asinteger,
      InttoStr(iano)+'/'+sMesIndiv, 0,
      qryAux2.recordcount,qryAux2.fieldbyname('DESCRICAO').asstring);

    ssqlRubIndiv:= 'INSERT INTO RUBRICAINDIV (IDPESSOA, IDEMPRESA, '+
                    'IDRUBRICA, NUMOCORRENCIAS, SEQRUBRICAINDIV, VALORRUBRICA, FLGPERMANENTE, '+
                    'PARCELAS, FLGTPRUBMANUT, ANOMESREF, IDTITULAR, IDLOTE, '+
                    'IDFAVORECIDO, FLGPERCENT, FLGPENSAOALIM, '+
                    'RUBRICAPROVENTOPA, FLGBASEPA, '+
                    'FLGUSAABONO, IDALIMENTADO,'+
                    'IDSEQINTERNOFB '+ 
                    ' ) VALUES (';
    //IDPESSOA
    ssqlRubIndiv:=SSQLRUBINDIV+inttostr(qryAux2.fieldbyname('IDPESSOA').asInteger)+', ';
    //IDEMPRESA
    ssqlRubIndiv:=SSQLRUBINDIV+inttostr(qryAux2.fieldbyname('IDEMPRESA').asInteger)+', ';
    //IDRUBRICA
    ssqlRubIndiv:=SSQLRUBINDIV+inttostr(qryAux2.fieldbyname('IDRUBRICA').asInteger)+', ';
    // NUMOCORRENCIAS
    ssqlRubIndiv:=SSQLRUBINDIV+'0, ';
    // SEQRUBRICAINDIV
    ssqlRubIndiv:=SSQLRUBINDIV+FRetornaSeqRubIndiv+', ';
    //VALORRUBRICA
    SSQLRUBINDIV:=SSQLRUBINDIV+
      oranumero(formatfloat('#0.00',
        ((qryAux2.fieldbyname('VALORPROVENTO').asFloat)-
         (qryAux2.fieldbyname('VALORRECEBIDO').asFloat))))+', ';
    // FLGPERMANENTE
    ssqlRubIndiv:=SSQLRUBINDIV+'0, ';
    // PARCELAS
    ssqlRubIndiv:=SSQLRUBINDIV+'1, ';
    // FLGTPRUBMANUT
    ssqlRubIndiv:=SSQLRUBINDIV+'1, ';
    // ANOMESREF
    SSQLRUBINDIV:=SSQLRUBINDIV+QuotedStr(InttoStr(iano)+'/'+sMesIndiv)+', ';
    // IDTITULAR
    ssqlRubIndiv:=SSQLRUBINDIV+
      inttostr(qryAux2.fieldbyname('IDTITULAR').asInteger)+', ';
    // IDLOTE
    SSQLRUBINDIV:=SSQLRUBINDIV+inttostr(iidLOTErubricaindiv)+', ';
    // IDFAVORECIDO
    ssqlRubIndiv:=SSQLRUBINDIV+
      inttostr(qryAux2.fieldbyname('IDFAVORECIDO').asinteger)+', ';
    // FLGPERCENT
    ssqlRubIndiv:=SSQLRUBINDIV+'0, ';
    // FLGPENSAOALIM
    ssqlRubIndiv:=SSQLRUBINDIV+'0, ';
    // RUBRICAPROVENTOPA
    ssqlRubIndiv:=SSQLRUBINDIV+'0, ';
    // FLGBASEPA
    ssqlRubIndiv:=SSQLRUBINDIV+'0, ';
    // FLGUSAABONO
    ssqlRubIndiv:=SSQLRUBINDIV+'0, ';
    // IDALIMENTADO
    ssqlRubIndiv:=SSQLRUBINDIV+'0,'+
    //IDSEQINTERNOFB
      inttostr(LeUltRegistro(nil, 'SEQINTERNOFB'))+ 
    ')';
    qryTmpdesc.close;
    qryTmpdesc.sql.clear;
    qryTmpdesc.sql.add(ssqlRubIndiv);
    qryTmpDesc.execsql;
  end;

  procedure InsereTmpDesc;
  var ssqltmpdesc: String;
  begin
    imes:=cmbMes.ItemIndex+1;
    inc(imes);
    iano:=strtoint(spnedAno.Text);
    if imes > 12 then
    begin
      imes:=1;
      inc(iano);
    end;
    If iMes > 9 then
      sMesIndiv:= IntToStr(iMes)
    else
      sMesIndiv:= '0'+Inttostr(iMes);

    iidLotetmpdesc:=LeUltRegistro(nil,'CTRLINTERFACE');
    GravaLote(iidLotetmpdesc, qryAux2.fieldbyname('IDREFERENCIA').asinteger,
               InttoStr(iano)+'/'+sMesIndiv, 0 ,qryAux2.recordcount,qryAux2.fieldbyname('DESCRICAO').asstring);

    ssqlTmpdesc:='INSERT INTO TMPDESC (IDPESSJUR, IDPLANOPREV, '+
                 'IDTMPDESC, '+
                 'IDTITULAR, IDPESSOA, IDFAVORECIDO, IDPROVENTO, IDMOTIVO, '+
                 'MESCOBRANCA, MESREFERENCIA, ORDEM, FLGTIPODESC, VALOR, '+
                 'VALORINFO, FLGDESCFOLHA, IDFUNDACAO, SISTORIGEM, IDMODULO, IDLOTE, '+
                 'SITENVIO, SEQPROPOSTA, REFERENCIA, '+
                 'IDSEQINTERNOFB, '+ 
                 'CODCENTRORESPON, UNIDNEGOC, '+
                 'CODTIPRECDES, RECPAG, PLACONTAD, PLANO, PLACONTAC '+
                 ') VALUES (';

    //IDPESSJUR
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(qryAux2.fieldbyname('IDPESSJUR').asInteger)+', ';
    //IDPLANOPREV
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(qryAux2.fieldbyname('IDPLANOPREV').asInteger)+', ';
    //IDTMPDESC
    sSqlTmpDesc:= sSqlTmpDesc + IntToStr(LeUltRegistro(Nil, 'TMPDESC')) + ', ';
    //IDTITULAR
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(qryAux2.fieldbyname('IDTITULAR').asInteger)+', ';
    //IDPESSOA
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(qryAux2.fieldbyname('IDPESSOA').asInteger)+', ';
    //IDFAVORECIDO
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(qryaux2.fieldbyname('IDFAVORECIDO').asinteger)+', ';
    //IDPROVENTO
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(qryAux2.fieldbyname('IDPROVENTO').asInteger)+', ';
    //IDMOTIVO
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(prmIDMOTIVOFOLHABEN)+', ';
    //MESCOBRANCA
    ssqlTmpdesc:=ssqlTmpdesc+QuotedStr(InttoStr(iano)+'/'+sMesIndiv)+', ';
    //MESREFERENCIA
    ssqlTmpdesc:=ssqlTmpdesc+QuotedStr(InttoStr(iano)+'/'+InttoStr(iMes))+', ';
    //ORDEM
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(1)+', ';
    //FLGTIPODESC
    ssqlTmpdesc:=ssqlTmpdesc+QuotedStr('C')+', ';
    //VALOR
    ssqltmpdesc:=ssqltmpdesc+
      oranumero(formatfloat('#0.00',
        ((qryAux2.fieldbyname('VALORPROVENTO').asFloat)-
         (qryAux2.fieldbyname('VALORRECEBIDO').asFloat))))+', ';
    //VALORINFO
    ssqlTmpdesc:=ssqlTmpdesc+oranumero(formatfloat('#0.00', 0))+', ';
    //FLGDESCFOLHA
    ssqlTmpdesc:=ssqlTmpdesc+QuotedStr('B')+', ';
    //IDFUNDACAO
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(iidfundacao)+', ';
    //SISTORIGEM
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(Sistema.IdModulo)+', ';
    //IDMODULO
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(Sistema.IdModulo)+', ';
    //IDLOTE
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(iidLOTEtmpdesc)+', ';
    //SITENVIO
    ssqlTmpdesc:=ssqlTmpdesc+QuotedStr('0')+', ';
    //SEQPROPOSTA
    ssqlTmpdesc:=ssqlTmpdesc+inttostr(1)+', ';
    //REFERENCIA
    ssqlTmpdesc:=ssqlTmpdesc+'''***'', ';
    ssqlTmpdesc:=ssqlTmpdesc+
      inttostr(LeUltRegistro(nil, 'SEQINTERNOFB'))+','; 
    if VerificaContabil(qryAux2.fieldbyname('IDPESSJUR').asInteger,
         qryAux2.fieldbyname('IDPROVENTO').asInteger,
         qryAux2.fieldbyname('IDPLANOPREV').asInteger) then
      InsereContabil(qryRubricaXPlano, ssqlTmpdesc);
    qryTmpdesc.close;
    qryTmpdesc.sql.clear;
    qryTmpdesc.sql.add(ssqlTmpDesc);
    qryTmpDesc.execsql;
  end;

begin
  inherited;
  If Trim(dtpDtLancamento.Text) = '' Then
    dtpDtLancamento.Date := Date;

  iidlotetmpdesc:= 0;
  iidloterubricaindiv:= 0;

  pnlParametros.enabled:=false;
  bbtnConfirmar.enabled:=false;
  bcomerro:=true;

  if cmbMes.ItemIndex <= 8 then
    sMes:=spnedAno.Text+'/0'+IntToStr(cmbMes.ItemIndex+1)
  else
    sMes:=spnedAno.Text+'/'+IntToStr(cmbMes.ItemIndex+1);

  if MsgDlg('Pronto para iniciar o processo. '+#13+
            'Confirma ? (S/N) ',
            'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes then
  begin
    memResult.lines.clear;
    iprocconv:=LeUltRegistro(nil,'PROCESSOCONVENIO');
    if iprocconv > 0 then
    begin
      try
        dtmBaseDados.dbBaseDados.StartTransaction;
        try
          //GERAÇÃO DO EXCESSO DE DEBITO
          // convenios continuados
          If ListaCAPConvenio_Continuado.count > 0 then
          begin
            liseq:=0; 
            for lii:=0 to ListaCAPConvenio_Continuado.count-1 do
            begin
              objCAPConvenio_Continuado:=(ListaCAPConvenio_Continuado.objects[lii] as tCAPConvenio_Continuado);
              If objCAPConvenio_Continuado.trataresiduo = 1 then
              begin
                
                case cbboxAbono.itemindex of
                0: begin {com abono}
                     ssql:=ssql+
                       'select h.valorprovento, h.valorrecebido, ri.idpessoa, ri.idrubrica, '+_clinefeed+
                       '       ri.idempresa, ri.IDTITULAR, ri.IDFAVORECIDO, ri.FLGPERCENT, '+_clinefeed+
                       '       ri.FLGPENSAOALIM, ri.DATAINICIO, c.IDREFERENCIA, c.descricao '+_clinefeed+
                       'from histrubsal h, rubricaindiv ri, ctrlinterface c '+_clinefeed+
                       'where h.mescobranca = '+QuotedStr(sMes)+' '+_clinefeed+
//                       'and (flgestorno = 0 or flgestorno is null) '+_clinefeed+   //Everson TIBERO
                       'and (h.flgestorno = 0 or h.flgestorno is null) '+_clinefeed+ //Everson TIBERO
                       'and h.idfavorecido = '+inttostr(objCAPConvenio_Continuado.idfavorecido)+' '+_clinefeed+
                       'and h.idrubrica = '+inttostr(objCAPConvenio_Continuado.idrubrica)+' '+_clinefeed+
                       'and h.idmodulo = 18 '+_clinefeed+
                       'and h.valorrecebido <> h.valorprovento '+_clinefeed+
                       'and h.idhstfolhabenef is not null ' +_clinefeed+
                       'and h.idfavorecido = ri.idfavorecido '+_clinefeed+
                       'and h.idpessoa = ri.idpessoa '+_clinefeed+
                       'and h.idrubrica = ri.idrubrica '+_clinefeed+
                       'and h.mescobranca = ri.anomesref '+_clinefeed+
                       'and h.idtitular = ri.idtitular '+_clinefeed+
                       'and ri.flgtprubmanut = 1 '+_clinefeed+
                       'and ri.idlote = c.idlote '+_clinefeed;
                   end;
                1: begin {sem abono}
                     ssql:=ssql+
                       'select h.valorprovento, h.valorrecebido, ri.idpessoa, ri.idrubrica, '+_clinefeed+
                       '       ri.idempresa, ri.IDTITULAR, ri.IDFAVORECIDO, ri.FLGPERCENT, '+_clinefeed+
                       '       ri.FLGPENSAOALIM, ri.DATAINICIO, c.IDREFERENCIA, c.descricao '+_clinefeed+
                       'from histrubsal h, rubricaindiv ri, ctrlinterface c '+_clinefeed+
                       'where h.mescobranca = '+QuotedStr(sMes)+' '+_clinefeed+
//                       'and (flgestorno = 0 or flgestorno is null) '+_clinefeed+   //Everson TIBERO
                       'and (h.flgestorno = 0 or h.flgestorno is null) '+_clinefeed+ //Everson TIBERO
                       'and h.idfavorecido = '+inttostr(objCAPConvenio_Continuado.idfavorecido)+' '+_clinefeed+
                       'and h.idrubrica = '+inttostr(objCAPConvenio_Continuado.idrubrica)+' '+_clinefeed+
                       'and h.idmodulo = 18 '+_clinefeed+
                       'and h.mes <> '+quotedstr(gsMesAbono)+' '+_clinefeed+
                       'and h.valorrecebido <> h.valorprovento '+_clinefeed+
                       'and h.idhstfolhabenef is not null ' +_clinefeed+
                       'and h.idfavorecido = ri.idfavorecido '+_clinefeed+
                       'and h.idpessoa = ri.idpessoa '+_clinefeed+
                       'and h.idrubrica = ri.idrubrica '+_clinefeed+
                       'and h.mescobranca = ri.anomesref '+_clinefeed+
                       'and h.idtitular = ri.idtitular '+_clinefeed+
                       'and ri.flgtprubmanut = 1 '+_clinefeed+
                       'and ri.idlote = c.idlote '+_clinefeed;
                   end;
                2: begin {apenas abono}
                     ssql:=ssql+
                       'select h.valorprovento, h.valorrecebido, ri.idpessoa, ri.idrubrica, '+_clinefeed+
                       '       ri.idempresa, ri.IDTITULAR, ri.IDFAVORECIDO, ri.FLGPERCENT, '+_clinefeed+
                       '       ri.FLGPENSAOALIM, ri.DATAINICIO, c.IDREFERENCIA, c.descricao '+_clinefeed+
                       'from histrubsal h, rubricaindiv ri, ctrlinterface c '+_clinefeed+
                       'where h.mescobranca = '+QuotedStr(sMes)+' '+_clinefeed+
//                     'and (flgestorno = 0 or flgestorno is null) '+_clinefeed+     //Everson TIBERO
                       'and (h.flgestorno = 0 or h.flgestorno is null) '+_clinefeed+ //Everson TIBERO
                       'and h.idfavorecido = '+inttostr(objCAPConvenio_Continuado.idfavorecido)+' '+_clinefeed+
                       'and h.idrubrica = '+inttostr(objCAPConvenio_Continuado.idrubrica)+' '+_clinefeed+
                       'and h.idmodulo = 18 '+_clinefeed+
                       'and h.mes = '+quotedstr(gsMesAbono)+' '+_clinefeed+
                       'and h.valorrecebido <> h.valorprovento '+_clinefeed+
                       'and h.idhstfolhabenef is not null ' +_clinefeed+
                       'and h.idfavorecido = ri.idfavorecido '+_clinefeed+
                       'and h.idpessoa = ri.idpessoa '+_clinefeed+
                       'and h.idrubrica = ri.idrubrica '+_clinefeed+
                       'and h.mescobranca = ri.anomesref '+_clinefeed+
                       'and h.idtitular = ri.idtitular '+_clinefeed+
                       'and ri.flgtprubmanut = 1 '+_clinefeed+
                       'and ri.idlote = c.idlote '+_clinefeed;
                   end;
                end;

                if FazQuery(qryAux2, ssql) then
                begin
                  while not qryAux2.eof do
                  begin
                    InsereRubricaindiv;
                    qryAux2.Next;
                  end;
                end;
              end;
            end;
          end;
          // convenios avulsos
          If ListaCAPConvenio.count > 0 then
          begin
            for lii:=0 to ListaCAPConvenio.count-1 do
            begin
              objCAPConvenio:=(ListaCAPConvenio.objects[lii] as tCAPConvenio);
              If objCAPConvenio.trataresiduo = 1 then
              begin
                
                case cbboxAbono.itemindex of
                0: begin {com abono}
                     ssql:=ssql+
                       'select h.valorprovento, h.valorrecebido, c.idreferencia, c.descricao, t.idprovento, '+_clinefeed+
                       '       t.idpessjur, t.idplanoprev, t.idtitular, t.idpessoa, t.idfavorecido, '+_clinefeed+
                       '       t.idprovento, t.idmotivo, t.mescobranca, t.mesreferencia, t.flgtipodesc, '+_clinefeed+
                       '       t.flgdescfolha, t.idfundacao, t.seqproposta '+_clinefeed+
                       'from histrubsal h, tmpdesc t, ctrlinterface c '+_clinefeed+
                       'where h.mescobranca = '+QuotedStr(sMes)+' '+_clinefeed+
//                       'and (flgestorno = 0 or flgestorno is null) '+_clinefeed+   //Everson TIBERO
                       'and (h.flgestorno = 0 or h.flgestorno is null) '+_clinefeed+ //Everson TIBERO
                       'and h.idfavorecido = '+inttostr(objCAPConvenio.idfavorecido)+' '+_clinefeed+
                       'and h.idrubrica = '+inttostr(objCAPConvenio.idrubnormal)+' '+_clinefeed+
                       'and h.idmodulo = 18 '+_clinefeed+
                       'and h.valorrecebido <> h.valorprovento '+_clinefeed+
                       'and h.idhstfolhabenef is not null '+_clinefeed+
                       'and h.idfavorecido = t.idfavorecido '+_clinefeed+
                       'and h.idpessoa = T.idpessoa '+_clinefeed+
                       'and h.idrubrica = t.idprovento '+_clinefeed+
                       'and h.mescobranca = t.mescobranca '+_clinefeed+
                       'and h.idtitular = t.idtitular '+_clinefeed+
                       'and t.idlote = c.idlote '+_clinefeed;
                   end;
                1: begin {sem abono}
                     ssql:=ssql+
                       'select h.valorprovento, h.valorrecebido, c.idreferencia, c.descricao, t.idprovento, '+_clinefeed+
                       '       t.idpessjur, t.idplanoprev, t.idtitular, t.idpessoa, t.idfavorecido, '+_clinefeed+
                       '       t.idprovento, t.idmotivo, t.mescobranca, t.mesreferencia, t.flgtipodesc, '+_clinefeed+
                       '       t.flgdescfolha, t.idfundacao, t.seqproposta '+_clinefeed+
                       'from histrubsal h, tmpdesc t, ctrlinterface c '+_clinefeed+
                       'where h.mescobranca = '+QuotedStr(sMes)+' '+_clinefeed+
//                       'and (flgestorno = 0 or flgestorno is null) '+_clinefeed+   //Everson TIBERO
                       'and (h.flgestorno = 0 or h.flgestorno is null) '+_clinefeed+ //Everson TIBERO
                       'and h.idfavorecido = '+inttostr(objCAPConvenio.idfavorecido)+' '+_clinefeed+
                       'and h.idrubrica = '+inttostr(objCAPConvenio.idrubnormal)+' '+_clinefeed+
                       'and h.idmodulo = 18 '+_clinefeed+
                       'and h.mes <> '+quotedstr(gsMesAbono)+' '+_clinefeed+
                       'and h.valorrecebido <> h.valorprovento '+_clinefeed+
                       'and h.idhstfolhabenef is not null '+_clinefeed+
                       'and h.idfavorecido = t.idfavorecido '+_clinefeed+
                       'and h.idpessoa = T.idpessoa '+_clinefeed+
                       'and h.idrubrica = t.idprovento '+_clinefeed+
                       'and h.mescobranca = t.mescobranca '+_clinefeed+
                       'and h.idtitular = t.idtitular '+_clinefeed+
                       'and t.idlote = c.idlote '+_clinefeed;
                   end;
                2: begin {apenas abono}
                     ssql:=ssql+
                       'select h.valorprovento, h.valorrecebido, c.idreferencia, c.descricao, t.idprovento, '+_clinefeed+
                       '       t.idpessjur, t.idplanoprev, t.idtitular, t.idpessoa, t.idfavorecido, '+_clinefeed+
                       '       t.idprovento, t.idmotivo, t.mescobranca, t.mesreferencia, t.flgtipodesc, '+_clinefeed+
                       '       t.flgdescfolha, t.idfundacao, t.seqproposta '+_clinefeed+
                       'from histrubsal h, tmpdesc t, ctrlinterface c '+_clinefeed+
                       'where h.mescobranca = '+QuotedStr(sMes)+' '+_clinefeed+
//                       'and (flgestorno = 0 or flgestorno is null) '+_clinefeed+     //Everson TIBERO
                       'and (h.flgestorno = 0 or h.flgestorno is null) '+_clinefeed+   //Everson TIBERO
                       'and h.idfavorecido = '+inttostr(objCAPConvenio.idfavorecido)+' '+_clinefeed+
                       'and h.idrubrica = '+inttostr(objCAPConvenio.idrubnormal)+' '+_clinefeed+
                       'and h.idmodulo = 18 '+_clinefeed+
                       'and h.mes = '+quotedstr(gsMesAbono)+' '+_clinefeed+
                       'and h.valorrecebido <> h.valorprovento '+_clinefeed+
                       'and h.idhstfolhabenef is not null '+_clinefeed+
                       'and h.idfavorecido = t.idfavorecido '+_clinefeed+
                       'and h.idpessoa = T.idpessoa '+_clinefeed+
                       'and h.idrubrica = t.idprovento '+_clinefeed+
                       'and h.mescobranca = t.mescobranca '+_clinefeed+
                       'and h.idtitular = t.idtitular '+_clinefeed+
                       'and t.idlote = c.idlote '+_clinefeed;
                   end;
                end;

                if FazQuery(qryAux2, ssql) then
                begin
                  while not qryAux2.eof do
                  begin
                    InsereTmpdesc;
                    qryAux2.Next;
                  end;
                end;
              end;
            end;
          end;

          //gravar tabela principal do tratamento de convênio PROCESSOCONVENIO

          If cbboxAbono.itemindex = 2 Then begin
             sSQL := 'INSERT INTO PROCESSOCONVENIO ( IDPROCCONV, MES, DESCRICAO ) ' +
                     'VALUES (' + inttostr(iprocconv) + ', ' + QuotedStr(gsMesAbono) + ', ' +
                     QuotedStr('Fechamento de Convênio de abono de ' + Copy(gsMesAbono, 1,4) ) + ' )'
          end
          Else begin
             sSQL := 'INSERT INTO PROCESSOCONVENIO ( IDPROCCONV, MES, DESCRICAO ) ' +
                     'VALUES (' + inttostr(iprocconv) + ', ' + QuotedStr(sMes) + ', ' +
                     QuotedStr('Fechamento de Convênio do mês ' + sMes ) + ' )'
          end;

          if not ExecutarQuery(qryAux, sSQL) then
             exit;

           //gravar tabela de contas a pagar do tratamento de convênio PROCCONVENIODOC
          // convenios avulsos
          If ListaCAPConvenio.count > 0 then
          begin
            for lii:=0 to ListaCAPConvenio.count-1 do
            begin
              
              CtrlDocumento.Prepare(OpDocumento,odlEfetivo);
              CtrlDocumento.IdEspAcesso:=Sistema.IdEspAcesso;
              CtrlDocumento.IdUsuario:=Sistema.IdUsuario;

              objCAPConvenio:=(ListaCAPConvenio.objects[lii] as tCAPConvenio);
              //CONTROLA QUAIS GERAM DOCUMENTO, POIS PODEM EXISTIR
              //   VÁRIOS LAYOUTS NA MESMA RUBRICA QUE SÃO SOMADOS NO DOCUMENTO
              if (objCAPConvenio.FlgGeraDOC) And (objCAPConvenio.dvalorliqhist > 0) then 
              begin
                // So vai gerar CAP para os convenios com geração automática
                If ((objCapConvenio.GeraCap = 0) and
                   (objCapConvenio.inatureza = 1)) then
                begin
                  //incluir favorecido na tabela de fornecedor se não existir
                  if not FazQuery(qryAux,'SELECT IDPESSOA FROM FORNSERV '+
                           'WHERE IDPESSOA = '+inttostr(objCAPConvenio.idfavorecido)) then
                  begin
                    if qryAux.isempty then
                      CtrlDocumento.ForCli.Inserir(
                        objCAPConvenio.idfavorecido, Sistema.IdEmpresa,
                        -1, IntegraBack.Plano, prmIdRamoTipoFor,
                        '', '', '', '', tfcCliente);
                  end;

                  //grava documento, lançamento e rateio
                  inc(liseq);
                  sNoDocumento := copy(smes,1,4) + copy(smes,6,2) + inttostr(trunc(date)) +
                    inttostr(liseq)+
                    IntToStr(iprocconv)+inttostr(objCAPConvenio.idfavorecido);
                  lidContaBancaria:=0;

                  try
                    ssql := 'SELECT IDCBANCARIA FROM CONTABANCARIA WHERE (IDPESSOA = '+
                            inttoStr(objCAPConvenio.idfavorecido)+') AND (FLGCONTAPREF = 1)';
                    if FazQuery(qryAux, ssql) then
                      lidContaBancaria:=qryAux.fields[0].asinteger;
                  except end;
                  
                  try
                    ssql:=
                      'SELECT CODFORMA FROM PORTADORFORMA '+
                      'WHERE CODPORTFORMA = '+inttostr(objCAPConvenio.iPortFormaCAP);
                    if FazQuery(qryAux, ssql) then
                      liCodForma:=qryAux.fields[0].asinteger;
                  except
                  end;

                  If Sistemafolha.FLGINTEGRAFINANC = 1 then
                  begin
                    licoddocumento:=CtrlDocumento.GetSequenceDocumento; 

                    CtrlDocumento.SetValues(
                      licoddocumento, //coddocumento
                      licoddocumento, //nodocumento
                      '',  //scompldocumento
                      '0', // sStatus
                      'P', // recpag
                      '2', // sOperacao
                      '',  //sNumslip,
                      '',  //sNumleitcodbarras,
                      objCAPConvenio.splaconta, //sPlaconta,
                      '',  //sCodcentrocusto,
                      '',  //sNossonumero,
                      '',  //sNumdigcodbarras,
                      '',  //sGrupodoc,
                      '',  //sFlgemitelancbaix,
                      '',  //sFlgconfirmarecpag,
                      '',  //sEmisbloq,
                      '',  //sReferencia,
                      '',  //sObs
                      objCAPConvenio.datapagto, //DATA VENCIMENTO
                      date, // DataEmissao
                      objCAPConvenio.datapagto, //DATA PROGRAMADA
                      0,  //dDataremessa,
                      0,  //dDatalimite,
                      0,  //dDatacorrecao,
                      0,  //rVlrmulta,
                      0,  //rValorjuros,
                      0,  //rValordesconto,
                      0,  //rPercjurossimples,
                      0,  //rPercjurosatuarial
                      SistemaFolha.TipDocConvP, //liCodtipdoc,
                      Sistema.IdEmpresa, //liIdpessoa,
                      Sistema.idmodulo, //liIdmodulo,
                      objCAPConvenio.idfavorecido, //liIdforcli,
                      0, //liNumfatura,
                      lidContaBancaria, //liIdcbancaria,
                      prmUnidNegoc, //-1, //liUnidnegoc, 
                      IntegraBack.Plano, //liPlano,
                      0, //liNumcpbaixa,
                      0, //liNumapgr,
                      0, //liMoecodigo,
                      0, //liLotetransmissao,
                      0, //liIndicecorrecao,
                      Sistema.Idusuario, //liIdusuarioinclusao,
                      Sistema.IdEmpresa, //liIdempresa,
                      0, //liFlgnaoconciliado,
                      0, //liControleremessa,
                      0, //liCodsubconta,
                      objCAPConvenio.iPortFormaCAP, //liCodportforma,
                      0, //liCodgrupocnab,
                      0, //liCodgeradorinss,
                      licodforma //liCodforma
                      );

                    if FazQuery(qryAux,
                         'SELECT NOME FROM PESSOA '+
                         'WHERE IDPESSOA = '+
                         inttostr(objCAPConvenio.idfavorecido)) then
                      sNomeFav:=qryAux.fields[0].asstring;

                    CtrlDocumento.Lanctodocum.SetValues(
                      dtpDtLancamento.Date, //dDatalancto
                      0, //liCoddocumento,
                      0, //liNumlancto
                      objCAPConvenio.dvalorliqhist, //rVlrliquido,
                      0, //rValorOM
                      objCAPConvenio.dvalorliqhist, //rValor
                      prmUnidNegoc, //-1, //liUnidnegoc, 
                      -1, //liPlncodigo
                      0, //liNumlotemanual,
                      Sistema.Idusuario, //liIdusuarioinclusao,
                      Sistema.IdEmpresa, //liIdempresa,
                      0, //liIdnflivro,
                      0, //liEstorno,
                      0, //liCodtipdoc,
                      0, //liCoddocinss,
                      0, //liCodalterador
                      '2', //sOperacao,
                      '', //sNumrecibo,
                      '', //sNumnf,
                      '', //sNumfatura,
                      copy('Pagto Convênio: '+sNomeFav, 1, 60), //sHistoricocompl,
                      '', //sFlgtipofatura,
                      '', //sFlgrecebeunf,
                      '', //sFlgfatemitida,
                      'C', //sDebcre
                      Sistema.idmodulo, //liIdModulo
                      IntegraBack.Plano, //liPlanoConta
                      true, //bUsaPlanoPatro
                      false, //bContabiliza
                      0, //iCodPortForma,
                      0, //iDiasFloat
                      '', //splacontabaixa,
                      0 //liSubContaBaixa
                      );

                    //consulta para pegar rateio
                    ssql:='select sum(decode(p.flgdesconto,1, '+
                          'h.valorprovento,0,-h.valorprovento,0)) as valor, '+
                          'pi.idplanprevcontab, h.idpatro, '+
                          'nvl(r.codtiprecdesfav,0) as codtiprecdesfav, '+
                          'nvl(r.unidnegoc,0) as unidnegoc, '+
                          'nvl(r.codcentrorespon,''9999999999'') as codcentrorespon '+
                          'from histrubsal h, rubricaxplano r, provdesc p, perfilinvest pi '+
                          'where h.mescobranca = '+QuotedStr(sMes)+' '+
                          'and h.idperfilinvest = pi.idperfilinvest '+
//                          'and (flgestorno = 0 or flgestorno is null) '+  //Everson TIBERO
                          'and (h.flgestorno = 0 or h.flgestorno is null) '+//Everson TIBERO
                          'and h.idfavorecido = '+inttostr(objCAPConvenio.idfavorecido)+' ';

                    ssql:=ssql+'and h.idrubrica in ('+
                      objCAPConvenio.RetornaListaRubrica+') ';
                    
                    case cbboxAbono.itemindex of
                    1: begin {sem abono}
                         ssql:=ssql+
                           'and h.mes <> '+quotedstr(gsMesAbono)+' '+_clinefeed;
                       end;
                    2: begin {apenas abono}
                         ssql:=ssql+
                           'and h.mes = '+quotedstr(gsMesAbono)+' '+_clinefeed;
                       end;
                    end;

                    ssql:=ssql+
                      'and h.idmodulo = 18 '+
                      'and h.idhstfolhabenef is not null '+
                      'and h.idpatro = r.idpessjur '+
                      'and pi.idplanprevcontab = r.idplanoprev '+
                      'and h.idrubrica = r.idrubrica '+
                      'and h.idrubrica = p.idprovento '+
                      'group by r.codtiprecdesfav, r.unidnegoc, '+
                      'r.codcentrorespon, h.idpatro,pi.idplanprevcontab';

                    if FazQuery(qryAux, ssql) then
                    begin
                      while not qryAux.eof do
                      begin
                        try
                          CtrlDocumento.Rateiodocum.SetValues(
                            qryAux.fieldbyname('valor').asfloat, //rValor,
                            0, //rValorOM,
                            0, //rVlrresorcamen: Double;
                            0, //liIdrateiodocum,
                            Sistema.Idempresa, //liIdpessoa,
                            0, //liCoddocumento,
                            qryAux.fieldbyname('UnidNegoc').asinteger, //liUnidnegoc,
                            0, //liMoecodigo,
                            Sistema.Idusuario, //liIdusuarioinclusao,
                            0, //liIdreservaorcamen,
                            Integraback.Plano, //liPlano,
                            qryAux.fieldbyname('idplanoprev').asinteger, //liIdplanoprev,
                            qryAux.fieldbyname('idpatro').asinteger, //liIdpatro,
                            SistemaFolha.IdProgramaFolha, //liIdprograma,
                            0, //liIdprocesso,
                            Sistema.idempresa, //liIdempresa
                            qryAux.fieldbyname('CODTIPRECDESFAV').asstring, //sCodtiprecdes,
                            'P', //sRecpag,
                            qryAux.fieldbyname('CODCENTRORESPON').asstring, //sCodcentrorespon,
                            SistemaFolha.CODCCUSTOFINAN, //sCodcentrocusto,
                            '' //sNumimovel
                            );
                        except
                          on E:Exception do
                          begin
                            memResult.lines.add(e.message);
                            exit;
                          end;
                        end;
                        qryAux.next;
                      end;
                    end
                    else
                      exit;

                    if objCAPConvenio.FlgMultiplaConta then
                    begin
                      //consulta para pegar baixas
                      ssql:='SELECT '+_clinefeed+
                            '       SUM(DECODE(FLGDESCONTO,1,VALORPROVENTO,0,-VALORPROVENTO,0)) AS VALOR, '+_clinefeed+
                            '       UNIDNEGOC, '+_clinefeed+
                            '       PLACONTA, IDPLANOCONTABIL, IDPATRO '+_clinefeed+
                            'FROM ( '+_clinefeed+
                            '  SELECT H.FLGDESCONTO, H.VALORPROVENTO, PI.IDPLANOPREVCONTAB, H.IDPATRO, '+_clinefeed+
                            '         NVL(H.UNIDNEGOC,'+inttostr(prmUnidNegoc)+') AS UNIDNEGOC, '+_clinefeed+
                            '         LTRIM(RTRIM(DECODE(H.FLGDESCONTO,1,H.PLACONTAC,0,H.PLACONTAD))) AS PLACONTA '+_clinefeed+
                            '  FROM HISTRUBSAL H, RUBRICAXPLANO R, PROVDESC P, PERFILINVEST PI '+_clinefeed+
                            '  WHERE H.MESCOBRANCA = '+QuotedStr(sMes)+' '+_clinefeed+
                            '  AND H.IDHSTFOLHABENEF IS NOT NULL '+_clinefeed+
                            '  AND (H.FLGESTORNO = 0 OR H.FLGESTORNO IS NULL) '+_clinefeed+
                            '  AND H.IDFAVORECIDO = '+inttostr(objCAPConvenio.idfavorecido)+' '+_clinefeed+
                            '  AND H.FLGESPECIAL = 0 '+_clinefeed+
                            '  AND H.IDMODULO = 18 '+_clinefeed+
                            '  AND H.FLGDESCONTO IN (0,1) '+_clinefeed+
                            '  AND H.IDPLANOPREV = R.IDPLANOPREV '+_clinefeed+
                            '  AND H.IDRUBRICA = R.IDRUBRICA '+_clinefeed+
                            '  AND H.IDRUBRICA = P.IDPROVENTO '+_clinefeed+
                            '  AND H.IDPERFILINVEST = PI.IDPERFILINVEST '+_clinefeed+
                            '  AND H.IDRUBRICA IN ('+objCAPConvenio.RetornaListaRubrica+') '+_clinefeed;

                      case cbboxAbono.itemindex of
                      1: begin {sem abono}
                           ssql:=ssql+
                             'AND H.MES <> '+quotedstr(gsMesAbono)+' '+_clinefeed;
                         end;
                      2: begin {apenas abono}
                           ssql:=ssql+
                             'AND H.MES = '+quotedstr(gsMesAbono)+' '+_clinefeed;
                         end;
                      end;

                      ssql:=ssql+
                        ') GROUP BY PLACONTA, UNIDNEGOC, IDPLANOCONTABIL, IDPATRO '+_clinefeed;

                      if FazQuery(qryAux, ssql) then
                      begin
                        while not qryAux.eof do
                        begin
                          try
                            CtrlDocumento.CCBaixasXDocum.SetValues(
                              qryAux.fieldbyname('VALOR').asfloat, //rValor,
                              0, //liIdCcBaixasxDocum,
                              Sistema.Idempresa, //liIdpessoa,
                              0, //liCodDocumento,
                              qryAux.fieldbyname('UNIDNEGOC').asinteger, //-1, //liUnidNegoc,
                              IntegraBack.Plano, //liPlano,
                              qryAux.fieldbyname('IDPLANOCONTABIL').asinteger, //liIdplanoPrev,
                              qryAux.fieldbyname('IDPATRO').asinteger, //liIdPatro,
                              -1, //liIdSegregaCriter,
                              qryAux.fieldbyname('PLACONTA').asstring //sPlaConta
                            );
                          except
                            on E:Exception do
                            begin
                              memResult.lines.add(e.message);
                              exit;
                            end;
                          end;
                          qryAux.next;
                        end;
                      end;
                    end;

                    try
                      if not CtrlDocumento.Insert then
                      begin
                        memResult.lines.add(CtrlDocumento.MessageInfo);
                        exit;
                      end;
                    except
                      on E:Exception do
                      begin
                        memResult.lines.add(e.message);
                        exit;
                      end;
                    end;

                    objCAPConvenio.icoddocumento:=trunc(CtrlDocumento.CodDocumento);

                    
                    if SistemaFolha.FlgGeraAlteradoresCAPConvenio then
                    begin
                      try
                        ctrlImpostoRetido.OpenTransaction:= false;
                        ctrlImpostoRetido.RecPag:='P';
                        ctrlImpostoRetido.IdUsuario:=Sistema.Idusuario;
                        ctrlImpostoRetido.IdModulo:=Sistema.Idmodulo;
                        ctrlImpostoRetido.MomentoLancamento:=mlLancamento;
                        ctrlImpostoRetido.DataProgramada:=objCAPConvenio.datapagto;
                        ctrlImpostoRetido.OperacaoDocumento:='2';
                        ctrlImpostoRetido.IdForCli:=objCAPConvenio.idfavorecido;
                        ctrlImpostoRetido.CodDocumento:=objCAPConvenio.icoddocumento;
                        ctrlImpostoRetido.NumLancto:=CtrlDocumento.Lanctodocum.NumLancto;
                        ctrlImpostoRetido.ValorLancto:=objCAPConvenio.dvalorliqhist;
                        ctrlImpostoRetido.ValorLiquido:=objCAPConvenio.dvalorliqhist;
                        ctrlImpostoRetido.CodTipoDoc:=SistemaFolha.TipDocConvP;
                        ctrlImpostoRetido.DataLancto := dtpDtLancamento.Date; 
                        ctrlImpostoRetido.DataEmissao:=date;
                        ctrlImpostoRetido.DebCre:='C';
                        ctrlImpostoRetido.IDEmpresa:=Sistema.Idempresa;
                        ctrlImpostoRetido.Incluir;
                      except
                        exit;
                      end;
                    end;
                  end;

                  //grava linha do documento no processo de convenio
                  if not ExecutarQuery(qryAux,
                          'INSERT INTO PROCCONVENIODOC '+
                          '(IDFUNDACAO, IDPROCCONV, IDFAVORECIDO, CODDOCUMENTO,  '+
                          'DATAPAGAMENTO, VALORLIQUIDO, VALOREFETIVO, CODTIPDOC, '+
                          'PLANO, PLACONTA, RECPAG, CODTIPRECDES ) '+
                          'VALUES ('+inttostr(iidfundacao)+', '+
                          inttostr(iprocconv)+', '+
                          inttostr(objCAPConvenio.idfavorecido)+', '+
                          floattostr(CtrlDocumento.CodDocumento)+', '+
                          'to_date('+QuotedStr(formatdatetime('dd/mm/yyyy',
                          objCAPConvenio.datapagto))+',''dd/mm/yyyy''), '+
                          oranumero(floattostr(objCAPConvenio.dvalorliqhist))+', '+
                          oranumero(floattostr(objCAPConvenio.dvalorliqhist))+', '+
                          inttoStr(SistemaFolha.TipDocConvP)+', '+ inttostr(IntegraBack.Plano)+', '+
                          QuotedStr(objCAPConvenio.splaconta)+', '+QuotedStr('P')+', 0 '+' )') then
                    exit;
                end;
                // So vai gerar CAR para os convenios com geração automática
                If ((objCapConvenio.GeraCar = 0) and
                   (objCapConvenio.inatureza = 0)) then
                begin
                  //incluir favorecido na tabela de fornecedor se não existir
                  if not FazQuery(qryAux,'SELECT IDPESSOA FROM FORNSERV '+
                           'WHERE IDPESSOA = '+
                           inttostr(objCAPConvenio.idfavorecido)) then
                  begin
                    if qryAux.isempty then
                      CtrlDocumento.ForCli.Inserir(
                        objCAPConvenio.idfavorecido, Sistema.IdEmpresa,
                        -1, IntegraBack.Plano, prmIdRamoTipoCli, 
                        '', '', '', '', tfcCliente);
                  end;
                  //cria documento
                  //grava documento, lançamento e rateio
                  inc(liseq);
                  sNoDocumento:=copy(smes,1,4)+copy(smes,6,2)+inttostr(trunc(date))+
                    inttostr(liseq)+
                    IntToStr(iprocconv)+inttostr(objCAPConvenio.idfavorecido);
                  try
                    ssql:='SELECT IDCBANCARIA FROM CONTABANCARIA WHERE (IDPESSOA = '+
                      inttoStr(objCAPConvenio.idfavorecido)+') AND (FLGCONTAPREF = 1)';
                    if FazQuery(qryAux, ssql) then
                      lIdContaBancaria:=qryAux.fields[0].asinteger;
                  except
                  end;
                  
                  try
                    ssql:=
                      'SELECT CODFORMA FROM PORTADORFORMA '+
                      'WHERE CODPORTFORMA = '+inttostr(objCAPConvenio.iPortFormaCAR);
                    if FazQuery(qryAux, ssql) then
                      liCodForma:=qryAux.fields[0].asinteger;
                  except
                  end;

                  If Sistemafolha.FLGINTEGRAFINANC = 1 then
                  begin
                    licoddocumento:=CtrlDocumento.GetSequenceDocumento; 

                    CtrlDocumento.SetValues(
                      licoddocumento, //coddocumento
                      licoddocumento, //nodocumento
                      '',  //scompldocumento
                      '0', // sStatus
                      'R', // recpag
                      '2', // sOperacao
                      '',  //sNumslip,
                      '',  //sNumleitcodbarras,
                      objCAPConvenio.splaconta, //sPlaconta,
                      '',  //sCodcentrocusto,
                      '',  //sNossonumero,
                      '',  //sNumdigcodbarras,
                      '',  //sGrupodoc,
                      '',  //sFlgemitelancbaix,
                      '',  //sFlgconfirmarecpag,
                      '',  //sEmisbloq,
                      '',  //sReferencia,
                      '',  //sObs
                      objCAPConvenio.datapagto, //DATA VENCIMENTO
                      date, // DataEmissao
                      objCAPConvenio.datapagto, //DATA PROGRAMADA
                      0,  //dDataremessa,
                      0,  //dDatalimite,
                      0,  //dDatacorrecao,
                      0,  //rVlrmulta,
                      0,  //rValorjuros,
                      0,  //rValordesconto,
                      0,  //rPercjurossimples,
                      0,  //rPercjurosatuarial
                      SistemaFolha.TipDocConvR, //liCodtipdoc,
                      Sistema.IdEmpresa, //liIdpessoa,
                      Sistema.idmodulo, //liIdmodulo,
                      objCAPConvenio.idfavorecido, //liIdforcli,
                      0, //liNumfatura,
                      lidContaBancaria, //liIdcbancaria,
                      prmUnidNegoc, //-1, //liUnidnegoc, 
                      IntegraBack.Plano, //liPlano,
                      0, //liNumcpbaixa,
                      0, //liNumapgr,
                      0, //liMoecodigo,
                      0, //liLotetransmissao,
                      0, //liIndicecorrecao,
                      Sistema.Idusuario, //liIdusuarioinclusao,
                      Sistema.IdEmpresa, //liIdempresa,
                      0, //liFlgnaoconciliado,
                      0, //liControleremessa,
                      0, //liCodsubconta,
                      objCAPConvenio.iPortFormaCAR, //liCodportforma,
                      0, //liCodgrupocnab,
                      0, //liCodgeradorinss,
                      licodforma //liCodforma
                      );

                    if FazQuery(qryAux,
                         'SELECT NOME FROM PESSOA '+
                         'WHERE IDPESSOA = '+
                         inttostr(objCAPConvenio.idfavorecido)) then
                      sNomeFav:=qryAux.fields[0].asstring;

                    CtrlDocumento.Lanctodocum.SetValues(
                      dtpDtLancamento.Date, //dDatalancto
                      0, //liCoddocumento,
                      0, //liNumlancto
                      objCAPConvenio.dvalorliqhist, //rVlrliquido,
                      0, //rValorOM
                      objCAPConvenio.dvalorliqhist, //rValor
                      prmUnidNegoc, //-1, //liUnidnegoc, 
                      -1, //liPlncodigo
                      0, //liNumlotemanual,
                      Sistema.Idusuario, //liIdusuarioinclusao,
                      Sistema.IdEmpresa, //liIdempresa,
                      0, //liIdnflivro,
                      0, //liEstorno,
                      0, //liCodtipdoc,
                      0, //liCoddocinss,
                      0, //liCodalterador
                      '2', //sOperacao,
                      '', //sNumrecibo,
                      '', //sNumnf,
                      '', //sNumfatura,
                      copy('Rec. Convênio: '+sNomeFav, 1, 60), //sHistoricocompl,
                      '', //sFlgtipofatura,
                      '', //sFlgrecebeunf,
                      '', //sFlgfatemitida,
                      'D', //sDebcre
                      Sistema.idmodulo, //liIdModulo
                      IntegraBack.Plano, //liPlanoConta
                      true, //bUsaPlanoPatro
                      false, //bContabiliza
                      0, //iCodPortForma,
                      0, //iDiasFloat
                      '', //splacontabaixa,
                      0 //liSubContaBaixa
                      );

                    //consulta para pegar rateio
                    ssql:='select sum(h.valorprovento) as valor, '+
                          'h.idplanoprev, h.idpatro, '+
                          'nvl(r.codtiprecdesfavcar,0) as codtiprecdesfavcar, '+
                          'nvl(r.unidnegoc,0) as unidnegoc, '+
                          'nvl(r.codcentrorespon,''9999999999'') as codcentrorespon '+
                          'from histrubsal h, rubricaxplano r, provdesc p '+
                          'where h.mescobranca = '+QuotedStr(sMes)+' '+
//                          'and (flgestorno = 0 or flgestorno is null) '+   //Everson TIBERO
                          'and (h.flgestorno = 0 or h.flgestorno is null) '+ //Everson TIBERO
                          'and h.idfavorecido = '+inttostr(objCAPConvenio.idfavorecido)+' ';

		    if objCAPConvenio.idrubdevol > 0 then
                      ssql:=ssql+'and h.idrubrica in ('+
                        inttostr(objCAPConvenio.idrubnormal)+', '+
                        inttostr(objCAPConvenio.idrubdevol)+') '
                    else
                      ssql:=ssql+'and h.idrubrica = '+
                        inttostr(objCAPConvenio.idrubnormal)+' ';

                    case cbboxAbono.itemindex of
                    1: begin {sem abono}
                         ssql:=ssql+
                           'and h.mes <> '+quotedstr(gsMesAbono)+' '+_clinefeed;
                       end;
                    2: begin {apenas abono}
                         ssql:=ssql+
                           'and h.mes = '+quotedstr(gsMesAbono)+' '+_clinefeed;
                       end;
                    end;

                    ssql:=ssql+'and h.idmodulo = 18 '+
                               'and h.idhstfolhabenef is not null '+
                               'and h.idpatro = r.idpessjur '+
                               'and h.idplanoprev = r.idplanoprev '+
                               'and h.idrubrica = r.idrubrica '+
                               'and h.idrubrica = p.idprovento '+
                               'group by r.codtiprecdesfavcar, r.unidnegoc, '+
                               'r.codcentrorespon, h.idpatro,h.idplanoprev';

                    if FazQuery(qryAux, ssql) then
                    begin
                      while not qryAux.eof do
                      begin
                        try
                          CtrlDocumento.Rateiodocum.SetValues(
                            qryAux.fieldbyname('valor').asfloat, //rValor,
                            0, //rValorOM,
                            0, //rVlrresorcamen: Double;
                            0, //liIdrateiodocum,
                            Sistema.Idempresa, //liIdpessoa,
                            0, //liCoddocumento,
                            qryAux.fieldbyname('UnidNegoc').asinteger, //liUnidnegoc,
                            0, //liMoecodigo,
                            Sistema.Idusuario, //liIdusuarioinclusao,
                            0, //liIdreservaorcamen,
                            Integraback.Plano, //liPlano,
                            qryAux.fieldbyname('idplanoprev').asinteger, //liIdplanoprev,
                            qryAux.fieldbyname('idpatro').asinteger, //liIdpatro,
                            SistemaFolha.IdProgramaFolha, //liIdprograma,
                            0, //liIdprocesso,
                            Sistema.idempresa, //liIdempresa
                            qryAux.fieldbyname('CODTIPRECDESFAVCAR').asstring, //sCodtiprecdes,
                            'R', //sRecpag,
                            qryAux.fieldbyname('CODCENTRORESPON').asstring, //sCodcentrorespon,
                            SistemaFolha.CODCCUSTOFINAN, //sCodcentrocusto,
                            '' //sNumimovel
                            );
                        except
                          on E:Exception do
                          begin
                            memResult.lines.add(e.message);
                            exit;
                          end;
                        end;
                        qryAux.next;
                      end;
                    end
                    else
                      exit;

                    try
                      if not CtrlDocumento.Insert then
                      begin
                        memResult.lines.add(CtrlDocumento.MessageInfo);
                        exit;
                      end;
                    except
                      on E:Exception do
                      begin
                        memResult.lines.add(e.message);
                        exit;
                      end;
                    end;

                    objCAPConvenio.icoddocumento:=trunc(CtrlDocumento.CodDocumento);
                  end;

                  //grava linha do documento no processo de convenio
                  if not ExecutarQuery(qryAux,
                          'INSERT INTO PROCCONVENIODOC '+
                          '(IDFUNDACAO, IDPROCCONV, IDFAVORECIDO, CODDOCUMENTO,  '+
                          'DATAPAGAMENTO, VALORLIQUIDO, VALOREFETIVO, CODTIPDOC, '+
                          'PLANO, PLACONTA, RECPAG, CODTIPRECDES ) '+
                          'VALUES ('+inttostr(iidfundacao)+', '+
                          inttostr(iprocconv)+', '+
                          inttostr(objCAPConvenio.idfavorecido)+', '+
                          floattostr(CtrlDocumento.CodDocumento)+', '+
                          'to_date('+QuotedStr(formatdatetime('dd/mm/yyyy',
                          objCAPConvenio.datapagto))+',''dd/mm/yyyy''), '+
                          oranumero(floattostr(objCAPConvenio.dvalorliqhist))+', '+
                          oranumero(floattostr(objCAPConvenio.dvalorliqhist))+', '+
                          inttoStr(SistemaFolha.TipDocConvR)+', '+ inttostr(IntegraBack.Plano)+', '+
                          QuotedStr(objCAPConvenio.splaconta)+', '+QuotedStr('R')+', 0 '+' )') then
                    exit;
                end;
              end;  
              //gravar tabela de lotes do tratamento de convênio PROCCONVENIOLOTE  - Convenios Avulsos
              qryConvLote.first;
              while not qryConvLote.eof do
              begin
                if (qryConvLote.fieldbyname('IDFAVORECIDO').asinteger =
                    objCAPConvenio.idfavorecido) and
                   (lii = qryConvLote.fieldbyname('INDICECAP').asinteger) then
                begin
                  //coloca sitenvio = 9 para os registros da tmpdesc vinculados ao lote de importação
                  case cbboxAbono.itemindex of
                  0: begin {com abono}
                       ssql:=
                         'UPDATE TMPDESC '+_clinefeed+
                         'SET SITENVIO = ''9'' '+_clinefeed+
                         'WHERE IDLOTE = '+
                           inttostr(qryConvLote.fieldbyname('IDLOTE').asinteger)+' '+_clinefeed+
                         'AND IDPROVENTO = '+
                           inttostr(qryConvLote.fieldbyname('IDRUBRICA').asinteger)+_clinefeed;
                     end;
                  1: begin {sem abono}
                       ssql:=
                         'UPDATE TMPDESC '+_clinefeed+
                         'SET SITENVIO = ''9'' '+_clinefeed+
                         'WHERE IDLOTE = '+
                           inttostr(qryConvLote.fieldbyname('IDLOTE').asinteger)+' '+_clinefeed+
                         'AND IDPROVENTO = '+
                           inttostr(qryConvLote.fieldbyname('IDRUBRICA').asinteger)+_clinefeed+
                         'AND MESREFERENCIA <> '+quotedstr(gsMesAbono)+' '+_clinefeed;
                     end;
                  2: begin {apenas abono}
                       ssql:=
                         'UPDATE TMPDESC '+_clinefeed+
                         'SET SITENVIO = ''9'' '+_clinefeed+
                         'WHERE IDLOTE = '+
                           inttostr(qryConvLote.fieldbyname('IDLOTE').asinteger)+' '+_clinefeed+
                         'AND IDPROVENTO = '+
                           inttostr(qryConvLote.fieldbyname('IDRUBRICA').asinteger)+_clinefeed+
                         'AND MESREFERENCIA = '+quotedstr(gsMesAbono)+' '+_clinefeed;
                     end;
                  end;

                  if not ExecutarQuery(qryAux, ssql) then
                    exit;

                  qryConvLote.edit;
                  qryConvLote.fieldbyname('IDPROCCONV').asinteger:=iprocconv;
                  //achar objeto na lista para identificar número do documento vinculado
                  if (objcapconvenio.GeraCAP = 0) then
                  begin
                    if (objCAPConvenio.icoddocumento > 0) then
                      qryConvLote.fieldbyname('CODDOCUMENTO').asinteger:=
                        objCAPConvenio.icoddocumento;
                  end;
                  If iidlotetmpdesc = 0 then
                    qryConvLote.fieldbyname('IDLOTEEXCESSO').clear
                  else
                    qryConvLote.fieldbyname('IDLOTEEXCESSO').asinteger:=iidlotetmpdesc;
                  qryConvLote.post;
                end;
                qryConvLote.next;
              end;
            end;

            // ATUALIZA DOCUMENTOS PARA REGISTROS ASSOCIADOS A OUTRAS RUBRICAS 
	    // PARA AS QUAIS SE GEROU UM ÚNICO DOCUMENTO
            qryConvLote.first;
            while not qryConvLote.eof do
            begin
              if qryConvLote.fieldbyname('CODDOCUMENTO').isnull then
              begin
                licoddocumento:=PegaCodDocumento(
                  ListaCAPConvenio,
                  qryConvLote.fieldbyname('IDFAVORECIDO').asinteger,
                  qryConvLote.fieldbyname('IDRUBRICA').asinteger);
                if licoddocumento > 0 then
                begin
                  qryConvLote.edit;
                  qryConvLote.fieldbyname('CODDOCUMENTO').asinteger:=
                    licoddocumento;
                  qryConvLote.post;
                end;
              end;
              qryConvLote.next;
            end;
            
            try
              qryConvLote.ApplyUpdates;
            except
              bcomerro:=true;
              exit;
            end;
            bcomerro:=false;
          end;

          // convenios continuados
          If ListaCAPConvenio_Continuado.count > 0 then
          begin
            for lii:=0 to ListaCAPConvenio_Continuado.count-1 do
            begin
              CtrlDocumento.Prepare(OpDocumento,odlEfetivo);
              CtrlDocumento.IdEspAcesso:=Sistema.IdEspAcesso;
              CtrlDocumento.IdUsuario:=Sistema.IdUsuario;

              objCAPConvenio_Continuado:=
                (ListaCAPConvenio_Continuado.objects[lii] as tCAPConvenio_Continuado);

	      //gravar tabela de contas a pagar
              If ((objCAPConvenio_Continuado.GeraCAP = 0) and
                 (objCAPConvenio_Continuado.iNatureza = 1)) then
              begin
                //incluir favorecido na tabela de fornecedor se não existir
                if not FazQuery(qryAux,'SELECT IDPESSOA FROM FORNSERV '+
                       'WHERE IDPESSOA = '+
                       inttostr(objCAPConvenio_Continuado.idfavorecido)) then
                begin
                  if qryAux.isempty then
                    CtrlDocumento.ForCli.Inserir(
                      objCAPConvenio_Continuado.idfavorecido, Sistema.IdEmpresa,
                      -1, IntegraBack.Plano, prmIdRamoTipoFor,
                      '', '', '', '', tfcCliente);
                end;

                //grava documento, lançamento e rateio
                inc(liseq);
                sNoDocumento:=copy(smes,1,4)+copy(smes,6,2)+inttostr(trunc(date))+
                  inttostr(liseq)+
                  IntToStr(iprocconv)+inttostr(objCAPConvenio_Continuado.idfavorecido);
                try
                  ssql:='SELECT IDCBANCARIA FROM CONTABANCARIA WHERE (IDPESSOA = '+
                    inttoStr(objCAPConvenio_Continuado.idfavorecido)+') AND (FLGCONTAPREF = 1)';
                  if FazQuery(qryAux, ssql) then
                    lidContaBancaria:=qryAux.fields[0].asinteger;
                except
                end;

                try
                  ssql:=
                    'SELECT CODFORMA FROM PORTADORFORMA '+
                    'WHERE CODPORTFORMA = '+inttostr(objCAPConvenio_Continuado.iPortFormaCAP);
                  if FazQuery(qryAux, ssql) then
                    liCodForma:=qryAux.fields[0].asinteger;
                except
                end;

                If Sistemafolha.FLGINTEGRAFINANC = 1 then
                begin
                  licoddocumento:=CtrlDocumento.GetSequenceDocumento; 

                  CtrlDocumento.SetValues(
                    licoddocumento, //coddocumento
                    licoddocumento, //nodocumento
                    '',  //scompldocumento
                    '0', // sStatus
                    'P', // recpag
                    '2', // sOperacao
                    '',  //sNumslip,
                    '',  //sNumleitcodbarras,
                    objCAPConvenio_Continuado.splaconta, //sPlaconta,
                    '',  //sCodcentrocusto,
                    '',  //sNossonumero,
                    '',  //sNumdigcodbarras,
                    '',  //sGrupodoc,
                    '',  //sFlgemitelancbaix,
                    '',  //sFlgconfirmarecpag,
                    '',  //sEmisbloq,
                    '',  //sReferencia,
                    '',  //sObs
                    objCAPConvenio_Continuado.datapagto, //DATA VENCIMENTO
                    date, // DataEmissao
                    objCAPConvenio_Continuado.datapagto, //DATA PROGRAMADA
                    0,  //dDataremessa,
                    0,  //dDatalimite,
                    0,  //dDatacorrecao,
                    0,  //rVlrmulta,
                    0,  //rValorjuros,
                    0,  //rValordesconto,
                    0,  //rPercjurossimples,
                    0,  //rPercjurosatuarial
                    SistemaFolha.TipDocConvP, //liCodtipdoc,
                    Sistema.IdEmpresa, //liIdpessoa,
                    Sistema.idmodulo, //liIdmodulo,
                    objCAPConvenio_Continuado.idfavorecido, //liIdforcli,
                    0, //liNumfatura,
                    lidContaBancaria, //liIdcbancaria,
                    prmUnidNegoc, //-1, //liUnidnegoc, 
                    IntegraBack.Plano, //liPlano,
                    0, //liNumcpbaixa,
                    0, //liNumapgr,
                    0, //liMoecodigo,
                    0, //liLotetransmissao,
                    0, //liIndicecorrecao,
                    Sistema.Idusuario, //liIdusuarioinclusao,
                    Sistema.IdEmpresa, //liIdempresa,
                    0, //liFlgnaoconciliado,
                    0, //liControleremessa,
                    0, //liCodsubconta,
                    objCAPConvenio_Continuado.iPortFormaCAP, //liCodportforma,
                    0, //liCodgrupocnab,
                    0, //liCodgeradorinss,
                    licodforma //liCodforma
                     );

                  if FazQuery(qryAux, 'SELECT NOME FROM PESSOA '+
                       'WHERE IDPESSOA = '+
                       inttostr(objCAPConvenio_Continuado.idfavorecido)) then
                    sNomeFav:=qryAux.fields[0].asstring;

                  CtrlDocumento.Lanctodocum.SetValues(
                    dtpDtLancamento.Date, //dDatalancto
                    0, //liCoddocumento,
                    0, //liNumlancto
                    objCAPConvenio_Continuado.dvalorliqhist, //rVlrliquido,
                    0, //rValorOM
                    objCAPConvenio_Continuado.dvalorliqhist, //rValor
                    prmUnidNegoc, //-1, //liUnidnegoc, 
                    -1, //liPlncodigo
                    0, //liNumlotemanual,
                    Sistema.Idusuario, //liIdusuarioinclusao,
                    Sistema.IdEmpresa, //liIdempresa,
                    0, //liIdnflivro,
                    0, //liEstorno,
                    0, //liCodtipdoc,
                    0, //liCoddocinss,
                    0, //liCodalterador
                    '2', //sOperacao,
                    '', //sNumrecibo,
                    '', //sNumnf,
                    '', //sNumfatura,
                    copy('Pagto Convênio: '+sNomeFav, 1, 60), //sHistoricocompl,
                    '', //sFlgtipofatura,
                    '', //sFlgrecebeunf,
                    '', //sFlgfatemitida,
                    'C', //sDebcre
                    Sistema.idmodulo, //liIdModulo
                    IntegraBack.Plano, //liPlanoConta
                    true, //bUsaPlanoPatro
                    false, //bContabiliza
                    0, //iCodPortForma,
                    0, //iDiasFloat
                    '', //splacontabaixa,
                    0 //liSubContaBaixa
                    );

                  //consulta para pegar rateio
                  ssql:='select sum(decode(p.flgdesconto,1, '+
                        'h.valorprovento,0,-h.valorprovento,0)) as valor, '+
                        'h.idplanoprev, h.idpatro, '+
                        'nvl(r.codtiprecdesfav,0) as codtiprecdesfav, '+
                        'nvl(r.unidnegoc,0) as unidnegoc, '+
                        'nvl(r.codcentrorespon,''9999999999'') as codcentrorespon '+
                        'from histrubsal h, rubricaxplano r, provdesc p '+
                        'where h.mescobranca = '+QuotedStr(sMes)+' '+
//                        'and (flgestorno = 0 or flgestorno is null) '+   //Everson TIBERO
                        'and (h.flgestorno = 0 or h.flgestorno is null) '+ //Everson TIBERO
                        'and h.idfavorecido = '+
                        inttostr(objCAPConvenio_Continuado.idfavorecido)+' ';

                  ssql:=ssql+
                    'and h.idrubrica = '+
                      inttostr(objCAPConvenio_Continuado.idrubrica)+' ';

                  case cbboxAbono.itemindex of
                  1: begin {sem abono}
                       ssql:=ssql+
                         'and h.mes <> '+quotedstr(gsMesAbono)+' '+_clinefeed;
                     end;
                  2: begin {apenas abono}
                       ssql:=ssql+
                         'and h.mes = '+quotedstr(gsMesAbono)+' '+_clinefeed;
                     end;
                  end;

                  ssql:=ssql+'and h.idmodulo = 18 '+
                             'and h.idhstfolhabenef is not null '+
                             'and h.idpatro = r.idpessjur '+
                             'and h.idplanoprev = r.idplanoprev '+
                             'and h.idrubrica = r.idrubrica '+
                             'and h.idrubrica = p.idprovento '+
                             'group by r.codtiprecdesfav, r.unidnegoc, '+
                             'r.codcentrorespon, h.idpatro,h.idplanoprev';
                  if FazQuery(qryAux, ssql) then
                  begin
                    while not qryAux.eof do
                    begin
                      try
                        CtrlDocumento.Rateiodocum.SetValues(
                          qryAux.fieldbyname('valor').asfloat, //rValor,
                          0, //rValorOM,
                          0, //rVlrresorcamen: Double;
                          0, //liIdrateiodocum,
                          Sistema.Idempresa, //liIdpessoa,
                          0, //liCoddocumento,
                          qryAux.fieldbyname('UnidNegoc').asinteger, //liUnidnegoc,
                          0, //liMoecodigo,
                          Sistema.Idusuario, //liIdusuarioinclusao,
                          0, //liIdreservaorcamen,
                          Integraback.Plano, //liPlano,
                          qryAux.fieldbyname('idplanoprev').asinteger, //liIdplanoprev,
                          qryAux.fieldbyname('idpatro').asinteger, //liIdpatro,
                          SistemaFolha.IdProgramaFolha, //liIdprograma,
                          0, //liIdprocesso,
                          Sistema.idempresa, //liIdempresa
                          qryAux.fieldbyname('CODTIPRECDESFAV').asstring, //sCodtiprecdes,
                          'P', //sRecpag,
                          qryAux.fieldbyname('CODCENTRORESPON').asstring, //sCodcentrorespon,
                          SistemaFolha.CODCCUSTOFINAN, //sCodcentrocusto,
                          '' //sNumimovel
                          );
                      except
                        on E:Exception do
                        begin
                          memResult.lines.add(e.message);
                          exit;
                        end;
                      end;
                      qryAux.next;
                    end;
                  end
                  else
                    exit;

                  try
                    if not CtrlDocumento.Insert then
                      exit;
                  except
                    on E:Exception do
                    begin
                      exit;
                    end;
                  end;

                  objCAPConvenio_continuado.icoddocumento:=trunc(CtrlDocumento.CodDocumento);

                  if SistemaFolha.FlgGeraAlteradoresCAPConvenio then
                  begin
                    try
                      ctrlImpostoRetido.OpenTransaction:= false;
                      ctrlImpostoRetido.RecPag:='P';
                      ctrlImpostoRetido.IdUsuario:=Sistema.Idusuario;
                      ctrlImpostoRetido.IdModulo:=Sistema.Idmodulo;
                      ctrlImpostoRetido.MomentoLancamento:=mlLancamento;
                      ctrlImpostoRetido.DataProgramada:=objCAPConvenio_continuado.datapagto;
                      ctrlImpostoRetido.OperacaoDocumento:='2';
                      ctrlImpostoRetido.IdForCli:=objCAPConvenio_continuado.idfavorecido;
                      ctrlImpostoRetido.CodDocumento:=objCAPConvenio_continuado.icoddocumento;
                      ctrlImpostoRetido.NumLancto:=CtrlDocumento.Lanctodocum.NumLancto;
                      ctrlImpostoRetido.ValorLancto:=objCAPConvenio_continuado.dvalorliqhist;
                      ctrlImpostoRetido.ValorLiquido:=objCAPConvenio_continuado.dvalorliqhist;
                      ctrlImpostoRetido.CodTipoDoc:=SistemaFolha.TipDocConvP;
                      ctrlImpostoRetido.DataLancto := dtpDtLancamento.Date; 
                      ctrlImpostoRetido.DataEmissao:=date;
                      ctrlImpostoRetido.DebCre:='C';
                      ctrlImpostoRetido.Incluir;
                    except
                      exit;
                    end;
                  end;
                end;

                //grava linha do documento no processo de convenio
                if not ExecutarQuery(qryAux,
                     'INSERT INTO PROCCONVENIODOC '+
                     '(IDFUNDACAO, IDPROCCONV, IDFAVORECIDO, CODDOCUMENTO,  '+
                     'DATAPAGAMENTO, VALORLIQUIDO, VALOREFETIVO, CODTIPDOC, '+
                     'PLANO, PLACONTA, RECPAG, CODTIPRECDES ) '+
                     'VALUES ('+inttostr(iidfundacao)+', '+
                     inttostr(iprocconv)+', '+
                     inttostr(objCAPConvenio_continuado.idfavorecido)+', '+
                     floattostr(CtrlDocumento.CodDocumento)+', '+
                     'to_date('+QuotedStr(formatdatetime('dd/mm/yyyy',
                     objCAPConvenio_continuado.datapagto))+',''dd/mm/yyyy''), '+
                     oranumero(floattostr(objCAPConvenio_continuado.dvalorliqhist))+', '+
                     oranumero(floattostr(objCAPConvenio_continuado.dvalorliqhist))+', '+
                     inttoStr(SistemaFolha.TipDocConvP)+', '+ inttostr(IntegraBack.Plano)+', '+
                     QuotedStr(objCAPConvenio_continuado.splaconta)+', '+
                     QuotedStr('P')+', 0 '+' )') then
                  exit;
              end;
              //gravar tabela de contas a receber
              If ((objCAPConvenio_Continuado.GeraCAR = 0) and
                 (objCAPConvenio_Continuado.iNatureza = 0)) then
              begin
                //incluir favorecido na tabela de fornecedor se não existir
                if not FazQuery(qryAux,'SELECT IDPESSOA FROM FORNSERV '+
                        'WHERE IDPESSOA = '+
                        inttostr(objCAPConvenio_Continuado.idfavorecido)) then
                begin
                  if qryAux.isempty then
                    CtrlDocumento.ForCli.Inserir(
                      objCAPConvenio_Continuado.idfavorecido, Sistema.IdEmpresa,
                      -1, IntegraBack.Plano, prmIdRamoTipoCli,
                      '', '', '', '', tfcCliente);
                end;

                //grava documento, lançamento e rateio
                inc(liseq);
                sNoDocumento:=copy(smes,1,4)+copy(smes,6,2)+inttostr(trunc(date))+
                  inttostr(liseq)+
                  IntToStr(iprocconv)+inttostr(objCAPConvenio_Continuado.idfavorecido);
                try
                  ssql:='SELECT IDCBANCARIA FROM CONTABANCARIA WHERE (IDPESSOA = '+
                    inttoStr(objCAPConvenio_Continuado.idfavorecido)+') AND (FLGCONTAPREF = 1)';
                  if FazQuery(qryAux, ssql) then
                    lidContaBancaria:=qryAux.fields[0].asinteger;
                except
                end;
                
                try
                  ssql:=
                    'SELECT CODFORMA FROM PORTADORFORMA '+
                    'WHERE CODPORTFORMA = '+inttostr(objCAPConvenio_Continuado.iPortFormaCAP);
                  if FazQuery(qryAux, ssql) then
                    liCodForma:=qryAux.fields[0].asinteger;
                except
                end;

                If Sistemafolha.FLGINTEGRAFINANC = 1 then
                begin
                  licoddocumento:=CtrlDocumento.GetSequenceDocumento; 

                  CtrlDocumento.SetValues(
                    licoddocumento, //coddocumento
                    licoddocumento, //nodocumento
                    '',  //scompldocumento
                    '0', // sStatus
                    'R', // recpag
                    '2', // sOperacao
                    '',  //sNumslip,
                    '',  //sNumleitcodbarras,
                    objCAPConvenio_Continuado.splaconta, //sPlaconta,
                    '',  //sCodcentrocusto,
                    '',  //sNossonumero,
                    '',  //sNumdigcodbarras,
                    '',  //sGrupodoc,
                    '',  //sFlgemitelancbaix,
                    '',  //sFlgconfirmarecpag,
                    '',  //sEmisbloq,
                    '',  //sReferencia,
                    '',  //sObs
                    objCAPConvenio_Continuado.datapagto, //DATA VENCIMENTO
                    date, // DataEmissao
                    objCAPConvenio_Continuado.datapagto, //DATA PROGRAMADA
                    0,  //dDataremessa,
                    0,  //dDatalimite,
                    0,  //dDatacorrecao,
                    0,  //rVlrmulta,
                    0,  //rValorjuros,
                    0,  //rValordesconto,
                    0,  //rPercjurossimples,
                    0,  //rPercjurosatuarial
                    SistemaFolha.TipDocConvR, //liCodtipdoc,
                    Sistema.IdEmpresa, //liIdpessoa,
                    Sistema.idmodulo, //liIdmodulo,
                    objCAPConvenio_Continuado.idfavorecido, //liIdforcli,
                    0, //liNumfatura,
                    lidContaBancaria, //liIdcbancaria,
                    prmUnidNegoc, //-1, //liUnidnegoc, 
                    IntegraBack.Plano, //liPlano,
                    0, //liNumcpbaixa,
                    0, //liNumapgr,
                    0, //liMoecodigo,
                    0, //liLotetransmissao,
                    0, //liIndicecorrecao,
                    Sistema.Idusuario, //liIdusuarioinclusao,
                    Sistema.IdEmpresa, //liIdempresa,
                    0, //liFlgnaoconciliado,
                    0, //liControleremessa,
                    0, //liCodsubconta,
                    objCAPConvenio_Continuado.iPortFormaCAR, //liCodportforma,
                    0, //liCodgrupocnab,
                    0, //liCodgeradorinss,
                    licodforma //liCodforma
                    );

                  if FazQuery(qryAux, 'SELECT NOME FROM PESSOA '+
                       'WHERE IDPESSOA = '+
                       inttostr(objCAPConvenio_Continuado.idfavorecido)) then
                    sNomeFav:=qryAux.fields[0].asstring;

                  CtrlDocumento.Lanctodocum.SetValues(
                    dtpDtLancamento.Date, //dDatalancto
                    0, //liCoddocumento,
                    0, //liNumlancto
                    objCAPConvenio_Continuado.dvalorliqhist, //rVlrliquido,
                    0, //rValorOM
                    objCAPConvenio_Continuado.dvalorliqhist, //rValor
                    prmUnidNegoc, //-1, //liUnidnegoc, 
                    -1, //liPlncodigo
                    0, //liNumlotemanual,
                    Sistema.Idusuario, //liIdusuarioinclusao,
                    Sistema.IdEmpresa, //liIdempresa,
                    0, //liIdnflivro,
                    0, //liEstorno,
                    0, //liCodtipdoc,
                    0, //liCoddocinss,
                    0, //liCodalterador
                    '2', //sOperacao,
                    '', //sNumrecibo,
                    '', //sNumnf,
                    '', //sNumfatura,
                    copy('Rec. Convênio: '+sNomeFav, 1, 60), //sHistoricocompl,
                    '', //sFlgtipofatura,
                    '', //sFlgrecebeunf,
                    '', //sFlgfatemitida,
                    'D', //sDebcre
                    Sistema.idmodulo, //liIdModulo
                    IntegraBack.Plano, //liPlanoConta
                    true, //bUsaPlanoPatro
                    false, //bContabiliza
                    0, //iCodPortForma,
                    0, //iDiasFloat
                    '', //splacontabaixa,
                    0 //liSubContaBaixa
                    );

                  //consulta para pegar rateio
                  ssql:='select sum(h.valorprovento) as valor, '+
                        'h.idplanoprev, h.idpatro, '+
                        'nvl(r.codtiprecdesfavcar,0) as codtiprecdesfavcar, '+
                        'nvl(r.unidnegoc,0) as unidnegoc, '+
                        'nvl(r.codcentrorespon,''9999999999'') as codcentrorespon '+
                        'from histrubsal h, rubricaxplano r, provdesc p '+
                        'where h.mescobranca = '+QuotedStr(sMes)+' '+
//                        'and (flgestorno = 0 or flgestorno is null) '+   //Everson TIBERO
                        'and (h.flgestorno = 0 or h.flgestorno is null) '+ //Everson TIBERO
                        'and h.idfavorecido = '+
                        inttostr(objCAPConvenio_Continuado.idfavorecido)+' ';

                  ssql:=ssql+'and h.idrubrica = '+
                    inttostr(objCAPConvenio_Continuado.idrubrica)+' ';

                  case cbboxAbono.itemindex of
                  1: begin {sem abono}
                       ssql:=ssql+
                         'and h.mes <> '+quotedstr(gsMesAbono)+' '+_clinefeed;
                     end;
                  2: begin {apenas abono}
                       ssql:=ssql+
                         'and h.mes = '+quotedstr(gsMesAbono)+' '+_clinefeed;
                     end;
                  end;

                  ssql:=ssql+'and h.idmodulo = 18 '+
                             'and h.idhstfolhabenef is not null '+
                             'and h.idpatro = r.idpessjur '+
                             'and h.idplanoprev = r.idplanoprev '+
                             'and h.idrubrica = r.idrubrica '+
                             'and h.idrubrica = p.idprovento '+
                             'group by r.codtiprecdesfavcar, r.unidnegoc, r.codcentrorespon, h.idpatro,h.idplanoprev';
                  if FazQuery(qryAux, ssql) then
                  begin
                    while not qryAux.eof do
                    begin
                      try
                        CtrlDocumento.Rateiodocum.SetValues(
                          qryAux.fieldbyname('valor').asfloat, //rValor,
                          0, //rValorOM,
                          0, //rVlrresorcamen: Double;
                          0, //liIdrateiodocum,
                          Sistema.Idempresa, //liIdpessoa,
                          0, //liCoddocumento,
                          qryAux.fieldbyname('UnidNegoc').asinteger, //liUnidnegoc,
                          0, //liMoecodigo,
                          Sistema.Idusuario, //liIdusuarioinclusao,
                          0, //liIdreservaorcamen,
                          Integraback.Plano, //liPlano,
                          qryAux.fieldbyname('idplanoprev').asinteger, //liIdplanoprev,
                          qryAux.fieldbyname('idpatro').asinteger, //liIdpatro,
                          SistemaFolha.IdProgramaFolha, //liIdprograma,
                          0, //liIdprocesso,
                          Sistema.idempresa, //liIdempresa
                          qryAux.fieldbyname('CODTIPRECDESFAVCAR').asstring, //sCodtiprecdes,
                          'R', //sRecpag,
                          qryAux.fieldbyname('CODCENTRORESPON').asstring, //sCodcentrorespon,
                          SistemaFolha.CODCCUSTOFINAN, //sCodcentrocusto,
                          '' //sNumimovel
                          );
                      except
                        on E:Exception do
                        begin
                          memResult.lines.add(e.message);
                          exit;
                        end;
                      end;
                      qryAux.next;
                    end;
                  end
                  else
                    exit;

                  try
                    if not CtrlDocumento.Insert then
                    begin
                      memResult.lines.add(CtrlDocumento.MessageInfo);
                      exit;
                    end;
                  except
                    on E:Exception do
                    begin
                      memResult.lines.add(e.message);
                      exit;
                    end;
                  end;

                  objCAPConvenio_continuado.icoddocumento:=trunc(CtrlDocumento.CodDocumento);
                end;

                //grava linha do documento no processo de convenio
                if not ExecutarQuery(qryAux,
                     'INSERT INTO PROCCONVENIODOC '+
                     '(IDFUNDACAO, IDPROCCONV, IDFAVORECIDO, CODDOCUMENTO,  '+
                     'DATAPAGAMENTO, VALORLIQUIDO, VALOREFETIVO, CODTIPDOC, '+
                     'PLANO, PLACONTA, RECPAG, CODTIPRECDES ) '+
                     'VALUES ('+inttostr(iidfundacao)+', '+
                     inttostr(iprocconv)+', '+
                     inttostr(objCAPConvenio_continuado.idfavorecido)+', '+
                     floattostr(CtrlDocumento.CodDocumento)+', '+
                     'to_date('+QuotedStr(formatdatetime('dd/mm/yyyy',
                     objCAPConvenio_continuado.datapagto))+',''dd/mm/yyyy''), '+
                     oranumero(floattostr(objCAPConvenio_continuado.dvalorliqhist))+', '+
                     oranumero(floattostr(objCAPConvenio_continuado.dvalorliqhist))+', '+
                     inttoStr(SistemaFolha.TipDocConvR)+', '+ inttostr(IntegraBack.Plano)+', '+
                     QuotedStr(objCAPConvenio_continuado.splaconta)+', '+
                     QuotedStr('R')+', 0 '+' )') then
                  exit;
              end;
            end; // FOR

	    //gravar tabela de lotes do tratamento de convênio PROCCONVENIOLOTE  - Convenios Continuados
            qryConvLote2.first;
            while not qryConvLote2.eof do
            begin
              qryConvLote2.edit;
              qryConvLote2.fieldbyname('IDPROCCONV').asinteger:=iprocconv;
              //achar objeto na lista para identificar número do documento vinculado
              objCAPConvenio_Continuado:=(ListaCAPConvenio_Continuado.objects[
                 qryConvLote2.fieldbyname('INDICECAP').asinteger] as tCAPConvenio_Continuado);
              If (objCAPConvenio_Continuado.GeraCAP = 0) and
                 (objCAPConvenio_Continuado.icoddocumento > 0) then  
                 qryConvLote2.fieldbyname('CODDOCUMENTO').asinteger:=objCAPConvenio_Continuado.icoddocumento
              else
                  qryConvLote2.fieldbyname('CODDOCUMENTO').Clear;
              If iidloterubricaindiv = 0 then
                 qryConvLote2.fieldbyname('IDLOTEEXCESSO').clear
              else
                 qryConvLote2.fieldbyname('IDLOTEEXCESSO').asInteger:= iidloterubricaindiv;
              qryConvLote2.post;
              qryConvLote2.next;
            end;
          end;
          try
            qryConvLote2.ApplyUpdates;
          except
            exit;
          end;
          bcomerro:=false;
        except
          bcomerro:=true;
        end;
      finally
        if not bcomerro then
        begin
          if MsgDlg('Processo realizado com sucesso. '+#13+
                    'Confirma gravação das informações ? (S/N) ',
                    'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes then
          begin
            if not Sistema.GravaLogOperacoes('Fechamento de Convênio.') then
              Raise Exception.Create('Não foi possível gravar o log.')
            else
              dtmBaseDados.dbBaseDados.Commit;
          end
          else
            dtmBaseDados.dbBaseDados.rollback;
        end
        else
        begin
          MsgDlg('Processo realizado com problemas. As operações não podem ser efetivadas. ',
                 'Erro',mtError,[mbOk,mbHelp],0);
          dtmBaseDados.dbBaseDados.rollback;
        end;
      end;
    end
    else
    begin
      MsgDlg('Não foi possível obter próximo sequencial para a operação do convênio. '+#13+
             'Entrar em contato com o suporte informando: Problema no SEQPROCESSOCONVENIO.',
             'Erro',mtError,[mbOk,mbHelp],0);
    end;
  end;
  qryConvLote.close;
  qryConvLote2.close;
  pnlParametros.enabled:=true;
end;

function TfrmTratamentoConvenio.PegaCodDocumento(
  ListaCAP: tstringlist; aidfavorecido, aidrubrica: integer): integer;
var lii: integer;
begin
  result:=0;
  for lii:=0 to ListaCAP.count-1 do
  begin
    if ((ListaCAP.objects[lii] as tCAPConvenio).FlgGeraDOC) and
       ((ListaCAP.objects[lii] as tCAPConvenio).icoddocumento > 0) and
       ((ListaCAP.objects[lii] as tCAPConvenio).idfavorecido = aidfavorecido) and
       (((ListaCAP.objects[lii] as tCAPConvenio).idrubnormal = aidrubrica) or
        ((ListaCAP.objects[lii] as tCAPConvenio).idrubdevol = aidrubrica)) then
    begin
      result:=(ListaCAP.objects[lii] as tCAPConvenio).icoddocumento;
      exit;
    end;
  end;
end;

procedure TfrmTratamentoConvenio.fcbtnSalvarClick(Sender: TObject);
 var a, sname: string;
     lst: tstringlist;
     lii, j: integer;
begin
  inherited;
  lst:=tstringlist.create;
  for lii:=0 to fctvInformacoes.Items.count-1 do
  begin
    a:='';
    for j:=0 to fctvInformacoes.Items[lii].level do
      a:=a+'   ';
    lst.add(a+fctvInformacoes.Items[lii].text);
  end;
  if sdFile.execute then
  begin
    sname:=sdFile.filename;
    lst.SaveToFile(sname);
  end;
  lst.free;
end;

procedure TfrmTratamentoConvenio.FormShow(Sender: TObject);
var sMens: String;
    liEmpresa, liExercicio, liPeriodo: Integer;
begin
  inherited;
  liempresa:= sistema.idempresa;
  If SistemaFolha.FLGINTEGRAFINANC = 1 then
  begin
    lblfinanc.Font.Color:= clBlue;
    lblfinanc.caption:= 'Integrado ao Financeiro';
  end
  else
  begin
    lblfinanc.Font.Color:= clRed;
    lblfinanc.caption:= 'Não Integrado ao Financeiro';
  end;

  If Sistemafolha.FLGINTEGRACONTABIL = 1 then
  begin
    lblContabil.Font.Color:= clBlue;
    lblContabil.caption:= 'Integrado a Contabilidade';
  end
  else
  begin
    lblContabil.Font.Color:= clRed;
    lblContabil.caption:= 'Não Integrado a Contabilidade';
  end;

  If (Sistemafolha.FLGINTEGRACONTABIL = 1) and
     (TestaPeriodo(True,'BaseDados',formatdatetime('dd/mm/yyyy', date),
      IntToStr(Sistema.IdModulo),liExercicio,liPeriodo,liEmpresa,sMens)<> 0) then
  begin
    MsgDlg('O Processo de Fechamento de Convênios está sendo executado '+
      'fora do período contábil. ', 'Erro', mtError, [mbOk,mbHelp], 0);
    exit;
  end;

  If SistemaFolha.FLGCAPCONTROLACPMF = 1 then
  begin
    If SistemafOLHA.CODCCUSTOFINAN = '' then
    begin
      MsgDlg('O parametro referente ao Centro de Custo para o Sistema '+#13#13+
        ' de Contas a Pagar não está preenchido. Verifique nos '+#13#13+
        'Parametros Globais do Sistema',' Informação',
        mtInformation, [mbOk, mbHelp], 0);
      exit;
    end;
    If SistemafOLHA.idprogramafolha = 0 then
    begin
      MsgDlg('O parametro referente ao Programa para o Sistema '+#13#13+
        ' de Contas a Pagar não está preenchido. Verifique nos '+#13#13+
        'Parametros Globais do Sistema','Informação',
        mtInformation, [mbOk, mbHelp], 0);
      exit;
    end;
  end;
  iPortFormaFav:=-1;
  iPortFormaFavRec:=-1;
  iPlano:= IntegraBack.Plano;
  WindowState:= wsMaximized;

  dtpDtLancamento.Date := Date; 
end;

procedure TfrmTratamentoConvenio.fcbtnExpandeClick(Sender: TObject);
begin
  inherited;
  fctvInformacoes.FullExpand;
end;

procedure TfrmTratamentoConvenio.fcbtnComprimeClick(Sender: TObject);
begin
  inherited;
  fctvInformacoes.FullCollapse;
end;

function TfrmTratamentoConvenio.VerificaPlanoConta(asconta: string;
  aiplanoconta: integer): boolean;
begin
  try
    qryPlano.close;
    qryPlano.sql.clear;
    qryPlano.sql.add('select plainativa, platipo, plasubconta, placcust '+
                     'from planoconta '+
                     'where placonta = '+QuotedStr(asconta)+
                     'and plano = '+inttostr(aiplanoconta));
    qryPlano.open;
    result:=not qryPlano.isempty;
  except
    result:=false;
  end;
end;

procedure TfrmTratamentoConvenio.FormDestroy(Sender: TObject);
begin
  inherited;
  llistaAuxiliar.free;
end;

procedure tCAPConvenio.SetFlgGeraDOC(const Value: boolean);
begin
  FFlgGeraDOC := Value;
end;

procedure TfrmTratamentoConvenio.VerificaAbono(Sender: TObject);
var lsmes: string;
    lssql: string;
begin
  if cmbMes.ItemIndex <= 8 then
    lsMes:=spnedAno.Text+'/0'+IntToStr(cmbMes.ItemIndex+1)
  else
    lsMes:=spnedAno.Text+'/'+IntToStr(cmbMes.ItemIndex+1);
  lssql:=
    'SELECT ''18-FRMTRATAMENTOCONVENIO-001'' AS TRACESQL, '+_clinefeed+
    '       IDLOTE '+_clinefeed+
    'FROM CTRLINTERFACE '+_clinefeed+
    'WHERE MESREFERENCIA = '+quotedstr(lsmes)+' '+_clinefeed+
    'AND FLGTIPOFOLHA IN (3, 4) '+_clinefeed+
    'AND TIPO = ''B'' '+_clinefeed+
    'AND IDREFERENCIA IS NULL '+_clinefeed;

  if FazQuery(qryAux1, lssql) then
    cbboxAbono.enabled:=true
  else
  begin
    cbboxAbono.itemindex:=0;
    cbboxAbono.enabled:=false;
  end;
end;

procedure tCAPConvenio.SetFlgMultiplaConta(const Value: boolean);
begin
  FFlgMultiplaConta := Value;
end;

procedure tCAPConvenio.SetFlgRubricaLivre(const Value: boolean);
begin
  FFlgRubricaLivre := Value;
end;

procedure tCAPConvenio.SetPlacontaTemp(const Value: string);
begin
  FPlacontaTemp := Value;
end;

function tCAPConvenio.RetornaListaRubrica: string;
var lsrubricas: string;
    lij: integer;
begin
  lsrubricas:='';
  if FlgRubricaLivre then
  begin
    for lij:=0 to lstRubEmDoc.Count-1 do
    begin
      if trim(lstRubEmDoc[lij]) <> '' then
        lsrubricas:=lsrubricas+lstRubEmDoc[lij]+',';
    end;
  end
  else
  begin
    if idrubnormal > 0 then
      lsrubricas:=lsrubricas+inttostr(idrubnormal)+',';
    if idrubdevol > 0 then
      lsrubricas:=lsrubricas+inttostr(idrubdevol)+',';
  end;
  delete(lsrubricas,length(lsrubricas),1);
  result:=lsrubricas;
end;

end.

{==============================================================================|
| UNIT: FTRATAMENTOCONVENIO                                                    |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   CONTROLE MENSAL DO FECHAMENTO DO MOVIMENTO DE CONVÊNIOS PROCESSADOS NA     |
| FOLHA DE BENEFÍCIOS. CARACTERÍSTICAS:                                        |
| - RECUPERA TODAS AS INFORMAÇÕES IMPORTADAS E PROCESSADAS DISPONIBILIZANDO    |
| ATRAVÉS DE UMA ÁRVORE POR FAVORECIDO, CONVÊNIOS, RUBRICAS.                   |
| - CALCULA VALORES IMPORTADOS, PROCESSADOS, EM EXCESSO DE DÉBITO E LÍQUIDO    |
| TOTAL (EM REGISTROS E VALORES MONETÁRIOS).                                   |
| - CÁLCULA OS VALORES AGREGADOS PARA A GERAÇÃO DO CONTAS A PAGAR.             |
| - EFETUA O LANÇAMENTO PARA O MÊS SEGUINTE DOS VALORES EM EXCESSO DE DÉBITO.  |
| - FAZ O ACERTO DO SITENVIO DA TMPDESC PARA OS REGISTROS PROCESSADOS.         |
| - GRAVA AS INFORMAÇÕES PROCESSADAS NAS TABELAS DE PROCESSAMENTO DO FECHAMEN- |
|   TO DOS CONVÊNIOS (PROCESSOCONVENIO, PROCCONVENIOLOTE, PROCCONVENIODOC)     |
| - EFETUA A ELIMINAÇÃO DOS REGISTROS DA TMPDESC PARA OS MESES ANTERIORES.     |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/07/2002 A 16/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13f                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Alteração da Procedure RecuperaInformacoes , para que a query possa pegar|
|     a rubrica quando esta não for fixa no layout.                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/07/2002 A 17/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13f                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Alteração da Função Documento.Rateio.Inserir, para passar os parametros   |
|     relativos a PATRO e ao PLANO                                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13g                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|| - Alterei o form  para contemplar os novos                                  |
|   parametros de integração contábil/financeira da folha                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/12/2002 A 11/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Tratamento da data de pagamento em dias uteis.   |
|   Novo campo na tabela LayoutDesconto "flgDiaUtil".                          |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/01/2002 A 06/01/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF) - Pendência 11331.                                         |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Tratamento do portador forma de pagamento para   |
|   o favorecido - campo "CodPortFormaFav" da tabela "LayoutDesconto".         |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/06/2003 A 18/06/2003                         |
| PENDÊNCIA: 11868                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - VERIFICAR PARAMETRIZAÇÃO DO PORTADOR FORMA DE PAGAMENTO E DE RECEBIMENTO   |
| VINCULADOS AO CONVÊNIO, NÃO PERMITINDO O PROCESSAMENTO.                      |
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
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 01/12/2004 A 01/12/2004                         |
| PENDÊNCIA: 17717                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.15c                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| USAR OBJETOS DE 3 CAMADAS PARA FINANCEIRO                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/12/2004 A 10/12/2004                         |
| PENDÊNCIA: 18295                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.15D                                              |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| CORREÇÃO PARA FECHAMENTO DO ABONO ANUAL                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/12/2004 A 29/12/2004                         |
| PENDÊNCIA: 18319                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.15D                                              |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| TRATAR OPÇÃO PARA FECHAR CONVENIO DE ABONO EM SEPARADO                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/02/2005 A 02/02/2005                         |
| VERSÃO PARA LIBERAÇÃO: 3.05.02                                               |
| CLIENTE: (FCRT)                                                              |
| PENDÊNCIA: 18611                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   TROCAR O PARÂMETRO USADO NA PASSAGEM DA FUCTION INSERIR DA FORCLI DA       |
| CTRLDOCUMENTO. USAR AGORA PRMIDRAMOTIPOCLI AO ÍNVES DE PRMIDRAMOTIPOFOR      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/06/2005 A 23/06/2005                         |
| VERSÃO PARA LIBERAÇÃO: 3.05.04q                                              |
| CLIENTE: (CBS)                                                               |
| PENDÊNCIA: 18700                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Permitir o usuário escolher a data de lançamento,|
|                             datalancto da lanctodocum.                       |
|------------------------------------------------------------------------------}

