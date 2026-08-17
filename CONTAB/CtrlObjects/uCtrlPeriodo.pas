unit uCtrlPeriodo;

{ 31/07/03 by Alex - Pend 14564
   Exportando o campo PERDATFIM na função ListExercicios

}
interface

Uses DB, uDataBase, uDbPeriodo, uCmControlObject, dbclient, sysutils,uMidasUtil,uCtrlPadroes,
     uCtrlContab, provider,uCMTypes , uCMSqlParams;

Type
  TTipoBloqueGra  = (tbgTodos, tbgAtualiza, tbgIntegrado, tbgBloq);
  TTipoBloque     = (tbBloqueado, tbBloqOuInt, tbIntegrado, tbBloqEInt);
  TTipoBloquePer  = (tbpTodos, tbpSoInt, tbpSoNaoInt, tbpSoBloq, tbpSoNaoBloq, tbpNaoBloqInt, tpbBloqInt );
  TCtrlPeriodo = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;

  private
    _dbPeriodo  : TdbPeriodo;
   _sql         : TCmSqlParams;
    FcdsPeriodo : TClientDataSet;

    Contab :TCtrlContab;
    Padroes :TCtrlPadroes;
    FPeriodoEsp :Boolean;
    FMaxPeriodo: Integer;
    FExercicio: Integer;
    FPeriodo: Integer;
    FDataIniPeriodo: TDateTime;
    FDataFimPeriodo: TDateTime;
    FNomePeriodo: String;
    procedure SetExercicio(const Value: Integer);
    procedure SetPeriodo(const Value: Integer);
    procedure SetDataFimPeriodo(const Value: TDateTime);
    procedure SetDataIniPeriodo(const Value: TDateTime);
    procedure SetNomePeriodo(const Value: String);
    procedure SetMaxPeriodo(const Value: Integer);
    procedure SetCdsPeriodo(const Value: TClientDataSet);
  public
      //
      property CdsPeriodo: TClientDataSet read FCdsPeriodo write SetCdsPeriodo;
      Property MaxPeriodo: Integer read FMaxPeriodo write SetMaxPeriodo;
      Property PeriodoEsp: Boolean read FPeriodoEsp write FPeriodoEsp;
      Property Exercicio : Integer read FExercicio write SetExercicio;
      Property Periodo   : Integer read FPeriodo write SetPeriodo;
      Property NomePeriodo : String read FNomePeriodo write SetNomePeriodo;
      Property DataIniPeriodo : TDateTime read FDataIniPeriodo write SetDataIniPeriodo;
      Property DataFimPeriodo : TDateTime read FDataFimPeriodo write SetDataFimPeriodo;
      Constructor Create; Override;
      Destructor  Destroy;Override;
      // Metodos de Regra de negócio
      {Esta função tem como objetivo vericar se o periodo contabil esta bloqueado  }
      Function TestaPeriodoBloqueado( IdEmpresa : Double; TipoBloque : TTipoBloque; iPeriodo, iExercicio : Integer; bTodos : Boolean ) : Boolean;
      Function TestaPeriodoBloqueadoProc( IdEmpresa : Double; TipoBloque : TTipoBloque; iPeriodo, iExercicio : Integer; bTodos : Boolean ) : Boolean;
      Function EncerraPeriodo( IdEmpresa,IdModulo,IdUsuario : Double; iExercicio, iPeriodo : Integer; TipoBloqueGra : TTipoBloqueGra ) : Boolean;

      {Esta function tem como objetivo retornar o periodo e o exercicio de determinada data}
      Function RetornaPeriodoExercicioData( IdEmpresa : Double; sData : String ) : Boolean;
      Function RetornaPeriodoExercicioDataProc( IdEmpresa : Double; sData : String ) : Boolean;

      {Esta function que testa se o periodo existe ou não}
      Function TestaPeriodoExiste( IdEmpresa : Double; iPeriodo, iExercicio : Integer ) : Boolean;

      {Esta função tem o oobjetivo de testar PeriodoxData}
      Function TestaPeriodoxData( IdEmpresa : Double; iPeriodo, iExercicio : Integer; sData : String ) : Boolean;

      {Esta função tem o objetivo de validar periodo}
      Function ValidaPeriodo : Boolean;

      {Esta função tem o objetivo de validar exercicio}
      Function ValidaExercicio : Boolean;

      {Esta funcao tem como objetivo retornar o maior periodo}
      Function RetornaMaxPeriodo(iPerExercicio :Integer; dIdempresa :Double):Boolean;

      {Esta função tem o objetivo de gravar periodos}
      function Gravar :Boolean;

      {Esta função tem o objetivo de retornar registros na tabela periodo}
      Function ListPeriodo( dIdEmpresa : Double; TipoBloquePer : TTipoBloquePer; iExercicio,iPerNumero : Integer) : OleVariant;

      {Esta função tem o objetivo de retornar exercicios}
      Function ListExercicios( IdEmpresa : Double; bTodos : Boolean ) : OleVariant;

      {Esta função te mo objetivo de retornar periodos}
      function RetornaPeriodos( dIdEmpresa : Double; TipoBloquePer : TTipoBloquePer; iExercicio : Integer) : Boolean;

      {Esta função tem como objetivo vericar se o periodo contabil esta bloqueado}
      Function VerificaPeriodoBloqueado( IdEmpresa : Double; TipoBloque : TTipoBloque; iPeriodo, iExercicio : Integer; bTodos : Boolean ) : Boolean;


  End;

implementation

function TCtrlPeriodo.RetornaMaxPeriodo(iPerExercicio :Integer; dIdempresa :Double ) : Boolean;
var sSql : String;
begin
    sSql := 'SELECT MAX(PERNUMERO) AS MAXPERIODO ' +
                                'FROM PERIODO ' +
                                'WHERE (PEREXERCICIO = ' + IntToStr(iPerExercicio)+ ') ' +
                                '  AND (IDPESSOA     = ' + FloatToStr(dIdEmpresa) + ')';
      if FPeriodoEsp then
         sSql := sSql + ' AND ( PERESPECIAL = ''S'')    '
      else
         sSql := sSql + ' AND (( PERESPECIAL = ''N'') OR ( PERESPECIAL IS NULL)) ';

     _Cds.Data := GetDataPacket(sSql);

    If not _cds.IsEmpty Then
    Begin
      FMaxPeriodo := _cds.FieldByName('MAXPERIODO').AsInteger;
      Result      := True;
    End Else
    Begin
      FMaxPeriodo := 0;
      Result      := False;
    End;
end;

procedure TCtrlPeriodo.OnCreateAppServer;
begin
  inherited;
  FcdsPeriodo := TClientDataSet.Create(nil);

end;

function TCtrlPeriodo.RetornaPeriodos( dIdEmpresa : Double; TipoBloquePer : TTipoBloquePer; iExercicio : Integer) : Boolean;
begin
       { tbpTodos => Todos os períodos, bloqueados ou não
        tbpSoInt => Todos os períodos bloqueados para integração (PERBLOINT = 'S')
        tbpSoNaoInt => Todos os períodos não bloqueados para integração (PERBLOINT <> 'S')
        tbpSoBloq => Todos os períodos bloqueados (PERBLOQUE = 'S')
        tbpSoNaoBloq => Todos os períodos não bloqueados (PERBLOQUE <> 'S')
        tbpNaoBloqInt => Todos os períodos totalmente não bloqueados ((PERBLOQUE <> 'S') AND (PERBLOINT <> 'S'))
        tpbBloqInt => Todos os períodos totalmente bloqueados ((PERBLOQUE = 'S') AND (PERBLOINT = 'S'))
      }

      With TCMSqlParams.Create(nil) Do
       Try
             ControlObject := Self;
             SQL.Clear;

             SQL.Add('SELECT PEREXERCICIO, PERNUMERO, PERDATINI, PERDATFIM,   ');
             SQL.Add('       PERNOME, PERNOMEOUTLING, PERBLOQUE, PERBLOINT    ');
             SQL.Add('FROM PERIODO                                            ');
             SQL.Add('WHERE (IDPESSOA = :IDPESSOA)                            ');
             if FPeriodoEsp then
                SQL.Add(' AND ( PERESPECIAL = ''S'')    ')
             else
                SQL.Add(' AND (( PERESPECIAL = ''N'') OR ( PERESPECIAL IS NULL)) ');

             if iExercicio > 0 then
                SQL.Add('  AND (PEREXERCICIO = :PEREXERCICIO)                 ');

             Case TipoBloquePer of
               tbpSoInt     : SQL.Add('  AND (PERBLOINT  =  ''S'')             ');
               tbpSoNaoInt  : SQL.Add('  AND (PERBLOINT  <> ''S'')             ');
               tbpSoBloq    : SQL.Add('  AND (PERBLOQUE  =  ''S'')             ');
               tbpSoNaoBloq : SQL.Add('  AND (PERBLOQUE  <> ''S'')             ');
               tbpNaoBloqInt: SQL.Add('  AND ((PERBLOQUE <> ''S'') AND (PERBLOINT <> ''S''))');
               tpbBloqInt   : SQL.Add('  AND ((PERBLOQUE =  ''S'')  AND (PERBLOINT = ''S''))');
            end;
            SQL.Add('ORDER BY PEREXERCICIO, PERNUMERO ');

            Prepare;

            if iExercicio > 0 then
               ParamByName('PEREXERCICIO').asInteger := iExercicio;
            ParamByName('IDPESSOA').asFloat       := dIdEmpresa;

            _Cds.Data := Data;

           If not _Cds.IsEmpty Then
           begin
              _Cds.Last;
              FExercicio := _Cds.FieldByName('PEREXERCICIO').AsInteger;
              FPeriodo   := _Cds.FieldByName('PERNUMERO').AsInteger;
              result     := True;
           End Else
           Begin
             FExercicio := 0;
             FPeriodo   := 0;
             Result     := False;
           End;

       Finally
         Free;
       End;

end;

function TCtrlPeriodo.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarPeriodo ( FcdsPeriodo.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsPeriodo,_dbPeriodo,[],[] );
           Msg    := _dbPeriodo.MessageInfo;
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

function TCtrlPeriodo.TestaPeriodoBloqueado( IdEmpresa : Double; TipoBloque : TTipoBloque;
     iPeriodo, iExercicio : Integer; bTodos : Boolean ) : Boolean;
begin

     Try
         With TCmSqlParams.Create(nil) Do
           Try
              ControlObject := Self;
              SQL.Clear;
              SQL.Add('SELECT PEREXERCICIO FROM PERIODO ');
              SQL.Add('WHERE ( PEREXERCICIO = '+IntToStr(iExercicio)+')');

              if FPeriodoEsp then
                 SQL.Add(' AND ( PERESPECIAL = ''S'')    ')
              else
                 SQL.Add(' AND (( PERESPECIAL = ''N'') OR ( PERESPECIAL IS NULL)) ');

              if bTodos then
                 SQL.Add('  AND ( PERNUMERO <= '+IntToStr(iPeriodo)+')')
              else
                 SQL.Add('  AND ( PERNUMERO = '+IntToStr(iPeriodo)+')');
              SQL.Add('  AND ( IDPESSOA = '+FloatToStr(IdEmpresa)+')');
              Case TipoBloque of
                 tbBloqueado : SQL.Add('  AND ( PERBLOQUE <> ''S'')');
                 tbBloqOuInt : SQL.Add('  AND (( PERBLOQUE <> ''S'') AND ( PERBLOINT <> ''S''))');
                 tbIntegrado : SQL.Add('  AND ( PERBLOINT <> ''S'')');
                 tbBloqEInt  : SQL.Add('  AND (( PERBLOQUE <> ''S'') OR ( PERBLOINT <> ''S''))');
              end;

              _Cds.Data := Data;
           Finally
              Free;
           End;

          if _Cds.IsEmpty then
          begin
             Result := True;
             if bTodos then
                MessageInfo  := 'Existem Períodos Já Bloqueados'
             else
                MessageInfo  := 'Período Bloqueado';
          end else
          begin
             Result := False;
             if bTodos then
                MessageInfo  := 'Existem Períodos Não Bloqueados'
             else
               MessageInfo  := 'Período Não Bloqueado';
          end;

     Except
        On E:Exception Do
        Begin
           Result := False;
           MessageInfo := E.Message;
        End;
     End;


end;

function TCtrlPeriodo.VerificaPeriodoBloqueado( IdEmpresa : Double; TipoBloque : TTipoBloque;
                                                iPeriodo, iExercicio : Integer; bTodos : Boolean ) : Boolean;
var
  sSql :string;
begin
     {
          bTodos := True => Significa que vamos testar todos os períodos iguais ou menor que o indicado
          bTodos := False => Significa que testaremos somente o período informado
      }
      sSql := 'SELECT PEREXERCICIO FROM PERIODO ' +
              'WHERE ( PEREXERCICIO = '+IntToStr(iExercicio) + ') ';
      if FPeriodoEsp then
         sSql := sSql + ' AND ( PERESPECIAL = ''S'')    '
      else
         sSql := sSql + ' AND (( PERESPECIAL = ''N'') OR ( PERESPECIAL IS NULL)) ';

      If iPeriodo > 0  Then
      Begin
        If bTodos Then
           sSql := sSql + '  AND ( PERNUMERO <= '+IntToStr(iPeriodo)+') '
        Else
           sSql := sSql + '  AND ( PERNUMERO = '+IntToStr(iPeriodo) + ') ';
      End;

      sSql := sSql + '  AND ( IDPESSOA = '+FloatToStr(IdEmpresa) + ') ';

      Case TipoBloque of
         tbBloqueado : sSql := sSql + '  AND ( PERBLOQUE <> ''S'') ';
         tbBloqOuInt : sSql := sSql + '  AND (( PERBLOQUE <> ''S'') AND ( PERBLOINT <> ''S'')) ';
         tbIntegrado : sSql := sSql + '  AND ( PERBLOINT <> ''S'') ';
         tbBloqEInt  : sSql := sSql + '  AND (( PERBLOQUE <> ''S'') OR ( PERBLOINT <> ''S'')) ';
      End;

      _cds.Data := GetDataPacket(sSql);

      If _cds.IsEmpty Then
      Begin
         Result := True;
         If bTodos Then
            MessageInfo  := 'Existem Períodos Já Bloqueados'
         Else
            MessageInfo  := 'Período Bloqueado';
      End Else
      Begin
         Result := False;
         If bTodos Then
            MessageInfo  := 'Existem Períodos Não Bloqueados'
         Else
            MessageInfo  := 'Período Não Bloqueado';
      End;
end;

function TCtrlPeriodo.ListExercicios( IdEmpresa : Double; bTodos : Boolean ) : OleVariant;
var
  sSql, sfiltro, sordena :string;
begin
     { bTodos = True => Significa que o sistema retornará todos os exercícios existentes
       bTodos = False => Significa que o sistema retornará todos os exercícios maiores ou igual ao exercício atual
     }

    If Not Contab.SelecionaParametros(IdEmpresa) Then
    Begin
       Result := False;
       MessageInfo := Contab.MessageInfo;
    End Else
    Begin

    // 31/07/03 - Alex - Pend 14564
    //  sSql := 'SELECT DISTINCT PEREXERCICIO ' +
    sSql := 'SELECT PEREXERCICIO, MAX(PERDATFIM) AS PERDATFIM ' +
               'FROM PERIODO ' +
               'WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+') ';
      if FPeriodoEsp then
         sSql := sSql + ' AND ( PERESPECIAL = ''S'')    '
      else
         sSql := sSql + ' AND (( PERESPECIAL = ''N'') OR ( PERESPECIAL IS NULL)) ';

       If Not bTodos Then
          sSql := sSql + '  AND (PEREXERCICIO >= '+IntToStr(Contab.ExercicioAtual)+') ';

       // Alex 31/07/03
       // sOrdena := 'ORDER BY PEREXERCICIO ';
       sOrdena := 'GROUP BY PEREXERCICIO ';

       sSql := sSql + sfiltro + sOrdena;

       Result := GetDataPacket(sSql);
    End;
end;

function TCtrlPeriodo.ListPeriodo( dIdEmpresa : Double; TipoBloquePer : TTipoBloquePer; iExercicio,iPerNumero : Integer) : OleVariant;
var
  sSql, sfiltro, sOrdena :string;
begin
      { tbpTodos => Todos os períodos, bloqueados ou não
        tbpSoInt => Todos os períodos bloqueados para integração (PERBLOINT = 'S')
        tbpSoNaoInt => Todos os períodos não bloqueados para integração (PERBLOINT <> 'S')
        tbpSoBloq => Todos os períodos bloqueados (PERBLOQUE = 'S')
        tbpSoNaoBloq => Todos os períodos não bloqueados (PERBLOQUE <> 'S')
        tbpNaoBloqInt => Todos os períodos totalmente não bloqueados ((PERBLOQUE <> 'S') AND (PERBLOINT <> 'S'))
        tpbBloqInt => Todos os períodos totalmente bloqueados ((PERBLOQUE = 'S') AND (PERBLOINT = 'S'))
      }

      sSql := 'SELECT '  +
              '   PEREXERCICIO,      ' +
              '   PERNUMERO,         ' +
              '   PERDATINI,         ' +
              '   PERDATFIM,         ' +
              '   PERNOME,           ' +
              '   PERNOMEOUTLING,    ' +
              '   PERBLOQUE,         ' +
              '   PERPLANIL,         ' +
              '   PERBLOINT,         ' +
              '   IDPESSOA,          ' +
              '   IDUSUARIOINCLUSAO, ' +
              '   PEROUTMOEDA,       ' +
              '   PERATUALI,         ' +
              '   PERESPECIAL        ' +
              'FROM ' +
              '   PERIODO ';
      //--------------------------------------------------------
      sFiltro := '';
      If (dIdEmpresa <> 0) Then
         sFiltro :=  'WHERE (IDPESSOA = ' + FloatToStr(dIdEmpresa) + ') ' ;
      //-------------------------------------------------------
      if iExercicio > 0 Then
      Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (PEREXERCICIO = '+IntToStr(iExercicio)+') '
         else
            sFiltro := sFiltro +  'AND (PEREXERCICIO = '+IntToStr(iExercicio)+') ';
      End;
      //-------------------------------------------------------
      if iPerNumero > 0 Then
      Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (PERNUMERO = '+IntToStr(iPerNumero)+') '
         else
            sFiltro := sFiltro +  'AND (PERNUMERO = '+IntToStr(iPerNumero)+') ';
      End;
      //-------------------------------------------------------
      Case TipoBloquePer of
         tbpSoInt     : sFiltro := sFiltro +  '  AND (PERBLOINT = ''S'') ';
         tbpSoNaoInt  : sFiltro := sFiltro +  '  AND (PERBLOINT <> ''S'') ';
         tbpSoBloq    : sFiltro := sFiltro +  '  AND (PERBLOQUE = ''S'') ';
         tbpSoNaoBloq : sFiltro := sFiltro +  '  AND (PERBLOQUE <> ''S'') ';
         tbpNaoBloqInt: sFiltro := sFiltro +  '  AND ((PERBLOQUE <> ''S'') AND (PERBLOINT <> ''S'')) ';
         tpbBloqInt   : sFiltro := sFiltro +  '  AND ((PERBLOQUE = ''S'') AND (PERBLOINT = ''S'')) ';
      end;

      sOrdena := ' ORDER BY PEREXERCICIO, PERNUMERO ';

      sSql := sSql + sFiltro + sOrdena;

      Result := GetDataPacket(sSql);
end;
procedure TCtrlPeriodo.DoChangeDataBase;
begin
  inherited;
  _dbPeriodo.DataBaseName      := DataBaseName;
  //

end;

function TCtrlPeriodo.EncerraPeriodo(IdEmpresa,IdModulo,IdUsuario: Double; iExercicio,
  iPeriodo: Integer; TipoBloqueGra : TTipoBloqueGra): Boolean;
var
  sSql :string;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.EncerraPeriodo(IdEmpresa,IdModulo,IdUsuario,iExercicio,iPeriodo,Integer(TipoBloqueGra));
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      Try

         StartTransaction;

         sSql := 'UPDATE  PERIODO SET ';

         Case TipoBloqueGra  of
            tbgTodos : Begin
                          sSql := sSql + 'PERBLOQUE =  ''S'',';
                          sSql := sSql + 'PERBLOINT =  ''S'',';
                          sSql := sSql + 'PERATUALI =  ''S''';
                       End;
            tbgAtualiza  : sSql := sSql + 'PERATUALI = ''S''';
            tbgIntegrado : sSql := sSql + 'PERBLOINT = ''S''';
            tbgBloq      : sSql := sSql + 'PERBLOQUE = ''S''';
         End;

         sSql := sSql + ' WHERE ';
         sSql := sSql + '  (PEREXERCICIO = ' + IntToStr(iExercicio) + ') AND ';
         sSql := sSql + '  (PERNUMERO    = ' + IntToStr(iPeriodo) + ') AND ';
         sSql := sSql + '  (IDPESSOA     = ' + FloatToStr(idEmpresa) + ')';

         Result := ExecSQL(sSql);

         If not Result then
            Raise Exception.Create('Erro ao Tentar Atualizar Periodo.');

        Result := True;

        If not Padroes.GravaLogOperacoes(IdEmpresa,IdModulo,IdUsuario, 'Encerra Período',False) then
           Raise Exception.Create( Padroes.MessageInfo );

        Commit;

      Except
         On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
      End;
   End;
end;

constructor TCtrlPeriodo.Create;
begin
  inherited;
  _dbPeriodo   := TdbPeriodo.Create(Self);
  _sql           := TCmSqlParams.Create(nil);
  _sql.ControlObject := Self;

  //
  Contab := TCtrlContab.Create;
  Padroes :=TCtrlPadroes.create;
  FPeriodoEsp := False;
end;

destructor TCtrlPeriodo.Destroy;
begin
  inherited;
  _dbPeriodo.Free;
  _sql.Free;

  Contab.Free;
  Padroes.free;
  //
  If IsAppServer Then
     FreeCds([FCdsPeriodo]);

end;

function TCtrlPeriodo.RetornaPeriodoExercicioData(IdEmpresa: Double; sData: String): Boolean;
var
  sSql :string;
begin
      Result     := False;
      if sData = '' then begin
         MessageInfo:= 'Data Não Informada';
      end else begin
         {** GUSTAVO VIEGAS 23/04/2002 **}
         sSql := 'SELECT PERNOME, PEREXERCICIO, PERNUMERO,PERDATINI,PERDATFIM FROM PERIODO ' +
                 'WHERE ( TO_DATE('''+sData+''',''DD/MM/YYYY'') BETWEEN PERDATINI AND PERDATFIM )' +
                 '  AND ( IDPESSOA = '+FloatToStr(IdEmpresa)+')';
        if FPeriodoEsp then
           sSql := sSql + ' AND ( PERESPECIAL = ''S'') '
        else
           sSql := sSql + ' AND (( PERESPECIAL = ''N'') OR ( PERESPECIAL IS NULL)) ';

         _Cds.Data := GetDataPacket(sSql);
         if _Cds.IsEmpty then begin
            MessageInfo:= 'Esta data não pertence a nenhum Período';
            FExercicio := 0;
            FPeriodo   := 0;
            FNomePeriodo := '';
         end else begin
            if _Cds.RecordCount > 1 then begin
               MessageInfo:= 'Esta data pertence a mais de um Período';
            end else begin
               Result      := True;
               FExercicio  := _Cds.FieldByName('PEREXERCICIO').AsInteger;
               FPeriodo    := _Cds.FieldByName('PERNUMERO').AsInteger;
               FNomePeriodo:= _Cds.FieldByName('PERNOME').AsString;
               FDataIniPeriodo := _Cds.FieldByName('PERDATINI').AsDateTime;
               FDataFimPeriodo := _Cds.FieldByName('PERDATFIM').AsDateTime;
               MessageInfo:= '';
            end;
         end;
      end;
end;

function TCtrlPeriodo.TestaPeriodoExiste(IdEmpresa: Double; iPeriodo,
  iExercicio: Integer): Boolean;
var sSql : String;
begin
    sSql :='SELECT PEREXERCICIO, PERNUMERO, PERDATINI, PERDATFIM, ' +
                                 '       PERNOME, PERNOMEOUTLING, PERBLOQUE, PERBLOINT  ' +
                                 'FROM PERIODO ' +
                                 'WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+')' +
                                 '  AND (PEREXERCICIO = '+IntToStr(iExercicio)+')' +
                                 '  AND (PERNUMERO = '+IntToStr(iPeriodo)+')';
    if FPeriodoEsp then
       sSql := sSql + ' AND ( PERESPECIAL = ''S'')    '
    else
       sSql := sSql + ' AND (( PERESPECIAL = ''N'') OR ( PERESPECIAL IS NULL)) ';

      {** GUSTAVO VIEGAS 23/04/2002 **}
      _Cds.Data := GetDataPacket(sSql);

      if _Cds.IsEmpty then begin
         Result := False;
         MessageInfo := 'Período não Cadastrado para esta empresa';
      end else begin
         Result := True;
         MessageInfo  := '';
         FDataIniPeriodo := _Cds.FieldByName('PERDATINI').AsDateTime;
         FDataFimPeriodo := _Cds.FieldByName('PERDATFIM').AsDateTime;
         FExercicio      := _Cds.FieldByName('PEREXERCICIO').AsInteger;
         FPeriodo        := _Cds.FieldByName('PERNUMERO').AsInteger;
      end;
end;



procedure TCtrlPeriodo.SetDataFimPeriodo(const Value: TDateTime);
begin
  FDataFimPeriodo := Value;
end;

procedure TCtrlPeriodo.SetDataIniPeriodo(const Value: TDateTime);
begin
  FDataIniPeriodo := Value;
end;

procedure TCtrlPeriodo.SetExercicio(const Value: Integer);
begin
  FExercicio := Value;
end;
procedure TCtrlPeriodo.SetMaxPeriodo(const Value: Integer);
begin
  FMaxPeriodo := Value;
end;

procedure TCtrlPeriodo.SetPeriodo(const Value: Integer);
begin
  FPeriodo := Value;
end;
function TCtrlPeriodo.ValidaExercicio: Boolean;
begin
   Result := True;
   if FExercicio = 0 then
   begin
      Result := False;
      MessageInfo := 'O Exercício deve ser preenchido';
   end;
end;

function TCtrlPeriodo.ValidaPeriodo: Boolean;
begin
   Result := True;
   if FPeriodo = 0 then
   begin
      Result := False;
      MessageInfo := 'O Período deve ser preenchido';
   end;
end;


function TCtrlPeriodo.TestaPeriodoxData(IdEmpresa: Double; iPeriodo,
  iExercicio: Integer; sData: String): Boolean;
var sSql : String;
begin
   {Funcão implementada na Aplicação Servidora}
  { If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.TestaPeriodoxData(IdEmpresa, iPeriodo,
                  iExercicio,sData);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin   }
      Result := true;
      if (sData = '') or (iExercicio = 0) or (iPeriodo = 0) then begin
         MessageInfo:= 'Data, Exercicio ou Período Não Informados';
         Result := False;
      end else begin
         {** GUSTAVO VIEGAS 23/04/2002 **}
         sSql :='SELECT PEREXERCICIO, PERNUMERO FROM PERIODO ' +
                                    'WHERE ( TO_DATE('''+sData+''',''DD/MM/YYYY'') BETWEEN PERDATINI AND PERDATFIM )'  +
                                    '  AND ( IDPESSOA = '+FloatToStr(IdEmpresa)+')' +
                                    '  AND ( PEREXERCICIO = '+IntToStr(iExercicio)+')' +
                                    '  AND ( PERNUMERO = '+IntToStr(iPeriodo)+')';
      if FPeriodoEsp then
         sSql := sSql + ' AND ( PERESPECIAL = ''S'')    '
      else
         sSql := sSql + ' AND (( PERESPECIAL = ''N'') OR ( PERESPECIAL IS NULL)) ';
         _Cds.Data := GetDataPacket(sSql);

         if _Cds.IsEmpty then begin
            MessageInfo:= 'Data não pertence ao Período Informado';
            Result := False;
         end;
      end;
end;

procedure TCtrlPeriodo.SetNomePeriodo(const Value: String);
begin
  FNomePeriodo := Value;
end;


procedure TCtrlPeriodo.SetCdsPeriodo(const Value: TClientDataSet);
begin
  FCdsPeriodo := Value;
end;


procedure TCtrlPeriodo.AfterInitialize;
begin
  inherited;
  Contab.initializeas(self);
  Padroes.initializeas(self);

end;

function TCtrlPeriodo.TestaPeriodoBloqueadoProc(IdEmpresa: Double;
  TipoBloque: TTipoBloque; iPeriodo, iExercicio: Integer;
  bTodos: Boolean): Boolean;
begin
     {** GUSTAVO VIEGAS 23/04/2002 **} {Alterado veronica 09/05}
     Try
         With TCmSqlParams.Create(nil) Do
           Try
              ControlObject := Self;
              SQL.Clear;
              SQL.Add('SELECT PEREXERCICIO FROM PERIODO ');
              SQL.Add('WHERE ( PEREXERCICIO = '+IntToStr(iExercicio)+')');

              if FPeriodoEsp then
                 SQL.Add(' AND ( PERESPECIAL = ''S'')    ')
              else
                 SQL.Add(' AND (( PERESPECIAL = ''N'') OR ( PERESPECIAL IS NULL)) ');

              if bTodos then
                 SQL.Add('  AND ( PERNUMERO <= '+IntToStr(iPeriodo)+')')
              else
                 SQL.Add('  AND ( PERNUMERO = '+IntToStr(iPeriodo)+')');
              SQL.Add('  AND ( IDPESSOA = '+FloatToStr(IdEmpresa)+')');
              Case TipoBloque of
                 tbBloqueado : SQL.Add('  AND ( PERBLOQUE <> ''S'')');
                 tbBloqOuInt : SQL.Add('  AND (( PERBLOQUE <> ''S'') AND ( PERBLOINT <> ''S''))');
                 tbIntegrado : SQL.Add('  AND ( PERBLOINT <> ''S'')');
                 tbBloqEInt  : SQL.Add('  AND (( PERBLOQUE <> ''S'') OR ( PERBLOINT <> ''S''))');
              end;
               OpenDataSet(SQL.Text);
           Finally
              Free;
           End;

          if _lDataSet.IsEmpty then
          begin
             Result := True;
             if bTodos then
                MessageInfo  := 'Existem Períodos Já Bloqueados'
             else
                MessageInfo  := 'Período Bloqueado';
          end else
          begin
             Result := False;
             if bTodos then
                MessageInfo  := 'Existem Períodos Não Bloqueados'
             else
               MessageInfo  := 'Período Não Bloqueado';
          end;

     Except
        On E:Exception Do
        Begin
           Result := False;
           MessageInfo := E.Message;
        End;
     End;

end;

function TCtrlPeriodo.RetornaPeriodoExercicioDataProc(IdEmpresa: Double;
  sData: String): Boolean;
begin
      Result     := False;
      if sData = '' then begin
         MessageInfo:= 'Data Não Informada';
      end else
      begin
        With _Sql Do
         Try
           SQL.Clear;
           SQL.Add('SELECT PERNOME, PEREXERCICIO, PERNUMERO,PERDATINI,PERDATFIM FROM PERIODO ');
           SQL.Add('WHERE ( TO_DATE('''+sData+''',''DD/MM/YYYY'') BETWEEN PERDATINI AND PERDATFIM )');
           SQL.Add('  AND ( IDPESSOA = '+FloatToStr(IdEmpresa)+')');

           if FPeriodoEsp then
              SQL.Add(' AND ( PERESPECIAL = ''S'')    ')
           else
              SQL.Add(' AND (( PERESPECIAL = ''N'') OR ( PERESPECIAL IS NULL)) ');

           OpenDataSet(SQL.Text);

         Finally

         End;

         if _lDataSet.IsEmpty then begin
            MessageInfo  := 'Esta data não pertence a nenhum Período';
            FExercicio   := 0;
            FPeriodo     := 0;
            FNomePeriodo := '';
         end else begin
            if _lDataSet.RecordCount > 1 then begin
               MessageInfo:= 'Esta data pertence a mais de um Período';
            end else begin
               Result      := True;
               FExercicio  := _lDataSet.FieldByName('PEREXERCICIO').AsInteger;
               FPeriodo    := _lDataSet.FieldByName('PERNUMERO').AsInteger;
               FNomePeriodo:= _lDataSet.FieldByName('PERNOME').AsString;
               FDataIniPeriodo := _lDataSet.FieldByName('PERDATINI').AsDateTime;
               FDataFimPeriodo := _lDataSet.FieldByName('PERDATFIM').AsDateTime;
               MessageInfo:= '';
            end;
         end;
      end;

end;

end.


