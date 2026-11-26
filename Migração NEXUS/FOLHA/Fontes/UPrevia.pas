unit UPrevia;

// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
//--------------------------------------------------------------------------------------------------
//**************************************************************************************************
//--------------------------------------------------------------------------------------------------
// Rotina....: CalculoIRRF
// Autor(a)  : Edilaine
// Data      : 19/12/2025
// Pendencia : WO29025
// Alteração : Novo cálculo do IR
//--------------------------------------------------------------------------------------------------
//Pendência   : SIG101624
//Data        : 14/09/2020
//Responsável : Andre Imakawa
//Alteração   : Selecionar perfil de Investimento na funcionalidade de Folha Extra.
//------------------------------------------------------------------------------
//Pendência   : SIG97305
//Data        : 06/02/2020
//Responsável : Andre Imakawa
//Alteração   : Correção do campo CODPROVDESC.
//------------------------------------------------------------------------------
//Pendência   : SIG94637
//Data        : 26/11/2019
//Responsável : Ewerton Beltramini - SIG94637
//Alteração   : Carregando um campo obrigatório.
//------------------------------------------------------------------------------
// Alteração  : IncluiPrevia e RetornaIdPlanoPrev
// Data       : 14/08/2018
// SIG        : 73070
// Autor      : Andre Imakawa
// Descrição  : Correção para Preencher o IDPLANOPREV corretamente.
//***************************************************************************************************
// Alteração  : EfetivaRubricas
// Data       : 28/03/2018
// SIG        : 65767
// Autor      : Andre Imakawa
// Descrição  : Correção para exibir mensagem de erro correto.
//***************************************************************************************************
// Alteração  : fct_idperfil, IncluiPrevia
// Data       : 30/01/2018
// SIG        : 56702
// Autor      : Edilaine Ferraresi
// Descrição  : Alterações para tratar perfil de investimento
//***************************************************************************************************
//Pendência   : SOL 136569 KINTANA 820997
//Responsável : MARCIO DENILSON
//Data        : 16/02/2012
//Descrição   : Rotina tratamento excesso de débito
//------------------------------------------------------------------------------
//Pendência   : SOL 205224
//Responsável : douglas.siqueira
//Descrição   : IN1343 .
//**************************************************************************************************
//Pendência   : SOL 140042 Kintana 900220
//Responsável : Fernando Xavier
//Descrição   : Reembolso INSS .
// -----------------------------------------------------------------------------
// Autor(a)    :  Renato Visoni
// Pendência   :  SOL 143380 Kintana 943521
// Descrição   :  Se eu efetivar duas versões de adto Extra folha, e estornar
// uma o sistema não considera a versão que foi considerado o estorno e apagas
// todas as rubricas individuais da tabela RubricaIndiv.
// Ficando assim sem a cobrança devida na próxima folha normal.
//------------------------------------------------------------------------------
//Rotina: InsereRubrica
//Nº SOL: 131117
//Nº KINTANA: 743569
//Data da Alteração: 19/02/2010
//Responsável: Ádler Souza
//Descrição: Correção no agrupamento dos valores pagos num unico plano.
//**************************************************************************************************
// Autor(a)  : Claudio Faria
// Data      : 06/09/2007
// Rotina    : Objeto Rubrica
// Pendência : 21385
// Descrição : Tratar base de abono e Inss para o calcul do IRRF
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Data      : 25/09/2006
// Rotina    : Objeto Rubrica
// Pendência : 23387
// Descrição : Permitir gravar o plano contábil diferenciado em cada rubrica.
//--------------------------------------------------------------------------------------------------
// Autor(a)  : André Pontes
// Data      : 13/09/2006
// Rotina    :
// Pendência : 21384
// Descrição : Ajustes para correto cálculo do IR, levando-se em conta se é:
//             1) resgate ou benefício continuado
//             2) modalidade (CD ou BD)
//             3) opção de IR (tabela regressiva)
//   Foi implementada a busca desses parâmetros (sModalidade e iTipoOpcaoIR)
//--------------------------------------------------------------------------------------------------

interface

uses Classes, wwQuery, fFrameProgresso, UMensErro, Dialogs;

type TobjRubrica = class
     public
       iidpessoa: integer;
       iidfavorecido: integer;
       iidbeneficio: integer;
       iidrubrica: integer;
       sflgtipodesc: string;
       iflgdesconto: integer;
       iidmotivo: integer;
       iseqrubrica: integer;
       sreferencia: string;
       smes: string;
       rvalorprovento: real;    //valor efetivamente descontado ou provido
       rvalorcotas: real;    //valor em cotas
       rvalorinfo: real;    //valor informado associado a rubrica
       rvalorrecebido: real;    //valor recebido para desconto
       rvalorcalculo: real;    //valor base de cálculo para a regra
       iidregracalculo: integer;
       icodalterador: integer;
       ifontepagadora: integer;
       iflgirrf: integer;
       iidmodulo: integer;
       iflgsrb: integer;
       iflgok: integer;
       iflgconcessao: integer;
       iflgindividual: integer;
       iflgcompoesalpar: integer;
       iflgcompoesalben: integer;
       iflgPA: integer;
       iprioridadde: integer;
       iidempresa: integer;
       srecpag: string;
       scodtiprecdes: string;
       scodcentrocusto: string;
       scodcentrorespon: string;
       sunidnegoc: string;
       iplano: integer;
       splaconta: string;
       iordemfinal: integer;
       iformabasePA: integer;
       itipobasedesconto: integer; {1-suplementação; 2-resgate; 3-inss;
                 4-suplementação+resgate; 5-suplementação+resgate+inss}
       idescontaparcial: integer;
       iusaabono: integer;
       bpossuimargem: boolean;
       sdatainicio: string[10];
       sdatafinal: string[10];
       {itipobase e scodirrfdarf determinam sobre que base de cálculo a
        rubrica incide}
       itipobase: integer; {indice da base na lista de bases de IRRF}
       scodirrfdarf: string;
       iorigem: integer; {0 - provento de beneficio
                                     1 - rubrica da tmpdesc
                                     2 - rubrica individual
                                     3 - internas (IR, CMPF, Arredondamento, correção,...)}
       iidloteorigem: integer;
       idhstfolhabenef : Integer;
       iFlgRubLegal: integer; 
       iidplanocontabil : integer;
       iidperfil : integer; // Andre Imakawa - SIG 101624
       iFlgReprogramar: integer; //Marcio Denilson - SOL 136569 - KINTANA 820997
       scodprovdesc: string;     //Andre Imakawa - SIG 97305

       constructor Create(aiidpessoa, aiidfavorecido,
         aiidbeneficio, aiidrubrica, aiflgdesconto, aiidmotivo,
         aiseqrubrica, aiidregracalculo,
         aifontepagadora, aiflgirrf, aiidmodulo, aiflgsrb, aiflgok, aiflgPA,
         aiformabasePA, aiflgconcessao, aiflgindividual, aiflgcompoesalpar,
         aiflgcompoesalben, aiprioridadde, aiidempresa,
         aitipobasedesconto, aicodalterador, aiplano: integer;
         asflgtipodesc: string; arvalorinfo, arvalorrecebido,
         arvalorcalculo: real; asreferencia, asmes,
         ascodirrfdarf, asrecpag, ascodtiprecdes, ascodcentrocusto,
         ascodcentrorespon, asunidnegoc, asplaconta,
         asdatainicio, asdatafinal: string;
         aidescontaparcial, aiusaabono, aiorigem, aiidloteorigem, aidhstfolhabenef: integer;
         aiFlgRubLegal: integer; 
         aiidplanocontabil : integer;
         aiFlgReprogramar: integer;  //Marcio Denilson - SOL 136569 - KINTANA 820997
         ascodprovdesc: string = ''; //Andre Imakawa - SIG 97305
         aiidperfil: Integer =0 // Andre Imakawa - SIG 101624
         );

       function IncluiPrevia(qryInsere: twwquery;
         ainumeroprocesso, aiidpessjur, aiidpatro,
         aiidplanoprev, aiidtitular, aiidresponsavel, aiidlote,
         aiidplanoorigem, aiidplanocontabil,
         aiseqproposta, aicodmoeda, aiordem, aicodportforma, aidfloatpagto: integer;
         asmespagamento: string; adatapagto: tdatetime; var asmsg: string;
         aidfavdoc: integer;
         aseqdocumento: integer;
         aanomescompreem : string  // SOL 140042 Kintana 900220
         ;  Sidhstbitributacao:string = '' //SOL205224 douglas.siqueira
         ): boolean;

       //edilaine - SIG56702 inicio
       function fct_idperfil(iIDPESSOA,iIDTITULAR,
                             iIDPLANOPREV, iIDPLANOPREVCONTABIL : Integer;
                             sMes :string;
                             var sErro : string;
                             iIDPLANOCONTABIL, iFONTEPAGADORA: Integer): Integer;
       //edilaine - SIG56702 fim
     end;



type TobjBase = class
       itipobase: integer;
       scodirrfdarf: string;
       rvalorbruto: real;
       rvalorliquido: real;
       rproventoirrf: real;
       rdescontoirrf: real;
       rvalorirrf: real;
       iidrubirrf: integer;
       constructor Create(asbase: string; aiindice: integer; ascodirrfdarf: string);
     end;

type TobjRecebedorSimples = class
     protected
       lstRubricas: tstringlist;
       lstMesRefProv: tstringlist;
       {Tipos de bases de irrf:
        - base de suplementação = 'SUPL'+N
        - base de resgate de reserva = 'RESE'
        - base de inss = 'INSS'
        - base de abono anual (13o.) = 'ABON'}
       lstBases: tstringlist;
       rliquidototal: real;
       rMargemDesconto: real;  
       frameProg: TfrmFrameProgresso;
       procedure ControlaContador; virtual;
       procedure EfetuaAtualizacao(aobjrub: TobjRubrica); virtual;
       procedure LimpaLista; virtual;
       function AchaBase(ascodirrfdarf, asnome: string; aiordem: integer;
                         var aiposicao: integer): TobjBase;
       {- asnome identifica a base 'INSS', 'SUPL', 'ABON', 'RESE' e
          para o caso de suplementacao aiordem indica a próxima base
          de suplementação}
       function DeterminaTipoMargem: integer; virtual;
       function VerificaTipoMargem(aitipomargem: integer): string;
       procedure ClassificaRubricaBase(aobjrub: TobjRubrica); virtual;
       {- classifica uma determinada rubrica de provento na devida base para IRRF}
     public
       inumeroprocesso: integer;
       iidpessjur: integer;
       iidpatro: integer;
       iidplanoprev: integer;

       iidplanoorigem: integer; 
       iidplanocontabil: integer; 

       iidtitular: integer;
       iidresponsavel: integer;
       iidlote: integer;
       iseqproposta: integer;
       dtdatanasc: tdatetime;
       inumdepirrf: integer;
       iflgisentoirrf: integer;
       iidmotivofolha: integer;
       iidbeneficiobase: integer;
       icodmoedabase: integer;
       smesmoedabase: string;
       aanomescompreem : string; // SOL 140042 Kintana 900220
       rindicebase: real;
       ifontepgbase: integer;
       {Tipos de margem retratadas em cada entrada do vetor de proventos:
        - margem normal de suplementação;
        - margem de resgate de reserva;
        - margem de inss;
        - margem de abono anual (13o.)}
       smatricula: string;
       sinscricao: string;
       snome: string;
       smesrefprov: string;
       iidrubrefprov: integer;
       objrubinserida: tobjrubrica;
       iflgconcessao: integer;
       icodportforma: integer;
       idfloatpagto: integer;

       ifavdoc: integer; 
       iseqdocumento: integer; 

       sModalidade   : String;   
       iTipoOpcaoIR  : Integer;

       rVlrReducaoIr : double;    //edilaine WO29025
       rVlrTributavel : double;   //edilaine WO29025

       constructor Create(ainumeroprocesso, aiidpessjur, aiidpatro,
         aiidplanoprev, aiidtitular, aiidresponsavel, aiidlote,
         aiidplanoorigem, aiidplanocontabil, 
         ainumdepirrf, aiflgisentoirrf, aiseqproposta, aiflgconcessao,
         aicodportforma, aidfloatpagto: integer;
         adtdatanasc: tdatetime);
       destructor Destroy; override;
       function InsereRubrica(aiidpessoa, aiidfavorecido,
         aiidbeneficio, aiidrubrica, aiflgdesconto, aiidmotivo,
         aiseqrubrica, aicodmoeda, aiidregracalculo,
         aifontepagadora, aiflgirrf, aiidmodulo, aiflgsrb, aiflgok, aiflgPA,
         aiformabasePA, aiflgconcessao, aiflgindividual, aiflgcompoesalpar,
         aiflgcompoesalben, aiprioridadde, aiidempresa, aitipobasedesconto,
         aicodalterador, aiplano: integer;
         asflgtipodesc: string; arvalorinfo, arvalorrecebido,
         arvalorcalculo: real; asreferencia, asmes, ascodirrfdarf,
         asrecpag, ascodtiprecdes, ascodcentrocusto, ascodcentrorespon,
         asunidnegoc, asplaconta, asdatainicio, asdatafinal: string;
         aidescontaparcial, aiusaabono, aiorigem,
         aiidloteorigem, aidhstfolhabenef: integer;
         aiFlgRubLegal: integer; 
         aiidplanocontabil : integer;
         aiFlagReprogramar : integer;    //Marcio Denilson - SOL 136569 - KINTANA 820997
         ascodprovdesc: string='';        //Andre Imakawa - SIG 97305
         aiidperfil: Integer =0 // Andre Imakawa - SIG 101624
         ): boolean; virtual;
       function IdentificaInsereRubrica(aiidpessoa, aiidfavorecido,
         aiidbeneficio, aiidrubrica, aiidmotivo, aiseqrubrica, aicodmoeda,
         aiidregracalculo, aifontepagadora, aiflgok, aiflgPA,
         aiflgconcessao, aiidempresa: integer;
         asflgtipodesc: string; arvalorinfo, arvalorrecebido,
         arvalorcalculo: real; asreferencia, asmes, ascodirrfdarf,
         asrecpag, ascodtiprecdes, ascodcentrocusto, ascodcentrorespon,
         asunidnegoc, asplaconta, asdatainicio, asdatafinal: string;
         aiusaabono, aiorigem, aiidloteorigem, aidhstfolhabenef: integer;
         aiidplanocontabil : integer;
         aiidperfil :integer =0 // Andre Imakawa - SIG 101624 
         ): boolean; virtual;
       procedure DeterminaBasesIRRF; virtual;
       procedure VerificaMargemDesconto; virtual;
       {0 - margens; 1 - bases IRRF}

       procedure CalculoIRRF(asMesPagamento  : String;
                             aDataRef        : TDateTime;
                             iVersaoOriginal : Integer;
                             iRubricaIRRF    : Integer;
                             sCodDarf        : String
                            );

       procedure EfetivaRubricas(qryEfetiva: twwquery; asmespagamento: string;
         adatapagamento: tdatetime); virtual;
     end;

function CriaRecebedor(ainumeroprocesso, aiidpessjur,
         aiidpatro, aiidplanoprev, aiidtitular, aiidresponsavel, aiidlote,
         ainumdepirrf, aiflgisentoirrf, aiseqproposta, aiflgconcessao,
         aicodportforma, aidfloatpagto,
         aiidplanoorigem, aiidplanocontabil : integer;
         adtdatanasc: tdatetime;
         var aobjRec: TObjRecebedorSimples) : boolean;

function RetornaIdPlanoPrev(pIdPlanoContabil, pIdPlanoPrev: Integer): Integer;


implementation

uses sysutils, forms, dbtables, uSistema, dBasedados, UFuncoesUteisFB, uAdmPrevFB,
     uFuncoesFolha, dFolha, uobjfolha
     ,uDataBase;//Renato Visoni SOL 143380 Kintana 943521

constructor TobjRubrica.Create(aiidpessoa, aiidfavorecido,
        aiidbeneficio, aiidrubrica, aiflgdesconto, aiidmotivo,
        aiseqrubrica, aiidregracalculo,
        aifontepagadora, aiflgirrf, aiidmodulo, aiflgsrb, aiflgok, aiflgPA,
        aiformabasePA, aiflgconcessao, aiflgindividual, aiflgcompoesalpar,
        aiflgcompoesalben, aiprioridadde, aiidempresa, 
        aitipobasedesconto, aicodalterador, aiplano: integer;
        asflgtipodesc: string; arvalorinfo, arvalorrecebido,
        arvalorcalculo: real; asreferencia, asmes, ascodirrfdarf,
        asrecpag, ascodtiprecdes, ascodcentrocusto, ascodcentrorespon,
        asunidnegoc, asplaconta, asdatainicio, asdatafinal: string;
        aidescontaparcial, aiusaabono, aiorigem, aiidloteorigem, aidhstfolhabenef: integer;
        aiFlgRubLegal: integer; 
        aiidplanocontabil : integer;
        aiFlgReprogramar: integer;  //Marcio Denilson - SOL 136569 - KINTANA 820997
        ascodprovdesc: string = ''; //Andre Imakawa - SIG 97305
        aiidperfil: Integer = 0 // Andre Imakawa - SIG 101624
        );
begin
  iidpessoa        :=aiidpessoa;
  iidfavorecido    :=aiidfavorecido;
  iidbeneficio     :=aiidbeneficio;
  iidrubrica       :=aiidrubrica;
  sflgtipodesc     :=asflgtipodesc;
  iflgdesconto     :=aiflgdesconto;
  iidmotivo        :=aiidmotivo;
  iseqrubrica      :=aiseqrubrica;
  sreferencia      :=asreferencia;
  smes             :=asmes;
  rvalorprovento   :=0;
  rvalorcotas      :=0;
  rvalorinfo       :=arvalorinfo;
  rvalorrecebido   :=arvalorrecebido;
  rvalorcalculo    :=arvalorcalculo;
  iidregracalculo  :=aiidregracalculo;
  scodirrfdarf     :=ascodirrfdarf; 
  icodalterador    :=aicodalterador;
  ifontepagadora   :=aifontepagadora;
  iflgirrf         :=aiflgirrf;
  iidmodulo        :=aiidmodulo;
  iflgsrb          :=aiflgsrb;
  iflgok           :=aiflgok;
  iflgconcessao    :=aiflgconcessao;
  iflgindividual   :=aiflgindividual;
  iflgcompoesalpar :=aiflgcompoesalpar;
  iflgcompoesalben :=aiflgcompoesalben;
  iflgPA           :=aiflgPA;
  iformabasePA     :=aiformabasePA;
  iprioridadde     :=999999-aiprioridadde;
  iidempresa       :=aiidempresa;
  srecpag          :=asrecpag;
  scodtiprecdes    :=ascodtiprecdes;
  scodcentrocusto  :=ascodcentrocusto;
  scodcentrorespon :=ascodcentrorespon;
  sunidnegoc       :=asunidnegoc;
  iplano           :=aiplano;
  splaconta        :=asplaconta;
  iordemfinal      :=0;
  if aitipobasedesconto in [1..5] then
    itipobasedesconto:=aitipobasedesconto
  else
    itipobasedesconto:=5;
  idescontaparcial :=aidescontaparcial;
  bpossuimargem    :=false;
  iusaabono        :=aiusaabono;
  iorigem          :=aiorigem;
  iidloteorigem    :=aiidloteorigem;
  idhstfolhabenef  :=aidhstfolhabenef;
  sdatainicio      :=asdatainicio;
  sdatafinal       :=asdatafinal;
  iidplanocontabil:=aiidplanocontabil;
  scodprovdesc    :=ascodprovdesc;
  iidPerfil       := aiidperfil; // Andre Imakawa - SIG 101624
end;


// edilaine - SIG56702 inicio
function TobjRubrica.fct_idperfil(iIDPESSOA, iIDTITULAR,
                                  iIDPLANOPREV, iIDPLANOPREVCONTABIL : Integer; sMes :string;
                                  var sErro : string;
                                  iIDPLANOCONTABIL, iFONTEPAGADORA: Integer): Integer;
var queryperfil : TwwQuery;
    sSQL        : string;
    iCiclo      : integer;
begin
  try
    begin
      queryperfil := TwwQuery.Create(Application);
      queryperfil.DataBaseName := 'BaseDados';

      iCiclo := 1;

      repeat
        case iCiclo of
          // Andre Imakawa - SIG 65767 - Inicio
          1 : sSQL := 'SELECT (case ' + #13#10 +
                      '         when (count(distinct(H.IDPERFILINVEST)) = 1) then' + #13#10 +
                      '          to_char(H.IDPERFILINVEST, ''99999999999999'')' + #13#10 +
                      '         else' + #13#10 +
                      '          ''ERRO''' + #13#10 +
                      '       END) as IDPERFIL ' + #13#10 +
                      '  FROM HSTBENEFBFCIARIO H' + #13#10 +
                      '    INNER JOIN BENEFBFCIARIO BF  ' + #13#10 +
                      '     ON BF.IDPLANOPREV = H.IDPLANOPREV AND BF.IDPLANOPREV = H.IDPLANOPREV AND BF.NUMEROPROCESSO = H.NUMEROPROCESSO AND ' + #13#10 +
                      '        BF.IDPESSJUR = H.IDPESSJUR AND BF.IDTITULAR = H.IDTITULAR AND BF.IDPLANOORIGEM  = H.IDPLANOORIGEM AND          ' + #13#10 +
                      '        BF.IDPESSOA = H.IDPESSOA AND BF.SEQPROPOSTA = H.SEQPROPOSTA ' + #13#10 +
                      ' WHERE H.IDPESSOA = ' + IntToStr(iIDPESSOA)        + #13#10 +
                      '   AND H.IDBENEFICIO =' + IntToStr(iidbeneficio)   + #13#10 +
                      '   AND H.IDTITULAR = ' + IntToStr(iIDTITULAR)      + #13#10 +
                      '   AND H.IDPLANOPREV = ' + IntToStr(iIDPLANOPREV)  + #13#10 +
                      '   AND H.MES = (SELECT MAX(BF1.ULTMESPREPARO)      ' + #13#10 +
                      '                                      FROM BENEFBFCIARIO BF1  ' + #13#10 +
                      '                                      WHERE BF1.IDTITULAR = BF.IDTITULAR AND  ' + #13#10 +
                      '                                            BF1.IDBENEFICIO = BF.IDBENEFICIO AND  ' + #13#10 +
                      '                                            BF1.IDPLANOPREV = BF.IDPLANOPREV) ' + #13#10 +
                      '   AND NOT EXISTS (SELECT 1 ' +
                      '                   FROM CTRLINTERFACE C ' +
                      '                   WHERE C.IDLOTE = H.IDLOTE AND ' +
                      '                         NVL(C.FLGRESGATE,0) = 1) ' +
                      ' group by H.IDPERFILINVEST';
          // Andre Imakawa - SIG 65767 - Fim

          2 : sSQL := 'SELECT (case' + #13#10 +
                      '         when (count(distinct(HT.IDPERFILINVEST)) = 1) then' + #13#10 +
                      '          to_char(HT.IDPERFILINVEST, ''99999999999999'')'    + #13#10 +
                      '         else' + #13#10 +
                      '          ''ERRO''' + #13#10 +
                      '       END) as IDPERFIL ' + #13#10 +
                      '  FROM BENEFBFCIARIO HT' + #13#10 +
                      ' WHERE HT.IDTITULAR = ' + IntToStr(iIDTITULAR)    + #13#10 +
                      '   AND HT.IDPESSOA = ' + IntToStr(iIDPESSOA)        + #13#10 +  // Andre Imakawa - SIG 65767
                      '   AND HT.IDBENEFICIO =' + IntToStr(iidbeneficio)   + #13#10 +  // Andre Imakawa - SIG 65767
                      '   AND HT.IDPLANOPREV = '+IntToStr(iIDPLANOPREV)  + #13#10 +
                      ' GROUP BY HT.IDPERFILINVEST';
           // Andre Imakawa - SIG 65767 - Inicio
          3 : sSQL := 'SELECT (case' + #13#10 +
                      '         when (count(distinct(PIE.IDPERFILINVEST)) = 1) then' + #13#10 +
                      '          to_char(PIE.IDPERFILINVEST, ''99999999999999'')'    + #13#10 +
                      '         else' + #13#10 +
                      '          ''ERRO''' + #13#10 +
                      '       END) as IDPERFIL ' + #13#10 +
                      '  FROM PERFILINVXELEG PIE' + #13#10 +
                      ' WHERE PIE.IDPESSOA = ' + IntToStr(iIDTITULAR)    + #13#10 +
                      '   AND PIE.IDPLANOPREV = '+IntToStr(iIDPLANOPREV)  + #13#10 +
                      '   AND TO_CHAR(PIE.DTINICIO, ''YYYY/MM'') <= ' + QuotedStr(smes) + #13#10 +
                      '   AND (PIE.DTFIM IS NULL OR' + #13#10 +
                      '       TO_CHAR(PIE.DTFIM, ''YYYY/MM'') > ' + QuotedStr(smes) + #13#10 + ')'+
                      ' GROUP BY PIE.IDPERFILINVEST';


          4 : sSQL := 'SELECT (case' + #13#10 +
                      '         when (count(distinct(PI.IDPERFILINVEST)) = 1) then' + #13#10 +
                      '          to_char(PI.IDPERFILINVEST, ''99999999999999'')'    + #13#10 +
                      '         else' + #13#10 +
                      '          ''ERRO''' + #13#10 +
                      '       END) as IDPERFIL ' + #13#10 +
                      '  FROM PERFILINVEST PI ' + #13#10 +
                      ' WHERE PI.IDPLANOPREV = '+IntToStr(iIDPLANOPREV)  + #13#10 +
                      ' GROUP BY PI.IDPERFILINVEST';

           5 : sSQL := 'SELECT (case' + #13#10 +
                      '         when (count(distinct(PI.IDPERFILINVEST)) = 1) then' + #13#10 +
                      '          to_char(PI.IDPERFILINVEST, ''99999999999999'')'    + #13#10 +
                      '         else' + #13#10 +
                      '          ''ERRO''' + #13#10 +
                      '       END) as IDPERFIL ' + #13#10 +
                      '  FROM PERFILINVEST PI ' + #13#10 +
                      ' WHERE PI.IDPLANOPREV = '+IntToStr(iIDPLANOPREV)  + #13#10 +
                      '   AND PI.IDPLANPREVCONTAB = '+IntToStr(iIDPLANOPREVCONTABIL)  + #13#10 +
                      ' GROUP BY PI.IDPERFILINVEST';

           6 : sSQL := 'SELECT (case' + #13#10 +
                      '         when (count(distinct(PI.IDPERFILINVEST)) = 1) then' + #13#10 +
                      '          to_char(PI.IDPERFILINVEST, ''99999999999999'')'    + #13#10 +
                      '         else' + #13#10 +
                      '          ''ERRO''' + #13#10 +
                      '       END) as IDPERFIL ' + #13#10 +
                      '  FROM PERFILINVEST PI ' + #13#10 +
                      ' WHERE PI.FLGPADRAOINSS = 1 ' + #13#10 +
                      '   AND PI.IDPLANOPREV = '+IntToStr(iIDPLANOPREV)  + #13#10 +
                      ' GROUP BY PI.IDPERFILINVEST';
           // Andre Imakawa - SIG 65767 - Fim
        end;

        queryperfil.close;
        queryperfil.SQL.Clear;
        queryperfil.SQL.Text := sSQL;
        queryperfil.Open;

        if (queryperfil.RecordCount = 1) and
           (queryperfil.FieldByName('IDPERFIL').AsString <> 'ERRO') then
        begin
           fct_idperfil := queryperfil.FieldByName('IDPERFIL').AsInteger;
           iCiclo := -1;
        end
        else
        begin
          if (not queryperfil.IsEmpty) then
          begin
            //fct_idperfil := 0;// Andre Imakawa - SIG 65767

            if (queryperfil.FieldByName('IDPERFIL').AsString = '0') then
               sErro := 'Erro inserir Prévia, perfil de investimento não localizado. Mês Ref. = '+smes+' | Pessoa: '+IntToStr(iIDPESSOA)+'  Titular: '+IntToStr(iIDTITULAR)+'  Plano: '+IntToStr(iIDPLANOPREV)
            else
               sErro := 'Erro inserir Prévia, mais de um perfil de investimento localizado. Mês Ref. = '+smes+' | IDPESSOA = '+IntToStr(iIDPESSOA)+'  Titular: '+IntToStr(iIDTITULAR)+'  Plano: '+IntToStr(iIDPLANOPREV);
            // Andre Imakawa - SIG 65767 - Inicio            
            //iCiclo := -1;
            if iCiclo = 6 then
              iCiclo := -1
            else
              Inc(iCiclo);
            // Andre Imakawa - SIG 65767 - Fim
          end
          else
          begin
            Inc(iCiclo);
            // Andre Imakawa - SIG 65767 - Inicio
            if (iCiclo = 5) and (iIDPLANOPREVCONTABIL = 0) then
              Inc(iCiclo);

            if (iCiclo = 6) and (ifontepagadora <> 2) then
              Inc(iCiclo);

            if iCiclo > 6 then
            begin
              iCiclo := -1;
              if sErro = '' then
                sErro := 'Erro inserir Prévia, perfil de investimento não localizado. Mês Ref. = '+smes+' | Pessoa: '+IntToStr(iIDPESSOA)+'  Titular: '+IntToStr(iIDTITULAR)+'  Plano: '+IntToStr(iIDPLANOPREV)
            end;
            // Andre Imakawa - SIG 65767 - Fim
          end;
        end;
      until (iCiclo = -1);
    end;

    queryperfil.SQL.Clear;
    queryperfil.Close;

  finally
    FreeAndNil(queryperfil);
  end;
end;
// edilaine - SIG56702 Fim


function TobjRubrica.IncluiPrevia(qryInsere: twwquery;
  ainumeroprocesso, aiidpessjur, aiidpatro,
  aiidplanoprev, aiidtitular, aiidresponsavel, aiidlote,
  aiidplanoorigem, aiidplanocontabil,
  aiseqproposta,
  aicodmoeda, aiordem, aicodportforma, aidfloatpagto: integer;
  asmespagamento: string; adatapagto: tdatetime; var asmsg: string;
  aidfavdoc: integer;
  aseqdocumento: integer;
  aanomescompreem: string   // SOL 140042 Kintana 900220
     ; Sidhstbitributacao:string =''//SOL205224 douglas.siqueira
  ): boolean;
var aiflagPaga : Integer;
    aiIdPerfil : Integer;        //edilaine - SIG56702
begin
  result:=false;
  try
    repeat
      if ainumeroprocesso <> 0 then
        qryInsere.parambyname('numeroprocesso').asinteger :=ainumeroprocesso
      else
        qryInsere.parambyname('numeroprocesso').clear;
      qryInsere.parambyname('idpessjur'        ).asinteger :=aiidpessjur;
      qryInsere.parambyname('idpatro'          ).asinteger :=aiidpatro;
      qryInsere.parambyname('idplanoprev'      ).asinteger :=aiidplanoprev;

      qryInsere.parambyname('idplanoorigem').asinteger := aiidplanoorigem; 

      
      if iidplanocontabil > 0 then
        qryInsere.parambyname('idplanocontabil').asinteger:=iidplanocontabil
      else
        if aiidplanocontabil <= 0 then
          qryInsere.parambyname('idplanocontabil').asinteger:=aiidplanoprev
        else
          qryInsere.parambyname('idplanocontabil').asinteger := aiidplanocontabil; 

      qryInsere.parambyname('idtitular'        ).asinteger :=aiidtitular;
      qryInsere.parambyname('idpessoa'         ).asinteger :=iidpessoa;
      qryInsere.parambyname('idresponsavel'    ).asinteger :=aiidresponsavel;

      qryInsere.parambyname('IDRECEBEPGTO'     ).asinteger := aiidresponsavel;

      if iidfavorecido > 0 then
        qryInsere.parambyname('idfavorecido'     ).asinteger :=iidfavorecido
      else
        qryInsere.parambyname('idfavorecido'     ).clear;
      qryInsere.parambyname('mes'              ).asstring  :=smes;
      qryInsere.parambyname('mescobranca'      ).asstring  :=asmespagamento;
      if iidbeneficio <> 0 then
        qryInsere.parambyname('idbeneficio').asinteger :=iidbeneficio
      else
        qryInsere.parambyname('idbeneficio').clear;
      qryInsere.parambyname('idrubrica'        ).asinteger :=iidrubrica;
      qryInsere.parambyname('idlote'           ).asinteger :=aiidlote;
      qryInsere.parambyname('flgtipodesc'      ).asstring  :=sflgtipodesc;
      qryInsere.parambyname('flgdesconto'      ).asinteger :=iflgdesconto;
      qryInsere.parambyname('idmotivo'         ).asinteger :=iidmotivo;
      qryInsere.parambyname('seqproposta'      ).asinteger :=aiseqproposta;
      qryInsere.parambyname('seqrubrica'       ).asinteger :=aiordem;
      qryInsere.parambyname('referencia'       ).asstring  :=sreferencia;
      if prmFlgCalculoValores = 0 then
        qryInsere.parambyname('valorprovento'  ).asfloat   :=TruncaMoeda(rvalorprovento)
      else
        qryInsere.parambyname('valorprovento'  ).asfloat   :=ArredondaMoeda(rvalorprovento);
      qryInsere.parambyname('valorcotas'       ).asfloat   :=rvalorcotas;
      qryInsere.parambyname('valorinfo'        ).asfloat   :=rvalorinfo;
      if prmFlgCalculoValores = 0 then
        qryInsere.parambyname('valorrecebido'  ).asfloat   :=TruncaMoeda(rvalorrecebido)
      else
        qryInsere.parambyname('valorrecebido'  ).asfloat   :=ArredondaMoeda(rvalorrecebido);
      if aicodmoeda > 0 then
        qryInsere.parambyname('codmoeda').asinteger :=aicodmoeda
      else
        qryInsere.parambyname('codmoeda').clear;
      if iidregracalculo > 0 then
        qryInsere.parambyname('idregracalculo').asinteger :=iidregracalculo
      else
        qryInsere.parambyname('idregracalculo').clear;
      if trim(scodirrfdarf) <> '' then
        qryInsere.parambyname('codirrfdarf').asstring  :=scodirrfdarf
      else
        qryInsere.parambyname('codirrfdarf').clear;
      qryInsere.parambyname('codalterador'     ).asinteger :=icodalterador;
      qryInsere.parambyname('datapagamento'    ).asdatetime:=adatapagto;
      qryInsere.parambyname('fontepagadora'    ).asinteger :=ifontepagadora;
      qryInsere.parambyname('flgirrf'          ).asinteger :=iflgirrf;
      qryInsere.parambyname('idmodulo'         ).asinteger :=iidmodulo;
      qryInsere.parambyname('flgsrb'           ).asinteger :=iflgsrb;
      qryInsere.parambyname('flgok'            ).asinteger :=iflgok;
      qryInsere.parambyname('flgconcessao'     ).asinteger :=iflgconcessao;
      qryInsere.parambyname('flgindividual'    ).asinteger :=iflgindividual;
      qryInsere.parambyname('flgcompoesalpart' ).asinteger :=iflgcompoesalpar;
      qryInsere.parambyname('flgcompoesalbenef').asinteger :=iflgcompoesalben;
      qryInsere.parambyname('ordem'            ).asinteger :=iseqrubrica;

      // TRATA RUBRICAS INFORMATIVAS OU COM RESÍDUO TOTAL
(*
      qryInsere.parambyname('flgpaga').asinteger:=
        byte(not ((sflgtipodesc = 'K') or (rvalorprovento = 0) or (iflgok = 0)));
*)
      //Marcio Denilson - SOL 136569 - KINTANA 820997
      aiflagPaga := byte(not ((sflgtipodesc = 'K') or (rvalorprovento = 0) or (iflgok = 0)));

      if (aiflagPaga = 1) and (sflgtipodesc = 'Y') and (iFlgReprogramar = 1) and ( rvalorrecebido <> rvalorprovento ) then
        aiflagPaga := 0;

      qryInsere.parambyname('flgpaga').asinteger:= aiflagPaga;
      //FIM - SOL 136569 - KINTANA 820997

      // Andre Imakawa - SIG 101624 - Inicio
      if iidperfil = 0 then
      begin
        //Edilaine - SIG56702 inicio
        aiIdPerfil := 0;

        aiIdPerfil := fct_idperfil(iidpessoa, aiidtitular, aiidplanoprev, qryInsere.parambyname('idplanocontabil').asinteger, asmespagamento, asmsg,
                                   qryInsere.parambyname('idplanocontabil').asinteger,
                                   ifontepagadora); // Andre Imakawa - SIG 65767 // Andre Imakawa - SIG 73070

        if aiIdPerfil > 0 then
           qryInsere.parambyname('IDPERFILINVEST').AsInteger := aiIdPerfil
        else
        begin
          // Andre Imakawa - SIG 65767 - Inicio
          MessageDlg(asmsg, mtWarning, [mbOK], 0);
          qryInsere.parambyname('IDPERFILINVEST').Asstring := emptystr;

          //result:= false;
          //Exit;
          // Andre Imakawa - SIG 65767 - Fim
        end;
        //Edilaine - SIG56702 fim
      end
      else
      begin
        qryInsere.parambyname('IDPERFILINVEST').AsInteger := iidperfil;
      end;
      // Andre Imakawa - SIG 101624 - Fim

      qryInsere.parambyname('CODPROVDESC').Asstring := scodprovdesc; //Ewerton Beltramini - SIG94637 //Andre Imakawa - SIG 97305

      if iidempresa > 0 then
        qryInsere.parambyname('idempresa').asinteger :=iidempresa
      else
        qryInsere.parambyname('idempresa').asinteger :=aiidpessjur;
      if trim(srecpag) <> '' then
        qryInsere.parambyname('recpag').asstring:=srecpag
      else
        qryInsere.parambyname('recpag').clear;
      if trim(scodtiprecdes) <> '' then
        qryInsere.parambyname('codtiprecdes').asstring:=scodtiprecdes
      else
        qryInsere.parambyname('codtiprecdes').clear;
      if trim(scodcentrocusto) <> '' then
        qryInsere.parambyname('codcentrocusto').asstring:=scodcentrocusto
      else
        qryInsere.parambyname('codcentrocusto').clear;
      if trim(scodcentrorespon) <> '' then
        qryInsere.parambyname('codcentrorespon').asstring  :=scodcentrorespon
      else
        qryInsere.parambyname('codcentrorespon').clear;
      if trim(sunidnegoc) <> '' then
        qryInsere.parambyname('unidnegoc').asstring  :=sunidnegoc
      else
        qryInsere.parambyname('unidnegoc').clear;
      if iplano > 0 then
        qryInsere.parambyname('plano').asinteger :=iplano
      else
        qryInsere.parambyname('plano').clear;
      if trim(splaconta) <> '' then
        qryInsere.parambyname('placonta').asstring  :=splaconta
      else
        qryInsere.parambyname('placonta').clear;
      if aicodportforma > 0 then
        qryInsere.parambyname('codportforma').asinteger :=aicodportforma
      else
        qryInsere.parambyname('codportforma').clear;
      qryInsere.parambyname('dfloatpagto').asinteger:=aidfloatpagto;
      If idhstfolhabenef = 0 then
         qryInsere.parambyname('idversaopagto').clear
      else
          qryInsere.parambyname('idversaopagto').asinteger:=idhstfolhabenef;

      if aidfavdoc > 0 then
        qryInsere.parambyname('idfavdoc').asinteger:=aidfavdoc 
      else
        qryInsere.parambyname('idfavdoc').clear;

      qryInsere.parambyname('SEQDOCUMENTO').asinteger:=1;

      qryInsere.parambyname('IDSEQINTERNOFB').asinteger := LeUltRegistro(Nil, 'SEQINTERNOFB'); //Renato Visoni SOL 143380 Kintana 943521

      qryInsere.parambyname('MESCOMPREEM').asstring  := aanomescompreem; // SOL 140042 Kintana 900220
      if Trim(Sidhstbitributacao)<>'' then////SOL205224 douglas.siqueira
         qryInsere.parambyname('IDHSTBITRIBUTACAO').asinteger  :=StrToInt(Sidhstbitributacao); ////SOL205224 douglas.siqueira
      try
        qryInsere.execsql;
        break;
      except
         asmsg:='Erro inserir Previa '+' Rubrica = '+inttostr(iidrubrica)+
            '  Mês Ref. = '+smes;
        exit;
      end;
    until false;
    result:=true;
  except
  end;
end;

constructor TobjBase.Create(asbase: string; aiindice: integer; ascodirrfdarf: string);
begin
  inherited create;
  itipobase:=aiindice;
  scodirrfdarf:=ascodirrfdarf;
  rvalorbruto:=0;
  rvalorliquido:=0;
  rproventoirrf:=0;
  rdescontoirrf:=0;
  rvalorirrf:=0;
  iidrubirrf:=0;

  if asbase = 'SUPL' then
    iidrubirrf:=prmIdRubricaIRRF;

  if asbase = 'RESE' then
  begin
    if prmIdRubIRRFResg > 0 then
      iidrubirrf:=prmIdRubIRRFResg
    else
      iidrubirrf:=prmIdRubricaIRRF;
  end;

  if asbase = 'INSS' then
  begin
    if prmIDRUBIRRFINSS > 0 then
      iidrubirrf:=prmIDRUBIRRFINSS
    else
      iidrubirrf:=prmIdRubricaIRRF;
  end;

  if asbase = 'ABON' then
  begin
    if prmIDRUBIRRFABONO > 0 then
      iidrubirrf:=prmIDRUBIRRFABONO
    else
      iidrubirrf:=prmIdRubricaIRRF;
  end;
end;

constructor TobjRecebedorSimples.Create(ainumeroprocesso, aiidpessjur, aiidpatro,
         aiidplanoprev, aiidtitular, aiidresponsavel, aiidlote,
         aiidplanoorigem, aiidplanocontabil, 
         ainumdepirrf, aiflgisentoirrf, aiseqproposta, aiflgconcessao,
         aicodportforma, aidfloatpagto: integer;
         adtdatanasc: tdatetime);
begin
  lstRubricas:=tstringlist.create;
  lstRubricas.Sorted:=true;
  lstRubricas.Duplicates:=dupAccept;
  lstMesRefProv:=tstringlist.create;
  lstMesRefProv.Sorted:=true;
  lstMesRefProv.Duplicates:=dupIgnore;
  lstBases:=tstringlist.create;
  lstBases.Sorted:=true;
  lstBases.Duplicates:=dupIgnore;
  inumeroprocesso:=ainumeroprocesso;
  iidpessjur     :=aiidpessjur;
  iidpatro       :=aiidpatro;
  iidplanoprev   :=aiidplanoprev;

  iidplanoorigem   := aiidplanoorigem; 
  iidplanocontabil := aiidplanocontabil; 

  iidtitular       :=aiidtitular;
  iidresponsavel   :=aiidresponsavel;
  iidlote          :=aiidlote;
  inumdepirrf      :=ainumdepirrf;
  if adtdatanasc = 0 then
    dtdatanasc:=now
  else
    dtdatanasc:=adtdatanasc;
  iflgisentoirrf :=aiflgisentoirrf;
  icodmoedabase  :=0;
  smesmoedabase  :='';
  rindicebase    :=0;
  iseqproposta   :=aiseqproposta;
  iidbeneficiobase:=0;
  iidmotivofolha:=prmIdMotivoFolhaBen;
  ifontepgbase:=1;
  smatricula:='';
  sinscricao:='';
  snome:='';
  smesrefprov:='';
  iidrubrefprov:=0;
  iflgconcessao:=aiflgconcessao;
  icodportforma:=aicodportforma;
  idfloatpagto:=aidfloatpagto;
end;

destructor TobjRecebedorSimples.Destroy;
begin
  LimpaLista;
  lstRubricas.free;
  lstMesRefProv.free;
  lstBases.free;
  inherited;
end;

procedure TobjRecebedorSimples.DeterminaBasesIRRF;
var lii, lnextbase: integer;

  function VerificaBase(asbase: string; aobjrub: TObjRubrica): boolean;
   var Base: TobjBase;
       lproximo, lindice: integer;
  begin
    result:=false;
    lproximo:=0;
    repeat
      Base:=AchaBase('', asbase, lproximo, lindice);
      if Base <> nil then
      begin
        if (aobjrub.iflgirrf = 1) and (aobjrub.iflgdesconto < 2) and
           (aobjrub.sflgtipodesc <> 'K') then
        begin
          Base.rvalorliquido:=Base.rvalorliquido-aobjrub.rvalorrecebido;
          if aobjrub.sflgtipodesc = 'W' then
            Base.rdescontoirrf:=Base.rdescontoirrf+aobjrub.rvalorinfo
          else
            Base.rdescontoirrf:=Base.rdescontoirrf+aobjrub.rvalorrecebido;
          aobjrub.itipobase:=lindice;
          aobjrub.scodirrfdarf:=Base.scodirrfdarf;
          result:=true;
        end;
        break;
      end;
    until (Base = nil);
  end;

begin
  for lii:=0 to lstRubricas.count-1 do
  begin
    with TobjRubrica(lstRubricas.objects[lii]) do
    begin
      if iflgdesconto in [1,2] then
      begin
        rvalorprovento:=0;
        //verifica se é desconto sobre abono anual
        if copy(smes,6,2) = '13' then
          if VerificaBase('ABON', TobjRubrica(lstRubricas.objects[lii])) then
            continue;

        {pode descontar sobre suplementação, ou suplementação+resgate
         ou suplementação+resgate+inss ==> testar sobre suplementação}
        if (itipobasedesconto in [1,4,5]) then
          if VerificaBase('SUPL', TobjRubrica(lstRubricas.objects[lii])) then
            continue;

        {pode descontar sobre resgate, ou suplementação+resgate
         ou suplementação+resgate+inss ==> testar sobre resgate}
        if (itipobasedesconto in [2,4,5]) then
          if VerificaBase('RESE', TobjRubrica(lstRubricas.objects[lii])) then
            continue;

        {pode descontar sobre inss, ou suplementação+inss
         ou suplementação+resgate+inss ==> testar sobre inss}
        if (itipobasedesconto in [3,4,5]) then
          if VerificaBase('INSS', TobjRubrica(lstRubricas.objects[lii])) then
            continue;
      end;
    end;
  end;
end;

procedure TobjRecebedorSimples.VerificaMargemDesconto;
var lii: integer;
    objrub: TobjRubrica;
    rdesc: real;  
begin
  rliquidototal:=0;
  rMargemDesconto:=0;  
  for lii:=0 to lstRubricas.count-1 do
  
  begin
    objrub:=TobjRubrica(lstRubricas.objects[lii]);
    if objrub.iflgdesconto = 0 then
    begin
      if prmFlgCalculoValores = 0 then
        rliquidototal:=rliquidototal+TruncaMoeda(objrub.rValorprovento)
      else
        rliquidototal:=rliquidototal+ArredondaMoeda(objrub.rValorprovento);

      if (SistemaFolha.TipoMargemDesconto <> 2) or
         ((SistemaFolha.TipoMargemDesconto = 2) and (objrub.iFlgRubLegal = 1)) then
      begin
        if prmFlgCalculoValores = 0 then
          rMargemDesconto:=rMargemDesconto+TruncaMoeda(objrub.rValorprovento)
        else
          rMargemDesconto:=rMargemDesconto+ArredondaMoeda(objrub.rValorprovento);
      end;
    end
    else
    begin
      //EFETUA O ABATIMENTO DAS RUBRICAS DE DESCONTO LEGAL ANTES DA APLICAÇÃO DO PERCENTUAL DE MARGEM
      if objrub.iflgdesconto = 1 then
      begin
        if (SistemaFolha.TipoMargemDesconto = 2) and (objrub.iFlgRubLegal = 1) then
        begin
          if prmFlgCalculoValores = 0 then
            rDesc:=TruncaMoeda(objrub.rvalorrecebido)
          else
            rDesc:=ArredondaMoeda(objrub.rvalorrecebido);
          if rMargemDesconto > 0 then
          begin
            if rMargemDesconto > rDesc then
            begin
              rMargemDesconto:=rMargemDesconto-rDesc;
              objrub.rValorprovento:=rdesc;
              rliquidototal:=rliquidototal-rdesc;
              objrub.bpossuimargem:=true;
            end
            else
            begin
              if (objrub.idescontaparcial=1) then
              begin
                objrub.rValorprovento:=rMargemDesconto;
                rMargemDesconto:=0;
                rliquidototal:=rliquidototal-objrub.rValorprovento;
                if (rliquidototal <= 0.009) then
                  rliquidototal:=0;
                objrub.bpossuimargem:=true;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

  //rliquidototal:=rliquidototal*(1-prmMargemDesconto);
  if SistemaFolha.VlrMargemDesconto > 0 then
  begin
    rMargemDesconto:=rMargemDesconto*(1-SistemaFolha.VlrMargemDesconto/100);
    if prmFlgCalculoValores = 0 then
      rMargemDesconto:=TruncaMoeda(rMargemDesconto)
    else
      rMargemDesconto:=ArredondaMoeda(rMargemDesconto);
   end;

  for lii:=0 to lstRubricas.count-1 do
  begin
    objrub:=(lstRubricas.objects[lii] as TobjRubrica);
    objrub.bpossuimargem:=false;
    if objrub.iflgdesconto = 1 then
    begin
      if rliquidototal > 0 then
        if (rliquidototal - objrub.rvalorrecebido >= -0.009) then
        begin
          rliquidototal:=rliquidototal-objrub.rvalorrecebido;
          objrub.rvalorprovento:=objrub.rvalorrecebido;
          objrub.bpossuimargem:=true;
        end
        else
          if (objrub.idescontaparcial=1) then
          begin
            objrub.rvalorprovento:=rliquidototal;
            rliquidototal:=0;
            objrub.bpossuimargem:=true;
          end;
      if rliquidototal <= 0.009 then
        break;
    end;

    if objrub.iflgdesconto = 2 then
      objrub.rvalorprovento:=objrub.rvalorrecebido;
  end;
end;

procedure TobjRecebedorSimples.ControlaContador;
begin
end;

procedure TobjRecebedorSimples.EfetuaAtualizacao(aobjrub: TobjRubrica);
begin
end;

procedure TobjRecebedorSimples.EfetivaRubricas(qryEfetiva: twwquery;
  asmespagamento: string; adatapagamento: tdatetime);
var lik, lii: integer;
    objrub: tobjrubrica;
    smsgretorno: string;
begin
  lik:=0;
  for lii:=0 to lstRubricas.count-1 do
  begin
    objrub:=(lstRubricas.objects[lii] as tobjrubrica);
    if (objrub.iflgdesconto=0) or
       (objrub.bpossuimargem and (objrub.rvalorrecebido > 0)) then
    begin
      inc(lik);
      // Andre Imakawa - SIG 73070 - Inicio
      if objrub.iidplanocontabil > 0 then
        iidplanoprev := RetornaIdPlanoPrev(objrub.iidplanocontabil, iidplanoprev);
      // Andre Imakawa - SIG 73070 - Fim
      if objrub.IncluiPrevia(qryEfetiva,
           inumeroprocesso, iidpessjur, iidpatro, iidplanoprev,
           iidtitular, iidresponsavel, iidlote,
           iidplanoorigem, iidplanocontabil,
           iseqproposta, icodmoedabase, lik,
           icodportforma, idfloatpagto, asmespagamento,
           adatapagamento, smsgretorno,
           ifavdoc, 
           iseqdocumento,
           aanomescompreem   // SOL 140042 Kintana 900220
           ) then
      begin
        ControlaContador;
        EfetuaAtualizacao(objrub);
      end
      else
      // Andre Imakawa - SIG 65767 - Incio
      begin
        if frameprog <> nil then
          frameprog.ExibeMensagem(smsgretorno)
        else
          raise exception.Create(smsgretorno);
      end;
      // Andre Imakawa - SIG 65767 - Fim
    end;
  end;
  // GRAVAR RUBRICAS COM RESIDUO TOTAL OU DE REFERENCIA
  for lii:=0 to lstRubricas.count-1 do
  begin
    objrub:=(lstRubricas.objects[lii] as tobjrubrica);
    if (objrub.rvalorrecebido > 0) and
       (objrub.sflgtipodesc <> 'K') and
       ((objrub.rvalorprovento = 0) or (objrub.iflgok = 0)) then
    begin
      inc(lik);
      // Andre Imakawa - SIG 73070 - Inicio
      if objrub.iidplanocontabil > 0 then
        iidplanoprev := RetornaIdPlanoPrev(objrub.iidplanocontabil, iidplanoprev);
      // Andre Imakawa - SIG 73070 - Fim
      if objrub.IncluiPrevia(qryEfetiva,
           inumeroprocesso, iidpessjur, iidpatro, iidplanoprev,
           iidtitular, iidresponsavel, iidlote,
           iidplanoorigem, iidplanocontabil,
           iseqproposta, icodmoedabase, lik,
           icodportforma, idfloatpagto, asmespagamento,
           adatapagamento, smsgretorno,
           ifavdoc,
           iseqdocumento,
           aanomescompreem     // SOL 140042 Kintana 900220
           ) then
      begin
        ControlaContador;
        EfetuaAtualizacao(objrub);
      end
      else
      // Andre Imakawa - SIG 65767 - Inicio
      begin
        if frameprog <> nil then
          frameprog.ExibeMensagem(smsgretorno)
        else
          raise exception.Create(smsgretorno);
      end;
      // Andre Imakawa - SIG 65767 - Fim
    end;
  end;
  // GRAVAR RUBRICAS INFORMATIVAS
  for lii:=0 to lstRubricas.count-1 do
  begin
    objrub:=(lstRubricas.objects[lii] as tobjrubrica);
    if (objrub.sflgtipodesc = 'K') or (objrub.sflgtipodesc = 'W') then
    begin
      inc(lik);
      // Andre Imakawa - SIG 73070 - Inicio
      if objrub.iidplanocontabil > 0 then
        iidplanoprev := RetornaIdPlanoPrev(objrub.iidplanocontabil, iidplanoprev);
      // Andre Imakawa - SIG 73070 - Fim  
      if objrub.IncluiPrevia(qryEfetiva,
           inumeroprocesso, iidpessjur, iidpatro, iidplanoprev,
           iidtitular, iidresponsavel, iidlote,
           iidplanoorigem, iidplanocontabil,
           iseqproposta, icodmoedabase, lik,
           icodportforma, idfloatpagto, asmespagamento,
           adatapagamento, smsgretorno,
           ifavdoc,
           iseqdocumento,
           aanomescompreem    // SOL 140042 Kintana 900220
           ) then
        ControlaContador
      else
      // Andre Imakawa - SIG 65767 - Inicio
      begin
        if frameprog <> nil then
          frameprog.ExibeMensagem(smsgretorno)
        else
          raise exception.Create(smsgretorno);
      end;
      // Andre Imakawa - SIG 65767 - Fim
    end;
  end;

end;

function TobjRecebedorSimples.InsereRubrica(aiidpessoa, aiidfavorecido,
  aiidbeneficio, aiidrubrica, aiflgdesconto, aiidmotivo,
  aiseqrubrica, aicodmoeda, aiidregracalculo,
  aifontepagadora, aiflgirrf, aiidmodulo, aiflgsrb, aiflgok, aiflgPA,
  aiformabasePA, aiflgconcessao, aiflgindividual, aiflgcompoesalpar,
  aiflgcompoesalben, aiprioridadde, aiidempresa, aitipobasedesconto,
  aicodalterador, aiplano: integer; asflgtipodesc: string;
  arvalorinfo, arvalorrecebido, arvalorcalculo: real;
  asreferencia, asmes, ascodirrfdarf,
  asrecpag, ascodtiprecdes, ascodcentrocusto, ascodcentrorespon,
  asunidnegoc, asplaconta, asdatainicio, asdatafinal: string;
  aidescontaparcial, aiusaabono, aiorigem, aiidloteorigem, aidhstfolhabenef: integer;
  aiFlgRubLegal: integer; 
  aiidplanocontabil : integer;
  aiFlagReprogramar : integer;   //Marcio Denilson - SOL 136569 - KINTANA 820997
  ascodprovdesc: string='';       //Andre Imakawa - SIG 97305
  aiidperfil : integer=0 // Andre Imakawa - SIG 101624
  ): boolean;
 var liindex, lii, liidbeneficio, lifontepagadora: integer;
     lobjrub: tobjrubrica;
     lsordem: string;
     lbnovo: boolean;
begin
  // PARA NÃO INSERIR RUBRICAS COM VALORES ZERADOS OU NEGATIVOS
  if (aiflgPA <> 1) then
    if (asflgtipodesc <> 'Y') and (asflgtipodesc <> 'K') and
       (asflgtipodesc <> 'W') and (arvalorrecebido <= 0) then
    begin
      result:=true;
      exit;
    end;

   // ----------------------------------------------------------------------------------------------
   

   // Passa para o objeto recebedor a modalidade do plano
   with dtmFolha.qryModalidade do
   begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('PIDPLANOPREV').AsInteger  := iidplanoprev;
      ParamByName('PIDRUBRICA').AsInteger    := aiidrubrica;
      Open;

      sModalidade := 'BD';
      if not(isEmpty) then sModalidade := dtmFolha.qryModalidadeTPMODALIDADE.AsString;
      Close;
   end;

   // ----------------------------------------------------------------------------------------------


  result:=false;
  try
    lbnovo:=true;
    if aiidbeneficio = 0 then
      liidbeneficio:=iidbeneficiobase
    else
      liidbeneficio:=aiidbeneficio;
    if aifontepagadora = 0 then
      lifontepagadora:=ifontepgbase
    else
      lifontepagadora:=aifontepagadora;

    { Monta chave na lista com os seguintes campos :
      - flgdesconto,
      - prioridade,
      - mesreferencia,
      - rubrica,
      - seqrubrica}
    lsordem:=inttostr(aiflgdesconto)+#255+
             LeftPadCh(inttostr(aiprioridadde),'0',6)+#255+
             asmes+#255+
             LeftPadCh(inttostr(aiidpessoa),'0',10)+#255+
             LeftPadCh(inttostr(aiidrubrica),'0',6)+#255+
             //Ádler Souza - SOL 131117 - KINTANA 743569
//             LeftPadCh(inttostr(aiseqrubrica),'0',6);
             LeftPadCh(inttostr(aiseqrubrica),'0',6)+#255+
             LeftPadCh(inttostr(aiidplanocontabil),'0',5);
             //Fim - Ádler Souza - SOL 131117 - KINTANA 743569
    if aiflgdesconto = 0 then
    begin
      liindex:=lstRubricas.indexof(lsordem);
      if liindex >= 0 then
      begin
        lobjrub:=(lstRubricas.objects[liindex] as Tobjrubrica);
        lbnovo:=false;
      end;
    end;
    if lbnovo then
    begin
      lobjRub:=TObjRubrica.Create(aiidpessoa, aiidfavorecido,
           liidbeneficio, aiidrubrica, aiflgdesconto, aiidmotivo,
           aiseqrubrica, aiidregracalculo,
           lifontepagadora, aiflgirrf, aiidmodulo, aiflgsrb, aiflgok, aiflgPA,
           aiformabasePA, aiflgconcessao, aiflgindividual, aiflgcompoesalpar,
           aiflgcompoesalben, aiprioridadde, aiidempresa,
           aitipobasedesconto, aicodalterador, aiplano,
           asflgtipodesc, arvalorinfo, arvalorrecebido, arvalorcalculo,
           asreferencia, asmes, ascodirrfdarf,
           asrecpag, ascodtiprecdes, ascodcentrocusto, ascodcentrorespon,
           asunidnegoc, asplaconta, asdatainicio, asdatafinal,
           aidescontaparcial, aiusaabono, aiorigem, aiidloteorigem, aidhstfolhabenef,
           aiFlgRubLegal,
           aiidplanocontabil,
           aiFlagReprogramar,    //Marcio Denilson - SOL 136569 - KINTANA 820997
           ascodprovdesc,         //Andre Imakawa - SIG 97305
           aiidperfil // Andre Imakawa - SIG 101624
           );
    end;
  except
    exit;
  end;

  try
    if lbnovo then
    begin
      lstRubricas.AddObject(lsordem, lobjrub);
      // acrescentar os proventos na base de cálculo
      if aiflgdesconto = 0 then
      begin
        lobjrub.rvalorprovento:=arvalorrecebido;
      end;
      if aiflgdesconto = 2 Then
        lobjrub.rvalorprovento:=arvalorinfo;
    end
    else
    begin
      lobjrub.rvalorprovento:=lobjrub.rvalorprovento+arvalorrecebido;
      lobjrub.rvalorrecebido:=lobjrub.rvalorrecebido+arvalorrecebido;
    end;
    if (lobjrub.iflgdesconto = 0) then
      ClassificaRubricaBase(lobjrub);
  except
    exit;
  end;
  objrubinserida:=lobjrub;
  result:=true;
end;

function TobjRecebedorSimples.IdentificaInsereRubrica(
  aiidpessoa, aiidfavorecido, aiidbeneficio, aiidrubrica, aiidmotivo,
  aiseqrubrica, aicodmoeda, aiidregracalculo, aifontepagadora,
  aiflgok, aiflgPA, aiflgconcessao, aiidempresa: integer;
  asflgtipodesc: string; arvalorinfo, arvalorrecebido,
  arvalorcalculo: real; asreferencia, asmes, ascodirrfdarf,
  asrecpag, ascodtiprecdes, ascodcentrocusto, ascodcentrorespon,
  asunidnegoc, asplaconta, asdatainicio, asdatafinal: string;
  aiusaabono, aiorigem, aiidloteorigem, aidhstfolhabenef: integer;
  aiidplanocontabil : integer;
  aiidperfil: Integer=0 // Andre Imakawa - SIG 101624
  ): boolean;

 var lstipodesc: string;
begin
  lstipodesc:=BuscaDadosRubrica(aiidrubrica, asflgtipodesc);
  result:=false;
  if not dtmFolha.qryProventoPrevia.isempty then
  begin
    try
      if not InsereRubrica(aiidpessoa, aiidfavorecido, aiidbeneficio, aiidrubrica,
               dtmFolha.qryProventoPrevia.FieldByName('flgdesconto').AsInteger,
               aiidmotivo, aiseqrubrica, aicodmoeda, aiidregracalculo,
               aifontepagadora, dtmFolha.qryProventoPrevia.FieldByName('flgirrf').AsInteger,
               Sistema.Idmodulo, 0, aiflgok, aiflgPA,
               dtmFolha.qryProventoPrevia.FieldByName('flgdescpensao').AsInteger,
               aiflgconcessao, 0,
               dtmFolha.qryProventoPrevia.FieldByName('flgcompoesalpart').AsInteger,
               dtmFolha.qryProventoPrevia.FieldByName('flgcompoesalbenef').AsInteger,
               dtmFolha.qryProventoPrevia.FieldByName('numprioridade').AsInteger,
               aiidempresa, dtmFolha.qryProventoPrevia.FieldByName('tipobasedesconto').AsInteger,
               0, 0, lstipodesc, arvalorinfo, arvalorrecebido, arvalorcalculo,
               asreferencia, asmes, ascodirrfdarf, asrecpag, ascodtiprecdes,
               ascodcentrocusto, ascodcentrorespon, asunidnegoc, asplaconta,
               asdatainicio, asdatafinal,
               dtmFolha.qryProventoPrevia.FieldByName('descparcial').asinteger,
               aiusaabono, aiorigem, aiidloteorigem, aidhstfolhabenef,
               dtmFolha.qryProventoPrevia.FieldByName('FLGRUBLEGAL').asinteger, 
               aiidplanocontabil,
               dtmFolha.qryProventoPrevia.FieldByName('FLGREPROGRAMAR').asinteger,       //Marcio Denilson - SOL 136569 - KINTANA 820997
               dtmFolha.qryProventoPrevia.FieldByName('CODPROVDESC').asstring            //Andre Imakawa - SIG 97305
               ,aiidperfil // Andre Imakawa - SIG 101624
               ) then

        frameProg.ExibeMensagem('Erro ao gravar rubrica ['+
          dtmFolha.qryProventoPrevia.FieldByName('CODRUBEXIBICAO').asstring+'] '+
          dtmFolha.qryProventoPrevia.FieldByName('nome').asstring)
      else
        result:=true;
    except
      frameProg.ExibeMensagem('Erro ao gravar rubrica ['+
        dtmFolha.qryProventoPrevia.FieldByName('CODRUBEXIBICAO').asstring+'] '+
        dtmFolha.qryProventoPrevia.FieldByName('nome').asstring);
    end;
  end
  else
    frameProg.ExibeMensagem('Rubrica não encontrada: '+inttostr(aiidrubrica));
end;

procedure TobjRecebedorSimples.LimpaLista;
var lii: integer;
    objrub: tobjrubrica;
    objbase: tobjbase;
begin
  for lii:=0 to lstRubricas.count-1 do
  begin
    objrub:=(lstRubricas.objects[lii] as tobjrubrica);
    objrub.free;
  end;
  for lii:=0 to lstBases.count-1 do
  begin
    objbase:=(lstBases.objects[lii] as tobjbase);
    objbase.free;
  end;
  lstRubricas.clear;
  lstBases.clear;
  lstMesRefProv.clear;
end;

function TobjRecebedorSimples.DeterminaTipoMargem: integer;
begin
  result:=0;
end;

function TobjRecebedorSimples.VerificaTipoMargem(aitipomargem: integer): string;
begin
  case aitipomargem of
    0: result:='SUPL';
    1: result:='RESE';
    2: result:='INSS';
    3: result:='ABON';
  else
    result:='SUPL';  
  end;
end;

procedure TobjRecebedorSimples.ClassificaRubricaBase(aobjrub: TobjRubrica);
 var litipomargem, lproximo, lindice: integer;
     lsbase, lsordem: string;
     lobjbase: tobjbase;
begin
  // TRATAR QDO RUBRICA É DE RESERVA
  if aobjrub.scodirrfdarf = '3223' then
    litipomargem:=1
  else
  begin
    if (aobjrub.sflgtipodesc='B') then
      litipomargem:=DeterminaTipoMargem
    else
      litipomargem:=0;
  end;

  If copy(aobjrub.smes,6,2) = '13' Then
    litipomargem := 3;

  If aobjrub.ifontepagadora = 2 Then
    litipomargem := 2;

  //TRATA BENEFICIO DE REFERENCIA
  if litipomargem = 9 then
  begin
    aobjrub.iflgok:=0;
    aobjrub.sflgtipodesc:='K';
  end
  else
    if (aobjrub.iflgdesconto = 0) then
    begin
      lsbase:=VerificaTipoMargem(litipomargem);
      lproximo:=0;
      lobjbase:=AchaBase(aobjrub.scodirrfdarf, lsbase, lproximo, lindice);
      if lobjbase = nil then
      begin
        inc(lindice);
        lobjbase:=Tobjbase.create(lsbase, lindice, aobjrub.scodirrfdarf);
        if (lsbase = 'SUPL') then
          lsbase:=lsbase+inttostr(lindice);
        lstBases.AddObject(lsbase, lobjbase);
      end
      else
      begin
        if (lsbase = 'SUPL') and (lobjbase.scodirrfdarf <> aobjrub.scodirrfdarf) then
        begin
          inc(lindice);
          lobjbase:=Tobjbase.create(lsbase, lindice, aobjrub.scodirrfdarf);
          if (lsbase = 'SUPL') then
            lsbase:=lsbase+inttostr(lindice);
          lstBases.AddObject(lsbase, lobjbase);
        end;
      end;
      lobjbase.rvalorbruto:=lobjbase.rvalorbruto+aobjrub.rvalorrecebido;
      lobjbase.rvalorliquido:=lobjbase.rvalorbruto;
      if aobjrub.iflgirrf = 1 then
        lobjbase.rproventoirrf:=lobjbase.rproventoirrf+aobjrub.rvalorrecebido;
      lstMesRefProv.add(aobjrub.smes);
      smesrefprov:=aobjrub.smes;
      iidrubrefprov:=aobjrub.iidrubrica;
    end;
end;

function TobjRecebedorSimples.AchaBase(ascodirrfdarf, asnome: string;
  aiordem: integer; var aiposicao: integer): TobjBase;
{- ascodirrfdarf identifica um determinado tipo de base definido pela SRF
   asnome identifica a base 'INSS', 'SUPL', 'ABON', 'RESE' e
   para o caso de suplementacao aiordem indica a próxima base
   de suplementação}
 var lii: integer;
begin
  result:=nil; aiposicao:=0;
  if ascodirrfdarf = '' then
  begin
    if asnome = 'SUPL' then
      asnome:=asnome+inttostr(aiordem+1);
    aiposicao:=lstBases.indexof(asnome);
    if aiposicao >= 0 then
      result:=(lstBases.objects[aiposicao] as TobjBase);
  end
  else
  begin
    for lii:=0 to lstBases.count-1 do
    begin
      if asnome = '' then
      begin
        if ((lstBases.objects[lii] as Tobjbase).scodirrfdarf = ascodirrfdarf) then
        begin
          aiposicao:=lii;
          result:=(lstBases.objects[aiposicao] as TobjBase);
          break;
        end;
      end
      else
      begin
        if (pos(asnome, lstBases[lii]) > 0) then
        begin
          if ((lstBases.objects[lii] as Tobjbase).scodirrfdarf = ascodirrfdarf) then
          begin
            aiposicao:=lii;
            result:=(lstBases.objects[aiposicao] as TobjBase);
            break;
          end
          else
            aiposicao:=(lstBases.objects[lii] as TobjBase).itipobase;
        end;
      end;
    end;
  end;
end;

procedure TobjRecebedorSimples.CalculoIRRF(asMespagamento: string;
                                           aDataRef         : TDateTime;
                                           iVersaoOriginal  : Integer;
                                           iRubricaIRRF     : Integer;
                                           sCodDarf         : String
                                          );
var
   rvalorirrf, rdeduzdep, rdeduzidade: real;
     dbaseirrfant, dbaseirrf, dpercentual: double;
     lii: integer;
     lobjbase: tobjbase;

begin
  if iflgisentoirrf = 0 then
  begin

//==> colocar tratamento das rubricas de dedução de idade e dependentes.

    for lii:=0 to lstBases.count-1 do
    begin
      lobjbase:=(lstBases.objects[lii] as tobjbase);
      if lobjbase.rproventoirrf > 0 then
      begin
        dbaseirrfant:=lobjbase.rproventoirrf-lobjbase.rdescontoirrf;
        dbaseirrf:=dbaseirrfant;

        if lobjbase.scodirrfdarf = '0561' then
          dbaseIRRF:=dbaseIRRF-SistemaFolha.DeducaoBaseIR0561;

         // ----------------------------------------------------------------------------------------
         
         with dtmFolha.qryTipoOpcaoIR do
         begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('PIDPESSOA').AsInteger     := iidtitular;
            ParamByName('PIDPLANOPREV').AsInteger  := iidplanoprev;
            Open;

            iTipoOpcaoIR := 0;
            if not(isEmpty) then iTipoOpcaoIR := dtmFolha.qryTipoOpcaoIRTIPOOPCAOIR.AsInteger;
            Close;
         end;

         // ----------------------------------------------------------------------------------------

         if sModalidade = 'CD' then
         begin
            if iTipoOpcaoIR = 2 then // opção por tabela regressiva
            begin

               // ----------------------------------------------------------------------------------

               rValorIRRF := dBaseIRRF * 0.35; // retirar - pendência 18849

               // Aqui deve entrar a chamada da CalculaIRRF para tabela regressiva também

               // ----------------------------------------------------------------------------------
            end
            else  // if iTipoOpcaoIR = 2
            begin
               if lobjbase.scodirrfdarf = '3223' then // 3223 -> resgate
               begin
                  rValorIRRF := dBaseIRRF * 0.15;
               end
               else  // if lobjbase.scodirrfdarf = '3223'
               begin
                  // scodirrfdarf = 0561
                  rValorIRRF := SistemaFolha.objIrrf.CalculaIRRF(inumdepirrf,
                                                                 dtdatanasc,
                                                                 dbaseirrf,
                                                                 dPercentual,
                                                                 rVlrReducaoIR, //edilaine WO29025
                                                                 FormatDateTime('dd/mm/yyyy', adataref),
                                                                 0,
                                                                 0, true, rVlrTributavel  //edilaine WO29025
                                                                );
               end;
            end;  // if iTipoOpcaoIR = 2
         end
         else  // if sModalidade = 'CD'
         begin
            rValorIRRF := SistemaFolha.objIrrf.CalculaIRRF(inumdepirrf,
                                                           dtdatanasc,
                                                           dbaseirrf,
                                                           dPercentual,
                                                           rVlrReducaoIR, //edilaine WO29025
                                                           FormatDateTime('dd/mm/yyyy', adataref),
                                                           0,
                                                           0, true, rVlrTributavel  //edilaine WO29025
                                                          );
         end;  // if sModalidade = 'CD'

         // ----------------------------------------------------------------------------------------

        rdeduzdep:=SistemaFolha.objIrrf.VlrDep*inumdepirrf;
        rdeduzidade:=dbaseirrfant-dbaseirrf-rdeduzdep-SistemaFolha.DeducaoBaseIR0561;

        if ((lstBases[lii] <> 'ABON') or
            ((lstBases[lii] = 'ABON') and (prmFLGVLIRVLMINABONO = 0))) and
           (rValorIRRF <= prmVlMinIRFF) then
          Break;

        // GRAVA DEDUCAO POR DEPENDENTE EM RUBRICA ESPECIAL
        if rValorIRRF > 0 then
        begin
          // grava valor da deducao por dependente em rubrica especial
          if (prmIdRubDeducaoDep > 0) and (rdeduzdep > 0) And
             (lobjbase.scodirrfdarf = '0561') then 
            IdentificaInsereRubrica(iidresponsavel, //beneficiario
                      0, //favorecido da rubrica
                      0, //beneficio associado: pega beneficio base
                      prmIdRubDeducaoDep, //codigo da rubrica
                      prmidmotivofolhaben, //motivo do desconto
                      1, //seqrubrica = 1
                      icodmoedabase, //codigo da moeda
                      0, //regra de calculo
                      0, //fonte pagadora: pega fonte pagadora base
                      0, //flgOK
                      0, //flgPA
                      0, //flgconcessao
                      iidpessjur, //id empresa p/ contabilização
                      'K', //flg do tipo de desconto 'C', 'P', 'B', 'Y', 'K'
                      rdeduzdep, //valor informativo associado a rubrica (NÚMERO DE DEPENDENTES)
                      0, //valor da rubrica
                      0, //valor base de calculo para a regra
                      TobjRubrica(lstRubricas.objects[0]).sreferencia, //referencia
                      asMespagamento, //mês de referência
                      lobjbase.scodirrfdarf,  //código IRRF na SRF para o DARF igual ao provento base
                      '', //indice recebimento 'R'ou pagamento 'P'
                      '', //código do tipo de recebimento ou desembolso
                      '', //código do centro de custo
                      '', //código do centro de responsabilidade
                      '', //código da unidade de negócio
                      '', //conta contábil associada
                      '', //data inicio da rubrica
                      '', //data final da rubrica
                      0, //usa no abono anual
                      3, //origem da rubrica
                      0, //lote original do desconto
                      iVersaooriginal,
                      0 
                      ); // versao original

          // GRAVA DEDUCAO POR IDADE EM RUBRICA ESPECIAL
          if (prmIdRubDeducaoIdade > 0) and (rdeduzidade > 0) And
             (lobjbase.scodirrfdarf = '0561') then 
            IdentificaInsereRubrica(iidresponsavel, //beneficiario
                      0, //favorecido da rubrica
                      0, //beneficio associado: pega beneficio base
                      prmIdRubDeducaoIdade, //codigo da rubrica
                      prmidmotivofolhaben, //motivo do desconto
                      1, //seqrubrica = 1
                      icodmoedabase, //codigo da moeda
                      0, //regra de calculo
                      0, //fonte pagadora: pega fonte pagadora base
                      0, //flgOK
                      0, //flgPA
                      0, //flgconcessao
                      iidpessjur, //id empresa p/ contabilização
                      'K', //flg do tipo de desconto 'C', 'P', 'B', 'Y', 'K'
                      rdeduzidade, //valor informativo associado a rubrica (base de calculo do IR)
                      0, //valor da rubrica
                      0, //valor base de calculo para a regra
                      TobjRubrica(lstRubricas.objects[0]).sreferencia, //referencia
                      asMespagamento, //mês de referência
                      lobjbase.scodirrfdarf, //código IRRF na SRF para o DARF igual ao provento base
                      '', //indice recebimento 'R'ou pagamento 'P'
                      '', //código do tipo de recebimento ou desembolso
                      '', //código do centro de custo
                      '', //código do centro de responsabilidade
                      '', //código da unidade de negócio
                      '', //conta contábil associada
                      '', //data inicio da rubrica
                      '', //data final da rubrica
                      0, //usa no abono anual
                      3, //origem da rubrica
                      0, //lote original do desconto
                      iversaooriginal,
                      0 
                      ); //versao original

          if (SistemaFolha.IdRubDescDepIRResgate > 0) and (rdeduzdep > 0) And
             (lobjbase.scodirrfdarf = '3223') then 
            IdentificaInsereRubrica(iidresponsavel, //beneficiario
                      0, //favorecido da rubrica
                      0, //beneficio associado: pega beneficio base
                      SistemaFolha.IdRubDescDepIRResgate, //codigo da rubrica
                      prmidmotivofolhaben, //motivo do desconto
                      1, //seqrubrica = 1
                      icodmoedabase, //codigo da moeda
                      0, //regra de calculo
                      0, //fonte pagadora: pega fonte pagadora base
                      0, //flgOK
                      0, //flgPA
                      0, //flgconcessao
                      iidpessjur, //id empresa p/ contabilização
                      'K', //flg do tipo de desconto 'C', 'P', 'B', 'Y', 'K'
                      rdeduzdep, //valor informativo associado a rubrica (NÚMERO DE DEPENDENTES)
                      0, //valor da rubrica
                      0, //valor base de calculo para a regra
                      TobjRubrica(lstRubricas.objects[0]).sreferencia, //referencia
                      asMespagamento, //mês de referência
                      lobjbase.scodirrfdarf,  //código IRRF na SRF para o DARF igual ao provento base
                      '', //indice recebimento 'R'ou pagamento 'P'
                      '', //código do tipo de recebimento ou desembolso
                      '', //código do centro de custo
                      '', //código do centro de responsabilidade
                      '', //código da unidade de negócio
                      '', //conta contábil associada
                      '', //data inicio da rubrica
                      '', //data final da rubrica
                      0, //usa no abono anual
                      3, //origem da rubrica
                      0, //lote original do desconto
                      iVersaooriginal,
                      0 
                      ); // versao original

          // GRAVA DEDUCAO POR IDADE EM RUBRICA ESPECIAL
          if (SistemaFolha.IdRubDescIdadeIRResgate > 0) and (rdeduzidade > 0) And
             (lobjbase.scodirrfdarf = '3223') then 
            IdentificaInsereRubrica(iidresponsavel, //beneficiario
                      0, //favorecido da rubrica
                      0, //beneficio associado: pega beneficio base
                      SistemaFolha.IdRubDescIdadeIRResgate, //codigo da rubrica
                      prmidmotivofolhaben, //motivo do desconto
                      1, //seqrubrica = 1
                      icodmoedabase, //codigo da moeda
                      0, //regra de calculo
                      0, //fonte pagadora: pega fonte pagadora base
                      0, //flgOK
                      0, //flgPA
                      0, //flgconcessao
                      iidpessjur, //id empresa p/ contabilização
                      'K', //flg do tipo de desconto 'C', 'P', 'B', 'Y', 'K'
                      rdeduzidade, //valor informativo associado a rubrica (base de calculo do IR)
                      0, //valor da rubrica
                      0, //valor base de calculo para a regra
                      TobjRubrica(lstRubricas.objects[0]).sreferencia, //referencia
                      asMespagamento, //mês de referência
                      lobjbase.scodirrfdarf, //código IRRF na SRF para o DARF igual ao provento base
                      '', //indice recebimento 'R'ou pagamento 'P'
                      '', //código do tipo de recebimento ou desembolso
                      '', //código do centro de custo
                      '', //código do centro de responsabilidade
                      '', //código da unidade de negócio
                      '', //conta contábil associada
                      '', //data inicio da rubrica
                      '', //data final da rubrica
                      0, //usa no abono anual
                      3, //origem da rubrica
                      0, //lote original do desconto
                      iversaooriginal,
                      0 
                      ); //versao original

          //Gravar valor do IRRF
          // (iRubricairrf=0 -> Folha de Pagamento Pendente)
          If iRubricaIRRF = 0 then
          begin
              IdentificaInsereRubrica(iidresponsavel, //beneficiario
                        0, //favorecido da rubrica
                        0, //beneficio associado: pega beneficio base
                        lobjbase.iidrubirrf, //codigo da rubrica
                        prmidmotivofolhaben, //motivo do desconto
                        1, //seqrubrica = 1
                        icodmoedabase, //codigo da moeda
                        0, //regra de calculo
                        0, //fonte pagadora: pega fonte pagadora base
                        1, //flgOK
                        0, //flgPA
                        0, //flgconcessao
                        iidpessjur, //id empresa p/ contabilização
                        'I', //flg do tipo de desconto 'C', 'P', 'B', 'Y'
                        dbaseirrf, //valor informativo associado a rubrica (base de calculo do IR)
                        rvalorIRRF, //valor da rubrica
                        0, //valor base de calculo para a regra
                        TobjRubrica(lstRubricas.objects[0]).sreferencia, //referencia
                        asMespagamento, //mês de referência
                        lobjbase.scodirrfdarf, //código IRRF na SRF para o DARF igual ao provento base
                        '', //indice recebimento 'R'ou pagamento 'P'
                        '', //código do tipo de recebimento ou desembolso
                        '', //código do centro de custo
                        '', //código do centro de responsabilidade
                        '', //código da unidade de negócio
                        '', //conta contábil associada
                        '', //data inicio da rubrica
                        '', //data final da rubrica
                        0, //usa no abono anual
                        3, //origem da rubrica
                        0, //lote original do desconto
                        iVersaooriginal,
                        0 
                        ); // versao original
          end else // Folha Extra
          begin
              IdentificaInsereRubrica(iidresponsavel, //beneficiario
                    0, //favorecido da rubrica
                    0, //beneficio associado: pega beneficio base
                    iRubricaIRRF, //codigo da rubrica
                    prmidmotivofolhaben, //motivo do desconto
                    1, //seqrubrica = 1
                    icodmoedabase, //codigo da moeda
                    0, //regra de calculo
                    0, //fonte pagadora: pega fonte pagadora base
                    1, //flgOK
                    0, //flgPA
                    0, //flgconcessao
                    iidpessjur, //id empresa p/ contabilização
                    'I', //flg do tipo de desconto 'C', 'P', 'B', 'Y'
                    dbaseirrf, //valor informativo associado a rubrica (base de calculo do IR)
                    rvalorIRRF, //valor da rubrica
                    0, //valor base de calculo para a regra
                    TobjRubrica(lstRubricas.objects[0]).sreferencia, //referencia
                    asMespagamento, //mês de referência
                    scodDarf, //código IRRF na SRF para o DARF igual ao provento base
                    '', //indice recebimento 'R'ou pagamento 'P'
                    '', //código do tipo de recebimento ou desembolso
                    '', //código do centro de custo
                    '', //código do centro de responsabilidade
                    '', //código da unidade de negócio
                    '', //conta contábil associada
                    '', //data inicio da rubrica
                    '', //data final da rubrica
                    0, //usa no abono anual
                    3, //origem da rubrica
                    0, //lote original do desconto
                    iVersaooriginal,
                    0 
                    ); // versao original
          end;
        end; // if rValorIRRF > 0 then
      end; // if vproventos[lii].rproventoirrf > 0 then
    end;  // for lii:=0 to 3 do
  end; // if iflgisentoirrf = 0 then
end;

function CriaRecebedor(ainumeroprocesso, aiidpessjur,
         aiidpatro, aiidplanoprev, aiidtitular, aiidresponsavel, aiidlote,
         ainumdepirrf, aiflgisentoirrf, aiseqproposta, aiflgconcessao,
         aicodportforma, aidfloatpagto,
         aiidplanoorigem, aiidplanocontabil : integer; 
         adtdatanasc: tdatetime;
         var aobjRec: TObjRecebedorSimples): boolean;
begin
  try
    if Assigned(aobjRec) then
    begin
      aobjRec.free;
      aobjRec:=nil;
    end;
    aobjRec:=TObjRecebedorSimples.create(ainumeroprocesso, aiidpessjur,
         aiidpatro, aiidplanoprev, aiidtitular, aiidresponsavel, aiidlote,
         aiidplanoorigem, aiidplanocontabil, 
         ainumdepirrf, aiflgisentoirrf, aiseqproposta, aiflgconcessao,
         aicodportforma, aidfloatpagto, adtdatanasc);
    aobjrec.iidmotivofolha:=prmIDMOTIVOFOLHABEN;
    result:=true;
  except
    result:=false;
  end;
end;

function RetornaIdPlanoPrev(pIdPlanoContabil, pIdPlanoPrev: Integer): Integer;
var
  SQL: string;
  query: TwwQuery;
begin
  SQL := ' SELECT IDPLANOPREVPREV ' + #13 + ' FROM PLANPREVCONTABIL ' + #13 + ' WHERE IDPLANOPREV = ' + IntToStr(pIdPlanoContabil) + #13;

  query := TwwQuery.Create(Nil);
  query.DatabaseName := 'BaseDados';
  query.Close;
  query.SQL.Clear;
  query.SQL.Add(SQL);
  query.Open;
  if not (query.isempty) then
    Result := query.FieldByName('IDPLANOPREVPREV').AsInteger
  else
    Result := pIdPlanoPrev;

  query.Close;
  freeandnil(query);
end;
end.
{------------------------------------------------------------------------------|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/08/2003 A 12/08/2003                         |
| PENDÊNCIA: 13995                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01b                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA USAR OBJETO DE IRRF CUSTOMIZADO PARA TABELA DE IR HISTÓRICA.  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/08/2004 A 04/08/2004                         |
| PENDÊNCIA: 17301                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - GRAVAR IDFAVDOC NA PREVIA. QUERY ALTERADAS QRYVIRTUAL E QRYRUBRICAGRAVAR.  |
|                                                                              |
|------------------------------------------------------------------------------|
}

