// Alterações:
{--------------------------------------------------------------------------------------------------

Rotina......: LookupMoeda, RecuperaVariacaoIndice, DadosMoeda, CotacoesPeriodo
Nº SIG......: 116924
Data........: 09/05/2022
Responsável.: Luis Ferrari
Descrição...: o cálculo da rentabilidade contempla 12 meses, sendo o correto 13 últimos meses
-----------------------------------------------------------------------------------------------------
}
unit uCtrlVariacaoIndice;

interface

Uses SysUtils, uCmControlObject, uCmClientDataSet, uCmTypes, uDiasUteis,
     JCLSysUtils, Math;

Type
  TCtrlVariacaoIndice = class(TCmControlObject)
  private

  protected

  public

    function LookupMoeda : OleVariant;

    function RecuperaVariacaoIndice( sMoeCodigo : string; dDataInicial, dDataFinal : TDateTime ) : OLEVariant;

    function ImagemPessoa( iIdPessoa : integer ) : OleVariant;

    //Funções que também existem na CtrlMoeda
    function CalculaFatorCorrecao( sMoeCodigo : string; dDataIni, dDataFim: TDateTime; bPodeNegativo: boolean ) : double;
    function DadosMoeda( sMoeCodigo : string ) : OleVariant;
    function CotacoesPeriodo( sMoeCodigo : string; dDataInicial, dDataFinal : TDateTime ) : OLEVariant;
    function BuscaCotacao( sMoeCodigo : string; dDataCotacao : TDateTime; bDataExata: boolean ) : extended;

  published

end;


implementation

{ TCtrlVariacaoIndice }

function TCtrlVariacaoIndice.LookupMoeda: OleVariant;
begin
  Result := GetDataPacket( ' SELECT ' +
                           '     M.MOECODIGO, M.MOEDESC, M.MOESIGLA, ' +
                           '     M.MOEPERIODICIDADE, M.MOEINATIVO, ' +
                           '     M.FLGPERCVALOR, M.DATAINICIO, M.DATAFIM, M.MESESFATOR ' +    // SIG 116924 Ferrari Inclusao MESESFATOR
                           '  FROM ' +
                           '     MOEDA M ' +
                           '  ORDER BY ' +
                           '     M.MOESIGLA ' );

end;

function TCtrlVariacaoIndice.RecuperaVariacaoIndice( sMoeCodigo: string; dDataInicial, dDataFinal : TDateTime ) : OLEVariant;
var
  DiasUteis : TDiasUteis;
  cdsLocal : TCMClientDataSet;
  dDataIniDoze, dDataFimDoze, dIniMes, dFimMes : TDateTime;
  fFatorDoze, fValorAnt, fAcumulado : double;
  iDiasMes, iDiasCalculo : integer;
begin

  cdsLocal := TCMClientDataSet.Create( nil );
  DiasUteis := TDiasUteis.Create;
  try

    cdsLocal.Data := CotacoesPeriodo( sMoeCodigo, dDataInicial, dDataFinal );

    fAcumulado := 1;
    fValorAnt  := 0;

    cdsLocal.First;
    while not cdsLocal.Eof do
    begin
      cdsLocal.Edit;

      // dDataIniDoze := IncMonth( cdsLocal.FieldByName('COTDATA').AsDateTime, -11 );    
      dDataIniDoze := IncMonth( cdsLocal.FieldByName('COTDATA').AsDateTime, -(cdsLocal.FieldByName('MESESFATOR').AsInteger - 1) );    // SIG 116924 Ferrari Aqui vai alterar para campo da tabela
      dDataFimDoze := cdsLocal.FieldByName('COTDATA').AsDateTime;

      fFatorDoze   := CalculaFatorCorrecao( sMoeCodigo, dDataIniDoze, dDataFimDoze, True);

      cdsLocal.FieldByName('DOZEMESES').AsFloat := ( fFatorDoze - 1 ) * 100 ;

      if cdsLocal.FieldByName('MOEPERIODICIDADE').AsString = 'D' then
      begin
        iDiasMes     := 1;
        iDiasCalculo := 1;
      end
      else
      begin
        if ( cdsLocal.FieldByName('ANO').AsString + cdsLocal.FieldByName('MES').AsString ) = FormatDateTime( 'yyyymm', dDataInicial ) then
          dIniMes := EncodeDate( cdsLocal.FieldByName('ANO').AsInteger, cdsLocal.FieldByName('MES').AsInteger, DiasUteis.ExtraiDia( dDataInicial ) )
        else
          dIniMes := EncodeDate( cdsLocal.FieldByName('ANO').AsInteger, cdsLocal.FieldByName('MES').AsInteger, 1 );

        if ( cdsLocal.FieldByName('ANO').AsString + cdsLocal.FieldByName('MES').AsString ) = FormatDateTime( 'yyyymm', dDataFinal ) then
          dFimMes := EncodeDate( cdsLocal.FieldByName('ANO').AsInteger, cdsLocal.FieldByName('MES').AsInteger, DiasUteis.ExtraiDia( dDataFinal ) )
        else
          dFimMes := EncodeDate( cdsLocal.FieldByName('ANO').AsInteger, cdsLocal.FieldByName('MES').AsInteger,
           DiasUteis.ExtraiDia( DiasUteis.UltDiaMes( cdsLocal.FieldByName('ANO').AsInteger, cdsLocal.FieldByName('MES').AsInteger ) ) );

        iDiasMes := DiasUteis.ExtraiDia( DiasUteis.UltDiaMes( DiasUteis.ExtraiAno( dIniMes ), DiasUteis.ExtraiMes( dIniMes ) ) );
        iDiasCalculo := DiasUteis.IntervaloDias( dIniMes, dFimMes ) + 1;
      end;

      if cdsLocal.FieldByName('FLGPERCVALOR').AsString = 'P' then  //Indicador percentual
        cdsLocal.FieldByName('ACUMULADO').AsFloat := fAcumulado * ( Power( 1 + ( cdsLocal.FieldByName('COTVALOR').AsFloat / 100 ), ( iDiasCalculo / iDiasMes ) ) )
      else
      begin                                                        //Indicador valor
        if cdsLocal.RecNo = 1 then
          cdsLocal.FieldByName('ACUMULADO').AsFloat := 1
        else
          cdsLocal.FieldByName('ACUMULADO').AsFloat := fAcumulado * ( Power( ( cdsLocal.FieldByName('COTVALOR').AsFloat / fValorAnt ), ( iDiasCalculo / iDiasMes ) ) );
      end;

      cdsLocal.Post;

      fAcumulado := cdsLocal.FieldByName('ACUMULADO').AsFloat;
      fValorAnt  := cdsLocal.FieldByName('COTVALOR').AsFloat;

      cdsLocal.Next;
    end;

    Result := cdsLocal.Data;

  finally
    cdsLocal.Free;
    DiasUteis.Free;
  end;

end;


function TCtrlVariacaoIndice.CalculaFatorCorrecao( sMoeCodigo : string; dDataIni, dDataFim: TDateTime; bPodeNegativo : boolean) : double;
var
  cdsMoeda, cdsCotacoesPeriodo : TCmClientDataset;
  sTipoCotacao, sPeriodicidade : string;
  fCotacaoIni, fCotacaoFim, fFatorCorrecao : extended;
begin
  cdsMoeda           := TCmClientDataset.Create( nil );
  cdsCotacoesPeriodo := TCmClientDataset.Create( nil );
  try

    fFatorCorrecao := 1;

    //--- Primeiro verifica a periodicidade e tipo da cotação
    cdsMoeda.Data := DadosMoeda( sMoeCodigo );

    //Se não se encontrar a moeda ou se as flags forem nulas, sai com Resultado 1
    if ( ( cdsMoeda.IsEmpty ) or ( cdsMoeda.FieldByName('FLGPERCVALOR').IsNull ) or ( cdsMoeda.FieldByName('MOEPERIODICIDADE').IsNull ) ) then
    begin
      Result := 1;
      exit;
    end;

    sTipoCotacao      := cdsMoeda.FieldByName('FLGPERCVALOR').asString;
    sPeriodicidade    := cdsMoeda.FieldByName('MOEPERIODICIDADE').asString;

    //---

    case sTipoCotacao[1] of

      'P': //Percentual
      begin
        cdsCotacoesPeriodo.Data := CotacoesPeriodo( sMoeCodigo, dDataIni, dDataFim );
        cdsCotacoesPeriodo.First;
        while not( cdsCotacoesPeriodo.Eof )do
        begin
          fCotacaoFim := cdsCotacoesPeriodo.FieldByName('COTVALOR').asFloat;
          // Calcula Fator acumulado - SEM PRO-RATA: ( demais utilizar uComunsImobiliario.FatorCorrecao )
          fFatorCorrecao := fFatorCorrecao * ( 1 + ( fCotacaoFim / 100 ) );
          cdsCotacoesPeriodo.Next;
        end;
      end;


      'V': //Valor
      begin
        fCotacaoIni    := BuscaCotacao( sMoeCodigo, dDataIni, False );
        fCotacaoFim    := BuscaCotacao( sMoeCodigo, dDataFim, False );
        fFatorCorrecao := fCotacaoFim / fCotacaoIni;
      end;

    end;

    //Verifica se o fator pode ser negativo. Caso não possa, zera a correção
    if not( bPodeNegativo ) then
      if fFatorCorrecao < 1 then
        fFatorCorrecao := 1;

    Result := fFatorCorrecao;

  finally
    cdsMoeda.Free;
    cdsCotacoesPeriodo.Free;
  end;

end;

function TCtrlVariacaoIndice.DadosMoeda( sMoeCodigo : string ) : OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT ' +
   '     M.MOECODIGO, M.MOEDESC, M.MOESIGLA, ' +
   '     M.MOEPERIODICIDADE, M.MOEINATIVO, ' +
   '     M.FLGPERCVALOR, M.DATAINICIO, M.DATAFIM, MESESFATOR ' +     // SIG 116924 Ferrari Inclusao MESESFATOR
   '  FROM ' +
   '     MOEDA M ' +
   '  WHERE ' +
   '     M.MOECODIGO = ' + QuotedStr( sMoeCodigo ) );
end;

function TCtrlVariacaoIndice.CotacoesPeriodo( sMoeCodigo: string; dDataInicial, dDataFinal: TDateTime ): OLEVariant;
var
  cdsLocal : TCMClientDataSet;
  sSQL : string;
begin

  cdsLocal := TCMClientDataSet.Create( nil );
  try

    sSQL :=
     ' SELECT ' +
     '    M.MOECODIGO, C.COTVALOR, C.COTMESREF, ' +
     '    M.MOEDESC, M.MOESIGLA, C.COTDATA, ' +
     '    M.FLGPERCVALOR, M.MOEPERIODICIDADE, ' +
     '    C.NUMDIASPRAZO, ' +
     '    SUBSTR(C.COTMESREF, 1, 2) AS MES, ' +
     '    SUBSTR(C.COTMESREF, 3, 4) AS ANO, ' +
     '    0 AS ACUMULADO, ' +
     '    0 AS DOZEMESES, M.MESESFATOR ' +          // SIG 116924 Ferrari
     ' FROM ' +
     '    COTACAOMOEDA C, MOEDA M ' +
     ' WHERE ' +
     '     ( C.MOECODIGO = ' + QuotedStr( sMoeCodigo ) + ' ) ' +
     ' AND ( C.MOECODIGO = M.MOECODIGO ) ' ;

    cdsLocal.Data := GetDataPacket(
     ' select MOEPERIODICIDADE from MOEDA where MOECODIGO = ' + QuotedStr( sMoeCodigo ) );

    if trim( cdsLocal.FieldByName('MOEPERIODICIDADE').AsString ) = 'D' then
      sSQL := sSQL +
       ' AND ( C.COTDATA >= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataInicial ) ) + ' ) ' +
       ' AND ( C.COTDATA <= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataFinal   ) ) + ' ) ' +
       ' ORDER BY 8, 11, 10 '
    else
      sSQL := sSQL +
       ' AND ( ( SUBSTR(C.COTMESREF, 3, 4 ) || SUBSTR( C.COTMESREF, 1, 2 ) ) >= ' + QuotedStr( FormatDateTime( 'yyyymm', dDataInicial ) ) + ' ) ' +
       ' AND ( ( SUBSTR(C.COTMESREF, 3, 4 ) || SUBSTR( C.COTMESREF, 1, 2 ) ) <= ' + QuotedStr( FormatDateTime( 'yyyymm', dDataFinal   ) ) + ' ) ' +
       ' ORDER BY 11, 10, 8 ';

    cdsLocal.Close;
    cdsLocal.Data := GetDataPacket( sSQL );

    Result := cdsLocal.Data;

  finally
    cdsLocal.Free;
  end;

end;

function TCtrlVariacaoIndice.BuscaCotacao(sMoeCodigo: string; dDataCotacao: TDateTime; bDataExata: boolean): extended;
var
  cdsLocal : TCmClientDataset;
begin
  cdsLocal := TCmClientDataset.Create( nil );
  try

    cdsLocal.Data := GetDataPacket(
     ' SELECT M.MOECODIGO, C.COTVALOR, C.COTDATA, M.MOEDESC, M.MOESIGLA ' +
     ' FROM COTACAOMOEDA C, MOEDA M ' +
     ' WHERE ( C.MOECODIGO = ' + QuotedStr( sMoeCodigo ) + ' ) ' +
     '   AND ( C.COTDATA ' + Iff( bDataExata, '= ', '<= ' ) + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCotacao ) ) + ' ) ' +
     '   AND ( C.MOECODIGO = M.MOECODIGO ) ' +
     ' ORDER BY C.COTDATA DESC ' );

    cdsLocal.First;

    //Retorna -1 se não houver cotação
    if cdsLocal.IsEmpty then
      Result := -1
    else
      Result := cdsLocal.FieldByName('COTVALOR').AsFloat;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlVariacaoIndice.ImagemPessoa( iIdPessoa : integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT I.IMAGEM                ' +
   ' FROM   PESSOA  P,              ' +
   '        IMAGENS I               ' +
   ' WHERE  P.IDIMAGEM = I.IDIMAGEM ' +
   '   AND  P.IDPESSOA = ' + IntToStr( iIdPessoa ) );
end;

end.
