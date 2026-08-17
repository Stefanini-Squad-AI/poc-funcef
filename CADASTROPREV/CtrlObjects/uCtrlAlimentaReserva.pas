unit uCtrlAlimentaReserva;

interface

Uses SysUtils, uCmControlObject, uCmDbObject,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uCmClientDataSet, uMidasUtil;

Type

  TCtrlAlimentaReserva = class(TCmControlObject)
  private

  protected

  public
     function BuscaReservaXPlano ( psIdPlano : String ) : OLEVariant;  
  
end;

implementation

{ TCtrlAlimentaReserva }


function TCtrlAlimentaReserva.BuscaReservaXPlano ( psIdPlano : String ) : OLEVariant;
Begin
   Result := GetDataPacket(' SELECT R.CODHIERARQUIA, R.ANALITICOSINTETI,   R.NOME,                                      '+
                           '        R.FLGCONTROLE,   R.IDTIPORESERVA,      R.INDICEREAJUSTE,                            '+
                           '        R.INDICECORRECAO,                                                                   '+
                           '        R.IDPLANOPREV,   R.FLGCOLETIVA,        R.FLGMODATUALIZACAO,                         '+
                           '        DECODE(R.FLGMODATUALIZACAO, 1, R.INDICECORRECAO, R.INDICEREAJUSTE) AS MOECODIGO,    '+       
                           '        DECODE(R.FLGMODATUALIZACAO, 1, MINDICE.MOESIGLA, MCOTAS.MOESIGLA) AS MOESIGLA,      '+
                           '        DECODE(R.FLGMODATUALIZACAO, 1, ''Reserva em Valor Monetário (Índice)'',             '+
                           '                                       ''Reserva em Cotas'') AS MODOATUALIZACAO             '+
                           ' FROM   RESERVAXPLANO R, MOEDA MCOTAS, MOEDA MINDICE                                        '+
                           ' WHERE  R.IDPLANOPREV = ' + piIdPlano                                                        +
                           ' AND    R.INDICEREAJUSTE = MCOTAS.MOECODIGO(+)                                              '+
                           ' AND    R.INDICECORRECAO = MINDICE.MOECODIGO(+)                                             ' );
End;






