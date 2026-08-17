{
-------------------------------------------------------------------------------
Pendência   : SOL201128_18374 / 71763
Responsável : Darivaldo Alencar
Data        : 30/03/2017
Descrição   : Melhoria de performance.
--------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SIG......: 43218
Data........: 10/08/2017
Responsável.: Darivaldo Alencar
Descrição...: Administração Imobiliária só possam ser lançados no mês de
              competência do documento ou depois
--------------------------------------------------------------------------------
SIG         : 26724
Responsável : Peterson Victor
Data        : 12/08/2016
Descrição   : Erro exclusão do documento (.DFM)
-------------------------------------------------------------------------------
Pendência   : 238622
PPM         : 505282
Responsável : Thiago Melo
Data        : 03/09/2014
Descrição   : Erro ocorrido na alteração da vmLancamento
-------------------------------------------------------------------------------
Pendência   : 201128/16002
Kintana     : 360869
Responsável : Marcio Sanches Spinosa SOL 201256 Kintana 1945186
Data        : 29/08/2013
Descrição   : Melhoria de performance na busca de documentos
-------------------------------------------------------------------------------
Rotina......: .dfm, GetSubConsulta, MS_Lancamento1BeforeOpenCds
Nº SOL......: 227442-15877
Nº KINTANA..: 2061820
Data........: 24/04/2014
Responsável.: Edilaine Ferraresi
Descrição...: melhoria de performance na busca de documentos
--------------------------------------------------------------------------------
SOL         : 226287
Kintana     : 2060118
Responsável : Edilaine Ferraresi
Data        : 12/02/2014
Descrição   : Ajuste no merge
--------------------------------------------------------------------------------
Pendência   : SOL 196482/13524 Kintana 1992938
Responsável : SADI FREIRE
Data        : 31/01/2014
Descrição   : Otimização do processo de busca na consulta de lancamentos (implementação do MS_lANCAMENTO1)
--------------------------------------------------------------------------------------------------
SOL         : 136341
Kintana     : 815095
Responsável : Helen V. Bianchi
Data        : 09/10/2011
Descrição   : Implementação MS_ContratoConfissao
--------------------------------------------------------------------------------
Marcio Sanches Spinosa SOL Nº 162907 Kintana Nº 1387467
Rotina......: Executar
Nº SOL......: 162907
Nº KINTANA..: 1387467
Data........: 16/11/2012
Responsável.: Marcio Sanches Spinosa
Descrição...: Verificação no distrato Contratual
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 107772
Nº KINTANA..: 485678
Data........: 09/11/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Retirado do MS_Contrato.Filtro condição "C.FLGTIPOCONTRATO IN ('L','D')"
---------------------------------------------------------------------------------------------------}
{
N. Sol..........: 137043
N. Kintana......: 824461
Data............: 15/10/2010
Responsável.....: Brunno Mattos
Descrição.......: Inclusão do filtro "Arrematado" na busca por imóveis, filtro
                  este que pode ser igual a "S" ou a "N", alteração feita no
                  MS_Imovel.
--------------------------------------------------------------------------------
Rotina.........:  -
N. Sol..........: 124962
N. Kintana......: 640067
Data............: 29/09/2009
Responsável.....: Marilza Colpani
Descrição.......: Inclusão do campo CODTIPIMOVEL2 e de um subselect no MS_Lancamento
}

unit dMS;

interface               

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, IvDictio, IvMulti, IvEMulti, USistema;

const
  cr_lf = #13#10;

type
  TdtmMS = class(TDataModule)
    MS_AdminImovel: TMontaSelect;
    MS_Bem: TMontaSelect;
    MS_Cartorio: TMontaSelect;
    MS_CContabil: TMontaSelect;
    MS_Cliente: TMontaSelect;
    MS_Contrato: TMontaSelect;
    MS_Fiador: TMontaSelect;
    MS_Forn: TMontaSelect;
    MS_ImovelouMestre: TMontaSelect;
    MS_ImovelMestre: TMontaSelect;
    MS_ImovelAtivo: TMontaSelect;
    MS_Imovel: TMontaSelect;
    MS_Lancamento: TMontaSelect;
    MS_Locatario: TMontaSelect;
    MS_Proposta: TMontaSelect;
    MS_Proprietario: TMontaSelect;
    MS_ReservaOrcamen: TMontaSelect;
    MS_Responsavel: TMontaSelect;
    MS_UnidAut: TMontaSelect;
    MS_Usuario: TMontaSelect;
    MS_ImovelContratoV: TMontaSelect;
    MS_ImovelComOuSemContrato: TMontaSelect;
    MS_ImovelInativo: TMontaSelect;
    MS_BemFisico: TMontaSelect;
    MS_Seguradora: TMontaSelect;
    MS_ImovelInativoouMestre: TMontaSelect;
    MS_Localizacao: TMontaSelect;
    MS_ClasseBem: TMontaSelect;
    MS_ImovelObra: TMontaSelect;
    MS_AlienaProposta: TMontaSelect;
    MS_AlienaContrato: TMontaSelect;
    MS_AlienaPropostaContrato: TMontaSelect;
    MS_AlienaRepactua: TMontaSelect;
    MS_Loja: TMontaSelect;
    MS_Indicador: TMontaSelect;
    MS_GrpApuracao: TMontaSelect;
    MS_ContratoLoja: TMontaSelect;
    MS_ImovelContrato: TMontaSelect;
    MS_CompOrcamto: TMontaSelect;
    MS_SubConta: TMontaSelect;
    MS_TipoOperacao: TMontaSelect;
    MS_Unidade: TMontaSelect;
    MS_UnidadeAtiva: TMontaSelect;
    MS_UnidadeContrato: TMontaSelect;
    MS_UnidadeContratoV: TMontaSelect;
    MS_UnidadeComOuSemContrato: TMontaSelect;
    ivTradutor: TIvExtendedTranslator;
    MS_ContratoFrame: TMontaSelect;
    //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
    MS_ContratoSinal: TMontaSelect;
    //Ricardo Cristiano - SOL Nº 69496/7501 KINTANA Nº 1539016
    MS_Lancamento_Estorna: TMontaSelect;
    MS_ContratoDistratoContratual: TMontaSelect;
    MS_Lancamento1: TMontaSelect;
    MS_ContratoConfissao: TMontaSelect;
    //Marcio Sanches Spinosa - SOL: 162907 Kintana: 1387467
    procedure DataModuleCreate(Sender: TObject);
    procedure MS_Lancamento1BeforeOpenCds(var sqlText: String;
      strListParams: TStringList);

  private { Private declarations }

  public { Public declarations }
    function GetSubConsulta : string;  //edilaine - SOL 227442-15877 / KTN 2061820

   // criar e limpar os itens default de um Monta Select
   procedure LimpaMS(const MS_: TMontaSelect);
   Function GetView: String;//Darivaldo Alencar SOL201128_18374
  end;



var
  dtmMS: TdtmMS;



implementation
{$R *.DFM}



// criar e limpar os itens default de um Monta Select
procedure TdtmMS.LimpaMS(const MS_: TMontaSelect);
var
   i: integer;
begin
   MS_.ItemsBusca.Clear;
   for i := 0 to (MS_.Colunas.Count - 1) do MS_.ItemsBusca.Add('');
end;

procedure TdtmMS.DataModuleCreate(Sender: TObject);
begin
// =================================================================================================
//    Valores default para os MontaSelect
// =================================================================================================

   LimpaMS(dtmMS.MS_Proposta);
   dtmMS.MS_Proposta.ItemsBusca[1] := 'Ativa';

   LimpaMS(dtmMS.MS_ImovelContrato);
   dtmMS.MS_ImovelContrato.ItemsBusca[6] := 'Vigente';
end;

//edilaine - SOL 227442-15877 / KTN 2061820 - inicio
procedure TdtmMS.MS_Lancamento1BeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
var
  sSQL : string;
begin
  sSQL := GetSubConsulta();
  sSQL := StringReplace(sSQL, '&idmodulo', IntToStr(Sistema.Idmodulo), [rfReplaceAll]);
  sqlText := StringReplace(sqlText, 'VWLANCAMENTO VW', '( ' + sSQL + ') VW ', []);
end;

function TdtmMS.GetSubConsulta: string;
begin
  Result := 'select /*+ PARALLEL(lancamentosimovel,20,1) (contratoimovel,20,1)*/  '+cr_lf+
            '       (im.imonome) as NOME_MESTRE,   '+cr_lf+
            '       (i.imonome) as NOME_IMOVEL,    '+cr_lf+
            '       i.imocodigo,                   '+cr_lf+
            '       c.connumero,                   '+cr_lf+
            '       c.connome,                     '+cr_lf+
            '       t.desccustorecimo,             '+cr_lf+
            '       DECODE(li.recpag, ''R'', LI.VLRLANCRECEB , LI.VLRLANCPAGAR) valor_lanc, '+cr_lf+
            '       DECODE(li.recpag, ''R'', VAL.TOT_RECEBER , VAL.TOT_PAGAR) AS PREVISTO,  '+cr_lf+
            '       DECODE(li.recpag, ''R'', VAL.TOT_RECEBIDO, VAL.TOT_PAGO) AS EFETIVO,    '+cr_lf+
            '       li.ANOCOMPETENCIA,                                                    '+cr_lf+
            '       li.MESCOMPETENCIA,                                                    '+cr_lf+
            '       li.datavencimento,                                                    '+cr_lf+
            '       li.datalancamento,                                                    '+cr_lf+
            '       DECODE(li.FLGIMPORTADO, 1, li.DATAVENCIMENTO, DECODE(RTRIM(D.STATUS), ''2'', BX.DATABAIXA, NULL)) AS DATA_BAIXA, '+cr_lf+
            '       li.TRGDTINCLUSAO,               '+cr_lf+
            '       PFC.NOME AS NF_FORCLI,          '+cr_lf+
            '       U.NOMEUSUARIO AS LOGIN_USUARIO, '+cr_lf+
            '       PF.DESCRICAO AS PORTADOR_FORMA, '+cr_lf+
            '       d.nossonumero,                  '+cr_lf+
            '       d.nodocumento,                  '+cr_lf+
            '       d.numapgr,                      '+cr_lf+
            '       li.FLGORIGEMLANC,               '+cr_lf+
            '       li.FLGINTEGRADO,                '+cr_lf+
            '       i.CODTIPIMOVEL,      '+cr_lf+
            '       li.idimovel,         '+cr_lf+
            '       li.idcontratoimovel, '+cr_lf+
            '       li.idlancimovel,     '+cr_lf+
            '       li.coddocumento,     '+cr_lf+
            '       li.plncodigo,        '+cr_lf+
            '       d.nodocumento AS DOC_CAPCAR, '+cr_lf+
            '       li.idpessoa,         '+cr_lf+
            '       li.iddocumento,      '+cr_lf+
            '       li.recpag,           '+cr_lf+
            '       li.DATALIMITE,       '+cr_lf+
            '       d.status AS STATUS_DOC '+cr_lf+
            '       ,li.IDMODULO ' +cr_lf+ // Thiago Melo SOL 238622 PPM 505282

            //Darivaldo Alencar SIG43218 -Inicio
            '       ,im.idpais     ' +cr_lf+
            '       ,im.codestado  ' +cr_lf+
            '       ,im.idcidades  ' +cr_lf+
            //Darivaldo Alencar SIG43218 -fim

            '  from lancamentosimovel li,'+cr_lf+
            '       (select /*+ PARALLEL(documento,20,1) */   '+cr_lf+
            '               doc.coddocumento, doc.nodocumento, doc.nossonumero, doc.numapgr, doc.CODPORTFORMA, doc.STATUS '+cr_lf+
            '          from documento doc                '+cr_lf+
            '         where ( Doc.IDMODULO IN ( &idmodulo ) )  '+cr_lf+
            '       ) d,                                 '+cr_lf+
            '       imovel i,                            '+cr_lf+
            '       imovel im,                           '+cr_lf+
            '       contratoimovel c,                    '+cr_lf+
            '       tipocustorecimov t,                  '+cr_lf+
            '       pessoa PFC,                          '+cr_lf+
            '       USUARIOSISTEMA u,                    '+cr_lf+
            '       PORTADORFORMA pf,                    '+cr_lf+
            '       (SELECT /*+ INDEX (D, XPKDOCUMENTO) INDEX(LD)  PARALLEL(documento,20,1) PARALLEL(LANCTODOCUM,20,1)*/  '+cr_lf+
            '               D.CODDOCUMENTO,                                                                               '+cr_lf+
            '               SUM(DECODE(RTRIM(LD.OPERACAO), ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1), 0), 0) +  '+cr_lf+
            '                   DECODE(RTRIM(LD.OPERACAO), ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1), 0), 0) +  '+cr_lf+
            '                   DECODE(RTRIM(LD.OPERACAO), ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1), 0), 0) +  '+cr_lf+
            '                   DECODE(RTRIM(LD.OPERACAO),''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1), 0), 0) ) AS TOT_RECEBER, '+cr_lf+
            '               SUM(DECODE(RTRIM(LD.OPERACAO), ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1),                          '+cr_lf+
            '                                                                             DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1)), 0)) AS TOT_ALTERADOR,   '+cr_lf+
            '               SUM(DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1), 0), 0)) AS TOT_RECEBIDO, '+cr_lf+
            '               SUM(DECODE(RTRIM(LD.OPERACAO), ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1), 0), 0) +                 '+cr_lf+
            '                   DECODE(RTRIM(LD.OPERACAO), ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1), 0), 0) +                 '+cr_lf+
            '                   DECODE(RTRIM(LD.OPERACAO), ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1), 0), 0) +                 '+cr_lf+
            '                   DECODE(RTRIM(LD.OPERACAO),''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1), 0), 0)) AS TOT_PAGAR,    '+cr_lf+
            '               SUM(DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1), 0), 0)) AS TOT_PAGO      '+cr_lf+
            '          FROM DOCUMENTO D, LANCTODOCUM LD               '+cr_lf+
            '         WHERE ( D.CODDOCUMENTO = LD.CODDOCUMENTO )      '+cr_lf+
            '           AND ( D.IDMODULO IN ( &idmodulo ) )                 '+cr_lf+
            '         GROUP BY D.CODDOCUMENTO                         '+cr_lf+
            '       ) VAL,                                            '+cr_lf+
            '       (SELECT /*+ INDEX(D1) INDEX(LD)  PARALLEL(documento,20,1) PARALLEL(LANCTODOCUM,20,1) */  '+cr_lf+
            '               D1.CODDOCUMENTO, D1.FLGNAOCONCILIADO, D1.STATUS,                                 '+cr_lf+
            '               SUM(LD.VALOR)      AS VALORPAGO,                                                 '+cr_lf+
            '               DECODE( MIN(MMM.DATALANCFINAN),NULL,MIN(LD.DATALANCTO), MIN(MMM.DATALANCFINAN)) AS DATABAIXA  '+cr_lf+
            '          FROM DOCUMENTO D1,   '+cr_lf+
            '               LANCTODOCUM LD, '+cr_lf+
            '               (SELECT XX.IDRELACIONANI,    '+cr_lf+
            '                       XX.MOVIN_FINAN,      '+cr_lf+
            '                       XX.DATALANCFINAN,    '+cr_lf+
            '                       MM.CODDOCUMENTO      '+cr_lf+
            '                  FROM (SELECT R2.IDRELACIONANI,  '+cr_lf+
            '                               R2.CODLANCFINANC AS MOVIN_FINAN,'+cr_lf+
            '                               M.DATALANCFINAN,                '+cr_lf+
            '                               R2.FLGNI                        '+cr_lf+
            '                          FROM RELACIONANI R2,                 '+cr_lf+
            '                               MOVIMFINANC M                   '+cr_lf+
            '                         WHERE R2.CODLANCFINANC = M.CODLANCFINANC  '+cr_lf+
            '                           AND EXISTS (SELECT 1 /*+ INDEX(RB) */   '+cr_lf+
            '                                                      FROM RELACIONANI R3,  '+cr_lf+
            '                                                           RECBTOPAGTO RB   '+cr_lf+
            '                                                     WHERE R3.CODLANCFINANC = RB.CODLANCFINANC   '+cr_lf+
            '                                                       AND R3.IDRELACIONANI = R2.IDRELACIONANI   '+cr_lf+
            '                                                       AND R3.FLGNI = ''I''                      '+cr_lf+
            '                                                   )                                             '+cr_lf+
            '                       ) XX,                                                                     '+cr_lf+
            '                       (SELECT CJ1.IDRELACIONANI, CJ1.MOVIN_FINAN,                               '+cr_lf+
            '                               CJ2.CODDOCUMENTO                                                  '+cr_lf+
            '                          FROM (SELECT /*+ PARALLEL(MOVIMFINANC,20,1) */                         '+cr_lf+
            '                                       R2.IDRELACIONANI,                                         '+cr_lf+
            '                                       R2.CODLANCFINANC AS MOVIN_FINAN,                          '+cr_lf+
            '                                       M.DATALANCFINAN,                                          '+cr_lf+
            '                                       R2.FLGNI                                                  '+cr_lf+
            '                                  FROM RELACIONANI R2,                                           '+cr_lf+
            '                                       MOVIMFINANC M                                             '+cr_lf+
            '                                 WHERE R2.CODLANCFINANC = M.CODLANCFINANC                        '+cr_lf+
            '                                   AND EXISTS (SELECT 1 /*+ INDEX(RB) */                         '+cr_lf+
            '                                                              FROM RELACIONANI R3,               '+cr_lf+
            '                                                                   RECBTOPAGTO RB                '+cr_lf+
            '                                                             WHERE R3.CODLANCFINANC = RB.CODLANCFINANC  '+cr_lf+
            '                                                               AND R3.IDRELACIONANI = R2.IDRELACIONANI  '+cr_lf+
            '                                                               AND R3.FLGNI = ''I''                     '+cr_lf+
            '                                                           )                                            '+cr_lf+
            '                              ) CJ1,                                                                    '+cr_lf+
            '                              (SELECT  /*+ INDEX(R, XPKRECBTOPAGTO)  PARALLEL(RECBTOPAGTO,20,1) PARALLEL(LANCAMENTOSIMOVEL,20,1) */  '+cr_lf+
            '                                      DISTINCT R.CODDOCUMENTO,          '+cr_lf+
            '                                      R.CODLANCFINANC AS MOVIN_DOCUM    '+cr_lf+
            '                                 FROM RECBTOPAGTO R,                    '+cr_lf+
            '                                      LANCAMENTOSIMOVEL DD              '+cr_lf+
            '                                WHERE R.CODDOCUMENTO = DD.CODDOCUMENTO  '+cr_lf+
            '                              ) CJ2                                     '+cr_lf+
            '                        WHERE CJ2.MOVIN_DOCUM = CJ1.MOVIN_FINAN         '+cr_lf+
            '                      ) MM                                              '+cr_lf+
            '                WHERE MM.IDRELACIONANI = XX.IDRELACIONANI               '+cr_lf+
            '              ) MMM                                                     '+cr_lf+
            '        WHERE ( D1.CODDOCUMENTO = MMM.CODDOCUMENTO(+) )                 '+cr_lf+
            '          AND ( LD.CODDOCUMENTO = D1.CODDOCUMENTO )                     '+cr_lf+
            '          AND ( D1.IDMODULO IN ( &idmodulo ) )                                '+cr_lf+
            '          AND ( RTRIM(LD.OPERACAO) = ''5'' )                            '+cr_lf+
            '          AND ( LD.ESTORNO IS NULL )                                    '+cr_lf+
            '        GROUP BY D1.CODDOCUMENTO, D1.FLGNAOCONCILIADO, D1.STATUS        '+cr_lf+
            '      ) BX                                                              '+cr_lf+
            ' WHERE ( li.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )                  '+cr_lf+
            '   AND ( li.IDUSUARIOSISTEMA = U.IDUSUARIO(+) )                         '+cr_lf+
            '   AND ( li.CODDOCUMENTO = D.CODDOCUMENTO(+) )                          '+cr_lf+
            '   AND ( D.CODPORTFORMA = PF.CODPORTFORMA(+) )                          '+cr_lf+
            '   AND ( D.CODDOCUMENTO = BX.CODDOCUMENTO(+) )                          '+cr_lf+
            '   AND ( D.CODDOCUMENTO = VAL.CODDOCUMENTO(+) )                         '+cr_lf+
            '   AND ( PFC.IDPESSOA = li.IDFORCLI )                                   '+cr_lf+
            '   AND ( T.IDTIPOCUSTORECIMO = li.IDTIPOCUSTORECIMO )                   '+cr_lf+
            '   AND ( li.IDIMOVEL = I.IDIMOVEL )                                     '+cr_lf+
            '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )                               '+cr_lf+
            '   AND ( I.FLGTIPOIMOVEL = 1 )                                          '+cr_lf+
            '   AND ( IM.FLGTIPOIMOVEL = 0 )                                         ';
end;
//edilaine - SOL 227442-15877 / KTN 2061820 - fim


{View VWLANCAMENTO - Darivaldo Alencar SOL201128_18374 -inicio}
function TdtmMS.GetView: String;

Function Calc_TOT(sValor: String; cSigla:char): String;
var
  sSigla,
  sFinal,
  sComp: String;
begin
    case cSigla of
      'R': sSigla:= 'D';
      'P': sSigla:= 'C';
    end;

		sComp := '0';
		sFinal:= EmptyStr;

	  if (sValor = '1') or (sValor = '2') or (sValor = '3') then
        sFinal := '+';

	  if (sValor = '5') then
		  begin
         case cSigla of
			     'R': sSigla:= 'C';
			     'P': sSigla:= 'D';
			   end;
		  end;

	  if(sValor = '4') then
	     sComp := ' DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1) '+#13#10;

    result:= 'DECODE(RTRIM(LD.OPERACAO),'+QuotedStr(sValor)+', DECODE(D.RECPAG, '+QuotedStr(cSigla)+', DECODE(LD.DEBCRE, '+
              QuotedStr(sSigla)+', LD.VALOR, LD.VALOR * -1), '+ sComp +'), 0) '+ sFinal+ #13#10
end;

Function GetviewPT01:String;
begin
  result:= 'SELECT' + #13#10 +
           '        R3.IDRELACIONANI' + #13#10 +
           '   FROM RELACIONANI R3,' + #13#10 +
           '        RECBTOPAGTO RB' + #13#10 +
           '  WHERE R3.CODLANCFINANC = RB.CODLANCFINANC';
end;

Function GetviewPT02:String;
begin
  result:=  'SELECT R2.IDRELACIONANI,' + #13#10 +
            '        R2.CODLANCFINANC AS MOVIN_FINAN,' + #13#10 +
            '        M.DATALANCFINAN,' + #13#10 +
            '        R2.FLGNI' + #13#10 +
            '   FROM RELACIONANI R2,' + #13#10 +
            '        MOVIMFINANC M' + #13#10 +
            '  WHERE R2.CODLANCFINANC = M.CODLANCFINANC' + #13#10 +
            '    AND R2.IDRELACIONANI IN ('+GetviewPT01+')';

end;

Function GetviewPT03:String;
begin
  result:=  'SELECT' + #13#10 +
            '    DISTINCT R.CODDOCUMENTO,' + #13#10 +
            '             R.CODLANCFINANC AS MOVIN_DOCUM' + #13#10 +
            '        FROM RECBTOPAGTO R,' + #13#10 +
            '             LANCAMENTOSIMOVEL DD' + #13#10 +
            '       WHERE R.CODDOCUMENTO = DD.CODDOCUMENTO';
end;

Function GetviewPT04:String;
begin
  result:=  'SELECT CJ1.IDRELACIONANI, CJ1.MOVIN_FINAN,' + #13#10 +
            '      CJ2.CODDOCUMENTO' + #13#10 +
            ' FROM ('+GetviewPT02+') CJ1,' + #13#10 +
            '      ('+GetviewPT03+') CJ2' + #13#10 +
            'WHERE CJ2.MOVIN_DOCUM = CJ1.MOVIN_FINAN';

end;

Function GetviewPT05:String;
begin
  result:=  'SELECT XX.IDRELACIONANI,' + #13#10 +
            '                XX.MOVIN_FINAN,' + #13#10 +
            '                XX.DATALANCFINAN,' + #13#10 +
            '                MM.CODDOCUMENTO' + #13#10 +
            '           FROM  ('+GetviewPT02+') XX,' + #13#10 +
            '                 ('+GetviewPT04+') MM' + #13#10 +
            '         WHERE MM.IDRELACIONANI = XX.IDRELACIONANI' + #13#10 +
            '           AND XX.FLGNI = ''I''';

end;

Function GetviewPT06:String;
begin
  result:=  'SELECT   D1.CODDOCUMENTO, D1.FLGNAOCONCILIADO, D1.STATUS,' + #13#10 +
            '          SUM(LD.VALOR)      AS VALORPAGO,' + #13#10 +
            '          DECODE( MIN(MMM.DATALANCFINAN),NULL,MIN(LD.DATALANCTO), MIN(MMM.DATALANCFINAN)' + #13#10 +
            '                 ) AS DATABAIXA' + #13#10 +
            '     FROM DOCUMENTO D1, LANCTODOCUM LD,' + #13#10 +
            '         ('+GetviewPT05+' ) MMM' + #13#10 +
            '    WHERE ( D1.IDMODULO IN ('+IntToStr(Sistema.Idmodulo)+') )' + #13#10 +
            '      AND ( RTRIM(LD.OPERACAO) = ''5'' )' + #13#10 +
            '      AND ( LD.ESTORNO IS NULL )' + #13#10 +
            '      AND ( D1.CODDOCUMENTO = LD.CODDOCUMENTO )' + #13#10 +
            '      AND ( D1.CODDOCUMENTO = MMM.CODDOCUMENTO(+) )' + #13#10 +
            '   GROUP BY D1.CODDOCUMENTO, D1.FLGNAOCONCILIADO, D1.STATUS';
end;

Function GetviewPT07:String;
begin
  result:=  'SELECT' + #13#10 +
            '      D.CODDOCUMENTO,' + #13#10 +
            '      SUM('+Calc_TOT('1','R') + Calc_TOT('2','R') + Calc_TOT('3','R') + Calc_TOT('12','R') +') AS TOT_RECEBER,' + #13#10 +
            '      SUM('+Calc_TOT('4','R') +') AS TOT_ALTERADOR,' + #13#10 +
            '      SUM('+Calc_TOT('5','R') +') AS TOT_RECEBIDO,' + #13#10 +
            '      SUM('+Calc_TOT('1','P') + Calc_TOT('2','P') + Calc_TOT('3','P') + Calc_TOT('12','P') +') AS TOT_PAGAR,' + #13#10 +
            '      SUM('+Calc_TOT('5','P') +') AS TOT_PAGO' + #13#10 +
            '   FROM' + #13#10 +
            '      DOCUMENTO D, LANCTODOCUM LD' + #13#10 +
            '   WHERE' + #13#10 +
            '      ( D.IDMODULO IN ('+IntToStr(Sistema.Idmodulo)+') )' + #13#10 +
            '      AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )' + #13#10 +
            '   GROUP BY' + #13#10 +
            '      D.CODDOCUMENTO';
end;

begin
  {select principal da query}
  result:=  'SELECT' + #13#10 +
            '   IM.IMONOME AS NOME_MESTRE, I.IMONOME AS NOME_IMOVEL,' + #13#10 +
            '   IM.IMONOME||'' - ''||I.IMONOME AS IMOVEL_EXTENSO,' + #13#10 +
            '   DECODE(C.CONNUMERO, NULL, C.CONNOME, C.CONNUMERO||'' - ''||C.CONNOME) AS CONTRATO_EXTENSO,' + #13#10 +
            '   T.DESCCUSTORECIMO,' + #13#10 +
            '   T.CODTIPDOC, T.FLGREEMBOLSO, T.IDRECEITAREEMB,' + #13#10 +
            '   T.FLGOBRIGAORC, T.FLGDIARIO,' + #13#10 +
            '   D.IDFORCLI AS FORCLI_DOC, RTRIM(D.STATUS) AS STATUS_DOC,' + #13#10 +
            '   D.NODOCUMENTO AS DOC_CAPCAR, D.COMPLDOCUMENTO AS COMPL_CAPCAR,' + #13#10 +
            '   D.NUMAPGR, D.EMISBLOQ, D.GRUPODOC,' + #13#10 +
            '   D.NOSSONUMERO, D.CODGRUPOCNAB, D.FLGNAOCONCILIADO,' + #13#10 +
            '   D.DATAPROGRAMADA,' + #13#10 +
            '   PLN.PLNPLANIL,' + #13#10 +
            '   U.NOMEUSUARIO AS LOGIN_USUARIO,' + #13#10 +
            '   PU.NOME AS NF_USUARIO,' + #13#10 +
            '   PFC.NOME AS NF_FORCLI,' + #13#10 +
            '   PFC.RAZAOSOCIAL AS RS_FORCLI,' + #13#10 +
            '   L.VLRLANCOMRECEB, L.VLRLANCOMPAGAR, L.MOEDARECEB,' + #13#10 +
            '   L.VLRLANCRECEB, L.VLRLANCPAGAR, L.MOEDAPAGAR,' + #13#10 +
            '   L.IDFORCLI,' + #13#10 +
            '   L.IDLANCIMOVEL, L.IDPESSOA, L.IDIMOVEL,' + #13#10 +
            '   L.IDTIPOCUSTORECIMO, L.RECPAG,' + #13#10 +
            '   L.IDCONTRATOIMOVEL, L.CODDOCUMENTO, L.IDRATEIODOCUM, L.PLNCODIGO,' + #13#10 +
            '   L.DATALANCAMENTO, L.DATAVENCIMENTO, L.DTINICTBDIARIA, L.DTFIMCTBDIARIA,' + #13#10 +
            '   DECODE(L.DATAEMISSAO, NULL, L.DATALANCAMENTO, L.DATAEMISSAO) AS DATAEMISSAO,' + #13#10 +
            '   L.MESCOMPETENCIA, L.ANOCOMPETENCIA,' + #13#10 +
            '   L.FLGTIPOLANCAMENTO, L.FLGORIGEMLANC, L.FLGESTORNADO,' + #13#10 +
            '   L.TRGDTINCLUSAO, L.TRGUSERINCLUSAO,' + #13#10 +
            '   L.MESREFERENCIA, L.ANOREFERENCIA,' + #13#10 +
            '   L.FLGAGRUPAR, L.FLGAGRUPADO,' + #13#10 +
            '   L.VLRJUROS, L.VLRMULTA, L.VLRCORRECAOMON,' + #13#10 +
            '   L.DATACORRECAO, L.FLGMULTACALCULADA, L.FLGINTEGRADO,' + #13#10 +
            '   L.IDUSUARIOSISTEMA,' + #13#10 +
            '   L.FLGERRO, L.IDADMINIMOVEL, L.ANOPRESTACAO, L.MESPRESTACAO,' + #13#10 +
            '   L.FLGIMPORTADO, L.VLRCOMISSAO,' + #13#10 +
            '   L.IDRESERVAORCAMEN, L.IDDOCUMENTO, L.REFERENCIAAP, L.CODFORMA,' + #13#10 +
            '   L.OBS, L.NODOCUMENTO, L.COMPLDOCUMENTO, L.MSGERROINTEGRA,' + #13#10 +
            '   L.DATALIMITE,' + #13#10 +
            '   L.CODPORTFORMA AS CODPORTFORMA_LANC,' + #13#10 +
            '   PF.DESCRICAO AS PORTADOR_FORMA,' + #13#10 +
            '   PFL.DESCRICAO AS PORTADOR_FORMA_LANC,' + #13#10 +
            '   (' + #13#10 +
            '   DECODE(L.RECPAG,''R'', DECODE(PF.DESCRICAO, NULL, PFL.DESCRICAO, PF.DESCRICAO),''P'', FRP.DESCRICAO, '''')) AS FORMA_RECTOPAGTO,' + #13#10 +
            '   I.IDIMOVELMESTRE, I.CODSUBCONTA,' + #13#10 +
            '   I.FLGTIPOIMOVEL, I.IMODATACONSTRUCAO, I.IMOAREA,' + #13#10 +
            '   I.IMOFRACAOIDEAL, I.FLGSTATUSOCUPACAO,' + #13#10 +
            '   I.QTDETOTALCOTAS, I.IMOLOGRADOURO,' + #13#10 +
            '   I.IMONUMERO, I.IMOCOMPLEMENTO, I.IMOBAIRRO,' + #13#10 +
            '   I.IMOCIDADE, I.IMONOMEENDERECO, I.IMOCEP,' + #13#10 +
            '   I.IDCARTEIRAINVEST, I.CODTIPIMOVEL, L.CODTIPIMOVEL AS CODTIPIMOLANC,' + #13#10 +
            '   I.FLGATIVO, I.IMOPERCENTRATEIO, I.IMOMOEDACOMPRA,' + #13#10 +
            '   I.IMOVLRCOMPRA, I.IMODATACOMPRA, I.IMOMATRICULA,' + #13#10 +
            '   I.IMODATAHABITESE, I.IDCARTORIO,' + #13#10 +
            '   I.FLGSTATUS AS STATUS_IMOVEL,' + #13#10 +
            '   I.IMOCODIGO, I.IMOAREAGERENCIAL,' + #13#10 +
            '   I.FLGCATIMOVEL, I.IMOVLRREAVAL, I.IMODATAREAVAL,' + #13#10 +
            '   I.IMOVLRMERCADO, I.IMODATAMERCADO, I.IMOMOEDAREAVAL,' + #13#10 +
            '   I.IMOMOEDAMERCADO,' + #13#10 +
            '   C.CONNUMERO, C.CONNOME,' + #13#10 +
            '   C.CODPORTFORMA, C.CONINDICEREAJUSTE, C.IDINDCORRECAO,' + #13#10 +
            '   C.IDLOCATARIO, C.IDADMINIMOVEL AS ADMIN_CONTRATO,' + #13#10 +
            '   C.CONDATAASSINATURA, C.CONDATAINICIO, C.CONDATAFIM,' + #13#10 +
            '   C.CONDATADENUNCIA, C.CONVLRTOTAL, C.FLGINDETERMINADO,' + #13#10 +
            '   C.CONDIAVENCIMENTO, C.CONVLRAJUSTADO,' + #13#10 +
            '   C.FLGTIPOALUGUEL, C.FLGTIPOCOBRANCA, C.CONPERREAJUSTE,' + #13#10 +
            '   C.CONDATAREAJUSTE, C.CONPERCENTMORA, C.CONPERMORA,' + #13#10 +
            '   C.CONDIACOMPLEMENTO, C.FLGMESPOSTERIOR, C.CONVLRMULTA,' + #13#10 +
            '   C.CONPERCENTMULTA, C.CONVLRMORA, C.CONMOEDAMORA,' + #13#10 +
            '   C.CONINDICEMORA, C.CONMOEDAMULTA, C.FLGCOMPETALUGUEL,' + #13#10 +
            '   C.FLGSTATUS AS STATUS_CONTRATO,' + #13#10 +
            '   C.CONPROXREAJUSTE, C.CONDATACARENCIA,' + #13#10 +
            '   C.CONDATAAVDENUNCIA, C.CONDATARENEGOC, C.CONDATAAVRENEGOC,' + #13#10 +
            '   C.CONDIASTOLERANCIA, C.FLGTIPODIAVENC, C.FLGTIPODIACOMPL,' + #13#10 +
            '   C.FLGTIPODIATOLERA, C.FLGFIANCA, C.CONDATAFIANCAFIM,' + #13#10 +
            '   C.CONDATAFIANCAAV, C.CONMESREFREAJUSTE, C.FLGMORAPROPORC,' + #13#10 +
            '   C.FLGTIPOCONTRATO, C.FLGJUROSREMUNERA, C.FLGREMUNERAALUG,' + #13#10 +
            '   C.CONPERCENTJUROS, C.CONPERCENTREMUNER,' + #13#10 +
            '   C.IDMSGBOLETO, C.CONTAXAADMIN,' + #13#10 +
            '   C.FLGCOBRANCAAUTO, C.CONDATAFIANCAINI, C.CONDIASREPASSE,' + #13#10 +
            '   C.IDCONANTERIOR, C.CONBANCOFIANCA, C.CONVLRFIANCA,' + #13#10 +
            '   C.CONPERALUGUEL, C.IDATIVIDADE, C.IDSITCONTIMOB,' + #13#10 +
            '   C.CONDIASTOLERACOMP, C.CONQUANTVAGAS,' + #13#10 +
            '   C.IDCIDADES, C.IDPAIS, C.CODESTADO, C.IDRESPONSAVEL,' + #13#10 +
            '   DECODE(L.RECPAG, ''R'', MR.MOESIGLA, MP.MOESIGLA) AS MOEDA_LANC,' + #13#10 +
            '   DECODE(L.RECPAG, ''R'', L.MOEDARECEB, L.MOEDAPAGAR) AS COD_MOEDA,' + #13#10 +
            '   DECODE(L.RECPAG, ''R'', L.VLRLANCOMRECEB, L.VLRLANCOMPAGAR) AS VALOR_OM_LANC,' + #13#10 +
            '   DECODE(L.RECPAG, ''R'', L.VLRLANCRECEB, L.VLRLANCPAGAR) AS VALOR_LANC,' + #13#10 +
            '   DECODE(L.RECPAG, ''R'', VAL.TOT_RECEBER, VAL.TOT_PAGAR) AS PREVISTO,' + #13#10 +
            '   DECODE(L.RECPAG, ''R'', VAL.TOT_RECEBIDO, VAL.TOT_PAGO) AS EFETIVO,' + #13#10 +
            '   FRP.DESCRICAO AS FORMARECPAG,' + #13#10 +
            '   L.IDPROGRAMA, L.NUMAPALT,' + #13#10 +
            '   L.CODCENTROCUSTO, L.IDEMPRESA, CC.NOME AS NOME_CENTRO_CUSTO,' + #13#10 +
            '   L.IDLANCREEMBDESP, L.IDCBANCARIA, L.IDMODULO,' + #13#10 +
            '   VAL.TOT_ALTERADOR,' + #13#10 +
            '   DECODE(L.FLGIMPORTADO, 1, L.DATAVENCIMENTO, DECODE(RTRIM(D.STATUS), ''2'', BX.DATABAIXA, NULL)) AS DATA_BAIXA,' + #13#10 +
            '   DECODE(L.RECPAG, ''P'', DECODE(L.FLGIMPORTADO, 1, L.VLRLANCPAGAR, VAL.TOT_PAGAR))  AS TOT_PAGAR,' + #13#10 +
            '   DECODE(L.RECPAG, ''P'', DECODE(L.FLGIMPORTADO, 1, L.VLRLANCPAGAR, VAL.TOT_PAGO))  AS TOT_PAGO,' + #13#10 +
            '   DECODE(L.RECPAG, ''R'', DECODE(L.FLGIMPORTADO, 1, L.VLRLANCRECEB, VAL.TOT_RECEBER))  AS TOT_RECEBER,' + #13#10 +
            '   DECODE(L.RECPAG, ''R'', DECODE(L.FLGIMPORTADO, 1, L.VLRLANCRECEB, VAL.TOT_RECEBIDO))  AS TOT_RECEBIDO' + #13#10 +
            'FROM' + #13#10 +
            '   PESSOA PFC,' + #13#10 +
            '   PESSOA PU,' + #13#10 +
            '   DOCUMENTO D, PLANILHA PLN,' + #13#10 +
            '   LANCAMENTOSIMOVEL L,' + #13#10 +
            '   IMOVEL I, IMOVEL IM, CONTRATOIMOVEL C,' + #13#10 +
            '   TIPOCUSTORECIMOV T,' + #13#10 +
            '   MOEDA MR, MOEDA MP, PORTADORFORMA PF, PORTADORFORMA PFL,' + #13#10 +
            '   FORMARECPAG FRP,' + #13#10 +
            '   CENTCUST CC,' + #13#10 +
            '   USUARIOSISTEMA U,' + #13#10 +
            '   ('+ GetviewPT06 +') BX,' + #13#10 +
            '   ('+ GetviewPT07 +') VAL' + #13#10 +
            'WHERE' + #13#10 +
            '   ( I.FLGTIPOIMOVEL = 1 )' + #13#10 +
            '   AND ( IM.FLGTIPOIMOVEL = 0 )' + #13#10 +
            '   AND ( L.IDIMOVEL = I.IDIMOVEL )' + #13#10 +
            '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )' + #13#10 +
            '   AND ( L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )' + #13#10 +
            '   AND ( L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )' + #13#10 +
            '   AND ( L.MOEDARECEB = MR.MOECODIGO(+) )' + #13#10 +
            '   AND ( L.MOEDAPAGAR = MP.MOECODIGO(+) )' + #13#10 +
            '   AND ( L.IDFORCLI = PFC.IDPESSOA )' + #13#10 +
            '   AND ( L.IDUSUARIOSISTEMA = U.IDUSUARIO(+) )' + #13#10 +
            '   AND ( U.IDUSUARIO = PU.IDPESSOA )' + #13#10 +
            '   AND ( L.PLNCODIGO = PLN.PLNCODIGO(+) )' + #13#10 +
            '   AND ( L.CODFORMA = FRP.CODFORMA(+) )' + #13#10 +
            '   AND ( L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) )' + #13#10 +
            '   AND ( L.IDEMPRESA = CC.IDEMPRESA(+) )' + #13#10 +
            '   AND ( L.CODPORTFORMA = PFL.CODPORTFORMA(+) )' + #13#10 +
            '   AND ( D.CODPORTFORMA = PF.CODPORTFORMA(+) )' + #13#10 +
            '   AND ( L.CODDOCUMENTO = D.CODDOCUMENTO(+) )' + #13#10 +
            '   AND ( D.CODDOCUMENTO = BX.CODDOCUMENTO(+) )' + #13#10 +
            '   AND ( D.CODDOCUMENTO = VAL.CODDOCUMENTO(+) )';
end;
//Darivaldo Alencar SOL201128_18374 -fim

end.
