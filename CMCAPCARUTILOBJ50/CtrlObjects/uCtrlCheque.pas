unit uCtrlCheque;

interface

Uses SysUtils, Dialogs, Controls;

Type
 TCtrlCheque = Class

 Private
     FCodPortador          :LongInt;
     FNumCheque            :Real;
     FValidaPrimeiroCheque :Boolean;
     FMostraMsg            :Boolean;
     FVerificaChq          :Boolean;
     FGravaNumChq          :Boolean;
 Public
     Constructor Create;
     Function ValidaNumCheque: Boolean;

     Property ValidaPrimeiroCheque :Boolean Read FValidaPrimeiroCheque Write FValidaPrimeiroCheque;
     Property MostraMsg            :Boolean Read FMostraMsg            Write FMostraMsg;
     Property VerificaChq          :Boolean Read FVerificaChq          Write FVerificaChq;
     Property GravaNumChq          :Boolean Read FGravaNumChq          Write FGravaNumChq;
     Property CodPortador          :LongInt Read FCodPortador          Write FCodPortador;
     Property NumCheque            :Real    Read FNumCheque            Write FNumCheque;
End;

Var
  CtrlCheque : TCtrlCheque;

implementation

Uses uSistema, uDataBase, DBaseDados, uMensErro;

Constructor TCtrlCheque.Create;
Begin
  Inherited Create;
  FCodPortador          := -1;
  FNumCheque            := -1;
  FMostraMsg            := True;
  FVerificaChq          := False;
  FGravaNumChq          := False;
  FValidaPrimeiroCheque := True;
End;

Function TCtrlCheque.ValidaNumCheque: Boolean;
Begin
 If FVerificaChq Then
 Begin
  If FazQuery(DtmBaseDados.Qry,'SELECT ' +
                               '   C.IDCHEQUES, C.NUMPROXIMOCHEQUE ' +
                               'FROM ' +
                               '   CHEQUES C, ' +
                               '   PORTADORCONTA PB ' +
                               'WHERE ' +
                               '   (PB.IDPESSOA   = ' + IntToStr(Sistema.IdEmpresa) + ')  AND ' +
                               '   (C.CODPORTADOR = ' + IntToStr(FCodPortador) + ')       AND ' +
                               '   (C.NUMCHEQUEINICIAL <= ' + FloatToStr(FNumCheque) + ') AND ' +
                               '   (C.NUMCHEQUEFINAL   >= ' + FloatToStr(FNumCheque) + ') AND ' +
                               '   (C.NUMPROXIMOCHEQUE <= ' + FloatToStr(FNumCheque) + ') AND ' +
                               '   (C.CODPORTADOR = PB.CODPORTADOR)') Then
  Begin
     If (DtmBaseDados.Qry.FieldByName('NUMPROXIMOCHEQUE').AsFloat < FNumCheque) And FValidaPrimeiroCheque Then
     Begin
       Result := (MsgDlg('O Número do Cheque informado é maior que o próximo cheque do talão. Confirma a numeração informada?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes);
       FValidaPrimeiroCheque := False;
     End
     Else
       Result := True;

     If Result Then
     Begin
        If FGravaNumChq Then
        Begin
           If ExecutarQuery(DtmBaseDados.Qry,
                            'UPDATE CHEQUES SET NUMPROXIMOCHEQUE =  ' +
                            FloatToStr(FNumCheque + 1) +
                            ' WHERE IDCHEQUES = ' +
                            DtmBaseDados.Qry.FieldByName('IDCHEQUES').AsString) Then
             Result := True
           Else
           Begin
               MsgDlg('Erro ao atualizar Controle de cheques','Erro',mtError,[mbOk],0);
               Result := False;
               Abort;
           End;
        End
        Else
          Result := True;
     End;
  End
  Else
  Begin
    Result := False;
    If FMostraMsg Then
       MsgDlg('O Número do cheque não pertence a nenhum talão cadastrado para esta conta ou já foi ultilizado','Erro',mtError,[mbOk],0);
  End;
 End
 Else
  Result := True;
End;

end.
