{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 13/06/2002                                 }
{                                                       }
{*******************************************************}
//******************************************************************************************
//N. Sol..........: 228736/17139
//N. Kintana......: 761996
//Data............: 27/04/2015
//Responsável.....: Felipe A. Santos
//Descrição.......: rotina  GetDataDesbloqueio
//******************************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 10/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
// *****************************************************************************
//******************************************************************************************
//N. Sol..........: 172550
//N. Kintana......: 1555163
//Data............: 27/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de novos campos para uso nA integração da Etapa do Processo - SISTJURCONS
//******************************************************************************************
Unit uCtrlParamRH;

Interface

Uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
   uCtrlCustomRH, uDbParamRH;

Type
   TCtrlParamRH = Class(TCtrlCustomRH)
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
   Private
      FDbParamRH: TDbParamRH;
      FCdsParamRH: TCMClientDataSet;
   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Function GravarParamRH: boolean;

      Function ListParamRH: OleVariant;
      Function ListMoeda: OleVariant;
      Function ListMotivo: OleVariant;
      Function ListRubrica(IdEmpresa: integer): OleVariant;
      Function GetDataDesbloqueio(iDias : Integer) : TDateTime; // Felipe A. Santos SOL 228736/17139 PPM 761996

      Procedure ExecInsert;

      Property CdsParamRH: TCMClientDataSet Read FCdsParamRH Write FCdsParamRH;
   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlParamRH }

Constructor TCtrlParamRH.Create;
Begin
   Inherited;
   FDbParamRH := TDbParamRH.Create(Self);
End;

Destructor TCtrlParamRH.Destroy;
Begin
   FDbParamRH.Free;
   If (IsAppServer) Then
      FCdsParamRH.Free;
   Inherited;
End;

Procedure TCtrlParamRH.OnCreateAppServer;
Begin
   Inherited;
   FCdsParamRH := TCMClientDataSet.Create(Nil);
End;

Procedure TCtrlParamRH.DoChangeDataBase;
Begin
   Inherited;
   FDbParamRH.DataBaseName := DataBaseName;
End;

Function TCtrlParamRH.ListParamRH: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  *' + CR_LF +
      'FROM' + CR_LF +
      '  PARAMRH');
End;

Function TCtrlParamRH.ListMoeda: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  MOECODIGO, MOEDESC, MOESIGLA' + CR_LF +
      'FROM' + CR_LF +
      '  MOEDA');
End;

Function TCtrlParamRH.ListRubrica(IdEmpresa: integer): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  PD.IDPROVENTO, RP.DESCRPROVDESC AS DESCRICAO' + CR_LF +
      'FROM' + CR_LF +
      '  RUBRICAXPESS RP, PROVDESC PD' + CR_LF +
      'WHERE' + CR_LF +
      '  (RP.IDPESSOA   = ' + IntToStr(IdEmpresa) + ') AND' + CR_LF +
      '  (PD.FLGTPRUBRICA LIKE ''%F%'') AND' + CR_LF +
      '  (PD.IDPROVENTO = RP.IDRUBRICA)');
End;

Function TCtrlParamRH.ListMotivo: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDMOTIVO, DESCRICAO' + CR_LF +
      'FROM' + CR_LF +
      '  MOTIVO' + CR_LF +
      'WHERE' + CR_LF +
      '  (GRUPOMOTIVO = ''F'')');
End;

Procedure TCtrlParamRH.ExecInsert;
Begin
   FCdsParamRH.Insert;
   FCdsParamRH.FieldByName('IDPARAMRH').asInteger := 1;
   //Geral
   FCdsParamRH.FieldByName('NORMALINI').asDateTime := Date;
   FCdsParamRH.FieldByName('NORMALFIM').asDateTime := Date;
   FCdsParamRH.FieldByName('FERIASINI').asDateTime := Date;
   FCdsParamRH.FieldByName('FERIASFIM').asDateTime := Date;
   FCdsParamRH.FieldByName('PGTO13INI').asDateTime := Date;
   FCdsParamRH.FieldByName('PGTO13FIM').asDateTime := Date;
   FCdsParamRH.FieldByName('NUMSTEPS').asInteger := 20; {9;} // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - de 9 para 20
   FCdsParamRH.FieldByName('TITSTEP1').asString := 'Step 1';
   FCdsParamRH.FieldByName('TITSTEP2').asString := 'Step 2';
   FCdsParamRH.FieldByName('TITSTEP3').asString := 'Step 3';
   FCdsParamRH.FieldByName('TITSTEP4').asString := 'Step 4';
   FCdsParamRH.FieldByName('TITSTEP5').asString := 'Step 5';
   FCdsParamRH.FieldByName('TITSTEP6').asString := 'Step 6';
   FCdsParamRH.FieldByName('TITSTEP7').asString := 'Step 7';
   FCdsParamRH.FieldByName('TITSTEP8').asString := 'Step 8';
   FCdsParamRH.FieldByName('TITSTEP9').asString := 'Step 9';
   // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - de 9 para 20
   FCdsParamRH.FieldByName('TITSTEP10').asString := 'Step 10';
   FCdsParamRH.FieldByName('TITSTEP11').asString := 'Step 11';
   FCdsParamRH.FieldByName('TITSTEP12').asString := 'Step 12';
   FCdsParamRH.FieldByName('TITSTEP13').asString := 'Step 13';
   FCdsParamRH.FieldByName('TITSTEP14').asString := 'Step 14';
   FCdsParamRH.FieldByName('TITSTEP15').asString := 'Step 15';
   FCdsParamRH.FieldByName('TITSTEP16').asString := 'Step 16';
   FCdsParamRH.FieldByName('TITSTEP17').asString := 'Step 17';
   FCdsParamRH.FieldByName('TITSTEP18').asString := 'Step 18';
   FCdsParamRH.FieldByName('TITSTEP19').asString := 'Step 19';
   FCdsParamRH.FieldByName('TITSTEP20').asString := 'Step 20';
   // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
   FCdsParamRH.FieldByName('IDMOTIVO').asFloat := 0;
   FCdsParamRH.FieldByName('IDRUBFALTA').asFloat := 0;
   FCdsParamRH.FieldByName('LIMADM').asInteger := 0;
   FCdsParamRH.FieldByName('LIMDEM').asInteger := 0;
   FCdsParamRH.FieldByName('INDPOLITICA').asInteger := 0;
   FCdsParamRH.FieldByName('FLGDOISCARGOS').asInteger := 0;
   FCdsParamRH.FieldByName('FLGNIVELINDIV').asInteger := 0;
   FCdsParamRH.FieldByName('FLGNUMERAMATRIC').asInteger := 0;
   FCdsParamRH.FieldByName('TAMANHOMATRIC').asInteger := 0;
   FCdsParamRH.FieldByName('INDDURACAOCONTR').asInteger := 3;
   FCdsParamRH.FieldByName('FLGSENHAUSOPES').asInteger := 2;
   FCdsParamRH.FieldByName('FLGENDERINS').asInteger := 0;
   FCdsParamRH.FieldByName('FLGENDERALT').asInteger := 0;
   FCdsParamRH.FieldByName('FLGENDEREXC').asInteger := 0;
   FCdsParamRH.FieldByName('FLGTELEFINS').asInteger := 0;
   FCdsParamRH.FieldByName('FLGTELEFALT').asInteger := 0;
   FCdsParamRH.FieldByName('FLGTELEFEXC').asInteger := 0;
   FCdsParamRH.FieldByName('FLGCONTTINS').asInteger := 0;
   FCdsParamRH.FieldByName('FLGCONTTALT').asInteger := 0;
   FCdsParamRH.FieldByName('FLGCONTTEXC').asInteger := 0;
   FCdsParamRH.FieldByName('FLGCURSOINS').asInteger := 0;
   FCdsParamRH.FieldByName('FLGCURSOALT').asInteger := 0;
   FCdsParamRH.FieldByName('FLGCURSOEXC').asInteger := 0;
   FCdsParamRH.FieldByName('FLGFERIAINS').asInteger := 0;
   FCdsParamRH.FieldByName('FLGFERIAALT').asInteger := 0;
   FCdsParamRH.FieldByName('FLGFERIAEXC').asInteger := 0;
   FCdsParamRH.FieldByName('FLGEMPRGINS').asInteger := 0;
   FCdsParamRH.FieldByName('FLGEMPRGALT').asInteger := 0;
   FCdsParamRH.FieldByName('FLGEMPRGEXC').asInteger := 0;
   FCdsParamRH.FieldByName('FLGLINHAINS').asInteger := 0;
   FCdsParamRH.FieldByName('FLGLINHAALT').asInteger := 0;
   FCdsParamRH.FieldByName('FLGLINHAEXC').asInteger := 0;
   FCdsParamRH.FieldByName('FLGCTSALALT').asInteger := 0;
   FCdsParamRH.FieldByName('FLGFILTRAFATOR').asInteger := 0;
   FCdsParamRH.FieldByName('FLGAVALALUNO').asInteger := 0;
   FCdsParamRH.FieldByName('FLGCURSOXAVAL').asInteger := 0;
   FCdsParamRH.FieldByName('VALMAXAVALTRN').asInteger := 100;
   // Jurídico
   // SOL 171426 N. Kintana......: 1537613  - Paulo Nobre
   // SOL 172550 KTN 1555163 - Paulo Nobre      
   FCdsParamRH.FieldByName('FLGINTEGRACONT').asInteger := 0;
   FCdsParamRH.FieldByName('FLGCRIASUBCONTA').asInteger := 0;
   FCdsParamRH.FieldByName('MOEDAPROCTRAB').asInteger := 0;
   FCdsParamRH.FieldByName('FLGINTEGRACAP').asInteger := 0;
   FCdsParamRH.FieldByName('FLGPERCPROB').asInteger := 0;
   FCdsParamRH.FieldByName('INDCONTABJUR').asInteger := 0;
   FCdsParamRH.FieldByName('DATAVIGENCIAOBJ').asDateTime := Date;
   FCdsParamRH.FieldByName('DATACORROBJ').asDateTime := Date;
   FCdsParamRH.FieldByName('PLNCODIGOOBJ').asFloat := 0;
   ///

   FCdsParamRH.Post;
End;

Function TCtrlParamRH.GravarParamRH: boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GravarParamRH(FCdsParamRH.Data);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;
            Result := ApplyCds(FCdsParamRH, FDbParamRH, [], []);
            If (Result) Then
               Commit
            Else
               Raise Exception.Create(FDbParamRH.MessageInfo);
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

// Felipe A. Santos SOL 228736/17139 PPM 761996 - início
function TCtrlParamRH.GetDataDesbloqueio(iDias: Integer): TDateTime;
var
  sSQL : string;
begin
  sSQL := 'SELECT CALCULA_INTERVALO_UTIL(' + IntToStr(iDias) + ') AS DIASUTEISBLOQ FROM DUAL';

  _Cds.Data := GetDataPacket(sSQL);
  Result := _Cds.FieldByName('DIASUTEISBLOQ').AsDateTime;
end;
// Felipe A. Santos SOL 228736/17139 PPM 761996 - fim

End.

