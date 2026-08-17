//******************************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 07/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Alteração en funções para inclusão de novos campos
//******************************************************************************************
Unit uCtrlDstAeroporto;

Interface

Uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
   uCtrlCustomRH, uDbDstAeroporto;

Type
   TCtrlDstAeroporto = Class(TCtrlCustomRH)
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
   Private
      FDb: TDbDstAeroporto;
      FCds: TCMClientDataSet;
   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Function ListDstAeroporto(IdDstAeroporto: double = 0): OleVariant;

      Function Gravar: boolean;

      Property Cds: TCMClientDataSet Read FCds Write FCds;
   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH;

Constructor TCtrlDstAeroporto.Create;
Begin
   Inherited;
   FDb := TDbDstAeroporto.Create(Self);
End;

Destructor TCtrlDstAeroporto.Destroy;
Begin
   FDb.Free;
   If (IsAppServer) Then
      FCds.Free;
   Inherited;
End;

Procedure TCtrlDstAeroporto.OnCreateAppServer;
Begin
   Inherited;
   FCds := TCMClientDataSet.Create(Nil);
End;

Procedure TCtrlDstAeroporto.DoChangeDataBase;
Begin
   Inherited;
   FDb.DataBaseName := DataBaseName;
End;

Function TCtrlDstAeroporto.ListDstAeroporto(IdDstAeroporto: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + IFF(IdDstAeroporto = -1, ' /*+ OPTIMIZER_MODE RULE */', '') + CR_LF +
      '  iddstaeroporto, nmedstaeroporto, idcidades' + CR_LF +
      'FROM' + CR_LF +
      '  DSTAEROPORTO' + CR_LF +
      IFF(IdDstAeroporto = -1, 'WHERE (1 = 2)',
      IFF(IdDstAeroporto = 0, 'ORDER BY' + CR_LF + '  nmedstaeroporto', 'WHERE' + CR_LF +
      '  (iddstaeroporto = ' + FloatToStr(IdDstAeroporto) + ')')));
End;

Function TCtrlDstAeroporto.Gravar: boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.Gravar(FCds.Data);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;
            Result := ApplyCds(FCds, FDb, [], []);
            If (Result) Then
               Commit
            Else
               Raise Exception.Create(FDb.MessageInfo);
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

End.

