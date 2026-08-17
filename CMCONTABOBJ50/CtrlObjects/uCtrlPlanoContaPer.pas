unit uCtrlPlanoContaPer;

(*==============================================================================
Analista : Alex Pereira
Data     : 06/01/04
Pendência: 14451 Nova estrutura para segregação

Métodos atualizados:

Pendentes: TCtrlPlanoContaPer.Gravar
           12/02/04 Nada a fazer.
           Este processo pega o saldo contábil de uma conta
           e transfere para outra pelo desmembramento.
           Ou pega o saldo de n contas e transfere para uma
           pelo agrupamento.
           A query é feita pelo plano saldo, não sendo
           possível levar o critério para segregação.
           Este processo somente deve ser executado
           ao fim da segreação.

Solução  : Criar a estrutura IDSEGREGACRITER e DATASEGREGACRITER
           no lançamento contábil.

==============================================================================*)

interface

Uses DB, uDataBase, uDbPlanoContaPer, uCmControlObject, dbclient, sysutils,Provider,
     uCtrlGeral, ComCtrls,CMProcuraMask, CMProcura,DBTables, uCMSqlParams,uMidasUtil,
     uFuncaoGeral,uCtrlLancamento, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TCtrlPlanoContaPer = Class(TCmControlObject)

    private
       FuncaoGeral    : TFuncaoGeral;
       Lancamento     : TCtrlLancamento;


      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbPlanoContaPer  : TDbPlanoContaPer;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsPlanoContaPer : TClientDataSet;

      procedure SetCdsPLanoContaPer(const Value: TClientDataSet);

    protected

      procedure AfterInitialize;override;
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsPLanoContaPer : TClientDataSet Read FCdsPLanoContaPer  Write SetCdsPLanoContaPer;

      {Esta função tem com objetivo retornar registros da tabela planocontaper}
      Function ListPlanoContaPer(idPlanoContaPer :Double) :OleVariant;

     {Esta função tem como objetivo gravar registros da tabela planocontasper}
      function Gravar(iEmpresa,iModulo,iUsuario,iPlano,iPeriodo:Integer;sNomeContaAnalitica,
                       sComplContaAnalitica,sConta,sMascaraPlano,sDataIni:string;bUsaPPatro:Boolean) :Boolean;

      function Apagar :Boolean;
      function InsereContaAna(iEmpresa,iPlano,iUsuario:Integer;sConta,sPlaContaAna,sMascaraPlano,sNomeContaAnalitica:String):Boolean;
      function CriaCodReduz(iEmpresa:Integer;sGrupo: char):integer;
      function CriaContasxCC(iPlano,iUsuario:Integer;sContaDe,sContaPara : String):Boolean;

    protected
    End;


implementation

constructor TCtrlPlanoContaPer.Create;
begin
  inherited;
  Lancamento     := TCtrlLancamento.Create;
  FuncaoGeral    := TFuncaoGeral.Create;
  _dbPlanoContaPer  := TDbPlanoContaPer.Create(Self);
end;

destructor TCtrlPlanoContaPer.Destroy;
begin
  inherited;
  FuncaoGeral.Free;
  Lancamento.Free;

  _dbPlanoContaPer.Free;

  If IsAppServer Then FCdsPlanoContaPer.Free;

end;

procedure TCtrlPlanoContaPer.OnCreateAppServer;
begin
  inherited;
  FCdsPlanoContaPer := TClientDataSet.Create(nil);

end;

function TCtrlPlanoContaPer.Gravar(iEmpresa,iModulo,iUsuario,iPlano,iPeriodo:Integer;sNomeContaAnalitica,
  sComplContaAnalitica,sConta,sMascaraPlano,sDataIni:string;bUsaPPatro:Boolean) :Boolean;
var
   sContaAna  : String;

   _sqlPlanoConta    :TCMSqlParams;
   _sqlPlanoContaAna :TCMSqlParams;
   _sqlContaPerNull  :TCMSqlParams;
   _sqlContaPer      :TCMSqlParams;
   _sqlAux           :TCMSqlParams;
   _sqlSaldo         :TCMSqlParams;

   _cdsPlanoConta    :TClientDataSet;
   _cdsPlanoContaAna :TClientDataSet;
   _cdsContaPerNull  :TClientDataSet;
   _cdsContaPer      :TClientDataSet;
   _cdsSaldo         :TClientDataSet;

   rIdPlanoContaPer,  dPlnCodigo : Double;
   iPerAnt :Integer;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin

      Result := Connection.AppServer.GravarPlanoContaPer(iEmpresa,iModulo,iUsuario,iPlano,iPeriodo,
                             sNomeContaAnalitica,sComplContaAnalitica,sConta,sMascaraPlano,sDataIni,
                             bUsaPPatro,FcdsPlanoContaPer.Data);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      _sqlAux  := TCMSqlParams.Create(nil);
      _sqlAux.ControlObject := Self;


      _sqlPlanoConta  := TCMSqlParams.Create(nil);
      _sqlPlanoConta.ControlObject := Self;

      _sqlPlanoContaAna  := TCMSqlParams.Create(nil);
      _sqlPlanoContaAna.ControlObject := Self;

      _sqlContaPerNull  := TCMSqlParams.Create(nil);
      _sqlContaPerNull.ControlObject := Self;

      _sqlSaldo  := TCMSqlParams.Create(nil);
      _sqlSaldo.ControlObject := Self;

      _sqlContaPer  := TCMSqlParams.Create(nil);
      _sqlContaPer.ControlObject := Self;

      _cdsContaPer      := TClientDataSet.Create(nil);
      _cdsContaPerNull  := TClientDataSet.Create(nil);
      _cdsPlanoConta    := TClientDataSet.Create(nil);
      _cdsPlanoContaAna := TClientDataSet.Create(nil);
      _cdsSaldo         := TClientDataSet.Create(nil);
      dPlnCodigo:= 0;

      sContaAna  := '';

     Try

         StartTransaction;

         //---------------------------------------------------------------------
         // Pega o sequencial da tabela principal
         //---------------------------------------------------------------------
         if FCdsPlanoContaPer.FieldByName('IDPLANOCONTAPER').IsNull then
         begin
            FCdsPlanoContaPer.FieldByName('IDPLANOCONTAPER').asFloat := GetSequence('PLANOCONTAPER')
         end;

         //---------------------------------------------------------------------
         // Pega o nome e o tipo da conta
         //---------------------------------------------------------------------
         _sqlPlanoConta.Sql.Clear;
         _sqlPlanoConta.Sql.Add('SELECT                                       ');
         _sqlPlanoConta.Sql.Add('   PLACONTA, PLATIPO, PLANOME, PLAINATIVA    ');
         _sqlPlanoConta.Sql.Add('FROM  PLANOCONTA                             ');
         _sqlPlanoConta.Sql.Add('WHERE                                        ');
         _sqlPlanoConta.Sql.Add('    (PLANO =:PLANO) AND                      ');
         _sqlPlanoConta.Sql.Add('    (PLACONTA =:PLACONTA)                    ');

         _sqlPlanoConta.Prepare;
         _sqlPlanoConta.ParamByName('PLANO').asInteger   := FCdsPlanoContaPer.FieldByName('PLANO').AsInteger;
         _sqlPlanoConta.ParamByName('PLACONTA').asString := Copy(FCdsPlanoContaPer.FieldByName('PLACONTA').asString + '                  ',1,18);
         _cdsPlanoConta.Data := _sqlPlanoConta.Data;
         //---------------------------------------------------------------------

         iPerAnt          := iPeriodo - 1;
         rIdPlanoContaPer := 0;

         if iPerAnt <= 0 then
         begin
           _sqlContaPerNull.Sql.Clear;
           _sqlContaPerNull.Sql.Add('SELECT IDPLANOCONTAPER FROM PLANOCONTAPER ');
           _sqlContaPerNull.Sql.Add('WHERE (PEREXERCICIO = :PEREXERCICIO)      ');
           _sqlContaPerNull.Sql.Add('  AND (PERNUMERO IS NULL)                 ');
           _sqlContaPerNull.Sql.Add('  AND (PLACONTA = :PLACONTA)              ');
           _sqlContaPerNull.Sql.Add('  AND (IDPESSOA = :IDPESSOA)              ');
           _sqlContaPerNull.Sql.Add('  AND (PLANO = :PLANO)                    ');

           _sqlContaPerNull.Prepare;
           _sqlContaPerNull.ParamByName('PEREXERCICIO').AsInteger := FCdsPlanoContaPer.FieldByName('PEREXERCICIO').AsInteger;
           _sqlContaPerNull.ParamByName('IDPESSOA').AsInteger     := FCdsPlanoContaPer.FieldByName('IDPESSOA').AsInteger;
           _sqlContaPerNull.ParamByName('PLANO').AsInteger        := FCdsPlanoContaPer.FieldByName('PLANO').AsInteger;
           _sqlContaPerNull.ParamByName('PLACONTA').AsString      := Copy(FCdsPlanoContaPer.FieldByName('PLACONTA').asString + '                  ',1,18);

           _cdsContaPerNull.Data := _sqlContaPerNull.Data;

           if not _cdsContaPerNull.IsEmpty then
              rIdPlanoContaPer := _cdsContaPerNull.FieldByName('IDPLANOCONTAPER').AsFloat;

         end else
         begin
            _sqlContaPer.Sql.Clear;
            _sqlContaPer.Sql.Add('SELECT IDPLANOCONTAPER                 ');
            _sqlContaPer.Sql.Add('FROM PLANOCONTAPER                     ');
            _sqlContaPer.Sql.Add('WHERE (PEREXERCICIO = :PEREXERCICIO)   ');
            _sqlContaPer.Sql.Add('  AND (PERNUMERO = :PERNUMERO)         ');
            _sqlContaPer.Sql.Add('  AND (PLACONTA = :PLACONTA)           ');
            _sqlContaPer.Sql.Add('  AND (IDPESSOA = :IDPESSOA)           ');
            _sqlContaPer.Sql.Add('  AND (PLANO = :PLANO)                 ');

            _sqlContaPer.Prepare;
            _sqlContaPer.ParamByName('PEREXERCICIO').AsInteger := FCdsPlanoContaPer.FieldByName('PEREXERCICIO').AsInteger;
            _sqlContaPer.ParamByName('PERNUMERO').AsInteger    := iPerAnt;
            _sqlContaPer.ParamByName('IDPESSOA').AsInteger     := FCdsPlanoContaPer.FieldByName('IDPESSOA').AsInteger;
            _sqlContaPer.ParamByName('PLANO').AsInteger        := FCdsPlanoContaPer.FieldByName('PLANO').AsInteger;
            _sqlContaPer.ParamByName('PLACONTA').AsString      := Copy(FCdsPlanoContaPer.FieldByName('PLACONTA').asString + '                  ',1,18);
            _cdsContaPer.Data := _sqlContaPer.Data;

            if not _cdsContaPer.IsEmpty then
               rIdPlanoContaPer := _cdsContaPer.FieldByName('IDPLANOCONTAPER').AsFloat;
         end;

         //--------------------------------------------------------------------
         // Salva os dados no periodo anterior
         //--------------------------------------------------------------------
         if rIdPlanoContaPer <> 0 then
         begin
            _sqlAux.SQL.Add('UPDATE PLANOCONTAPER SET ');
            _sqlAux.SQL.Add('       PLANOME = '''+_cdsPlanoConta.FieldByName('PLANOME').AsString+''',');
            _sqlAux.SQL.Add('       PLATIPO = '''+_cdsPlanoConta.FieldByName('PLATIPO').AsString+''',');
            _sqlAux.SQL.Add('       PLAINATIVA = '''+_cdsPlanoConta.FieldByName('PLAINATIVA').AsString+''' ');
            _sqlAux.SQL.Add('WHERE IDPLANOCONTAPER = '+FloatToStr(rIdPlanoContaPer));
         end else
         begin
            _sqlAux.SQL.Add('INSERT INTO PLANOCONTAPER                                         ');
            _sqlAux.SQL.Add('  (IDPLANOCONTAPER, PLANO, PLACONTA, IDPESSOA, PEREXERCICIO,      ');
            _sqlAux.SQL.Add('   PERNUMERO, PLATIPO, PLAINATIVA, PLANOME)                                   ');
            _sqlAux.SQL.Add('values                                                            ');
            _sqlAux.SQL.Add('  (:IDPLANOCONTAPER, :PLANO, :PLACONTA, :IDPESSOA, :PEREXERCICIO, ');
            _sqlAux.SQL.Add('   :PERNUMERO, :PLATIPO, :PLAINATIVA, :PLANOME)                                ');

            _sqlAux.Prepare;
            _sqlAux.ParamByName('IDPLANOCONTAPER').AsFloat := GetSequence('PLANOCONTAPER');
            _sqlAux.ParamByName('PEREXERCICIO').AsInteger  := FCdsPlanoContaPer.FieldByName('PEREXERCICIO').AsInteger;

            if iPerAnt > 0 then begin
               _sqlAux.ParamByName('PERNUMERO').AsInteger := iPerAnt
            end else begin
               _sqlAux.ParamByName('PERNUMERO').Clear;
            end;
            _sqlAux.ParamByName('IDPESSOA').AsInteger      := FCdsPlanoContaPer.FieldByName('IDPESSOA').AsInteger;
            _sqlAux.ParamByName('PLANO').AsInteger         := FCdsPlanoContaPer.FieldByName('PLANO').AsInteger;
            _sqlAux.ParamByName('PLACONTA').AsString       := Copy(FCdsPlanoContaPer.FieldByName('PLACONTA').asString + '                  ',1,18);
            _sqlAux.ParamByName('PLANOME').AsString        := _cdsPlanoConta.FieldByName('PLANOME').AsString;
            _sqlAux.ParamByName('PLATIPO').AsString        := _cdsPlanoConta.FieldByName('PLATIPO').AsString;
            _sqlAux.ParamByName('PLAINATIVA').AsString     := _cdsPlanoConta.FieldByName('PLAINATIVA').AsString;
         end;

         if not ExecSQL(_sqlAux.SQLChanged,False) Then
            Raise Exception.Create(MessageInfo);


         //--------------------------------------------------------------------
         // Gera lançamentos
         //--------------------------------------------------------------------
         if FCdsPlanoContaPer.FieldByName('PLATIPO').AsString <> _cdsPlanoConta.FieldByName('PLATIPO').AsString then
         begin
            //---------------------------------------------------------------
            // Pega o saldo das contas analíticas
            //---------------------------------------------------------------
            _sqlSaldo.Sql.Clear;
            _sqlSaldo.Sql.Add(' SELECT CODCENTROCUSTO, IDEMPRESA, UNIDNEGOC,  ');
            _sqlSaldo.Sql.Add('       IDPATRO, IDPLANOPREV, CODSUBCONTA,      ');
            _sqlSaldo.Sql.Add('       SUM(NVL(PLSDEBITOCORRENTE,0)-NVL(PLSCREDITOCOR,0)) AS SALDO ');
            _sqlSaldo.Sql.Add('FROM PLANOSALDO                                                    ');
            _sqlSaldo.Sql.Add('WHERE (PLACONTA = :PLACONTA)                                       ');
            _sqlSaldo.Sql.Add('  AND (PLANO = :PLANO)                                             ');
            _sqlSaldo.Sql.Add('  AND (PEREXERCICIO = :PEREXERCICIO)                               ');
            _sqlSaldo.Sql.Add('  AND (IDPESSOA = :IDPESSOA)                                       ');
            _sqlSaldo.Sql.Add('  AND ((PERNUMERO < :PERNUMERO) OR (PERNUMERO IS NULL))            ');
            _sqlSaldo.Sql.Add('  AND (PLSTIPO = ''A'')                                            ');
            _sqlSaldo.Sql.Add('GROUP BY CODCENTROCUSTO, IDEMPRESA, UNIDNEGOC,                     ');
            _sqlSaldo.Sql.Add('       IDPATRO, IDPLANOPREV, CODSUBCONTA                           ');

            if FCdsPlanoContaPer.FieldByName('PLATIPO').AsString = 'S' then
            begin

               //---------------------------------------------------------------
               // Insere Conta analitica
               //---------------------------------------------------------------
               sContaAna := trim(FCdsPlanoContaPer.FieldByName('PLACONTA').AsString)+ sComplContaAnalitica;
               if not InsereContaAna(iEmpresa,iPlano,iUsuario,sConta,sContaAna,sMascaraPlano,sNomeContaAnalitica) then
                  Raise Exception.Create(MessageInfo);

               //---------------------------------------------------------------
               // Cria o realcionamento da conta com o centro de custo
               //---------------------------------------------------------------
               CriaContasxCC(iPlano,iUsuario,FCdsPlanoContaPer.FieldByName('PLACONTA').AsString,sContaAna);

               _sqlSaldo.Prepare;
               _sqlSaldo.ParamByName('PEREXERCICIO').AsInteger  := FCdsPlanoContaPer.FieldByName('PEREXERCICIO').AsInteger;
               _sqlSaldo.ParamByName('PERNUMERO').AsInteger     := FCdsPlanoContaPer.FieldByName('PERNUMERO').AsInteger;
               _sqlSaldo.ParamByName('IDPESSOA').AsInteger      := FCdsPlanoContaPer.FieldByName('IDPESSOA').AsInteger;
               _sqlSaldo.ParamByName('PLANO').AsInteger         := FCdsPlanoContaPer.FieldByName('PLANO').AsInteger;
               _sqlSaldo.ParamByName('PLACONTA').AsString       := Copy(FCdsPlanoContaPer.FieldByName('PLACONTA').AsString + '                  ',1,18);
               _cdsSaldo.Data := _sqlSaldo.Data;

               _cdsSaldo.First;
               While not _cdsSaldo.Eof do
               Begin
                  Lancamento.lcTestaConta := False;
                  If not Lancamento.InsereLancaContab('2',
                                                      iEmpresa,
                                                      iModulo,
                                                      iUsuario,
                                                      iPlano,
                                                      _cdsSaldo.FieldbyName('UNIDNEGOC').AsFloat,
                                                      _cdsSaldo.FieldbyName('CODSUBCONTA').AsFloat,
                                                      _cdsSaldo.FieldbyName('CODSUBCONTA').AsFloat,
                                                      _cdsSaldo.FieldbyName('IDPLANOPREV').AsFloat,
                                                      _cdsSaldo.FieldByName('IDPATRO').AsFloat,
                                                      dPlnCodigo,
                                                      0,
                                                      sDataIni,
                                                      'Desmembramento',
                                                      'Desmembramento de contas',
                                                      '',
                                                      '',
                                                      '',
                                                      '',
                                                      '03',
                                                      _cdsSaldo.FieldbyName('CODCENTROCUSTO').asString,
                                                      sContaAna,
                                                      _cdsSaldo.FieldbyName('CODCENTROCUSTO').AsString,
                                                      FCdsPlanoContaPer.FieldByName('PLACONTA').AsString,
                                                      '',
                                                      _cdsSaldo.FieldByName('SALDO').AsFloat,
                                                      False,bUsaPPatro,
                                                      // 06/01/04 Alex 14451 - Pendente nova segregação
                                                      -1, -1) Then

                  Begin
                    Raise Exception.Create(Lancamento.MessageInfo);
                  End Else
                  Begin
                       dPlnCodigo := Lancamento.RetornoPlnCodigo;
                  End;

                  _cdsSaldo.Next;
               End;
            End else
            Begin
               _sqlPlanoContaAna.Sql.Clear;
               _sqlPlanoContaAna.Sql.Add('SELECT PLACONTA, PLATIPO, PLANOME ,PLAINATIVA  ');
               _sqlPlanoContaAna.Sql.Add('FROM  PLANOCONTA                   ');
               _sqlPlanoContaAna.Sql.Add('WHERE (PLANO =:PLANO) AND          ');
               _sqlPlanoContaAna.Sql.Add('      (PLATIPO = ''A'') AND        ');
               _sqlPlanoContaAna.Sql.Add('      (PLACONTA LIKE :PLACONTA)    ');

               _sqlPlanoContaAna.Prepare;
               _sqlPlanoContaAna.ParamByName('PLANO').AsInteger   := FCdsPlanoContaPer.FieldByName('PLANO').AsInteger;
               _sqlPlanoContaAna.ParamByName('PLACONTA').AsString := trim(FCdsPlanoContaPer.FieldByName('PLACONTA').AsString)+'%';
               _cdsPlanoContaAna.Data := _sqlPlanoContaAna.Data;

               if not _cdsPlanoContaAna.IsEmpty then
               begin
                  _cdsPlanoContaAna.First;
                  While not _cdsPlanoContaAna.Eof do
                  begin
                     CriaContasxCC(iPlano,iUsuario,_cdsPlanoContaAna.FieldByName('PLACONTA').AsString,FCdsPlanoContaPer.FieldByName('PLACONTA').AsString);
                     _sqlSaldo.Prepare;
                     _sqlSaldo.ParamByName('PEREXERCICIO').AsInteger  := FCdsPlanoContaPer.FieldByName('PEREXERCICIO').AsInteger;
                     _sqlSaldo.ParamByName('PERNUMERO').AsInteger     := FCdsPlanoContaPer.FieldByName('PERNUMERO').AsInteger;
                     _sqlSaldo.ParamByName('IDPESSOA').AsInteger      := FCdsPlanoContaPer.FieldByName('IDPESSOA').AsInteger;
                     _sqlSaldo.ParamByName('PLANO').AsInteger         := FCdsPlanoContaPer.FieldByName('PLANO').AsInteger;
                     _sqlSaldo.ParamByName('PLACONTA').AsString       := Copy(_cdsPlanoContaAna.FieldByName('PLACONTA').AsString + '                  ',1,18);
                     _cdsSaldo.Data := _sqlSaldo.Data;

                     _cdsSaldo.First;
                     While not _cdsSaldo.Eof do
                     begin
                        Lancamento.lcTestaConta := False;
                        If not Lancamento.InsereLancaContab('2',
                                                            iEmpresa,
                                                            iModulo,
                                                            iUsuario,
                                                            iPlano,
                                                            _cdsSaldo.FieldbyName('UNIDNEGOC').AsFloat,
                                                            _cdsSaldo.FieldbyName('CODSUBCONTA').AsFloat,
                                                            _cdsSaldo.FieldbyName('CODSUBCONTA').AsFloat,
                                                            _cdsSaldo.FieldbyName('IDPLANOPREV').AsFloat,
                                                            _cdsSaldo.FieldByName('IDPATRO').AsFloat,
                                                            dPlnCodigo,
                                                            0,
                                                            sDataIni,
                                                            'Agrupamento',
                                                            'Agrupamento de contas',
                                                            '',
                                                            '',
                                                            '',
                                                            '',
                                                            '03',
                                                            _cdsSaldo.FieldbyName('CODCENTROCUSTO').asString,
                                                            FCdsPlanoContaPer.FieldByName('PLACONTA').AsString,
                                                            _cdsSaldo.FieldbyName('CODCENTROCUSTO').AsString,
                                                            _cdsPlanoContaAna.FieldByName('PLACONTA').AsString,
                                                            '',
                                                            _cdsSaldo.FieldByName('SALDO').AsFloat,
                                                            False,bUsaPPatro,
                                                            // 06/01/04 Alex 14451 - Pendente nova segregação
                                                            -1, -1) Then

                        Begin
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                           dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        _cdsSaldo.Next;
                     End;

                     //---------------------------------------------------------
                     // Atualiza PLANO para colocar as contas analiticas como INATIVAS
                     //---------------------------------------------------------
                     _sqlAux.SQL.Clear;
                     _sqlAux.SQL.Add('UPDATE PLANOCONTA SET ');
                     _sqlAux.SQL.Add('       PLAINATIVA = ''I''');
                     _sqlAux.SQL.Add('WHERE (PLACONTA = '''+Copy(_cdsPlanoContaAna.FieldByName('PLACONTA').AsString + '                  ',1,18)+''')');
                     _sqlAux.SQL.Add('  AND (PLANO = '+IntToStr(FCdsPlanoContaPer.FieldByName('PLANO').AsInteger)+')');

                     If not ExecSQL(_sqlAux.SQLChanged,False) Then
                        Raise Exception.Create(MessageInfo);

                     _cdsPlanoContaAna.Next;
                  End;
               End;
            End;
         End;
         //---------------------------------------------------------------------
         // Atualiza PLANO com os dados atuais
         //---------------------------------------------------------------------
         _sqlAux.SQL.Clear;
         _sqlAux.SQL.Add('UPDATE PLANOCONTA SET ');
         _sqlAux.SQL.Add('       PLANOME = '''+FCdsPlanoContaPer.FieldByName('PLANOME').AsString+''',');
         _sqlAux.SQL.Add('       PLATIPO = '''+FCdsPlanoContaPer.FieldByName('PLATIPO').AsString+''',');
         _sqlAux.SQL.Add('       PLAINATIVA = '''+FCdsPlanoContaPer.FieldByName('PLAINATIVA').AsString+''' ');
         _sqlAux.SQL.Add('WHERE (PLACONTA = '''+Copy(FCdsPlanoContaPer.FieldByName('PLACONTA').AsString + '                  ',1,18)+''')');
         _sqlAux.SQL.Add('  AND (PLANO = '+IntToStr(FCdsPlanoContaPer.FieldByName('PLANO').AsInteger)+')');

         If not ExecSQL(_sqlAux.SQLChanged,False) Then
            Raise Exception.Create(MessageInfo);
         //---------------------------------------------------------------------

         FCdsPlanoContaPer.Post;
         Result := True;
         //---------------------------------------------------------------------
         Commit;
         MessageInfo := 'Alteração do Plano Efetuada com Sucesso';

        _sqlAux.free;
        _sqlPlanoConta.free;
        _sqlPlanoContaAna.free;
        _sqlContaPerNull.free;
        _sqlSaldo.free;
        _sqlContaPer.free;

       _cdsContaPer.free;
       _cdsContaPerNull.free;
       _cdsPlanoConta.free;
       _cdsPlanoContaAna.free;
       _cdsSaldo.free;

     Except
         On E:Exception Do
         Begin
             _sqlAux.free;
             _sqlPlanoConta.free;
             _sqlPlanoContaAna.free;
             _sqlContaPerNull.free;
             _sqlSaldo.free;
             _sqlContaPer.free;

             _cdsContaPer.free;
             _cdsContaPerNull.free;
             _cdsPlanoConta.free;
             _cdsPlanoContaAna.free;
             _cdsSaldo.free;

            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
   End;
end;



function TCtrlPlanoContaPer.ListPlanoContaPer(IdPlanoContaPer:Double) :OleVariant;
var
  sSql, sFiltro :string;
begin
         sSql := 'SELECT '+
                 '    IDPLANOCONTAPER, '+
                 '    PLANO,           '+
                 '    PLACONTA,        '+
                 '    IDPESSOA,        '+
                 '    PEREXERCICIO,    '+
                 '    PERNUMERO,       '+
                 '    PLATIPO,         '+
                 '    PLAINATIVA,      '+
                 '    PLANOME          '+
                 'FROM PLANOCONTAPER   ';
      //----------------------------------------------------------
      sfiltro := '';
      If (idPlanoContaPer <> 0) Then
         sfiltro := 'WHERE (IDPLANOCONTAPER = ' + FloatToStr(idPlanoContaPer) + ') ';
     //----------------------------------------------------------
     sSql := sSql + sFiltro;

     Result := GetDataPacket(sSql);

end;



procedure TCtrlPlanoContaPer.DoChangeDataBase;
begin
  inherited;
  _dbPlanoContaPer.DataBaseName := DataBaseName;

end;

procedure TCtrlPlanoContaPer.SetCdsPlanoContaPer(const Value: TClientDataSet);
begin
  FCdsPlanoContaPer := Value;
end;



function  TCtrlPlanoContaPer.InsereContaAna(iEmpresa,iPlano,iUsuario:Integer;sConta,sPlaContaAna,sMascaraPlano,sNomeContaAnalitica:string) :Boolean;
var cGrupo : Char;
    sGrupo : String;
    iGrau  : Integer;

   _sqlAux2         :TCMSqlParams;
   _sqlPlanoConta   :TCMSqlParams;
   _cdsPlanoConta   :TClientDataSet;

begin
    _sqlPlanoConta  := TCMSqlParams.Create(nil);
    _sqlPlanoConta.ControlObject := Self;

    _sqlAux2  := TCMSqlParams.Create(nil);
    _sqlAux2.ControlObject := Self;

    _cdsPlanoConta   := TClientDataSet.Create(nil);
    Try


        //---------------------------------------------------------------------
        _sqlPlanoConta.Sql.Clear;
        _sqlPlanoConta.Sql.Add('SELECT                                                                      ');
        _sqlPlanoConta.Sql.Add('   PLACONTA, PLATIPO, PLANOME, PLAGRUPO, PLAINATIVA,                        ');
        _sqlPlanoConta.Sql.Add('   PLANOMEOUTLING, PLASUBGR1, PLASUBGR2, PLASUBGR3, PLASUBGR4,              ');
        _sqlPlanoConta.Sql.Add('   PLACCUST, PLAORDALF, PLATIPCONVGER, PLATIPCONVGEREN1, PLATIPCONVGEREN2,  ');
        _sqlPlanoConta.Sql.Add('   PLATIPCONVOFICIAL, PLAALTERA, PLANATUREZA, PLASUMARIZA,                  ');
        _sqlPlanoConta.Sql.Add('   PLASECRETARIA, PLAMOEDAHISTORICA, PLASUBCONTA, PLAMUTACOES, PLACONCILIA, ');
        _sqlPlanoConta.Sql.Add('   PLABLOQUE, PLABLOQUEDATA, PLACONCORRESP, PLARATEIOAP, IDRATEIOAPEXTRA,   ');
        _sqlPlanoConta.Sql.Add('   PLACONTRAPARTIDA, PLATXJUROS, PLACONTRAPTXJUROS, PLAIMPRELATEVOL          ');
        _sqlPlanoConta.Sql.Add('FROM  PLANOCONTA                             ');
        _sqlPlanoConta.Sql.Add('WHERE                                        ');
        _sqlPlanoConta.Sql.Add('    (PLANO =:PLANO) AND                      ');
        _sqlPlanoConta.Sql.Add('    (PLACONTA =:PLACONTA)                    ');

        _sqlPlanoConta.Prepare;
        _sqlPlanoConta.ParamByName('PLANO').asInteger   := iPlano;
        _sqlPlanoConta.ParamByName('PLACONTA').asString := Copy(sPlaContaAna +  '                  ',1,18);
        _cdsPlanoConta.Data := _sqlPlanoConta.Data;
        //---------------------------------------------------------------------

        if _cdsPlanoConta.IsEmpty then
        begin
          iGrau := FuncaoGeral.CalcGrau(sMascaraPlano, sPlaContaAna);
          If iGrau = 0 then
             raise Exception.Create('Código da Conta Analítica incompatível com a máscara.');

          _sqlPlanoConta.Prepare;
          _sqlPlanoConta.ParamByName('PLANO').asInteger   := iPlano;
          _sqlPlanoConta.ParamByName('PLACONTA').asString := Copy(sConta +  '                  ',1,18);
          _cdsPlanoConta.Data := _sqlPlanoConta.Data;

          sGrupo := _cdsPlanoConta.FieldByName('PLAGRUPO').asString;
          cGrupo := sGrupo[1];

          _sqlAux2.SQL.Add('INSERT INTO PLANOCONTA                                                             ');
          _sqlAux2.SQL.Add('  (PLANO, PLACONTA, IDUSUARIOINCLUSAO, PLATIPO, PLAGRUPO, PLAGRAU, PLANOME,        ');
          _sqlAux2.SQL.Add('   PLANOMEOUTLING, PLASUBGR1, PLASUBGR2, PLASUBGR3, PLASUBGR4, PLAREDUZ,           ');
          _sqlAux2.SQL.Add('   PLACCUST, PLAORDALF, PLATIPCONVGER, PLATIPCONVGEREN1, PLATIPCONVGEREN2,         ');
          _sqlAux2.SQL.Add('   PLATIPCONVOFICIAL, PLAALTERA, PLAINATIVA, PLANATUREZA, PLASUMARIZA,             ');
          _sqlAux2.SQL.Add('   PLASECRETARIA, PLAMOEDAHISTORICA, PLASUBCONTA, PLAMUTACOES, PLACONCILIA,        ');
          _sqlAux2.SQL.Add('   PLABLOQUE, PLABLOQUEDATA, PLACONCORRESP, PLARATEIOAP, IDRATEIOAPEXTRA,          ');
          _sqlAux2.SQL.Add('   PLACONTRAPARTIDA, PLATXJUROS, PLACONTRAPTXJUROS, PLAIMPRELATEVOL)               ');
          _sqlAux2.SQL.Add('VALUES                                                                             ');
          _sqlAux2.SQL.Add('  (:PLANO, :PLACONTA, :IDUSUARIOINCLUSAO, :PLATIPO, :PLAGRUPO, :PLAGRAU,           ');
          _sqlAux2.SQL.Add('   :PLANOME, :PLANOMEOUTLING, :PLASUBGR1, :PLASUBGR2, :PLASUBGR3, :PLASUBGR4,      ');
          _sqlAux2.SQL.Add('   :PLAREDUZ, :PLACCUST, :PLAORDALF, :PLATIPCONVGER, :PLATIPCONVGEREN1,            ');
          _sqlAux2.SQL.Add('   :PLATIPCONVGEREN2, :PLATIPCONVOFICIAL, :PLAALTERA, :PLAINATIVA, :PLANATUREZA,   ');
          _sqlAux2.SQL.Add('   :PLASUMARIZA, :PLASECRETARIA, :PLAMOEDAHISTORICA, :PLASUBCONTA, :PLAMUTACOES,   ');
          _sqlAux2.SQL.Add('   :PLACONCILIA, :PLABLOQUE, :PLABLOQUEDATA, :PLACONCORRESP, :PLARATEIOAP,         ');
          _sqlAux2.SQL.Add('   :IDRATEIOAPEXTRA, :PLACONTRAPARTIDA, :PLATXJUROS, :PLACONTRAPTXJUROS,           ');
          _sqlAux2.SQL.Add('   :PLAIMPRELATEVOL)                                                               ');

          _sqlAux2.Prepare;
          _sqlAux2.ParamByName('PLANO').AsInteger             := iPlano;
          _sqlAux2.ParamByName('PLACONTA').AsString           := sPlaContaAna;
          _sqlAux2.ParamByName('IDUSUARIOINCLUSAO').AsInteger := iUsuario;
          _sqlAux2.ParamByName('PLANOME').AsString            := sNomeContaAnalitica;
          _sqlAux2.ParamByName('PLATIPO').AsString            := 'A';
          _sqlAux2.ParamByName('PLAGRUPO').AsString           := _cdsPlanoConta.FieldByName('PLAGRUPO').AsString;
          _sqlAux2.ParamByName('PLANOMEOUTLING').AsString     := _cdsPlanoConta.FieldByName('PLANOMEOUTLING').AsString;
          _sqlAux2.ParamByName('PLAGRAU').AsInteger           := iGrau;
          _sqlAux2.ParamByName('PLASUBGR1').AsInteger         := _cdsPlanoConta.FieldByName('PLASUBGR1').AsInteger;
          _sqlAux2.ParamByName('PLASUBGR2').AsInteger         := _cdsPlanoConta.FieldByName('PLASUBGR2').AsInteger;
          _sqlAux2.ParamByName('PLASUBGR3').AsInteger         := _cdsPlanoConta.FieldByName('PLASUBGR3').AsInteger;
          _sqlAux2.ParamByName('PLASUBGR4').AsInteger         := _cdsPlanoConta.FieldByName('PLASUBGR4').AsInteger;
          _sqlAux2.ParamByName('PLAREDUZ').AsInteger          := CriaCodReduz(iEmpresa,cGrupo);
          _sqlAux2.ParamByName('PLACCUST').AsString           := _cdsPlanoConta.FieldByName('PLACCUST').AsString;
          _sqlAux2.ParamByName('PLAORDALF').AsString          := _cdsPlanoConta.FieldByName('PLAORDALF').AsString;
          _sqlAux2.ParamByName('PLATIPCONVGER').AsString      := _cdsPlanoConta.FieldByName('PLATIPCONVGER').AsString;
          _sqlAux2.ParamByName('PLATIPCONVGEREN1').AsString   := _cdsPlanoConta.FieldByName('PLATIPCONVGEREN1').AsString;
          _sqlAux2.ParamByName('PLATIPCONVGEREN2').AsString   := _cdsPlanoConta.FieldByName('PLATIPCONVGEREN2').AsString;
          _sqlAux2.ParamByName('PLATIPCONVOFICIAL').AsString  := _cdsPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
          _sqlAux2.ParamByName('PLAALTERA').AsString          := _cdsPlanoConta.FieldByName('PLAALTERA').AsString;
          _sqlAux2.ParamByName('PLAINATIVA').AsString         := 'A';
          _sqlAux2.ParamByName('PLANATUREZA').AsString        := _cdsPlanoConta.FieldByName('PLANATUREZA').AsString;
          _sqlAux2.ParamByName('PLASUMARIZA').AsString        := _cdsPlanoConta.FieldByName('PLASUMARIZA').AsString;
          _sqlAux2.ParamByName('PLASECRETARIA').AsString      := _cdsPlanoConta.FieldByName('PLASECRETARIA').AsString;
          _sqlAux2.ParamByName('PLASUBCONTA').AsString        := _cdsPlanoConta.FieldByName('PLASUBCONTA').AsString;
          _sqlAux2.ParamByName('PLAMOEDAHISTORICA').AsInteger := _cdsPlanoConta.FieldByName('PLAMOEDAHISTORICA').AsInteger;
          _sqlAux2.ParamByName('PLAMUTACOES').AsString        := _cdsPlanoConta.FieldByName('PLAMUTACOES').AsString;
          _sqlAux2.ParamByName('PLACONCILIA').AsString        := _cdsPlanoConta.FieldByName('PLACONCILIA').AsString;
          _sqlAux2.ParamByName('PLABLOQUE').AsString          := _cdsPlanoConta.FieldByName('PLABLOQUE').AsString;
         // _sqlAux2.ParamByName('PLABLOQUEDATA').AsDateTime    := _cdsPlanoConta.FieldByName('PLABLOQUEDATA').AsDateTime;
          _sqlAux2.ParamByName('PLABLOQUEDATA').AsString      := _cdsPlanoConta.FieldByName('PLABLOQUEDATA').AsString;
          _sqlAux2.ParamByName('PLACONCORRESP').AsString      := _cdsPlanoConta.FieldByName('PLACONCORRESP').AsString;
          _sqlAux2.ParamByName('PLARATEIOAP').AsString        := _cdsPlanoConta.FieldByName('PLARATEIOAP').AsString;
          if not _cdsPlanoConta.FieldByName('IDRATEIOAPEXTRA').isNull then begin
             _sqlAux2.ParamByName('IDRATEIOAPEXTRA').AsInteger   := _cdsPlanoConta.FieldByName('IDRATEIOAPEXTRA').AsInteger;
          end else begin
             _sqlAux2.ParamByName('IDRATEIOAPEXTRA').Clear;
          end;

          if not _cdsPlanoConta.FieldByName('PLACONTRAPARTIDA').isNull then begin
             _sqlAux2.ParamByName('PLACONTRAPARTIDA').AsString := _cdsPlanoConta.FieldByName('PLACONTRAPARTIDA').AsString;
          end else begin
             _sqlAux2.ParamByName('PLACONTRAPARTIDA').Clear;
          end;
          _sqlAux2.ParamByName('PLATXJUROS').AsFloat     := _cdsPlanoConta.FieldByName('PLATXJUROS').AsFloat;
          if not _cdsPlanoConta.FieldByName('PLACONTRAPTXJUROS').isNull then begin
             _sqlAux2.ParamByName('PLACONTRAPTXJUROS').AsString  := _cdsPlanoConta.FieldByName('PLACONTRAPTXJUROS').AsString;
          end else begin
             _sqlAux2.ParamByName('PLACONTRAPTXJUROS').Clear;
          end;
          _sqlAux2.ParamByName('PLAIMPRELATEVOL').AsString    := _cdsPlanoConta.FieldByName('PLAIMPRELATEVOL').AsString;
       end else begin
         _sqlAux2.SQL.Add('UPDATE PLANOCONTA SET ');
         _sqlAux2.SQL.Add('       PLAINATIVA  = ''A''');
         _sqlAux2.SQL.Add('WHERE (PLACONTA = '''+Copy(sPlaContaAna + '                  ',1,18)+''')');
         _sqlAux2.SQL.Add('  AND (PLANO = '+IntToStr(iPlano)+')');
       end;

       if not ExecSQL(_sqlAux2.SQLChanged,False) Then
          Raise Exception.Create(MessageInfo);


       result := True;

    Except
        on E:Exception Do
        Begin
           Result := False;
           MessageInfo := E.Message;
        End;
    End;
     _sqlPlanoConta.free;
     _sqlAux2.free;
     _cdsPlanoConta.free;


end;

procedure TCtrlPlanoContaPer.AfterInitialize;
begin
  inherited;
  FuncaoGeral.Initializeas(self);
  FuncaoGeral.OnMessageInfo := nil;

  Lancamento.Initializeas(self);
  Lancamento.OnMessageInfo := nil;

end;

function TCtrlPlanoContaPer.CriaCodReduz(iEmpresa:Integer;sGrupo: char):integer;
var
   _sqlParam   :TCMSqlParams;
   _cdsParam   :TClientDataSet;

begin
    result := 0;
    _sqlParam  := TCMSqlParams.Create(nil);
    _sqlParam.ControlObject := Self;
    _cdsParam := TClientDataSet.Create(nil);
   Try

       with _sqlParam do begin
          SQL.Clear;
          SQL.Add('SELECT PACREDUZA, PACREDUZP, PACREDUZR, PACREDUZD, ');
          SQL.Add('       PACREDUZC, PACREDUZE, PACREDUZO,            ');
          SQL.Add('       PACREDUAF, PACREDUPF, PACREDURF, PACREDUDF, ');
          SQL.Add('       PACREDUCF, PACREDUEF, PACREDUOF             ');
          SQL.Add('FROM PARAMCONTAB                                   ');
          SQL.Add('WHERE IDPESSOA =:IDPESSOA                          ');
          Prepare;
          ParamByName('IDPESSOA').asInteger := iEmpresa;
          _cdsParam.Data := Data;
       end;

       case sGrupo of
          'A' : begin
                   result := _cdsParam.FieldByName('PACREDUZA').asInteger + 1;
                end;
          'P' : begin
                   result := _cdsParam.FieldByName('PACREDUZP').asInteger + 1;
                end;
          'R' : begin
                   result := _cdsParam.FieldByName('PACREDUZR').asInteger + 1;
                end;
          'D' : begin
                   result := _cdsParam.FieldByName('PACREDUZD').asInteger + 1;
                end;
          'C' : begin
                   result := _cdsParam.FieldByName('PACREDUZC').asInteger + 1;
                end;
          'E' : begin
                   result := _cdsParam.FieldByName('PACREDUZE').asInteger + 1;
                end;
          'O' : begin
                   result := _cdsParam.FieldByName('PACREDUZO').asInteger + 1;
                end;
          else  begin
                   result := 0;
                end;
       end;

       with _sqlParam do begin
          SQL.Clear;
          SQL.Add('UPDATE PARAMCONTAB SET             ');
          case sGrupo of
             'A' : SQL.Add('PACREDUZA = PACREDUZA + 1 ');
             'P' : SQL.Add('PACREDUZP = PACREDUZP + 1 ');
             'R' : SQL.Add('PACREDUZR = PACREDUZR + 1 ');
             'D' : SQL.Add('PACREDUZD = PACREDUZD + 1 ');
             'C' : SQL.Add('PACREDUZC = PACREDUZC + 1 ');
             'E' : SQL.Add('PACREDUZE = PACREDUZE + 1 ');
             'O' : SQL.Add('PACREDUZO = PACREDUZO + 1 ');
          end;
          SQL.Add('WHERE  IDPESSOA  =:IDPESSOA    ');
          Prepare;
          ParamByName('IDPESSOA').asInteger := iEmpresa;

          If not ExecSQL(SQLChanged,False) Then
             Raise Exception.Create(MessageInfo);
       end;

    Except
        on E:Exception Do
        Begin
            MessageInfo := E.Message;
        End;
    End;
    _sqlParam.free;
    _cdsParam.free;

end;

function TCtrlPlanoContaPer.CriaContasxCC(iPlano,iUsuario:Integer;sContaDe,
  sContaPara: String): Boolean;
var
    sSql : String;
   _sqlContasxCC   :TCMSqlParams;
   _cdsContasxCC   :TClientDataSet;

begin
   _sqlContasxCC  := TCMSqlParams.Create(nil);
   _sqlContasxCC.ControlObject := Self;
   _cdsContasxCC := TClientDataSet.Create(nil);
   Try

       _sqlContasxCC.Sql.Clear;
       _sqlContasxCC.Sql.Add('SELECT CODCENTROCUSTO, IDEMPRESA ');
       _sqlContasxCC.Sql.Add('FROM CONTASXCC                   ');
       _sqlContasxCC.Sql.Add('WHERE                            ');
       _sqlContasxCC.Sql.Add('   (PLANO =:PLANO) AND           ');
       _sqlContasxCC.Sql.Add('   (PLACONTA = :PLACONTA)        ');

       _sqlContasxCC.Prepare;
       _sqlContasxCC.ParamByName('PLANO').AsInteger   := iPlano;
       _sqlContasxCC.ParamByName('PLACONTA').AsString := Copy(sContaDe + '                  ',1,18);
       _cdsContasxCC.data := _sqlContasxCC.Data;

       _cdsContasxCC.First;
       While not _cdsContasxCC.Eof do begin
          sSql := 'INSERT INTO CONTASXCC(PLANO, PLACONTA, CODCENTROCUSTO, IDEMPRESA, IDUSUARIOINCLUSAO) VALUES('+
                  IntToStr(iPlano)+','+''''+sContaPara+''','+''''+_cdsContasxCC.FieldByName('CODCENTROCUSTO').AsString+''','+
                  IntToStr(_cdsContasxCC.FieldByName('IDEMPRESA').AsInteger)+','+IntToStr(iUsuario)+')';
          ExecSQL(sSql);

          _cdsContasxCC.Next;
       End;

       result := true;
   Except
      On E:Exception Do
      Begin
         Result := False;
         MessageInfo := E.Message;
      End;
   End;
   _sqlContasxCC.free;
   _cdsContasxCC.free;


end;

function TCtrlPlanoContaPer.Apagar: Boolean;
var
   Msg  : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin

      Result := Connection.AppServer.ApagarPlanoContaPer(FcdsPlanoContaPer.Data);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
     Try
         StartTransaction;

         //grava contas
         Result := ApplyCds(FCdsPlanoContaPer,_dbPlanoContaPer,[],[] );
         Msg    := _dbPlanoContaPer.MessageInfo;
         If Not Result Then Raise Exception.Create(Msg);

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

end.
