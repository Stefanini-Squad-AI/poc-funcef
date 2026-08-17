//***************************************************************************************|
//                   FUNÇÕES AUXILIARES PARA O CÁLCULO DA TÁBUA DE SERVIÇO               |
//***************************************************************************************|
// Data        : 15-Set-2005                                                             |
// Responsável : Rômulo Coriolano de Melo                                                |
// Alterações  :                                                                         |
//----------------------------------------------------------------------------------------
unit uCalculoTabuaServico;

interface

uses Dialogs, DBTables, SysUtils, Classes;

Type
  TTabuaServico = Record
    sNO_VARIAVEL: array of String;
    fVL_CALCULO: array of Extended;
  end;

function getIDADE_MINIMA(lstTabuas: TStringList): Integer;
function getIDADE_MAXIMA(lstTabuas: TStringList): Integer;
function getValorIdade(iIDADE: Integer; sVARIAVEL: String): Extended;
procedure setValorIdade(iIDADE: Integer; sVARIAVEL: String; fVL_VARIAVEL: Extended);
procedure inicializaTabuaServico(lstTabuas: TStringList);
procedure setTabuaServico(iCD_TABUA: Integer);
procedure setConsultaTabua(var qry: TQuery);

function getIDADE_MINIMA_PENSAO(iSQ_VERSAO: Integer): Integer;
function getIDADE_MAXIMA_PENSAO(iSQ_VERSAO: Integer): Integer;
function getValorIdadePensao(iIDADE, iIDADE_PENSAO: Integer; sVARIAVEL: String): Extended;
procedure inicializaTabuaPensao(iSQ_VERSAO:Integer);
procedure setConsultaTabuaPensao(var qry: TQuery);
procedure setValorIdadePensao(iIDADE, iIDADE_PENSAO: Integer; sVARIAVEL: String; fVL_VARIAVEL: Extended);

var
  iIDADE_MINIMA, iIDADE_MAXIMA: Integer;
  Tabua_Servico: array of array of TTabuaServico;

implementation

function getIDADE_MINIMA(lstTabuas: TStringList): Integer;
var
  qry: TQuery;
  i: Integer;
  sTabuas: String;
begin
  Try
    qry := TQuery.Create(Nil);
    qry.DatabaseName := 'BaseDados';
    qry.SQL.Add('SELECT MIN(NR_IDADE) AS MIN_IDADE FROM FI_OCORR_TABUA');

    sTabuas := '';
    for i := 0 to lstTabuas.Count - 1 do
     if sTabuas = '' then
       sTabuas := lstTabuas.Strings[i]
     else
       sTabuas := sTabuas + ', ' + lstTabuas.Strings[i];
    if sTabuas <> '' then
      qry.SQL.Add('WHERE CD_TABUA IN (' + sTabuas + ')');

    qry.Open;

    Result := qry.FieldByName('MIN_IDADE').asInteger;
  Finally
    qry.Close;
    FreeAndNil(qry);
  End;
end;

function getIDADE_MAXIMA(lstTabuas: TStringList): Integer;
var
  i: Integer;
  qry: TQuery;
  sTabuas: String;
begin
  Try
    qry := TQuery.Create(Nil);
    qry.DatabaseName := 'BaseDados';
    qry.SQL.Add('SELECT MAX(NR_IDADE) AS MAX_IDADE FROM FI_OCORR_TABUA');

    sTabuas := '';
    for i := 0 to lstTabuas.Count - 1 do
     if sTabuas = '' then
       sTabuas := lstTabuas.Strings[i]
     else
       sTabuas := sTabuas + ', ' + lstTabuas.Strings[i];
    if sTabuas <> '' then
      qry.SQL.Add('WHERE CD_TABUA IN (' + sTabuas + ')');

    qry.Open;

    Result := qry.FieldByName('MAX_IDADE').asInteger;
  Finally
    qry.Close;
    FreeAndNil(qry);
  End;
end;

procedure inicializaTabuaServico(lstTabuas: TStringList);
var i, j, iPENSAO: Integer;
begin
   iIDADE_MINIMA := getIDADE_MINIMA(lstTabuas);
   iIDADE_MAXIMA := getIDADE_MAXIMA(lstTabuas);

   SetLength(Tabua_Servico, iIDADE_MAXIMA + 1);

   for i := iIDADE_MINIMA to High(Tabua_Servico) do
   begin
      SetLength(Tabua_Servico[i], iIDADE_MAXIMA + 1);

      for iPENSAO := 0 to High(Tabua_Servico[i]) do
      begin
        SetLength(Tabua_Servico[i][iPENSAO].sNO_VARIAVEL, iIDADE_MAXIMA + 1);
        SetLength(Tabua_Servico[i][iPENSAO].fVL_CALCULO , iIDADE_MAXIMA + 1);
      end;

      for j := 1 to High(Tabua_Servico[i][0].sNO_VARIAVEL) do
      begin
         Tabua_Servico[i][iIDADE_MINIMA].fVL_CALCULO[j]  := 0;

         case j of
             1: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'p_x';
             2: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'q_x';
             3: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'q_x_ii';
             4: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'i_x';
             5: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'w_x';
             6: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'l_x';
         end; //case
      end; //for
   end; //for
end;

procedure setTabuaServico(iCD_TABUA: Integer);
var qry: TQuery;
    i, iIDADE: Integer;
    sTIPO_TABUA: String;
begin
   Try
      qry := TQuery.Create(Nil);
      qry.DatabaseName := 'BaseDados';
      sTIPO_TABUA := '';

      setConsultaTabua(qry);

      With qry do
      Begin
         Close;
         ParamByName('CD_TABUA').asInteger := iCD_TABUA;
         Open;

         While not Eof do
         Begin
            iIDADE := FieldByName('NR_IDADE').asInteger;
            If sTIPO_TABUA = '' then
               sTIPO_TABUA := Trim(FieldByName('SG_TIPO_TABUA').asString);



            //Tábua de Mortalidade.
            If sTIPO_TABUA = 'MRT' then
            Begin
               For i := 1 to High(Tabua_Servico[iIDADE][0].sNO_VARIAVEL) do
               Begin
                  //p_x
                  If Tabua_Servico[iIDADE][0].sNO_VARIAVEL[i] = 'p_x' then
                     Tabua_Servico[iIDADE][0].fVL_CALCULO[i] := FieldByName('NR_P_X').asFloat
                  //q_x
                  Else If Tabua_Servico[iIDADE][0].sNO_VARIAVEL[i] = 'q_x' then
                          Tabua_Servico[iIDADE][0].fVL_CALCULO[i] := FieldByName('NR_Q_X').asFloat
                       //l_x
                       Else If Tabua_Servico[iIDADE][0].sNO_VARIAVEL[i] = 'l_x' then
                               Tabua_Servico[iIDADE][0].fVL_CALCULO[i] := FieldByName('NR_L_X').asFloat;
               End;
            End
            //Tábua de Invalidez.
            Else If sTIPO_TABUA = 'INV' then
                 Begin
                    For i := 1 to High(Tabua_Servico[iIDADE][0].sNO_VARIAVEL) do
                    Begin
                       //q_x_ii
                       If Tabua_Servico[iIDADE][0].sNO_VARIAVEL[i] = 'q_x_ii' then
                          Tabua_Servico[iIDADE][0].fVL_CALCULO[i] := FieldByName('NR_Q_X').asFloat;
                    End;
                 End
                 //Tábua de Entrada em Invalidez.
                 Else If sTIPO_TABUA = 'EIN' then
                      Begin
                         For i := 1 to High(Tabua_Servico[iIDADE][0].sNO_VARIAVEL) do
                         Begin
                            //i_x
                            If Tabua_Servico[iIDADE][0].sNO_VARIAVEL[i] = 'i_x' then
                               Tabua_Servico[iIDADE][0].fVL_CALCULO[i] := FieldByName('NR_I_X').asFloat;
                         End;
                      End
                      //Tábua de Rotatividade.
                      Else If sTIPO_TABUA = 'ROT' then
                           Begin
                              For i := 1 to High(Tabua_Servico[iIDADE][0].sNO_VARIAVEL) do
                              Begin
                                 //w_x
                                 If Tabua_Servico[iIDADE][0].sNO_VARIAVEL[i] = 'w_x' then
                                    Tabua_Servico[iIDADE][0].fVL_CALCULO[i] := FieldByName('NR_P_X').asFloat;
                              End;
                           End;

            Next;
         End; //while
      End; //with
   Finally
      qry.Close;
      FreeAndNil(qry);
   End;
End;

procedure setConsultaTabua(var qry: TQuery);
begin
   with qry.SQL do
   begin
      Add('SELECT FI_TIPO_TABUA.IR_DOMINIO_SISTEMA AS SG_TIPO_TABUA,');
      Add('       FI_TABUA.SG_TABUA,');
      Add('       FI_OCORR_TABUA.NR_IDADE,');
      Add('       FI_OCORR_TABUA.NR_P_X,');
      Add('       FI_OCORR_TABUA.NR_Q_X,');
      Add('       FI_OCORR_TABUA.NR_I_X,');
      Add('       FI_OCORR_TABUA.NR_L_X');
      Add('FROM FI_TABUA, FI_TIPO_TABUA, FI_OCORR_TABUA');
      Add('WHERE FI_TABUA.CD_TIPO_TABUA = FI_TIPO_TABUA.CD_TIPO_TABUA');
      Add('  AND FI_TABUA.CD_TABUA = FI_OCORR_TABUA.CD_TABUA');
      Add('  AND FI_TABUA.CD_TABUA = :CD_TABUA');
      Add('ORDER BY FI_OCORR_TABUA.NR_IDADE');
   end; //with
end;

function getValorIdade(iIDADE: Integer; sVARIAVEL: String): Extended;
var
  i: Integer;
begin
  Result := 0;
  
  for i := 1 to High(Tabua_Servico[iIDADE][0].sNO_VARIAVEL) do
    if Tabua_Servico[iIDADE][0].sNO_VARIAVEL[i] = sVARIAVEL then
     begin
       Result := Tabua_Servico[iIDADE][0].fVL_CALCULO[i];
       Break;
     end;
end;

procedure setValorIdade(iIDADE: Integer; sVARIAVEL: String; fVL_VARIAVEL: Extended);
var
  i, j, iVariavel: Integer;
  bExisteVariavel: Boolean;
begin
  bExisteVariavel := False;
  iVariavel := -1;
  
  for i := iIDADE_MINIMA to High(Tabua_Servico) do
   for j := 1 to High(Tabua_Servico[i][0].sNO_VARIAVEL) do
    if Tabua_Servico[i][0].sNO_VARIAVEL[j] = sVARIAVEL then
     begin
       bExisteVariavel := True;

       if i = iIDADE then
        begin
          Tabua_Servico[i][0].fVL_CALCULO[j] := fVL_VARIAVEL;
          Break;
        end; //if  
     end; //if

  if not bExisteVariavel then
   begin
     for i := iIDADE_MINIMA to High(Tabua_Servico) do
      for j := 1 to High(Tabua_Servico[i][0].sNO_VARIAVEL) do
       begin
         if (iVariavel = -1) and (Trim(Tabua_Servico[i][0].sNO_VARIAVEL[j]) = '') then
           iVariavel := j;

         if iVariavel > 0 then
           Tabua_Servico[i][0].sNO_VARIAVEL[iVariavel] := sVARIAVEL;
       end; //for

     Tabua_Servico[iIDADE][0].fVL_CALCULO[iVariavel] := fVL_VARIAVEL;
   end; //if
end;

function getIDADE_MINIMA_PENSAO(iSQ_VERSAO: Integer): Integer;
var
  qry: TQuery;
begin
  Try
    qry := TQuery.Create(Nil);
    qry.DatabaseName := 'BaseDados';
    qry.SQL.Add('SELECT  MIN(NR_IDADE) AS MIN_IDADE FROM FI_OCOR_TABUA_COMUTACAO');
    qry.SQL.Add('WHERE SQ_VERSAO_COMUTACAO = ' + IntToStr(iSQ_VERSAO));
    qry.Open;

    Result := qry.FieldByName('MIN_IDADE').asInteger;
  Finally
    qry.Close;
    FreeAndNil(qry);
  End;
end;

function getIDADE_MAXIMA_PENSAO(iSQ_VERSAO: Integer): Integer;
var
  qry: TQuery;
begin
  Try
    qry := TQuery.Create(Nil);
    qry.DatabaseName := 'BaseDados';
    qry.SQL.Add('SELECT  MAX(NR_IDADE) AS MAX_IDADE FROM FI_OCOR_TABUA_COMUTACAO');
    qry.SQL.Add('WHERE SQ_VERSAO_COMUTACAO = ' + IntToStr(iSQ_VERSAO));
    qry.Open;

    Result := qry.FieldByName('MAX_IDADE').asInteger;
  Finally
    qry.Close;
    FreeAndNil(qry);
  End;
end;

procedure inicializaTabuaPensao(iSQ_VERSAO:Integer);
var
  i, j, iPENSAO: Integer;
  qry: TQuery;
begin
  Try
    //Inicializa o Tamanho da Matriz.
    iIDADE_MINIMA := getIDADE_MINIMA_PENSAO(iSQ_VERSAO);
    iIDADE_MAXIMA := getIDADE_MAXIMA_PENSAO(iSQ_VERSAO);

    SetLength(Tabua_Servico, iIDADE_MAXIMA + 1);

    for i := iIDADE_MINIMA to High(Tabua_Servico) do
     begin
       SetLength(Tabua_Servico[i], iIDADE_MAXIMA + 1);

       for iPENSAO := 0 to High(Tabua_Servico[i]) do
        begin
           SetLength(Tabua_Servico[i][iPENSAO].sNO_VARIAVEL, iIDADE_MAXIMA + 1);
           SetLength(Tabua_Servico[i][iPENSAO].fVL_CALCULO, iIDADE_MAXIMA + 1);
        end; //for
     end; //for


    qry := TQuery.Create(Nil);
    qry.DatabaseName := 'BaseDados';

    setConsultaTabuaPensao(qry);

    with qry do
     begin
       Close;
       ParamByName('SQ_VERSAO_COMUTACAO').asInteger := iSQ_VERSAO;
       Open;
       while not Eof do
        begin
          setValorIdadePensao(FieldByName('NR_IDADE').asInteger, FieldByName('NR_IDADE_PENSAO').asInteger,
             FieldByName('NO_VARIAVEL').asString, FieldByName('VL_FATOR_COMUTACAO').asFloat);

          Next;
        end; //while
     end; //with
  Finally
    qry.Close;
    FreeAndNil(qry);
  End;
end;

procedure setConsultaTabuaPensao(var qry: TQuery);
begin
  with qry.SQL do
   begin
     Add('SELECT SQ_VERSAO_COMUTACAO, NR_IDADE, NR_IDADE_PENSAO, NO_VARIAVEL, VL_FATOR_COMUTACAO');
     Add('FROM FI_OCOR_TABUA_COMUTACAO');
     Add('WHERE SQ_VERSAO_COMUTACAO = :SQ_VERSAO_COMUTACAO');
   end; //with
end;

procedure setValorIdadePensao(iIDADE, iIDADE_PENSAO: Integer; sVARIAVEL: String; fVL_VARIAVEL: Extended);
var
  i, j, iPENSAO, iVariavel: Integer;
  bExisteVariavel: Boolean;
begin
  bExisteVariavel := False;
  iVariavel := -1;

  for j := 1 to High(Tabua_Servico[iIDADE][iIDADE_PENSAO].sNO_VARIAVEL) do
   if Tabua_Servico[iIDADE][iIDADE_PENSAO].sNO_VARIAVEL[j] = sVARIAVEL then
    begin
      bExisteVariavel := True;

      Tabua_Servico[iIDADE][iIDADE_PENSAO].fVL_CALCULO[j] := fVL_VARIAVEL;
      Break;
    end; //if

  if not bExisteVariavel then
   begin
     for i := iIDADE_MINIMA to High(Tabua_Servico) do
      for iPENSAO := iIDADE_MINIMA to High(Tabua_Servico) do
       for j := 1 to High(Tabua_Servico[i][iPENSAO].sNO_VARIAVEL) do
        begin
          if (iVariavel = -1) and (Trim(Tabua_Servico[i][iPENSAO].sNO_VARIAVEL[j]) = '') then
            iVariavel := j;

          if iVariavel > 0 then
            Tabua_Servico[i][iPENSAO].sNO_VARIAVEL[iVariavel] := sVARIAVEL;
        end; //for

     Tabua_Servico[iIDADE][iIDADE_PENSAO].fVL_CALCULO[iVariavel] := fVL_VARIAVEL;
   end; //if
end;

function getValorIdadePensao(iIDADE, iIDADE_PENSAO: Integer; sVARIAVEL: String): Extended;
var
  i: Integer;
begin
  Result := 0;

  for i := 1 to High(Tabua_Servico[iIDADE][iIDADE_PENSAO].sNO_VARIAVEL) do
    if Tabua_Servico[iIDADE][iIDADE_PENSAO].sNO_VARIAVEL[i] = sVARIAVEL then
     begin
       Result := Tabua_Servico[iIDADE][iIDADE_PENSAO].fVL_CALCULO[i];
       Break;
     end;
end;

end.
