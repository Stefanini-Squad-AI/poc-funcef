unit uCtrl2ViaContraCheque;

(* -----------------------------------------------------------------------------
ATENÇÃO:
  Antes de executar qualquer alteração no contra-cheque, verificar com o
  responsável pelo sistema de Auto-Atendimento se esta alteração não implicará
  em alguma modificação do sistema. Caso isto não ocorra, haverá o risco dos
  valores ou layout dos contra-cheque emitidos pela web ou por outros sistemas
  não coincidirem.
  DAVID - 20/10/2003
------------------------------------------------------------------------------*)


// Alterações:
{
----------------------------------------------------------------------------------------------------
Pendência   : SIG 122643
Responsável : André Imakawa
Data        : 05/04/2022
Descrição   : Ajuste para corrigir erro de Out Of Memory.
----------------------------------------------------------------------------------------------------
Pendência   : SIG 118538
Responsável : André Imakawa
Data        : 13/08/2021
Descrição   : Ajuste para corrigir erro de Out Of Memory.
----------------------------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 19/02/2018
Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
              Retirada de INDEX, +rule etc.
              Melhoria realizada para adaptação ao TIBERO.
----------------------------------------------------------------------------------------------------
Pendência   : SOL 180539 Kintana 1672078
Responsável : BRUNO AZEVEDO
Data        : 28/05/2012
Descrição   : Ajustes na quebra e ordenação do relatório.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 174874 Kintana 1587812
Responsável : Fanuel Junior
Data        : 28/02/2012
Descrição   : Erro na quebra do relatório
----------------------------------------------------------------------------------------------------
Pendência   : SOL 149616/7141 Kintana 1502408
Responsável : Fanuel Junior
Data        : 05/12/2011
Descrição   : Classificar demonstrativo 2a via por matrícula, mês pagto
----------------------------------------------------------------------------------------------------
Pendência   : SOL 149616 Kintana 1081728
Responsável : Fanuel Junior
Data        : 09/05/2011
Descrição   : Incluido a impressão da lista de recebedores, para impressão da segunda via dos contracheque
----------------------------------------------------------------------------------------------------
Pendência   : SOL 154841 Kintana 1196995
Responsável : Fanuel Junior
Data        : 23/03/2011
Descrição   : Corrigido erro ao agrupar os lançamentos
----------------------------------------------------------------------------------------------------
Pendência   : SOL 148464 KINTANA 1054051
Responsável : BRUNO AZEVEDO
Data        : 07/12/2010
Descrição   : Ajuste na query principal da 2ª via dos contra cheques.
----------------------------------------------------------------------------------------------------
Pendência   : SOL 147061 KINTANA 1016010
Responsável : BRUNO AZEVEDO
Data        : 08/11/2010
Descrição   : Ajuste na query principal da 2ª via dos contra cheques.
----------------------------------------------------------------------------------------------------
Autor(a)  : Renato Visoni
Pendência : SOL 147153 Kintana 1013329
Descricao : Alteração na consulta do relatório de segunda via do contra cheque conforme solicitação
            do Daniel Veloso.
----------------------------------------------------------------------------------------------------
Autor(a)  : Fernando Xavier
Data      : 19/10/2010
Pendência : SOL 146091 KINTANA 988763
Descricao : Ao tentar imprimir a 2ª via dos contracheques as informações estão duplicadas no relatório.
            incluido o distinct e o join .
----------------------------------------------------------------------------------------------------
Autor(a)  : Fernando Xavier
Data      : 18/10/2010
Pendência : SOL 145992 KINTANA 987021
Descricao : Ao tentar imprimir a 2ª via dos contracheques as informações estão duplicadas no relatório.
            incluido o distinct e o join .
----------------------------------------------------------------------------------------------------
Autor(a)  : Fernando Xavier
Data      : 13/10/2010
Pendência : SOL 145036 KINTANA 970354
Descricao :  Comentado o join que pegava a maior conta pois, quando vem do historico
                   nem sempre a ultima é a maior
----------------------------------------------------------------------------------------------------
Autor(a)  : Ádler Souza
Data      : 29/07/2010
Pendência : SOL 140632 KINTANA 883633
Descricao : Correção na geração do relatório de 2ª via do contra-cheques.
----------------------------------------------------------------------------------------------------
Autor(a)  : Ádler Souza
Data      : 26/07/2010
Pendência : SOL 140394 KINTANA 878232
Descricao : Correção na geração do relatório de 2ª via do contra-cheques conforme solicitado.
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 27/07/2007
Rotina    : BuscaDadosRelatorio(...)
Pendência : 23908
Descricao : Inclusão do campo PARCELAS (Prazo - HistRubSal) na query
----------------------------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 25/07/2007
// Rotina      : BuscaDadosRelatorio
// Pendência   : 25950
// Descricao   : Buscar o campo NUMDEPIRRF da HistRubSal e não da PessoaFisica.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 02/04/2007
// Rotina      : BuscaDadosRelatorio e AgrupaRubrica
// Pendência   : 24959
// Descricao   : BuscaDadosRelatório: inverter a condição do "if bflgagruparubrica" que passa a ser
//               "if not bflgagruparubrica".
//               AgrupaRubrica: Colocamos a condição entre parênteses. 
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/03/2007
// Rotina      : BuscaDadosRelatorio
// Pendência   : 24711
// Descricao   : Alteração para obter dados da Histrubsal que não tenham conta
//   bancária, ou que a conta seja tipo OP/Recibo.                        
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 31/10/2006
// Rotina      : BuscaDadosRelatorio
// Pendência   : 23622
// Descricao   : Tratar as informações de banco e agência para os casos em que
//   a informação NUMBANCO ou NUMAGENCIA, foi alterada, ou o banco / agência
//   foi excluído. Nestes casos, o nome do banco ou o nome da agência podem
//   ficar em branco, mas as informações NUMBANCO / NUMAGENCIA / CONTACORRENTE
//   são exibidas. Isto deve ser feito pois na Histrubsal se grava apenas
//   as informações NUMBANCO / NUMAGENCIA / CONTACORRENTE usadas na geração do
//   arquivo eletrônico.
---------------------------------------------------------------------------------------------------}

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, wwQuery, classes;

Type
  TCtrl2ViaContraCheque = class(TCmControlObject)

  private

  protected

  public
    //function GetLista(var sIdHstFolhaBenef2 : String; index : integer = 1000): String;
    //function GetNumIdLista(sIdHstFolhaBenef2 : String): integer;
    function ListaRecebedor(PIdTitular : integer): Olevariant;
    function ListaHistorico(PIdTitular, PIdRecebedor : integer;sDtInicio, sDtFim : string ;const iIdLista : integer = -1): Olevariant;
    function AgrupaRubrica: boolean;
    function BuscaDadosRelatorio(prmFLGUSACODRUBEXT : Integer; bFlgAgrupaRubrica : Boolean;
                                 sIdHstFolhaBenef, sIdTitular, sIdRecebedor : string
                                 ; iIdListaFolha : Integer = -1 // Fanuel
                                 ; DtMesInicio : String =  ''
                                 ; DtMesFim : String = '' ): Olevariant;
    function BuscaDadosFundacao(pIdfundacao : integer): OleVariant;
    function BuscaDataInicio(pIDRUBRICA, pIDPLANOPREV, pIDRESPONSAVEL, pIDPESSJUR : integer): String;
    function BuscaFLGUSACODRUBEXT: Integer;
    function ListaDataPagamento(PIdTitular, PIdRecebedor: integer): Olevariant;
    function BuscaDadosRelRegUnico(
             prmFLGUSACODRUBEXT: Integer; bFlgAgrupaRubrica: Boolean;
             sIdHstFolhaBenef, sIdTitular, sIdRecebedor: string): Olevariant;
  published

end;

implementation

{ TCtrl2ViaContraCheque }

function TCtrl2ViaContraCheque.ListaRecebedor(PIdTitular : integer): Olevariant;
begin
  result:=GetDataPacket(
    'SELECT DISTINCT H.IDRESPONSAVEL AS IDRECEBEDOR, '+
    '       P.NOME, H.IDTITULAR, ''B'' AS TIPO '+
    'FROM HISTRUBSAL H, PESSOA P '+
    'WHERE H.IDTITULAR = '+IntTostr(pidtitular)+' '+
    'AND P.IDPESSOA = H.IDRESPONSAVEL '+
    'ORDER BY P.NOME');
end;

function TCtrl2ViaContraCheque.ListaHistorico(PIdTitular, PIdRecebedor : integer; sDtinicio, sDtFim : string; const iIdlista : integer = -1): Olevariant;
var
qryTeste : TwwQuery;
begin

//Fanuel Junior SOL149616 Kintana1081728
if iIdLista = -1 then
  result := GetDataPacket(' SELECT DISTINCT '+
                          '  	HIS.HISTORICO, '+
                          '   HST.MESCOBRANCA, '+
                          '   HST.IDHSTFOLHABENEF '+
                          ' FROM HISTRUBSAL HST, HSTFOLHABENEF HIS '+
                          ' WHERE HST.IDTITULAR = '+IntToStr(PIdTitular)+
                          '   AND HST.IDRESPONSAVEL = '+IntToStr(PIdRecebedor)+
                          '   AND HIS.IDHSTFOLHABENEF = HST.IDHSTFOLHABENEF '+
                          ' ORDER BY  HST.MESCOBRANCA DESC ')

  else

// result := GetDataPacket(' SELECT /*+rule*/ DISTINCT HIS.HISTORICO, HIS.MESREFERENCIA, HIS.IDHSTFOLHABENEF '+ //Everson TIBERO
 result := GetDataPacket(' SELECT DISTINCT HIS.HISTORICO, HIS.MESREFERENCIA, HIS.IDHSTFOLHABENEF '+
                          ' FROM HSTFOLHABENEF HIS '+
                          ' WHERE  EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD  '+
                          ' WHERE  LD.IDLISTA = '+IntToStr(iIdLista)+'  ) AND '+
//                        ' MESREFERENCIA >= '''+sDtInicio+''' AND MESREFERENCIA <= '''+sDtFim+''''+             //Everson TIBERO
                          ' HIS.MESREFERENCIA >= '''+sDtInicio+''' AND HIS.MESREFERENCIA <= '''+sDtFim+''''+             //Everson TIBERO
//                        ' AND UPPER(HISTORICO) NOT LIKE ''%RESG%'' AND UPPER(HISTORICO) NOT LIKE ''%PORT%'' '+ //Everson TIBERO
                          ' AND UPPER(HIS.HISTORICO) NOT LIKE ''%RESG%'' AND UPPER(HIS.HISTORICO) NOT LIKE ''%PORT%'' '+ //Everson TIBERO
                          ' ORDER BY HIS.MESREFERENCIA DESC');
//Fanuel Junior SOL149616 Kintana1081728

end;

function TCtrl2ViaContraCheque.AgrupaRubrica: boolean;
var cdsAux : TcmClientDataSet;
begin
  cdsAux := TcmClientDataSet.Create(nil);
  try
    result := False;
    cdsAux.Data := GetDataPacket('SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGAGRUPARUBRICA''');
    if not cdsAux.IsEmpty then
      result := not (cdsAux.FieldByName('VALORPARAM').asInteger = 0);
  finally
    cdsAux.Free;
  end;
end;

function TCtrl2ViaContraCheque.BuscaDadosRelatorio(prmFLGUSACODRUBEXT: Integer; bFlgAgrupaRubrica: Boolean;
                                                   sIdHstFolhaBenef, sIdTitular, sIdRecebedor: string
                                                   ; iIdListaFolha : Integer = -1 // Fanuel
                                                   ; DtMesInicio : String =  ''
                                                   ; DtMesFim : String = '' ): Olevariant;
var sSql, sIdHstFolhaBenef2 : string;
 qryTeste : TwwQuery;
 ListaHst,ListaHst2 : TStringList;
 i : integer;
 divisao : real;
begin
  //sSql := 'SELECT * FROM (';
  //Renato Visoni SOL 147153 Kintana 1013329
  //sSql := ' SELECT  DISTINCT HST.IDRESPONSAVEL, HST.IDPLANOPREV, HST.IDPESSJUR, HST.MESCOBRANCA, '+#13 +
//  sSql := sSql + ' SELECT /*+rule*/ HST.IDRESPONSAVEL, HST.IDPLANOPREV, HST.IDPESSJUR, HST.MESCOBRANCA, '+#13 + //Everson TIBERO
  sSql := sSql + ' SELECT HST.IDRESPONSAVEL, HST.IDPLANOPREV, HST.IDPESSJUR, HST.MESCOBRANCA, '+#13 +             //Everson TIBERO
                 ' PVD.IDPROVENTO, TIT.NOME AS TITULAR, BEN.NOME, PT.NOME AS PATROCINADORA, '+#13 +
                 ' HST.NUMBANCO BANCO, HST.NUMAGENCIA AGENCIA, HST.CONTACORRENTE, HST.IDHSTFOLHABENEF, '+#13;

          //Renato Visoni SOL 147153 Kintana 1013329
          //BRUNO AZEVEDO SOL 148464 KINTANA 1054051
         // ' (SELECT DISTINCT max(nome) FROM pessoa, agenciabancaria '+#13 + //BRUNO AZEVEDO SOL 147061 KINTANA 1016010
         // '       WHERE AGENCIABANCARIA.IDPESSOA = PESSOA.IDPESSOA '+#13 +
         // '         AND AGENCIABANCARIA.NUMAGENCIA = HST.NUMAGENCIA) AGENCIA, '+#13 +
         // '      (SELECT DISTINCT max(nome) FROM pessoa, agenciabancaria '+#13 + //BRUNO AZEVEDO SOL 147061 KINTANA 1016010
         // '       WHERE AGENCIABANCARIA.IDBANCO = PESSOA.IDPESSOA '+#13 +
         // '         AND AGENCIABANCARIA.NUMAGENCIA = HST.NUMAGENCIA) BANCO , '+#13;
          //BRUNO AZEVEDO SOL 148464 KINTANA 1054051
          //'PA.NOME AS AGENCIA, '+#13;
          //BA.NOME AS BANCO, '+#13;
          //Renato Visoni SOL 147153 Kintana 1013329

  sSQL := sSQL +
    ' HST.PARCELAS, ' + #13;

  If prmFLGUSACODRUBEXT = 0 Then
    sSql := sSql + ' PVD.IDPROVENTO AS CODIGO, PVD.DESCRICAO AS DESCRICAO, '+#13
  Else
    sSql := sSql + ' NVL(PVD.CODPROVDESC, PVD.IDPROVENTO) AS CODIGO, PVD.DESCRPROVDESC AS DESCRICAO, '+#13; 

  sSql := sSql + ' ELP.MATRICULA, PPP.INSCRICAONUMERO, PFI.DATANASC, '+#13+
                 ' PVD.FLGDESCONTO, PL.NOME AS PLANO, HST.NUMPROCINSS, '+#13+
                 ' DECODE(PFI.FLGISENTOIRRF,1,''SIM'',''NÃO'') ISENTOIRRF, '+#13+
                 ' HST.NUMDEPIRRF, PVD.FLGESPECIAL, '+#13; 

  sSql := sSql + ' EP.IDPESSOA, EP.IDENDERECO, EP.LOGRADOURO, EP.CEP, '+#13+
                 ' EST.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, '+#13+
                 //' CID.NOME AS CIDADE, EP.TIPOENDERECO, EP.NOME, '+#13+
                 ' CID.NOME AS CIDADE, EP.TIPOENDERECO, '+#13+
                 ' DECODE(PVD.FLGDESCONTO,0,''PROVENTO'',1,''DESCONTO'',''INFORMATIVA'') AS PD, '+#13+
                 ' DECODE(PVD.FLGDESCONTO,1,''D'',0,''P'',''I'') AS TPRUBRICA, '+#13;

  If not bFlgAgrupaRubrica Then
    sSql := sSql +
      ' SUBSTR(HST.MES,6,2)||'+'''/'''+'||SUBSTR(HST.MES,1,4) AS MES, '+#13+
      //BRUNO AZEVEDO SOL 180539 Kintana 1672078
      ' HST.MES as mes2, '+#13+
      ' DECODE(PVD.FLGDESCONTO, 2, '+#13+
      ' HST.VALORINFO, HST.VALORPROVENTO) AS VALORPROVENTO, '+#13+ 
      ' HST.DATAPAGAMENTO AS DATACREDITO, '+#13+
      ' DECODE(PVD.FLGESPECIAL, 0, '+#13+
      ' DECODE(PVD.FLGDESCONTO,2,HST.VALORINFO||'' (I)'',0,NULL,1, '+#13+
      ' DECODE(HST.VALORRECEBIDO-HST.VALORPROVENTO,0, '+#13+
      ' DECODE(HST.VALORINFO,0,NULL,HST.VALORINFO||'' (I)''), '+#13+
      ' HST.VALORRECEBIDO-HST.VALORPROVENTO||'' (R)'')), '+#13+
      ' DECODE(HST.VALORPROVENTO,0,HST.VALORINFO, '+#13+ 
      ' NVL(HST.VALORPROVENTO,HST.VALORINFO))||'' (I)'') AS INFORMATIVO, '+#13+ 
      ' DECODE(PVD.FLGDESCONTO,0,HST.VALORPROVENTO,0.0) AS VLPROVENTO, '+#13+
      ' DECODE(PVD.FLGDESCONTO,1,HST.VALORPROVENTO,0.0) AS VLDESCONTO, '+#13+
      ' HST.VALORPROVENTO - HST.VALORRECEBIDO AS RESIDUO '+#13
  Else
    sSql := sSql + 
      ' SUBSTR(HST.MES,6,2)||'+'''/'''+'||SUBSTR(HST.MES,1,4) AS MES, '+#13+
      //BRUNO AZEVEDO SOL 180539 Kintana 1672078
      ' HST.MES as mes2, '+#13+
      ' HST.MESCOBRANCA, HST.DATAPAGAMENTO AS DATACREDITO, '+#13+
      ' DECODE(PVD.FLGDESCONTO, 2, '+#13+ 
      ' SUM(HST.VALORINFO), SUM(HST.VALORPROVENTO)) AS VALORPROVENTO, '+#13+ 
      ' DECODE(PVD.FLGESPECIAL, 0, '+#13+
      ' DECODE(PVD.FLGDESCONTO,2,SUM(HST.VALORINFO)||'' (I)'',0,NULL,1, '+#13+
      ' DECODE(SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO),0, '+#13+
      ' DECODE(SUM(HST.VALORINFO),0,NULL,SUM(HST.VALORINFO)||'' (I)''), '+#13+
      ' SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO)||'' (R)'')), '+#13+
      ' DECODE(SUM(HST.VALORPROVENTO),0,SUM(HST.VALORINFO), '+#13+
      ' NVL(SUM(HST.VALORPROVENTO),SUM(HST.VALORINFO)))||'' (I)'') AS INFORMATIVO, '+#13+
      ' SUM(DECODE(PVD.FLGDESCONTO,0,HST.VALORPROVENTO,0.0)) AS VLPROVENTO, '+#13+
      ' SUM(DECODE(PVD.FLGDESCONTO,1,HST.VALORPROVENTO,0.0)) AS VLDESCONTO, '+#13+
      ' SUM(HST.VALORPROVENTO - HST.VALORRECEBIDO) AS RESIDUO '+#13;


{  ' FROM HISTRUBSAL HST, ELEGPATRO ELP, PARTPREVPLAN PPP, PLANPREV PL, '+#13+
   '      PESSOA TIT, PESSOA BEN, PESSOAFISICA PFI, PROVDESC PVD, ENDPESS EP, '+#13+
   '      PESSOA PT, CIDADES CID, ESTADO EST, '+#13+
   '      HSTFOLHABENEF H, '+#13+
   '(SELECT B.IDPESSOA AS IDBANCO, A.IDPESSOA AS IDAGENCIA, B.NUMBANCO, A.NUMAGENCIA, '+#13+
   '        PB.NOME AS NOMEBANCO, PA.NOME AS NOMEAGENCIA   '+#13+
   ' FROM BANCO B, AGENCIABANCARIA A, PESSOA PB, PESSOA PA '+#13+
   ' WHERE A.IDBANCO = B.IDPESSOA      '+#13+
   ' AND PB.IDPESSOA = B.IDPESSOA      '+#13+
   ' AND PA.IDPESSOA = A.IDPESSOA      '+#13+
   ' AND B.NUMBANCO IS NOT NULL        '+#13+
   ' AND A.NUMAGENCIA IS NOT NULL) AGB '+#13+   // Ádler Souza - SOL 140394 KTN 878232
   ' (SELECT B.IDPESSOA AS IDBANCO, A.IDPESSOA AS IDAGENCIA, B.NUMBANCO, A.NUMAGENCIA, '+#13+
   '       PB.NOME      AS NOMEBANCO, PA.NOME AS NOMEAGENCIA, CON.IDPESSOA, CON.CONTACORRENTE '+#13+
   '  FROM BANCO B, AGENCIABANCARIA A, PESSOA PB, PESSOA PA, CONTABANCARIA CON '+#13+
   ' WHERE A.IDBANCO = B.IDPESSOA '+#13+
   '   AND PB.IDPESSOA = B.IDPESSOA '+#13+
   '   AND PA.IDPESSOA = A.IDPESSOA '+#13+
   '   AND CON.IDAGENCIA = A.IDPESSOA '+#13+
   '   AND CON.TIPOCONTA = 2 '+#13+
   '   AND B.NUMBANCO IS NOT NULL '+#13+
   '   AND A.NUMAGENCIA IS NOT NULL) AGB '+#13+ // Ádler Souza - SOL 140394 KTN 878232
   '   AND HST.IDPLANOPREV = PL.IDPLANOPREV '+#13+
   '   AND PVD.IDPROVENTO = HST.IDRUBRICA '+#13+
   '   AND ELP.IDPESSOA = HST.IDTITULAR '+#13+
   '   AND ELP.IDPESSJUR = HST.IDPATRO '+#13+
   '   AND PPP.IDPESSJUR = HST.IDPATRO '+#13+
   '   AND ((PPP.IDPLANOPREV = HST.IDPLANOPREV AND HST.IDTITULAR = HST.IDPESSOA) OR '+#13+
   '        (PPP.IDPLANOPREV = HST.IDPLANOORIGEM AND HST.IDTITULAR <> HST.IDPESSOA)) '+#13+
   '   AND PPP.IDPESSOA = HST.IDTITULAR '+#13+
   '   AND PPP.IDPESSJUR = PT.IDPESSOA '+#13+
   '   AND PPP.IDPESSOA  = TIT.IDPESSOA '+#13+
   '   AND PFI.IDPESSOA = HST.IDRESPONSAVEL '+#13+
   '   AND PVD.FLGESPECIAL IN (0, 1) '+#13+
   '   AND  BEN.IDPESSOA     = EP.IDPESSOA(+)   '+#13 +
   '   AND  BEN.IDENDCORRESP = EP.IDENDERECO(+) '+#13 +
   '   AND EP.IDCIDADES = CID.IDCIDADES(+) '+#13 +
   '   AND EST.IDESTADO(+) = CID.IDESTADO '+#13 +
   '   AND BEN.IDPESSOA = HST.IDRESPONSAVEL '+#13 +
   '   AND AGB.IDPESSOA = HST.IDRESPONSAVEL '+#13 + // Ádler Souza - SOL 140394 KTN 878232
   '   AND AGB.CONTACORRENTE = HST.CONTACORRENTE ' +#13 + // Ádler Souza - SOL 140394 KTN 878232
   '   AND RTRIM(HST.NUMBANCO) = AGB.NUMBANCO(+) '+#13 +
   '   AND HST.NUMAGENCIA = AGB.NUMAGENCIA(+) '+#13;       }

// Ádler Souza - SOL 140632 KTN 883633
 //   ' FROM HISTRUBSAL HST, ELEGPATRO ELP, PARTPREVPLAN PPP, PLANPREV PL, '       +#13+
 //   '   PESSOA TIT, PESSOA BEN, PESSOAFISICA PFI, PROVDESC PVD, ENDPESS EP, '    +#13+
 //   '   PESSOA PT, CIDADES CID, ESTADO EST, HSTFOLHABENEF H '                    +#13+

    //Fanuel Junior SOL149616


    //Fanuel Junior SOL149616
     if iIdListaFolha = -1 then
        begin
           sSql := sSql + ' FROM HISTRUBSAL HST,ELEGPATRO ELP,PARTPREVPLAN  PPP,PLANPREV PL,HSTFOLHABENEF H, '+#13+
           ' PESSOA TIT,PESSOA BEN,PESSOAFISICA  PFI,PROVDESC PVD,PESSOA PT,ENDPESS EP,CIDADES CID,ESTADO EST  '+#13+
           ' WHERE HST.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF  ';
        end
     else
        begin
           sSql := sSql + ' FROM HISTRUBSAL HST,ELEGPATRO ELP,PARTPREVPLAN  PPP,PLANPREV PL,HSTFOLHABENEF H, '+#13+
           ' (SELECT L.IDLISTA, L.IDTITULAR  FROM LISTAFOLHABENEFDET L GROUP BY L.IDLISTA, L.IDTITULAR) L, '+#13+
           ' PESSOA TIT,PESSOA BEN,PESSOAFISICA  PFI,PROVDESC PVD,PESSOA PT,ENDPESS EP,CIDADES CID,ESTADO EST  '+#13+
           ' WHERE HST.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF  ';
        end;


    {' PESSOA TIT,PESSOA BEN,PESSOAFISICA  PFI,PROVDESC PVD,PESSOA PT,ENDPESS EP,CIDADES CID,ESTADO EST  '+#13+
    ' WHERE HST.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF  ';   }              //     +#13+

    //Fanuel Junior SOL149616 Kintana1081728

    //A variavel contador foi declarada como 'real' porque o Delphi
    //so deixa ter uma variavel do tipo 'integer'. Agora, o porquê disso
    //acontecer, eu nao tenho a minima ideia. Culpa da Borland


  { ListaHst := TStringList.Create;
   ListaHst := GetLista(sIdHstFolhaBenef);
   count := 0;
   i := 0;

   if ListaHst.Count > 1000 then
   begin
      sSql := sSql + 'AND ( ';
      while ((ListaHst.Count - 1) > 0))  do
      begin
          if count = 0 then
             ListaHst[i] :=  sIdHstFolhaBenef2
          else
             ListaHst[i] :=  sIdHstFolhaBenef2 ',' + ListaHst[i]

          if count
      end;

      sSql := sSql + ' ) ';
   end
   else
   begin
      sSql := sSql +  ' AND HST.IDHSTFOLHABENEF in ('+sIdHstFolhaBenef+ ') '+#13;
   end;    }

   ListaHst  := TStringList.Create;
   ListaHst2 := TStringList.Create;
   ListaHst.CommaText := sIdHstFolhaBenef;

   //sSql := sSql + 'AND ( HST.IDHSTFOLHABENEF in ';

   i := 0;
   divisao :=  (ListaHst.Count) mod 1000;

   if ListaHst.Count > 1000 then
   begin
      sSql := sSql + 'AND (';
      while (ListaHst.Count ) > divisao do
      begin
         ListaHst2.Add(ListaHst[i]);
         ListaHst.Delete(i);

         if ListaHst2.Count = 1000 then
         begin
            sSql := sSql + ' HST.IDHSTFOLHABENEF in ('+ListaHst2.CommaText+') OR '+#13;
            FreeAndNil(ListaHst2);
            ListaHst2 := TStringList.Create;
         end;
      end;
      sSql := sSql +  'HST.IDHSTFOLHABENEF in ('+ListaHst.CommaText+') ) '+#13;
   end
   else
      sSql := sSql + ' AND HST.IDHSTFOLHABENEF in ('+sIdHstFolhaBenef+ ')  '+#13;


    if iIdListaFolha = -1 then begin
       //sSql := sSql + ' AND HST.IDHSTFOLHABENEF in ('+sIdHstFolhaBenef+ ')  '+#13+
      sSql := sSql +  ' AND HST.IDTITULAR = ' + sIdTitular  +'        ' +#13+
                      ' AND HST.IDRESPONSAVEL = ' + sIdRecebedor     ;
    end else begin
       sSql := sSql + ' AND UPPER(H.HISTORICO) NOT LIKE ''%RESG%'' '+#13+
                      ' AND UPPER(H.HISTORICO) NOT LIKE ''%PORT%''  '+#13+
                      //' AND HST.IDHSTFOLHABENEF in ('+sIdHstFolhaBenef+ ') '+#13+
{                      ' AND MESCOBRANCA >=  '''+DtMesInicio+'''  '+#13+  //Everson TIBERO
                      ' AND MESCOBRANCA <=  '''+DtMesFim+'''  '+#13+}     //Everson TIBERO
                      ' AND HST.MESCOBRANCA >=  '''+DtMesInicio+'''  '+#13+   //Everson TIBERO
                      ' AND HST.MESCOBRANCA <=  '''+DtMesFim+'''  '+#13+      //Everson TIBERO
                      ' AND L.IDTITULAR = HST.IDTITULAR '+#13+
                      ' AND L.IDLISTA = '+intTostr(iIdListaFolha)+' ';
                     // ' AND HST.IDTITULAR IN (SELECT IDTITULAR FROM LISTAFOLHABENEFDET WHERE IDLISTA = '+intTostr(iIdListaFolha)+')';    //+#13+
                      //' AND HST.IDRESPONSAVEL IN(SELECT DISTINCT H.IDRESPONSAVEL FROM HISTRUBSAL H, PESSOA P WHERE H.IDTITULAR IN (SELECT IDTITULAR FROM LISTAFOLHABENEFDET WHERE IDLISTA = '+intTostr(iIdListaFolha)+') AND P.IDPESSOA = H.IDRESPONSAVEL)';
    end;
    //Fanuel Junior SOL149616 Kintana1081728

    sSql := sSql + //Fanuel

    ' AND HST.IDPLANOPREV = PL.IDPLANOPREV '                                     +#13+
    ' AND PVD.IDPROVENTO = HST.IDRUBRICA '                                       +#13+
    ' AND ELP.IDPESSOA = HST.IDTITULAR '                                         +#13+
    ' AND ELP.IDPESSJUR = HST.IDPATRO '                                          +#13+
    ' AND PPP.IDPESSJUR = HST.IDPATRO '                                          +#13+
    ' AND ((PPP.IDPLANOPREV = HST.IDPLANOPREV AND HST.IDTITULAR = HST.IDPESSOA) OR '  +#13+
    '      (PPP.IDPLANOPREV = HST.IDPLANOORIGEM AND HST.IDTITULAR <> HST.IDPESSOA)) ' +#13+
    ' AND PPP.IDPESSOA = HST.IDTITULAR '                                         +#13+
    ' AND PPP.IDPESSJUR = PT.IDPESSOA '                                          +#13+
    ' AND HST.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF  '                             +#13+  //Fanuel Junior SOL 149616
    ' AND PPP.IDPESSOA  = TIT.IDPESSOA '                                         +#13+
    ' AND PFI.IDPESSOA = HST.IDRESPONSAVEL '                                     +#13+
    ' AND PVD.FLGESPECIAL IN (0, 1) '                                            +#13+
    ' AND BEN.IDPESSOA     = EP.IDPESSOA(+) '                                    +#13+
    ' AND PPP.IDPESSOA = TIT.IDPESSOA '                                          +#13+
    ' AND BEN.IDENDCORRESP = EP.IDENDERECO(+) '                                  +#13+
    ' AND BEN.IDPESSOA = EP.IDPESSOA(+)   '                                      +#13+
    ' AND EP.IDCIDADES = CID.IDCIDADES(+) '                                      +#13+
    ' AND EST.IDESTADO(+) = CID.IDESTADO '                                       +#13+
    ' AND BEN.IDPESSOA = HST.IDRESPONSAVEL '                                     +#13;

    //Renato Visoni SOL 147153 Kintana 1013329
    {' AND C.CONTACORRENTE = HST.CONTACORRENTE '                                  +#13+
    ' AND c.idpessoa      = hst.idpessoa   '                                     +#13+  //  SOL 145992 KINTANA 987021
    ' /*AND c.idcbancaria = (SELECT MAX(idcbancaria) '                             +#13+  // comentado para anteder  SOL 145036 KINTANA 970354
    '                    FROM contabancaria co '                                 +#13+
    '                   WHERE co.idpessoa = hst.idpessoa '                       +#13+
    '                     AND co.contacorrente = hst.contacorrente) */'            +#13+
    ' AND A.NUMAGENCIA = HST.NUMAGENCIA '                                        +#13+  // SOL 146091 KINTANA 988763
    ' AND C.IDAGENCIA = A.IDPESSOA (+) '                                         +#13+
    ' AND A.IDPESSOA = PA.IDPESSOA '                                             +#13+
    ' AND A.IDBANCO = B.IDPESSOA (+) '                                           +#13+
    ' AND B.IDPESSOA = BA.IDPESSOA '                                             +#13+
    ' AND B.NUMBANCO = HST.NUMBANCO '                                            +#13;  // SOL 146091 KINTANA 988763
    }                                                                      
    //Renato Visoni SOL 147153 Kintana 1013329

    //Fim - Ádler Souza - SOL 140632 KTN 883633

  If not bFlgAgrupaRubrica Then
  Begin
    {sSql := sSql + ' ORDER BY datacredito DESC,' +  //Fanuel Junior SOL154841 Kintana1196995
                   ' HST.MESCOBRANCA DESC, '+#13;
    sSql := sSql + ' BEN.NOME ASC,         '+#13;
    sSql := sSql + ' PVD.FLGDESCONTO ASC  '+#13;  }  //Fanuel Junior SOL154841 Kintana1196995
    //sSql := sSql + ' CODIGO ASC            '+#13; //Fanuel Junior SOL154841 Kintana11969950
      //sSql := sSql + ' ORDER BY  ELP.MATRICULA ASC, '  +
      //               ' HST.MESCOBRANCA ASC , DATACREDITO, BEN.NOME ASC, PVD.FLGDESCONTO ASC, CODIGO ASC'+#13;
     //Fanuel Junior SOL 174874 Kintana 1587812
    //sSQL :=  sSql + 'ORDER BY HST.IDPLANOPREV, ELP.MATRICULA, PL.NOME, HST.IDRESPONSAVEL, HST.IDHSTFOLHABENEF, HST.MESCOBRANCA, PVD.FLGDESCONTO, HST.MES, CODIGO';
    sSQL :=  sSql + 'ORDER BY ELP.MATRICULA , HST.IDRESPONSAVEL, HST.IDHSTFOLHABENEF, HST.MESCOBRANCA, PVD.FLGDESCONTO, MES2, CODIGO';   //BRUNO AZEVEDO SOL 180539 Kintana 1672078
  End
  Else
  begin
    sSql := sSql + ' GROUP BY HST.MESCOBRANCA, HST.PARCELAS, '+#13;
    If prmFLGUSACODRUBEXT = 0 Then
      sSql := sSql + ' PVD.IDPROVENTO, PVD.FLGESPECIAL, HST.IDRESPONSAVEL, HST.IDPLANOPREV, '+#13+
                     ' HST.IDPESSJUR, TIT.NOME, BEN.NOME, PT.NOME, PVD.IDPROVENTO, PVD.DESCRICAO, '+#13+
                     ' ELP.MATRICULA, PPP.INSCRICAONUMERO, PFI.DATANASC, PVD.FLGDESCONTO, '+#13+
                     ' PL.NOME, HST.NUMPROCINSS, PFI.FLGISENTOIRRF, '+#13+
                     ' HST.NUMDEPIRRF, '+#13+
                     ' MES2, HST.MESCOBRANCA, '+#13+  //BRUNO AZEVEDO SOL 180539 Kintana 1672078
                     ' HST.DATAPAGAMENTO, EP.IDPESSOA, EP.IDENDERECO, EP.LOGRADOURO, '+#13+
                     ' EP.CEP, EST.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, CID.NOME, EP.TIPOENDERECO, '+#13+
                     ' HST.NUMBANCO, HST.NUMAGENCIA, HST.CONTACORRENTE, PA.NOME, BA.NOME, '+#13+ // Ádler Souza - SOL 140632 KTN 883633
                     ' EP.NOME, '+#13+
                     ' DECODE(PVD.FLGDESCONTO, 1, ''D'', 0, ''P'', ''I''), '+#13+
                     ' HST.VALORPROVENTO, HST.VALORINFO '+#13+
                     ' ORDER BY '+#13+
                     //Fanuel Junior SOL149616/7141 Kintana1502408
                     //' DATACREDITO, '+#13+
                     //' HST.MESCOBRANCA DESC, BEN.NOME ASC, PVD.FLGDESCONTO ASC, CODIGO ASC'+#13

                     //Fanuel Junior SOL 174874 Kintana 1587812
                     //' HST.IDPLANOPREV, ELP.MATRICULA, PL.NOME, HST.IDRESPONSAVEL, HST.IDHSTFOLHABENEF, HST.MESCOBRANCA, PVD.FLGDESCONTO, HST.MES, CODIGO ' + #13
                     'ELP.MATRICULA, HST.IDRESPONSAVEL, HST.IDHSTFOLHABENEF, HST.MESCOBRANCA, PVD.FLGDESCONTO, HST.MES, CODIGO ' + #13
                     /////////////////////////////////////////

                     //' ELP.MATRICULA ASC, '+#13+
                     //' HST.MESCOBRANCA ASC , DATACREDITO, BEN.NOME ASC, PVD.FLGDESCONTO ASC, CODIGO ASC'+#13

    Else             //Fanuel Junior SOL149616/7141 Kintana1502408
        begin                                                                                
      sSql := sSql + ' NVL(PVD.CODPROVDESC, PVD.IDPROVENTO), '+#13+
                     ' PVD.FLGESPECIAL, HST.IDRESPONSAVEL, HST.IDPLANOPREV, '+#13+
                     ' HST.IDPESSJUR, TIT.NOME, BEN.NOME, PT.NOME, PVD.IDPROVENTO, PVD.DESCRPROVDESC, '+#13+
                     ' ELP.MATRICULA, PPP.INSCRICAONUMERO, PFI.DATANASC, PVD.FLGDESCONTO, '+#13+
                     ' PL.NOME, HST.NUMPROCINSS, PFI.FLGISENTOIRRF, '+#13+
                     ' HST.NUMDEPIRRF, '+#13+
                     ' MES2, HST.MESCOBRANCA, '+#13+  //BRUNO AZEVEDO SOL 180539 Kintana 1672078
                     ' HST.DATAPAGAMENTO, EP.IDPESSOA, EP.IDENDERECO, EP.LOGRADOURO, '+#13+
                     ' EP.CEP, EST.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, CID.NOME, EP.TIPOENDERECO, '+#13+
                     ' HST.NUMBANCO, HST.NUMAGENCIA, HST.CONTACORRENTE, PA.NOME, BA.NOME, '+#13+ // Ádler Souza - SOL 140632 KTN 883633
                     ' EP.NOME, '+#13+
                     ' DECODE(PVD.FLGDESCONTO, 1, ''D'', 0, ''P'', ''I''), '+#13+
                     ' HST.VALORPROVENTO, HST.VALORINFO '+#13+
                     ' ORDER BY '+#13+
                     //Fanuel Junior SOL149616/7141 Kintana1502408
                     //' DATACREDITO, '+#13+
                     //' HST.MESCOBRANCA DESC, BEN.NOME ASC, PVD.FLGDESCONTO ASC, CODIGO ASC '+#13;

                     //Fanuel Junior SOL 174874 Kintana 1587812
                     //' HST.IDPLANOPREV, ELP.MATRICULA, PL.NOME, HST.IDRESPONSAVEL, HST.IDHSTFOLHABENEF, HST.MESCOBRANCA, PVD.FLGDESCONTO, HST.MES, CODIGO '+#13;
                     ' ELP.MATRICULA, HST.IDRESPONSAVEL, HST.IDHSTFOLHABENEF, HST.MESCOBRANCA, PVD.FLGDESCONTO, HST.MES, CODIGO '+#13;

                    //' ELP.MATRICULA ASC, '+#13+
                     //' HST.MESCOBRANCA ASC , DATACREDITO, BEN.NOME ASC, PVD.FLGDESCONTO ASC, CODIGO ASC'+#13;

    end;             //Fanuel Junior SOL149616/7141 Kintana1502408
  End;
  //sSQL :=   sSQL + ')  ORDER BY MATRICULA, IDRESPONSAVEL, IDHSTFOLHABENEF, MESCOBRANCA, PD';
  {qryTeste := TwwQuery.Create(nil);
  qryTeste.DataBaseName := 'BaseDados';
  qryTeste.Close;
  qryTeste.SQL.Clear;
  qryTeste.SQL.Add(sSql);
  qryTeste.Open;}
  // Andre Imakawa - SIG 122643 - Inicio
  if iIdListaFolha <> -1 then
    result := GetDataPacket(sSql, 100000) // Andre Imakawa - SIG 118538
  else
    result := GetDataPacket(sSql);           // Andre Imakawa - SIG 118538
  // Andre Imakawa - SIG 122643 - Fim

end;

//Funcao que conta o numero de registros separados por virgula dentro de uma string
{function TCtrl2ViaContraCheque.GetNumIdLista(sIdHstFolhaBenef2 : String): integer;
var
contador, indice : integer;
begin
    contador := 0;
    while pos(',',sIdHstFolhaBenef2) > 0 do
    begin
       indice := pos(',',sIdHstFolhaBenef2);
       sIdHstFolhaBenef2 := copy(sIdHstFolhaBenef2,indice + 1, Length(sIdHstFolhaBenef2));
       contador := contador + 1;
    end;
    result :=  contador;
end;   }



function TCtrl2ViaContraCheque.BuscaDadosFundacao(pIdfundacao : integer): OleVariant;
begin
  result := GetDataPacket(' SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,                              '+
                          '        E.NUMERO , E.COMPLEMENTO, E.BAIRRO,                                '+
                          '        C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM, I.IDIMAGEM,        '+
                          '        (E.LOGRADOURO||'', ''||E.NUMERO) AS ENDERECO,                      '+
                          '        (E.BAIRRO||'' - ''||C.NOME||'' - ''||C.CODESTADO) AS BARCIDUF      '+
                          ' FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C                            '+
                          ' WHERE (P.IDPESSOA = ' + IntToStr(pIdFundacao)+ ') AND                     '+
                          '       (E.IDPESSOA(+) = P.IDPESSOA) AND                                    '+
                          '       (E.IDCIDADES   = C.IDCIDADES(+))  AND                               '+
                          '       (I.IDIMAGEM(+) = P.IDIMAGEM)');
end;

function TCtrl2ViaContraCheque.BuscaDataInicio(pIDRUBRICA, pIDPLANOPREV, pIDRESPONSAVEL,
                                               pIDPESSJUR : integer): String;
var cdsAux : TcmClientDataSet;
begin
  cdsAux := TcmClientDataSet.Create(nil);
  try
    result := '';
    cdsAux.Data := GetDataPacket(' SELECT BBF.DATAINICIO FROM BENEFBFCIARIO BBF, BENEFPLANPREV BPV '+
                                 ' WHERE  BPV.IDRUBRICA = '+ IntToStr(pIDRUBRICA)                   +
                                 ' AND BPV.IDPLANOPREV = '+ IntToStr(pIDPLANOPREV)                  +
                                 ' AND BBF.IDPLANOPREV = BPV.IDPLANOPREV                           '+
                                 ' AND BBF.IDBENEFICIO = BPV.IDBENEFICIO                           '+
                                 ' AND BBF.IDPESSOA = '+ IntToStr(pIDRESPONSAVEL)                   +
                                 ' AND BBF.IDPESSJUR = '+ IntToStr(pIDPESSJUR)                      +
                                 ' AND BBF.IDSITBENEFICIO = 1');
    if not cdsAux.IsEmpty then
      result := cdsAux.FieldByName('DATAINICIO').asString;
  finally
    cdsAux.Free;
  end;                                                   
end;

function TCtrl2ViaContraCheque.BuscaFLGUSACODRUBEXT: Integer;
var cdsAux : TcmClientDataSet;
begin
  cdsAux := TcmClientDataSet.Create(nil);
  try
    result := -1;
    cdsAux.Data := GetDataPacket(' SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGUSACODRUBEXT'' ');
    if not cdsAux.IsEmpty then
       result := cdsAux.FieldByName('VALORPARAM').asInteger;
  finally
    cdsAux.Free;
  end;
end;

function TCtrl2ViaContraCheque.ListaDataPagamento(PIdTitular,
  PIdRecebedor: integer): Olevariant;
begin
  result := GetDataPacket(' SELECT DISTINCT '+
                          '   HST.DATAPAGAMENTO, '+
                          '   HST.IDHSTFOLHABENEF '+
                          ' FROM HISTRUBSAL HST '+
                          ' WHERE HST.IDTITULAR = '+IntToStr(PIdTitular)+
                          '   AND HST.IDRESPONSAVEL = '+IntToStr(PIdRecebedor)+
                          '   AND HST.DATAPAGAMENTO IS NOT NULL '+
                          ' ORDER BY  HST.DATAPAGAMENTO DESC ');
end;

// este método somente será utilizado no auto-atendimento
function TCtrl2ViaContraCheque.BuscaDadosRelRegUnico(
  prmFLGUSACODRUBEXT: Integer; bFlgAgrupaRubrica: Boolean;
  sIdHstFolhaBenef, sIdTitular, sIdRecebedor: string): Olevariant;
var
  cdsLocal : TCmClientDataSet;
  iLprovento, iLdesconto, iLinformativo, i : integer;
  sSql : string;
  TotProvent, TotDesc, TotResid, Liquido : Double;
begin
  iLprovento    := 1;
  iLdesconto    := 1;
  iLinformativo := 1;

  TotProvent := 0;
  TotDesc    := 0;
  TotResid   := 0;
  Liquido    := 0;

  sSql := ' SELECT ';
  cdsLocal := TCmClientDataSet.Create( nil );
  try
    cdsLocal.Data := BuscaDadosRelatorio( prmFLGUSACODRUBEXT, bFlgAgrupaRubrica,
                                          sIdHstFolhaBenef, sIdTitular, sIdRecebedor);

    for i := 0 to cdslocal.fieldCount - 1 do
    begin
      if (cdsLocal.Fields[i].FieldName <> 'MES') and (cdsLocal.Fields[i].FieldName <> 'CODIGO') and
         (cdsLocal.Fields[i].FieldName <> 'DESCRICAO') and (cdsLocal.Fields[i].FieldName <> 'RESIDUO') then
        sSql := sSql + ' NVL( ' + quotedStr(cdsLocal.FieldByName(cdsLocal.Fields[i].FieldName).asString) + ', ''  '')' + ' AS '+ cdsLocal.Fields[i].FieldName + ',';
    end;

    cdsLocal.First;
    while not cdsLocal.Eof do
    begin
      //rubricas proventos
      if cdsLocal.FieldByName('TPRUBRICA').asString = 'P' then
      begin
        sSql := sSql + quotedStr(cdsLocal.FieldByName('MES').asString)         + ' AS ' + 'MES_P' + intToStr(iLprovento)+ ',';
        sSql := sSql + 'NVL('+ quotedStr(BuscaDataInicio(cdsLocal.fieldByName('IDPROVENTO').asInteger, cdsLocal.fieldByName('IDPLANOPREV').asInteger,
                        cdsLocal.fieldByName('IDRESPONSAVEL').asInteger, cdsLocal.fieldByName('IDPESSJUR').asInteger)) +
                        ',''    '' ) AS DATAINICIO_P' + intToStr(iLprovento)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('CODIGO').asString)      + ' AS ' + 'CODIGO_P' + intToStr(iLprovento)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('DESCRICAO').asString)   + ' AS ' + 'DESCRICAO_P' + intToStr(iLprovento)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('VLPROVENTO').asFloat ))  + ' AS ' + 'VLPROVENTO_P' + intToStr(iLprovento)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('RESIDUO').asFloat ))     + ' AS ' + 'RESIDUO_P' + intToStr(iLprovento)+ ',';
        iLprovento := iLprovento + 1;
      end
      // rubricas de descontos
      else if cdsLocal.FieldByName('TPRUBRICA').asString = 'D' then
      begin
        sSql := sSql + quotedStr(cdsLocal.FieldByName('MES').asString)         + ' AS ' + 'MES_D' + intToStr(iLdesconto)+ ',';
        sSql := sSql + 'NVL('+ quotedStr(BuscaDataInicio(cdsLocal.fieldByName('IDPROVENTO').asInteger, cdsLocal.fieldByName('IDPLANOPREV').asInteger,
                        cdsLocal.fieldByName('IDRESPONSAVEL').asInteger, cdsLocal.fieldByName('IDPESSJUR').asInteger)) +
                        ',''    '' ) AS DATAINICIO_D' + intToStr(iLdesconto)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('CODIGO').asString)      + ' AS ' + 'CODIGO_D' + intToStr(iLdesconto)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('DESCRICAO').asString)   + ' AS ' + 'DESCRICAO_D' + intToStr(iLdesconto)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('VLDESCONTO').asFloat ))  + ' AS ' + 'VLDESCONTO_D' + intToStr(iLdesconto)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('RESIDUO').asFloat ))     + ' AS ' + 'RESIDUO_D' + intToStr(iLdesconto)+ ',';
        iLdesconto := iLdesconto + 1;
      end
      // Rubricas informativas   (DAVID - 20/10/2003)
      else if cdsLocal.FieldByName('TPRUBRICA').asString = 'I' then
      begin
        sSql := sSql + quotedStr(cdsLocal.FieldByName('MES').asString)         + ' AS ' + 'MES_I' + intToStr(iLinformativo)+ ',';
        sSql := sSql + 'NVL('+ quotedStr(BuscaDataInicio(cdsLocal.fieldByName('IDPROVENTO').asInteger, cdsLocal.fieldByName('IDPLANOPREV').asInteger,
                        cdsLocal.fieldByName('IDRESPONSAVEL').asInteger, cdsLocal.fieldByName('IDPESSJUR').asInteger)) +
                        ',''    '' ) AS DATAINICIO_I' + intToStr(iLinformativo)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('CODIGO').asString)      + ' AS ' + 'CODIGO_I' + intToStr(iLinformativo)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('DESCRICAO').asString)   + ' AS ' + 'DESCRICAO_I' + intToStr(iLinformativo)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('VALORPROVENTO').asFloat ))  + ' AS ' + 'VLINFORMATIVO_I' + intToStr(iLinformativo)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('RESIDUO').asFloat ))     + ' AS ' + 'RESIDUO_I' + intToStr(iLinformativo)+ ',';
        iLinformativo := iLinformativo + 1;
      end;

      // Totaliza os valores
      TotProvent := TotProvent + cdsLocal.FieldByName('VLPROVENTO').asFloat;
      TotDesc    := TotDesc + cdsLocal.FieldByName('VLDESCONTO').asFloat;
      TotResid   := TotResid + cdsLocal.FieldByName('RESIDUO').asFloat;
      Liquido    := TotProvent - TotDesc;

      cdsLocal.next;
    end; //WHILE

    // PÕE CAMPO VAZIO PARA O QUE RESTOU DOS 10 TAGS DE CADA CAMPO
    for i := iLdesconto to 10 do
    begin
      sSql := sSql + quotedStr('   ') + ' AS MES_D' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DATAINICIO_D' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS CODIGO_D' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DESCRICAO_D' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS VLDESCONTO_D' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS RESIDUO_D' + intToStr(i)+ ',';
    end;

    // PÕE CAMPO VAZIO PARA O QUE RESTOU DOS 10 TAGS DE CADA CAMPO
    for i := iLprovento to 10 do
    begin
      sSql := sSql + quotedStr('   ') + ' AS MES_P' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DATAINICIO_P' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS CODIGO_P' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DESCRICAO_P' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS VLPROVENTO_P' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS RESIDUO_P' + intToStr(i)+ ',';
    end;

    // PÕE CAMPO VAZIO PARA O QUE RESTOU DOS 10 TAGS DE CADA CAMPO
    for i := iLinformativo to 10 do
    begin
      sSql := sSql + quotedStr('   ') + ' AS MES_I' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DATAINICIO_I' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS CODIGO_I' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DESCRICAO_I' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS VLINFORMATIVO_I' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS RESIDUO_I' + intToStr(i)+ ',';
    end;

    sSql := sSql + quotedStr(FormatFloat('#,##0.00', TotProvent)) + ' AS TOTALPROVENTOS,';
    sSql := sSql + quotedStr(FormatFloat('#,##0.00', TotDesc))    + ' AS TOTALDESCONTOS,';
    sSql := sSql + quotedStr(FormatFloat('#,##0.00', TotResid))   + ' AS TOTALRESIDUOS,';
    sSql := sSql + quotedStr(FormatFloat('#,##0.00', Liquido))    + ' AS TOTALLIQUIDO';

    sSql := sSql + ' FROM DUAL ';

    Result := GetDataPacket(sSql);

  finally
    cdsLocal.Free;
  end;

end;


end.

(* -----------------------------------------------------------------------------
ATENÇÃO:
  Antes de executar qualquer alteração no contra-cheque, verificar com o
  responsável pelo sistema de Auto-Atendimento se esta alteração não implicará
  em alguma modificação do sistema. Caso isto não ocorra, haverá o risco dos
  valores ou layout dos contra-cheque emitidos pela web ou por outros sistemas
  não coincidirem.
  DAVID - 20/10/2003
------------------------------------------------------------------------------*)

(*
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/12/2002 A 20/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS) - Pendência 11154.                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Alteração na qry principal do relatório para     |
|   emitir contra-cheque de quem não tem conta corrente cadastrada.            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS E ANDRÉ TAVARES                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/01/2003 A 10/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Recolocar o método ListaDataPagamento que foi retirado, pois este método |
|   é usado no contra-cheque pelo AutoAtendimento.                             |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 21/01/2003                                      |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:  FCRT                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: ALTERAÇÃO NA QUERY PRINCIPAL PARA EXIBIR O       |
|* CONTRACHEQUE DE QUEM NAO TEM NENHUM ENDERECO CADASTRADO                     |
|* implementado um nvl para colocar o codigo de rubrica interna como default.  |
|==============================================================================|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/03/2003                                      |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:  FCRT                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Implementação do método BuscaDadosRelRegUnico    |
|para ser utilizado no autoatendimento                                         |
|==============================================================================|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 13/05/2003                                      |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:  CM                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Resolução da pendência 13995                     |
|==============================================================================|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/12/2003                                      |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:  FCRT                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Resolução da pendência 15660                     |
|==============================================================================|
*)

