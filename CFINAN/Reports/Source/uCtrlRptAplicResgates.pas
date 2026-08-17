unit uCtrlRptAplicResgates;

interface

Uses
  SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, DB,
  uCmTypes,  uSistema;

type
  TCtrlRptAplicResgates = class(TCmControlObject)

  private


  public

    function Logo(IdEmpresa: Integer) : OleVariant;
    function RelAplicacaoResgate( idBanco, idAgencia, idCodPortador, idHistorico : Integer; PerIni, Perfim: String ) : OleVariant;
    function DescHistorico(idHistorico: integer) : OleVariant;
    function descPortForma(idPortForma: integer) : OleVariant;

  end;




implementation
{ TCtrlRptAplicResgates }




function TCtrlRptAplicResgates.RelAplicacaoResgate(idBanco, idAgencia,
  idCodPortador, idHistorico: Integer; PerIni, Perfim : String): OleVariant;
var
sSQL: String;
begin
  sSQL :=
  'SELECT                                                                                  ' +
  '   M.DATALANCFINAN, M.CODLANCFINANC, M.CODPORTADOR, M.NUMCHQBORDERO,                    ' +
  '   RF.VALOR, M.DATALANCFINAN, PC.DESCRICAO AS DESCPORTADOR,                             ' +
  '   M.HISTORICO, PC.NOCONTACORR, HF.DESCRICAO AS DESCHISTORICO,                          ' +
  '   (B.NUMBANCO || '' - '' || P.NOME) AS BANCO, AB.NUMAGENCIA,                           ' +
  '   PL.NOME PLANO, PPT.NOME PATRO                                                        ' +
  'FROM                                                                                    ' +
  '   MOVIMFINANC M, PORTADORCONTA PC, BANCO B, PESSOA P,                                  ' +
  '   PESSOA PPT, RATEIOFINANC RF, HISTORICOFINAN HF,                                       ' +
  '   AGENCIABANCARIA AB, PLANPREVCONTABIL PL, PATRO PT                                    ' +
  'WHERE                                                                                   ' ;

  if PerIni <> '' then sSQL := sSQL +
  '  (M.DATALANCFINAN >= ' + QuotedStr(PerIni) + ' ) AND                        ' ;
  if Perfim <> '' then sSQL := sSQL +
  '  (M.DATALANCFINAN <= ' + QuotedStr(PerFim) + ' ) AND                        ' ;

  sSQL := sSQL +

  '  (M.IDPESSOA      = ' + IntToStr(sistema.idEmpresa) + ' ) AND                                  ' +
  '  (M.CODPORTADOR   = PC.CODPORTADOR) AND                                                ' +
  '  (PC.IDBANCO      = B.IDPESSOA) AND                                                    ' +
  '  (B.IDPESSOA      = P.IDPESSOA) AND                                                    ' +
  '  (PC.IDAGENCIA    = AB.IDPESSOA) AND                                                   ' +
  '  (M.CODLANCFINANC = RF.CODLANCFINANC ) AND                                             ' +
  '  (RF.IDPLANOPREV  = PL.IDPLANOPREV ) AND                                               ' +
  '  (RF.IDPATRO      = PT.IDPESSOA ) AND                                                  ' +
  '  (M.HISTPADFINAN  = HF.HISTPADFINAN ) AND                                              ' +
  '  (PT.IDPESSOA     = PPT.IDPESSOA )                                                     ' ;

  If idBanco <> 0 then
  sSQL := sSQL + '  AND (PC.IDBANCO = ' + IntToStr(idBanco) + ' ) ' ;

  If idAgencia <> 0 then
  sSQL := sSQL + '  AND (PC.IDAGENCIA = ' + IntToStr(idAgencia) + ' ) ' ;

  if idCodPortador <> 0 then
  sSQL := sSQL + '  AND (PC.CODPORTADOR = ' + IntToStr(idCodPortador) + ' ) ' ;

  if idHistorico <> 0 then
  sSQL := sSQL + '  AND (M.HISTPADFINAN = ' + IntToStr(idHistorico) + ' ) ' ;

  sSQL := sSQL +
  ' ORDER BY                                                             ' +
  ' M.DATALANCFINAN, M.CODLANCFINANC                                     ' ;


  Result := GetDataPacket(sSQL);
end;



function TCtrlRptAplicResgates.Logo(IdEmpresa: Integer): OleVariant;
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



function TCtrlRptAplicResgates.DescHistorico(idHistorico: integer): OleVariant;
begin
  Result := GetDataPacket(' SELECT                ' +
                          '    DESCRICAO          ' +
                          ' FROM                  ' +
                          '    HISTORICOFINAN     ' +
                          ' WHERE                 ' +
                          '    HISTPADFINAN = ' + IntToStr(idHistorico) );
end;



function TCtrlRptAplicResgates.descPortForma(idPortForma: integer): OleVariant;
begin
  Result := GetDataPacket(' SELECT                ' +
                          '    DESCRICAO          ' +
                          ' FROM                  ' +
                          '    PORTADORCONTA      ' +
                          ' WHERE                 ' +
                          '    CODPORTADOR = ' + IntToStr(idPortForma) );
end;



end.
