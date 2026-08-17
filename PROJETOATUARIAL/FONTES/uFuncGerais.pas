unit uFuncGerais;

interface

uses
  classes, sysutils, Dialogs, uDtMdlSat, uglobal;

type Ttempo =
       CLASS(TObject)
     public
        anos, meses, dias : integer;  //  tempo qtde em ...

       {Procedimento para criar/lieberar registro de tempo}
        procedure criatempo;
        procedure freetempo;
     end;

//Função para calcular a Idade em ano na Data de Referência da Versão Selecionada
function getIDADE(dDT_NASCIMENTO: TDateTime): Integer;

{Função para Formatar as casas de um valor String - sem separador de Milhares}
function TruncValue(sValor: String; iCasas: Integer): String;

{Função para contar linhas de um arquivo .TXT}
function linhastxt(const Arquivo_txt : text) : integer;

{Função para formatar data com ´/´}
function fmtdata (const p_data : string ) : string;

{Função para recuperar qtde de registros de uma tabela}
function totreg (const p_tabela : string ) : integer;

{Função para recuperar um string com delimitador}
function str_delim (w_str, w_delim : string) : string;

{Função para recuperar um string com delimitador - SEM SUPRIMIR BRANCOS}
function str_delimSB(w_str, w_delim : string) : string;

{Função para identificar parâmetros sql de um string}
function params_sql (w_str : string) : tstringlist;

{Função para trocar parâmetros sql de um string}
function param_sql (w_nome_param, w_valor_param : tstringlist;
                    w_str : string) : string;

{Função para exponenciação Y**X}
function Y_X (y : real; x : real) : real;

{Função para calular o tempo: qtde de anos, meses e dias entre datas}
function tempo (w_data_ini, w_data_fim : tdatetime) : tlist;

{Função para calcular tempo de serviço anterior do Participante}
function e (w_cd_pessoa  : integer) : tlist;

{Função para calcular a idade atual do Participante}
function x (w_cd_pessoa  : integer;  // identificação
            w_data_refer : tdatetime // data de referencia do calculo
            ) : tlist;

{Função para calular a idade do filho mais velho - cabeça do casal}
function y (w_cd_pessoa  : integer;  // identificação
            w_data_refer : tdatetime // data de referencia do calculo
            ) : tlist;
{Função para calcular a idade do Participante na admissão emprego atual}
function x_IdadeAdm (w_cd_pessoa  : integer;  // identificação
                   w_data_refer : tdatetime // data de referencia do calculo
                   ) : tlist;

{Função para calular a idade do Participante na data da aposentadoria}
function x_IdadeAposent(w_cd_pessoa  : integer;  // identificação
                      w_data_refer : tdatetime // data de referencia do calculo
                      ) : integer;

{Função recuperar referencia da base}
function refer_base : tdatetime;

{Formata Data para o Ingles}
Function Formata_Data ( Data : String ; Mascara : String ) : String;

{Retorna indice de uma variável em um StringList}
{considerando CaseSensitive}
Function Get_String_Index ( Lista : TStringList ; Variavel : String ) : Integer;

{Atualiza Parâmetros do sql}
function AtualizaParametros (CD_VERSAO, CD_PARTIC : integer;
                                                   sql : string) : string;
function FormataFloat(texto: String): String;


var
  qtempo : tlist;
  rtempo : ttempo;

implementation

{Função para Formatar as casas de um valor String - sem separador de Milhares}
function TruncValue(sValor: String; iCasas: Integer): String;
var
  sInteiro, sDecimal: String;
begin
  // Troca o ponto decimal por vírgula, se encontrar
  if pos('.', sValor) > 0 then
    sValor[pos('.', sValor)] := ','
  else
   begin
     Result := sValor;
     Exit;
   end;

  //Parte Inteira
  sInteiro := copy(sValor, 1, (pos(',', sValor) - 1));
  //Parte Decimal
  sDecimal := copy(sValor, (pos(',', sValor) + 1), (Length(sValor) - pos(',', sValor)));
  sDecimal := Trim(sDecimal) + '00000000000000';


  if iCasas <= 0 then
   begin
     Result := sInteiro;
     Exit;
   end;

  // Arredonda Valor decimal
  if (iCasas > 1) and (StrToInt(sDecimal[iCasas + 1]) > 5) then
    sDecimal := copy(sDecimal, 1, (iCasas - 1)) + IntToStr(StrToInt(sDecimal[iCasas]) + 1)
  else
    sDecimal := copy(sDecimal, 1, iCasas);

  Result := sInteiro + ',' + sDecimal;
end;

function FormataFloat(texto: String): String;
var
  Aux, Aux2: String;
  i, a: Byte;
begin
//$$$$$$$$$$$$$$$$$$
// Procedimento para tirar os pontos do Valor
//$$$$$$$$$$$$$$$$$$
  aux := texto;
  aux2:= aux;

  if trim(aux) = '' then
   begin
     Result := '0,00';
     exit;
   end;

  a := 0;
  for i := 0 to length(texto) do
   begin
     aux2[i] := ' ';
     if aux[i] <> '.' then
      begin
       aux2[a] := aux[i];
       inc(a);
      end;
   end;
  Result := trim(aux2);
//$$$$$$$$$$$$$$$$$$
end;

{-------------------------------------------------------------------}
{Função para contar linhas de um arquivo .TXT}
function linhastxt(const Arquivo_txt : text) : integer;
var w_cont : integer;
begin
  linhastxt := 0;

  try
    Reset(Arquivo_Txt);  {Abre arquivo para leitura}
  Except
    on EInOutError do
       begin
          MessageDlg('Erro de abertura do arquivo', mtError,[mbok],0);
          exit;
       end;
  end;

  w_cont := 0;
  while not eof(Arquivo_txt) do begin
     readln(Arquivo_txt);
     w_cont := w_cont + 1;
  end;

  linhastxt := w_cont;

end;

//-----------------------------------------------------------------------
//-- Recupera indice de uma variavel em uma StringList
//-----------------------------------------------------------------------
Function Get_String_Index ( Lista : TStringList ; Variavel : String ) : Integer;
Var
  WI : Integer;
Begin
   Result := -1;

   For WI := 0 to Lista.Count-1 Do
    If Lista[WI] = Variavel Then
     Begin
      Result := WI;
      Break;
     End;
End;

{-------------------------------------------------------------------}
{Função para formatar data com ´/´}
function fmtdata (const p_data : string ) : string;

begin
  fmtdata := copy(p_data,1,2) + '/'  +
             copy(p_data,3,2) + '/'  +
             copy(p_data,5,4);
end;

{-------------------------------------------------------------------}
{Função para recuperar qtde de registros de uma tabela}
function totreg (const p_tabela : string ) : integer;

begin

   DtMdlSat.wwqrytotreg.close;
   DtMdlSat.wwqrytotreg.SQL[1] := p_tabela;
   DtMdlSat.wwqrytotreg.open;
   totreg := DtMdlSat.wwqrytotregtotreg.asinteger;

end;

{-------------------------------------------------------------------}
{Função para recuperar um string com delimitador}

function str_delim (w_str, w_delim : string) : string;
var
 w_tam : integer;

begin

   w_str := trim(w_str);
   w_tam := pos( w_delim, w_str) - 1;

   if w_tam <= 0 then
      if copy(w_str, 1, 1) = ';' then
         w_str := trim(copy(w_str, 2, w_tam - 1))
      else
   else
      w_str := trim(copy(w_str, 1, w_tam));


   while Pos(' ', w_str) > 0 do
       w_str[Pos(' ', w_str)] := '0';

   while Pos('.', w_str) > 0 do
       w_str[Pos('.', w_str)] := ',';

   str_delim := w_str;

end;
{-------------------------------------------------------------------}
{Função para recuperar um string com delimitador - SEM SUPRIMIR BRANCOS}

function str_delimSB (w_str, w_delim : string) : string;
var
 w_tam : integer;

begin

   w_str := trim(w_str);

   while Pos('.', w_str) > 0 do
      w_str[Pos('.', w_str)] := ' ';

   while Pos('[', w_str) > 0 do
      w_str[Pos('[', w_str)] := ' ';

   while Pos(']', w_str) > 0 do
      w_str[Pos(']', w_str)] := ' ';

   w_tam := pos(w_delim, w_str) - 1;

   if w_tam <= 0 then
      if copy(w_str, 1, 1) = ';' then
         w_str := trim(copy(w_str, 2, w_tam - 1))
      else
   else
      w_str := trim(copy(w_str, 1, w_tam));

   str_delimSB := w_str;

end;

{-------------------------------------------------------------------}
{Função para identificar parâmetros sql de um string}
function params_sql (w_str : string) : tstringlist;
var
 w_params : tstringlist;
 w_pos, w_tam : integer;

begin

  w_params := tstringlist.create;
  w_params.Clear;

  while Pos(':', w_str) > 0 do
   begin

      w_str := trim(w_str);
      w_pos := Pos(':', w_str);
      w_str := copy(w_str, w_pos, length(w_str) - w_pos + 1);
      w_pos := 2;

      w_tam := Pos(' ', w_str);
      if w_tam = 0 then
         w_tam := length(w_str)
      else
         w_tam := w_tam - w_pos;

      w_params.add(trim(copy (w_str, w_pos, w_tam)));

      w_pos := Pos(' ', w_str);
      if w_pos = 0 then break;

      w_tam := length(w_str);

      w_str := copy(w_str, w_pos, w_tam - w_pos + 1);

   end;

   params_sql := w_params;
  // w_params.Free;

end;
{-------------------------------------------------------------------}
{Função para trocar parâmetros sql de um string}

function param_sql (w_nome_param, w_valor_param : tstringlist;
                    w_str : string) : string;
var
 w_i, w_j, w_pos, w_tam : integer;
 w_param_str  : string;

begin

 repeat

   w_str := trim(w_str);
   w_tam := length(w_str);
   w_pos := pos( ':', w_str);

   if w_pos <= 0 then
      begin
       result := w_str;
       exit;
      end;

   w_param_str := '';

   w_i := w_pos;

   repeat
     w_i := w_i + 1;
     w_param_str := w_param_str + w_str[w_i];

   until (w_str[w_i] = ' ') or
         (w_i       >= w_tam);

   w_param_str := trim(w_param_str);

   if w_param_str <> '' then
     begin

      w_j := w_nome_param.IndexOf(w_param_str);

      if w_j = -1 then
         Raise Exception.Create
          ('Parâmetro SQL ' + w_param_str + ' não identificado: ' +
            w_str);

       w_str := copy(w_str, 1, w_pos-1) +
                w_valor_param[w_j]      +
                copy(w_str, w_i+1, w_tam-w_i+1);

     end;


  until w_pos <= 0;

end;

{-------------------------------------------------------------------}
{Função para exponenciação Y**X}

function Y_X (y : real; x : real) : real;

begin
   result :=  exp(x * Ln(y));
end;

{Procedimento para criar registro de tempo}
procedure ttempo.criatempo;

begin
 qtempo := tlist.create;
 qtempo.capacity := 1;
 qtempo.add(ttempo.create);
end;

{Procedimento para criar registro de tempo}
procedure ttempo.freetempo;
begin
 qtempo.free;   
end;

{-------------------------------------------------------------------}
{Função para calular o tempo: qtde de anos, meses e dias entre datas}
function tempo (w_data_ini, w_data_fim : tdatetime) : tlist;

var
 w_dia_ini, w_mes_ini, w_ano_ini : word;
 w_dia_fim, w_mes_fim, w_ano_fim : word;

begin

 DecodeDate(w_data_ini, w_ano_ini, w_mes_ini, w_dia_ini);
 DecodeDate(w_data_fim, w_ano_fim, w_mes_fim, w_dia_fim);

 if w_dia_fim < w_dia_ini then
    begin
      w_dia_fim := w_dia_fim + 30;
      w_mes_fim := w_mes_fim - 1;
    end;

 if w_mes_fim < w_mes_ini then
    begin
      w_mes_fim := w_mes_fim + 12;
      w_ano_fim := w_ano_fim - 1;
    end;

 rtempo      := qtempo.items[0];
 rtempo.anos := w_ano_fim - w_ano_ini;
 rtempo.meses:= w_mes_fim - w_mes_ini;
 rtempo.dias := w_dia_fim - w_dia_ini + 1;

 tempo    := qtempo;

end;

{-------------------------------------------------------------------}
{Função para calcular a idade atual do Participante}
function x (w_cd_pessoa  : integer;  // identificação
            w_data_refer : tdatetime // data de referencia do calculo
            ) : tlist;

begin

  DtMdlSat.wwQryTempo.close;
  DtMdlSat.wwQryTempo.parambyname('cd_versao').asinteger := WG_CD_VERSAO;
  DtMdlSat.wwQryTempo.parambyname('cd_partic').asinteger := w_cd_pessoa;
  DtMdlSat.wwQryTempo.parambyname('ir_dominio_sistema').asstring
                                             := 'NAS';
  DtMdlSat.wwQryTempo.open;

  if DtMdlSat.wwQryTempo.recordcount = 0 then
     Raise Exception.Create
     ('Data de nascimento inexistente para o Participante ' +
       inttostr(w_cd_pessoa));

  if (DtMdlSat.wwQryTempodt_tempo.asdatetime = 0) or
     (VarIsNull(DtMdlSat.wwQryTempodt_tempo.asdatetime)) then
     begin
      rtempo      := qtempo.items[0];

      if VarIsNull(DtMdlSat.wwQryTempoqt_ano_tempo.asinteger) then
         rtempo.anos := 0
      else
         rtempo.anos := DtMdlSat.wwQryTempoqt_ano_tempo.asinteger;

      if VarIsNull(DtMdlSat.wwQryTempoqt_mes_tempo.asinteger) then
         rtempo.meses:= 0
      else
         rtempo.meses:= DtMdlSat.wwQryTempoqt_mes_tempo.asinteger;

      if VarIsNull(DtMdlSat.wwQryTempoqt_dia_tempo.asinteger) then
         rtempo.dias := 0
      else
         rtempo.dias := DtMdlSat.wwQryTempoqt_dia_tempo.asinteger;

      x := qtempo;

      exit;
     end;

  if DtMdlSat.wwQryTempodt_tempo.asdatetime >  w_data_refer then
     begin
       rtempo.dias := 0;
       rtempo.meses:= 0;
       rtempo.anos := 0;
       x := qtempo;
     end
  else
   x  := tempo(DtMdlSat.wwQryTempodt_tempo.asdatetime, w_data_refer);

end;

{-------------------------------------------------------------------}
{Função para calcular a idade do filho mais velho - cabeça do casal}
function y (w_cd_pessoa  : integer;  // identificação
            w_data_refer : tdatetime // data de referencia do calculo
            ) : tlist;

begin

  DtMdlSat.wwQryDependente.close;
  DtMdlSat.wwQryDependente.parambyname('cd_versao').asinteger := WG_CD_VERSAO;
  DtMdlSat.wwQryDependente.parambyname('cd_partic').asinteger := w_cd_pessoa;
  DtMdlSat.wwQryDependente.open;

  if DtMdlSat.wwQryDependente.recordcount = 0 then
     begin
      rtempo      := qtempo.items[0];
      rtempo.anos := 0;
      rtempo.meses:= 0;
      rtempo.dias := 0;
      y := qtempo;
      exit;
     end;

  if VarIsNull(DtMdlSat.wwQryDependenteidade.asinteger) then
    else
    if DtMdlSat.wwQryDependenteidade.asinteger > 0 then
     begin
      rtempo      := qtempo.items[0];
      rtempo.anos := DtMdlSat.wwQryDependenteidade.asinteger;
      rtempo.meses:= 0;
      rtempo.dias := 0;
      y := qtempo;
      exit;
     end;

  {Caso contrario, calcular a idade o filho dependente mais velho
   a partir da data de nascimento}

  y := tempo(DtMdlSat.wwQryDependentedata_nasc.asdatetime, // data de nascimento
             w_data_refer);

end;

{-------------------------------------------------------------------}
{Função para calcular a idade do Participante na admissão do atual emprego}
function x_IdadeAdm (w_cd_pessoa  : integer;  // identificação
                   w_data_refer : tdatetime // data de referencia do calculo
                   ) : tlist;
var
  w_data_nas, w_data_adm : tdatetime;

begin

  DtMdlSat.wwQryTempo.close;
  DtMdlSat.wwQryTempo.parambyname('cd_versao').asinteger := WG_CD_VERSAO;
  DtMdlSat.wwQryTempo.parambyname('cd_partic').asinteger := w_cd_pessoa;
  DtMdlSat.wwQryTempo.parambyname('ir_dominio_sistema').asstring
                                             := 'NAS';
  DtMdlSat.wwQryTempo.open;

  if DtMdlSat.wwQryTempo.recordcount = 0 then
     Raise Exception.Create
     ('Falta informar data de nascimento para o Participante ' +
       inttostr(w_cd_pessoa));

  w_data_nas :=  DtMdlSat.wwQryTempodt_tempo.asdatetime;

  DtMdlSat.wwQryTempo.close;

  DtMdlSat.wwQryTempo.parambyname('cd_versao').asinteger := WG_CD_VERSAO;
  DtMdlSat.wwQryTempo.parambyname('cd_partic').asinteger := w_cd_pessoa;
  DtMdlSat.wwQryTempo.parambyname('ir_dominio_sistema').asstring:= 'ADM';
  DtMdlSat.wwQryTempo.open;

  if DtMdlSat.wwQryTempo.recordcount = 0 then
     Raise Exception.Create
     ('Falta informar data de admissão para o Participante ' +
       inttostr(w_cd_pessoa));

  w_data_adm :=  DtMdlSat.wwQryTempodt_tempo.asdatetime;

  x_IdadeAdm  := tempo(w_data_nas, w_data_adm);

end;

{-------------------------------------------------------------------}
{Função para calcular tempo de serviço anterior do Participante}
function e (w_cd_pessoa  : integer) : tlist;
var
  w_dt_e : tdatetime;

begin

  {Recuperar o tempo de serviço anterior informado}

  DtMdlSat.wwQryTempo.close;
  DtMdlSat.wwQryTempo.parambyname('cd_versao').asinteger := WG_CD_VERSAO;
  DtMdlSat.wwQryTempo.parambyname('cd_partic').asinteger := w_cd_pessoa;
  DtMdlSat.wwQryTempo.parambyname('ir_dominio_sistema').asstring:= 'ANT';
  DtMdlSat.wwQryTempo.open;

  if DtMdlSat.wwQryTempo.recordcount = 0 then
    begin
      rtempo      := qtempo.items[0];
      rtempo.anos := 0;
      rtempo.meses:= 0;
      rtempo.dias := 0;
      e := qtempo;
      exit;
    end;

  if VarIsNull(DtMdlSat.wwQryTempoqt_ano_tempo.asinteger) then
    else
    if DtMdlSat.wwQryTempoqt_ano_tempo.asinteger > 0 then
     begin
      rtempo      := qtempo.items[0];
      rtempo.anos := DtMdlSat.wwQryTempoqt_ano_tempo.asinteger;
      rtempo.meses:= DtMdlSat.wwQryTempoqt_mes_tempo.asinteger;
      rtempo.dias := DtMdlSat.wwQryTempoqt_dia_tempo.asinteger;
      e := qtempo;
      exit;
     end;

  {Caso contrario, calcular o tempo de serviço entre a data do primeiro
   emprego e o emprego atual}

  w_dt_e := DtMdlSat.wwQryTempodt_tempo.asdatetime; // data adm emprego anterior

  DtMdlSat.wwQryTempo.close;
  DtMdlSat.wwQryTempo.parambyname('cd_versao').asinteger := WG_CD_VERSAO;
  DtMdlSat.wwQryTempo.parambyname('cd_partic').asinteger := w_cd_pessoa;
  DtMdlSat.wwQryTempo.parambyname('ir_dominio_sistema').asstring:= 'ADM';
  DtMdlSat.wwQryTempo.open;

  if (DtMdlSat.wwQryTempo.recordcount = 0)             or
     VarIsNull(DtMdlSat.wwQryTempodt_tempo.asdatetime) then
     Raise Exception.Create
     ('Falta informar data de admisão na empresa para o Participante ' +
       inttostr(w_cd_pessoa));

  e  := tempo(w_dt_e, DtMdlSat.wwQryTempodt_tempo.asdatetime);


end;

{-------------------------------------------------------------------}
{Função para calular a idade do Participante na data da aposentadoria}
function x_IdadeAposent (w_cd_pessoa  : integer;  // identificação
                       w_data_refer : tdatetime // data de referencia do calculo
                       ) : integer;
var
 w_y, w_x, w_e, w_tempo_ant  : integer;
 tmp       : tlist;

begin

  tmp    := x (w_cd_pessoa, w_data_refer);

  rtempo := tmp.items[0];
  w_x    := rtempo.anos; // idade atual

  tmp    := X_IdadeAdm (w_cd_pessoa, w_data_refer);
  rtempo := tmp.items[0];
  w_e    := w_x - rtempo.anos; // tempo desde a admissão

  tmp    := e (w_cd_pessoa);
  rtempo := tmp.items[0];
  w_tempo_ant := rtempo.anos; // tempo anterior

  if (w_tempo_ant + w_e) > 35 then
    if w_x > 55 then
       x_IdadeAposent := w_x
    else
       x_IdadeAposent := 55
  else
   begin
     w_y := w_x + (35 - w_tempo_ant - w_e);
     if w_y < 55 then
        x_IdadeAposent := 55
     else
      if w_y > 65 then
        x_IdadeAposent := 65
      else
        x_IdadeAposent := w_y;
   end;

end;

{-------------------------------------------------------------------}
{Função recuperar referencia da base}
function refer_base : tdatetime;
begin

  refer_base := WG_DT_REFER_BASE;

end;

//-----------------------------------------------------------------------
//-- Formata Data a partir da Máscara
//-----------------------------------------------------------------------
Function Formata_Data ( Data : String ; Mascara : String ) : String;
Var WDia   : String;
    WMes   : String;
    WAno   : String;
    WData  : TDateTime;
    WSData : String;
    WI     : Integer;
begin

  WI := 1;

  //Trata Mascara
  Mascara := UpperCase(Mascara);

  While WI <= Length(Mascara) Do
    Begin
      If Mascara[WI] = 'D' Then
         WDia := WDia + Copy(Data,WI,1);
      If Mascara[WI] = 'M' Then
         WMes := WMes + Copy(Data,WI,1);
      If Mascara[WI] = 'A' Then
         WAno := WAno + Copy(Data,WI,1);
      WI := WI + 1;
    End;

  // Valida Data
  WSData := WDia + '/' + WMes + '/' + WAno;
  Try
    WData  := StrToDate(WSData);
    Result := WSData;
  Except
    Result := ''
  End;
End;
{-------------------------------------------------------------------}
{Atualiza Parâmetros do sql}
function AtualizaParametros (CD_VERSAO, CD_PARTIC : integer;
                                    sql : string) : string;
var
  i, tammax, posicao : integer;
  param, str : string;
begin

  str := sql;

  //-- Retira caracteres de controle
  while Pos(#10, str) > 0 do
      str[Pos(#10, str)] := ' ';
  while Pos(#13, str) > 0 do
      str[Pos(#13, str)] := ' ';


  while pos (':', str) > 0 do
   begin
     posicao := pos (':', str);
     param := '';
     tammax := length(str);

     //-- Identifica campo
     for i := posicao+1 to tammax do
       begin

        if (str[i] = ' ')  then break;
        param := param + str[i];

       end;

     if  param = 'CD_VERSAO' then
         str := copy(str, 1, posicao-1) + inttostr(CD_VERSAO) +
                copy(str, posicao+10, tammax-posicao+10);
     if  param = 'CD_PARTIC' then
         str := copy(str, 1, posicao-1) + inttostr(CD_PARTIC)+
                copy(str, posicao+10, tammax-posicao+10);

   end;

   AtualizaParametros := str;

end;

//Função para calcular a Idade em ano na Data de Referência da Versão Selecionada
function getIDADE(dDT_NASCIMENTO: TDateTime): Integer;
var
  iDiaIni, iMesIni, iAnoIni,
   iDiaFim, iMesFim, iAnoFim: Word;
begin
  DecodeDate(dDT_NASCIMENTO, iAnoIni, iMesIni, iDiaIni);
  DecodeDate(WG_DT_REFER_BASE, iAnoFim, iMesFim, iDiaFim);

  if iDiaFim < iDiaIni then
   begin
     iDiaFim := iDiaFim + 30;
     iMesFim := iMesFim - 1;
   end;

  if iMesFim < iMesIni then
   begin
     iMesFim := iMesFim + 12;
     iAnoFim := iAnoFim - 1;
   end;

 Result := iAnoFim - iAnoIni;
end;

end.
