unit uCtrlConsultaCotacao;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, dbclient, Classes, sysUtils,
     uDbRADEtapa, uDbRADProcesso, uDbRadAutorizacao, uCmTypes, uFuncaoGeral,
     uDiasUteis, uDbRadObjeto, uDbImagens;

type
  TCtrlConsultaCotacao = class(TCmControlObject)
  public
    function GetPrazoEntrega( CodProcesso,IdProcxArt,Proposta,IdForCli : Double ) : OleVariant;
    function GetPrazoPgto( CodProcesso,IdProcxArt,Proposta,IdForCli : Double ) : OleVariant;
    function GetAgregados( CodProcesso,IdProcxArt,Proposta,IdForCli : Double ) : OleVariant;
    function ListSumario( CodProcesso,IdProcxArt : Double ) : OleVariant;

    function ListSCIOrigem( IdItemOC : Double ) : OleVariant;
end;

implementation

{ TCtrlConsultaCotacao }

function TCtrlConsultaCotacao.GetAgregados(CodProcesso, IdProcxArt,
  Proposta, IdForCli: Double): OleVariant;
var
   SQL : String;
begin
   SQL := ' SELECT VC.CODPROCESSO,     '+
          '        VC.IDPROCXART,      '+
          '        VC.PROPOSTA,        '+
          '        VC.IDFORCLI,        '+
          '        VC.PERCENT,         '+
          '        VC.CODTIPOCUSTAGREG,'+
          '        VC.VALOR,           '+
          '        VC.BASECALCULO,     '+
          '        TA.FLGBASE,         '+
          '        TA.CODTRATFISCE '+
          ' FROM VALORAGREGCOT VC, '+
          '      TIPOAGRE TA '+
          ' WHERE  (VC.CODPROCESSO = '+FloatToStr(CodProcesso)+') '+
          '    AND (VC.IDPROCXART  = '+FloatToStr(IdProcxArt)+') '+
          '    AND (VC.IDFORCLI    = '+FloatToStr(IdForCli)+') '+
          '    AND (VC.PROPOSTA    = '+FloatToStr(Proposta)+') '+
          '    AND (VC.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG) '+
          ' ORDER BY TA.FLGBASE DESC ';

   Result := GetDataPacket( SQL );
end;

function TCtrlConsultaCotacao.GetPrazoEntrega(CodProcesso, IdProcxArt,
  Proposta, IdForCli: Double): OleVariant;
var
   SQL : String;
begin
   SQL := ' SELECT QTDEENT, PROPOSTA, PRAZOENT, PERIODOPRAZO, IDPROCXART, '+
          ' IDPRAZOENT, IDFORCLI, DATAENT, CODPROCESSO, CODMEDIDA '+
          ' FROM PRAZOENTREGA '+
          ' WHERE  (CODPROCESSO = '+FloatToStr(CodProcesso)+') '+
          '    AND (IDPROCXART  = '+FloatToStr(IdProcxArt)+') '+
          '    AND (IDFORCLI    = '+FloatToStr(IdForCli)+') '+
          '    AND (PROPOSTA    = '+FloatToStr(Proposta)+') ';

   Result := GetDataPacket( SQL );
end;

function TCtrlConsultaCotacao.GetPrazoPgto(CodProcesso, IdProcxArt,
  Proposta, IdForCli: Double): OleVariant;
var
   SQL : String;
begin
   SQL := ' SELECT PROPOSTA, PRAZOPGTO, PERIODOPRAZO, PERCENT, '+
          ' IDPROCXART, IDPRAZOPGTO, IDFORCLI, DATAPGTO, CODPROCESSO '+
          ' FROM PRAZOPGTO '+
          ' WHERE  (CODPROCESSO = '+FloatToStr(CodProcesso)+') '+
          '    AND (IDPROCXART  = '+FloatToStr(IdProcxArt)+') '+
          '    AND (IDFORCLI    = '+FloatToStr(IdForCli)+') '+
          '    AND (PROPOSTA    = '+FloatToStr(Proposta)+') ';

   Result := GetDataPacket( SQL );
end;

function TCtrlConsultaCotacao.ListSCIOrigem(IdItemOC: Double): OleVariant;
var
  SQL : TStringList;
begin
  SQL := TStringList.Create;
  try
    SQL.Clear;
    SQL.Add('SELECT                  ');
    SQL.Add('      SOLI.NUMSOLCOMPRA,');
    SQL.Add('      IT.CODPROCESSO,   ');
    SQL.Add('      IT.IDPROCXART,    ');
    SQL.Add('      IT.CODARTIGO,     ');
    SQL.Add('      IT.QTDEPEDIDA,    ');
    SQL.Add('      IT.QTDEPENDENTE,  ');
    SQL.Add('      IT.CODMEDIDA,     ');
    SQL.Add('      IT.OBSITEMSOLIC,  ');
    SQL.Add('      SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO');
    SQL.Add('FROM ');
    SQL.Add('     ITEMSOLI IT,             ');
    SQL.Add('     ( SELECT NUMSOLCOMPRA    ');
    SQL.Add('       FROM  SOLICOMP         ');
    SQL.Add('       GROUP BY NUMSOLCOMPRA  ');
    SQL.Add('   	) SOLI,              ');
    SQL.Add('    SCITEMOC SXC,             ');
    SQL.Add('    PRODUTO P,                ');
    SQL.Add('    ARTIGO A,                 ');
    SQL.Add('    PRODVARI PV               ');
    SQL.Add('WHERE                         ');
    SQL.Add('      (SXC.IDITEMOC    = '+FloatToStr(IdItemOC)+')          ');
    SQL.Add('  AND (IT.IDITEMSOLI   =  SXC.IDITEMSOLI)    ');
    SQL.Add('  AND (IT.NUMSOLCOMPRA = SOLI.NUMSOLCOMPRA ) ');
    SQL.Add('  AND (A.CODARTIGO     = IT.CODARTIGO)       ');
    SQL.Add('  AND (A.CODPRODUTO    = P.CODPRODUTO)       ');
    SQL.Add('  AND (IT.IDPRODVARI  = PV.IDPRODVARI(+))    ');
    SQL.Add('ORDER BY DESCRICAO                           ');

    Result := GetDataPacket(SQL.Text);
  finally
    SQL.Free;
  end;
end;

function TCtrlConsultaCotacao.ListSumario(CodProcesso,
  IdProcxArt: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   try
      SQL.Append('SELECT                   ');
      SQL.Append('     C.IDFORCLI,         ');
      SQL.Append('     C.IDPROCXART,       ');
      SQL.Append('     C.CODPROCESSO,      ');
      SQL.Append('     C.PROPOSTA,         ');
      SQL.Append('     C.QTDEFORNECIDA,    ');
      SQL.Append('     C.PRECO,            ');
      SQL.Append('     C.CODMEDIDA,        ');
      SQL.Append('     C.NUMCOT,           ');
      SQL.Append('     C.DATACOT,          ');
      SQL.Append('     C.STATUS,           ');
      SQL.Append('     C.OBS,              ');
      SQL.Append('     C.MOECODIGO,        ');
      SQL.Append('     C.TXJUROS,          ');
      SQL.Append('     C.PRECOAVALORPRES,  ');
      SQL.Append('     P.RAZAOSOCIAL,      ');
      SQL.Append('     M.MOESIGLA,         ');
      SQL.Append('     C.OBS AS JUSTIFICATIVA, ');
      SQL.Append('     (C.PRECO * C.QTDEFORNECIDA) AS PRECOTOTAL ');
      SQL.Append('FROM                     ');
      SQL.Append('    PESSOA P,            ');
      SQL.Append('    COTACOES C,          ');
      SQL.Append('    MOEDA M              ');
      SQL.Append('WHERE                    ');
      SQL.Append('      (C.CODPROCESSO  = '+FloatToStr(CodProcesso)+')  ');
      SQL.Append('  AND (C.IDPROCXART   = '+FloatToStr(IdProcxArt)+')   ');
      SQL.Append('  AND (C.IDFORCLI     = P.IDPESSOA)    ');
      SQL.Append('  AND (C.MOECODIGO    = M.MOECODIGO(+))');
      SQL.Append('  AND (C.PRECOAVALORPRES IS NOT NULL)');
      SQL.Append('ORDER BY C.PRECOAVALORPRES             ');
      Result := GetDataPacket(SQL.Text);
  finally
     SQL.Free;
  end;
end;

end.
