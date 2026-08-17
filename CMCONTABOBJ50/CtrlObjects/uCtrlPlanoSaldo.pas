unit uCtrlPlanoSaldo;

{
   05/08/2002 - Pend 14564
   Desenvolvida funcionalidade RetornaSaldoContaExerc, que retornará os saldos
   das contas contábeis no exercício, a serem utilizadas a princípio nos métodos
   uCtrlProcessaContab.LancaMeiaNoite
   uCtrlProcessaContab.ApuraResultadoPer

}

interface

Uses DB, uDataBase, uDbPlanoSaldo, uCmControlObject, dbclient, sysutils,Provider,
     uCtrlGeral, ComCtrls,CMProcuraMask, CMProcura,DBTables,   uCtrlPadroes,
     uCMSqlParams, uCMTypes,uMidasUtil;


  Type
    tPeriodo = (tAtual, tAnterior);
    TCtrlPlanoSaldo = Class(TCmControlObject)
    private
       _dbPlanoSaldo    :TdbPlanoSaldo;
       FRetornaUniNegoc :Integer;
       Padroes :TCtrlPadroes;

    protected
       procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;


    public
       Property UnidNegoc :Integer Read FRetornaUniNegoc;
       Constructor Create; Override;
       Destructor Destroy; Override;

       {Esta função tem como objetivo retornar saldo de uma determonada conta}
       function RetornaSaldoDaConta(iIdPessoa,iExercicio,iUniNegoc,iPlano,iSubConta,iPlanoPrev,iPatro:integer;sConta,sCcusto:string ) :OleVariant;
       {Esta função retorna a unidade de negócio}
       Function RetornaUnidNegoc(iIdEmpresa :Integer) :Boolean;
       {Esta função tem como objetivo inserir saldo em uma determinada conta}
       Function InserePlanoSaldo(iPlano,iUniNegoc,iUsuInclusao,idEmpresa,idModulo,idPessoa,iExercicio,
                                 iPerNumero,iPatro, iPlanoPrev,iSubConta:Integer; sConta,sCcusto, sTipoConta:string;
                                 dDebitoCorrente, dCreditoCor, dDebitoOficial, dCreditoOficial,
                                 dDebitoHist,dCreditoHist,dDebitoGer,dCreditoGer,dDebitoGeren1,
                                 dCreditoGeren1,dDebitoGeren2,dCreditoGeren2,dOrcadoDebito,
                                 dOrcadoCredito:Double):Boolean;
       {Esta função tem como objetivo alterar saldo em uma determinada conta}
       Function AlteraMovimAnterior(idPlanoSaldo,dDebitoCorrente, dCreditoCor :Double):Boolean;

       {Esta função tem como objetivo retornar os periodos e seus saldos}
       Function MontaOrcamento(iIdPessoa,iExercicio,iPlano,iUniNegoc,iPatro,iPlanoPrev,iPerNumero,iSubConta:Integer;
                               sPlaConta,sCCusto:string): OleVariant;

       {Esta função tem como objetivo alterar saldo em uma determinada conta na
        tela de cadastro de orcamento}
       Function AlteraOrcamento(idPlanoSaldo,dOrcadoDebito,dOrcadoCredito:Double):Boolean;


       {Esta função tem como objetivo alterar saldo em uma determinada conta na
        tela de cadastro de Saldo Anterior}
       Function AlteraSaldoAnterior(dEmpresa,dModulo,dUsuario,idPlanoSaldo,dDebitoCorrente, dCreditoCor, dDebitoOficial,
                                 dCreditoOficial, dDebitoHist,dCreditoHist,dDebitoGer,
                                 dCreditoGer,dDebitoGeren1, dCreditoGeren1,dDebitoGeren2,
                                 dCreditoGeren2 :double) :Boolean;

       { 05/08/03 by Alex - Esta função é para retornar o somatório do saldo de
         uma determinada conta no exercício }
       function RetornaSaldoContaExerc(const iPerExercicio, iPerNumero, iPlano: integer; const dIdpessoa: double; const sPlanoconta: string; const Periodo: tPeriodo; const iIdPlanoPrev: integer = -99; const iIdPatro: integer = -99): OleVariant;


    protected
    End;


implementation

{ TCtrlEventoSRH }

constructor TCtrlPlanoSaldo.Create;
begin
  inherited;
  _dbPlanoSaldo  := TDbPlanoSaldo.Create(Self);
  Padroes :=TCtrlPadroes.Create;
end;

destructor TCtrlPlanoSaldo.Destroy;
begin

  inherited;
  _dbPlanoSaldo.Free;
  Padroes.free;

end;

Function TCtrlPlanoSaldo.MontaOrcamento(iIdPessoa,iExercicio,iPlano,iUniNegoc,
                iPatro,iPlanoPrev,iPerNumero,iSubConta:Integer;sPlaConta,sCCusto:string): OleVariant;
var
  sSql, sFiltro, sOrdena :string;

begin
       sSql := 'SELECT                        ' +
               '  P.PERNOME,                  ' +
               '  S.IDPLANOSALDO,             ' +
               '  S.PLSORCADODEBITO,          ' +
               '  S.PLSORCADOCREDITO,         ' +
               '  S.PLSDEBITOCORRENTE,        ' +
               '  S.PLSCREDITOCOR,            ' +
               '  S.PERNUMERO                 ' +
               'FROM                          ' +
               '  PLANOSALDO S,               ' +
               '  PERIODO P                   ';
      //-------------------------------------------------------------------
      // parte do filtro
      //-------------------------------------------------------------------
      sFiltro := '';
      If (iIdPessoa <> 0) Then
         sFiltro :=  'WHERE (S.IDPESSOA = '+FloatToStr(iIdPessoa)+ ') ';
      //-------------------------------------------------------------------
      If iExercicio > 0 Then
      Begin
        If sFiltro = '' Then
          sFiltro :=  'WHERE (S.PEREXERCICIO = '+FloatToStr(iExercicio)+') '
        Else
          sFiltro := sFiltro +  'AND (S.PEREXERCICIO = '+FloatToStr(iExercicio)+') ';
      End;
      //-------------------------------------------------------------------
      If iPlano > 0 Then
      Begin
        If sFiltro = '' Then
          sFiltro :=  'WHERE (S.PLANO = '+FloatToStr(iPlano)+') '
        Else
          sFiltro := sFiltro +  'AND (S.PLANO = '+FloatToStr(iPlano)+') ';
      End;
      //-------------------------------------------------------------------
      If iUniNegoc <> 0 Then
      Begin
        If sFiltro = '' Then
           sFiltro :=  'WHERE (S.UNIDNEGOC = '+FloatToStr(iUniNegoc)+') '
        Else
           sFiltro := sFiltro +  'AND (S.UNIDNEGOC = '+FloatToStr(iUniNegoc)+') ';
      End;
      //-------------------------------------------------------------------
      If iPatro > 0 Then
      Begin
        If sFiltro = '' Then
           sFiltro :=  'WHERE (S.IDPATRO = '+FloatToStr(iPatro)+') '
        Else
           sFiltro := sFiltro +  'AND (S.IDPATRO = '+FloatToStr(iPatro)+') ';
      End Else
      Begin
        If sFiltro = '' Then
           sFiltro :=  'WHERE (S.IDPATRO IS NULL) '
        Else
           sFiltro := sFiltro +  'AND (S.IDPATRO IS NULL ) ';
      End;
      //-------------------------------------------------------------------
      If iPlanoPrev > 0 Then
      Begin
        If sFiltro = '' Then
           sFiltro :=  'WHERE (S.IDPLANOPREV = '+FloatToStr(iPlanoPrev)+') '
        Else
           sFiltro := sFiltro +  'AND (S.IDPLANOPREV = '+FloatToStr(iPlanoPrev)+') ';
      End Else
      Begin
        If sFiltro = '' Then
           sFiltro :=  'WHERE (S.IDPLANOPREV IS NULL) '
        Else
           sFiltro := sFiltro +  'AND (S.IDPLANOPREV IS NULL ) ';
      End;
      //-------------------------------------------------------------------
      If iPerNumero > 0 Then
      Begin
        If sFiltro = '' Then
           sFiltro :=  'WHERE (S.PERNUMERO = '+FloatToStr(iPerNumero)+') '
        Else
           sFiltro := sFiltro +  'AND (S.PERNUMERO = '+FloatToStr(iPerNumero)+') ';
      End;
      //-------------------------------------------------------------------
      If sPlaConta <> '' Then
      Begin
        If sFiltro = '' Then
          sFiltro :=  'WHERE (RTRIM(S.PLACONTA) = '''+sPlaConta+''') '
        Else
          sFiltro := sFiltro +  'AND (RTRIM(S.PLACONTA) = '''+sPlaConta+''') '
      End;
      //-------------------------------------------------------------------
      If iSubConta > 0 Then
      Begin
        If sFiltro = '' Then
           sFiltro :=  'WHERE (S.CODSUBCONTA = '''+FloatToStr(iSubConta)+''') '
        Else
           sFiltro := sFiltro +  'AND (S.CODSUBCONTA = '''+FloatToStr(iSubConta)+''') '
      End Else
      Begin
        If sFiltro = '' Then
           sFiltro :=  'WHERE (S.CODSUBCONTA IS NULL) '
        Else
           sFiltro := sFiltro +  'AND (S.CODSUBCONTA IS NULL ) ';
      End;
      //-------------------------------------------------------------------
      If sCCusto <> '' Then
      Begin
        If sFiltro = '' Then
        Begin
           sFiltro :=  'WHERE (RTRIM(S.CODCENTROCUSTO) = '''+sCCusto+''') ';
           sfiltro :=  'AND (IDEMPRESA = '+ FloatToStr(iIdPessoa)+ ') ';
        End Else
        Begin
           sFiltro := sFiltro +  ' AND (RTRIM(S.CODCENTROCUSTO) = '''+sCCusto+''') ';
           sfiltro := sfiltro +  'AND (IDEMPRESA = '+ FloatToStr(iIdPessoa)+ ') ';
        End;
      End Else
      Begin
        If sFiltro = '' Then
           sFiltro :=  'WHERE (S.CODCENTROCUSTO IS NULL) '
        Else
           sFiltro := sFiltro +  'AND (S.CODCENTROCUSTO IS NULL ) ';
      End;
      //-------------------------------------------------------------------
      sfiltro := sfiltro + 'AND  (S.PERNUMERO = P.PERNUMERO) ' +
                           'AND  (S.PEREXERCICIO = P.PEREXERCICIO) ' +
                           'AND  (S.IDPESSOA = P.IDPESSOA) ';
      //-------------------------------------------------------------------
      sOrdena :=  'ORDER BY  S.PERNUMERO  ';

      sSql := sSql + sFiltro + sOrdena;

      Result := GetDataPacket(sSql);
end;

function TCtrlPlanoSaldo.RetornaSaldoDaConta(iIdPessoa,iExercicio,iUniNegoc,
          iPlano, iSubConta,iPlanoPrev,iPatro:integer;sConta,sCcusto:string ) :OleVariant;
var
  ssql, sfiltro :string;
begin
      ssql := 'SELECT                        ' +
              '   PLANO,                     ' +
              '   IDPLANOSALDO,              ' +
              '   UNIDNEGOC,                 ' +
              '   IDPESSOA,                  ' +
              '   PLACONTA,                  ' +
              '   PEREXERCICIO,              ' +
              '   PERNUMERO,                 ' +
              '   IDEMPRESA,                 ' +
              '   CODCENTROCUSTO,            ' +
              '   PLSDEBITOCORRENTE,         ' +
              '   PLSCREDITOCOR,             ' +
              '   PLSDEBITOOFICIAL,          ' +
              '   PLSCREDITOOFICIAL,         ' +
              '   PLSDEBITOGER,              ' +
              '   PLSCREDITOGER,             ' +
              '   PLSDEBITOGEREN1,           ' +
              '   PLSCREDITOGEREN1,          ' +
              '   PLSDEBITOGEREN2,           ' +
              '   PLSCREDITOGEREN2,          ' +
              '   PLSDEBITOHIST,             ' +
              '   PLSCREDITOHIST,            ' +
              '   IDUSUARIOINCLUSAO,         ' +
              '   CODSUBCONTA,               ' +
              '   PLSTIPO                    ' +
              'FROM                          ' +
              '   PLANOSALDO                 ' ;
     //------------------------------------------------------------------
      sfiltro := '';
      If (iIdpessoa <> 0) Then
         sfiltro :=  'WHERE (IDPESSOA = '+FloatToStr(iIdPessoa)+ ') ';
     //------------------------------------------------------------------
     If iExercicio > 0 Then
     Begin
        If sfiltro = '' Then
           sfiltro :=  'WHERE (PEREXERCICIO = '+ FloatToStr(iExercicio)+ ') '
        Else
           sfiltro := sfiltro +  'AND (PEREXERCICIO = '+ FloatToStr(iExercicio)+ ') '
     End;
     //------------------------------------------------------------------
     sfiltro := sfiltro +  'AND (PERNUMERO IS NULL) ';
     //------------------------------------------------------------------
     If iUniNegoc <> 0 Then
     Begin
        If sfiltro = '' Then
           sfiltro :=  'WHERE (UNIDNEGOC= '+ FloatToStr(iUniNegoc)+ ') '
        Else
           sfiltro := sfiltro +  'AND (UNIDNEGOC = '+ FloatToStr(iUniNegoc)+ ') '
     End;
     //------------------------------------------------------------------
     If iPlano > 0 Then
     Begin
        If sfiltro = '' Then
           sfiltro :=  'WHERE (PLANO = '+ FloatToStr(iPlano)+ ') '
        Else
           sfiltro := sfiltro +  'AND (PLANO = '+ FloatToStr(iPlano)+ ') '
     End;
     //------------------------------------------------------------------
     If iSubConta > 0 Then
     Begin
        If sfiltro = '' Then
           sfiltro :=  'WHERE (CODSUBCONTA = '+ FloatToStr(iSubConta)+ ') '
        Else
           sfiltro := sfiltro +  'AND (CODSUBCONTA = '+ FloatToStr(iSubConta)+ ') '
     End Else
     Begin
        If sfiltro = '' Then
           sfiltro :=  'WHERE (CODSUBCONTA IS NULL)  '
        Else
           sfiltro := sfiltro +  'AND (CODSUBCONTA IS NULL) ';
     End;

     //------------------------------------------------------------------
     If (Trim(sConta) <> '') Then
     Begin
        If sfiltro = '' Then
           sfiltro :=  'WHERE (RTRIM(PLACONTA) = '''+ sConta+ ''') '
        Else
           sfiltro := sfiltro +  'AND (RTRIM(PLACONTA) = '''+ sConta+ ''') ';
     End;
     //------------------------------------------------------------------
     If (Trim(sCcusto) <> '') Then
     Begin
        If sfiltro = '' Then
        Begin
           sfiltro :=  'WHERE (RTRIM(CODCENTROCUSTO) = '''+ sCcusto+ ''') ';
           sfiltro :=  'AND (IDEMPRESA = '+ FloatToStr(iIdPessoa)+ ') ';
        End
        Else Begin
           sfiltro := sfiltro +  'AND (RTRIM(CODCENTROCUSTO) = '''+ sCcusto+ ''') ';
           sfiltro := sfiltro +  'AND (IDEMPRESA = '+ FloatToStr(iIdPessoa)+ ') ';
         End
     End Else
     Begin
        If sfiltro = '' Then
           sfiltro :=  'WHERE (CODCENTROCUSTO IS NULL) '
        Else
           sfiltro := sfiltro +  'AND (CODCENTROCUSTO IS NULL) ';
     End;
     //------------------------------------------------------------------
     ssql := ssql + sfiltro;

     Result := GetDataPacket(ssql);
end;

procedure TCtrlPlanoSaldo.DoChangeDataBase;
begin
  inherited;
  _dbPlanoSaldo.DataBaseName := DataBaseName;

end;

function TCtrlPlanoSaldo.RetornaUnidNegoc(iIdEmpresa :Integer): Boolean;
var  sSql : string;
begin

     sSql := 'SELECT UNIDNEGOC  ' +
             'FROM PARAMGLOBAL  ' +
             'WHERE (IDPESSOA = ' + FloatToStr(iIdEmpresa)+')';

     _cds.Data := GetDataPacket(sSql);

     If Not _cds.IsEmpty Then
     Begin
        FRetornaUniNegoc := _cds.FieldByName('UNIDNEGOC').AsInteger;
        Result := True;
     End Else
     Begin
        Result           := False;
        FRetornaUniNegoc := 0;
     End;

end;

Function TCtrlPlanoSaldo.InserePlanoSaldo(iPlano,iUniNegoc,iUsuInclusao,idEmpresa,idModulo,idPessoa,iExercicio,
                         iPerNumero,iPatro, iPlanoPrev,iSubConta :integer; sConta,sCcusto,sTipoConta:string;
                         dDebitoCorrente, dCreditoCor, dDebitoOficial, dCreditoOficial,
                         dDebitoHist,dCreditoHist,dDebitoGer,dCreditoGer,dDebitoGeren1,
                         dCreditoGeren1,dDebitoGeren2,dCreditoGeren2,dOrcadoDebito,
                         dOrcadoCredito:double):Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.InserePlanoSaldo(iPlano,iUniNegoc,iUsuInclusao,idEmpresa,idModulo,idPessoa,iExercicio,
                                         iPerNumero,iPatro, iPlanoPrev,iSubConta, sConta,sCcusto,sTipoConta,
                                         dDebitoCorrente, dCreditoCor, dDebitoOficial, dCreditoOficial,
                                         dDebitoHist,dCreditoHist,dDebitoGer,dCreditoGer,dDebitoGeren1,
                                         dCreditoGeren1,dDebitoGeren2,dCreditoGeren2,dOrcadoDebito,
                                         dOrcadoCredito);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      Try
          _dbPlanoSaldo.Plano.AsFloat             := iPlano;
          _dbPlanoSaldo.Placonta.AsString         := sConta;
          _dbPlanoSaldo.Perexercicio.AsInteger    := iExercicio;
          _dbPlanoSaldo.Pernumero.AsInteger       := iPernumero;
          _dbPlanoSaldo.Idusuarioinclusao.AsFloat := iUsuInclusao;
          _dbPlanoSaldo.Idplanoprev.AsFloat       := iPlanoPrev;
          _dbPlanoSaldo.Idpatro.AsFloat           := iPatro;
          _dbPlanoSaldo.Idpessoa.AsFloat          := IdEmpresa;
          _dbPlanoSaldo.Codcentrocusto.AsString   := sCcusto;
          _dbPlanoSaldo.Unidnegoc.AsFloat         := iUniNegoc;
          _dbPlanoSaldo.Plsorcadodebito.AsFloat   := dOrcadoDebito;
          _dbPlanoSaldo.Plsorcadocredito.AsFloat  := dOrcadoCredito;
          _dbPlanoSaldo.Codsubconta.AsInteger     := iSubConta;
          _dbPlanoSaldo.Plstipo.AsString          := sTipoConta;
          _dbPlanoSaldo.Plsdebitocorrente.AsFloat := dDebitoCorrente;;
          _dbPlanoSaldo.Plscreditocor.AsFloat     := dCreditoCor;
          _dbPlanoSaldo.Plsdebitooficial.AsFloat  := dDebitoOficial;
          _dbPlanoSaldo.Plscreditooficial.AsFloat := dCreditoOficial;
          _dbPlanoSaldo.Plsdebitohist.AsFloat     := dDebitoHist;
          _dbPlanoSaldo.PlscreditoHist.AsFloat    := dCreditoHist;
          _dbPlanoSaldo.Plsdebitoger.AsFloat      := dDebitoGer;
          _dbPlanoSaldo.PlscreditoGer.AsFloat     := dCreditoGer;
          _dbPlanoSaldo.Plsdebitogeren1.AsFloat   := dDebitoGeren1;
          _dbPlanoSaldo.Plscreditogeren1.AsFloat  := dCreditoGeren1;
          _dbPlanoSaldo.Plsdebitogeren2.AsFloat   := dDebitoGeren2;
          _dbPlanoSaldo.Plscreditogeren2.AsFloat  := dCreditoGeren2;
         //----------------------------------------------------------------
          If sCcusto <> '' Then
             _dbPlanoSaldo.Idempresa.AsFloat  := IdEmpresa
          Else
             _dbPlanoSaldo.Idempresa.AsFloat  := 0;
         //----------------------------------------------------------------
          StartTransaction;
          Result := _dbPlanoSaldo.Insert;

          If Not Result Then
          Begin
            MessageInfo := _dbPlanoSaldo.MessageInfo;
            Rollback;
          End Else
          Begin
            If not Padroes.GravaLogOperacoes(idEmpresa,idModulo,iUsuInclusao, 'Saldo Anterior - Inserção',False) then
               Raise Exception.Create( Padroes.MessageInfo );

            Commit;
          End;
     Except
         On E:Exception Do
         Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
    End;
  End;
end;

Function TCtrlPlanoSaldo.AlteraMovimAnterior(idPlanoSaldo,dDebitoCorrente,
                                             dCreditoCor:double):Boolean;
var sSqlSaldo :TCMSqlParams;
    smens :string;
begin
   {Funcão implementada na Aplicação Servidora}

   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AlteraMovimAnterior(idPlanoSaldo,dDebitoCorrente, dCreditoCor);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      sSqlSaldo := TCMSqlParams.Create(nil);
      sSqlSaldo.ControlObject := Self;
      Result := True;
      Try
          StartTransaction;

          sSqlSaldo.SQL.Clear;
          sSqlSaldo.SQL.Add('UPDATE PLANOSALDO SET                          ');
          sSqlSaldo.SQL.Add('       PLSDEBITOCORRENTE  =:PLSDEBITOCORRENTE, ');
          sSqlSaldo.SQL.Add('       PLSCREDITOCOR =:PLSCREDITOCOR           ');
          sSqlSaldo.SQL.Add('WHERE                                          ');
          sSqlSaldo.SQL.Add('       IDPLANOSALDO =:IDPLANOSALDO             ');

          sSqlSaldo.Prepare;
          //---------------------------------------------------------------
          sSqlSaldo.ParamByName('IDPLANOSALDO').asFloat      := idPlanoSaldo;
          //---------------------------------------------------------------

          sSqlSaldo.ParamByName('PLSDEBITOCORRENTE').asFloat := dDebitoCorrente;
          sSqlSaldo.ParamByName('PLSCREDITOCOR').asFloat     := dCreditoCor;

          If not ExecSQL(sSqlSaldo.SQLChanged,False) Then
          begin
            sMens := 'Erro ao Atualizar a Tabela PLANOSALDO.';
            Raise Exception.Create(sMens);
          end;

          Commit;

     Except
         On E:Exception Do
         Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
     End;
     sSqlSaldo.free;
  End;
end;

function TCtrlPlanoSaldo.AlteraOrcamento(idPlanoSaldo, dOrcadoDebito, dOrcadoCredito: Double): Boolean;
var sSqlSaldo :TCMSqlParams;
    sMens :string;
begin
   {Funcão implementada na Aplicação Servidora}

   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AlteraOrcamento(idPlanoSaldo,dOrcadoDebito,dOrcadoCredito);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      sSqlSaldo := TCMSqlParams.Create(nil);
      sSqlSaldo.ControlObject := Self;
      Result := True;
      Try
          StartTransaction;

          sSqlSaldo.SQL.Clear;
          sSqlSaldo.SQL.Add('UPDATE PLANOSALDO SET                          ');
          sSqlSaldo.SQL.Add('       PLSORCADODEBITO  =:PLSORCADODEBITO,     ');
          sSqlSaldo.SQL.Add('       PLSORCADOCREDITO =:PLSORCADOCREDITO     ');
          sSqlSaldo.SQL.Add('WHERE                                          ');
          sSqlSaldo.SQL.Add('       IDPLANOSALDO =:IDPLANOSALDO             ');

          sSqlSaldo.Prepare;
          //---------------------------------------------------------------
          sSqlSaldo.ParamByName('IDPLANOSALDO').asFloat      := idPlanoSaldo;
          //---------------------------------------------------------------

          sSqlSaldo.ParamByName('PLSORCADODEBITO').asFloat  := dOrcadoDebito;
          sSqlSaldo.ParamByName('PLSORCADOCREDITO').asFloat := dOrcadoCredito;

          If not ExecSQL(sSqlSaldo.SQLChanged,False) Then
          begin
             sMens := 'Erro ao Atualizar a Tabela PLANOSALDO.';
             Raise Exception.Create(sMens);
          end;

          Commit;

     Except
         On E:Exception Do
         Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
     End;
     sSqlSaldo.free;
  End;

end;

function TCtrlPlanoSaldo.AlteraSaldoAnterior(dEmpresa,dModulo,dUsuario,idPlanoSaldo, dDebitoCorrente,
  dCreditoCor, dDebitoOficial, dCreditoOficial, dDebitoHist, dCreditoHist,
  dDebitoGer, dCreditoGer, dDebitoGeren1, dCreditoGeren1, dDebitoGeren2,
  dCreditoGeren2: double): Boolean;

var sSqlSaldo :TCMSqlParams;
    sMens :string;
begin
   {Funcão implementada na Aplicação Servidora}

   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AlteraSaldoAnterior(dEmpresa,dModulo,dUsuario,idPlanoSaldo, dDebitoCorrente,
                                                        dCreditoCor, dDebitoOficial, dCreditoOficial, dDebitoHist, dCreditoHist,
                                                        dDebitoGer, dCreditoGer, dDebitoGeren1, dCreditoGeren1, dDebitoGeren2,
                                                        dCreditoGeren2);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      sSqlSaldo := TCMSqlParams.Create(nil);
      sSqlSaldo.ControlObject := Self;
      Result := True;
      Try
         StartTransaction;

         sSqlSaldo.SQL.Clear;
         sSqlSaldo.SQL.Add('UPDATE PLANOSALDO SET                         ');
         sSqlSaldo.SQL.Add('       PLSDEBITOCORRENTE =:PLSDEBITOCORRENTE, ');
         sSqlSaldo.SQL.Add('       PLSCREDITOCOR     =:PLSCREDITOCOR,     ');
         sSqlSaldo.SQL.Add('       PLSDEBITOOFICIAL  =:PLSDEBITOOFICIAL,  ');
         sSqlSaldo.SQL.Add('       PLSCREDITOOFICIAL =:PLSCREDITOOFICIAL, ');
         sSqlSaldo.SQL.Add('       PLSDEBITOGER      =:PLSDEBITOGER,      ');
         sSqlSaldo.SQL.Add('       PLSCREDITOGER     =:PLSCREDITOGER,     ');
         sSqlSaldo.SQL.Add('       PLSDEBITOGEREN1   =:PLSDEBITOGEREN1,   ');
         sSqlSaldo.SQL.Add('       PLSCREDITOGEREN1  =:PLSCREDITOGEREN1,  ');
         sSqlSaldo.SQL.Add('       PLSDEBITOGEREN2   =:PLSDEBITOGEREN2,   ');
         sSqlSaldo.SQL.Add('       PLSCREDITOGEREN2  =:PLSCREDITOGEREN2,  ');
         sSqlSaldo.SQL.Add('       PLSDEBITOHIST     =:PLSDEBITOHIST,     ');
         sSqlSaldo.SQL.Add('       PLSCREDITOHIST    =:PLSCREDITOHIST     ');
         sSqlSaldo.SQL.Add('WHERE                                         ');
         sSqlSaldo.SQL.Add('       IDPLANOSALDO =:IDPLANOSALDO            ');

         sSqlSaldo.Prepare;
         //---------------------------------------------------------------
         sSqlSaldo.ParamByName('IDPLANOSALDO').asFloat      := idPlanoSaldo;
         //---------------------------------------------------------------

         sSqlSaldo.ParamByName('PLSDEBITOCORRENTE').asFloat := dDebitoCorrente;
         sSqlSaldo.ParamByName('PLSCREDITOCOR').asFloat     := dCreditoCor;
         sSqlSaldo.ParamByName('PLSDEBITOOFICIAL').asFloat  := dDebitoOficial;
         sSqlSaldo.ParamByName('PLSCREDITOOFICIAL').asFloat := dCreditoOficial;
         sSqlSaldo.ParamByName('PLSDEBITOHIST').asFloat     := dDebitoHist;
         sSqlSaldo.ParamByName('PLSCREDITOHIST').asFloat    := dCreditoHist;
         sSqlSaldo.ParamByName('PLSDEBITOGER').asFloat      := dDebitoGer;
         sSqlSaldo.ParamByName('PLSCREDITOGER').asFloat     := dCreditoGer;
         sSqlSaldo.ParamByName('PLSDEBITOGEREN1').asFloat   := dDebitoGeren1;
         sSqlSaldo.ParamByName('PLSCREDITOGEREN1').asFloat  := dCreditoGeren1;
         sSqlSaldo.ParamByName('PLSDEBITOGEREN2').asFloat   := dDebitoGeren2;
         sSqlSaldo.ParamByName('PLSCREDITOGEREN2').asFloat  := dCreditoGeren2;


         If not ExecSQL(sSqlSaldo.SQLChanged,False) Then
         begin
            sMens := 'Erro ao Atualizar a Tabela PLANOSALDO.';
            Raise Exception.Create(sMens);
         end;

         If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Saldo Anterior - Alteração',False) then
            Raise Exception.Create( Padroes.MessageInfo );

         Commit;

     Except
         On E:Exception Do
         Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
     End;
     sSqlSaldo.free;
  End;

end;

procedure TCtrlPlanoSaldo.AfterInitialize;
begin
  inherited;
  Padroes.initializeas(self);
  Padroes.OnMessageInfo := nil;

end;

{ 05/08/03 - by Alex - No escopo da função se o iPlanoPrev for atribuído o
  iIdPatro também deve ser passado }
function TCtrlPlanoSaldo.RetornaSaldoContaExerc(const iPerExercicio,
  iPerNumero, iPlano: integer; const dIdpessoa: double; const sPlanoconta: string;
  const Periodo: tPeriodo; const iIdPlanoPrev,
  iIdPatro: integer): OleVariant;
var
  sSql: string;
begin
  sSql := 'SELECT C.PLANOME, C.PLATIPO, C.PLANATUREZA, C.PLACONTA, ' + #13 +
          '       ROUND(SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)),2) AS DEBITO, ' + #13 +
          '       ROUND(SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)),2) AS CREDITO ' + #13 +
          'FROM PLANOCONTA C, PLANOSALDO S ' + #13 +
          'WHERE (S.PEREXERCICIO = ' + IntToStr(iPerExercicio) + ') ' + #13;

  if Periodo = tAtual then
    sSql := sSql + '  AND ((S.PERNUMERO <= ' + IntToStr(iPerNumero) + ' ) OR (S.PERNUMERO IS NULL)) ' + #13
  else  // período anterior
    sSql := sSql + '  AND ((S.PERNUMERO <  ' + IntToStr(iPerNumero) + ' ) OR (S.PERNUMERO IS NULL)) ' + #13;

  sSql := sSql + '  AND (S.IDPESSOA     = ' + FloatToStr (dIdPessoa) + ')' + #13 +
                 // 05/08/03 by Alex checar se realmente é necessário a utilização do copy
                 '  AND (S.PLACONTA     = ' + QuotedStr(sPlanoconta) + ')' + #13 +
                 '  AND (S.PLANO        = ' + IntToStr (iPlano)      + ')' + #13;

  if (iIdPlanoPrev <> -99) and (iIdPatro <> -99) then begin
    sSql := sSql + '  AND (S.IDPLANOPREV  = ' + IntToStr (iIdPlanoPrev) + ')' + #13 +
                   '  AND (S.IDPATRO      = ' + IntToStr (iIdPatro)     + ')' + #13;
  end;

  sSql := sSql + '  AND (S.PLACONTA     = C.PLACONTA) ' + #13 +
                 '  AND (S.PLANO        = C.PLANO) ' + #13 +
                 'GROUP BY C.PLANOME, C.PLATIPO, C.PLANATUREZA, C.PLACONTA ';

  Result := GetDataPacket(sSql);

end;

end.
