{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 29/10/2002                                 }
{                                                       }
{*******************************************************}

Unit uCtrlContabJurid;

Interface

Uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH, uDbContabJurid;

Type
   TCtrlContabJurid = Class(TCtrlCustomRH)
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
   Private
      FDbContabJurid: TDbContabJurid;
      FCdsContabJurid: TCMClientDataSet;
   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Function ListContabJurid(CodTipoObjeto: double): OleVariant;
      Function GravarContabJurid: boolean;                         
      Property CdsContabJurid: TCMClientDataSet Read FCdsContabJurid Write FCdsContabJurid;
   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlContabJurid }

Constructor TCtrlContabJurid.Create;
Begin
   Inherited;
   FDbContabJurid := TDbContabJurid.Create(Self);
End;

Destructor TCtrlContabJurid.Destroy;
Begin
   FDbContabJurid.Free;
   If (IsAppServer) Then
      FCdsContabJurid.Free;
   Inherited;
End;

Procedure TCtrlContabJurid.OnCreateAppServer;
Begin
   Inherited;
   FCdsContabJurid := TCMClientDataSet.Create(Nil);
End;

Procedure TCtrlContabJurid.DoChangeDataBase;
Begin
   Inherited;
   FDbContabJurid.DataBaseName := DataBaseName;
End;

Function TCtrlContabJurid.ListContabJurid(CodTipoObjeto: double): OleVariant;
Begin
   Result := GetDataPacket(
 'SELECT CJ.*, TP.NOMETIPOPROC, T.TIPDESCRICAO,  ' + CR_LF +
 'DECODE(CJ.INDPRINCIPAL,0,''Principal'', 1,''Correção Monetária'', 2,''Juros'') AS TIPO ' + CR_LF +
 'FROM CONTABJURID CJ, TIPOPROCESSO TP, TIPOPER T ' + CR_LF +
 'WHERE (CJ.CODTIPOOBJETO = ' + FloatToStr(CodTipoObjeto) + ')' + CR_LF +
 '      AND CJ.IDTIPOPROC_DE = TP.IDTIPOPROC (+) ' + CR_LF +
 '      AND CJ.TIPCODIGO = T.TIPCODIGO (+) ' + CR_LF +
 'ORDER BY TP.NOMETIPOPROC, T.TIPDESCRICAO, TIPO DESC');

{   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  CJ.*, DECODE(CJ.INDMATERIA,0,''Qualquer'',1,''Trabalhista'',2,''Previdenciária'',' + CR_LF +
      '  3,''Prev./Trabalhista'',4,''Civil'',5,''Comercial'',6,''Tributária'',''Penal'')' + CR_LF +
      '  AS MATERIA' + CR_LF +
      'FROM' + CR_LF +
      '  CONTABJURID CJ' + CR_LF +
      'WHERE' + CR_LF +
      '  (CJ.CODTIPOOBJETO = ' + FloatToStr(CodTipoObjeto) + ')' + CR_LF +
      'ORDER BY' + CR_LF +
      '  INDMATERIA, IDCONTABJURID');}
End;

Function TCtrlContabJurid.GravarContabJurid: boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GravarContabJurid(FCdsContabJurid.Data);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;
            Result := ApplyCds(FCdsContabJurid, FDbContabJurid, [], []);
            If (Result) Then
               Commit
            Else
               Raise Exception.Create(FDbContabJurid.MessageInfo);
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

