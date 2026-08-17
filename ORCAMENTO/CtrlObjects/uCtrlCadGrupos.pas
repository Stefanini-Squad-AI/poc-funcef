// Alterações:
{--------------------------------------------------------------------------------------------------
Rotina......: CadGruposInclui  , CadGruposAltera  ,CadGruposExclui
Nº SOL......: 187700
Nº KINTANA..: 1767662
Data........: 15/08/2012
Responsável.: Helen Bianchi / Edilaine Ferraresi
Descrição...: Foi adicionado Commit
--------------------------------------------------------------------------------------------------
Rotina......: CadGruposAltera
Nº SOL......: 161099
Nº KINTANA..: 1715076
Data........: 02/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: mudar parâmetro na funcao EXECSQL para não retornar mensagem de erro quando
              nenhuma linha for alterada
{--------------------------------------------------------------------------------------------------
Rotina......: ListaPlanoOrcamento, PesquisaMascara
Nº SOL......: 172383-7764
Nº KINTANA..: 1556975
Data........: 23/03/2012
Responsável.: Edilaine Ferraresi
Descrição...: inclusão do parâmetro Plano Orçamentário
--------------------------------------------------------------------------------------------------}
{Rotina.........: TCtrlCadGrupos.CadGruposAltera
N. Sol..........: 109826
N. Kintana......: 498982
Data............: 27/03/2009
Responsável.....: Marilza Colpani
Descrição.......: Atualizar o campo NOMECONTAORCAMEN da tabela CONTASORCAMEN
******************************************************************************* }
{ 
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
  uDbGrupoOrcamen, uCMTypes,
  uCtrlCadContasOrc, uSistema, DBaseDados;  // Edilaine - SOL 161099 / KTN 1715076

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
                              pCODGRUPOORC,
                              pIDFORMORCADO : String) : Boolean;


    Function CadGruposAltera(pNOMEGRUPOORCAMEN,
                             pFLGSINALGRUPO,
                             pFLGRESULTADO,
                             pFLGANALSINT,
                             pCODGRUPOORC    : String;
                             pIDGRUPOORCAMEN : Double;
                             pIDFORMORCADO: string) : Boolean;

    // Edilaine - SOL 172383-7764 / KTN 1556975
    function ListaPlanoOrcamento : OleVariant;
    // Edilaine - SOL 172383-7764 / KTN 1556975 - fim

    Function CadGruposExclui(pIDGRUPOORCAMEN : Double) : Boolean;

    function BuscaDadosGrupo(CodGrupo : string; IdPlanoOrcamen: integer): OleVariant;
    function PodeSerAnalitico(CodGrupoPai: string; IdPlanoOrcamen: integer): boolean;

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
    if pMascara <> '' then   // Edilaine - SOL 172383-7764 / KTN 1556975 - bloco sql para dentro do IF
    begin
      SqlLocal.Add('SELECT');
      SqlLocal.Add('  *');
      SqlLocal.Add('FROM');
      SqlLocal.Add('  PARAMORCAMENTO');
      SqlLocal.Add('WHERE');
      SqlLocal.Add('  (IDPESSOA = ' + FloatToStr(pIdPessoa) + ')');

      CdsLocal.Data := GetDataPacket(SqlLocal.Text);

      pMascara   := CdsLocal.FieldByName('MASCGRUPOORC').AsString;
      sMascaraGO := CdsLocal.FieldByName('MASCGRUPOORC').AsString;
    end
    else
    begin
      sMascaraGO := pMascara;    // Edilaine - SOL 172383-7764 / KTN 1556975
    end;
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
      SqlLocal.Add('   RTRIM(CODGRUPOORC)= ' + QuotedStr(pCodGrupo));
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
    SqlLocal.Add('  CODGRUPOORC,');

    SqlLocal.Add('  IDFORMORCADO');

    SqlLocal.Add('FROM');
    SqlLocal.Add('   GRUPOORCAMEN');
    SqlLocal.Add('WHERE');
    SqlLocal.Add('   IDPLANOORCAMEN = ' + FormatFloat('#0', IDPlanoOrcamen));
    SqlLocal.Add('ORDER BY CODGRUPOORC');

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
                                        pCODGRUPOORC,
                                        pIDFORMORCADO : String) : Boolean;
Var
  SqlLocal : TStringList;

Begin

  If (ConnectionSide = cnsClient) Then Begin

    Result := Connection.AppServer.CadGruposInclui(pNOMEGRUPOORCAMEN,
                                                   pIDPLANOORCAMEN,
                                                   pFLGSINALGRUPO,
                                                   pFLGRESULTADO,
                                                   pFLGANALSINT,
                                                   pCODGRUPOORC,
                                                   pIDFORMORCADO);
    If (Not Result) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin
    SqlLocal := TStringList.Create;
    Try
     // Helen - SOL 187700 /KTN 1767662 - Inicio
     try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;
      // Helen - SOL 187700 /KTN 1767662 - Fim
      SqlLocal.Add('INSERT INTO GRUPOORCAMEN');
      SqlLocal.Add('  (IDGRUPOORCAMEN, IDPLANOORCAMEN, NOMEGRUPOORCAMEN, FLGSINALGRUPO,');

      if (pIDFORMORCADO <> '') then
        SqlLocal.Add('   FLGRESULTADO, FLGANALSINT, CODGRUPOORC, IDFORMORCADO)')
      else
        SqlLocal.Add('   FLGRESULTADO, FLGANALSINT, CODGRUPOORC)');

      SqlLocal.Add('VALUES');
      SqlLocal.Add('  (' + FloatToStr(GetSequence('GRUPOORCAMEN')) + ', ' + pIDPLANOORCAMEN + ', ' + QuotedStr(pNOMEGRUPOORCAMEN) + ', ' );
      SqlLocal.Add('   ' + QuotedStr(pFLGSINALGRUPO) + ', ' + QuotedStr(pFLGRESULTADO) + ', ');

      if (pIDFORMORCADO <> '') then
        begin
          SqlLocal.Add('   ' + QuotedStr(pFLGANALSINT)   + ', ' + QuotedStr(pCODGRUPOORC)  + ', ');
          SqlLocal.Add('   ' + pIDFORMORCADO + ')');
        end
      else
        begin
          SqlLocal.Add('   ' + QuotedStr(pFLGANALSINT)   + ', ' + QuotedStr(pCODGRUPOORC) + ')');
        end;


      Result := ExecSql(SqlLocal.Text, True);
      // Helen - SOL 187700 /KTN 1767662 - Inicio
      if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;
     except
       if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;
     end;
     // Helen - SOL 187700 /KTN 1767662 - Fim
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
                                        pIDGRUPOORCAMEN : Double;
                                        pIDFORMORCADO: string) : Boolean;
Var
  SqlLocal : TStringList;

Begin

  If (ConnectionSide = cnsClient) Then Begin

    Result := Connection.AppServer.CadGruposAltera(pNOMEGRUPOORCAMEN,
                                                   pFLGSINALGRUPO,
                                                   pFLGRESULTADO,
                                                   pFLGANALSINT,
                                                   pCODGRUPOORC,
                                                   pIDGRUPOORCAMEN,
                                                   pIDFORMORCADO
                                                   );
    If (Not Result) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin
    SqlLocal := TStringList.Create;

    Try
     // Helen - SOL 187700 /KTN 1767662 - Inicio
     try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;
      // Helen - SOL 187700 /KTN 1767662 - Fim
      SqlLocal.Add('UPDATE GRUPOORCAMEN');
      SqlLocal.Add('SET');
      SqlLocal.Add('  NOMEGRUPOORCAMEN = ' + QuotedStr(pNOMEGRUPOORCAMEN) + ', ');
      SqlLocal.Add('  FLGSINALGRUPO    = ' + QuotedStr(pFLGSINALGRUPO)    + ', ');
      SqlLocal.Add('  FLGRESULTADO     = ' + QuotedStr(pFLGRESULTADO)     + ', ');
      SqlLocal.Add('  FLGANALSINT      = ' + QuotedStr(pFLGANALSINT)      + ', ');
      SqlLocal.Add('  CODGRUPOORC      = ' + QuotedStr(pCODGRUPOORC)      + ', ');

      if (pIDFORMORCADO <> '') then
        SqlLocal.Add('  IDFORMORCADO     = ' + pIDFORMORCADO)
      else
        SqlLocal.Add('  IDFORMORCADO     = NULL');

      SqlLocal.Add('WHERE');
      SqlLocal.Add('  IDGRUPOORCAMEN   = ' + FloatToStr(pIDGRUPOORCAMEN));
      Result := ExecSql(SqlLocal.Text, false);      // Edilaine - SOL 161099 / KTN 1715076

      if Result then    // Edilaine - SOL 161099 / KTN 1715076
      begin
        SqlLocal.Clear;
        //Marilza Colpani 27/03/2009 N.Sol 109826/N.Kintana 498982
        //Marilza - alterar o campo NOMEGRUPOORCAMEN da tabela CONTASORCAMEN
        SqlLocal.Add(' UPDATE CONTASORCAMEN SET NOMECONTAORCAMEN = ' + QuotedStr(pNOMEGRUPOORCAMEN));
        SqlLocal.Add('  WHERE IDGRUPOORCAMEN = ' + FloatToStr(pIDGRUPOORCAMEN));

        // Edilaine - SOL 161099 / KTN 1715076 - alterado o parametro TRUE para False
        // (não retornar erro qdo nenhuma linha for alterada
        Result := ExecSql(SqlLocal.Text, false);
      end;
      // Helen - SOL 187700 /KTN 1767662 - Inicio
      if (Result) and (dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.Commit
      else if (not Result) and (dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.Rollback;

     except
       if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;
     end;                                                 
      // Helen - SOL 187700 /KTN 1767662 - Fim
    Finally
      SqlLocal.Free;
    End;
  End;
End;
//************************************************
Function TCtrlCadGrupos.CadGruposExclui(pIDGRUPOORCAMEN : Double) : Boolean;
Var
  SqlLocal : TStringList;
  CtrlCadContasOrc : TCtrlCadContasOrc;  // Edilaine - SOL 161099 / KTN 1715076
Begin

  If (ConnectionSide = cnsClient) Then Begin

    Result := Connection.AppServer.CadGruposExclui(pIDGRUPOORCAMEN);
    If (Not Result) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin
    SqlLocal := TStringList.Create;

    // Edilaine - SOL 161099 / KTN 1715076
    CtrlCadContasOrc := TCtrlCadContasOrc.Create;
    CtrlCadContasOrc.Initialize(DtmBaseDados.dbBaseDados, True,
                                Sistema.ConnectionType,   Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,  True, nil, nil, False);
    // Edilaine - SOL 161099 / KTN 1715076 - fim

    Try
     // Helen - SOL 187700 /KTN 1767662 - inicio
     try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;      
     // Helen - SOL 187700 /KTN 1767662 - Fim
      Result := CtrlCadContasOrc.ExcluiGrupoOrcamen( Trunc(pIDGRUPOORCAMEN), true ); // Edilaine - SOL 161099 / KTN 1715076

      if Result then  // Edilaine - SOL 161099 / KTN 1715076
      begin
        SqlLocal.Add('DELETE FROM GRUPOORCAMEN');
        SqlLocal.Add('WHERE IDGRUPOORCAMEN = ' + FloatToStr(pIDGRUPOORCAMEN));
        Result := ExecSql(SqlLocal.Text);
      end;
      // Helen - SOL 187700 /KTN 1767662 - Inicio
      if (Result) and (dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.Commit
      else if (not Result) and (dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.Rollback;

     except
       if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;
     end;
     // Helen - SOL 187700 /KTN 1767662 - Fim
    Finally
      SqlLocal.Free;
      CtrlCadContasOrc.Free;   // Edilaine - SOL 161099 / KTN 1715076
    End;
  End;
End;
//************************************************


// Função que busca todos os dados de um GRUPO cadastrado
function TCtrlCadGrupos.BuscaDadosGrupo(CodGrupo: string;
                        IdPlanoOrcamen: integer): OleVariant;
var
  SqlLocal : TStringList;

begin
  SqlLocal := TStringList.Create;

  try
    SqlLocal.Add('SELECT *');
    SqlLocal.Add('  FROM GRUPOORCAMEN');
    SqlLocal.Add(' WHERE CODGRUPOORC = ' + CodGrupo);
    SqlLocal.Add('   AND IDPLANOORCAMEN = ' + IntToStr(IdPlanoOrcamen));

    Result := GetDataPacket(SqlLocal.Text);
  finally
    FreeAndNil(SqlLocal);
  end;

end;

// Função que retorna se é possível cadastrar o GRUPO como ANALÍTICO
function TCtrlCadGrupos.PodeSerAnalitico(CodGrupoPai: string;
                        IdPlanoOrcamen: integer): boolean;
var
  CdsAux: TClientDataSet;
begin
  try
    CdsAux := TClientDataSet.Create(nil);
    CdsAux.Data := BuscaDadosGrupo(CodGrupoPai, IdPlanoOrcamen);

    Result := (CdsAux.FieldByName('FLGANALSINT').AsString = 'S');
  finally
    FreeAndNil(CdsAux);
  end;
end;

function TCtrlCadGrupos.ListaPlanoOrcamento: OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT P.IDPLANOORCAMEN, '+
          '       P.NOMEPLANOORC, '+
          '       P.ANO, P.MASCARAGRUPO '+
          '  FROM PLANOORCAMENTARIO P '+
          'order by P.NOMEPLANOORC';

  result := GetDataPacket( sSQL );
end;

End.
