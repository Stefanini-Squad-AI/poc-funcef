unit UCtrlBenefBfciario;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : ReatroageBeneficioINSS
// Autor(a)    : Augusto
// Data        : 17/05/2007
// Pendencia   : 19532
// Descrição   : Novo método para retroceder o valor de um beneficio do INSS até
//               sua DIB desfazendo os reajustes do INSS
// -----------------------------------------------------------------------------

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbBenefBfciario, uCtrlHstBenefBfciario,
     uFuncoesPrevMT50, Dialogs, uCtrlCotacaoMoeda, USistema;

Type

  TCtrlBenefBfciario = class(TCmControlObject)
  private

    FCdsBenefBfciario    : TCMClientDataSet;
    FCdsReajustes        : TCMClientDataSet;

    FDbBenefBfciario     : TDbBenefBfciario;

    FCtrlHstBenefBfciario  : TCtrlHstBenefBfciario;
    FCtrlCotacaoMoeda      : TCtrlCotacaoMoeda;

    procedure SetCdsBenefBfciario(const Value: TCMClientDataSet);

    Function PreencheHistorico( piIdMotivo : Integer;
                                psAnoMesReferencia : String ): Boolean;

    { Retornar o valor da cotação de uma moeda antes de deterinado ANO/MES.   }
    { Incluido neste fonte, pois ao usar a uCtrlCotacaoMoeda dava erro na compilação e execução    }
    { do módulo BenefícioPrev.                                                                     }
    Function  RetornaCotacaoINSSAnterior( piCodMoeda : Integer;
                                          psAnoMesReferencia: String ): Double;

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbBenefBfciario  : TDbBenefBfciario     read FDbBenefBfciario  write FDbBenefBfciario;
    property CdsBenefBfciario : TCMClientDataSet read FCdsBenefBfciario write SetCdsBenefBfciario;

    function GravaBenefBfciario : Boolean;

    { Buscar o numero de beneficiários ativos no mês. }
    Function BuscaQtdBeneficiariosAtivos( piNumeroProcesso, piIdBeneficio : Integer;
                                          psAnoMesIni,      psAnoMesFim   : String ): Integer;
    { Buscar o numero de beneficiários ativos no mês, e  }
    { atualizar o percentual da BFCIARIOTITPLAN de cada um deles. com a cota  }
    { rateada dos 100% do benficio, para os inativos zerar o percentual       }
    Function AtualizaNumeroBeneficiarios( piNumeroProcesso, piIdBeneficio : Integer ): Boolean;

    { Retroceder o valores o histórico um beneficio até  }
    { sua DIB. Desfazendo os reajustes do INSS.                               }
    Function ReatroageBeneficioINSS( piIdMoeda, piIdMotivo : Integer ): Boolean;

end;

implementation

{ TCtrlBenefBfciario }

constructor TCtrlBenefBfciario.Create;
begin
  inherited;

  FDbBenefBfciario     := TDbBenefBfciario.Create(Self);
  
  FCdsBenefBfciario    := TCMClientDataSet.Create(Nil);

end;

destructor TCtrlBenefBfciario.Destroy;
begin

  FDbBenefBfciario.Free;

  FCdsBenefBfciario.Free;

  inherited;
end;

procedure TCtrlBenefBfciario.DoChangeDataBase;
begin
  inherited;

  FDbBenefBfciario.DataBaseName    := Self.DataBaseName;
  
end;


function TCtrlBenefBfciario.GravaBenefBfciario: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin

    Result := Connection.AppServer.GravarBenefBfciario( CdsBenefBfciario.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;

  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsBenefBfciario, DbBenefBfciario, [], [] );

      Msg := DbBenefBfciario.MessageInfo;

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


procedure TCtrlBenefBfciario.SetCdsBenefBfciario(const Value: TCMClientDataSet);
begin
  FCdsBenefBfciario := Value;
end;

Function TCtrlBenefBfciario.BuscaQtdBeneficiariosAtivos( piNumeroProcesso, piIdBeneficio : Integer;
                                                         psAnoMesIni,      psAnoMesFim   : String ): Integer;
Var
  sSQL : String;
Begin

  Result := 0;

  If ConnectionSide = cnsclient Then Begin

    Result := Connection.AppServer.BuscaQtdBeneficiariosAtivos( piNumeroProcesso, piIdBeneficio,
                                                                psAnoMesIni,      psAnoMesFim );

  End Else Begin

    { Busca total de beneficiários ativos no processo no mes de referencia }
    sSQL := 'SELECT '+
            ' COUNT(DISTINCT BB.IDPESSOA) AS TOTBENEFICIARIOS '+
            'FROM   '+
            '  BENEFBFCIARIO BB '+
            'WHERE  '+
            '  BB.NUMEROPROCESSO = '+ IntToStr( piNumeroProcesso ) +' AND '+
            '  BB.IDBENEFICIO    = '+ IntToStr( piIdBeneficio )    +' AND '+
            '  TO_CHAR(BB.DATAINICIO,''YYYY/MM'') <= ' + QuotedStr( psAnoMesIni );

    If Trim( psAnoMesFim ) <> '' Then begin

      sSQL := sSQL + ' AND ( (TO_CHAR(BB.DATAFINAL,''YYYY/MM'') >= '+ QuotedStr( psAnoMesIni ) +') OR '+
                             '(BB.DATAFINAL IS NULL) ) ';

    End;


    CdsBenefBfciario.Data := GetDataPacket( sSQL );

    Result := CdsBenefBfciario.FieldByName('TOTBENEFICIARIOS').AsInteger;

  End;

End; { BuscaNumeroBeneficiariosAtivos }

Function TCtrlBenefBfciario.AtualizaNumeroBeneficiarios(piNumeroProcesso,
                                                        piIdBeneficio: Integer): Boolean;
Var
  sSQL, sListaIdPessoa,
  sIdPessjur, sIdPlanoPrev, sIdPlanoOrigem, sIdTitular, sSeqProposta : String;
  iNumBenefAtivos : Integer;
Begin

  Result := False;

  If ConnectionSide = cnsclient Then Begin

    Result := Connection.AppServer.AtualizaNumeroBeneficiarios( piNumeroProcesso, piIdBeneficio );

  End Else Begin

    { Busca todos os beneficiários ativos no processo }
    sSQL := 'SELECT '+
            '  BB.IDPLANOPREV,    BB.IDPLANOORIGEM,  BB.IDPESSJUR,       '+
            '  BB.IDTITULAR,      BB.IDPESSOA,       BB.IDSITBENEFICIO,  '+
            '  BB.SEQPROPOSTA                                            '+
            'FROM   '+
            '  BENEFBFCIARIO BB '+
            'WHERE  '+
            '  BB.NUMEROPROCESSO = '+ IntToStr( piNumeroProcesso ) +' AND '+
            '  BB.IDBENEFICIO    = '+ IntToStr( piIdBeneficio );

    CdsBenefBfciario.Data := GetDataPacket( sSQL );

    If ( Not CdsBenefBfciario.IsEmpty ) Then Begin

      iNumBenefAtivos := 0;
      sListaIdPessoa  := '';

      sIdPessjur      := CdsBenefBfciario.FieldbyName('IDPESSJUR').AsString;
      sIdPlanoPrev    := CdsBenefBfciario.FieldbyName('IDPLANOPREV').AsString;
      sIdTitular      := CdsBenefBfciario.FieldbyName('IDTITULAR').AsString;
      sIdPlanoOrigem  := CdsBenefBfciario.FieldbyName('IDPLANOORIGEM').AsString;
      sSeqProposta    := CdsBenefBfciario.FieldbyName('SEQPROPOSTA').AsString;

      { Conta beneficiários ativos e guardar seus identificadores numa lista }
      While Not CdsBenefBfciario.Eof Do Begin

        { Pular beneficios inativos }
        If Not (CdsBenefBfciario.FieldbyName('IDSITBENEFICIO').AsInteger In [1,2] ) Then Begin

          CdsBenefBfciario.Next;
          Continue;

        End; { If CdsBenefBfciario.FieldbyName('IDSITBENEFICIO').AsString }


        If Trim(sListaIdPessoa) = '' Then
          sListaIdPessoa := CdsBenefBfciario.FieldbyName('IDPESSOA').AsString
        Else
          sListaIdPessoa := sListaIdPessoa +','+ CdsBenefBfciario.FieldbyName('IDPESSOA').AsString;

        Inc( iNumBenefAtivos );

        CdsBenefBfciario.Next;

      End; { While Not CdsBenefBfciario.Eof }

      { Atualiza percentual dos beneficiários ativo restantes caso existam }
      If Trim( sListaIdPessoa ) <> '' Then Begin

        sSQL := 'UPDATE BFCIARIOTITPLAN SET '+
                '  PERCENTUAL = '+ OraNumero( FloatToStr( 100/iNumBenefAtivos ) ) +' '+
                'WHERE  '+
                '  IDPESSJUR     = '+ sIdPessjur                    +' AND '+
                '  IDTITULAR     = '+ sIdTitular                    +' AND '+
                '  IDPLANOORIGEM = '+ sIdPlanoOrigem                +' AND '+
                '  SEQPROPOSTA   = '+ sSeqProposta                  +' AND '+
                '  IDPLANOPREV   = '+ sIdPlanoPrev                  +' AND '+
                '  IDBENEFICIO   = '+ IntToStr( piIdBeneficio )     +' AND '+
                '  IDPESSOA IN   ( '+ sListaIdPessoa                +' )';

        If Not ExecSQL( sSQL ) Then Begin
          Exit;
        End;

      End; { If Trim( sListaIdPessoa ) = '' }

      { Zera percentual dos beneficiários Inativos restantes }
      sSQL := 'UPDATE BFCIARIOTITPLAN SET '+
              '  PERCENTUAL = 0 '+
              'WHERE  '+
              '  IDPESSJUR     = '+ sIdPessjur                    +' AND '+
              '  IDTITULAR     = '+ sIdTitular                    +' AND '+
              '  IDPLANOORIGEM = '+ sIdPlanoOrigem                +' AND '+
              '  SEQPROPOSTA   = '+ sSeqProposta                  +' AND '+
              '  IDPLANOPREV   = '+ sIdPlanoPrev                  +' AND '+
              '  IDBENEFICIO   = '+ IntToStr( piIdBeneficio );

      { Caso não existam ativos, não usa a lista e zera todos }
      If Trim( sListaIdPessoa ) <> '' Then
        sSQL := sSQL + ' AND IDPESSOA NOT IN ( '+ sListaIdPessoa +' )';

      If Not ExecSQL( sSQL ) Then Begin
        Exit;
      End;

    End; { If FazQuery( QryLocal, sSQL ) }

    Result := True;

  End; { End Else Begin }

End; { AtualizaNumeroBeneficiarios }

Function TCtrlBenefBfciario.ReatroageBeneficioINSS( piIdMoeda, piIdMotivo : Integer ): Boolean;
Var
  sSQL, sAnoMesAtual,
  sAnoMesDIP, sAnoMesDIB, sAnoMesHoje : String;
  iIdRegra, iIdMoeda, iMesesAbono : Integer;
  bExecutaRegra : Boolean;

  dValorAtual, dValorAnteriorAbono, dValorTotal, dValorIndice : Double;

Begin

  Try

    FCdsReajustes         := TCMClientDataSet.Create(Nil);

    FCtrlHstBenefBfciario := TCtrlHstBenefBfciario.Create;
    FCtrlHstBenefBfciario.InitializeAs( Self );

    FCtrlCotacaoMoeda     := TCtrlCotacaoMoeda.Create;
    FCtrlCotacaoMoeda.InitializeAs( Self );

    { Busca os dados do beneficio }
    FDbBenefBfciario.LoadFromDb;

    { Busca os reajustes do INSS }
    sSQL := 'SELECT RJI.MESREAJ, RJI.IDRGREAJ FROM REAJINSS RJI ORDER BY RJI.MESREAJ DESC';
    FCdsReajustes.Data := GetDataPacket( sSQL );

    sAnoMesDIP  := FormatDateTime( 'YYYY/MM', FDbBenefBfciario.DataInicio.AsDateTime );
    sAnoMesDIB  := FormatDateTime( 'YYYY/MM', FDbBenefBfciario.DataInicioFund.AsDateTime );
    sAnoMesHoje := FormatDateTime( 'YYYY/MM', Date );

    sAnoMesAtual  := sAnoMesHoje;

    DoProgresso(['',0]);

    dValorAtual := FDbBenefBfciario.ValorAtual.AsFloat;
    dValorTotal := FDbBenefBfciario.ValorTotal.AsFloat;

    While ( sAnoMesAtual >= sAnoMesDIB ) Do
    Begin

      bExecutaRegra := False;

      { Atualizar Dados do Beneficio  }
      FDbBenefBfciario.ValorAtual.AsFloat := dValorAtual;
      FDbBenefBfciario.ValorTotal.AsFloat := dValorTotal;

      { Atualizar valores }
      PreencheHistorico( piIdMotivo, sAnoMesAtual );

      If ( Copy( sAnoMesAtual, 1, 4 ) = Copy( sAnoMesDIP, 1, 4 ) ) And
         ( Pos( '12', sAnoMesAtual ) > 0 ) Then
      Begin

        dValorAtual := dValorAnteriorAbono;

      End;


      dValorIndice  := 1;

      If FCdsReajustes.Locate( 'MESREAJ', sAnoMesAtual, [] ) Then
      Begin

        iIdRegra      := FCdsReajustes.FieldByName('IDRGREAJ').AsInteger;
        bExecutaRegra := True;

        dValorIndice :=  RetornaCotacaoINSSAnterior( piIdMoeda, sAnoMesAtual );
        dValorIndice :=  1 + ( dValorIndice/100 );

        { Executar o calculo do Indice }
        dValorAtual := Trunca( ( dValorAtual / dValorIndice ), 2 );
        dValorTotal := Trunca( ( dValorTotal / dValorIndice ), 2 );

      End;

      { Calcular abono no ano da DIP }
      If ( Copy( sAnoMesAtual, 1, 4 ) = Copy( sAnoMesDIP, 1, 4 ) ) And
         ( Pos( '13', sAnoMesAtual ) > 0 ) Then
      Begin

        iMesesAbono := ( StrToInt( Copy( sAnoMesAtual, 6, 2 ) ) -1 ) -  StrToInt( Copy( sAnoMesDIP, 6, 2 ) );

        dValorAnteriorAbono := dValorAtual;

        If ( StrToInt( FormatDateTime( 'DD', FDbBenefBfciario.DataInicio.AsDateTime )  ) < 15 )
        Then iMesesAbono := ( iMesesAbono + 1 );

        dValorAtual := Trunca( ( ( dValorAtual / 12 ) * iMesesAbono ), 2 );

      End;

      sAnoMesAtual := RetornaAnoMesAnterior( sAnoMesAtual, True );

    End; { While ( sAnoMesFim >= sAnoMesAtual  ) Do }

    DoProgresso(['',2]);

  Finally

    If ( Not FCtrlHstBenefBfciario.CdsHstBenefBfciario.IsEmpty )
    //Henrique Massão
    //Then FCtrlHstBenefBfciario.CdsHstBenefBfciario.SaveToFile('C:\TEMP\RETROINSS.CDS');
    Then FCtrlHstBenefBfciario.CdsHstBenefBfciario.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\TEMP\RETROINSS.CDS');

    FCdsReajustes.Free;

    FCtrlHstBenefBfciario.Free;
    FCtrlCotacaoMoeda.Free;

  End;


End; { ReatroageBeneficioINSS }

Function TCtrlBenefBfciario.PreencheHistorico( piIdMotivo : Integer;
                                               psAnoMesReferencia : String ): Boolean;
Begin

  Result := False;

  Try


    { Limpar dados do DB }
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Clear;

    { Prencher informações do histórico }
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Idpessjur.AsInteger        := FDbBenefBfciario.Idpessjur.AsInteger;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Idplanoprev.AsInteger      := FDbBenefBfciario.Idplanoprev.AsInteger;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Idtitular.AsInteger        := FDbBenefBfciario.Idtitular.AsInteger;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Idpessoa.AsInteger         := FDbBenefBfciario.Idpessoa.AsInteger;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Numeroprocesso.AsInteger   := FDbBenefBfciario.Numeroprocesso.AsInteger;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Idbeneficio.AsInteger      := FDbBenefBfciario.Idbeneficio.AsInteger;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Seqproposta.AsInteger      := FDbBenefBfciario.Seqproposta.AsInteger;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Idplanoorigem.AsInteger    := FDbBenefBfciario.Idplanoorigem.AsInteger;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.IdtitBenef.AsFloat         := FDbBenefBfciario.Idtitbenef.AsInteger;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.Idmotivo.AsInteger         := piIdMotivo;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.Mes.AsString               := FormatDateTime( 'YYYY/MM', Date );
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Mesreferencia.AsString     := psAnoMesReferencia;


    { Verificar se já existe registro no histórico para esse mês }
    If ( FCtrlHstBenefBfciario.ExisteHistoricoNoMesReferencia ) Then
    Begin

      Result := True;
      Exit;

    End;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.Seqbeneficio.AsInteger     := FCtrlHstBenefBfciario.ProximoSequencial;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.Valorprev.AsFloat          := FDbBenefBfciario.Valoratual.AsFloat;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Valorsrb.AsFloat           := FDbBenefBfciario.Valorsrb.AsFloat;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Valorcalculado.AsFloat     := FDbBenefBfciario.Valoratual.AsFloat;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Valorintegral.AsFloat      := FDbBenefBfciario.Valoratual.AsFloat;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Valortotal.AsFloat         := FDbBenefBfciario.Valortotal.AsFloat;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.IdRegraCalculo.Clear;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Idlote.Clear;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.FlgEnviado.AsString        := '1';
    FCtrlHstBenefBfciario.DbHstBenefBfciario.FlgConcessao.AsString      := '1';
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Flgprovisorio.AsString     := FDbBenefBfciario.Flgprovisorio.AsString;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Flgdevolucao.AsString      := '0';

    FCtrlHstBenefBfciario.DbHstBenefBfciario.Codportforma.AsString      := FDbBenefBfciario.Codportforma.AsString;

    If ( FDbBenefBfciario.IdTitular.AsInteger = FDbBenefBfciario.IdPessoa.AsInteger ) Then
    Begin

      FDbBenefBfciario.ValorBase1.AsFloat := FDbBenefBfciario.DbBenefPlanoPart.ValorBase1.AsFloat;
      FDbBenefBfciario.ValorBase2.AsFloat := FDbBenefBfciario.DbBenefPlanoPart.ValorBase2.AsFloat;
      FDbBenefBfciario.ValorBase3.AsFloat := FDbBenefBfciario.DbBenefPlanoPart.ValorBase3.AsFloat;

    End;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.Valorop1.AsFloat           := FDbBenefBfciario.ValorBase1.AsFloat;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Valorop2.AsFloat           := FDbBenefBfciario.ValorBase2.AsFloat;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Valorop3.AsFloat           := FDbBenefBfciario.ValorBase3.AsFloat;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.Datapagamento.AsDateTime   := Date;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Dtefetpgto.AsDateTime      := Date;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.Vlbenefpgto.AsFloat        := FDbBenefBfciario.Valoratual.AsFloat;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.Valoracerto.AsFloat        := FDbBenefBfciario.Valoratual.AsFloat;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Percentual.AsFloat         := FDbBenefBfciario.Percentual.AsFloat;
    FCtrlHstBenefBfciario.DbHstBenefBfciario.Valorprevmin.AsFloat       := FDbBenefBfciario.Valoratual.AsFloat;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.Fontepagadora.AsInteger    := FDbBenefBfciario.Fontepagadora.AsInteger;

    FCtrlHstBenefBfciario.DbHstBenefBfciario.Flgtiporegistro.AsInteger  := FCtrlHstBenefBfciario.TipoRegistro( piIdMotivo,
                                                                                                               psAnoMesReferencia );

    FCtrlHstBenefBfciario.InsereHistoricoNoCache;

    Result := True;

  Except

    On E:Exception Do Begin

      Result := False;
      MessageInfo := E.Message;

    End;

  End;

End;


function TCtrlBenefBfciario.RetornaCotacaoINSSAnterior(piCodMoeda: Integer;
                                                       psAnoMesReferencia: String): Double;
Var
  sSQL, sAnoMesPesquisaIndice, sSinalPesquisa : String;

Begin

  { Busca os reajustes anterior do INSS }
  sSQL := 'SELECT RJI.MESREAJ, RJI.IDRGREAJ '+
          'FROM REAJINSS RJI '+
          'WHERE RJI.MESREAJ <'+ QuotedStr( psAnoMesReferencia ) +' '+
          'ORDER BY RJI.MESREAJ DESC';

  _Cds.Data := GetDataPacket( sSQL );

  If ( Not _Cds.IsEmpty ) Then
  Begin

    psAnoMesReferencia := StringReplace( _Cds.FieldByName('MESREAJ').AsString, '/', '', []);

    { Caso esteja processando o mês da DIB então buscar indice pela DIB para pegar indice pró-rateado}
    If ( FormatDateTime( 'YYYY', FDbBenefBfciario.DataInicio.AsDateTime ) = Copy( psAnoMesReferencia, 1, 4 ) )
    Then sAnoMesPesquisaIndice := FormatDateTime( 'YYYYMM', FDbBenefBfciario.DataInicioFund.AsDateTime )
    Else sAnoMesPesquisaIndice := psAnoMesReferencia;

  End
  Else
  Begin

    Result := 1;
    Exit;

  End;

  sSinalPesquisa := '<=';

  sSQL := 'SELECT  C.COTVALOR '+
          'FROM COTACAOMOEDA C ' +
          'WHERE C.MOECODIGO = ' + IntToStr( piCodMoeda );

  If ( psAnoMesReferencia <> '' ) Then
     sSql := sSql + ' AND ( SUBSTR( C.COTMESREF, 3, 4 ) || SUBSTR( C.COTMESREF, 1, 2 ) ) '+ sSinalPesquisa + QuotedStr( sAnoMesPesquisaIndice );

  sSql := sSql + ' ORDER BY ( SUBSTR( C.COTMESREF, 3, 4 ) || SUBSTR( C.COTMESREF, 1, 2 ) ) DESC ';

  _Cds.Data := GetDataPacket( sSql );

  If ( Not _Cds.IsEmpty )
  Then Result := _Cds.FieldByName('COTVALOR').AsFloat
  Else Result := 0;

End;



end.