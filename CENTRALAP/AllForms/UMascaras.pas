unit UMascaras;

interface

uses  SysUtils;

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
   { Funcao que verifica um codigo que tenha mascara
     Códigos de Erro  :
     1 : falta algum caracter para completar a mascara
     2 : usuario completou os niveis com ZERO
   }

   function VerificaCodigo(sCodigo,sMascara : string; var cCodErro : char) : boolean;

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
   // Inserir ultimo nivel
   iTamAcum := iTamAcum + iTamNivel;
   vetNiveis[iNivel].TamNivel := iTamNivel;
   vetNiveis[iNivel].TamAcum  := iTamAcum;

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
   indNivel := 0; // CAMILLE - REFER - 16.03.1999

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


function VerificaCodigo(sCodigo, sMascara : string; var cCodErro : char) : boolean;
var i,
    iTamNivel,
    indNivel  : integer;
    sCodNivel : string;
    cLetra  : char;
    bTudoZero,
    bAlgumDiverge,
    bTodosBrancos : boolean;
begin
   sCodNivel := '';
   indNivel := 1;
   bTudoZero     := True;
   bTodosBrancos := True;
   bAlgumDiverge := False;
   for i := 1 to  length(sCodigo) do
   begin
      cLetra := sCodigo[i];
      if cLetra <> '.'
      then begin
         if (cLetra <> '') and (cLetra <> ' ') and (cLetra <> '_')
         then sCodNivel := sCodNivel + cLetra;

         if cLetra <> '0' then bTudoZero := False;
      end
      else begin // terminou o nivel
         iTamNivel := length(sCodNivel);
         if iTamNivel <> 0 then bTodosBrancos := False;

         if Trim(sCodNivel) <> ''
         then begin
            if vetNiveis[indNivel].TamNivel <> iTamNivel
            then bAlgumDiverge := True;
         end;
         if bTudoZero
         then begin // o usuario preencheu o nivel todo com zero
            cCodErro := '2';
            Result := False;
            Exit;
         end;

         sCodNivel := '';
         bTudoZero := True;
         inc(indNivel);
      end;
   end;

//    Se todos os caracteres forem brancos, retornar True, pois o usuário pode cadastrar
//        depois, antes do Ok.
//     Senao, se houver alguma divergencia -> retornar False
//            senao -> retorna True
   if bTodosBrancos
   then Result := True
   else if bAlgumDiverge
        then begin
           cCodErro := '1';
           Result := False;
        end
        else Result := True;
end;

end.
