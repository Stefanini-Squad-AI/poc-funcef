unit UModulo;

interface

uses dbTables, Forms, SysUtils, Dialogs, UDataBase,
     Wwquery, Graphics, Classes, uMensErro;

type TModulo = Class

   private

   public
      ObrigaCrespon, sOrcRea, sMascaraPlano, sMascaraGrupo, sMascaraCentRespon,
      sGeraMes, sIntegraContab, sTipoSaldo, sPermiteTransf, sPermiteSaldoNeg: String;
      iPlano,iPlanoOrc: LongInt;
      UnidNegoc  : LongInt;
      iHotel     : LongInt;
      bTipoOper  : Boolean;

   end;

var Modulo : TModulo;

implementation


end.









