{ --------------------------------------------------------------------------------------------------
Rotina    : uObjetoVerba.pas
Data      : 02/04/2003
Autor     : Marchetti
Descrição : Criação desta unit visando o tratamento através de encapsulamento de processos
            de manutenção de verbas
---------------------------------------------------------------------------------------------------}

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Descrição : 
---------------------------------------------------------------------------------------------------}

unit uObjetoVerba;

interface

uses
   Windows, Messages, SysUtils, Classes, Dialogs, Db, DBTables, Wwquery, UDataBase,
   uFuncoesEmptmo;

type
  TObjetoVerba = class(TObject)
  private

      function RefazDotacaoTipoContrato(iIDPlanoPrev,
                                        iIDTipoContrEmptmo : Int64;
                                        fValoraRatear      : Currency;
                                        bZeraValor         : Boolean) : Integer;

      function RefazDotacaoUnidadeCentral(iIDPlanoPrev,
                                          iIDTipoContrEmptmo,
                                          iIDUnidCentr  : Int64;
                                          fValoraRatear : Currency;
                                          bZeraValor    : Boolean) : Integer;

      function UtilizaValorTipoContrato(iIDPlanoPrev,
                                        iIDTipoContrEmptmo : Int64;
                                        fValoraUtilizar    : Currency) : Integer;

  public

      function RefazDistribuicao(iIDPlanoPrev  : Int64;
                                 fValoraRatear : Currency;
                                 bZeraValor    : Boolean) : Integer;

      function RefazVerbaTipoContrato(iIDPlanoPrev,
                                      iIDTipoContrEmptmo : Int64;
                                      fValoraRatear      : Currency;
                                      bZeraValor         : Boolean) : Integer;

      function RefazVerbaUnidade(iIDPlanoPrev,
                                 iIDTipoContrEmptmo,
                                 iIDUnidCentr  : Int64;
                                 fValoraRatear : Currency;
                                 bZeraValor    : Boolean) : Integer;

      function UtilizaValorUnidade(iIDPlanoPrev,
                                   iIDTipoContrEmptmo,
                                   iIDUnidCentr    : Int64;
                                   fValoraUtilizar : Currency) : Integer;

      function RetornaValorDisponivel(iIDPlanoPrev,
                                      iIDTipoContrEmptmo : Int64;
                                      sCodEstado : String) : Currency;

      function TotalizaPercentualUnidade(iIDPlanoPrev,
                                         iIDTipoContrEmptmo,
                                         iIDUnidCentr : Int64) : Real;

      function TotalizaPercentualTipoContr(iIDPlanoPrev,
                                           iIDTipoContrEmptmo : Int64) : Real;

      function RetornaUnidadeParticipante(sCodEstado : String) : Int64;
  end;

implementation

{ TObjetoVerba }


function TObjetoVerba.RefazDistribuicao(iIDPlanoPrev : Int64; fValoraRatear : Currency; bZeraValor : Boolean) : Integer;
var
   qryAux : TwwQuery;
   sSql   : String;
   fValor : Currency;
begin
   Result := 0;

   qryAux              := TwwQuery.Create(Nil);
   qryAux.DatabaseName := 'BaseDados';

   try
      sSql := 'SELECT '                                                          + #13 +
              '  IDTIPOCONTREMPTMO, PERCENTUAL, VALORRATEADO, VALORUTILIZADO '   + #13 +
              'FROM EPPLANTIPCONT '                                              + #13 +
              'WHERE IDPLANOPREV = ' + IntToStr(iIDPlanoPrev)                    + #13;

      qryAux.Sql.Text := sSql;
      qryAux.Open;
      while not qryAux.Eof do begin

         fValor := fValoraRatear * (qryAux.FieldByName('PERCENTUAL').AsFloat / 100);
         Result := RefazDotacaoTipoContrato(iIDPlanoPrev,
                                            qryAux.FieldByName('IDTIPOCONTREMPTMO').AsInteger,
                                            fValor,
                                            bZeraValor);
         qryAux.Next;
      end;

   finally
      qryAux.Close;
      qryAux.Free;
   end;

end;



function TObjetoVerba.RefazDotacaoTipoContrato(iIDPlanoPrev, iIDTipoContrEmptmo : Int64;
                                               fValoraRatear : Currency;
                                               bZeraValor : Boolean) : Integer;
var
   qrySelect, qryUpdate   : TwwQuery;
   sSqlUpdate, sSqlSelect : String;
   fValor : Currency;
begin
   Result := 0;
   qrySelect := TwwQuery.Create(Nil);
   qryUpdate := TwwQuery.Create(Nil);

   try

     qrySelect.DatabaseName := 'BaseDados';
     qryUpdate.DatabaseName := 'BaseDados';

     sSqlUpdate := 'UPDATE EPPLANTIPCONT '                                       + #13 +
                   'SET '                                                        + #13;

     if   bZeraValor then sSqlUpdate := sSqlUpdate + '   VALORRATEADO = ' + NumeroIngles(fValoraRatear)                + #13
     else                 sSqlUpdate := sSqlUpdate + '   VALORRATEADO = VALORRATEADO + ' + NumeroIngles(fValoraRatear) + #13;

     if bZeraValor then sSqlUpdate := sSqlUpdate + ', VALORUTILIZADO = 0 '       + #13;

     sSqlUpdate := sSqlUpdate +
                   'WHERE '                                                      + #13 +
                   '    IDPLANOPREV       = ' + IntToStr(iIDPlanoPrev)           + #13 +
                   'AND IDTIPOCONTREMPTMO = ' + IntToStr(iIDTipoContrEmptmo)     + #13;

     qryUpdate.Sql.Text := sSqlUpdate;
     qryUpdate.ExecSql;

     sSqlSelect := 'SELECT '                                                     + #13 +
                   '   IDUNIDCENTR, PERCENTUAL, VALORRATEADO '                   + #13 +
                   'FROM '                                                       + #13 +
                   '   EPUNDPLANTIPCONT '                                        + #13 +
                   'WHERE '                                                      + #13 +
                   '    IDPLANOPREV       = ' + IntToStr(iIDPlanoPrev)           + #13 +
                   'AND IDTIPOCONTREMPTMO = ' + IntToStr(iIDTipoContrEmptmo)     + #13;
     qrySelect.Sql.Text := sSqlSelect;
     qrySelect.Open;
     while not qrySelect.Eof do begin
         fValor := fValoraRatear * (qrySelect.FieldByName('PERCENTUAL').AsFloat / 100);
         Result := RefazDotacaoUnidadeCentral(iIDPlanoPrev,
                                              iIDTipoContrEmptmo,
                                              qrySelect.FieldByName('IDUNIDCENTR').AsInteger,
                                              fValor,
                                              bZeraValor);
         qrySelect.Next;
     end;
   finally
     qrySelect.Close;
     qrySelect.Free;
     qryUpdate.Free;
   end;

end;



function TObjetoVerba.RefazDotacaoUnidadeCentral(iIDPlanoPrev, iIDTipoContrEmptmo, iIDUnidCentr : Int64;
                                                 fValoraRatear : Currency;
                                                 bZeraValor : Boolean) : Integer;
var
    qryAux     : TwwQuery;
    sSqlUpdate : String;
begin
   Result := 0;

   qryAux              := TwwQuery.Create(Nil);
   qryAux.DatabaseName := 'BaseDados';

   try
     sSqlUpdate := 'UPDATE EPUNDPLANTIPCONT '                                    + #13 +
                   'SET '                                                        + #13;

     if   bZeraValor then sSqlUpdate := sSqlUpdate + '   VALORRATEADO = ' + NumeroIngles(fValoraRatear)                + #13
     else                 sSqlUpdate := sSqlUpdate + '   VALORRATEADO = VALORRATEADO + ' + NumeroIngles(fValoraRatear) + #13;


     if bZeraValor then sSqlUpdate := sSqlUpdate + ', VALORUTILIZADO = 0 '       + #13;

     sSqlUpdate := sSqlUpdate +
                   'WHERE '                                                      + #13 +
                   '    IDPLANOPREV       = ' + IntToStr(iIDPlanoPrev)           + #13 +
                   'AND IDTIPOCONTREMPTMO = ' + IntToStr(iIDTipoContrEmptmo)     + #13 +
                   'AND IDUNIDCENTR       = ' + IntToStr(iIDUnidCentr)           + #13;

     qryAux.Sql.Text := sSqlUpdate;
     qryAux.ExecSql;
   finally
      qryAux.Free;
   end;

end;



function TObjetoVerba.RefazVerbaTipoContrato(iIDPlanoPrev, iIDTipoContrEmptmo: Int64; fValoraRatear: Currency;
                                             bZeraValor: Boolean): Integer;
begin
   Result := RefazDotacaoTipoContrato(iIDPlanoPrev,
                                      iIDTipoContrEmptmo,
                                      fValoraRatear,
                                      bZeraValor);
end;



function TObjetoVerba.RefazVerbaUnidade(iIDPlanoPrev, iIDTipoContrEmptmo, iIDUnidCentr: Int64; fValoraRatear: Currency;
                                        bZeraValor: Boolean): Integer;
begin
   Result := RefazDotacaoUnidadeCentral(iIDPlanoPrev,
                                        iIDTipoContrEmptmo,
                                        iIDUnidCentr,
                                        fValoraRatear,
                                        bZeraValor);
end;



function TObjetoVerba.UtilizaValorUnidade(iIDPlanoPrev, iIDTipoContrEmptmo, iIDUnidCentr: Int64; fValoraUtilizar: Currency): Integer;
var
    qryAux     : TwwQuery;
    sSqlUpdate : String;
begin
   Result := 0;

   qryAux              := TwwQuery.Create(Nil);
   qryAux.DatabaseName := 'BaseDados';

   try
     sSqlUpdate := 'UPDATE EPUNDPLANTIPCONT '                                              + #13 +
                   'SET '                                                                  + #13 +
                   '   VALORUTILIZADO = VALORUTILIZADO + ' + NumeroIngles(fValoraUtilizar) + #13 +
                   'WHERE '                                                                + #13 +
                   '    IDPLANOPREV       = ' + IntToStr(iIDPlanoPrev)                     + #13 +
                   'AND IDTIPOCONTREMPTMO = ' + IntToStr(iIDTipoContrEmptmo)               + #13 +
                   'AND IDUNIDCENTR       = ' + IntToStr(iIDUnidCentr)                     + #13;

     qryAux.Sql.Text := sSqlUpdate;
     qryAux.ExecSql;

     UtilizaValorTipoContrato(iIDPlanoPrev,iIDTipoContrEmptmo,fValoraUtilizar);
   finally
      qryAux.Free;
   end;

end;



function TObjetoVerba.UtilizaValorTipoContrato(iIDPlanoPrev,iIDTipoContrEmptmo: Int64; fValoraUtilizar: Currency): Integer;
var
    qryAux     : TwwQuery;
    sSqlUpdate : String;
begin
   Result := 0;

   qryAux              := TwwQuery.Create(Nil);
   qryAux.DatabaseName := 'BaseDados';

   try
     sSqlUpdate := 'UPDATE EPPLANTIPCONT '                                              + #13 +
                   'SET '                                                               + #13 +
                   '   VALORUTILIZADO = VALORUTILIZADO + ' + NumeroIngles(fValoraUtilizar) + #13 +
                   'WHERE '                                                             + #13 +
                   '    IDPLANOPREV       = ' + IntToStr(iIDPlanoPrev)                  + #13 +
                   'AND IDTIPOCONTREMPTMO = ' + IntToStr(iIDTipoContrEmptmo)            + #13;

     qryAux.Sql.Text := sSqlUpdate;
     qryAux.ExecSql;

   finally
      qryAux.Free;
   end;

end;



function TObjetoVerba.RetornaValorDisponivel(iIDPlanoPrev, iIDTipoContrEmptmo: Int64; sCodEstado : String): Currency;
var
    qryAux     : TwwQuery;
    sSqlSelect : String;
begin
   Result := 0;

   qryAux              := TwwQuery.Create(Nil);
   qryAux.DatabaseName := 'BaseDados';

   try
     sSqlSelect := 'SELECT '                                                               + #13 +
                   '   NVL(UPTC.VALORRATEADO - UPTC.VALORUTILIZADO,0) AS VALORDISPONIVEL ' + #13 +
                   'FROM '                                                                 + #13 +
                   '   EPUNDPLANTIPCONT UPTC, '                                            + #13 +
                   '   EPUNDCENTRUF UCU '                                                  + #13 +
                   'WHERE '                                                                + #13 +
                   '    UPTC.IDPLANOPREV       = ' + IntToStr(iIDPlanoPrev)                + #13 +
                   'AND UPTC.IDTIPOCONTREMPTMO = ' + IntToStr(iIDTipoContrEmptmo)          + #13 +
                   'AND UCU.CODESTADO          = ' + QuotedStr(sCodEstado)                 + #13 +
                   'AND UPTC.IDUNIDCENTR       = UCU.IDUNIDCENTR '                         + #13;

     qryAux.Sql.Text := sSqlSelect;
     qryAux.Open;

     if   qryAux.IsEmpty then Result := 0
     else Result := qryAux.FieldByName('VALORDISPONIVEL').AsCurrency;

   finally
     qryAux.Close;
     qryAux.Free;
   end;

end;



function TObjetoVerba.TotalizaPercentualUnidade(iIDPlanoPrev, iIDTipoContrEmptmo, iIDUnidCentr : Int64) : Real;
var
    qryAux     : TwwQuery;
    sSqlSelect : String;
begin
   Result := 0;

   qryAux              := TwwQuery.Create(Nil);
   qryAux.DatabaseName := 'BaseDados';

   try
     sSqlSelect := 'SELECT '                                                     + #13 +
                   '   SUM(PERCENTUAL) AS TOTALPERCENTUAL '                      + #13 +
                   'FROM '                                                       + #13 +
                   '   EPUNDPLANTIPCONT '                                        + #13 +
                   'WHERE '                                                      + #13 +
                   '    IDPLANOPREV       = ' + IntToStr(iIDPlanoPrev)           + #13 +
                   'AND IDTIPOCONTREMPTMO = ' + IntToStr(iIDTipoContrEmptmo)     + #13 +
                   'AND IDUNIDCENTR       = ' + IntToStr(iIDUnidCentr)           + #13;

     qryAux.Sql.Text := sSqlSelect;
     qryAux.Open;

     Result := qryAux.FieldByName('TOTALPERCENTUAL').AsFloat;
   finally
     qryAux.Close;
     qryAux.Free;
   end;
end;



function TObjetoVerba.TotalizaPercentualTipoContr(iIDPlanoPrev, iIDTipoContrEmptmo: Int64): Real;
var
    qryAux     : TwwQuery;
    sSqlSelect : String;
begin
   Result := 0;

   qryAux              := TwwQuery.Create(Nil);
   qryAux.DatabaseName := 'BaseDados';

   try
     sSqlSelect := 'SELECT '                                                     + #13 +
                   '   SUM(PERCENTUAL) AS TOTALPERCENTUAL '                      + #13 +
                   'FROM '                                                       + #13 +
                   '   EPPLANTIPCONT '                                           + #13 +
                   'WHERE '                                                      + #13 +
                   '    IDPLANOPREV       = ' + IntToStr(iIDPlanoPrev)           + #13 +
                   'AND IDTIPOCONTREMPTMO = ' + IntToStr(iIDTipoContrEmptmo)     + #13;

     qryAux.Sql.Text := sSqlSelect;
     qryAux.Open;

     Result := qryAux.FieldByName('TOTALPERCENTUAL').AsFloat;
   finally
     qryAux.Close;
     qryAux.Free;
   end;
end;



function TObjetoVerba.RetornaUnidadeParticipante(sCodEstado: String): Int64;
var
    qryAux     : TwwQuery;
    sSqlSelect : String;
begin
   Result := 0;

   qryAux              := TwwQuery.Create(Nil);
   qryAux.DatabaseName := 'BaseDados';

   try
     sSqlSelect := 'SELECT '                                                     + #13 +
                   '   IDUNIDCENTR '                                             + #13 +
                   'FROM '                                                       + #13 +
                   '   EPUNDCENTRUF '                                            + #13 +
                   'WHERE '                                                      + #13 +
                   '    CODESTADO = ' + QuotedStr(sCodEstado)                    + #13;

     qryAux.Sql.Text := sSqlSelect;
     qryAux.Open;

     Result := qryAux.FieldByName('IDUNIDCENTR').AsInteger;
   finally
     qryAux.Close;
     qryAux.Free;
   end;
end;



end.
