unit uCtrlPlanoData;
{-------------------------------------------------------------------------------
Analista    : Augusto 
Data        : 15/12/2007 
Modificações: PlanoNoPeriodo
Descrição   : Nova rotina para buscar os planos ativos em um periodo
{-------------------------------------------------------------------------------
Analista    : Marcus Oliveira
Data        : 13/09/2007
Pendência   : 26345
Modificações: ListaPlanoVig
Descrição   : Incrementado o numero 1 para passar de 31/12/XXXX para 01/01/XXXX
{-------------------------------------------------------------------------------
Analista    : Alex Pereira
Data        : 22/03/04
Pendência   : 16239
Modificações: ListPlanoData
Descrição   : Garantir que não ocorram conflitos na vigência dos planos
-------------------------------------------------------------------------------}

interface

Uses DB, uDataBase, uDbPlanoData, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask, CMProcura,DBTables,
     Classes,
     uCMTypes;

  Type tPlano = (TPIgual, TPDiferente);

  Type

    TCtrlPlanoData = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbPlanoData  : TDbPlanoData;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FcdsPlanoData : TClientDataSet;
      FPlano: Integer;

      procedure SetcdsPlanoData(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property cdsPlanoData: TClientDataSet Read FCdsPlanoData Write SetCdsPlanoData;

      Property Plano : Integer read FPlano;


      {Esta função tem o Objetivo de retornar regsitros da tabela de Plano}
      // garantir que não exista plano com mesma vigência de datas
      Function ListPlanoData(const dPlanoData :Double = 0; const TpPlano: tPlano = TPIgual; const dDataVigencia: TDateTime = -1):OleVariant;

      Function ListaPlanoVig(dDataInicio, dDataFim: TDateTime) :OleVariant;

      {Esta função tem o objetivo de gravar registros na tabela Plano}
      function Gravar :Boolean;

      { Augusto 05/12/2007                                                         }
      { Funções para retornar o plano encontrado em um período datas.              }
      {   Caso encontrem um plano no periodo retorna TRUE e preenche a propriedade }
      {   PLANO com o plano encontrado.                                            }
      {   Caso não encontrem nada ou mais de um plano no periodo retorna FALSE.    }
      Function PlanoNoPeriodo( piExercicio, piPeridoInicial  : Integer ): Boolean;  OverLoad;
      Function PlanoNoPeriodo( piExercicio, piPeridoInicial, piPeriodoFinal : Integer ): Boolean; OverLoad;




    End;


implementation

{ TCtrlPlanoData }

constructor TCtrlPlanoData.Create;
begin
  inherited;
  _dbPlanoData  := TDbPlanoData.Create(Self);
end;

destructor TCtrlPlanoData.Destroy;
begin
  inherited;

  _dbPlanoData.Free;
  if isAppServer then FCdsPlanoData.Free;

end;


function TCtrlPlanoData.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarPlanoData ( FcdsPlanoData.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsPlanoData,_dbPlanoData,[],[] );
           Msg    := _dbPlanoData.MessageInfo;
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


procedure TCtrlPlanoData.DoChangeDataBase;
begin
  inherited;
  _dbPlanoData.DataBaseName := DataBaseName;

end;

function TCtrlPlanoData.ListPlanoData(const dPlanoData:Double; const TpPlano: tPlano; const dDataVigencia: TDateTime): OleVariant;
var
  sSql, sfiltro :string;

begin
          sSql := 'SELECT ' +
                  '   PLANO,        ' +
                  '   IDPLANODATA,  ' +
                  '   IDPESSOA,     ' +
                  '   DATAINICIO,   ' +
                  '   DATAFIM,      ' +
                  '   PLANOANTERIOR ' +
                  'FROM ' +
                  '   PLANODATA ' +
                  'WHERE 1=1 ';

      sfiltro := '';
      If (dPlanoData <> 0) Then begin
         // garantir que não exista plano com mesma vigência de datas
         if TpPlano = TPIgual then
           sfiltro :=   'AND  (IDPLANODATA = ' + FloatToStr(dPlanoData) + ') '
         else
           sfiltro :=   'AND  (IDPLANODATA <> ' + FloatToStr(dPlanoData) + ') ';
      end;

     // garantir que não exista plano com mesma vigência de datas
     if dDataVigencia <> -1 then
       sfiltro := sfiltro + 'AND ( TO_DATE (' +  QuotedStr(FormatDateTime('dd/mm/yyyy', dDataVigencia)) + ', ''DD/MM/YYYY'') BETWEEN DATAINICIO AND DATAFIM ) ';


     sSql := Ssql + sFiltro;

     Result := GetDataPacket(sSql);

end;

procedure TCtrlPlanoData.SetCdsPlanoData(const Value: TClientDataSet);
begin
  FCdsPlanoData := Value;
end;



procedure TCtrlPlanoData.OnCreateAppServer;
begin
  inherited;
  FCdsPlanoData := TClientDataSet.Create(nil);

end;

function TCtrlPlanoData.ListaPlanoVig(dDataInicio,
  dDataFim: TDateTime): OleVariant;
Var
  sSql : String;
    
begin
  sSql := ' SELECT * '+
          ' FROM PLANODATA '+
          ' WHERE DATAINICIO = (SELECT MAX(DATAINICIO) '+
                              ' FROM PLANODATA '+
                              ' WHERE DATAINICIO <= TO_DATE('+QuotedStr(FormatDateTime('dd/mm/yyyy', dDataInicio+1)) +', ''DD/MM/YYYY'')) '+
          ' UNION '+
          ' SELECT * '+
          ' FROM PLANODATA '+
          ' WHERE DATAFIM = (SELECT MIN(DATAFIM) '+
                           ' FROM PLANODATA '+
                           ' WHERE DATAFIM >= TO_DATE('+QuotedStr(FormatDateTime('dd/mm/yyyy', dDataFim)) +', ''DD/MM/YYYY'')) ';
  Result := GetDataPacket(sSql);
end;

Function TCtrlPlanoData.PlanoNoPeriodo( piExercicio, piPeridoInicial: Integer ): Boolean;
Begin

  PlanoNoPeriodo(piExercicio, piPeridoInicial, -1 );

End;

Function TCtrlPlanoData.PlanoNoPeriodo( piExercicio, piPeridoInicial, piPeriodoFinal: Integer ): Boolean;
Var
  tSQL : TStringList;

  sDataInicial, sDataFinal : String;
Begin

  sDataInicial := '01/' + FormatFloat( '00', piPeridoInicial )+ '/' + IntToStr( piExercicio );

  If ( piPeriodoFinal = -1 )
  Then  sDataFinal   := sDataInicial
  Else  sDataFinal   := '01/' + FormatFloat( '00', piPeriodoFinal  )+ '/' + IntToStr( piExercicio );

  Try

    Try

      tSQL := TStringList.Create;

      tSQL.Add( 'SELECT ' );
      tSQL.Add( '  PLANO ' );
      tSQL.Add( 'FROM ' );
      tSQL.Add( '  PLANODATA PLD ' );
      tSQL.Add( 'WHERE ' );
      tSQL.Add( '      PLD.DATAINICIO <= TO_DATE(' + QuotedStr( sDataFinal ) + ', ''DD/MM/YYYY'') ' );
      tSQL.Add( '  AND PLD.DATAFIM    >= TO_DATE(' + QuotedStr( sDataInicial ) + ', ''DD/MM/YYYY'') ' );

      _Cds.Data := GetDataPacket( tSQL );

      If ( _Cds.IsEmpty ) Then Begin

        MessageInfo := 'Data ou intervalo de datas não pertencem a nenhum periodo. ';
        Result := False;

      End Else If ( _Cds.RecordCount > 1 ) Then Begin

        MessageInfo := 'Existe mais de um plano no período de datas informado. ';
        Result := False;

      End Else Begin

        FPlano := _Cds.FieldByName('PLANO').AsInteger;
        Result := True;

      End;

    Except

      On E:Exception Do Begin

        MessageInfo := 'Erro ao consultar dados : '+ #13+
                       E.Message;
        Result := False;

      End;

    End;

  Finally

    FreeAndNil( tSQL );

  End;

End;


end.
