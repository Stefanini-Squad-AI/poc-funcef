// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaCodigo
Data      : 15/03/2004
Autor     : Marchetti
Pendencia : 16198
Descrição : Acerto na pesquisa, colocando codigo do grupo entre plics (QuotedStr)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 07/11/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Filtro dos grupos pelo Plano Orçamentário
---------------------------------------------------------------------------------------------------}


{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit
  uCtrlCadGrupos;

Interface

Uses
  Classes, DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider,
  uDbGrupoOrcamen, uCMTypes;

Type
  TCtrlCadGrupos = class(TCmControlObject)

  Protected

    Procedure DoChangeDataBase;  Override;
    Procedure OnCreateAppServer; Override;

  Private
    _dbGrupoOrcamen : TDbGrupoOrcamen;
    FCdsCadGrupos   : TClientDataSet;

    Procedure SetCdsCadGrupos(Const Value : TClientDataSet);
  Public

    Nivel : Array[0..20] of Integer;
    ind   : Integer;

    Constructor Create; Override;
    Destructor  Destroy;Override;

    Function VerificaMascara(sMascara : String; var sMascPict : String;
                         var lNivel  : Array  of Integer;
                         var iSoma : Integer;var ind : Integer) : Boolean;
    Function CalcGrau(sNoAnterior : String;lNivel : Array of Integer;
                   ind : Integer;var sPai : String) : Integer;

    Function  Procurar(idCenarioOrcamen:Double): OleVariant;
    //Function  AplicaOperacaoCadGrupos : Boolean;
    Function  PesquisaMascara(    pIdPessoa : Double;
                               Var pMascara  : String) : Boolean;

    Function  VerificaCodigo(pCodGrupo       : String;
                             pIDPlanoOrcamen : Double
                            ) : Boolean;

    Function  BuscaTodos(IDPlanoOrcamen: Double): OleVariant;

    Function  CadGruposInclui(pNOMEGRUPOORCAMEN,
                               pIDPLANOORCAMEN,
                               pFLGSINALGRUPO,
                               pFLGRESULTADO,
                               pFLGANALSINT,
                               pCODGRUPOORC : String) : Boolean;
    Function CadGruposAltera(pNOMEGRUPOORCAMEN,
                              pFLGSINALGRUPO,
                              pFLGRESULTADO,
                              pFLGANALSINT,
                              pCODGRUPOORC    : String;
                              pIDGRUPOORCAMEN : Double) : Boolean;
    Function CadGruposExclui(pIDGRUPOORCAMEN : Double) : Boolean;

    Property CdsCadGrupos : TClientDataSet Read FCdsCadGrupos Write SetCdsCadGrupos;
  End;

Implementation
//************************************************
Procedure TCtrlCadGrupos.OnCreateAppServer;
Begin
  Inherited;

  FCdsCadGrupos := TClientDataSet.Create(Nil);
End;
//************************************************
Procedure TCtrlCadGrupos.DoChangeDataBase;
Begin
  Inherited;

  _dbGrupoOrcamen.DatabaseName := DataBaseName;
End;
//************************************************
Constructor TCtrlCadGrupos.Create;
Begin
  Inherited;

  _DbGrupoOrcamen := TDbGrupoOrcamen.Create(Self);
  //
End;
//************************************************
Destructor TCtrlCadGrupos.Destroy;
Begin
  Inherited;

  _DbGrupoOrcamen.Free;

  If (isAppServer) Then Begin

    CdsCadGrupos.Free;
  End;
End;
//************************************************
{
Function TCtrlCadGrupos.AplicaOperacaoCadGrupos: Boolean;
Begin
  If (ConnectionSide = cnsClient) Then Begin

     Result := Connection.AppServer.AplicaOperacaoCadGrupos(FCdsCadGrupos.Data);
     If (Not Result) Then Begin

       MessageInfo := Connection.AppServer.MessageInfo;
     End;
  End Else Begin
    MessageInfo := '';
    Try
      StartTransaction;
      Result := ApplyCDS(FCdsCadGrupos, _DbGrupoOrcamen, [], []);
      If (Not Result) Then Begin

         MessageInfo := _DbGrupoOrcamen.MessageInfo;
         Abort;
      End Else Begin

        Commit;
      End;
    Except
      On E:Exception Do Begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + E.Message;
      End;
    End;
  End;
End;
}
//************************************************
Function TCtrlCadGrupos.Procurar(idCenarioOrcamen:Double): OleVariant;
Begin

  _DbGrupoOrcamen.IdGrupoOrcamen.AsFloat := idCenarioOrcamen;
  Result := GetDataPacket(_DbGrupoOrcamen.SSqlSelect);

End;
//************************************************
Procedure TCtrlCadGrupos.SetCdsCadGrupos(
  const Value: TClientDataSet);
Begin

  FCdsCadGrupos := Value;
End;
//************************************************
function TCtrlCadGrupos.VerificaMascara(sMascara : String; var sMascPict : String;
                         var lNivel  : Array  of Integer;
                         var iSoma : Integer;var ind : Integer) : Boolean;
var
  i         : Integer;
begin
  Result    := true;
  lNivel[0] := 1;
  iSoma     := 0;
  sMascPict := copy(sMascara,1,1);

  //Verifica a validade da máscara de formatação
  for i := 1 to Length(sMascara) do begin

     if i > 1 then begin
        sMascPict := sMascPict + copy(sMascara,i,1);
     end;

     if copy(sMascara,i,1) ='.' then begin
        ind := ind + 1;
        lnivel[ind] := i - ind - iSoma;
        iSoma := iSoma + lNivel[ind];
     end;

  end;

  if (ind = 0) and (length(sMascara) > 0) then begin
      lnivel[1] := length(sMascara);
      ind := 1;
  end;

  if ind = 0 then begin
     Result := false;
  end;

  lNivel[ind+1] := Length(sMascara) - ind - iSoma;

end;
//************************************************
function  TCtrlCadGrupos.CalcGrau(sNoAnterior: String; lNivel: Array of Integer;
                   ind: Integer; var sPai: String) : Integer;
var
   i    : Integer;
   iAux : Integer;
   sAux : String;
   lAux : Boolean;
begin

   iAux   := 0;
   Result := 0;
   sAux   := '';
   lAux   := false;

   //Calcula o grau hierárquico do Grupo Orçamentário
   for i:= 1 to ind+1 do begin
      inc(Result);
      iAux:=iAux+lNivel[i];

      if length(sNoAnterior)=iAux then begin
         lAux:=True;
         sPai := Copy(sNoAnterior,1,iAux-lNivel[i]);
         break;
      end;
   end;

   if not lAux then Result:=0;

end;
//************************************************
function  TCtrlCadGrupos.PesquisaMascara(    pIdPessoa : Double;
                                          Var pMascara  : String) : Boolean;
Var
  SqlLocal : TStringList;

  CdsLocal : TClientDataSet;

  sMascaraGO,
  sMascPict   : String;

  iSoma       : Integer;

Begin
  SqlLocal := TStringList.Create;
  CdsLocal := TClientDataSet.Create(Nil);

  Try
    SqlLocal.Add('SELECT');
    SqlLocal.Add('  *');
    SqlLocal.Add('FROM');
    SqlLocal.Add('  PARAMORCAMENTO');
    SqlLocal.Add('WHERE');
    SqlLocal.Add('  (IDPESSOA = ' + FloatToStr(pIdPessoa) + ')');

    CdsLocal.Data := GetDataPacket(SqlLocal.Text);

    pMascara   := CdsLocal.FieldByName('MASCGRUPOORC').AsString;
    sMascaraGO := CdsLocal.FieldByName('MASCGRUPOORC').AsString;
    sMascPict := '';

    Result := VerificaMascara(sMascaraGO,
                               sMascPict,
                               Nivel,
                               iSoma,
                               ind);
  Finally

   SqlLocal.Free;
   CdsLocal.Free;
  End;
End;
//************************************************
function  TCtrlCadGrupos.VerificaCodigo(pCodGrupo       : String;
                                        pIDPlanoOrcamen : Double
                                       ) : Boolean;
Var
  SqlLocal : TStringList;

  CdsLocal : TClientDataSet;
Begin

  Result   := False;
  If (pCodGrupo <> '') Then Begin

    SqlLocal := TStringList.Create;
    CdsLocal := TClientDataSet.Create(Nil);

    Try
      SqlLocal.Add('SELECT');
      SqlLocal.Add('   CODGRUPOORC');
      SqlLocal.Add('FROM');
      SqlLocal.Add('   GRUPOORCAMEN');
      SqlLocal.Add('WHERE');
      // Pendencia 16198 - Marchetti
      SqlLocal.Add('   RTRIM(CODGRUPOORC)= ' + QuotedStr(pCodGrupo));
      // FIM Pendencia 16198
      SqlLocal.Add('   AND IDPLANOORCAMEN = ' + FormatFloat('#0', pIDPlanoOrcamen));

      CdsLocal.Data := GetDataPacket(SqlLocal.Text);

      Result := CdsLocal.EOF;
    Finally

     SqlLocal.Free;
     CdsLocal.Free;
    End;
  End;
End;
//************************************************
Function TCtrlCadGrupos.BuscaTodos(IDPlanoOrcamen: Double): OleVariant;
Var
  SqlLocal : TStringList;

Begin

  SqlLocal := TStringList.Create;

  Try
    SqlLocal.Add('SELECT');
    SqlLocal.Add('  NOMEGRUPOORCAMEN,');
    SqlLocal.Add('  IDGRUPOORCAMEN,');
    SqlLocal.Add('  IDPLANOORCAMEN,');
    SqlLocal.Add('  FLGSINALGRUPO,');
    SqlLocal.Add('  FLGRESULTADO,');
    SqlLocal.Add('  FLGANALSINT,');
    SqlLocal.Add('  CODGRUPOORC');
    SqlLocal.Add('FROM');
    SqlLocal.Add('   GRUPOORCAMEN');
    SqlLocal.Add('WHERE');
    SqlLocal.Add('   IDPLANOORCAMEN = ' + FormatFloat('#0', IDPlanoOrcamen));

    Result := GetDataPacket(SqlLocal.Text);
  Finally

   SqlLocal.Free;
  End;
End;
//************************************************
Function TCtrlCadGrupos.CadGruposInclui(pNOMEGRUPOORCAMEN,
                                         pIDPLANOORCAMEN,
                                         pFLGSINALGRUPO,
                                         pFLGRESULTADO,
                                         pFLGANALSINT,
                                         pCODGRUPOORC : String) : Boolean;
Var
  SqlLocal : TStringList;

Begin

  If (ConnectionSide = cnsClient) Then Begin

    Result := Connection.AppServer.CadGruposInclui(pNOMEGRUPOORCAMEN,
                                                    pIDPLANOORCAMEN,
                                                    pFLGSINALGRUPO,
                                                    pFLGRESULTADO,
                                                    pFLGANALSINT,
                                                    pCODGRUPOORC);
    If (Not Result) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin
    SqlLocal := TStringList.Create;
    Try
      SqlLocal.Add('INSERT INTO GRUPOORCAMEN');
      SqlLocal.Add('  (IDGRUPOORCAMEN, IDPLANOORCAMEN, NOMEGRUPOORCAMEN, FLGSINALGRUPO,');
      SqlLocal.Add('    FLGRESULTADO,   FLGANALSINT,      CODGRUPOORC)');
      SqlLocal.Add('VALUES');
      SqlLocal.Add('  (' + FloatToStr(GetSequence('GRUPOORCAMEN')) + ', ' + pIDPLANOORCAMEN + ', ' + QuotedStr(pNOMEGRUPOORCAMEN) + ', ' );
      SqlLocal.Add('     ' + QuotedStr(pFLGSINALGRUPO) + ', ' + QuotedStr(pFLGRESULTADO) + ', ' );
      SqlLocal.Add('     ' + QuotedStr(pFLGANALSINT)   + ', ' + QuotedStr(pCODGRUPOORC)  + ')');
      Result := ExecSql(SqlLocal.Text, True);
    Finally
      SqlLocal.Free;
    End;
  End;
End;
//************************************************
Function TCtrlCadGrupos.CadGruposAltera(pNOMEGRUPOORCAMEN,
                                         pFLGSINALGRUPO,
                                         pFLGRESULTADO,
                                         pFLGANALSINT,
                                         pCODGRUPOORC    : String;
                                         pIDGRUPOORCAMEN : Double) : Boolean;
Var
  SqlLocal : TStringList;

Begin

  If (ConnectionSide = cnsClient) Then Begin

    Result := Connection.AppServer.CadGruposAltera(pNOMEGRUPOORCAMEN,
                                                    pFLGSINALGRUPO,
                                                    pFLGRESULTADO,
                                                    pFLGANALSINT,
                                                    pCODGRUPOORC,
                                                    pIDGRUPOORCAMEN);
    If (Not Result) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin
    SqlLocal := TStringList.Create;
    Try
      SqlLocal.Add('UPDATE GRUPOORCAMEN');
      SqlLocal.Add('SET');
      SqlLocal.Add('  NOMEGRUPOORCAMEN = ' + QuotedStr(pNOMEGRUPOORCAMEN) + ', ');
      SqlLocal.Add('  FLGSINALGRUPO    = ' + QuotedStr(pFLGSINALGRUPO)    + ', ');
      SqlLocal.Add('  FLGRESULTADO     = ' + QuotedStr(pFLGRESULTADO)     + ', ');
      SqlLocal.Add('  FLGANALSINT      = ' + QuotedStr(pFLGANALSINT)      + ', ');
      SqlLocal.Add('  CODGRUPOORC      = ' + QuotedStr(pCODGRUPOORC));
      SqlLocal.Add('WHERE');
      SqlLocal.Add('  IDGRUPOORCAMEN   = ' + FloatToStr(pIDGRUPOORCAMEN));
      Result := ExecSql(SqlLocal.Text, True);
    Finally
      SqlLocal.Free;
    End;
  End;
End;
//************************************************
Function TCtrlCadGrupos.CadGruposExclui(pIDGRUPOORCAMEN : Double) : Boolean;
Var
  SqlLocal : TStringList;

Begin

  If (ConnectionSide = cnsClient) Then Begin

    Result := Connection.AppServer.CadGruposExclui(pIDGRUPOORCAMEN);
    If (Not Result) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin
    SqlLocal := TStringList.Create;
    Try
      SqlLocal.Add('DELETE FROM GRUPOORCAMEN');
      SqlLocal.Add('WHERE IDGRUPOORCAMEN = ' + FloatToStr(pIDGRUPOORCAMEN));
      Result := ExecSql(SqlLocal.Text, True);
    Finally
      SqlLocal.Free;
    End;
  End;
End;
//************************************************
End.
