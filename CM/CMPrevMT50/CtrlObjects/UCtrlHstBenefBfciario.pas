unit UCtrlHstBenefBfciario;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : InsereHistoricoNoCache
// Autor(a)    : Augusto
// Data        : 17/05/2007
// Pendencia   : 19532
// Descrição   : Novo método para inserir históricos de beneficio em cache
// -----------------------------------------------------------------------------

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbHstBenefBfciario, uFuncoesPrevMT50, Dialogs, Db;

Type

  TCtrlHstBenefBfciario = class(TCmControlObject)
  private

    FDbHstBenefBfciario     : TDbHstBenefBfciario;

    procedure SetCdsHstBenefBfciario(const Value: TCMClientDataSet);

  protected

    procedure DoChangeDataBase; Override;

  public

    FCdsHstBenefBfciario    : TCMClientDataSet;

    constructor Create;  override;
    destructor  Destroy; override;

    property DbHstBenefBfciario  : TDbHstBenefBfciario     read FDbHstBenefBfciario  write FDbHstBenefBfciario;
    property CdsHstBenefBfciario : TCMClientDataSet read FCdsHstBenefBfciario write SetCdsHstBenefBfciario;

    function GravaHstBenefBfciario : Boolean;

    { Inserir registros do histórico no cache da maquina  }
    Function InsereHistoricoNoCache: Boolean;

    { Retorna o próximo sequencial do histórico de beneficio }
    Function ProximoSequencial: Integer;

    { Retorna o tipo de registro para inserir no histórico de beneficio.        }
    { 0 - Normal                                                                }
    { 1 - Abono                                                                 }
    { 2 - Antecipação de abono                                                  }
    { 3 - Revisão Normal                                                        }
    { 4 - Abono revisão                                                         }
    { 5 - Adiantamento de abono revisão                                         }
    Function TipoRegistro( piTipoMov : Integer;
                           psAnoMesAtual : String ): Integer;

    { Verificar se já existe registro no histórico e benefícios.                }
    { 0 - Normal                                                                }
    { 1 - Abono                                                                 }
    { 2 - Antecipação de abono                                                  }
    { 3 - Revisão Normal                                                        }
    { 4 - Abono revisão                                                         }
    { 5 - Adiantamento de abono revisão                                         }
    Function ExisteHistoricoNoMesReferencia: Boolean;

end;

implementation

{ TCtrlHstBenefBfciario }

constructor TCtrlHstBenefBfciario.Create;
begin
  inherited;

  FDbHstBenefBfciario     := TDbHstBenefBfciario.Create(Self);

  FCdsHstBenefBfciario    := TCMClientDataSet.Create(Nil);

end;

destructor TCtrlHstBenefBfciario.Destroy;
begin

  FDbHstBenefBfciario.Free;

  FCdsHstBenefBfciario.Free;

  inherited;
end;

procedure TCtrlHstBenefBfciario.DoChangeDataBase;
begin
  inherited;

  FDbHstBenefBfciario.DataBaseName    := Self.DataBaseName;

end;


function TCtrlHstBenefBfciario.GravaHstBenefBfciario: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin

    Result := Connection.AppServer.GravarHstBenefBfciario( CdsHstBenefBfciario.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;

  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsHstBenefBfciario, DbHstBenefBfciario, [], [] );

      Msg := DbHstBenefBfciario.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      on E : Exception do begin

        Result := False;
        Rollback;
        MessageInfo := E.Message;

     end;
   end;
  end;
end;


procedure TCtrlHstBenefBfciario.SetCdsHstBenefBfciario(const Value: TCMClientDataSet);
begin
  FCdsHstBenefBfciario := Value;
end;


Function TCtrlHstBenefBfciario.InsereHistoricoNoCache: Boolean;
Var
  sSQL : String;
Begin

  Result := False;

  If ( FCdsHstBenefBfciario = Nil ) Then
  Begin

    MessageInfo := 'Componente utilizado para armazenar o histórico de beneficios, '+#13+
                   'não foi inicializado.';
    Exit;

  End;

  If ( FCdsHstBenefBfciario.State in [ dsInactive ]  ) Then
  Begin

    { Buscar estrutura da HSTBENEFBFCIARIO para usar em cache e atualizar BD }
    sSQL := 'SELECT * FROM HSTBENEFBFCIARIO HBF WHERE 1 = 2';

    FCdsHstBenefBfciario.Data := GetDataPacket( sSQL );

  End;

  Try

    FCdsHstBenefBfciario.Append;

    FCdsHstBenefBfciario.FieldByName('IDPESSJUR').AsInteger       := FDbHstBenefBfciario.Idpessjur.AsInteger;
    FCdsHstBenefBfciario.FieldByName('IDTITULAR').AsInteger       := FDbHstBenefBfciario.Idtitular.AsInteger;
    FCdsHstBenefBfciario.FieldByName('IDPESSOA').AsInteger        := FDbHstBenefBfciario.Idpessoa.AsInteger;
    FCdsHstBenefBfciario.FieldByName('IDPLANOPREV').AsInteger     := FDbHstBenefBfciario.Idplanoprev.AsInteger;
    FCdsHstBenefBfciario.FieldByName('IDPLANOORIGEM').AsInteger   := FDbHstBenefBfciario.Idplanoorigem.AsInteger;
    FCdsHstBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger     := FDbHstBenefBfciario.Seqproposta.AsInteger;
    FCdsHstBenefBfciario.FieldByName('IDMOTIVO').AsInteger        := FDbHstBenefBfciario.Idmotivo.AsInteger;
    FCdsHstBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger  := FDbHstBenefBfciario.Numeroprocesso.AsInteger;
    FCdsHstBenefBfciario.FieldByName('IDBENEFICIO').AsInteger     := FDbHstBenefBfciario.Idbeneficio.AsInteger;
    FCdsHstBenefBfciario.FieldByName('MES').AsString              := FDbHstBenefBfciario.Mes.AsString;
    FCdsHstBenefBfciario.FieldByName('MESREFERENCIA').AsString    := FDbHstBenefBfciario.Mesreferencia.AsString;
    FCdsHstBenefBfciario.FieldByName('SEQBENEFICIO').AsInteger    := FDbHstBenefBfciario.Seqbeneficio.AsInteger;

    FCdsHstBenefBfciario.FieldByName('VALORPREV').AsFloat         := FDbHstBenefBfciario.Valorprev.AsFloat;
    FCdsHstBenefBfciario.FieldByName('VALORSRB').AsFloat          := FDbHstBenefBfciario.Valorsrb.AsFloat;
    FCdsHstBenefBfciario.FieldByName('VALORCALCULADO').AsFloat    := FDbHstBenefBfciario.Valorcalculado.AsFloat;
    FCdsHstBenefBfciario.FieldByName('VALORINTEGRAL').AsFloat     := FDbHstBenefBfciario.Valorintegral.AsFloat;
    FCdsHstBenefBfciario.FieldByName('VALORTOTAL').AsFloat        := FDbHstBenefBfciario.Valortotal.AsFloat;
    FCdsHstBenefBfciario.FieldByName('VLBENEFPGTO').AsFloat       := FDbHstBenefBfciario.Vlbenefpgto.AsFloat;
    FCdsHstBenefBfciario.FieldByName('VALORACERTO').AsFloat       := FDbHstBenefBfciario.Valoracerto.AsFloat;
    FCdsHstBenefBfciario.FieldByName('PERCENTUAL').AsFloat        := FDbHstBenefBfciario.Percentual.AsFloat;
    FCdsHstBenefBfciario.FieldByName('VALORPREVMIN').AsFloat      := FDbHstBenefBfciario.Valorprevmin.AsFloat;


    FCdsHstBenefBfciario.FieldByName('IDREGRACALCULO').AsInteger  := FDbHstBenefBfciario.Idregracalculo.AsInteger;
    FCdsHstBenefBfciario.FieldByName('IDLOTE').AsInteger          := FDbHstBenefBfciario.Idlote.AsInteger;

    FCdsHstBenefBfciario.FieldByName('FLGENVIADO').AsInteger      := FDbHstBenefBfciario.Flgenviado.AsInteger;
    FCdsHstBenefBfciario.FieldByName('FLGCONCESSAO').AsInteger    := FDbHstBenefBfciario.Flgconcessao.AsInteger;
    FCdsHstBenefBfciario.FieldByName('FLGDEVOLUCAO').AsInteger    := FDbHstBenefBfciario.Flgdevolucao.AsInteger;
    FCdsHstBenefBfciario.FieldByName('FLGTIPOREGISTRO').AsInteger := FDbHstBenefBfciario.Flgtiporegistro.AsInteger;
    FCdsHstBenefBfciario.FieldByName('FLGPROVISORIO').AsString    := FDbHstBenefBfciario.Flgprovisorio.AsString;

    FCdsHstBenefBfciario.FieldByName('FONTEPAGADORA').AsInteger   := FDbHstBenefBfciario.Fontepagadora.AsInteger;

    FCdsHstBenefBfciario.FieldByName('CODPORTFORMA').AsString     := FDbHstBenefBfciario.Codportforma.AsString;
    FCdsHstBenefBfciario.FieldByName('DATAPAGAMENTO').AsDateTime  := FDbHstBenefBfciario.DataPagamento.AsDateTime;

    FCdsHstBenefBfciario.FieldByName('VALOROP1').AsFloat          := FDbHstBenefBfciario.Valorop1.AsFloat;
    FCdsHstBenefBfciario.FieldByName('VALOROP2').AsFloat          := FDbHstBenefBfciario.Valorop2.AsFloat;
    FCdsHstBenefBfciario.FieldByName('VALOROP3').AsFloat          := FDbHstBenefBfciario.Valorop3.AsFloat;

    FCdsHstBenefBfciario.FieldByName('IDTITBENEF').AsInteger      := FDbHstBenefBfciario.Idtitbenef.AsInteger;

  Except

    On E:Exception Do Begin

      Result := False;
      MessageInfo := E.Message;

    End;

  End;

End; { InsereHistoricoNoCache }


Function TCtrlHstBenefBfciario.ProximoSequencial: Integer;
Var
  sSQL : String;
Begin

  sSQL := 'SELECT '+
          '  HBF.SEQBENEFICIO '+
          'FROM   '+
          '  HSTBENEFBFCIARIO  HBF '+
          'WHERE  '+
          '     ( HBF.IDPESSJUR      = '+ FDbHstBenefBfciario.IdPessJur.AsString      +' ) '+
          ' AND ( HBF.IDPLANOPREV    = '+ FDbHstBenefBfciario.IdPlanoPrev.AsString    +' ) '+
          ' AND ( HBF.IDTITULAR      = '+ FDbHstBenefBfciario.IdTitular.AsString      +' ) '+
          ' AND ( HBF.IDPESSOA       = '+ FDbHstBenefBfciario.IdPessoa.AsString       +' ) '+
          ' AND ( HBF.NUMEROPROCESSO = '+ FDbHstBenefBfciario.NumeroProcesso.AsString +' ) '+
          ' AND ( HBF.IDBENEFICIO    = '+ FDbHstBenefBfciario.IdBeneficio.AsString    +' ) '+
          ' AND ( HBF.SEQPROPOSTA    = '+ FDbHstBenefBfciario.SeqProposta.AsString    +' ) '+
          ' AND ( HBF.IDPLANOORIGEM  = '+ FDbHstBenefBfciario.IdPlanoOrigem.AsString  +' ) '+

          ' AND ( HBF.IDMOTIVO       = '+ FDbHstBenefBfciario.IdMotivo.AsString       +' ) '+

          ' AND ( HBF.MES            = '+ QuotedStr( FDbHstBenefBfciario.Mes.AsString )           +' ) '+
          ' AND ( HBF.MESREFERENCIA  = '+ QuotedStr( FDbHstBenefBfciario.MesReferencia.AsString ) +' ) ';


  _Cds.Data := GetDataPacket( sSQL );

  If ( _Cds.IsEmpty )
  Then Result := 1
  Else Result := ( _Cds.FieldByName('SEQBENEFICIO').AsInteger + 1 ) ;

  _Cds.Close;

End; { ProximoSequencial }


Function TCtrlHstBenefBfciario.TipoRegistro( piTipoMov : Integer;
                                             psAnoMesAtual : String ): Integer;
Var
  sSQL : String;
  iTipoRegistro : Integer;
Begin

  iTipoRegistro := 0; { Normal }

  If ( psAnoMesAtual <> '' ) Then
  Begin

    If ( Pos( '/13', DbHstBenefBfciario.Mesreferencia.AsString ) > 0 ) Then
    Begin

      iTipoRegistro := 1; { Abono }

      { Caso mês de lançamento seja após PARANANTECIPABONO e antes de MESPAGABONO, é antecipação. }
      sSQL := 'SELECT '+
              '  PAA.MES,       '+
              '  PLN.MESPGABONO '+
              'FROM '+
              '  PARAMANTECIPABONO PAA, PLANPREV PLN '+
              'WHERE '+
              '      PAA.MES        <= '+ QuotedStr( psAnoMesAtual )              +
              '  AND PAA.IDPESSJUR   = '+ DbHstBenefBfciario.IdPessJur.AsString   +
              '  AND PAA.IDPLANOPREV = '+ DbHstBenefBfciario.IdPlanoPrev.AsString +
              '  AND PAA.IDBENEFICIO = '+ DbHstBenefBfciario.IdBeneficio.AsString +
              '  AND PLN.MESPGABONO > '+ Copy( psAnoMesAtual , 6, 2 )             +
              '  AND PAA.IDPLANOPREV = PLN.IDPLANOPREV '+
              'ORDER BY '+
              '  PAA.MES DESC ';

      _Cds.Data := GetDataPacket( sSQL );

      If ( Not _Cds.IsEmpty ) Then Begin
        iTipoRegistro := 2; { Antecipação de abono }
      End;

    End; { If ( Pos( '/13', psAnoMesReferencia ) > 0 ) }

    { Caso seja Revisão usar outros tipos, 3 - Revisão Normal, 4 - Abono revisão, 5 - Adiantamento de abono revisão }
    If piTipoMov = 13
    Then iTipoRegistro := ( iTipoRegistro + 3 );

  End; { If ( psAnoMesAtual <> '' ) }

  Result := iTipoRegistro;

end; { TipoRegistro }




Function TCtrlHstBenefBfciario.ExisteHistoricoNoMesReferencia: Boolean;
Var
  sSQL : String;
  iTipoRegistro : Integer;
Begin

  Result := False;

  sSQL := 'SELECT '+
          '  HBF.SEQBENEFICIO '+
          'FROM   '+
          '  HSTBENEFBFCIARIO  HBF '+
          'WHERE  '+
          '     ( HBF.IDPESSJUR      = '+ FDbHstBenefBfciario.IdPessJur.AsString      +' ) '+
          ' AND ( HBF.IDPLANOPREV    = '+ FDbHstBenefBfciario.IdPlanoPrev.AsString    +' ) '+
          ' AND ( HBF.IDTITULAR      = '+ FDbHstBenefBfciario.IdTitular.AsString      +' ) '+
          ' AND ( HBF.IDPESSOA       = '+ FDbHstBenefBfciario.IdPessoa.AsString       +' ) '+
          ' AND ( HBF.NUMEROPROCESSO = '+ FDbHstBenefBfciario.NumeroProcesso.AsString +' ) '+
          ' AND ( HBF.IDBENEFICIO    = '+ FDbHstBenefBfciario.IdBeneficio.AsString    +' ) '+
          ' AND ( HBF.SEQPROPOSTA    = '+ FDbHstBenefBfciario.SeqProposta.AsString    +' ) '+
          ' AND ( HBF.IDPLANOORIGEM  = '+ FDbHstBenefBfciario.IdPlanoOrigem.AsString  +' ) '+

          ' AND ( HBF.MESREFERENCIA  = '+ QuotedStr( FDbHstBenefBfciario.MesReferencia.AsString ) +' ) ';


  _Cds.Data := GetDataPacket( sSQL );

  If ( Not _Cds.IsEmpty )
  Then Result := True;

  _Cds.Close;

End; { ExisteHistoricoNoMesReferencia }

end.

