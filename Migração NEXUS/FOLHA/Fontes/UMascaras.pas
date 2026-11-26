unit UMascaras;

interface

const maxNiveis = 10;

type
   TNivel = record
               TamNivel : integer;
               TamAcum  : integer;
            end;
var
   vetNiveis : array[1..maxNiveis] of TNivel;

   { Rotina que recebe um codigo e retorna seu respectivo pai  na
     hierarquia de codigos, ou '' se o codigo passado for do primeiro
     nivel }
   function Pai(sTabArvore,       // Ex. : TIPORESERVA
                sNomeCampoCod,    // Ex. : CODHIERARQUIA
                sCodigo,          // Ex. : 1.01.001
                sMascara: string  // Ex. : 9.99.999
                 ) : string;

   { Rotina para preencher o array com o tamanho de cada nivel da mascara
     do tipo de reserva }
   procedure PreencheTamNiveisMascara(sMascara : string);

implementation

{ ROTINAS RELACIONADAS A MASCARA  TIPO DE RESERVA }
procedure PreencheTamNiveisMascara(sMascara : string);
var
   iNivel,
   iTamNivel,
   iTamAcum,
   i : integer;
begin
   iNivel := 1;
   iTamNivel := 0;
   iTamAcum  := 0;
   for i := 1 to length(sMascara) do
   begin
      if sMascara[i] = '.'
      then begin
        iTamAcum := iTamAcum + iTamNivel;
        vetNiveis[iNivel].TamNivel := iTamNivel;
        vetNiveis[iNivel].TamAcum  := iTamAcum;
        iTamNivel := 0;
        iNivel := iNivel + 1;
      end
      else begin
         inc(iTamNivel);
      end;
   end;
end; //PreencheTamNiveisMascara

function Pai(sTabArvore,       // Ex. : TIPORESERVA
             sNomeCampoCod,    // Ex. : CODHIERARQUIA
             sCodigo,          // Ex. : 1.01.001
             sMascara: string  // Ex. : 9.99.999
              ) : string;
var i,
    iTamNivel,
    iTamPai,
    indNivel  : integer;
    sCodPai : string;
begin
   Result := '';

   // Ler o tamanho do codigo passado
   iTamNivel := length(sCodigo);
   indNivel:=1;

   for i := 1 to maxNiveis do
   begin
      if vetNiveis[i].TamAcum = iTamNivel
      then begin
         indNivel := i;
         break;
      end;
   end;
   iTamPai := vetNiveis[indNivel].TamAcum - vetNiveis[indNivel].TamNivel;
   sCodPai := copy(sCodigo,1,iTamPai);
   Result := sCodPai;
end;

end.
