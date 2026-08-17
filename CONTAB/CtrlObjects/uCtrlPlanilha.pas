(* ------------------  Histórico de Alterações  ------------------------------*)
{
---------------------------------------------------------------------------------------------------
Pendência: WO38204
Analista : Leandro
Data     : 18/05/2026
Solução  : Ajuste para tratar o modulo da planilha selecionada
==============================================================================*}
unit uCtrlPlanilha;

interface

Uses DB, uDataBase, uDbPlanilha, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask, CMProcura,DBTables,uCtrlContab,uCtrlLancamento,uCtrlPadroes,
     uCMTypes;


  Type

    TCtrlPlanilha = Class(TCmControlObject)

    private
       FProgresso: Integer;
       FMaxProgresso: Integer;
       FRetornaPlnCod :Double;

      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbPlanilha : TDbPlanilha;
      FcdsPlanilhaNaData :TClientDataSet;
      FliPlanilha : LongInt;
      Contab      : TCtrlContab;
      Lancamento  : TCtrlLancamento;
      Padroes :TCtrlPadroes;
      procedure SetcdsPlanilhaNaData(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property Progresso : Integer read FProgresso;
      Property MaxProgresso : Integer read FMaxProgresso;

      Property RetornaPlnCod : Double read FRetornaPlnCod write FRetornaPlnCod;

      Property cdsPlanilhaNaData : TClientDataSet read FcdsPlanilhaNaData write SetcdsPlanilhaNaData;

      property liPlanilha :LongInt read FliPlanilha write FliPlanilha;

      {Esta função pega o proximo codigo de planilha}
      Procedure PegaProximaPlanilha(dEmp:Double;iExerc,iPer:LongInt;sDataNova,sDiaMes :string);

      {Esta função tem o objetivo de alterar data de uma planilha}
      Function ProcAlteraDataPlanilha(dEmpresa,dModulo,dUsuario,dPlnCodigo:Double;iExercicioNovo,
                                  iPeriodoNovo:Integer;sDataNova,sDiaMes:string):Boolean;

      {Esta função tem o objetivo de alterar data de uma planilha parte 2}
      Function ProcAlteraDataPlanilha2(dEmpresa,dModulo,dPlnCodigo:Double;iExercicio,iPeriodo,
                                    iExercicioNovo,iPeriodoNovo,iUsuario:Integer;sDataNova,
                                    sEfetivado,sMascaraContas,sDiaMes :string;
                                    bUsaPlanopatro:Boolean):Boolean;

      {Esta função verifica se existe planilhas dentro de uma determinada data}
      //Function ExistePlanilhasNaData(dEmpresa:Double;liPlaIni,liPlaFim:LongInt; sDataProc:string) :Boolean; //WO38204 Leandro
      Function ExistePlanilhasNaData(dEmpresa:Double;liPlaIni,liPlaFim:LongInt; sDataProc:string; iModulo: integer) :Boolean;    //WO38204 Leandro

      {Esta função exclui planilhas dentro de uma data}
      Function ExcluiPlanilhasNaData(iEmpresa,iUsuario,iModulo:Integer;bUsaPPatro:Boolean) :Boolean;

      {Esta função tem o objetivo de retornar planilhas}
      Function ListPlanilhas(iModulo:Integer;dCodPla:Double) :OleVariant;

      {Esta função tem o objetivo de retornar planilhas de modulos}
      Function ListPlaAlteraDadta(dCodPla:Double) :OleVariant;
    End;


implementation

procedure TCtrlPlanilha.AfterInitialize;
begin
  inherited;
  Contab.initializeas(self);
  Contab.OnMessageInfo := nil;
  Lancamento.initializeas(self);
  Lancamento.OnMessageInfo := nil;
  Padroes.initializeas(self);

end;

constructor TCtrlPlanilha.Create;
begin
  inherited;
  _dbPlanilha  := TDbPlanilha.Create(Self);
  Contab       := TCtrlContab.Create;
  Lancamento   := TCtrlLancamento.Create;
  FcdsPlanilhaNaData := TClientDataSet.Create(nil);
  Padroes := TCtrlPadroes.Create;

end;

destructor TCtrlPlanilha.Destroy;
begin
  inherited;
  _dbPlanilha.Free;
  FcdsPlanilhaNaData.Free;
  Contab.Free;
  Lancamento.Free;
  Padroes.free;

end;

procedure TCtrlPlanilha.DoChangeDataBase;
begin
  inherited;
  _dbPlanilha.DataBaseName := DataBaseName;
end;


function TCtrlPlanilha.ExcluiPlanilhasNaData(iEmpresa,iUsuario,iModulo:Integer;bUsaPPatro:Boolean):Boolean;
var
   dPlnCodigo :Double;
begin

   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.ExcluiPlanilhasNaData(iEmpresa,iUsuario,iModulo,bUsaPPatro,FRetornaPlnCod,FcdsPlanilhaNaData.Data);

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo
     Else
        MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      dPlnCodigo    := 0;
      FMaxProgresso := 0;
      FProgresso    := 0;
      Try

          StartTransaction;


          FMaxProgresso := cdsPlanilhaNaData.RecordCount;

          cdsPlanilhaNaData.First;

          While Not cdsPlanilhaNaData.Eof Do
          Begin
             FProgresso := FProgresso + 1;
             dPlnCodigo := cdsPlanilhaNaData.FieldByName('PLNCODIGO').asFloat;

             If Not Lancamento.ExcluiLancaContab(iUsuario,dPlnCodigo,iModulo,
                                                 0,bUsaPPatro,True) Then
             Begin
               Raise Exception.Create(Lancamento.MessageInfo);
             End;
             cdsPlanilhaNaData.Next;
          End;
          If not Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario, 'Exclui Planilha por Faixa',False) then
             Raise Exception.Create( Padroes.MessageInfo );
          Commit;
          Result := True;
          MessageInfo := FloatToStr(dPlnCodigo);
      Except
         on E:Exception Do
         Begin
           RollBack;
           Result     := False;
           MessageInfo := E.Message;
         End;
      End;
   End;
end;

function TCtrlPlanilha.ExistePlanilhasNaData(dEmpresa: Double; liPlaIni,
                 liPlaFim: Integer; sDataProc: string; iModulo: integer): Boolean;
var
  sSql :string;
begin
    sSql := 'SELECT PLNCODIGO, PLNPLANIL '+
            'FROM PLANILHA '+
            'WHERE (PLNPLANIL  >= ' + IntToStr(liPlaIni) + ') AND ' +
            '      (PLNPLANIL  <= ' + IntToStr(liPlaFim) + ') AND ' +
            '      (PLNDATDIA  = TO_DATE('''+sDataProc+''',''DD/MM/YYYY'')) AND ' +
            '      (IDMODULO   = ' + IntToStr(iModulo) +  ') AND ' +                 //WO38204 Leandro
            '      (IDPESSOA   = ' + FloatToStr(dEmpresa) + ')';


    FcdsPlanilhaNaData.Data := GetDataPacket(sSql);

    If FcdsPlanilhaNaData.IsEmpty Then
       Result := False
    Else
       Result := True;

end;

function TCtrlPlanilha.ListPlaAlteraDadta(dCodPla: Double): OleVariant;
var
  sSql,sFiltro :string;
begin
       sSql := 'SELECT '+
               '   PLNTOTDEBGEREN1,     '+
               '   PLNTOTDEBGEREN1,    '+
               '   PLNTOTCREGEREN1,    '+
               '   PLNTOTDEBGEREN2,    '+
               '   PLNTOTCREGEREN2,    '+
               '   PLNEFETIVADO,       '+
               '   IDUSUARIOINCLUSAO,  '+
               '   TIPCODIGO,          '+
               '   PLNEMUSO,           '+
               '   IDPESSOA,           '+
               '   PLNTOTDEBHIST,      '+
               '   PLNTOTCREHIST,      '+
               '   LOTETRANSMISSAO,    '+
               '   PLNPLANESTORNO,     '+
               '   PANCODIGO,          '+
               '   PLNREFERENCIA,      '+
               '   PLNCODIGO,          '+
               '   IDMODULO,           '+
               '   PERNUMERO,          '+
               '   PEREXERCICIO,       '+
               '   PLNDATDIA,          '+
               '   PLNPLANIL,          '+
               '   PLNNUMLAN,          '+
               '   PLNTOTDEB,          '+
               '   PLNTOTCRE,          '+
               '   PLNTOTDEBOFICIAL,   '+
               '   PLNTOTCREOFICIAL,   '+
               '   PLNTOTDEBGER,       '+
               '   PLNTOTCREGER        '+
               'FROM  PLANILHA         '+
               'WHERE (IDMODULO IN (1,2,96)) ';
       //----------------------------------------------------------
       sfiltro := '';
       if dCodPla <> 0 Then
       Begin
         sFiltro := sFiltro +  'AND (PLNCODIGO = '+FloatToStr(dCodPla)+') ';
       End;
       sSql := sSql + sFiltro;

    Result := GetDataPacket(sSql);

end;

function TCtrlPlanilha.ListPlanilhas(iModulo: Integer;  dCodPla: Double): OleVariant;
var
  sSql,sFiltro :string;
begin
       sSql := 'SELECT '+
               '   PLNTOTDEBGEREN1,     '+
               '   PLNTOTDEBGEREN1,    '+
               '   PLNTOTCREGEREN1,    '+
               '   PLNTOTDEBGEREN2,    '+
               '   PLNTOTCREGEREN2,    '+
               '   PLNEFETIVADO,       '+
               '   IDUSUARIOINCLUSAO,  '+
               '   TIPCODIGO,          '+
               '   PLNEMUSO,           '+
               '   IDPESSOA,           '+
               '   PLNTOTDEBHIST,      '+
               '   PLNTOTCREHIST,      '+
               '   LOTETRANSMISSAO,    '+
               '   PLNPLANESTORNO,     '+
               '   PANCODIGO,          '+
               '   PLNREFERENCIA,      '+
               '   PLNCODIGO,          '+
               '   IDMODULO,           '+
               '   PERNUMERO,          '+
               '   PEREXERCICIO,       '+
               '   PLNDATDIA,          '+
               '   PLNPLANIL,          '+
               '   PLNNUMLAN,          '+
               '   PLNTOTDEB,          '+
               '   PLNTOTCRE,          '+
               '   PLNTOTDEBOFICIAL,   '+
               '   PLNTOTCREOFICIAL,   '+
               '   PLNTOTDEBGER,       '+
               '   PLNTOTCREGER        '+
               'FROM '+
               '   PLANILHA ';

       //----------------------------------------------------------
       sfiltro := '';
       If (iModulo <> 0) Then
          sfiltro :=  'WHERE (IDMODULO = '+FloatToStr(iModulo) + ') ';
       //----------------------------------------------------------
       if dCodPla <> 0 Then
       Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (PLNCODIGO = '+FloatToStr(dCodPla)+') '
         else
            sFiltro := sFiltro +  'AND (PLNCODIGO = '+FloatToStr(dCodPla)+') ';
       End;
       sSql := sSql + sFiltro;

    Result := GetDataPacket(sSql);

end;

procedure TCtrlPlanilha.PegaProximaPlanilha(dEmp:Double;iExerc,iPer:LongInt;
                                  sDataNova,sDiaMes: string);
var
  sSql :string;
begin
      FliPlanilha := 0;

      If sDiaMes = 'D' Then
      Begin
        sSql := 'SELECT MAX(PLNPLANIL) AS IDPROXPLANIL '+
                'FROM PLANILHA '+
                'WHERE (IDPESSOA  = ' + FloatToStr(dEmp) + ') AND ' +
                '      (PLNDATDIA = TO_DATE('''+sDataNova+''',''DD/MM/YYYY''))';

        _cds.Data := GetDataPacket(sSql);
        FliPlanilha := _cds.FieldByName('IDPROXPLANIL').AsInteger + 1;
      End;

      If sDiaMes = 'P' Then
      Begin
         sSql := 'SELECT MAX(PLNPLANIL) AS IDPROXPLANIL ' +
                 'FROM PLANILHA ' +
                 'WHERE (IDPESSOA     = ' + FloatToStr(dEmp) + ') AND ' +
                 '      (PEREXERCICIO = ' + IntToStr(iExerc) + ') AND ' +
                 '      (PERNUMERO    = ' + IntToStr(iPer) + ')';
         _cds.Data := GetDataPacket(sSql);
         FliPlanilha := _cds.FieldByName('IDPROXPLANIL').AsInteger + 1;
      End;

      If sDiaMes = 'E' Then
      Begin
         sSql := 'SELECT MAX(PLNPLANIL) AS IDPROXPLANIL ' +
                 'FROM PLANILHA ' +
                 'WHERE  (IDPESSOA     = ' + FloatToStr(dEmp) + ') AND ' +
                 '       (PEREXERCICIO = ' + IntToStr(iExerc) + ')';
         _cds.Data := GetDataPacket(sSql);
         FliPlanilha := _cds.FieldByName('IDPROXPLANIL').AsInteger + 1;
      End;

end;

function TCtrlPlanilha.ProcAlteraDataPlanilha(dEmpresa,dModulo,dUsuario,dPlnCodigo:Double;
                       iExercicioNovo,iPeriodoNovo:Integer;sDataNova,sDiaMes :string): Boolean;
var
  sSql :string;
begin

   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.ProcAlteraDataPlanilha(dEmpresa,dModulo,dUsuario,dPlnCodigo,
                                       iExercicioNovo,iPeriodoNovo,sDataNova,sDiaMes);

    If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin

      Try

         StartTransaction;


          PegaProximaPlanilha(dEmpresa,iExercicioNovo,iPeriodoNovo,sDataNova,sDiaMes);

          If sDiaMes = 'D' Then
          Begin
              sSql := 'UPDATE PLANILHA ' +
                      'SET ' +
                      '   PLNDATDIA = TO_DATE('''+sDataNova+''',''DD/MM/YYYY''), ' +
                      '   PLNPLANIL = ' + IntToStr(liPlanilha) + ',' +
                      '   PEREXERCICIO = ' + IntToStr(iExercicioNovo)+ ' ' +
                      ' WHERE '+
                      '   PLNCODIGO = ' + FloatToStr(dPlnCodigo);

              Result := ExecSql(sSql);
              If Not Result Then
              Begin
                Raise Exception.Create('Erro ao Atualizar a Tabela PLANILHA.');
              End;
          End Else
          Begin
             sSql := 'UPDATE PLANILHA ' +
                     'SET ' +
                     '  PLNDATDIA = TO_DATE('''+sDataNova+''',''DD/MM/YYYY''), ' +
                     //catia - 23748 - 28/11/2006
                      '   PEREXERCICIO = ' + IntToStr(iExercicioNovo)+ ' ' +
                     'WHERE ' +
                     '  PLNCODIGO = ' + FloatToStr(dPlnCodigo);

              Result := ExecSql(sSql);
              If Not Result Then
              Begin
                 Raise Exception.Create('Erro ao Atualizar a Tabela PLANILHA.');
              End;
          End;
          Result := True;
          If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Alteração de Datas de Planilha',False) then
             Raise Exception.Create( Padroes.MessageInfo );
          Commit;

      Except
         on E:Exception Do
         Begin
           RollBack;
           Result := False;
           MessageInfo := E.Message;
         End;
     End;
  End;
end;

function TCtrlPlanilha.ProcAlteraDataPlanilha2(dEmpresa,dModulo, dPlnCodigo: Double;
                       iExercicio, iPeriodo, iExercicioNovo,iPeriodoNovo,iUsuario: Integer;
                       sDataNova,sEfetivado,sMascaraContas,sDiaMes: string;
                       bUsaPlanopatro:Boolean): Boolean;
var
   sSql :string;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.ProcAlteraDataPlanilha2(dEmpresa,dModulo, dPlnCodigo,
                           iExercicio, iPeriodo, iExercicioNovo,iPeriodoNovo,iUsuario,
                           sDataNova,sEfetivado,sMascaraContas,sDiaMes,
                           bUsaPlanopatro);

    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      MessageInfo := '*';
      Try
          StartTransaction;

          PegaProximaPlanilha(dEmpresa,iExercicioNovo,iPeriodoNovo,sDataNova,sDiaMes);

          MessageInfo :=  'Alterando datas da planilha...';

          sSql := 'UPDATE PLANILHA ' +
                  'SET ' +
                  '  PLNDATDIA  = TO_DATE('''+sDataNova+''',''DD/MM/YYYY''), ' +
                  '  PERNUMERO  = ' + IntToStr(iPeriodoNovo) + ', ' +
                  '  PLNPLANIL  = ' + IntToStr(liPlanilha)  + ', ' +
                  '  PEREXERCICIO  = ' + IntToStr(iExercicioNovo)  + ' ' +
                  ' WHERE ' +
                  '   PLNCODIGO = ' + FloatToStr(dPlnCodigo);


          Result := ExecSql(sSql);
          If Not Result Then
          Begin
             Raise Exception.Create('Erro ao Atualizar a Tabela PLANILHA.');
          End;

          If sEfetivado = 'S' Then
          Begin
             MessageInfo :=  'Atualizando saldos...';

             sSql := 'SELECT L.PLANO,L.PLACONTA,P.IDPESSOA, '+
                     '       L.CODSUBCONTA,L.IDEMPRESA,L.UNIDNEGOC,L.CODCENTROCUSTO,'+
                     '       L.LACDEBCRE,L.LACVALOR, L.LACVALOFICIAL, L.LACVALGERENCIAL,'+
                     '       L.LACVALGEREN1,L.LACVALGEREN2,L.LACVALHIST, '+
                     '       L.IDPATRO, L.IDPLANOPREV '+
                     'FROM ' +
                     '       PLANILHA P, LANCAMENTO L  '+
                     'WHERE  ' +
                     '       (P.PLNCODIGO = ' + FloatToStr(dPlnCodigo) + ') AND ' +
                     '       (P.PLNCODIGO = L.PLNCODIGO) ';

             _cds.Data := GetDataPacket(sSql);
             If _cds.IsEmpty Then
             Begin
                Raise Exception.Create('Planilha sem registros de lançamentos.');
             End;


             _cds.First;

             While not _cds.EOF do
             Begin

                //Atualiza saldos velhos
                If Not Lancamento.AtuSaldoContas(dEmpresa,_cds.FieldByName('UNIDNEGOC').AsFloat,
                                                 iUsuario,_cds.FieldByName('IDPLANOPREV').AsInteger,
                                                 _cds.FieldByName('IDPATRO').AsInteger,
                                                 _cds.FieldByName('PLANO').AsInteger,
                                                 iExercicio,iPeriodo,
                                                 _cds.FieldByName('CODSUBCONTA').AsInteger,
                                                 _cds.FieldByName('CODCENTROCUSTO').AsString,
                                                 _cds.FieldByName('PLACONTA').AsString,
                                                 _cds.FieldByName('LACDEBCRE').AsString,
                                                 'A',_cds.FieldByName('LACVALOR').AsFloat*-1,
                                                 0,_cds.FieldByName('LACVALOFICIAL').AsFloat*-1,
                                                 _cds.FieldByName('LACVALGERENCIAL').AsFloat*-1,
                                                 _cds.FieldByName('LACVALGEREN1').AsFloat*-1,
                                                 _cds.FieldByName('LACVALGEREN2').AsFloat*-1,
                                                 _cds.FieldByName('LACVALHIST').AsFloat*-1,
                                                 bUsaPlanoPatro) Then

                Begin
                   Raise Exception.Create(Lancamento.MessageInfo);
                End;

                //Atualiza saldos velhos
                If Not Lancamento.AtuSaldoSintetica(dEmpresa,_cds.FieldByName('UNIDNEGOC').AsFloat,
                                                    iUsuario,_cds.FieldByName('IDPLANOPREV').AsInteger,
                                                    _cds.FieldByName('IDPATRO').AsInteger,
                                                    _cds.FieldByName('PLANO').AsInteger,
                                                    iExercicio,iPeriodo,
                                                    _cds.FieldByName('CODSUBCONTA').AsInteger,
                                                    _cds.FieldByName('CODCENTROCUSTO').AsString,
                                                    _cds.FieldByName('PLACONTA').AsString,
                                                    _cds.FieldByName('LACDEBCRE').AsString,sMascaraContas,
                                                    _cds.FieldByName('LACVALOR').AsFloat*-1,
                                                    0,_cds.FieldByName('LACVALOFICIAL').AsFloat*-1,
                                                    _cds.FieldByName('LACVALGERENCIAL').AsFloat*-1,
                                                    _cds.FieldByName('LACVALGEREN1').AsFloat*-1,
                                                    _cds.FieldByName('LACVALGEREN2').AsFloat*-1,
                                                    _cds.FieldByName('LACVALHIST').AsFloat*-1,
                                                    bUsaPlanoPatro) Then

                Begin
                   Raise Exception.Create(Lancamento.MessageInfo);
                End;
                //=============================================================

                //Atualiza saldos novos
                If Not Lancamento.AtuSaldoContas(dEmpresa,_cds.FieldByName('UNIDNEGOC').AsFloat,
                                                 iUsuario,_cds.FieldByName('IDPLANOPREV').AsInteger,
                                                 _cds.FieldByName('IDPATRO').AsInteger,
                                                 _cds.FieldByName('PLANO').AsInteger,
                                                 iExercicioNovo,iPeriodoNovo,
                                                 _cds.FieldByName('CODSUBCONTA').AsInteger,
                                                 _cds.FieldByName('CODCENTROCUSTO').AsString,
                                                 _cds.FieldByName('PLACONTA').AsString,
                                                 _cds.FieldByName('LACDEBCRE').AsString,
                                                 'A',_cds.FieldByName('LACVALOR').AsFloat*-1,
                                                 0,_cds.FieldByName('LACVALOFICIAL').AsFloat*-1,
                                                 _cds.FieldByName('LACVALGERENCIAL').AsFloat*-1,
                                                 _cds.FieldByName('LACVALGEREN1').AsFloat*-1,
                                                 _cds.FieldByName('LACVALGEREN2').AsFloat*-1,
                                                 _cds.FieldByName('LACVALHIST').AsFloat*-1,
                                                 bUsaPlanoPatro) Then

                Begin
                   Raise Exception.Create(Lancamento.MessageInfo);
                End;

                If Not Lancamento.AtuSaldoSintetica(dEmpresa,_cds.FieldByName('UNIDNEGOC').AsFloat,
                                                    iUsuario,_cds.FieldByName('IDPLANOPREV').AsInteger,
                                                    _cds.FieldByName('IDPATRO').AsInteger,
                                                    _cds.FieldByName('PLANO').AsInteger,
                                                    iExercicioNovo,iPeriodoNovo,
                                                    _cds.FieldByName('CODSUBCONTA').AsInteger,
                                                    _cds.FieldByName('CODCENTROCUSTO').AsString,
                                                    _cds.FieldByName('PLACONTA').AsString,
                                                    _cds.FieldByName('LACDEBCRE').AsString,sMascaraContas,
                                                    _cds.FieldByName('LACVALOR').AsFloat*-1,
                                                    0,_cds.FieldByName('LACVALOFICIAL').AsFloat*-1,
                                                    _cds.FieldByName('LACVALGERENCIAL').AsFloat*-1,
                                                    _cds.FieldByName('LACVALGEREN1').AsFloat*-1,
                                                    _cds.FieldByName('LACVALGEREN2').AsFloat*-1,
                                                    _cds.FieldByName('LACVALHIST').AsFloat*-1,
                                                    bUsaPlanoPatro) Then

                Begin
                   Raise Exception.Create(Lancamento.MessageInfo);
                End;

                _cds.Next;
             End;
          End;
          Result := True;
          If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,iUsuario, 'Verifica Lançamentos - Arredondamento',False) then
             Raise Exception.Create( Padroes.MessageInfo );
          Commit;
      Except
         on E:Exception Do
         Begin
           RollBack;
           Result := False;
           MessageInfo := E.Message;
         End;
       End;
   End;
end;




procedure TCtrlPlanilha.SetcdsPlanilhaNaData(const Value: TClientDataSet);
begin
   FcdsPlanilhaNaData := Value;
end;


end.


