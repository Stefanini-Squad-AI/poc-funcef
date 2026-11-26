// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************

{**************************************************************************************************
// Rotina    : RetornaConsultaPreviaDetalhe
// Autor(a)  : Edilaine
// Data      : 08/05/2026
// Pendencia : WO38027
// Alteração : duplicação das rubricas na apresentação dos lançamentos
//--------------------------------------------------------------------------------------------------
// Rotina    : RetornaConsultaPreviaDetalhe
// Autor(a)  : Edilaine
// Data      : 12/03/2026
// Pendencia : WO32047
// Alteração : para o beneficiario não está trazendo o tipo de opção IR para Patro 91008
//--------------------------------------------------------------------------------------------------
// Rotina    : RetornaConsultaPreviaDetalhe
// Autor(a)  : Edilaine
// Data      : 03/02/2026
// Pendencia : WO32316
// Alteração : o tipo de opção IR está buscando sempre do titular no caso de beneficiários
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Andre Imakawa
// Data      : 22/06/2023
// Pendencia : SIG136844
// Alteração : Refazer SIG 99651
***************************************************************************************************
// Autor(a)  : Andre Imakawa
// Data      : 10/05/2023
// Pendencia : SIG135653
// Alteração : Desfazer SIG 99651
***************************************************************************************************
// Rotina    : RetornaConsultaPreviaDetalhe
// Autor(a)  : Andre Imakawa
// Data      : 12/08/2022
// Pendencia : SIG99651
// Alteração : Ajuste na apresentação da coluna Natureza REINF
***************************************************************************************************
// Rotina    : RetornaConsultaPreviaDetalhe
// Autor(a)  : Andre Imakawa
// Data      : 22/03/2017
// Pendencia : SIG124621
// Alteração : Ajuste na apresentação da coluna Op. IR
***************************************************************************************************
// Rotina    : RetornaConsultaPreviaDetalhe
// Autor(a)  : edilaine
// Data      : 22/03/2017
// Pendencia : SIG71773 (SOL247533-18324)
// Alteração : Na Consulta Previa apresentar a coluna Op.IR
***************************************************************************************************
// Data       : 26/08/2021
// SIG        : 82702
// Autor      : Andre Imakawa
// Descrição  : Inclusao do codigo da fonte pagadora na query detalhe
***************************************************************************************************
//Nº SIG.....: 77525 - TIBERO
//Data.......: 29/10/2018
//Responsável: Andre Imakawa
//Descrição..: Correção Relatorio
//*************************************************************************************************
// Data       : 19/10/2018
// SIG        : 77119 - TIBERO
// Autor      : Andre Imakawa
// Descrição  : correção campo Memo e Campo Decimal.
***************************************************************************************************
// Data       : 27/11/2017
// SIG        : 56702
// Autor      : Peterson Victor
// Descrição  : Alterações para tratar perfil de investimento
***************************************************************************************************
Alteração   : RetornaConsultaPreviaDetalhe
Pendência   : SIG 27469
Data        : 29/06/2017
Responsável : Edilaine
Descrição   : alteração de valores na interface de previa para usuários responsáveis pelo
              processamento da Folha
***************************************************************************************************
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração  : RetornaConsultaPreviaDetalhe (inclusão da View VW_RUBXEVENTO)
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba "Incidência de
            Eventos" do cadastro de rubricas salariais
****************************************************************************************************}
// *************************************************************************************************
// Autor(a)  : Paulo Ramos
// Rotina    : RetornaConsultaPreviaDetalhe
// Data      : 31/08/2006
// Pendencia : 22941
// Alteração : Colocar o plano contábil nas consultas de detalhe de rubricas.
//------------------------------------------------------------------------------
unit uConsultas;

interface

uses uObjFolha, uConstFolha;

function RetornaConsultaPreviaMaster: string;

function RetornaConsultaPreviaDetalhe: string;


implementation


function RetornaConsultaPreviaMaster: string;
begin
end;

function RetornaConsultaPreviaDetalhe: string;
 var ssql: string;
begin
  If SistemaFolha.FLGAGRUPARUBRICA = 1 Then
  begin
    ssql:=
      'SELECT MES, FLGDESCONTO, VALORPROVENTO, BENEFICIARIO, '+_clinefeed+
      '       VALORDESCONTO, INFORMATIVO, CODIRRFDARF, CODRUBRICA, '+_clinefeed+
      '       FLGTIPODESC, RUBRICA, FLGIRRF, FLGSALFAM, ORDEM, PARCELAS, '+_clinefeed+
      '       IDPLANOCONTABIL, '+_clinefeed+
      '       SEQRUB, FONTEPAGADORA '+_clinefeed+
      'FROM (SELECT ' +_clinefeed+
      '             HST.PARCELAS AS PARCELAS, HST.FLGTIPODESC, '+_clinefeed+
      '             DECODE(HST.FLGTIPODESC,''Y'',HST.ORDEM,NULL) AS SEQRUB, '+_clinefeed+
      '             DECODE(HST.FONTEPAGADORA,1,''FUND'',2,''INSS'',4,''PATRO'',NULL) AS FONTEPAGADORA, '+_clinefeed+
      '             HST.IDPLANOCONTABIL, '+_clinefeed+
      '             HST.MES, BEN.NOME AS BENEFICIARIO, '+_clinefeed+
      '             NVL(HST.FLGDESCONTO, PRD.FLGDESCONTO) AS FLGDESCONTO, '+_clinefeed+
      '             MIN(HST.SEQRUBRICA) AS ORDEM, '+_clinefeed+
      '             SUM(DECODE(NVL(HST.FLGDESCONTO, PRD.FLGDESCONTO),0,HST.VALORPROVENTO,0)) VALORPROVENTO, '+_clinefeed+
      '             SUM(DECODE(NVL(HST.FLGDESCONTO, PRD.FLGDESCONTO),1,HST.VALORPROVENTO,0)) VALORDESCONTO, '+_clinefeed+
      // ADAPTAÇÃO PARA RUBRICAS INFORMATIVAS PROVENTO OU DESCONTO
      '             DECODE(NVL(HST.FLGESPECIAL, PRD.FLGESPECIAL), '+_clinefeed+
      '               0, DECODE(NVL(HST.FLGDESCONTO, PRD.FLGDESCONTO), '+_clinefeed+
      //'                    2, SUM(HST.VALORINFO)||'' (I)'', '+_clinefeed+                                         // Andre Imakawa - TIBERO
      '                    2, TRUNC(SUM(HST.VALORINFO),2)||'' (I)'', '+_clinefeed+                                  // Andre Imakawa - TIBERO
      '                    0, NULL, '+_clinefeed+
      '                    1, DECODE(SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO), '+_clinefeed+
      '                         0, DECODE(SUM(HST.VALORINFO), '+_clinefeed+
      //'                              0, NULL, SUM(HST.VALORINFO)||'' (I)''), '+_clinefeed+                        // Andre Imakawa - TIBERO
      '                              0, NULL, TRUNC(SUM(HST.VALORINFO),2)||'' (I)''), '+_clinefeed+                 // Andre Imakawa - TIBERO
      //'             SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO)||'' (R)'')), '+_clinefeed+                           // Andre Imakawa - TIBERO
      '             TRUNC(SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO),2)||'' (R)'')), '+_clinefeed+                    // Andre Imakawa - TIBERO
      '             DECODE(SUM(HST.VALORPROVENTO),0,SUM(HST.VALORINFO), '+_clinefeed+
      //'               SUM(NVL(HST.VALORPROVENTO,HST.VALORINFO)))||'' (I)'') INFORMATIVO, '+_clinefeed+            // Andre Imakawa - TIBERO
      '               TRUNC(SUM(NVL(HST.VALORPROVENTO,HST.VALORINFO)),2))||'' (I)'') INFORMATIVO, '+_clinefeed+     // Andre Imakawa - TIBERO
      // MOSTRA CODIRRFDARF DA PREVIA
      '             HST.CODIRRFDARF, HST.FLGIRRF, HST.FLGSALFAM, '+_clinefeed;

    If SistemaFolha.FlgUsaCodRubExt = 0 then
      ssql:=ssql+
        '             HST.IDRUBRICA AS CODRUBRICA , PRD.DESCRICAO AS RUBRICA '+_clinefeed
    else
      ssql:=ssql+
        //'             NVL(PRD.CODPROVDESC,PRD.IDPROVENTO) AS CODRUBRICA, '+_clinefeed+                           // Andre Imakawa - TIBERO
        '             NVL(PRD.CODPROVDESC,TO_CHAR(PRD.IDPROVENTO)) AS CODRUBRICA, '+_clinefeed+                    // Andre Imakawa - TIBERO
        '             NVL(PRD.DESCRPROVDESC,PRD.DESCRICAO) AS RUBRICA '+_clinefeed;
    ssql:=ssql+
      'FROM PREVIA HST, PROVDESC PRD, PESSOA BEN '+_clinefeed+
      'WHERE (HST.IDLOTE = :IDLOTE) '+_clinefeed+
      'AND (HST.IDTITULAR = :IDTITULAR) '+_clinefeed+
      'AND (HST.IDRESPONSAVEL = :IDPESSOA) '+_clinefeed+
      'AND (HST.IDRESPONSAVEL = BEN.IDPESSOA) '+_clinefeed+
      'AND (PRD.IDPROVENTO = HST.IDRUBRICA) '+_clinefeed;

    If SistemaFolha.FlgUsaCodRubExt = 0 Then
      ssql:=ssql+
        'GROUP BY HST.MES, HST.IDRUBRICA, BEN.NOME, '+_clinefeed+
        '         NVL(HST.FLGDESCONTO, PRD.FLGDESCONTO), '+_clinefeed+
        '         NVL(HST.FLGESPECIAL, PRD.FLGESPECIAL), '+_clinefeed+
        '         HST.IDPLANOCONTABIL, '+_clinefeed+
        '         HST.CODIRRFDARF, PRD.DESCRICAO, HST.FLGIRRF, '+_clinefeed+
        '         HST.FLGSALFAM) '+_clinefeed
    Else
      ssql:=ssql+
        'GROUP BY HST.MES, PRD.CODPROVDESC, PRD.IDPROVENTO, '+_clinefeed+
        '         NVL(HST.FLGDESCONTO, PRD.FLGDESCONTO), '+_clinefeed+
        '         NVL(HST.FLGESPECIAL, PRD.FLGESPECIAL), '+_clinefeed+
        '         HST.IDPLANOCONTABIL, '+_clinefeed+
        '         HST.CODIRRFDARF, BEN.NOME, PRD.DESCRPROVDESC, '+_clinefeed+
        '         PRD.DESCRICAO, HST.FLGIRRF, '+_clinefeed+
        '         HST.PARCELAS, HST.FLGTIPODESC, '+_clinefeed+
        '         HST.ORDEM, HST.FONTEPAGADORA, '+_clinefeed+
        '         HST.FLGSALFAM) '+_clinefeed;

    ssql:=ssql+
      'ORDER BY ORDEM, CODRUBRICA'+_clinefeed;
  end
  else
  begin
    ssql:=
      'SELECT HST.MES, '+_clinefeed+
      '       HST.PARCELAS, HST.FLGTIPODESC, ' +_clinefeed+
      '       DECODE(HST.FLGTIPODESC,''Y'',HST.ORDEM,NULL) AS SEQRUB, ' +_clinefeed+
      '       DECODE(HST.FONTEPAGADORA,1,''FUND'',2,''INSS'',4,''PATRO'',NULL) AS FONTEPAGADORA, ' +_clinefeed+
      '       HST.IDPLANOCONTABIL, '+_clinefeed+
      '       HST.IDPESSOA, '+_clinefeed+
      '       HST.SEQRUBRICA AS ORDEM_GRD, '+_clinefeed+          //edilaine - SIG27469
      '       DECODE(NVL(HST.FLGDESCONTO, PRD.FLGDESCONTO),0,HST.VALORPROVENTO,0) VLRPROVENTO, '+_clinefeed+    //edilaine - SIG27469
      '       DECODE(NVL(HST.FLGDESCONTO, PRD.FLGDESCONTO),1,HST.VALORPROVENTO,0) VALORDESCONTO, '+_clinefeed+
      '       NVL(HST.FLGDESCONTO, PRD.FLGDESCONTO) AS FLGDESCONTO, HST.SEQRUBRICA, HST.CODIRRFDARF, '+_clinefeed+
      //'       PRD.FLGIRRF, PRD.FLGSALFAMILIA AS FLGSALFAM, '+_clinefeed+           // edilaine - SOL 191668 / KTN 1820235
      '       PRD.FLGIRRF, nvl(rxe.FLGSALFAMILIA,0) AS FLGSALFAM, '+_clinefeed+      // edilaine - SOL 191668 / KTN 1820235
      '       DECODE(NVL(HST.FLGESPECIAL, PRD.FLGESPECIAL), '+_clinefeed+
      '         0,DECODE(NVL(HST.FLGDESCONTO, PRD.FLGDESCONTO), '+_clinefeed+
      //'             2, HST.VALORINFO||'' (I)'', '+_clinefeed+                                             // Andre Imakawa - TIBERO
      '             2, TRUNC(HST.VALORINFO,2)||'' (I)'', '+_clinefeed+                                      // Andre Imakawa - TIBERO
      '             0, NULL, '+_clinefeed+
      '             1, DECODE(HST.VALORRECEBIDO-HST.VALORPROVENTO, '+_clinefeed+
      '                  0, DECODE(HST.VALORINFO, '+_clinefeed+
      //'                       0, NULL, HST.VALORINFO||'' (I)''), '+_clinefeed+                            // Andre Imakawa - TIBERO
      '                       0, NULL, TRUNC(HST.VALORINFO,2)||'' (I)''), '+_clinefeed+                     // Andre Imakawa - TIBERO
      //'                       HST.VALORRECEBIDO-HST.VALORPROVENTO||'' (R)'')), '+_clinefeed+              // Andre Imakawa - TIBERO
      '                       TRUNC((HST.VALORRECEBIDO-HST.VALORPROVENTO),2)||'' (R)'')), '+_clinefeed+     // Andre Imakawa - TIBERO
      '       DECODE(HST.VALORPROVENTO,0,HST.VALORINFO, '+_clinefeed+
      //'         NVL(HST.VALORPROVENTO,HST.VALORINFO))||'' (I)'') INFORMATIVO, '+_clinefeed+               // Andre Imakawa - TIBERO
      '         TRUNC(NVL(HST.VALORPROVENTO,HST.VALORINFO),2))||'' (I)'') INFORMATIVO, '+_clinefeed+        // Andre Imakawa - TIBERO
      '         HST.FONTEPAGADORA AS FONTEPAGADORA_COD,       '+_clinefeed+ // Andre Imakawa - SIG 82702
      '         HST.IDPROCJUD,                                '+_clinefeed+ // Andre Imakawa - SIG 82702
      '         HST.FLGPENSAOALIM,                            '+_clinefeed+ // Andre Imakawa - SIG 82702
      '         HST.CODNATREINF,                              '+_clinefeed+ // Andre Imakawa - SIG 99651
      //edilaine - SIG27469 - inicio
      '       HST.VALORINFO, HST.IDTITULAR, HST.IDPLANOPREV,  '+_clinefeed+
      '       HST.MESCOBRANCA, HST.ALTMANUAL, HST.IDRUBRICA,  '+_clinefeed+
      '       ''.'' AS OPERACAO, HST.VALORPROVENTO,           '+_clinefeed+
      '       HST.IDBENEFICIO, HST.SEQRUBRICA, HST.IDPESSJUR, '+_clinefeed+
      '       HST.IDMOTIVO, HST.IDLOTE, HST.IDRESPONSAVEL,    '+_clinefeed+
      '       HST.ROWID,                                      '+_clinefeed;
      //edilaine - SIG27469 - fim

    If SistemaFolha.FlgUsaCodRubExt = 0 then
      ssql:=ssql+
        '       HST.IDRUBRICA AS CODRUBRICA, PRD.DESCRICAO AS RUBRICA, '+_clinefeed
    else
      ssql:=ssql+
        //'       NVL(PRD.CODPROVDESC,PRD.IDPROVENTO) AS CODRUBRICA, '+_clinefeed+                 // Andre Imakawa - TIBERO
        '       NVL(PRD.CODPROVDESC,TO_CHAR(PRD.IDPROVENTO)) AS CODRUBRICA, '+_clinefeed+          // Andre Imakawa - TIBERO
        '       NVL(PRD.DESCRPROVDESC,PRD.DESCRICAO) AS RUBRICA, '+_clinefeed;

            //edilaine - SIG71773 - inicio
    ssql:=ssql+
        '  CASE  '+_clinefeed+
        '    WHEN (HST.FLGTIPODESC IN (''B'', ''P'')) AND B.FLGPORTADO = 1 AND B.FLGIRREGRESSIVO = 1 THEN ''R'' '+_clinefeed+
        '    WHEN (HST.FLGTIPODESC IN (''B'', ''P'')) AND B.FLGPORTADO = 1 AND B.FLGIRREGRESSIVO = 0 THEN ''P'' '+_clinefeed+
        //edilaine WO32316 : inicio
        //'    WHEN (HST.FLGTIPODESC IN (''B'', ''P'')) AND PP.TIPOOPCAOIR = 2 THEN ''R''          '+_clinefeed+
        //'    WHEN (HST.FLGTIPODESC IN (''B'', ''P'')) AND NVL(PP.TIPOOPCAOIR,0) <> 2 THEN ''P''  '+_clinefeed+
        '    WHEN (HST.FLGTIPODESC IN (''B'', ''P'')) AND DECODE(HST.IDPESSOA, HST.IDTITULAR, PP.TIPOOPCAOIR, BTT.TIPOOPCAOIR) = 2 THEN ''R''  '+_clinefeed+
        '    WHEN (HST.FLGTIPODESC IN (''B'', ''P'')) AND DECODE(HST.IDPESSOA, HST.IDTITULAR, NVL(PP.TIPOOPCAOIR,0), NVL(BTT.TIPOOPCAOIR,0)) <> 2 THEN ''P''  '+_clinefeed+
        //edilaine WO32316 : fim
        '    ELSE '' '' '+_clinefeed+
        '  END OPCAOIR,  '+_clinefeed;
    //edilaine - SIG71773 - fim

    ssql:=ssql+ ' HST.IDPERFILINVEST, ' +_clinefeed +
                ' TRIM(PE.NOME || '' - '' || cast(PE.IDPLANPREVCONTAB as varchar(10))) as NOMEPLANO  ' +_clinefeed; //Peterson Victor SIG56702

    ssql:= ssql+
      'FROM PREVIA HST, PROVDESC PRD, VW_RUBXEVENTO RXE, PERFILINVEST PE  '+_clinefeed+     // edilaine - SOL 191668 / KTN 1820235
      '     , BENEFICIO B, PARTPREVPLAN PP '+_clinefeed +                                //edilaine - SIG71773
      //edilaine WO32316 : inicio
      '     , (SELECT max(nvl(bt.TIPOOPCAOIR,1)) AS TIPOOPCAOIR '+_clinefeed +
      //'               ,bt.IDPESSJUR, bt.IDTITULAR, bt.IDPESSOA, bt.SEQPROPOSTA, bt.IDPLANOPREV, bt.IDPLANOORIGEM'+_clinefeed +     //edilaine WO38027
      '               ,bt.IDPESSJUR, bt.IDTITULAR, bt.IDPESSOA, bt.IDPLANOPREV '+_clinefeed +                                        //edilaine WO38027
      '          FROM bfciariotitplan bt '+_clinefeed +
      '         WHERE bt.idtitular <> bt.idpessoa '+_clinefeed +
      //'         GROUP BY bt.IDPESSJUR, bt.IDTITULAR, bt.IDPESSOA, bt.SEQPROPOSTA, bt.IDPLANOPREV, bt.IDPLANOORIGEM '+_clinefeed +    //edilaine WO38027
      '         GROUP BY bt.IDPESSJUR, bt.IDTITULAR, bt.IDPESSOA, bt.IDPLANOPREV '+_clinefeed +                                        //edilaine WO38027
      '       ) btt  '+_clinefeed +
      //edilaine WO32316 : fim

      'WHERE (HST.IDLOTE = :IDLOTE) ' +_clinefeed+
      'AND (HST.IDTITULAR  = :IDTITULAR) '+_clinefeed+
      'AND (HST.IDRESPONSAVEL = :IDPESSOA) '+_clinefeed+
      'AND (PRD.IDPROVENTO = HST.IDRUBRICA) '+_clinefeed+
      'AND (PRD.IDPROVENTO = RXE.IDPROVENTO(+)) '+_clinefeed+             // edilaine - SOL 191668 / KTN 1820235
      'AND (HST.IDPERFILINVEST = PE.IDPERFILINVEST(+)) '+_clinefeed+ //Peterson Victor SIG56702
      //edilaine - SIG71773 - inicio
      'AND (HST.IDBENEFICIO = B.IDBENEFICIO(+) ) '+_clinefeed+
      'AND (HST.IDTITULAR   = PP.IDPESSOA(+))       '+_clinefeed+  // Andre Imakawa - SIG 124621
      'AND (HST.IDPLANOPREV = PP.IDPLANOPREV(+))    '+_clinefeed+  // Andre Imakawa - SIG 124621
      //edilaine - SIG71773 - fim

      //edilaine WO32316 : inicio
      //'    AND BTT.IDPESSJUR(+)     = HST.IDPESSJUR   '+_clinefeed+     //edilaine WO32047
      '    AND BTT.IDPESSJUR(+)     = HST.IDPATRO     '+_clinefeed+       //edilaine WO32047
      '    AND BTT.IDTITULAR(+)     = HST.IDTITULAR   '+_clinefeed+
      '    AND BTT.IDPESSOA(+)      = HST.IDPESSOA    '+_clinefeed+
      //'    AND BTT.SEQPROPOSTA(+)   = HST.SEQPROPOSTA '+_clinefeed+     //edilaine WO38027
      '    AND BTT.IDPLANOPREV(+)   = HST.IDPLANOPREV '+_clinefeed+
      //edilaine WO32316 : fim


      'ORDER BY NVL(HST.FLGDESCONTO, PRD.FLGDESCONTO), ORDEM_GRD '+_clinefeed;    //edilaine - SIG27469
  end;

  result:=ssql;
end;

end.
