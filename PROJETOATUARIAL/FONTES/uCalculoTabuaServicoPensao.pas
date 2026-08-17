//***************************************************************************************|
//            FUNÇÕES AUXILIARES PARA O CÁLCULO DA TÁBUA DE SERVIÇO  - PENSÃO            |
//***************************************************************************************|
// Data        : 07-Nov-2005                                                             |
// Responsável : Rômulo Coriolano de Melo                                                |
// Alterações  :                                                                         |
//----------------------------------------------------------------------------------------
unit uCalculoTabuaServicoPensao;

interface

uses Dialogs, DBTables, SysUtils, Classes;

Type
  TTabuaServico = Record
    sNO_VARIAVEL: array of String;
    fVL_CALCULO: array of Extended;
    fVL_PENSAO: array of Extended;
  end;

function getIDADE_MINIMA(lstTabuas: TStringList): Integer;
function getIDADE_MAXIMA(lstTabuas: TStringList): Integer;
function getValorIdade(iIDADE: Integer; sVARIAVEL: String; bVL_PENSAO: Boolean = False): Extended;
procedure setValorIdade(iIDADE: Integer; sVARIAVEL: String; fVL_VARIAVEL: Extended; bVL_PENSAO: Boolean = False);
procedure inicializaTabuaServico(lstTabuas: TStringList);
procedure setTabuaServico(iCD_TABUA: Integer);
procedure setConsultaTabua(var qry: TQuery);

function getIDADE_MINIMA_PENSAO(iSQ_VERSAO: Integer): Integer;
function getIDADE_MAXIMA_PENSAO(iSQ_VERSAO: Integer): Integer;
function getValorIdadePensao(iIDADE, iIDADE_PENSAO: Integer; sVARIAVEL: String; bVL_PENSAO: Boolean = False): Extended;
procedure inicializaTabuaPensao(iSQ_VERSAO: Integer; bCriaMatriz: Boolean = True);
procedure setConsultaTabuaPensao(var qry: TQuery);
procedure setValorIdadePensao(iIDADE, iIDADE_PENSAO: Integer; sVARIAVEL: String; fVL_VARIAVEL: Extended;
  bVL_PENSAO: Boolean = False);
procedure inicializaTabuaCalculoPensao(iSQ_VERSAO: Integer);  

var
  iIDADE_MINIMA, iIDADE_MAXIMA: Integer;
  Tabua_Servico: array of array of TTabuaServico;
  
implementation

function getIDADE_MINIMA(lstTabuas: TStringList): Integer;
var qry: TQuery;
    i: Integer;
    sTabuas: String;
begin
   Try
      qry := TQuery.Create(Nil);
      qry.DatabaseName := 'BaseDados';
      qry.SQL.Add('SELECT MIN(NR_IDADE) AS MIN_IDADE FROM FI_OCORR_TABUA');

      sTabuas := '';

      For i := 0 to lstTabuas.Count - 1 do
         If sTabuas = '' then
            sTabuas := lstTabuas.Strings[i]
         Else
            sTabuas := sTabuas + ', ' + lstTabuas.Strings[i];

      If sTabuas <> '' then
         qry.SQL.Add('WHERE CD_TABUA IN (' + sTabuas + ')');

      qry.Open;

      Result := qry.FieldByName('MIN_IDADE').asInteger;
   Finally
      qry.Close;
      FreeAndNil(qry);
   End;
end;

function getIDADE_MAXIMA(lstTabuas: TStringList): Integer;
var i: Integer;
    qry: TQuery;
    sTabuas: String;
begin
   Try
      qry := TQuery.Create(Nil);
      qry.DatabaseName := 'BaseDados';
      qry.SQL.Add('SELECT MAX(NR_IDADE) AS MAX_IDADE FROM FI_OCORR_TABUA');

      sTabuas := '';
      For i := 0 to lstTabuas.Count - 1 do
         If sTabuas = '' then
            sTabuas := lstTabuas.Strings[i]
         Else
            sTabuas := sTabuas + ', ' + lstTabuas.Strings[i];

      If sTabuas <> '' then
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

   For i := iIDADE_MINIMA to High(Tabua_Servico) do
   Begin
      SetLength(Tabua_Servico[i], iIDADE_MAXIMA + 1);

      For iPENSAO := 0 to High(Tabua_Servico[i]) do
      Begin
         SetLength(Tabua_Servico[i][iPENSAO].sNO_VARIAVEL, iIDADE_MAXIMA + 1);
         SetLength(Tabua_Servico[i][iPENSAO].fVL_CALCULO, iIDADE_MAXIMA + 1);
         SetLength(Tabua_Servico[i][iPENSAO].fVL_PENSAO, iIDADE_MAXIMA + 1);
      End;

      For j := 1 to High(Tabua_Servico[i][0].sNO_VARIAVEL) do
      Begin
         Tabua_Servico[i][iIDADE_MINIMA].fVL_CALCULO[j] := 0;
         Tabua_Servico[i][iIDADE_MINIMA].fVL_PENSAO[j] := 0;

         Case j of
            1: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'p_x';
            2: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'q_x';
            3: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'q_x_ii';
            4: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'i_x';
            5: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'w_x';
            6: Tabua_Servico[i][0].sNO_VARIAVEL[j] := 'l_x';
         End; //case
      End; //for
   End; //for
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
end;

procedure setConsultaTabua(var qry: TQuery);
begin
   With qry.SQL do
   Begin
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
   End; //with
end;

function getValorIdade(iIDADE: Integer; sVARIAVEL: String; bVL_PENSAO: Boolean = False): Extended;
var i: Integer;
begin
   Result := 0;

   For i := 1 to High(Tabua_Servico[iIDADE][0].sNO_VARIAVEL) do
      If Tabua_Servico[iIDADE][0].sNO_VARIAVEL[i] = sVARIAVEL then
      Begin
         If bVL_PENSAO then
            Result := Tabua_Servico[iIDADE][0].fVL_CALCULO[i]
         Else
            Result := Tabua_Servico[iIDADE][0].fVL_PENSAO[i];

         Break;
      End;
end;

procedure setValorIdade(iIDADE: Integer; sVARIAVEL: String; fVL_VARIAVEL: Extended; bVL_PENSAO: Boolean = False);
var i, j, iVariavel: Integer;
    bExisteVariavel: Boolean;
begin
   bExisteVariavel := False;
   iVariavel := -1;

   For i := iIDADE_MINIMA to High(Tabua_Servico) do
      For j := 1 to High(Tabua_Servico[i][0].sNO_VARIAVEL) do
         If Tabua_Servico[i][0].sNO_VARIAVEL[j] = sVARIAVEL then
         Begin
            bExisteVariavel := True;

            If i = iIDADE then
            Begin
               If bVL_PENSAO then
                  Tabua_Servico[i][0].fVL_CALCULO[j] := fVL_VARIAVEL
               Else
                  Tabua_Servico[i][0].fVL_PENSAO[j] := fVL_VARIAVEL;

               Break;
            End; //if
         End; //if

   If not bExisteVariavel then
   Begin
      For i := iIDADE_MINIMA to High(Tabua_Servico) do
         For j := 1 to High(Tabua_Servico[i][0].sNO_VARIAVEL) do
         Begin
            If (iVariavel = -1) and (Trim(Tabua_Servico[i][0].sNO_VARIAVEL[j]) = '') then
               iVariavel := j;

            If iVariavel > 0 then
               Tabua_Servico[i][0].sNO_VARIAVEL[iVariavel] := sVARIAVEL;
         End; //for

      If bVL_PENSAO then
         Tabua_Servico[iIDADE][0].fVL_CALCULO[iVariavel] := fVL_VARIAVEL
      Else
         Tabua_Servico[iIDADE][0].fVL_PENSAO[iVariavel] := fVL_VARIAVEL;
   End; //if
end;

function getIDADE_MINIMA_PENSAO(iSQ_VERSAO: Integer): Integer;
var qry: TQuery;
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
var qry: TQuery;
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

procedure inicializaTabuaPensao(iSQ_VERSAO: Integer; bCriaMatriz: Boolean = True);
var i, j, iPENSAO: Integer;
    qry: TQuery;
begin
   Try
      //Inicializa o Tamanho da Matriz.
      If bCriaMatriz then
      Begin
         iIDADE_MINIMA := getIDADE_MINIMA_PENSAO(iSQ_VERSAO);
         iIDADE_MAXIMA := getIDADE_MAXIMA_PENSAO(iSQ_VERSAO);

         SetLength(Tabua_Servico, iIDADE_MAXIMA + 1);

         For i := iIDADE_MINIMA to High(Tabua_Servico) do
         Begin
            SetLength(Tabua_Servico[i], iIDADE_MAXIMA + 1);

            For iPENSAO := 0 to High(Tabua_Servico[i]) do
            Begin
               SetLength(Tabua_Servico[i][iPENSAO].sNO_VARIAVEL, iIDADE_MAXIMA + 1);
               SetLength(Tabua_Servico[i][iPENSAO].fVL_CALCULO, iIDADE_MAXIMA + 1);
               SetLength(Tabua_Servico[i][iPENSAO].fVL_PENSAO, iIDADE_MAXIMA + 1);
            End; //for
         End; //for
      End; //if

      qry := TQuery.Create(Nil);
      qry.DatabaseName := 'BaseDados';

      setConsultaTabuaPensao(qry);

      With qry do
      Begin
         Close;
         ParamByName('SQ_VERSAO_COMUTACAO').asInteger := iSQ_VERSAO;
         Open;
         While not Eof do
         Begin
            //Se for a 2º inicialização, atualiza os valores VL_PENSAO.
            setValorIdadePensao(FieldByName('NR_IDADE').asInteger, FieldByName('NR_IDADE_PENSAO').asInteger,
            FieldByName('NO_VARIAVEL').asString, FieldByName('VL_FATOR_COMUTACAO').asFloat, (not bCriaMatriz));

            Next;
         End; //while
      End; //with
   Finally
      qry.Close;
      FreeAndNil(qry);
   End;
end;

procedure setConsultaTabuaPensao(var qry: TQuery);
begin
   With qry.SQL do
   Begin
      Add('SELECT SQ_VERSAO_COMUTACAO, NR_IDADE, NR_IDADE_PENSAO, NO_VARIAVEL, VL_FATOR_COMUTACAO, VL_FATOR_PENSAO');
      Add('FROM FI_OCOR_TABUA_COMUTACAO');
      Add('WHERE SQ_VERSAO_COMUTACAO = :SQ_VERSAO_COMUTACAO');
   End; //with
end;

procedure setValorIdadePensao(iIDADE, iIDADE_PENSAO: Integer; sVARIAVEL: String; fVL_VARIAVEL: Extended;
  bVL_PENSAO: Boolean = False);
var i, j, iPENSAO, iVariavel: Integer;
    bExisteVariavel: Boolean;
begin
   bExisteVariavel := False;
   iVariavel := -1;

   For j := 1 to High(Tabua_Servico[iIDADE][iIDADE_PENSAO].sNO_VARIAVEL) do
      If Tabua_Servico[iIDADE][iIDADE_PENSAO].sNO_VARIAVEL[j] = sVARIAVEL then
      Begin
         bExisteVariavel := True;

         If bVL_PENSAO then
            Tabua_Servico[iIDADE][iIDADE_PENSAO].fVL_CALCULO[j] := fVL_VARIAVEL
         Else
            Tabua_Servico[iIDADE][iIDADE_PENSAO].fVL_PENSAO[j] := fVL_VARIAVEL;

         Break;
      End; //if

   If not bExisteVariavel then
   Begin
      For i := iIDADE_MINIMA to High(Tabua_Servico) do
         For iPENSAO := iIDADE_MINIMA to High(Tabua_Servico) do
            For j := 1 to High(Tabua_Servico[i][iPENSAO].sNO_VARIAVEL) do
            Begin
               If (iVariavel = -1) and (Trim(Tabua_Servico[i][iPENSAO].sNO_VARIAVEL[j]) = '') then
                  iVariavel := j;

               If iVariavel > 0 then
                  Tabua_Servico[i][iPENSAO].sNO_VARIAVEL[iVariavel] := sVARIAVEL;
            End; //for

      If bVL_PENSAO then
         Tabua_Servico[iIDADE][iIDADE_PENSAO].fVL_CALCULO[iVariavel] := fVL_VARIAVEL
      Else
         Tabua_Servico[iIDADE][iIDADE_PENSAO].fVL_PENSAO[iVariavel] := fVL_VARIAVEL;
   End; //if
end;

function getValorIdadePensao(iIDADE, iIDADE_PENSAO: Integer; sVARIAVEL: String; bVL_PENSAO: Boolean = False): Extended;
var i: Integer;
begin
   Result := 0;

   For i := 1 to High(Tabua_Servico[iIDADE][iIDADE_PENSAO].sNO_VARIAVEL) do
      If Tabua_Servico[iIDADE][iIDADE_PENSAO].sNO_VARIAVEL[i] = sVARIAVEL then
      Begin
         If bVL_PENSAO then
            Result := Tabua_Servico[iIDADE][iIDADE_PENSAO].fVL_CALCULO[i]
         Else
            Result := Tabua_Servico[iIDADE][iIDADE_PENSAO].fVL_PENSAO[i];

         Break;
      End;
end;

procedure inicializaTabuaCalculoPensao(iSQ_VERSAO: Integer);
var i, j, iPENSAO: Integer;
    qry: TQuery;
begin
   Try
      //Inicializa o Tamanho da Matriz.
      iIDADE_MINIMA := getIDADE_MINIMA_PENSAO(iSQ_VERSAO);
      iIDADE_MAXIMA := getIDADE_MAXIMA_PENSAO(iSQ_VERSAO);

      SetLength(Tabua_Servico, iIDADE_MAXIMA + 1);

      For i := iIDADE_MINIMA to High(Tabua_Servico) do
      Begin
         SetLength(Tabua_Servico[i], iIDADE_MAXIMA + 1);

         For iPENSAO := 0 to High(Tabua_Servico[i]) do
         Begin
            SetLength(Tabua_Servico[i][iPENSAO].sNO_VARIAVEL, iIDADE_MAXIMA + 1);
            SetLength(Tabua_Servico[i][iPENSAO].fVL_CALCULO, iIDADE_MAXIMA + 1);
            SetLength(Tabua_Servico[i][iPENSAO].fVL_PENSAO, iIDADE_MAXIMA + 1);
         End; //for
      End; //for

      qry := TQuery.Create(Nil);
      qry.DatabaseName := 'BaseDados';

      setConsultaTabuaPensao(qry);

      With qry do
      Begin
         Close;
         ParamByName('SQ_VERSAO_COMUTACAO').asInteger := iSQ_VERSAO;
         Open;

         While not Eof do
         Begin
            //Se for a 2º inicialização, atualiza os valores VL_PENSAO.
            setValorIdadePensao(FieldByName('NR_IDADE').asInteger, FieldByName('NR_IDADE_PENSAO').asInteger,
            FieldByName('NO_VARIAVEL').asString, FieldByName('VL_FATOR_COMUTACAO').asFloat, False);

            setValorIdadePensao(FieldByName('NR_IDADE').asInteger, FieldByName('NR_IDADE_PENSAO').asInteger,
            FieldByName('NO_VARIAVEL').asString, FieldByName('VL_FATOR_PENSAO').asFloat, True);

            Next;
         End; //while
      End; //with
   Finally
      qry.Close;
      FreeAndNil(qry);
   End;
end;

end.
