{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 03/06/2003                                 }
{                                                       }
{*******************************************************}


// **************************************************************************************************
//Rotina..........: uCtrlCustomProcTrab
//N. Sol..........: 156018
//N. Kintana......: 1225602
//Data............: 04/07/2011
//Responsável.....: Paulo Nobre / Otacilio
//Descrição.......: Implementação de SP para Honorários Periciais. 
// **************************************************************************************************

Unit uCtrlCustomProcTrab;

Interface

Uses Controls, SysUtils, Db, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
   uCtrlCustomRH, uCtrlFuncoesRH, uCtrlRegra, math, Wwquery, UDataBase, DBTables,
   Wwdatsrc, DBCtrls, wwdbedit;

Type
   TCtrlCustomProcTrab = Class(TCtrlCustomRH)
   Protected
      Procedure AfterInitialize; Override;
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
   Private
      FCtrlRegra: TCtrlRegra;

      FIdEmpresa: integer;
      FTipoEmpresa: String;

      Function ExecRegra(IdRegra: double; Dados: OleVariant): double;
   Public
      Constructor Create(IdEmpresa: integer; TipoEmpresa: String); Reintroduce;
      Destructor Destroy; Override;

      Function GetDataHist(Campo: TField): TDateTime;

      Function GetValorAtual(ValHist: double; DataHist: TDate; MoeCodigo: integer;
         IdRegra: double; NumProcTrab: double; TipoCalc: integer): double;

      Function GetValorPeriodo(ValHist: double; DataHist1, DataHist2: TDate; MoeCodigo: integer;
         IdRegra: double; NumProcTrab: double; TipoCalc: integer): double;

      Procedure GetValorPeriodoObj(ValHist: double; DataHist1, DataHist2: TDate;
         MoeCodigo: integer; IdRegra: double; NumProcTrab: double; TipoCalc: integer; Var resultado: double);  
   End;

Implementation

Uses uCMTypes, uTiposRegraMT;

{ TCtrlCustomProcTrab }

Constructor TCtrlCustomProcTrab.Create(IdEmpresa: integer; TipoEmpresa: String);
Begin
   Inherited Create;
   FIdEmpresa := IdEmpresa;
   FTipoEmpresa := TipoEmpresa;

   FCtrlRegra := TCtrlRegra.Create;
End;

Destructor TCtrlCustomProcTrab.Destroy;
Begin
   FreeAndNil(FCtrlRegra);
   Inherited;
End;

Procedure TCtrlCustomProcTrab.AfterInitialize;
Begin
   Inherited;
   FCtrlRegra.InitializeAs(Self);
End;

Procedure TCtrlCustomProcTrab.OnCreateAppServer;
Begin
   Inherited;
End;

Procedure TCtrlCustomProcTrab.DoChangeDataBase;
Begin
   Inherited;
   FCtrlRegra.DataBase := DataBase;
End;

Function TCtrlCustomProcTrab.ExecRegra(IdRegra: double; Dados: OleVariant): double;
Begin
   Try
      FCtrlRegra.RuleNumber := FloatToStr(IdRegra);
      FCtrlRegra.IdEmpresa := FIdEmpresa;
      FCtrlRegra.GravaCalculo := false;
      FCtrlRegra.ReloadRule := false;

      If (FTipoEmpresa = 'P') Then
         FCtrlRegra.TipoCliente := tcFundacao
      Else
         FCtrlRegra.TipoCliente := tcOutros;

      FCtrlRegra.PassoaPasso := false;
      //FCtrlRegra.CopiaDataSet(Dados); // Hotal
      FCtrlRegra.CopiaData(Dados); // TotalPrev
      FCtrlRegra.Execute;

      If Not (FCtrlRegra.Error) Then
         Result := StrToFloat(OraNumero(FCtrlRegra.Result))
      Else
         Raise Exception.Create(FCtrlRegra.MessageInfo);
   Except
      On E: Exception Do
         Begin
            Result := 0;
            MessageInfo := E.Message;
         End;
   End;
End;

Function TCtrlCustomProcTrab.GetValorAtual(ValHist: double; DataHist: TDate;
   MoeCodigo: integer; IdRegra: double; NumProcTrab: double; TipoCalc: integer): double;
Var
   //_CdsAux: TCMClientDataSet;
   _CdsAux: TwwQuery;
   {sSQL, }sPercValor: String;
   //bErroRegra: boolean;
Begin
   // Criar query temporária
   Result := ValHist;
   If (DataHist = 0) Or (TipoCalc = 2) Then
      exit;

   Try
      //_CdsAux := TCMClientDataSet.Create(nil);
      _CdsAux := TwwQuery.Create(Nil);
      _CdsAux.DatabaseName := 'BaseDados';

      If (TipoCalc = 0) And (MoeCodigo > 0) Then
         Begin
            //_CdsAux.Data := GetdataPacket(
            _CdsAux.Sql.Text := (
               'SELECT FLGPERCVALOR' + CR_LF +
               'FROM   MOEDA' + CR_LF +
               'WHERE  (MOECODIGO = ' + IntToStr(MoeCodigo) + ')'
               );
            _CdsAux.Open;
            sPercValor := _CdsAux.FieldByName('FLGPERCVALOR').asString;

            If (sPercValor = 'V') Then
               //_CdsAux.Data := GetdataPacket(
               _CdsAux.Sql.Text := (
                  'SELECT COTVALOR, DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM) AS COTDATA' + CR_LF +
                  'FROM   COTACAOMOEDA' + CR_LF +
                  'WHERE  (MOECODIGO = ' + IntToStr(MoeCodigo) + ') AND' + CR_LF +
                  '       (DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM) <= TO_DATE(' + QuotedStr(DateToStr(DataHist)) + ',''DD/MM/YYYY''))' + CR_LF +
                  'ORDER BY' + CR_LF +
                  '  COTDATA DESC')
            Else
               //_CdsAux.Data := GetdataPacket(
               _CdsAux.Sql.Text := (
                  'SELECT COTVALOR, DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM) AS COTDATA' + CR_LF +
                  'FROM   COTACAOMOEDA' + CR_LF +
                  'WHERE  (MOECODIGO = ' + IntToStr(MoeCodigo) + ') AND' + CR_LF +
                  '       (DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM) >= TO_DATE(' + QuotedStr(DateToStr(DataHist)) + ',''DD/MM/YYYY'')) AND' + CR_LF +
                  '       (DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM)  <= SYSDATE)' + CR_LF +
                  //RANIERE 13/12/2004 (COTDATA BETWEEN TO_DATE(' +QuotedStr(DateToStr(DataHist))+ ',''DD/MM/YYYY'')) AND SYSDATE)' +CR_LF+
                  'ORDER BY' + CR_LF +
                  '  COTDATA');

            _CdsAux.Open;
            If Not (_CdsAux.IsEmpty) Then
               Begin
                  If (sPercValor = 'V') Then
                     Result := ValHist * _CdsAux.FieldByName('COTVALOR').asFloat
                  Else
                     Begin
                        While Not (_CdsAux.EOF) Do
                           Begin
                              Result := Result + Result * _CdsAux.FieldByName('COTVALOR').asFloat / 100;
                              _CdsAux.Next;
                           End;
                     End;
               End;
         End;

      If (TipoCalc = 1) And (IdRegra > 0) Then
         Begin
            //_CdsAux.Data := GetdataPacket(
            _CdsAux.Sql.Text := (
               'SELECT P.*, (' + OraNumero(FloatToStr(ValHist)) + ') AS VALORHIST' + CR_LF +
               'FROM   PROCESSOTRAB P ' + CR_LF +
               'WHERE  (P.NUMPROCTRAB = ' + FloatToStr(NumProcTrab) + ')');
            _CdsAux.Open;
            // Result := ExecRegra(IdRegra, _CdsAux.Data); ???? O QUE FAZER AQUI ??
         End;
   Finally
      If Assigned(_CdsAux) Then
         _CdsAux.Free;
   End;
End;

Procedure TCtrlCustomProcTrab.GetValorPeriodoObj(ValHist: double; DataHist1, DataHist2: TDate;
   MoeCodigo: integer; IdRegra: double; NumProcTrab: double; TipoCalc: integer; Var resultado: double);
Begin
  Resultado := GetValorPeriodo(ValHist,DataHist1, DataHist2, MoeCodigo, IdRegra, NumProcTrab,TipoCalc);
End;

Function TCtrlCustomProcTrab.GetValorPeriodo(ValHist: double; DataHist1, DataHist2: TDate;
   MoeCodigo: integer; IdRegra: double; NumProcTrab: double; TipoCalc: integer): double;
Var
    
   _CdsAuxiliar1: Twwquery;
   sPercValor, sPeriodo: String;
   dTaxa1, dTaxa2, dFator: double;
   iConta: integer;
Begin
   Result := ValHist;
   If ((DataHist1 = 0) And (DataHist2 = 0)) Or (TipoCalc = 2) Then
      exit;
   Try
      
      _CdsAuxiliar1 := Twwquery.Create(Nil);
      _CdsAuxiliar1.DataBaseName := 'BaseDados';

      If (TipoCalc = 0) And (MoeCodigo > 0) Then
         Begin
            
            _CdsAuxiliar1.Close;
            _CdsAuxiliar1.SQL.Clear;
            _CdsAuxiliar1.SQL.Add('SELECT FLGPERCVALOR, MOEPERIODICIDADE');
            _CdsAuxiliar1.SQL.Add('FROM MOEDA');
            _CdsAuxiliar1.SQL.Add('WHERE (MOECODIGO = ' + IntToStr(MoeCodigo) + ')');
            _CdsAuxiliar1.Open;

            sPercValor := _CdsAuxiliar1.FieldByName('FLGPERCVALOR').asString;
            sPeriodo := _CdsAuxiliar1.FieldByName('MOEPERIODICIDADE').asString;

            If (sPercValor = 'V') Then
               Begin
                  
                  _CdsAuxiliar1.Close;
                  _CdsAuxiliar1.SQL.Clear;
                  _CdsAuxiliar1.SQL.Add('SELECT COTVALOR, DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM) AS COTDATA ');
                  _CdsAuxiliar1.SQL.Add('FROM   COTACAOMOEDA ');
                  _CdsAuxiliar1.SQL.Add('WHERE  (MOECODIGO = ' + IntToStr(MoeCodigo) + ') AND ');
                  _CdsAuxiliar1.SQL.Add('       (DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM) <= TO_DATE(' + QuotedStr(DateToStr(DataHist1)) + ',''DD/MM/YYYY''))');
                  _CdsAuxiliar1.SQL.Add('ORDER BY COTDATA DESC ');
                  _CdsAuxiliar1.Open;

                  dTaxa1 := _CdsAuxiliar1.FieldByName('COTVALOR').asFloat;

                  
                  _CdsAuxiliar1.Close;
                  _CdsAuxiliar1.SQL.Clear;
                  _CdsAuxiliar1.SQL.Add('SELECT COTVALOR, DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM) AS COTDATA ');
                  _CdsAuxiliar1.SQL.Add('FROM   COTACAOMOEDA ');
                  _CdsAuxiliar1.SQL.Add('WHERE  (MOECODIGO = ' + IntToStr(MoeCodigo) + ') AND ');
                  _CdsAuxiliar1.SQL.Add('       (DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM) <= TO_DATE(' + QuotedStr(DateToStr(DataHist2)) + ',''DD/MM/YYYY'')) ');
                  _CdsAuxiliar1.SQL.Add('ORDER BY COTDATA DESC   ');
                  _CdsAuxiliar1.Open;

                  dTaxa2 := _CdsAuxiliar1.FieldByName('COTVALOR').asFloat;
               End
            Else
               Begin
                  
                  _CdsAuxiliar1.Close;
                  _CdsAuxiliar1.SQL.Clear;
                  _CdsAuxiliar1.SQL.Add('SELECT COTVALOR, DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM) AS COTDATA ');
                  _CdsAuxiliar1.SQL.Add('FROM   COTACAOMOEDA ');
                  _CdsAuxiliar1.SQL.Add('WHERE  (MOECODIGO = ' + IntToStr(MoeCodigo) + ') AND ');
                  _CdsAuxiliar1.SQL.Add('       (DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM) >= TO_DATE(' + QuotedStr(DateToStr(DataHist1)) + ',''DD/MM/YYYY'')) AND ');
                  _CdsAuxiliar1.SQL.Add('       (DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM) <= TO_DATE(' + QuotedStr(DateToStr(DataHist2)) + ',''DD/MM/YYYY'')) ');
                  _CdsAuxiliar1.SQL.Add('ORDER BY COTDATA ');
                  _CdsAuxiliar1.Open;

                  If Not (_CdsAuxiliar1.IsEmpty) Then
                     Begin
                        If (sPercValor = 'V') Then
                           Result := ValHist * (1 + dTaxa1 - dTaxa2)
                        Else
                           Begin
                              iConta := 0;
                              While Not (_CdsAuxiliar1.EOF) Do
                                 Begin
                                    inc(iConta);
                                    dFator := _CdsAuxiliar1.FieldByName('COTVALOR').asFloat / 100;
                                    If (iConta = 1) Then
                                       Begin
                                          If (sPeriodo = 'M') Then
                                             dFator := power((1 + _CdsAuxiliar1.FieldByName('COTVALOR').asFloat / 100),
                                                min(_CdsAuxiliar1.FieldByName('COTDATA').asDateTime - DataHist1, 31) /
                                                min(31, TrazUltDiaMes(ExtraiMes(_CdsAuxiliar1.FieldByName('COTDATA').asDateTime),
                                                ExtraiAno(_CdsAuxiliar1.FieldByName('COTDATA').asDateTime)))) - 1
                                          Else If (sPeriodo = 'T') Then
                                             dFator := power((1 + _CdsAuxiliar1.FieldByName('COTVALOR').asFloat / 100),
                                                min(_CdsAuxiliar1.FieldByName('COTDATA').asDateTime - DataHist1, 90) / 90) - 1
                                          Else If (sPeriodo = 'S') Then
                                             dFator := power((1 + _CdsAuxiliar1.FieldByName('COTVALOR').asFloat / 100),
                                                min(_CdsAuxiliar1.FieldByName('COTDATA').asDateTime - DataHist1, 180) / 180) - 1
                                          Else If (sPeriodo = 'A') Then
                                             dFator := power((1 + _CdsAuxiliar1.FieldByName('COTVALOR').asFloat / 100),
                                                min(_CdsAuxiliar1.FieldByName('COTDATA').asDateTime - DataHist1, 365) / 365) - 1
                                          Else // (sPeriodo = 'D')
                                             dFator := _CdsAuxiliar1.FieldByName('COTVALOR').asFloat / 100;
                                       End;
                                    Result := Result + (Result * dFator);
                                    _CdsAuxiliar1.Next;
                                 End;
                           End;
                     End;
               End;
         End;
   //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
   Finally
      If Assigned(_CdsAuxiliar1) Then
         _CdsAuxiliar1.Free;
   End;
End;

Function TCtrlCustomProcTrab.GetDataHist(Campo: TField): TDateTime;
Begin
   If (TDateField(Campo).asString = '') Then
      Result := 0
   Else
      Result := StrToDate(Copy(TDateField(Campo).asString, 1, Length(ShortDateFormat)));
End;

End.

