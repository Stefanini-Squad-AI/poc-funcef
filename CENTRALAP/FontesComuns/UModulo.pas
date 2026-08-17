unit UModulo;

interface

uses Classes,UAutorizacao,dbTables,Forms,SysUtils,Dialogs, DB, Wwquery;

type TModulo = Class

   private

   public
      iUsuario  : longInt;
      ImpressoraDefault : string;
      ModeloImpressora  : longint;

      (* grupo de regras usado pelo Empréstimo *)
      iGrupoRegra       : Int64;

      (* Plano de Contas, Programa e Centro de Custo *)
      iPrograma         : Int64;
      iPlano            : Int64;
      sCentroCusto      : String;

      (* máscaras dos Tipos de Recebimento / Desembolso *)
      sMascaraReceb     : string;
      sMascaraDesemb    : string;

      (* uso de Centro de Responsabilidade e Unidade de Negócios + seus valores padrão *)
      bUsaCentRespon    : boolean;
      bUsaUnidNegoc     : boolean;

      sCentroRespon     : string;
      iUnidNegoc        : Int64;

      (* Moeda corrente dos sistemas *)
      iMoedaCorrente    : integer;
      sMoedaCorrente    : string;

      (* Tipos de Documento (TipoDocRecPag) a serem usados para integração *)
      iTipoDocRec       : Int64;
      iTipoDocRecDevol  : Int64;
      iTipoDocPag       : Int64;

      (* País, cidade, estado *)
      iPais             : Int64;
      sEstado           : String;
      iCidade           : Int64;

      (* dia do saldo devedor anterior *)
      (*    'A' = anterior *)
      (*    'C' = corrente *)
      sDiaSldDev        : String;

      function GravaLogTOTALPREV (psDescOperacao : string ) : boolean;

end;

function SegundosParaHMS(iSegundos: integer): string;

var Modulo : TModulo;

implementation

uses UDataBase, USistema, DBaseDados;

function TModulo.GravaLogTOTALPREV (psDescOperacao : string ) : boolean;
var iIdLogTotalPREV : longint;
begin
   Result := False;

   iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');
   if Trim(psDescOperacao) = '' then psDescOperacao := 'Não Identificada';
   with dtmBaseDados.qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' INSERT INTO LOGTOTALPREV (IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA) '+
             ' VALUES ('+IntToStr(iIdLogTotalPREV)+','+
                         IntToStr(Sistema.IdModulo)+','+
                         ''''+Copy(psDescOperacao,1,100)+''','+
                         IntToStr(Sistema.IdUsuario)+', '+
                         ' SYSDATE )');
     try
        ExecSQL;
     except
        Exit;
     end;
   end;
   Result := True;
end; // GravaLogTOTALPREV



function SegundosParaHMS(iSegundos: integer): string;
var
  fAux : real;
  i_Horas, i_Minutos, i_Segundos : integer;
  s : string;
begin
  fAux       := iSegundos / 3600;
  i_Horas    := trunc( fAux );
  fAux       := frac( fAux ) * 60;
  i_Minutos  := trunc( fAux );
  i_Segundos := round( frac( fAux ) * 60 );
  s := '';

  if i_Horas   > 0 then s := s + IntToStr( i_Horas   ) + 'h';

  if i_Minutos > 0 then
  begin
    if i_Horas > 0 then
      s := s + FormatFloat( '00', i_Minutos ) + 'm'
    else
      s := s + IntToStr( i_Minutos ) + 'm';
    Result := s + FormatFloat( '00', i_Segundos ) + 's';
  end
  else
    Result := s + IntToStr( i_Segundos ) + 's';

end;


end.
