unit uCtrlTalaoCheque;

interface

Uses classes, sysUtils, dbclient, uCmDbObject, uCmControlObject;

Type
 TValidaCheque = (vcOk, vcError, vcChequeMaior, vcNaoExiste);
  
 TCtrlCheque = Class(TCmControlObject)

 Private
    FCodPortador :LongInt;
    FNumCheque :Real;
    FValidaPrimeiroCheque :Boolean;
    FMostraMsg :Boolean;
    FVerificaChq :Boolean;
    FGravaNumChq :Boolean;
    FIdEmpresa: LongInt;
    procedure SetIdEmpresa(const Value: LongInt);
 Public
     Constructor Create; Override;
     Destructor Destroy; Override;

     Function ValidaNumCheque: TValidaCheque;
     Property ValidaPrimeiroCheque :Boolean Read FValidaPrimeiroCheque Write FValidaPrimeiroCheque;
     Property MostraMsg :Boolean Read FMostraMsg Write FMostraMsg;
     Property VerificaChq :Boolean Read FVerificaChq Write FVerificaChq;
     Property GravaNumChq :Boolean Read FGravaNumChq Write FGravaNumChq;
     Property CodPortador :LongInt Read FCodPortador Write FCodPortador;
     Property NumCheque :Real Read FNumCheque Write FNumCheque;
     Property IdEmpresa : LongInt read FIdEmpresa write SetIdEmpresa;
End;

Var
  CtrlCheque : TCtrlCheque;

implementation

constructor TCtrlCheque.Create;
begin
  inherited;
  FCodPortador := -1;
  FNumCheque := -1;
  FIdEmpresa := 0;
  FMostraMsg := True;
  FVerificaChq := False;
  FGravaNumChq := False;
  FValidaPrimeiroCheque := True;
end;

destructor TCtrlCheque.Destroy;
begin
  inherited;

end;

procedure TCtrlCheque.SetIdEmpresa(const Value: LongInt);
begin
  FIdEmpresa := Value;
end;

Function TCtrlCheque.ValidaNumCheque: TValidaCheque;
Begin
 Result := VcOk;

 If FVerificaChq Then
 Begin
    _Cds.Data := GetDataPacket('SELECT ' +
                               '   C.IDCHEQUES, C.NUMPROXIMOCHEQUE ' +
                               'FROM ' +
                               '   CHEQUES C, ' +
                               '   PORTADORCONTA PB ' +
                               'WHERE ' +
                               '   (PB.IDPESSOA   = ' + IntToStr(fIdEmpresa) + ')  AND ' +
                               '   (C.CODPORTADOR = ' + IntToStr(FCodPortador) + ')       AND ' +
                               '   (C.NUMCHEQUEINICIAL <= ' + FloatToStr(FNumCheque) + ') AND ' +
                               '   (C.NUMCHEQUEFINAL   >= ' + FloatToStr(FNumCheque) + ') AND ' +
                               '   (C.NUMPROXIMOCHEQUE <= ' + FloatToStr(FNumCheque) + ') AND ' +
                               '   (C.CODPORTADOR = PB.CODPORTADOR)');

    If Not _Cds.IsEmpty Then
    Begin
       If FValidaPrimeiroCheque And (_Cds.FieldByName('NUMPROXIMOCHEQUE').AsFloat < FNumCheque) Then
       Begin
         Result := vcChequeMaior;
         MessageInfo := 'O Número do Cheque informado é maior que o próximo cheque do talão. Confirma a numeração informada?';
         FValidaPrimeiroCheque := False;
       End;

       If Result = vcOk Then
       Begin
          If FGravaNumChq Then
          Begin
             If Not ExecSQL(' UPDATE CHEQUES SET NUMPROXIMOCHEQUE =  ' +
                               FloatToStr(FNumCheque + 1) +
                               ' WHERE IDCHEQUES = ' +
                               _Cds.FieldByName('IDCHEQUES').AsString) Then
             Begin
                 Result := vcError;
                 Abort;
             End;
          End;
       End;
    End
    Else
    Begin
      Result := vcNaoExiste;
      MessageInfo := 'O Número do cheque não pertence a nenhum talão cadastrado para esta conta ou já foi ultilizado';
    End;
 End;
End;

end.
