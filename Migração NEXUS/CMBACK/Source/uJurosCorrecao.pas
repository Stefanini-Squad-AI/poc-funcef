unit uJurosCorrecao;

interface

Uses Classes, Forms, SysUtils, uData, db, Math;

Type
  TJurosCorrecao = Class
  Private
     fCodDocumento    :LongInt;
     fDataCorrecao    :TDateTime;
     fAltJurosSimples, fAltJurosComposto, fAltCorrecao, fAltMulta: Integer;
     fpercjurosatuarial, fpercjurossimples, fvlrmulta, fpercCorrecao: Double;
     findicecorrecao: Integer;
     fLancaCorrecao : Boolean;
     Function  GetSaldoDoc: Double;
     Function  GetDataUltCorrecao: TDateTime;
     Procedure GetValoresCorrecao;
     procedure LancaAlteradores(rValor: Double;iCodAlterador: LongInt);
  Public
     Constructor Create;
     procedure CorrigeDocumento;
     Property  CodDocumento     :LongInt   read fCodDocumento     Write fCodDocumento;
     Property  DataCorrecao     :TDateTime read fDataCorrecao     Write fDataCorrecao;
End;

Var
  JurosCorrecao :TJurosCorrecao;

implementation

Uses uFuncaoGeral, DCmBack, uDataBase, uSistema, uDocumento, uIntegraBack;

Constructor TJurosCorrecao.Create;
Begin
  Inherited Create;
  If FazQuery(DtmCmBack.Qry,
              'SELECT FLGCORRIGEDOCAUTO, CODAltJurosSimples, CODAltJurosComposto, CODAltCorrecao, CODAltMulta FROM PARAMCAP WHERE IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' AND RECPAG = ''' + IntegraBack.RecPag + '''') Then
  Begin
    fAltJurosSimples   := DtmCmBack.Qry.FieldByName('CODAltJurosSimples').AsInteger;
    fAltJurosComposto  := DtmCmBack.Qry.FieldByName('CODAltJurosComposto').AsInteger;
    fAltCorrecao       := DtmCmBack.Qry.FieldByName('CODAltCorrecao').AsInteger;
    fAltMulta          := DtmCmBack.Qry.FieldByName('CODAltMulta').AsInteger;
    fLancaCorrecao     := DtmCmBack.Qry.FieldByName('FLGCORRIGEDOCAUTO').AsString = 'S';
  End
  Else
  Begin
    fAltJurosSimples   := 0;
    fAltJurosComposto  := 0;
    fAltCorrecao       := 0;
    fAltMulta          := 0;
    fLancaCorrecao     := false;
  End;
End;

function TJurosCorrecao.GetSaldoDoc: Double;
Begin
  If FazQuery(DtmCmBack.Qry,'SELECT ' +
          ' D.CODDOCUMENTO, ' +
          ' SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOR*-1,L.VALOR),DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))) AS SALDO ' +
          'FROM ' +
          ' DOCUMENTO D, LANCTODOCUM L ' +
          'WHERE ' +
          ' (D.CODDOCUMENTO =  ' + IntToStr(fCodDocumento) + ') AND ' +
          ' (((L.CODALTERADOR <> ' + IntToStr(fAltJurosSimples) + ') AND ' +
          ' (L.CODALTERADOR <> ' + IntToStr(fAltMulta) + ')) OR ' +
          ' (L.CODALTERADOR IS NULL)) AND ' +
          ' (D.CODDOCUMENTO = L.CODDOCUMENTO) ' +
          'GROUP BY ' +
          ' D.CODDOCUMENTO') Then
    result := DtmCmBack.Qry.FieldByName('SALDO').AsFloat
  Else
    result := 0;
End;

Function TJurosCorrecao.GetDataUltCorrecao: TDateTime;
Begin
  If FazQuery(DtmCmBack.Qry,'SELECT ' +
              ' DATACORRECAO, DATAPROGRAMADA ' +
              'FROM ' +
              ' DOCUMENTO ' +
              'WHERE ' +
              ' (CODDOCUMENTO = ' + IntToStr(fCodDocumento) + ')') Then
              Begin
                If DtmCmBack.Qry.FieldByName('DATACORRECAO').IsNull Then
                   Result := DtmCmBack.Qry.FieldByName('DATAPROGRAMADA').AsDateTime + 1
                Else
                   Result := DtmCmBack.Qry.FieldByName('DATACORRECAO').AsDateTime + 1;
              End
              Else
              Begin
                Result := Date;
                Abort;
              End;
End;

Procedure TJurosCorrecao.GetValoresCorrecao;
Var
  sPercValor: String;
  fpercUltCorrecao: Double;
  dDataRef:TDateTime;
Begin
  If FazQuery(DtmCmBack.Qry,'SELECT ' +
                               ' PERCJUROSATUARIAL, PERCJUROSSIMPLES, VLRMULTA, INDICECORRECAO ' +
                               'FROM ' +
                               ' DOCUMENTO ' +
                               'WHERE ' +
                               ' CODDOCUMENTO = ' + IntToStr(fCodDocumento)) Then
  Begin
     fpercjurosatuarial := DtmCmBack.Qry.FieldByName('PERCJUROSATUARIAL').AsFloat;
     fpercjurossimples  := DtmCmBack.Qry.FieldByName('PERCJUROSSIMPLES').AsFloat;
     fvlrmulta          := DtmCmBack.Qry.FieldByName('VLRMULTA').AsFloat;
     findicecorrecao    := DtmCmBack.Qry.FieldByName('INDICECORRECAO').AsInteger;
  End
  Else
  Begin
     fpercjurosatuarial := 0;
     fpercjurossimples  := 0;
     fvlrmulta          := 0;
     findicecorrecao    := 0;
  End;

  If (findicecorrecao <> 0) Then
  Begin
    FazQuery(DtmCmBack.Qry,'SELECT FLGPERCVALOR FROM MOEDA WHERE MOECODIGO = ' + intToStr(findicecorrecao));
    sPercValor    := DtmCmBack.Qry.FieldByName('FLGPERCVALOR').AsString;
    fpercCorrecao := FuncaoGeral.TestaCotacaoMoeda(fIndiceCorrecao,DateToStr(fDataCorrecao),'N');
    If fpercCorrecao = 0 Then Abort;

    If sPercValor = 'V' Then
    Begin
       dDataRef := StrToDate('01'+Copy(DateToStr(fDataCorrecao),3,8))-15;
       dDataRef := UltimoDiaMes(dDataRef);
       fpercUltCorrecao := FuncaoGeral.TestaCotacaoMoeda(fIndiceCorrecao,DateToStr(dDataRef),'N');
       If fpercUltCorrecao = 0 Then Abort;
       fpercCorrecao    := ((fpercCorrecao/fpercUltCorrecao) - 1)*100;
    End;
  End
  Else
    fpercCorrecao := 0;
End;

procedure TJurosCorrecao.CorrigeDocumento;
Var
  DataultCorrecao, dUltimaCorrecao, dDataFinal: TDateTime;
  iAnoCor, iMesCor, iDiaCor, iAnoUltCor, iMesUltCor, iDiaUltCor,
  iAno, iMes, iDia: Word;
  iNumDias, iNumDiasMes, iNumCorrecoes, X: Integer;
  rValorCorrecao, rValorJurosAtuarial, rValorJurosSimples, rSaldoDoc, rvlrmulta, rvalor: Double;
  bLancaCorrecao: Boolean;
Begin
  DataultCorrecao := GetDataUltCorrecao;
  DecodeDate(fDataCorrecao,iAnoCor, iMesCor, iDiaCor);
  DecodeDate(DataultCorrecao,iAnoUltCor, iMesUltCor, iDiaUltCor);

  rValorCorrecao      := 0;
  rValorJurosAtuarial := 0;
  rValorJurosSimples  := 0;
  rvlrmulta           := 0;
  rSaldoDoc           := GetSaldoDoc;

  bLancaCorrecao := (fLancaCorrecao And  (fDataCorrecao > DataultCorrecao));

  If bLancaCorrecao then
  Begin
     If (iAnoCor = iAnoUltCor) And (iMesCor = iMesUltCor)  Then
     Begin
        DecodeDate(UltimoDiaMes(fDataCorrecao),iAno, iMes, iDia);
        iNumDiasMes := iDia;
        iNumDias    := Round(fDataCorrecao - GetDataUltCorrecao) + 1;

        GetValoresCorrecao;

        If fpercCorrecao <> 0 Then
           rValorCorrecao      := rSaldoDoc * Power(( 1 + (fpercCorrecao/100)),(iNumDias/iNumDiasMes)) - rSaldoDoc;

        rSaldoDoc := rSaldoDoc + rValorCorrecao;

        If fpercjurosatuarial <> 0 Then
           rValorJurosAtuarial := rSaldoDoc * Power(( 1 + (fpercjurosatuarial/100)),(iNumDias/iNumDiasMes)) - rSaldoDoc;

        rSaldoDoc := rSaldoDoc + rValorJurosAtuarial;

        If fpercjurossimples <> 0 Then
           rValorJurosSimples  := (rSaldoDoc * ((iNumDias/iNumDiasMes) * (fpercjurossimples/100)));

        If fvlrmulta <> 0 Then
           LancaAlteradores(fVlrMulta,fAltMulta);

        If rValorCorrecao <> 0 Then
           LancaAlteradores(rValorCorrecao,fAltCorrecao);

        If rValorJurosAtuarial <> 0 Then
           LancaAlteradores(rValorJurosAtuarial,fAltJurosComposto);

        If rValorJurosSimples <> 0 Then
           LancaAlteradores(rValorJurosSimples,fAltJurosSimples);
     End
     Else
     Begin
        iNumCorrecoes   := iMesCor - iMesUltCor + ((iAnoCor - iAnoUltCor)*12);
        dUltimaCorrecao := GetDataUltCorrecao;
        dDataFinal      := fDataCorrecao;

        For X:=0 To iNumCorrecoes Do
        Begin
           If X = iNumCorrecoes Then
             fDataCorrecao := dDataFinal
           Else
             fDataCorrecao := UltimoDiaMes(dUltimaCorrecao);

           DecodeDate(UltimoDiaMes(fDataCorrecao),iAno, iMes, iDia);
           iNumDiasMes := iDia;
           iNumDias    := Round(fDataCorrecao - dUltimaCorrecao) + 1;

           GetValoresCorrecao;

           dUltimaCorrecao := fDataCorrecao + 1;

           rValor := 0;
           If fpercCorrecao <> 0 Then
           Begin
              rValor         := rSaldoDoc * Power(( 1 + (fpercCorrecao/100)),(iNumDias/iNumDiasMes)) - rSaldoDoc;
              rValorCorrecao := rValorCorrecao + rValor;
           End;

           rSaldoDoc := rSaldoDoc + rValor;

           rValor := 0;
           If fpercjurosatuarial <> 0 Then
           Begin
              rValor              := rSaldoDoc * Power(( 1 + (fpercjurosatuarial/100)),(iNumDias/iNumDiasMes)) - rSaldoDoc;
              rValorJurosAtuarial := rValorJurosAtuarial + rvalor;
           End;

           rSaldoDoc := rSaldoDoc + rValor;

           If fpercjurossimples <> 0 Then
              rValorJurosSimples  := rValorJurosSimples + (rSaldoDoc * ((iNumDias/iNumDiasMes) * (fpercjurossimples/100)));

           rvlrmulta := rvlrmulta + fvlrmulta;
        End;

        If rvlrmulta <> 0 Then
           LancaAlteradores(rvlrmulta,fAltMulta);

        If rValorCorrecao <> 0 Then
           LancaAlteradores(rValorCorrecao,fAltCorrecao);

        If rValorJurosAtuarial <> 0 Then
           LancaAlteradores(rValorJurosAtuarial,fAltJurosComposto);

        If rValorJurosSimples <> 0 Then
           LancaAlteradores(rValorJurosSimples,fAltJurosSimples);
     End;

     If Not ExecutarQuery(DtmCmBack.Qry,'UPDATE DOCUMENTO SET DATACORRECAO = TO_DATE(''' + DateToStr(fDataCorrecao) + ''',''DD/MM/YYYY'') WHERE CODDOCUMENTO = ' + IntToStr(fCodDocumento)) Then Abort;
  End;
End;

procedure TJurosCorrecao.LancaAlteradores(rValor: Double;iCodAlterador: LongInt);
Var
 sDebCre: String;
 iNumLancto, liPlanilha: LongInt;
Begin
  If iCodAlterador <> 0 Then
  Begin
     iNumLancto := Documento.GerarNumLancto(nil,fCodDocumento);

     liPlanilha := 0;
     sDebCre    := FuncaoGeral.Decode(IntegraBack.RecPag,'P','C','D');

     If rValor < 0 Then
     Begin
        rvalor := Abs(rvalor);
        If sDebCre = 'D' Then
           sDebCre := 'C'
        Else
           sDebCre := 'D';
     End;

     Documento.CriarLanctoDoc(DtmCmBack.Qry,
                              fCodDocumento,
                              iNumLancto,
                              iCodAlterador,
                              liPlanilha,
                              DateToStr(fDataCorrecao),
                              rValor,
                              0,
                              -1,
                              sDebCre,
                              '4',
                              '',
                              Sistema.idUsuario,
                              (IntegraBack.Contabilidade = 'S'),
                              -1,
                              '');
  End;
End;

end.
