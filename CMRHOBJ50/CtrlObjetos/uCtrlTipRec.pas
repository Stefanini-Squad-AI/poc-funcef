{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/02/2002                                 }
{                                                       }
{*******************************************************}

// **************************************************************************************************
//Rotina..........: uCtrlTipRec
//N. Sol..........: 156018
//N. Kintana......: 1225602
//Data............: 04/07/2011
//Responsável.....: Paulo Nobre / Otacilio
//Descrição.......: Implementação de SP para Honorários Periciais.
// **************************************************************************************************

Unit uCtrlTipRec;

Interface

Uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
   uCtrlCustomRH, uDbTipoRecTrab;

Type
   TCtrlTipRec = Class(TCtrlCustomRH)
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
   Private
      FDbTipRec: TDbTipoRecTrab;
      FCdsTipRec: TCMClientDataSet;
   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Function ListTipRec(CodTipoRecurso: double = 0): OleVariant;
      Function ListTipRecGrupo(CodTipoRecursos: String): OleVariant;

      Function GravarTipRec: boolean;

      Property CdsTipRec: TCMClientDataSet Read FCdsTipRec Write FCdsTipRec;
   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipRec }

Constructor TCtrlTipRec.Create;
Begin
   Inherited;
   FDbTipRec := TDbTipoRecTrab.Create(Self);
End;

Destructor TCtrlTipRec.Destroy;
Begin
   FDbTipRec.Free;
   If (IsAppServer) Then
      FCdsTipRec.Free;
   Inherited;
End;

Procedure TCtrlTipRec.OnCreateAppServer;
Begin
   Inherited;
   FCdsTipRec := TCMClientDataSet.Create(Nil);
End;

Procedure TCtrlTipRec.DoChangeDataBase;
Begin
   Inherited;
   FDbTipRec.DataBaseName := DataBaseName;
End;

Function TCtrlTipRec.ListTipRec(CodTipoRecurso: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + IFF(CodTipoRecurso = -1, ' /*+ OPTIMIZER_MODE RULE */', '') + CR_LF +
      '  CODTIPORECURSO, DESCRICAO, VALORHONOR, FLGPENHORA, FLGENCERRAMENTO,' + CR_LF +
      //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
   // SOL 161760 KTN 1379145 - Paulo Nobre
      '  MOECODIGO, INDJUROS, TAXAJUROS, FLGEXECUCAO, FLGINTEGRAFINANCEIRO, FLGINTEGRACONTABIL, RECPAG, FLGEXIGELANCVALOR' + CR_LF +
      'FROM' + CR_LF +
      '  TIPORECTRAB' + CR_LF +
      IFF(CodTipoRecurso = -1, 'WHERE (1 = 2)',
      IFF(CodTipoRecurso = 0, 'ORDER BY' + CR_LF + '  DESCRICAO', 'WHERE' + CR_LF +
      '  (CodTipoRecurso = ' + FloatToStr(CodTipoRecurso) + ')')));
End;

Function TCtrlTipRec.ListTipRecGrupo(CodTipoRecursos: String): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT ' + CR_LF +
      '  CODTIPORECURSO, DESCRICAO, VALORHONOR, FLGPENHORA, FLGENCERRAMENTO,' + CR_LF +
      //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
   // SOL 161760 KTN 1379145 - Paulo Nobre
      '  MOECODIGO, INDJUROS, TAXAJUROS, FLGEXECUCAO, FLGINTEGRAFINANCEIRO, FLGINTEGRACONTABIL, RECPAG, FLGEXIGELANCVALOR' + CR_LF +
      'FROM' + CR_LF +
      '  TIPORECTRAB' + CR_LF +
      'WHERE CodTipoRecurso IN ' + CodTipoRecursos);
End;

Function TCtrlTipRec.GravarTipRec: boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GravarTipRec(FCdsTipRec.Data);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;
            Result := ApplyCds(FCdsTipRec, FDbTipRec, [], []);
            If (Result) Then
               Commit
            Else
               Exception.Create(FDbTipRec.MessageInfo);
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

