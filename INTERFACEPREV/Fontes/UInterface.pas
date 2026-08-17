unit UInterface;

interface
  procedure GravaRubrica(piIdPessJur,piIdPlanoPrev : integer;psMesRef,psMesCob : string;
                         pdValor : double;psCodProvDesc,psChave,psValorChave : string;
                         pdtDataRef : TDateTime;pliSequencial : LongInt);
  function Preenche(Onde,Caracter : char; Str : string; Tamanho : integer) : string;
  procedure FazDeletePorFaixa(sSQLParam : string);
  function ColocaPonto(str : string) : string;
  function TestArqInterface(sTipoArquivo, sArqTxt : String) : boolean;

implementation

Uses UMensErro,UAdmPrev, DBaseDados,UDataBase,Dinterface,SysUtils,UCCP,
     Dialogs;

procedure GravaRubrica(piIdPessJur,piIdPlanoPrev : integer;psMesRef,psMesCob : string;
                       pdValor : double;psCodProvDesc,psChave,psValorChave : string;
                       pdtDataRef : TDateTime;pliSequencial : LongInt);
begin
  with dtmInterface.qryGravaRubricas do
  begin
    Close;
    ParamByName('IdPessJur').Value := piIdPessJur;
    ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
    ParamByName('MesRef').Value := psMesRef;
    ParamByName('MesCob').Value := psMesCob;
    ParamByName('Valor').Value := pdValor;
    ParamByName('CodProvDesc').Value := psCodProvDesc;
    ParamByName('Chave').Value := psChave;
    ParamByName('ValorChave').Value := psValorChave;
    ParamByName('DataRef').Value := pdtDataRef;
    ParamByName('SeqInterface').Value := pliSequencial;
    ExecSQL;
  end;
end; // GravaRubrica

function Preenche(Onde,Caracter : char; Str : string; Tamanho : integer) : string;
var
  i,
  Num : integer;
begin
  Num := Tamanho - length(Str);
  for i := 1 to Num do
    if Onde = 'E'
    then Str := Caracter + Str
    else Str := Str + Caracter;
  Result := Str;
end; // Preenche

procedure FazDeletePorFaixa(sSQLParam : string);
var
  sSQL : string;
begin
  dtmBaseDados.dbBaseDados.StartTransaction;
  with dtmInterface.qryAux do
  begin
    Close;
    SQl.Clear;
    SQL.Add(sSQLParam + ' AND (ROWNUM <= ' + IntToStr(liTamFaixa) + ')');
    ExecSQL;
    while (RowsAffected > 0) do
    begin
      dtmBaseDados.dbBaseDados.Commit;
      dtmBaseDados.dbBaseDados.StartTransaction;
      ExecSQL;
    end; //while
  end;
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;

end;//FazUpdatePorFaixa

function ColocaPonto(str : string) : string;
var
  aux : double;
begin
  aux := StrToFloat(str);
  aux := aux/100;
  Result := OraNumero(FloatToStr(aux));
end; // ColocaPonto

///   TESTARQINTERFACE
///   Testa se a definição dos arquivos de interface batem com o
///   arquivo passado como parâmetro
///
function TestArqInterface(sTipoArquivo, sArqTxt : String) : boolean;
const
   arrTipoInterf : array[1..5] of string = ('Empregados','Lotação','Endereço','Eventos','Rubricas');
var
   iTipoInterf : Integer;
   F : TextFile;
   sLinha : String;
begin
   iTipoInterf := 1;
   case iTipoInterf of
      1 : begin // Empregados

        /// Testa a existência do arquivo
        try
          AssignFile(F,sArqTxt);
          Reset(F);
          ReadLn(F,sLinha);
        except
          MsgDlg('Erro ao acessar arquivo informado!','Erro!',mtError,[MbOk,MbHelp],0);
          Result := False;
          Exit;
        end;

        /// Pega a estrutura dos campos

        ///

      end;
      2 : begin  // Lotação
      end;
      3 : begin  // Endereço
      end;
      4 : begin  // Eventos
      end;
      5 : begin  // Rubricas
      end;
   end;
end;


end.

