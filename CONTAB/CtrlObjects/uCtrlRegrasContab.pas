unit uCtrlRegrasContab;

interface

Uses DB, uDataBase, uDbRegrasContab, uCmControlObject, dbclient, sysutils,Provider,
       ComCtrls,CMProcuraMask, CMProcura,DBTables, uCtrlPadroes,
      {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

Type
   TTipoRegra   = (tpAtiva, tpNaoAtiva, tpAmbas);


    TCtrlRegrasContab = Class(TCmControlObject)

    private
      _dbRegrasContab  : TDbRegrasContab;
      FCdsRegrasContab : TClientDataSet;
      Padroes          : TCtrlPadroes;

      procedure SetCdsRegrasContab(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;


      property CdsRegrasContab: TClientDataSet  Read FCdsRegrasContab Write SetCdsRegrasContab;

       function RetornaPeriodoNaoAtu(dEmpresa: Double; iExercicio,iPeriodo: Integer): OleVariant;

      {Esta função tem o objetivo de gravar as Regras contabeis}
      Function Gravar(dEmpresa,dModulo,dUsuario:Double) :Boolean;

      {Esta função tem o objetivo de retornar as regras contabeis}
      Function ListRegrasContab(dIdPessoa,dRegCod:Double;TipoRegra:TTipoRegra) :OleVariant;

      {Esta função tem com objetivo conferir as regras contabeis}
      Function SelecionaContasRegra(iCodRegra: Integer):OleVariant;

      {Esta função pegra os saldos da conta na para consistir as regras}
      Function SaldoContaRegra(dEmpresa:Double;iPlano,iPeriodo,iExercicio: Integer; sPlaconta, sRegPeriodo: string) :Double;

      {Esta função pegra os saldos da conta na para consistir as regras}
      Function ExisteLanc(dEmpresa:Double;iPlano,iPeriodo,iExercicio: Integer; sPlaconta,sRegPeriodo: string) :Boolean;

    End;


implementation

procedure TCtrlRegrasContab.OnCreateAppServer;
begin
  inherited;
  FCdsRegrasContab:= TClientDataSet.Create(nil);

end;
constructor TCtrlRegrasContab.Create;
begin
  inherited;
  _dbRegrasContab:= TDbRegrasContab.Create(Self);
  Padroes        := TCtrlPadroes.Create;

end;

destructor TCtrlRegrasContab.Destroy;
begin
  inherited;

  _dbRegrasContab.Free;
  Padroes.Free;

  If  IsAppServer Then FCdsRegrasContab.Free;

end;


Function TCtrlRegrasContab.SaldoContaRegra(dEmpresa:Double;iPlano,iPeriodo,iExercicio: Integer; sPlaconta, sRegPeriodo: string) :Double;
var
  sSql :string;
begin
  If sRegPeriodo = 'A' Then
     iExercicio := iExercicio -1;

  sSql := 'SELECT SUM(PLSCREDITOCOR) AS CREDITO, SUM(PLSDEBITOCORRENTE) AS DEBITO '+
          'FROM PLANOSALDO '+
          'WHERE IDPESSOA        = ' + FloatToStr(dEmpresa) +
          '  AND PEREXERCICIO    = ' + IntToStr(iExercicio) +
          '  AND PERNUMERO      <= ' + IntToStr(iPeriodo) +
          '  AND PLANO           = ' + IntToStr(iPlano) +
          '  AND RTRIM(PLACONTA) = ' + Trim(sPlaconta);

   _cds.Data := GetDataPacket(sSql);

   If Not _cds.IsEmpty Then
      Result := _cds.fieldbyname('DEBITO').AsFloat - _cds.fieldbyname('CREDITO').AsFloat
   Else
      REsult := 0;


end;

Function TCtrlRegrasContab.ExisteLanc(dEmpresa:Double;iPlano,iPeriodo,iExercicio: Integer; sPlaconta,sRegPeriodo: string) :Boolean;
var
  sSql :string;
begin
  If sRegPeriodo = 'A' Then
     iExercicio := iExercicio -1;

  sSql := 'SELECT LACVALOR '+
          'FROM LANCAMENTO LAC, PLANILHA PLA ' +
          'WHERE LAC.PLANO           = ' + IntToStr(iPlano) +
          '  AND RTRIM(LAC.PLACONTA) = ' + Trim(sPlaconta) +
          '  AND PLA.PLNCODIGO    = LAC.PLNCODIGO ' +
          '  AND PLA.PEREXERCICIO = ' + IntToStr(iExercicio) +
          '  AND PLA.IDPESSOA     = ' + FloatToStr(dEmpresa) +
          '  AND PLA.PERNUMERO   <= ' + IntToStr(iPeriodo);

   _cds.Data := GetDataPacket(sSql);

   If Not _cds.IsEmpty Then
      Result := True  // existem lancamentos na conta
   Else
      Result := False;


end;

Function TCtrlRegrasContab.ListRegrasContab(dIdPessoa,dRegCod:Double;TipoRegra:TTipoRegra) :OleVariant;
var
  sSql, sfiltro, sOrdena :string;
begin

      sSql := 'SELECT  ' +
              '    REGCODIGO,         ' +
              '    REGDESC,           ' +
              '    IDPESSOA,          ' +
              '    REGCREDORNEGATIVO, ' +
              '    REGLANCMOV,        ' +
              '    REGATIVA,          ' +
              '    REGSCRIPT          ' +
              'FROM ' +
              '    REGRASCONTAB ';

      //-------------------------------------------------------------------
      sfiltro := '';
      If dIdpessoa <> 0 Then
         sfiltro :=  'WHERE (IDPESSOA = '+FloatToStr(dIdPessoa)+ ') ';
      //-------------------------------------------------------------------
      If dRegCod <> 0 Then
         If sfiltro = '' Then
            sfiltro :=  'WHERE (REGCODIGO = ' + FloatToStr(dRegCod) + ') '
         else
            sfiltro := sfiltro +  'AND (REGCODIGO = '+ FloatToStr(dRegCod) + ') ';
      //-------------------------------------------------------------------
      Case TipoRegra of
        tpAtiva    : sfiltro := sfiltro + '  AND (REGATIVA = ''S'') ';
        tpNaoAtiva : sfiltro := sfiltro + '  AND (REGATIVA <> ''S'') ';
     end;



     sOrdena := 'ORDER BY REGDESC ';

     sSql := Ssql + sFiltro + sOrdena;

     Result := GetDataPacket(sSql);
end;


function TCtrlRegrasContab.Gravar(dEmpresa,dModulo,dUsuario:Double): Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarRegrasContab ( dEmpresa,dModulo,dUsuario,FcdsRegrasContab.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsRegrasContab,_dbRegrasContab,[],[] );
           Msg    := _dbRegrasContab.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Cadastro de Regras',False) then
              Raise Exception.Create( Padroes.MessageInfo );

           Commit;

        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;


procedure TCtrlRegrasContab.DoChangeDataBase;
begin
  inherited;
  _dbRegrasContab.DataBaseName := DataBaseName;

end;

procedure TCtrlRegrasContab.SetCdsRegrasContab(const Value: TClientDataSet);
begin
  FCdsRegrasContab := Value;
end;




function TCtrlRegrasContab.SelecionaContasRegra(iCodRegra: Integer): OleVariant;
var
  sSql :String;
begin
    sSql := 'SELECT REGCODIGO,PLANO,PLACONTA,REGANTESENCRESULT, '+
            '       UNIDNEGOC,IDPESSOA,REGOPERADOR,REGPERIODO,REGLANCMOV '+
            'FROM CONTASREGRA '+
            'WHERE REGCODIGO = ' + IntToStr(iCodRegra);

    Result := GetDataPacket(sSql);

end;

Function TCtrlRegrasContab.RetornaPeriodoNaoAtu(dEmpresa: Double; iExercicio,iPeriodo: Integer): OleVariant;
var
  sSql :String;
begin
    sSql := 'SELECT PERNUMERO,PERNOME,PERATUALI '+
            'FROM PERIODO '+
            'WHERE '+
            '     PEREXERCICIO = ' + IntToStr(IExercicio) +
            ' AND PERNUMERO   <= ' + IntToStr(iPeriodo) +
            ' AND IDPESSOA    = ' + FloatToStr(dEmpresa);

    Result := GetDataPacket(sSql);

end;

procedure TCtrlRegrasContab.AfterInitialize;
begin
  inherited;
  Padroes.initializeas(self);
  Padroes.OnMessageInfo := nil;

end;

end.
