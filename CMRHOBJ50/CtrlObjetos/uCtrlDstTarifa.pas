{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 Pendência.....: 128057
 Dt Alteração..: 12/08/2022
 Responsável...: Everson Cunha
 Descrição.....: Permitir o cadastro do mesmo cargo para País e Exterior
--------------------------------------------------------------------------------
 N. Sol..........: 137269
 N. Kintana......: 829602
 Data............: 07/10/2011
 Responsável.....: Paulo Nobre
 Descrição.......: Alteração em funções para inclusão de novos campos
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Andre Mesquita                  }
{ Criado Em: 22/03/2007                                 }
{                                                       }
{*******************************************************}

Unit uCtrlDstTarifa;

Interface

Uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
   uDbDSTTarifa, uCtrlCustomRH, uDbDSTValores, uDbDSTTarifaXCargo;

Type
   TCtrlDSTTarifa = Class(TCtrlCustomRH)
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
   Private
      FCdsDstTarifa: TCMClientDataSet;
      FCdsDstValores: TCMClientDataSet;
      FCdsDstTarifaXCargo: TCMClientDataSet;
      FDbDstTarifa: TDbDstTarifa;
      FDbDstTarifaXCargo: TDbDstTarifaXCargo;
      FDbDstValores: TDbDstValores;
      FIdTarifa: Integer;
      Procedure SetCdsDstTarifa(Const Value: TCMClientDataSet);
      Procedure SetCdsDstTarifaXCargo(Const Value: TCMClientDataSet);
      Procedure SetCdsDstValores(Const Value: TCMClientDataSet);
      Procedure SetDbDstTarifa(Const Value: TDbDstTarifa);
      Procedure SetDbDstTarifaXCargo(Const Value: TDbDstTarifaXCargo);
      Procedure SetDbDstValores(Const Value: TDbDstValores);
   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property DbDstTarifa: TDbDstTarifa Read FDbDstTarifa Write SetDbDstTarifa;
      Property DbDstValores: TDbDstValores Read FDbDstValores Write SetDbDstValores;
      Property DbDstTarifaXCargo: TDbDstTarifaXCargo Read FDbDstTarifaXCargo Write SetDbDstTarifaXCargo;

      Property CdsDstTarifa: TCMClientDataSet Read FCdsDstTarifa Write SetCdsDstTarifa;
      Property CdsDstValores: TCMClientDataSet Read FCdsDstValores Write SetCdsDstValores;
      Property CdsDstTarifaXCargo: TCMClientDataSet Read FCdsDstTarifaXCargo Write SetCdsDstTarifaXCargo;

      Property IdTarifa: Integer Read FIdTarifa Write FIdTarifa;

      Function GravarDstTarifa: boolean;

      Function ListTarifa(idTarifa: Integer = -1): OleVariant;
      Function ListValores(Const idTarifa: Integer = -1; Const dtData: TDateTime = 0): OleVariant;

      Function ListTarifaXCargo(Const idTarifa, idCargo: Integer): OleVariant;
      Function ListCargosNaoAssociados(Const indTipo: Integer; Const idTarifa: Integer): OleVariant;
      Function ListCargosAssociados(Const indTipo: Integer; Const idTarifa: Integer): OleVariant;

      Function ExisteFilho(Const idTarifa: Integer): Boolean;

      Function LocalizaMaiorVigencia(Const idTarifa, indTipo: Integer; sLocal : String): TDateTime;
      Function CargoJaTemGrupoDeDiaria(Const idCargo, indtipo : Integer; sLocal : String; Var sDescCargo: String): Boolean;
   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH, uCtrlDstTrecho;

{ TCtrlDSTTarifa }

Constructor TCtrlDSTTarifa.Create;
Begin
   Inherited;
   FDbDstTarifa := TDbDstTarifa.Create(Self);
   FDbDstValores := TDbDstValores.Create(Self);
   FDbDstTarifaXCargo := TDbDstTarifaXCargo.Create(Self);
End;

Destructor TCtrlDSTTarifa.Destroy;
Begin
   FDbDstTarifa.Free;
   If (IsAppServer) Then
      FCdsDstTarifa.Free;

   FDbDstValores.Free;
   If (IsAppServer) Then
      FCdsDstValores.Free;

   FDbDstTarifaXCargo.Free;
   If (IsAppServer) Then
      FCdsDstTarifaXCargo.Free;

   Inherited;
End;

Procedure TCtrlDSTTarifa.OnCreateAppServer;
Begin
   Inherited;
   FCdsDstTarifa := TCMClientDataSet.Create(Nil);
   FCdsDstValores := TCMClientDataSet.Create(Nil);
   FCdsDstTarifaXCargo := TCMClientDataSet.Create(Nil);
End;

Procedure TCtrlDSTTarifa.DoChangeDataBase;
Begin
   Inherited;
   FDbDstTarifa.DataBaseName := DataBaseName;
   FDbDstValores.DataBaseName := DataBaseName;
   FDbDstTarifaXCargo.DataBaseName := DataBaseName;
End;

Function TCtrlDSTTarifa.GravarDstTarifa: boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GravarDstTarifa(FCdsDstTarifa.Data, FCdsDstValores.Data, FCdsDstTarifaXCargo.Data);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            // Inicia a Transação
            StartTransaction;
            // Salva o PAI
            If Not ApplyCds(CdsDstTarifa, DbDstTarifa, [], []) Then
               Raise Exception.Create(DbDstTarifa.MessageInfo);

            // Salva o FILHO
            If Not ApplyCds(CdsDstValores, DbDstValores,
               [DbDstTarifa.IdDstTarifa], [DbDstValores.IdDstTarifa], True) Then
               Raise Exception.Create(DbDstValores.MessageInfo);

            // Salva o FILHO
            If Not ApplyCds(CdsDstTarifaXCargo, DbDstTarifaXCargo,
               [DbDstTarifa.IdDstTarifa], [DbDstTarifaXCargo.IdDstTarifa]) Then
               Raise Exception.Create(DbDstTarifaXCargo.MessageInfo);

            // Para recarrega o cds com o registro após a edição ( bug do padrão ) - usada nos cadastros padronizados
            IdTarifa := DbDstTarifa.Iddsttarifa2;

            // Finaliza a Transação com êxito.
            Commit;
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

Procedure TCtrlDSTTarifa.SetCdsDstTarifa(Const Value: TCMClientDataSet);
Begin
   FCdsDstTarifa := Value;
End;

Function TCtrlDSTTarifa.ListTarifa(idTarifa: Integer): OleVariant;
Var
   sSQL: String;
Begin
   sSQL := ' SELECT * ' + CR_LF +
      ' FROM ' + CR_LF +
      '  DSTTARIFA ' + CR_LF +
      IFF(idTarifa = -1, 'ORDER BY DESCRICAO', ' WHERE IDDSTTARIFA = ' + IntToStr(idTarifa));

   Result := GetDataPacket(sSQL);
End;

Procedure TCtrlDSTTarifa.SetCdsDstTarifaXCargo(Const Value: TCmClientDataSet);
Begin
   FCdsDstTarifaXCargo := Value;
End;

Procedure TCtrlDSTTarifa.SetCdsDstValores(Const Value: TCmClientDataSet);
Begin
   FCdsDstValores := Value;
End;

Function TCtrlDSTTarifa.ListValores(Const idTarifa: Integer; Const dtData: TDateTime): OleVariant;
Var
   sSQL: String;
Begin
   sSQL := ' SELECT ' + CR_LF +
      '   IDDSTTARIFA, DATADSTVALORES, VLRDST, TIPOLOCAL, DECODE(TIPOLOCAL, ''P'', ''País'', DECODE(TIPOLOCAL, ''E'', ''Exterior'','''')) AS DSC_LOCAL, ' + CR_LF +
      '   DSTVALORES.MOECODIGO, MOEDA.MOESIGLA, MOEDA.MOEDESC, DSTAEROPORTO.IDDSTAEROPORTO, DSTAEROPORTO.NMEDSTAEROPORTO, ' + CR_LF +
      '   VLCONTROLADODIARIA, VLCONTROLADOKMRODADO, VLKMLIVREDIARIA, VLKMLIVRESEMANA, VLKMLIVREDIAEXTRA ' + CR_LF +
      ' FROM ' + CR_LF +
      '   DSTVALORES, MOEDA, DSTAEROPORTO ' + CR_LF;

   If (idTarifa <= -1) Then
      sSQL := sSql + ' WHERE (1 = 2) AND DSTVALORES.MOECODIGO = MOEDA.MOECODIGO (+) AND DSTVALORES.IDDSTAEROPORTO = DSTAEROPORTO.IDDSTAEROPORTO (+)' + CR_LF
   Else
      If (idTarifa > -1) Or (dtData > 0) Then
         Begin
            sSQL := sSql + ' WHERE DSTVALORES.MOECODIGO = MOEDA.MOECODIGO (+) AND DSTVALORES.IDDSTAEROPORTO = DSTAEROPORTO.IDDSTAEROPORTO (+)' + CR_LF;
            If (idTarifa > -1) Then
               sSql := sSql + ' AND IDDSTTARIFA = ' + IntToStr(idTarifa);
            If (idTarifa > -1) And (dtData > 0) Then
               sSql := sSql + ' AND DATADSTVALORES <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtData)) + ',' + QuotedStr('dd/mm/yyyy') + ') '
            Else
               If (dtData > 0) Then
                  sSql := sSql + ' AND DATADSTVALORES <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtData)) + ',' + QuotedStr('dd/mm/yyyy') + ') ';
         End;

   sSql := sSql + ' ORDER BY DATADSTVALORES DESC, TIPOLOCAL DESC ';

   Result := GetDataPacket(sSQL);
End;

Function TCtrlDSTTarifa.ListCargosAssociados(Const indTipo: Integer; Const idTarifa: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := ' SELECT ' + CR_LF;
   sSql := sSql + '   tc.iddsttarifa, tc.IDCARGO, cg.TITULO ' + CR_LF;
   sSql := sSql + ' FROM ' + CR_LF;
   sSql := sSql + '   CARGO cg, ' + CR_LF;
   sSql := sSql + '   DSTTARIFAXCARGO tc, ' + CR_LF;
   sSql := sSql + '   DSTTARIFA dt ' + CR_LF;
   sSql := sSql + ' WHERE ' + CR_LF;
   sSql := sSql + '   cg.IDCARGO = tc.IDCARGO ' + CR_LF;
   sSql := sSql + '   and dt.IDDSTTARIFA = tc.IDDSTTARIFA ' + CR_LF;
   //   If (indTipo < 3) Then
   sSql := sSql + '   and dt.INDTIPO = ' + IntToStr(indTipo) + CR_LF;
   sSql := sSql + '   and dt.IDDSTTARIFA = ' + IntToStr(idTarifa) + CR_LF;
   sSql := sSql + ' ORDER BY TITULO ' + CR_LF;

   Result := GetDataPacket(sSql);
End;

Function TCtrlDSTTarifa.ListCargosNaoAssociados(Const indTipo, idTarifa: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := ' select /*+RULE+*/ ' + CR_LF;
   sSql := sSql + '   cg.idcargo, ' + CR_LF;
   sSql := sSql + '   cg.titulo ' + CR_LF;
   sSql := sSql + ' from ' + CR_LF;
   sSql := sSql + '   cargo cg ' + CR_LF;
   sSql := sSql + ' where ' + CR_LF;
   sSql := sSql + '   cg.idcargo ' + CR_LF;
   sSql := sSql + '     not in ' + CR_LF;
   sSql := sSql + '     (select tc1.idcargo from dstTarifaXCargo tc1, dstTarifa tf1 ' + CR_LF;
   sSql := sSql + '      where tc1.IDDSTTARIFA = tf1.IDDSTTARIFA ' + CR_LF;
   sSql := sSql + '        and tf1.INDTIPO = ' + IntToStr(indTipo) + CR_LF;
   sSql := sSql + '        and tf1.IDDSTTARIFA = ' + IntToStr(idTarifa) + ') ' + CR_LF;
   sSql := sSql + ' order by cg.titulo ' + CR_LF;

   Result := GetDataPacket(sSql);
End;

Function TCtrlDSTTarifa.ListTarifaXCargo(Const idTarifa, idCargo: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := ' select ' + CR_LF;
   sSql := sSql + '   tc.iddsttarifa, ' + CR_LF;
   sSql := sSql + '   tc.idcargo ' + CR_LF;
   sSql := sSql + ' from ' + CR_LF;
   sSql := sSql + '   dstTarifaXCargo tc ' + CR_LF;
   sSql := sSql + ' where ' + CR_LF;
   sSql := sSql + '   tc.idcargo = ' + IntToStr(idCargo) + CR_LF;
   sSql := sSql + '   and tc.IDDSTTARIFA = ' + IntToStr(idTarifa) + CR_LF;

   Result := GetDataPacket(sSql);
End;

Procedure TCtrlDSTTarifa.SetDbDstTarifa(Const Value: TDbDstTarifa);
Begin
   FDbDstTarifa := Value;
End;

Procedure TCtrlDSTTarifa.SetDbDstTarifaXCargo(Const Value: TDbDstTarifaXCargo);
Begin
   FDbDstTarifaXCargo := Value;
End;

Procedure TCtrlDSTTarifa.SetDbDstValores(Const Value: TDbDstValores);
Begin
   FDbDstValores := Value;
End;

Function TCtrlDSTTarifa.ExisteFilho(Const idTarifa: Integer): Boolean;
Begin
   If (CdsDstValores.RecordCount > 0) Or
      (CdsDstTarifaXCargo.RecordCount > 0) Then

      Result := True
   Else
      Result := False;
End;

Function TCtrlDSTTarifa.LocalizaMaiorVigencia(Const idTarifa, IndTipo: Integer; sLocal : String): TDateTime;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);
   Result := 0;
   _CdsAux.Data := GetDataPacket(
      ' SELECT MAX(V.DATADSTVALORES) DATAVIGENCIA' + CR_LF +
      ' FROM DSTVALORES V, DSTTARIFA T ' + CR_LF +
      ' WHERE V.IDDSTTARIFA = ' + IntToStr(idTarifa) + CR_LF +
      '       AND V.TIPOLOCAL = ' + QuotedStr(sLocal) + CR_LF +
      '       AND T.INDTIPO = ' + IntToStr(IndTipo));
   If Not _CdsAux.isEmpty Then
      Result := _CdsAux.FieldByName('DATAVIGENCIA').asDateTime;

   _CdsAux.Free;
End;

Function TCtrlDSTTarifa.CargoJaTemGrupoDeDiaria(Const idCargo, indTipo : Integer; sLocal : String; Var sDescCargo: String): Boolean;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   Result := False;
   _CdsAux.Data := GetDataPacket(
      'SELECT DISTINCT T.DESCRICAO ' + CR_LF +
      'FROM DSTTARIFAXCARGO D, DSTTARIFA T, DSTVALORES V ' + CR_LF +
      'WHERE D.IDDSTTARIFA = T.IDDSTTARIFA  ' + CR_LF +
      '      AND V.IDDSTTARIFA = T.IDDSTTARIFA ' + CR_LF +
      '      AND D.IDCARGO = ' + IntToStr(idCargo) + CR_LF +
      '      AND V.TIPOLOCAL = ' + QuotedStr(sLocal) + CR_LF +
      '      AND T.INDTIPO = ' + IntToStr(indTipo));
   If Not _CdsAux.isEmpty Then
      Begin
         Result := True;
         sDescCargo := _CdsAux.fieldbyname('DESCRICAO').asString;
      End;

   _CdsAux.Free;
End;

End.

