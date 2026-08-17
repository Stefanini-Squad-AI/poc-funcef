// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 21/08/2007
// Pendência   : 22108
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------

unit FConsTmpdesc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConsultar, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Tabs,
  ComCtrls, MAHlpBtn, Buttons, TB97, ExtCtrls, DBTables, Wwquery,
  wwdblook, Spin, TB97Tlbr, TEdNum, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmConsTmpdesc = class(TfrmConsultar)
    Splitter1: TSplitter;
    qrytmpdesc: TwwQuery;
    PageControl1: TPageControl;
    tbgeral: TTabSheet;
    tbdatas: TTabSheet;
    tbint: TTabSheet;
    tbsist: TTabSheet;
    qrypatro: TwwQuery;
    qryplanprev: TwwQuery;
    qryplanass: TwwQuery;
    qrycont: TwwQuery;
    qrytipcontr: TwwQuery;
    qryfundacao: TwwQuery;
    qrybenef: TwwQuery;
    qrytipdoc: TwwQuery;
    qryplacontad: TwwQuery;
    qryplacontac: TwwQuery;
    qrycentrespon: TwwQuery;
    qrytipoper: TwwQuery;
    qryalterador: TwwQuery;
    qryunidnegoc: TwwQuery;
    qryplano: TwwQuery;
    qrytiprecdes: TwwQuery;
    rdgrpsist: TRadioGroup;
    qryempresaprop: TwwQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtcobini: TCMDateTimePicker;
    dtcobfin: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtrefini: TCMDateTimePicker;
    dtreffin: TCMDateTimePicker;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    dtrecini: TCMDateTimePicker;
    dtrecfin: TCMDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cmbpatro: TwwDBLookupCombo;
    cmbfundacao: TwwDBLookupCombo;
    cmbemp: TwwDBLookupCombo;
    cmbplanprev: TwwDBLookupCombo;
    cmbplanass: TwwDBLookupCombo;
    cmbcont: TwwDBLookupCombo;
    cmbbenef: TwwDBLookupCombo;
    cmbtipocontr: TwwDBLookupCombo;
    qrycentcustc: TwwQuery;
    qrycentcustd: TwwQuery;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    cmbcentcustd: TwwDBLookupCombo;
    cmbcentcustc: TwwDBLookupCombo;
    cmbunidnegoc: TwwDBLookupCombo;
    cmbcontac: TwwDBLookupCombo;
    cmbalterador: TwwDBLookupCombo;
    cmbplano: TwwDBLookupCombo;
    cmbtipoper: TwwDBLookupCombo;
    cmbtiporecdes: TwwDBLookupCombo;
    cmbtipodoc: TwwDBLookupCombo;
    cmbcontad: TwwDBLookupCombo;
    cmbcentrespon: TwwDBLookupCombo;
    qryform: TwwQuery;
    Label26: TLabel;
    cmbforma: TwwDBLookupCombo;
    rdgrpdestino: TRadioGroup;
    rdgrpcpagar: TRadioGroup;
    tbpessoa: TTabSheet;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    btnvoltar: TBitBtn;
    ednome: TEdit;
    edmat: TEdit;
    edinsc: TEdit;
    tbtipodesc: TTabSheet;
    rdgrptipodesc: TRadioGroup;
    GroupBox4: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    cmbrefini: TComboBox;
    cmbreffin: TComboBox;
    spnrefini: TSpinEdit;
    spnreffin: TSpinEdit;
    GroupBox5: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    cmbcobini: TComboBox;
    cmbcobfin: TComboBox;
    spncobini: TSpinEdit;
    spncobfin: TSpinEdit;
    Label34: TLabel;
    cmbmotivo: TwwDBLookupCombo;
    qrymotivo: TwwQuery;
    dbgrdResultadoIButton: TwwIButton;
    ednumlote: TEditNum;
    ednumordem: TEditNum;
    Label35: TLabel;
    Label36: TLabel;
    tbsit: TTabSheet;
    rdgrpsit: TRadioGroup;
    Procedure Consulta; Override ;
    Procedure AbreQry ;
    procedure FormActivate(Sender: TObject);
    procedure btnvoltarClick(Sender: TObject);
    procedure cmbpatroEnter(Sender: TObject);
    procedure cmbfundacaoEnter(Sender: TObject);
    procedure cmbempEnter(Sender: TObject);
    procedure cmbplanprevEnter(Sender: TObject);
    procedure cmbplanassEnter(Sender: TObject);
    procedure cmbcontEnter(Sender: TObject);
    procedure cmbbenefEnter(Sender: TObject);
    procedure cmbtipocontrEnter(Sender: TObject);
    procedure cmbcentcustdEnter(Sender: TObject);
    procedure cmbcentcustcEnter(Sender: TObject);
    procedure cmbunidnegocEnter(Sender: TObject);
    procedure cmbalteradorEnter(Sender: TObject);
    procedure cmbtiporecdesEnter(Sender: TObject);
    procedure cmbtipoperEnter(Sender: TObject);
    procedure cmbplanoEnter(Sender: TObject);
    procedure cmbtipodocEnter(Sender: TObject);
    procedure cmbcentresponEnter(Sender: TObject);
    procedure cmbcontadEnter(Sender: TObject);
    procedure cmbcontacEnter(Sender: TObject);
    procedure cmbformaEnter(Sender: TObject);
    function  trazmes(mes : string):string;
    procedure cmbmotivoEnter(Sender: TObject);
    procedure bbtnConsultarClick(Sender: TObject);
    procedure dbgrdResultadoTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
  public
     Filtrou : Boolean;
    { Public declarations }
  end;

var
  frmConsTmpdesc: TfrmConsTmpdesc;
  sSql : String;

implementation

uses UMensErro;

function TFrmConsTmpdesc.trazmes(mes : string):string;
var
   saida : string;
begin
   if mes='Janeiro' then saida:='01';
   if mes='Fevereiro' then saida:='02';
   if mes='Março' then saida:='03';
   if mes='Abril' then saida:='04';
   if mes='Maio' then saida:='05';
   if mes='Junho' then saida:='06';
   if mes='Julho' then saida:='07';
   if mes='Agosto' then saida:='08';
   if mes='Setembro' then saida:='09';
   if mes='Outubro' then saida:='10';
   if mes='Novembro' then saida:='11';
   if mes='Dezembro' then saida:='12';
   trazmes := saida;
end;


Procedure TfrmConsTmpdesc.Consulta ;
begin

   sSql := '';
   sSql := ' SELECT  '+
           ' DECODE(T.RECPAG,''P'',''Contas a Pagar'',''R'',''Contas a Receber'') RECPAG , '+
           ' T.MESREFERENCIA , '+
           ' DECODE(T.FLGTIPODESC,''A'',''Contribuição Assistencial'',''P'',''Contribuição Previdenciária'',''B'',''Benefício'', '+
           ' ''C'',''Crédito de Empréstimo'',''H'',''Quitação Antecipada'',''E'',''Parcela de Empréstimo'', '+
           ' ''D'',''Rubrica Individual'',''F'',''Pagamento ao Fornecedor Assistencial'',''G'',''Recebimento de Comissão do Fornecedor'', '+
           ' ''I'',''IRRF'',''J'',''Contribuição Previdenciária já Recebida'',''R'',''Reserva de Poupança'' '+
           ' ,''L'',''Valor Líquido do Benefício'',''T'',''SubItem de Empréstimo'',''M'',''Item isolado de Empréstimo'','+
           ' ''O'',''Transferência de Reservas'',''V'',''Comissionamento'') FLGTIPODESC, '+
           ' T.VALOR , T.DATARECEBIMENTO , T.MESCOBRANCA  ,T.VALORRECEBIDO, '+
           ' T.NUMPRIORIDADE ,  T.ORDEM ,  T.MATRICULA , T.INSCRICAONUMERO , T.VALORBASE1  , T.VALORBASE2, '+
           ' T.VALORBASE3  , DECODE(T.NUMDEPENDSEGURO,''0'',''Participante'',''1'',''Cônjugue'') NUMDEPENDSEGURO , '+
           ' DECODE(T.FLGDESCFOLHA,''P'',''Folha da Patrocinadora'',''B'',''Folha de Benefícios'', '+
           ' ''O'',''Banco'',''N'',''Não é um Desconto'') FLGDESCFOLHA, '+
           ' T.DESCRICAO , T.REFERENCIA, '+
           ' DECODE(T.SISTORIGEM,''17'',''Assistencial'',''18'',''Folha de Benefícios'', '+
           ' ''15'',''Empréstimo'',''16'',''Previdenciário'',''43'',''Previdenciário'') SISTORIGEM , '+
           ' T.PERIODO , T.EXERCICIO, '+
           ' DECODE(T.FLGATRASODEVOL,''A'',''Atraso'',''D'',''Devolução'',''N'',''Normal'') FLGATRASODEVOL , '+
           ' T.CODALTERADOR, '+
           ' T.DATACOBRANCA  ,T.NODOCUMENTO,T.COMPLDOCUMENTO, T.IDLOTE, '+
           ' DECODE(T.SITENVIO,NULL,''Não Enviado'',''0'',''Não Enviado'',''1'',''Enviado'',''2'',''Recebido pelo Ccp'',''3'',''Envio de Estorno'',''4'',''Estornado'',''9'',''Recebido pelo Módulo de Origem'') SITENVIO , '+
           ' M.DESCRICAO MOTIVO , PES.NOME , PESSJUR.NOME PESSJUR ,PLN.PLNPLANIL, '+
           ' DECODE(T.FLGDESCONTO,''1'',''Desconto'',''0'',''Não é Desconto'',''2'',''Desconto Especial'', '+
           ' ''3'',''Desconto apenas Contabilizado'') FLGDESCONTO, CENTC.NOME NOMECENTC , '+
           ' CENTD.NOME NOMECENTD , EMP.NOME EMP , FUND.NOME FUND , PLANO.DESCPLANO, '+
           ' PLANASS.NOME PLANASS, PLANPREV.NOME PLANPREV , CO.NOME CONT, '+
           ' BE.NOME BEN, TIPOCONTREMPTMO.TCEDESCRICAO , PORTADORFORMA.DESCRICAO PORT , '+
           ' TIPOPER.TIPDESCRICAO TIPCODIGO , PROVDESC.DESCRICAO PROVENTO , PLAC.PLANOME PLCONTAC , '+
           ' PLAD.PLANOME PLCONTAD , CENTRESPON.NOME CENTRESPON , SUBCONTA.NOMESUBCONTA, '+
           ' UNIDNEGOCIO.NOME NOMEUNIDNEGOC , TIPOALTERADOR.DESCRICAO ALTERADOR , '+
           ' TIPORECEBDESEMB.DESCRICAO TIPRECDES , TIPODOCRECPAG.DESCRICAO TIPODOC , DEPEN.NOME DEPEN '+
           ' FROM MOTIVO M, PLANPREV , PLANASS , CONTRIBUICAO CO , BENEFICIO BE,  TIPOCONTREMPTMO , TIPOALTERADOR, '+
           '      CENTRESPON, SUBCONTA ,PORTADORFORMA,TIPOPER, CENTCUST CENTD , CENTCUST CENTC ,  '+
           '      CONTRATOEMPTMO, PROVDESC,   '+
           '      UNIDNEGOCIO , TIPORECEBDESEMB , TIPODOCRECPAG , '+
           '      PLANO ,PLANOCONTA PLAD , PLANOCONTA PLAC  , '+
           '      PLANILHA PLN , DOCUMENTO DOC , '+
           '      PESSOA PES , PESSOA PESSJUR ,PESSOA DEPEN , PESSOA EMP , PESSOA FUND, TMPDESC T '+
           ' WHERE '+
           ' T.IDTITULAR = PES.IDPESSOA(+) AND '+
           ' T.IDPESSJUR = PESSJUR.IDPESSOA(+) AND '+
           ' T.IDPESSOA = DEPEN.IDPESSOA(+) AND '+
           ' T.PLACONTAC = PLAC.PLACONTA(+) AND '+
           ' T.PLACONTAD = PLAD.PLACONTA(+) AND  '+
           ' T.PLANO = PLANO.PLANO(+) AND '+
           ' T.PLANO = PLAD.PLANO(+)  AND '+
           ' T.PLANO = PLAC.PLANO (+)  AND '+
           ' T.IDMOTIVO  = M.IDMOTIVO(+) AND '+
           ' T.CODDOCUMENTOPREV = DOC.CODDOCUMENTO(+) AND '+
           ' T.PLNCODIGOPREV = PLN.PLNCODIGO(+) AND '+
           ' T.IDEMPRESAPROP = EMP.IDPESSOA(+) AND '+
           ' T.CODCENTROCUSTOD = CENTD.CODCENTROCUSTO(+) AND '+
           ' T.CODCENTROCUSTOC = CENTC.CODCENTROCUSTO(+) AND '+
           ' T.IDFUNDACAO = FUND.IDPESSOA(+) AND '+
           ' T.IDDESCONTO = CO.IDCONTRIBUICAO(+) AND '+
           ' T.IDDESCONTO = BE.IDBENEFICIO(+) AND '+
           ' T.IDPLANASS = PLANASS.IDPLANASS(+) AND '+
           ' T.IDPLANOPREV = PLANPREV.IDPLANOPREV(+) AND '+

           ' T.IDDESCONTO = CONTRATOEMPTMO.IDCONTRATOEMPTMO(+) AND '+
           ' CONTRATOEMPTMO.IDTIPOCONTREMPTMO = TIPOCONTREMPTMO.IDTIPOCONTREMPTMO(+) AND '+

           ' T.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA(+) AND  '+
           ' T.TIPCODIGO = TIPOPER.TIPCODIGO(+) AND '+
           ' T.IDPROVENTO = PROVDESC.IDPROVENTO(+) AND '+
           ' T.CODCENTRORESPON = CENTRESPON.CODCENTRORESPON(+) AND '+
           ' T.CODSUBCONTA = SUBCONTA.CODSUBCONTA(+) AND  '+
           ' T.UNIDNEGOC = UNIDNEGOCIO.UNIDNEGOC(+) AND '+
           ' T.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+) AND '+
           ' T.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES(+) AND '+
           ' T.RECPAG = TIPORECEBDESEMB.RECPAG(+) AND '+
           ' T.CODTIPDOC = TIPODOCRECPAG.CODTIPDOC(+) AND '+
           ' T.IDEMPRESAPROP = CENTRESPON.IDPESSOA(+) AND '+
           ' T.IDEMPRESAPROP = TIPOALTERADOR.IDEMPRESA(+) AND '+
           ' T.IDEMPRESAPROP = UNIDNEGOCIO.IDPESSOA(+) AND '+
           ' T.IDEMPRESAPROP = TIPORECEBDESEMB.IDPESSOA(+) AND '+
           ' T.IDEMPRESAPROP = CENTD.IDEMPRESA(+) AND '+
           ' T.IDEMPRESAPROP = CENTC.IDEMPRESA(+)    ';

   //parâmetros da consulta

   //sistemas
   if rdgrpsist.itemindex <> 4 then
   begin
      Filtrou := True;
      case rdgrpsist.itemindex of
         0: sSql := sSql + ' AND T.SISTORIGEM IN (''16'',''43'') ';
         1: sSql := sSql + ' AND T.SISTORIGEM = ''17'' ';
         2: sSql := sSql + ' AND T.SISTORIGEM = ''15'' ';
         3: sSql := sSql + ' AND T.SISTORIGEM = ''18'' ';
      end;
   end;

   //destino do envio
   if rdgrpdestino.itemindex <> 4 then
   begin
      Filtrou := True;
      case rdgrpdestino.itemindex of
         0: sSql := sSql + ' AND T.FLGDESCFOLHA = ''P'' ';
         1: sSql := sSql + ' AND T.FLGDESCFOLHA = ''B'' ';
         2: sSql := sSql + ' AND T.FLGDESCFOLHA = ''O'' ';
         3: sSql := sSql + ' AND T.FLGDESCFOLHA = ''N'' ';
      end;
   end;

   //recpag
   if rdgrpcpagar.itemindex <> 2 then
   begin
      Filtrou := True;
      case rdgrpcpagar.itemindex of
         0: sSql := sSql + ' AND T.RECPAG = ''P'' ';
         1: sSql := sSql + ' AND T.RECPAG = ''R'' ';
      end;
   end;

   //tipodesc
   if rdgrptipodesc.itemindex <> 18 then
   begin
      Filtrou := True;
      case rdgrptipodesc.itemindex of
         0:  sSql := sSql + ' AND T.FLGTIPODESC = ''A'' ';
         1:  sSql := sSql + ' AND T.FLGTIPODESC = ''P'' ';
         2:  sSql := sSql + ' AND T.FLGTIPODESC = ''B'' ';
         3:  sSql := sSql + ' AND T.FLGTIPODESC = ''C'' ';
         4:  sSql := sSql + ' AND T.FLGTIPODESC = ''H'' ';
         5:  sSql := sSql + ' AND T.FLGTIPODESC = ''E'' ';
         6:  sSql := sSql + ' AND T.FLGTIPODESC = ''D'' ';
         7:  sSql := sSql + ' AND T.FLGTIPODESC = ''F'' ';
         8:  sSql := sSql + ' AND T.FLGTIPODESC = ''G'' ';
         9:  sSql := sSql + ' AND T.FLGTIPODESC = ''I'' ';
         10: sSql := sSql + ' AND T.FLGTIPODESC = ''J'' ';
         11: sSql := sSql + ' AND T.FLGTIPODESC = ''R'' ';
         12: sSql := sSql + ' AND T.FLGTIPODESC = ''L'' ';
         13: sSql := sSql + ' AND T.FLGTIPODESC = ''T'' ';
         14: sSql := sSql + ' AND T.FLGTIPODESC = ''M'' ';
         15: sSql := sSql + ' AND T.FLGTIPODESC = ''O'' ';
         16: sSql := sSql + ' AND T.FLGTIPODESC = ''V'' ';
         17: sSql := sSql + ' AND T.FLGTIPODESC = ''K'' ';
      end;
   end;



   if rdgrpsit.itemindex <> 7 then
   begin
      Filtrou := True;
      case rdgrpsit.itemindex of
         0:  sSql := sSql + ' AND (T.SITENVIO IS NULL OR T.SITENVIO = ''0'' ) ';
         1:  sSql := sSql + ' AND T.SITENVIO = ''1'' ';
         2:  sSql := sSql + ' AND T.SITENVIO = ''3'' ';
         3:  sSql := sSql + ' AND T.SITENVIO = ''4'' ';
         4:  sSql := sSql + ' AND T.SITENVIO = ''2'' ';
         5:  sSql := sSql + ' AND T.SITENVIO = ''1'' AND VALORRECEBIDO > 0 ';
         6:  sSql := sSql + ' AND T.SITENVIO = ''9'' ';
      end;
   end;


   //datas
   if dtrecini.text <> '' then
   begin
      Filtrou := True;
      sSql := sSql + ' AND DATARECEBIMENTO >= TO_DATE('''+dtrecini.text+''',''DD/MM/YYYY'') ';
   end;
   if dtrecfin.text <> '' then
   begin
      Filtrou := True;
      sSql := sSql + ' AND DATARECEBIMENTO <= TO_DATE('''+dtrecfin.text+''',''DD/MM/YYYY'') ';
   end;

   if dtrefini.text <> '' then
   begin
      Filtrou := True;
      sSql := sSql + ' AND DATAREFERENCIA >= TO_DATE('''+dtrefini.text+''',''DD/MM/YYYY'') ';
   end;
   if dtreffin.text <> '' then
   begin
      Filtrou := True;
      sSql := sSql + ' AND DATAREFERENCIA <= TO_DATE('''+dtreffin.text+''',''DD/MM/YYYY'') ';
   end;

   if dtcobini.text <> '' then
   begin
      Filtrou := True;
      sSql := sSql + ' AND DATACOBRANCA >= TO_DATE('''+dtcobini.text+''',''DD/MM/YYYY'') ';
   end;
   if dtcobfin.text <> '' then
   begin
      Filtrou := True;
      sSql := sSql + ' AND DATACOBRANCA <= TO_DATE('''+dtcobfin.text+''',''DD/MM/YYYY'') ';
   end;

   if cmbrefini.text <> '' then
   begin
      Filtrou := True;
      sSQL := sSQL + ' AND to_date(T.MESREFERENCIA,''yyyy/mm'') >= to_date('''+inttostr(spnrefini.value)+'/'+trazmes(cmbrefini.text)+''',''yyyy/mm'') ';
   end;

   if cmbreffin.text <> '' then
   begin
      Filtrou := True;
      sSQL := sSQL + ' AND to_date(T.MESREFERENCIA,''yyyy/mm'') <= to_date('''+inttostr(spnreffin.value)+'/'+trazmes(cmbreffin.text)+''',''yyyy/mm'') ';
   end;

   if cmbcobini.text <> '' then
   begin
      Filtrou := True;
      sSQL := sSQL + ' AND to_date(T.MESCOBRANCA,''yyyy/mm'') >= to_date('''+inttostr(spncobini.value)+'/'+trazmes(cmbcobini.text)+''',''yyyy/mm'') ';
   end;

   if cmbcobfin.text <> '' then
   begin
      Filtrou := True;
      sSQL := sSQL + ' AND to_date(T.MESCOBRANCA,''yyyy/mm'') <= to_date('''+inttostr(spncobfin.value)+'/'+trazmes(cmbcobfin.text)+''',''yyyy/mm'') ';
   end;



   //geral
   if (cmbpatro.Text <> '') and (qrypatro.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.IDPESSJUR ='+qrypatro.fieldbyname('idpessoa').AsString+' ';
   end;

   if (cmbfundacao.Text <> '') and (qryfundacao.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.IDFUNDACAO ='+qryfundacao.fieldbyname('idpessoa').AsString+' ';
   end;

   if (cmbemp.Text <> '') and (qryempresaprop.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.IDEMPRESAPROP ='+qryempresaprop.fieldbyname('idpessoa').AsString+' ';
   end;

   if (cmbplanprev.Text <> '') and (qryplanprev.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.IDPLANOPREV ='+qryplanprev.fieldbyname('idplanoprev').AsString+' ';
   end;

   if (cmbplanass.Text <> '') and (qryplanass.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.IDPLANASS ='+qryplanass.fieldbyname('idplanass').AsString+' ';
   end;

   if (cmbcont.Text <> '') and (qrycont.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.IDDESCONTO ='+qrycont.fieldbyname('idcontribuicao').AsString+' ';
   end;

   if (cmbbenef.Text <> '') and (qrybenef.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.IDDESCONTO ='+qrybenef.fieldbyname('idbeneficio').AsString+' ';
   end;

   if (cmbtipocontr.Text <> '') and (qrytipcontr.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.IDDESCONTO ='+qrytipcontr.fieldbyname('IDTIPOCONTREMPTMO').AsString+' ';
   end;

   if (cmbmotivo.Text <> '') and (qrymotivo.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.IDMOTIVO ='+qrymotivo.fieldbyname('idmotivo').AsString+' ';
   end;


   //Integração
   if (cmbcentcustd.Text <> '') and (qrycentcustd.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.CODCENTROCUSTOD ='+qrycentcustd.fieldbyname('codcentrocusto').AsString+' ';
   end;

   if (cmbcentcustc.Text <> '') and (qrycentcustc.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.CODCENTROCUSTOC ='+qrycentcustc.fieldbyname('codcentrocusto').AsString+' ';
   end;

   if (cmbunidnegoc.Text <> '') and (qryunidnegoc.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.UNIDNEGOC ='+qryunidnegoc.fieldbyname('unidnegoc').AsString+' ';
   end;

   if (cmbalterador.Text <> '') and (qryalterador.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.CODALTERADOR ='+qryalterador.fieldbyname('codalterador').AsString+' ';
   end;

   if (cmbtiporecdes.Text <> '') and (qrytiprecdes.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.CODTIPRECDES ='+qrytiprecdes.fieldbyname('codtiprecdes').AsString+' ';
   end;

   if (cmbtipoper.Text <> '') and (qrytipoper.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.TIPCODIGO ='+qrytipoper.fieldbyname('tipcodigo').AsString+' ';
   end;

   if (cmbplano.Text <> '') and (qryplano.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.PLANO ='+qryplano.fieldbyname('plano').AsString+' ';
   end;

   if (cmbtipodoc.Text <> '') and (qrytipdoc.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.CODTIPDOC ='+qrytipdoc.fieldbyname('codtipdoc').AsString+' ';
   end;

   if (cmbcentrespon.Text <> '') and (qrycentrespon.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.CODCENTRORESPON ='+qrycentrespon.fieldbyname('codcentrorespon').AsString+' ';
   end;

   if (cmbcontad.Text <> '') and (qryplacontad.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.PLACONTAD ='+qryplacontad.fieldbyname('placonta').AsString+' ';
   end;

   if (cmbcontac.Text <> '') and (qryplacontac.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.PLACONTAC ='+qryplacontac.fieldbyname('placonta').AsString+' ';
   end;

   if (cmbforma.Text <> '') and (qryform.active) then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.CODPORTFORMA ='+qryform.fieldbyname('codportforma').AsString+' ';
   end;


   //pessoa
   if ednome.text <> '' then
   begin
      Filtrou := True;
      sSql := sSql + ' AND UPPER(PES.NOME) LIKE ''%'+uppercase(ednome.text)+'%'' ';
   end;

   if edmat.text <> '' then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.MATRICULA = '''+edmat.text+''' ';
   end;

   if edinsc.text <> '' then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.INSCRICAONUMERO = '+edinsc.text+' ';
   end;

   if ednumlote.text <> '' then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.IDLOTE = '+ednumlote.text+' ';
   end;

   if ednumordem.text <> '' then
   begin
      Filtrou := True;
      sSql := sSql + ' AND T.ORDEM = '+ednumordem.text+' ';
   end;




   if not Filtrou then
   if MsgDlg('Não é aconselhavel consultar sem preencher alguns campos do filtro. Deseja continuar mesmo assim ?','Aviso',mtInformation,[mbYes,mbNo],0) = mrNo then Exit;

   qrytmpdesc.close;
   qrytmpdesc.sql.clear;
   qrytmpdesc.sql.add(sSql);
   qrytmpdesc.open;

end;

Procedure TfrmConsTmpdesc.AbreQry ;
var i : Integer;
begin
   for i:= 0 to frmConsTmpdesc.componentcount -1 do
   begin
      if frmConsTmpdesc.components[i] is Twwquery
      then TwwQuery(frmConsTmpdesc.components[i]).Active := True;
   end;
end;

{$R *.DFM}

procedure TfrmConsTmpdesc.FormActivate(Sender: TObject);
begin
  inherited;

  spnrefini.Value := StrtoInt(Copy(FormatDateTime('dd/mm/yyyy', date),7,4));
  spnreffin.Value := StrtoInt(Copy(FormatDateTime('dd/mm/yyyy', date),7,4));
  spncobini.Value := StrtoInt(Copy(FormatDateTime('dd/mm/yyyy', date),7,4));
  spncobfin.Value := StrtoInt(Copy(FormatDateTime('dd/mm/yyyy', date),7,4));
end;

procedure TfrmConsTmpdesc.btnvoltarClick(Sender: TObject);
begin
  inherited;

  cmbpatro.text           := '';
  cmbplanass.text         := '';
  cmbplanprev.text        := '';
  cmbfundacao.text        := '';
  cmbemp.text             := '';
  cmbcont.text            := '';
  cmbbenef.text           := '';
  cmbtipocontr.text       := '';
  ednome.text             := '';
  edmat.text              := '';
  edinsc.text             := '';
  dtrecini.text           := '';
  dtrecfin.text           := '';
  dtrefini.text           := '';
  dtreffin.text           := '';
  dtcobini.text           := '';
  dtcobfin.text           := '';
  cmbcentcustd.text       := '';
  cmbcentcustc.text       := '';
  cmbunidnegoc.text       := '';
  cmbalterador.text       := '';
  cmbtiporecdes.text      := '';
  cmbtipoper.text         := '';
  cmbplano.text           := '';
  cmbtipodoc.text         := '';
  cmbcentrespon.text      := '';
  cmbcontad.text          := '';
  cmbcontac.text          := '';
  cmbforma.text           := '';
  rdgrpsist.itemindex     :=  4;
  rdgrpdestino.itemindex  :=  4;
  rdgrpcpagar.itemindex   :=  2;
  rdgrptipodesc.itemindex := 18;
  cmbrefini.text          := '';
  cmbreffin.text          := '';
  cmbcobini.text          := '';
  cmbcobfin.text          := '';

  spnrefini.Value         := StrtoInt(Copy(FormatDateTime('dd/mm/yyyy', date),7,4));
  spnreffin.Value         := StrtoInt(Copy(FormatDateTime('dd/mm/yyyy', date),7,4));
  spncobini.Value         := StrtoInt(Copy(FormatDateTime('dd/mm/yyyy', date),7,4));
  spncobfin.Value         := StrtoInt(Copy(FormatDateTime('dd/mm/yyyy', date),7,4));

  cmbmotivo.text          := '';
  rdgrpsit.itemindex      :=  7;
end;

procedure TfrmConsTmpdesc.cmbpatroEnter(Sender: TObject);
begin
  inherited;
if not qrypatro.active then qrypatro.open;
end;

procedure TfrmConsTmpdesc.cmbfundacaoEnter(Sender: TObject);
begin
  inherited;
if not qryfundacao.active then qryfundacao.open;
end;

procedure TfrmConsTmpdesc.cmbempEnter(Sender: TObject);
begin
  inherited;
if not qryempresaprop.active then qryempresaprop.open;
end;

procedure TfrmConsTmpdesc.cmbplanprevEnter(Sender: TObject);
begin
  inherited;
if not qryplanprev.active then qryplanprev.open;
end;

procedure TfrmConsTmpdesc.cmbplanassEnter(Sender: TObject);
begin
  inherited;
if not qryplanass.active then qryplanass.open;
end;

procedure TfrmConsTmpdesc.cmbcontEnter(Sender: TObject);
begin
  inherited;
if not qrycont.active then qrycont.open;
end;

procedure TfrmConsTmpdesc.cmbbenefEnter(Sender: TObject);
begin
  inherited;
if not qrybenef.active then qrybenef.open;
end;

procedure TfrmConsTmpdesc.cmbtipocontrEnter(Sender: TObject);
begin
  inherited;
if not qrytipcontr.active then qrytipcontr.open;
end;

procedure TfrmConsTmpdesc.cmbcentcustdEnter(Sender: TObject);
begin
  inherited;
if not qrycentcustd.active then qrycentcustd.open;
end;

procedure TfrmConsTmpdesc.cmbcentcustcEnter(Sender: TObject);
begin
  inherited;
if not qrycentcustc.active then qrycentcustc.open;
end;

procedure TfrmConsTmpdesc.cmbunidnegocEnter(Sender: TObject);
begin
  inherited;
if not qryunidnegoc.active then qryunidnegoc.open;
end;

procedure TfrmConsTmpdesc.cmbalteradorEnter(Sender: TObject);
begin
  inherited;
if not qryalterador.active then qryalterador.open;
end;

procedure TfrmConsTmpdesc.cmbtiporecdesEnter(Sender: TObject);
begin
  inherited;
if not qrytiprecdes.active then qrytiprecdes.open;
end;

procedure TfrmConsTmpdesc.cmbtipoperEnter(Sender: TObject);
begin
  inherited;
if not qrytipoper.active then qrytipoper.open;
end;

procedure TfrmConsTmpdesc.cmbplanoEnter(Sender: TObject);
begin
  inherited;
if not qryplano.active then qryplano.open;
end;

procedure TfrmConsTmpdesc.cmbtipodocEnter(Sender: TObject);
begin
  inherited;
if not qrytipdoc.active then qrytipdoc.open;
end;

procedure TfrmConsTmpdesc.cmbcentresponEnter(Sender: TObject);
begin
  inherited;
if not qrycentrespon.active then qrycentrespon.open;
end;

procedure TfrmConsTmpdesc.cmbcontadEnter(Sender: TObject);
begin
  inherited;
if not qryplacontad.active then qryplacontad.open;
end;

procedure TfrmConsTmpdesc.cmbcontacEnter(Sender: TObject);
begin
  inherited;
if not qryplacontac.active then qryplacontac.open;
end;

procedure TfrmConsTmpdesc.cmbformaEnter(Sender: TObject);
begin
  inherited;
if not qryform.active then qryform.open;
end;

procedure TfrmConsTmpdesc.cmbmotivoEnter(Sender: TObject);
begin
  inherited;
if not qrymotivo.active then qrymotivo.Open;
end;

procedure TfrmConsTmpdesc.bbtnConsultarClick(Sender: TObject);
begin
  Filtrou := False;
  inherited;
end;

procedure TfrmConsTmpdesc.dbgrdResultadoTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;

   qrytmpdesc.close;
   qrytmpdesc.sql.clear;
   qrytmpdesc.sql.add(sSql + 'ORDER BY '+AFieldName+'');
   qrytmpdesc.open;

end;

end.
