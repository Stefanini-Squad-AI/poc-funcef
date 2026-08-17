unit UModulo;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, ComCtrls, ExtCtrls, MAHlpBtn, Buttons,
  ToolWin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery,
  Wwdatsrc, DBCtrls;

type TModulo = Class
   private
     FExemplo : string;
   public
   sMascaraPlano,sIntegraContab: String;
   iPlano     : Integer;
   iUsuario   : Integer;
   UnidNegoc  : Integer;
   clCorCab,clCorMestre: String;
   sMascaraDesemb, sEstorna, ObrigaCrespon, ObrigaAbc :String;
   bTipoOper:Boolean;
   property Exemplo : string read FExemplo write FExemplo;
end;

var Modulo : TModulo;

implementation

end.
 
