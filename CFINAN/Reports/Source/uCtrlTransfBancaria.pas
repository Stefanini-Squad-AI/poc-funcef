unit uCtrlTransfBancaria;

interface

Uses
  SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, DB,
  uCmTypes, uDbRadTipoProc, uDbRadEtapaNovo, uDbRadEtapaDest;



Type
  TCtrlTransfBancaria = class(TCmControlObject)

  private

  protected

  public

    function ListaImagem(IDEmpresa: integer): OleVariant;
    function ListTransfContasBancarias (sPerIni, sPerFinal: String): OleVariant;

    constructor Create; override;
    destructor Destroy; override;


  published

  end;



implementation
{ TCtrlRadTipoProc }
{ TCtrlTransfBancaria }



constructor TCtrlTransfBancaria.Create;
begin
  inherited;
end;



destructor TCtrlTransfBancaria.Destroy;
begin
  inherited;
end;



function TCtrlTransfBancaria.ListaImagem(IDEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket('SELECT                     ' +
                          '  I.IMAGEM, P.RAZAOSOCIAL, ' +
                          '  P.NOME                   ' +
                          'FROM                       ' +
                          '  PESSOA P,                ' +
                          '  IMAGENS I                ' +
                          'WHERE                      ' +
                          '  P.IDIMAGEM = I.IDIMAGEM  ' +
                          ' AND P.IDPESSOA = '+ IntToStr(IDEmpresa));

end;



function TCtrlTransfBancaria.ListTransfContasBancarias(
  sPerIni, sPerFinal: String): OleVariant;
var
  sSql : String;
begin
  sSql :=
  'SELECT ' +
  '  M.CODLANCFINANC, '+
  '  M.DATALANCFINAN, '+
  '  M.HISTORICO, '+
  '  M.VALORLANCFINAN, '+
  '  DECODE ( RF.RECPAG, ''R'', RF.VALOR, ' +
  '  RF.VALOR * -1) AS VALOR,      ' +

  '  M.ENTRADASAIDA, '+
  '  P.NOME AS BANCO, '+
  '  PT.NOME AS PATRO, '+
  '  PP.NOME AS PLANO, '+
  '  AB.NUMAGENCIA AS AGENCIA, '+
  '  M.NUMCHQBORDERO AS NUMDOCUMENTO, '+
  '  PC.NOCONTACORR, '+
  '  T.DESCRICAO AS TIPORECEBDESEMB '+
  'FROM '+
  '  (SELECT PC.CODPORTADOR, COUNT(PCXP.CODPORTADOR) TOTREL      ' +
  '   FROM PORTADORCONTA PC, PORTCONTAXPLANO PCXP                ' +
  '   WHERE PC.CODPORTADOR = PCXP.CODPORTADOR(+)                 ' +
  '   GROUP BY PC.CODPORTADOR ) TOTREL,                          ' +
  '  MOVIMFINANC  M, '+
  '  RATEIOFINANC RF, '+
  '  PLANPREVCONTABIL PP, '+
  '  BANCO B, '+
  '  PESSOA P, '+
  '  PESSOA PT, '+
  '  PORTADORCONTA PC, ' +
  '  AGENCIABANCARIA AB, ' +
  '  TIPORECEBDESEMB T  ' +
  'WHERE '+
  ' ( M.CODLANCFINANC  = RF.CODLANCFINANC ) AND '+
  ' ( PP.IDPLANOPREV   = RF.IDPLANOPREV   ) AND '+
  ' ( B.IDPESSOA       = PC.IDBANCO       ) AND '+
  ' ( PC.CODPORTADOR   = M.CODPORTADOR    ) AND '+
  ' ( P.IDPESSOA       = B.IDPESSOA       ) AND '+
  ' ( PT.IDPESSOA      = RF.IDPATRO       ) AND '+
  ' ( AB.IDPESSOA      = PC.IDAGENCIA     ) AND '+
  ' ( RF.RECPAG        = T.RECPAG         ) AND '+
  ' ( RF.CODTIPRECDES  = T.CODTIPRECDES   ) AND '+
  ' ( M.CODPORTADOR    = TOTREL.CODPORTADOR ) AND                                ' +
  ' ( ( TOTREL.TOTREL <> 0 ) AND                                                 ' +
  '   ( RF.IDPLANOPREV NOT IN ( SELECT IDPLANOPREV                               ' +
  '                             FROM PORTCONTAXPLANO PCXP                        ' +
  '                             WHERE M.CODPORTADOR = PCXP.CODPORTADOR )) ) AND  ' +

  ' (M.DATALANCFINAN BETWEEN TO_DATE(' + QuotedStr(sPerIni)  + ',''DD/MM/YYYY'') AND  ' +
                            'TO_DATE(' + QuotedStr(sPerFinal)+ ',''DD/MM/YYYY'')) ' +

  'GROUP BY                                             '+
  '  M.CODLANCFINANC, M.DATALANCFINAN, M.HISTORICO,     '+
  '  M.VALORLANCFINAN, M.ENTRADASAIDA, P.NOME ,         '+
  '  PT.NOME, PP.NOME, B.NUMBANCO , M.NUMCHQBORDERO ,   '+
  '  PC.NOCONTACORR, AB.NUMAGENCIA, RF.VALOR, RF.RECPAG, T.DESCRICAO '+

  'ORDER BY ' +
  '   PC.NOCONTACORR, PP.NOME ' ;

  Result := GetDataPacket(sSql);
end;



end.
