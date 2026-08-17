// Alterações
{ --------------------------------------------------------------------------------------------------
Data      : 07.03.2018
Autor     : Everson Luiz Pereira da Cunha
Pendência : SIG TIBERO
Descrição : Melhoria TIBERO.
            Inserir Alias nas tabelas e campos.
            Retirar INDEX, +rule etc
----------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Dezembro/2002                          }
{                                                       }
{*******************************************************}


Unit
  uCtrlCadContasOrcPorGrupo;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider,
  uMidasUtil, uCMTypes, Classes, StdCtrls, uCmSqlParams, uDbDataView, uReccodigo,
  ComCtrls, Math, dialogs, Forms;

Type
  TCtrlCadContasOrcPorGrupo = class(TCmControlObject)

  Protected

    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private
    dbDataView : TdbDataView;
    AtualizarLog : Boolean;

    FCntStatus        : Integer;
    FIdEmpresa        : Double;
    FPlano            : Double;
    FCdsCentroDeCusto : TClientDataSet;
    FCdsAtivProj      : TClientDataSet;
    FCdsPatro         : TClientDataSet;
    FCdsPlanoPrev     : TClientDataSet;
    FCdsGrupoOrc      : TClientDataSet;
    FCdsBase          : TClientDataSet;
    FCdsConta         : TClientDataSet;
    FCdsOrigem        : TClientDataSet;
    FCdsDataView      : TClientDataSet;

    Procedure SetCdsGrupoOrc(const Value: TClientDataSet);
    Procedure SetCdsAtivProj(const Value: TClientDataSet);
    Procedure SetCdsCentroDeCusto(const Value: TClientDataSet);
    Procedure SetCdsPatro(const Value: TClientDataSet);
    Procedure SetCdsPlanoPrev(const Value: TClientDataSet);
    Procedure SetCdsBase(const Value: TClientDataSet);
    Procedure SetCdsConta(const Value: TClientDataSet);
    Procedure SetCdsOrigem(const Value: TClientDataSet);
    Procedure SetCdsDataView(const Value: TClientDataSet);
    Procedure PopulaOrigemContab( pContaOrigem: String );
    Procedure PopulaOrigemContaOrc( pContaOrigem: String );
    Procedure PopulaOrigemContaRea( pContaOrigem: String );
    Procedure PopulaOrigemFluxoCai(pContaOrigem: String);
    Procedure PopulaOrigemCondic(pContaOrigem: String);
    Procedure PopulaOrigemArqGenerico(pContaOrigem: String);
    Procedure GeraCodigo( pArrCodigo : Array Of TrecCodigo );
    function AtualizaTabela(pSql: String): Boolean;
  Public
    memStatus : TMemo;

    Constructor Create;  Override;
    Destructor  Destroy; Override;

    Function ListaGrupoOrc      : OleVariant;
    Function ListaCentroDeCusto : OleVariant;
    Function ListaAtivProj      : OleVariant;
    Function ListaPatro         : OleVariant;
    Function ListaPlanoPrev     : OleVariant;
    Function Exclusao           : Boolean;
    Function Alteracao( edtContaText,
                        cboCampoValue : String ) : Boolean;
    Function  AlteraCampo( pContaOrigem : String;
                           pCampos      : Array Of String;
                           pcboCampoValue : String  ) : Boolean;
    Function  AlteraContab(pContaOrigem: String): Boolean;
    Function  AlteraContaOrc(pContaOrigem: String): Boolean;
    Function  AlteraContaRea(pContaOrigem: String): Boolean;
    Function  AlteraFluxoCai(pContaOrigem: String): Boolean;
    Function  AlteraCondic(pContaOrigem: String): Boolean;
    Function  AlteraArqGenerico(pContaOrigem: String): Boolean;
    Function  TamanhoMinimo( pCdsLocal : TDataSet;
                             pLtvSelec : TListView;
                             pCampo    : String ) : Integer;

    Procedure BuscaContas( pLogar : Boolean );
    Procedure PopulaOrigem( pContaOrigem : String );
    Procedure GravaLog( pLog : String );
    Procedure Estimar( pInserir : Boolean );
    Function  Inclusao( pedtContaText : String;
                        pArrCodigo : Array Of TrecCodigo;
                        pLtvSelec  : TListView ) : Boolean;

    Property CntStatus        : Integer        Read FCntStatus        Write FCntStatus Default 0;
    Property pIdEmpresa       : Double         Read FIdEmpresa        Write FIdEmpresa;
    Property pPlano           : Double         Read FPlano            Write FPlano;
    Property CdsGrupoOrc      : TClientDataSet Read FCdsGrupoOrc      Write SetCdsGrupoOrc;
    Property CdsAtivProj      : TClientDataSet Read FCdsAtivProj      Write SetCdsAtivProj;
    Property CdsCentroDeCusto : TClientDataSet Read FCdsCentroDeCusto Write SetCdsCentroDeCusto;
    Property CdsPlanoPrev     : TClientDataSet Read FCdsPlanoPrev     Write SetCdsPlanoPrev;
    Property CdsPatro         : TClientDataSet Read FCdsPatro         Write SetCdsPatro;
    Property CdsBase          : TClientDataSet Read FCdsBase          Write SetCdsBase;
    Property CdsConta         : TClientDataSet Read FCdsConta         Write SetCdsConta;
    Property CdsOrigem        : TClientDataSet Read FCdsOrigem        Write SetCdsOrigem;
    Property CdsDataView      : TClientDataSet Read FCdsDataView      Write SetCdsDataView;
  End;

Implementation
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.OnCreateAppServer;
Begin
  Inherited;
  CdsCentroDeCusto := TClientDataSet.Create( Nil );
  CdsAtivProj      := TClientDataSet.Create( Nil );
  CdsPatro         := TClientDataSet.Create( Nil );
  CdsPlanoPrev     := TClientDataSet.Create( Nil );
  CdsGrupoOrc      := TClientDataSet.Create( Nil );
  CdsBase          := TClientDataSet.Create( Nil );
  CdsOrigem        := TClientDataSet.Create( Nil );
  memStatus        := TMemo.Create( Nil );
  AtualizarLog     := False;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.DoChangeDataBase;
Begin
  Inherited;
  dbDataView.DatabaseName := DataBaseName;
End;
//************************************************
Constructor TCtrlCadContasOrcPorGrupo.Create;
Begin
  Inherited;

  dbDataView   := TdbDataView.Create( Self );
  CdsConta     := TClientDataSet.Create( Nil );
  CdsDataView  := TClientDataSet.Create( Nil );
  AtualizarLog := True;
End;
//************************************************
Destructor TCtrlCadContasOrcPorGrupo.Destroy;
Begin
  Inherited;

  CdsConta.Free;
  CdsDataView.Free;

  If ( isAppServer ) Then Begin

    FreeCds( [ CdsCentroDeCusto, CdsAtivProj,  CdsPatro,
               CdsPlanoPrev,     CdsGrupoOrc,  CdsBase,
               CdsOrigem ]);
    memStatus.Free;
  End;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.ListaGrupoOrc : OleVariant;
Var
  SqlLocal : TStringList;
Begin
  SqlLocal := TStringList.Create;
  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  NOMEGRUPOORCAMEN AS NOME, IDGRUPOORCAMEN,' );
    SqlLocal.Add( '  FLGANALSINT,    CODGRUPOORC,' );
    SqlLocal.Add( '  FLGSINALGRUPO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  GRUPOORCAMEN' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  NOME' );
    Result := GetDataPacket( SqlLocal.Text );
  Except
    On E : Exception Do MessageInfo := E.Message;
  End;
  SqlLocal.Free;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.ListaCentroDeCusto : OleVariant;
Var
  SqlLocal : TStringList;
Begin
  SqlLocal := TStringList.Create;
  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '   NOME AS NOME, CODCENTROCUSTO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '   CENTCUST' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '   IDEMPRESA = ' + FloatToStr( pIdEmpresa ) + ' AND' );
    SqlLocal.Add( '   ATIVO = ''S''' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '   NOME' );

    Result := GetDataPacket( SqlLocal.Text );
  Except
    On E : Exception Do MessageInfo := E.Message;
  End;
  SqlLocal.Free;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.ListaAtivProj : OleVariant;
Var
  SqlLocal : TStringList;
Begin
  SqlLocal := TStringList.Create;
  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  NOME AS NOME, UNIDNEGOC, UNETIPO, UNECODIGO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '   UNIDNEGOCIO' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '   IDPESSOA = ' + FloatToStr( pIdEmpresa ) );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '   NOME' );
    Result := GetDataPacket( SqlLocal.Text );
  Except
    On E : Exception Do MessageInfo := E.Message;
  End;
  SqlLocal.Free;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.ListaPlanoPrev : OleVariant;
Var
  SqlLocal : TStringList;
Begin
  SqlLocal := TStringList.Create;
  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '   NOME AS NOME, IDPLANOPREV' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '   PLANPREVCONTABIL' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '   NOME' );
    Result := GetDataPacket( SqlLocal.Text );
  Except
    On E : Exception Do MessageInfo := E.Message;
  End;
  SqlLocal.Free;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.ListaPatro : OleVariant;
Var
  SqlLocal : TStringList;
Begin

  SqlLocal := TStringList.Create;
  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '   P.NOME AS NOME, PT.IDPESSOA' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '   PESSOA P,' );
    SqlLocal.Add( '   PATRO PT' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '   (P.IDPESSOA = PT.IDPESSOA)' );
    SqlLocal.Add( 'ORDER BY' );
//    SqlLocal.Add( '   NOME' ); //Everson TIBERO
    SqlLocal.Add( '   P.NOME' ); //Everson TIBERO
    Result := GetDataPacket( SqlLocal.Text );
  Except
    On E : Exception Do MessageInfo := E.Message;
  End;
  SqlLocal.Free;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.SetCdsAtivProj( Const Value: TClientDataSet);
Begin
  FCdsAtivProj := Value;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.SetCdsGrupoOrc( Const Value: TClientDataSet);
Begin
  FCdsGrupoOrc := Value;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.SetCdsCentroDeCusto( Const Value: TClientDataSet);
Begin
  FCdsCentroDeCusto := Value;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.SetCdsPatro( Const Value: TClientDataSet);
Begin
  FCdsPatro := Value;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.SetCdsConta( Const Value: TClientDataSet);
Begin
  FCdsConta := Value;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.SetCdsPlanoPrev( Const Value: TClientDataSet);
Begin
  FCdsPlanoPrev := Value;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.SetCdsBase( Const Value: TClientDataSet);
Begin
  FCdsBase := Value;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.SetCdsOrigem( Const Value: TClientDataSet);
Begin
  FCdsOrigem := Value;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.SetCdsDataView( Const Value: TClientDataSet);
Begin
  FCdsDataView := Value;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.BuscaContas( pLogar : Boolean );
Var
  sqlLocal : TStringList;
Begin
  sqlLocal := TStringList.Create;
  Try
    If ( pLogar ) Then GravaLog( ' Selecionando contas' );
    sqlLocal.Clear;
    sqlLocal.Add( 'SELECT' );
    sqlLocal.Add( '  IDCONTAORCAMEN, NOMECONTAORCAMEN, IDDATAVIEW' );
    sqlLocal.Add( 'FROM' );
    sqlLocal.Add( '  CONTASORCAMEN' );
    sqlLocal.Add( 'WHERE' );

    If ( CdsBase.FieldByName( 'BASGRUP' ).AsString <> '' ) Then Begin
      sqlLocal.Add( '  IDGRUPOORCAMEN = ' + Trim( CdsBase.FieldByName( 'BASGRUP' ).AsString ) + ' AND' )  ;
    End;

    If ( CdsBase.FieldByName( 'BASCENT' ).AsString <> '' ) Then Begin
      sqlLocal.Add( '  CODCENTROCUSTO = ' + QuotedStr( CdsBase.FieldByName( 'BASCENT' ).AsString ) + ' AND' )  ;
    End;

    If ( CdsBase.FieldByName( 'BASATIV' ).AsString <> '' ) Then Begin
      sqlLocal.Add( '  UNIDNEGOC      = ' + Trim( CdsBase.FieldByName( 'BASATIV' ).AsString ) + ' AND' )  ;
    End;

    If ( CdsBase.FieldByName( 'BASPLAN' ).AsString <> '' ) Then Begin
      sqlLocal.Add( '  IDPLANOPREV    = ' + Trim( CdsBase.FieldByName( 'BASPLAN' ).AsString ) + ' AND' )  ;
    End;

    If ( CdsBase.FieldByName( 'BASPATR' ).AsString <> '' ) Then Begin
      sqlLocal.Add( '  IDPATRO        = ' + Trim( CdsBase.FieldByName( 'BASPATR' ).AsString ) + ' AND' )  ;
    End;
    sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) );
    sqlLocal.Add( 'ORDER BY' );
    sqlLocal.Add( '  IDCONTAORCAMEN' );
    CdsConta.Close;
    CdsConta.Data := GetDataPacket( sqlLocal.Text );
  Finally
    sqlLocal.Free;
  End;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.Exclusao: Boolean;
Var
  sqlLocal    : TStringList;
  Atualizados : Integer;
Begin
  MessageInfo := '';
  Atualizados := 0;
  sqlLocal := TStringList.Create;
  Try
    GravaLog( '- Exclusão - iniciando' );
    StartTransaction;
    CdsBase.First;

    While ( Not CdsBase.Eof ) And
          ( memStatus.Tag = 0 ) Do Begin
      //-----------------------------
      BuscaContas( True );     // Busca os contas orçamentárias para o registro atual do cdsbase

      While ( Not CdsConta.EOF ) And
            ( memStatus.Tag = 0 ) Do Begin

        GravaLog( '  Conta - ' + CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString );
        //-----------------------------
        sqlLocal.Clear;
        sqlLocal.Add( 'DELETE FROM' );
        sqlLocal.Add( '  SALDOORCADO' );
        sqlLocal.Add( 'WHERE' );
        sqlLocal.Add( '  IDPESSOA       = ' + FloatToStr( pIdEmpresa ) + ' AND' );
        sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
        sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) );
        AtualizaTabela( sqlLocal.Text );
        //-----------------------------
        sqlLocal.Clear;
        sqlLocal.Add( 'DELETE FROM' );
        sqlLocal.Add( '  COMPCONTASORCAMEN' );
        sqlLocal.Add( 'WHERE' );
        sqlLocal.Add( '  IDPESSOA       = ' + FloatToStr( pIdEmpresa ) + ' AND' );
        sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
        sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) );
        AtualizaTabela( sqlLocal.Text );
        //-----------------------------
        sqlLocal.Clear;
        sqlLocal.Add( 'DELETE FROM' );
        sqlLocal.Add( '  CONTASORCAMEN' );
        sqlLocal.Add( 'WHERE' );
        sqlLocal.Add( '  IDPESSOA       = ' + FloatToStr( pIdEmpresa ) + ' AND' );
        sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
        sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) );
        AtualizaTabela( sqlLocal.Text );
        //-----------------------------
        Inc ( Atualizados );
        CdsConta.Next;
      End;
      CdsBase.Next;
    End;
    MessageInfo := MessageInfo + 'Foram excluídas ' + IntToStr( Atualizados ) + ' contas orçamentárias' + #13 + #10 +
                   ' Exclusão concluída';
    GravaLog( ' ' + MessageInfo );
    Result := True;
  Except
    On E:Exception Do Begin
      Result := False;
      Rollback;
      MessageInfo := MessageInfo + E.Message;
      GravaLog( ' ' + MessageInfo );
    End;
  End;
  sqllocal.Free;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.Alteracao( edtContaText,
                                              cboCampoValue : String ) : Boolean;
Begin
  If      ( cboCampoValue = 'TRS' ) Then Result := AlteraCampo( edtContaText, [ 'TIPOCALCREALIZADO' ], cboCampoValue )
  Else If ( cboCampoValue = 'TOS' ) Then Result := AlteraCampo( edtContaText, [ 'TIPOCALCORCADO' ], cboCampoValue )
  Else If ( cboCampoValue = 'SCS' ) Then Result := AlteraCampo( edtContaText, [ 'FLGSINALCONTA' ], cboCampoValue )
  Else If ( cboCampoValue = 'VAS' ) Then Result := AlteraCampo( edtContaText, [ 'FLGACUMULADO' ], cboCampoValue )
  Else If ( cboCampoValue = 'DID' ) Then Result := AlteraCampo( edtContaText, [ 'DATAINATIVA' ], cboCampoValue )
  Else If ( cboCampoValue = 'DRD' ) Then Result := AlteraCampo( edtContaText, [ 'DATAATIVA' ], cboCampoValue )
  Else If ( cboCampoValue = 'CIS' ) Then Result := AlteraCampo( edtContaText, [ 'FLGATIVA' ], cboCampoValue )
  Else If ( cboCampoValue = 'OMS' ) Then Result := AlteraCampo( edtContaText, [ 'FLGCONTAMONETARIA' ], cboCampoValue )
  Else If ( cboCampoValue = 'EES' ) Then Result := AlteraCampo( edtContaText, [ 'FLGTRANSFSALDO' ], cboCampoValue )
  Else If ( cboCampoValue = 'FAS' ) Then Result := AlteraCampo( edtContaText, [ 'FORMULAORCADO', 'FORMULAREALIZADO' ], cboCampoValue )
  Else If ( cboCampoValue = 'FIF' ) Then Result := AlteraCampo( edtContaText, [ 'VLRINFORMADOORC', 'VLRINFORMADOREAL' ], cboCampoValue )
  Else If ( cboCampoValue = 'OBS' ) Then Result := AlteraCampo( edtContaText, [ 'OBSERVACAO' ], cboCampoValue )
  Else If ( cboCampoValue = 'CRS' ) Then Result := AlteraCampo( edtContaText, [ 'CODCENTRORESPON' ], cboCampoValue )
  Else If ( cboCampoValue = 'CTL' ) Then Result := AlteraContab( edtContaText )
  Else If ( cboCampoValue = 'COL' ) Then Result := AlteraContaOrc( edtContaText )
  Else If ( cboCampoValue = 'CRL' ) Then Result := AlteraContaRea( edtContaText )
  Else If ( cboCampoValue = 'FCL' ) Then Result := AlteraFluxoCai( edtContaText )
  Else If ( cboCampoValue = 'CDL' ) Then Result := AlteraCondic( edtContaText )
  Else If ( cboCampoValue = 'AGL' ) Then Result := AlteraArqGenerico( edtContaText )
  Else Begin
    Result      := False;
    MessageInfo := 'Campo desconhecido - ' + cboCampoValue;
    GravaLog( ' ' + MessageInfo );
  End;
End;
//************************************************
Function  TCtrlCadContasOrcPorGrupo.AlteraCampo( pContaOrigem   : String;
                                                 pCampos        : Array Of String;
                                                 pcboCampoValue : String ) : Boolean;
Var
  sqlLocal    : TStringList;
  Posicao,
  Atualizados : Integer;
  Mascara,
  Conteudo    : String;
Begin
  MessageInfo := '';
  sqlLocal := TStringList.Create;
  Try
    StartTransaction;
    PopulaOrigem( pContaOrigem );
    GravaLog( '- Alteração - ' + pcboCampoValue );
    //-------------------------------
    Atualizados := 0;
    CdsBase.First;
    While ( Not CdsBase.Eof ) And
          ( memStatus.Tag = 0 ) Do Begin

      BuscaContas( True );     // Busca os contas orçamentárias para o registro atual do cdsbase
      //-----------------------------
      While ( Not CdsConta.EOF ) And
            ( memStatus.Tag = 0 ) Do Begin

        sqlLocal.Clear;
        sqlLocal.Add( 'UPDATE' );
        sqlLocal.Add( '  CONTASORCAMEN' );
        sqlLocal.Add( 'SET' );

        For Posicao := 0 To Length( pCampos ) - 1 Do Begin

          If ( pcboCampoValue[3] = 'D' ) Then Begin       // Data

            Conteudo := CdsOrigem.FieldByName( pCampos[ Posicao ] ).AsString;

            If      ( Length( Conteudo ) <= 10 ) Then Mascara := 'dd/mm/yyyy'
            Else If ( Length( Conteudo ) <= 16 ) Then Mascara := 'dd/mm/yyyy hh24:mi'
            Else                                      Mascara := 'dd/mm/yyyy hh24:mi:ss';

            Conteudo := 'TO_DATE( ' + QuotedStr( Conteudo ) + ', ' + QuotedStr( Mascara ) + ' )';
          End Else Begin                                  // String / Float

            Conteudo := QuotedStr( CdsOrigem.FieldByName( pCampos[ Posicao ] ).AsString );
            Mascara  := '';
          End;

          If ( Posicao = ( Length( pCampos ) - 1 ) ) Then Begin

            sqlLocal.Add( '  ' + pCampos[ Posicao ] + ' = ' + Conteudo );
          End Else Begin

            sqlLocal.Add( '  ' + pCampos[ Posicao ] + ' = ' + Conteudo + ',' );
          End;
        End;

        sqlLocal.Add( 'WHERE' );
        sqlLocal.Add( '  IDPESSOA       = ' + FloatToStr( pIdEmpresa ) + ' AND' );
        sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
        sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) );
        AtualizaTabela( sqlLocal.Text );
        Inc( Atualizados );
        //-----------------------------
        CdsConta.Next;
      End;
      CdsBase.Next;
    End;
    Commit;
    MessageInfo := 'Foram atualizadas ' + IntToStr( Atualizados ) + ' contas orçamentárias' + #13 + #10 +
                   ' Alteração concluída';
    GravaLog( ' ' + MessageInfo );
    Result := True;
  Except
    On E:Exception Do Begin
      Result := False;
      Rollback;
      MessageInfo := MessageInfo + #13 + #10 +
                     E.Message;
      GravaLog( ' ' + MessageInfo );
    End;
  End;
  sqllocal.Free;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.AlteraContab( pContaOrigem : String ): Boolean;
Var
  sqlLocal    : TStringList;
  Atualizados : Integer;
Begin
  MessageInfo := '';
  sqlLocal := TStringList.Create;
  Try
    GravaLog( '- Alteração - CTL' );
    StartTransaction;
    //----------------------------- Busca as contas contábeis da conta origem
    GravaLog( '  Lendo dados de origem' );
    PopulaOrigemContab( pContaOrigem );
    Atualizados := 0;
    CdsBase.First;
    While ( Not CdsBase.Eof ) And
          ( memStatus.Tag = 0 ) Do Begin

      BuscaContas( True );     // Busca os contas orçamentárias para o registro atual do cdsbase
      //-----------------------------
      While ( Not CdsConta.EOF ) And
            ( memStatus.Tag = 0 ) Do Begin

        sqlLocal.Clear;
        sqlLocal.Add( 'DELETE FROM' );
        sqlLocal.Add( '  COMPCONTASORCAMEN' );
        sqlLocal.Add( 'WHERE' );
        sqlLocal.Add( '  IDPESSOA       = ' + FloatToStr( pIdEmpresa ) + ' AND' );
        sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
        sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) + ' AND' );
        sqlLocal.Add( '  PLACONTA IS NOT NULL' );
        AtualizaTabela( sqlLocal.Text );

        CdsOrigem.First;
        While ( Not CdsOrigem.EOF ) Do Begin

          sqlLocal.Clear;
          sqlLocal.Add( 'INSERT INTO' );
          sqlLocal.Add( '  COMPCONTASORCAMEN' );
          sqlLocal.Add( '  ( IDCOMPCONTASORC, IDPLANOORCAMEN, IDCONTAORCAMEN,' );
          sqlLocal.Add( '    IDPESSOA,        IDEMPRESA,' );
          sqlLocal.Add( '    PLANO,           PLACONTA,       CODCENTROCUSTO,' );
          sqlLocal.Add( '    UNIDNEGOC,       IDPLANOPREV,    IDPATRO )' );
          sqlLocal.Add( '  VALUES (' );
          sqlLocal.Add( '  ' + FloatToStr( GetSequence('COMPCONTASORCAMEN') ) + ',' );
          sqlLocal.Add( '  ' + FloatToStr( pPlano ) + ',' );
          sqlLocal.Add( '  ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) + ',' );
          sqlLocal.Add( '  ' + FloatToStr( pIdEmpresa ) + ',' );
          sqlLocal.Add( '  ' + FloatToStr( pIdEmpresa ) + ',' );
          sqlLocal.Add( '  ' + FloatToStr( CdsOrigem.FieldByName( 'PLANO' ).AsFloat ) + ',' );
          sqlLocal.Add( '  ' + QuotedStr( CdsOrigem.FieldByName( 'PLACONTA' ).AsString ) + ',' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'CODCENTROCUSTO' ).AsString ) + ', 0, NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'CODCENTROCUSTO' ).AsString )+ ' ),' );
          sqlLocal.Add( '  DECODE( ' + FloatToStr( CdsOrigem.FieldByName( 'UNIDNEGOC' ).AsFloat ) + ', 0, NULL, ' +
                                       FloatToStr( CdsOrigem.FieldByName( 'UNIDNEGOC' ).AsFloat )+ ' ),' );
          sqlLocal.Add( '  DECODE( ' + FloatToStr( CdsOrigem.FieldByName( 'IDPLANOPREV' ).AsFloat ) + ', 0, NULL, ' +
                                       FloatToStr( CdsOrigem.FieldByName( 'IDPLANOPREV' ).AsFloat )+ ' ),' );
          sqlLocal.Add( '  DECODE( ' + FloatToStr( CdsOrigem.FieldByName( 'IDPATRO' ).AsFloat ) + ', 0, NULL, ' +
                                       FloatToStr( CdsOrigem.FieldByName( 'IDPATRO' ).AsFloat )+ ' ) )' );
          AtualizaTabela( sqlLocal.Text );
          //-----------------------------
          CdsOrigem.Next;
        End;
        Inc( Atualizados );
        CdsConta.Next;
      End;
      CdsBase.Next;
    End;
    Commit;
    MessageInfo := 'Foram atualizadas ' + IntToStr( Atualizados ) + ' contas orçamentárias' + #13 + #10 +
                   ' Alteração concluída';
    Result := True;
    GravaLog( ' ' + MessageInfo );
  Except
    On E:Exception Do Begin
      Result := False;
      Rollback;
      MessageInfo := MessageInfo + #13 + #10 +
                     E.Message;
    GravaLog( ' ' + MessageInfo );
    End;
  End;
  sqllocal.Free;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.AlteraContaOrc( pContaOrigem : String ): Boolean;
Var
  sqlLocal    : TStringList;
  Atualizados : Integer;
Begin
  MessageInfo := '';
  sqlLocal := TStringList.Create;
  Try
    GravaLog( '- Alteração - COL' );
    StartTransaction;
    //----------------------------- Busca as contas de orçado da conta origem
    GravaLog( ' Lendo dados de origem' );
    PopulaOrigemContaOrc( pContaOrigem );
    Atualizados := 0;
    CdsBase.First;
    While ( Not CdsBase.Eof ) And
          ( memStatus.Tag = 0 ) Do Begin

      BuscaContas( True );     // Busca os contas orçamentárias para o registro atual do cdsbase
      //-----------------------------
      While ( Not CdsConta.EOF ) And
            ( memStatus.Tag = 0 ) Do Begin

        sqlLocal.Clear;
        sqlLocal.Add( 'DELETE FROM' );
        sqlLocal.Add( '  COMPCONTASORCAMEN' );
        sqlLocal.Add( 'WHERE' );
        sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
        sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) + ' AND' );
        sqlLocal.Add( '  IDCONTAREFORCADO IS NOT NULL' );
        AtualizaTabela( sqlLocal.Text );

        CdsOrigem.First;
        While ( Not CdsOrigem.EOF ) Do Begin

          sqlLocal.Clear;
          sqlLocal.Add( 'INSERT INTO' );
          sqlLocal.Add( '  COMPCONTASORCAMEN' );
          sqlLocal.Add( '  ( IDCOMPCONTASORC,  IDPLANOORCAMEN, IDCONTAORCAMEN,' );
          sqlLocal.Add( '    IDCONTAREFORCADO, PERCCONTAREFORC )' );
          sqlLocal.Add( '  VALUES (' );
          sqlLocal.Add( '  ' + FloatToStr( GetSequence('COMPCONTASORCAMEN') ) + ',' );
          sqlLocal.Add( '  ' + FloatToStr( pPlano ) + ',' );
          sqlLocal.Add( '  ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) + ',' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'IDCONTAREFORCADO' ).AsString ) + ', 0, NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'IDCONTAREFORCADO' ).AsString )+ ' ),' );
          sqlLocal.Add( '  ' + FloatToStr( CdsOrigem.FieldByName( 'PERCCONTAREFORC' ).AsFloat ) + ' )' );
          AtualizaTabela( sqlLocal.Text );
          //-----------------------------
          CdsOrigem.Next;
        End;
        Inc( Atualizados );
        CdsConta.Next;
      End;
      CdsBase.Next;
    End;
    Commit;
    MessageInfo := 'Foram atualizadas ' + IntToStr( Atualizados ) + ' contas orçamentárias' + #13 + #10 +
                   ' Alteração concluída';
    Result := True;
    GravaLog( ' ' + MessageInfo );
  Except
    On E:Exception Do Begin
      Result := False;
      Rollback;
      MessageInfo := MessageInfo + #13 + #10 +
                     E.Message;
      GravaLog( ' ' + MessageInfo );
    End;
  End;
  sqllocal.Free;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.AlteraContaRea( pContaOrigem : String ): Boolean;
Var
  sqlLocal    : TStringList;
  Atualizados : Integer;
Begin
  MessageInfo := '';
  sqlLocal := TStringList.Create;
  Try
    GravaLog( '- Alteração - CRL' );
    StartTransaction;
    //----------------------------- Busca as contas de realizado da conta origem
    GravaLog( '  Lendo dados de origem' );
    PopulaOrigemContaRea( pContaOrigem );
    Atualizados := 0;
    CdsBase.First;
    While ( Not CdsBase.Eof ) And
          ( memStatus.Tag = 0 ) Do Begin

      BuscaContas( True );     // Busca os contas orçamentárias para o registro atual do cdsbase
      //-----------------------------
      While ( Not CdsConta.EOF ) And
            ( memStatus.Tag = 0 ) Do Begin

        sqlLocal.Clear;
        sqlLocal.Add( 'DELETE FROM' );
        sqlLocal.Add( '  COMPCONTASORCAMEN' );
        sqlLocal.Add( 'WHERE' );
        sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
        sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) + ' AND' );
        sqlLocal.Add( '  IDCONTAREFREAL IS NOT NULL' );
        AtualizaTabela( sqlLocal.Text );

        CdsOrigem.First;
        While ( Not CdsOrigem.EOF ) Do Begin

          sqlLocal.Clear;
          sqlLocal.Add( 'INSERT INTO' );
          sqlLocal.Add( '  COMPCONTASORCAMEN' );
          sqlLocal.Add( '  ( IDCOMPCONTASORC,  IDPLANOORCAMEN, IDCONTAORCAMEN,' );
          sqlLocal.Add( '    IDCONTAREFREAL, PERCCONTAREFREA )' );
          sqlLocal.Add( '  VALUES (' );
          sqlLocal.Add( '  ' + FloatToStr( GetSequence('COMPCONTASORCAMEN') ) + ',' );
          sqlLocal.Add( '  ' + FloatToStr( pPlano ) + ',' );
          sqlLocal.Add( '  ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) + ',' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'IDCONTAREFREAL' ).AsString ) + ', 0, NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'IDCONTAREFREAL' ).AsString )+ ' ),' );
          sqlLocal.Add( '  ' + FloatToStr( CdsOrigem.FieldByName( 'PERCCONTAREFREA' ).AsFloat ) + ' )' );
          AtualizaTabela( sqlLocal.Text );
          //-----------------------------
          CdsOrigem.Next;
        End;
        Inc( Atualizados );
        CdsConta.Next;
      End;
      CdsBase.Next;
    End;
    Commit;
    MessageInfo := 'Foram atualizadas ' + IntToStr( Atualizados ) + ' contas orçamentárias' + #13 + #10 +
                   ' Alteração concluída';
    Result := True;
    GravaLog( ' ' + MessageInfo );
  Except
    On E:Exception Do Begin
      Result := False;
      Rollback;
      MessageInfo := MessageInfo + #13 + #10 +
                     E.Message;
      GravaLog( ' ' + MessageInfo );
    End;
  End;
  sqllocal.Free;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.AlteraFluxoCai( pContaOrigem : String ): Boolean;
Var
  sqlLocal    : TStringList;
  Atualizados : Integer;
Begin
  MessageInfo := '';
  sqlLocal := TStringList.Create;
  Try
    GravaLog( '- Alteração - FCL' );
    StartTransaction;
    //----------------------------- Busca as contas de fluxo de caixa da conta origem
    GravaLog( '  Lendo dados de origem' );
    PopulaOrigemFluxoCai( pContaOrigem );
    Atualizados := 0;
    CdsBase.First;
    While ( Not CdsBase.Eof ) And
          ( memStatus.Tag = 0 ) Do Begin

      BuscaContas( True );     // Busca os contas orçamentárias para o registro atual do cdsbase
      //-----------------------------
      While ( Not CdsConta.EOF ) And
            ( memStatus.Tag = 0 ) Do Begin

        sqlLocal.Clear;
        sqlLocal.Add( 'DELETE FROM' );
        sqlLocal.Add( '  COMPCONTASORCAMEN' );
        sqlLocal.Add( 'WHERE' );
        sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
        sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) + ' AND' );
        sqlLocal.Add( '  CODTIPRECDES IS NOT NULL' );
        AtualizaTabela( sqlLocal.Text );

        CdsOrigem.First;
        While ( Not CdsOrigem.EOF ) Do Begin

          sqlLocal.Clear;
          sqlLocal.Add( 'INSERT INTO' );
          sqlLocal.Add( '  COMPCONTASORCAMEN' );
          sqlLocal.Add( '  ( IDCOMPCONTASORC, IDPLANOORCAMEN, IDCONTAORCAMEN,' );
          sqlLocal.Add( '    CODTIPRECDES,    RECPAG,         CODCENTRORESPON,' );
          sqlLocal.Add( '    IDPLANOPREV,     IDPATRO,        UNIDNEGOC,' );
          sqlLocal.Add( '    CODCENTROCUSTO,  IDPESSOA,        IDEMPRESA )' );
          sqlLocal.Add( '  VALUES (' );
          sqlLocal.Add( '  ' + FloatToStr( GetSequence('COMPCONTASORCAMEN') ) + ',' );
          sqlLocal.Add( '  ' + FloatToStr( pPlano ) + ',' );
          sqlLocal.Add( '  ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) + ',' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'CODTIPRECDES' ).AsString ) + ', '''', NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'CODTIPRECDES' ).AsString )+ ' ),' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'RECPAG' ).AsString ) + ', '''', NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'RECPAG' ).AsString )+ ' ),' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'CODCENTRORESPON' ).AsString ) + ', '''', NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'CODCENTRORESPON' ).AsString )+ ' ),' );
          sqlLocal.Add( '  DECODE( ' + FloatToStr( CdsOrigem.FieldByName( 'IDPLANOPREV' ).AsFloat ) + ', 0, NULL, ' +
                                       FloatToStr( CdsOrigem.FieldByName( 'IDPLANOPREV' ).AsFloat )+ ' ),' );
          sqlLocal.Add( '  DECODE( ' + FloatToStr( CdsOrigem.FieldByName( 'IDPATRO' ).AsFloat ) + ', 0, NULL, ' +
                                       FloatToStr( CdsOrigem.FieldByName( 'IDPATRO' ).AsFloat )+ ' ),' );
          sqlLocal.Add( '  DECODE( ' + FloatToStr( CdsOrigem.FieldByName( 'UNIDNEGOC' ).AsFloat ) + ', 0, NULL, ' +
                                       FloatToStr( CdsOrigem.FieldByName( 'UNIDNEGOC' ).AsFloat )+ ' ),' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'CODCENTROCUSTO' ).AsString ) + ', 0, NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'CODCENTROCUSTO' ).AsString )+ ' ),' );
          sqlLocal.Add( '  DECODE( ' + FloatToStr( pIdEmpresa  ) + ', 0, NULL, ' +
                                       FloatToStr( pIdEmpresa )+ ' ),' );
          sqlLocal.Add( '  DECODE( ' + FloatToStr( pIdEmpresa ) + ', 0, NULL, ' +
                                       FloatToStr( pIdEmpresa )+ ' ) )' );
          AtualizaTabela( sqlLocal.Text );
          //-----------------------------
          CdsOrigem.Next;
        End;
        Inc( Atualizados );
        CdsConta.Next;
      End;
      CdsBase.Next;
    End;
    Commit;
    MessageInfo := 'Foram atualizadas ' + IntToStr( Atualizados ) + ' contas orçamentárias' + #13 + #10 +
                   ' Alteração concluída';
    Result := True;
    GravaLog( ' ' + MessageInfo );
  Except
    On E:Exception Do Begin
      Result := False;
      Rollback;
      MessageInfo := MessageInfo + #13 + #10 +
                     E.Message;
      GravaLog( ' ' + MessageInfo );
    End;
  End;
  sqllocal.Free;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.AlteraCondic( pContaOrigem: String): Boolean;
Var
  sqlLocal    : TStringList;
  Atualizados : Integer;
Begin
  MessageInfo := '';
  sqlLocal := TStringList.Create;
  Try
    GravaLog( '- Alteração - CDL' );
    StartTransaction;
    //----------------------------- Busca as condições da conta origem
    GravaLog( '  Lendo dados de origem' );
    PopulaOrigemCondic( pContaOrigem );
    Atualizados := 0;
    CdsBase.First;
    While ( Not CdsBase.Eof ) And
          ( memStatus.Tag = 0 ) Do Begin

      BuscaContas( True );     // Busca os contas orçamentárias para o registro atual do cdsbase
      //-----------------------------
      While ( Not CdsConta.EOF ) And
            ( memStatus.Tag = 0 ) Do Begin

        sqlLocal.Clear;
        sqlLocal.Add( 'DELETE FROM' );
        sqlLocal.Add( '  COMPCONTASORCAMEN' );
        sqlLocal.Add( 'WHERE' );
        sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
        sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) + ' AND' );
        sqlLocal.Add( '  IDCONTACONDINI IS NOT NULL' );
        AtualizaTabela( sqlLocal.Text );

        CdsOrigem.First;
        While ( Not CdsOrigem.EOF ) And
              ( memStatus.Tag = 0 ) Do Begin

          sqlLocal.Clear;
          sqlLocal.Add( 'INSERT INTO' );
          sqlLocal.Add( '  COMPCONTASORCAMEN' );
          sqlLocal.Add( '  ( IDCOMPCONTASORC, IDPLANOORCAMEN, IDCONTAORCAMEN,' );
          sqlLocal.Add( '    IDCONTACONDINI,  IDCONTACONDFIM, IDCONTACONDRES,' );
          sqlLocal.Add( '    TIPOCONDINI,     TIPOCONDRES,    CONDICAO,' );
          sqlLocal.Add( '    VLRCONDINI,      VLRCONDRES )' );
          sqlLocal.Add( '  VALUES (' );
          sqlLocal.Add( '  ' + FloatToStr( GetSequence('COMPCONTASORCAMEN') ) + ',' );
          sqlLocal.Add( '  ' + FloatToStr( pPlano ) + ',' );
          sqlLocal.Add( '  ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) + ',' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'IDCONTACONDINI' ).AsString ) + ', '''', NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'IDCONTACONDINI' ).AsString ) + ' ),' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'IDCONTACONDFIM' ).AsString ) + ', '''', NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'IDCONTACONDFIM' ).AsString ) + ' ),' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'IDCONTACONDRES' ).AsString ) + ', '''', NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'IDCONTACONDRES' ).AsString ) + ' ),' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'TIPOCONDINI' ).AsString ) + ', '''', NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'TIPOCONDINI' ).AsString ) + ' ),' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'TIPOCONDRES' ).AsString ) + ', '''', NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'TIPOCONDRES' ).AsString ) + ' ),' );
          sqlLocal.Add( '  DECODE( ' + QuotedStr( CdsOrigem.FieldByName( 'CONDICAO' ).AsString ) + ', '''', NULL, ' +
                                       QuotedStr( CdsOrigem.FieldByName( 'CONDICAO' ).AsString ) + ' ),' );
          sqlLocal.Add( '  ' + FloatToStr( CdsOrigem.FieldByName( 'VLRCONDINI' ).AsFloat ) + ',' );
          sqlLocal.Add( '  ' + FloatToStr( CdsOrigem.FieldByName( 'VLRCONDRES' ).AsFloat ) + ' )' );
          AtualizaTabela( sqlLocal.Text );
          //-----------------------------
          CdsOrigem.Next;
        End;
        Inc( Atualizados );
        CdsConta.Next;
      End;
      CdsBase.Next;
    End;
    Commit;
    MessageInfo := 'Foram atualizadas ' + IntToStr( Atualizados ) + ' contas orçamentárias' + #13 + #10 +
                   ' Alteração concluída';
    Result := True;
    GravaLog( ' ' + MessageInfo );
  Except
    On E:Exception Do Begin
      Result := False;
      Rollback;
      MessageInfo := MessageInfo + #13 + #10 +
                     E.Message;
      GravaLog( ' ' + MessageInfo );
    End;
  End;
  sqllocal.Free;
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.AlteraArqGenerico( pContaOrigem: String): Boolean;
Var
  sqlLocal    : TCMSqlParams;
  Atualizados : Integer;
  IdDataView  : Double;
Begin
  MessageInfo := '';
  sqlLocal    := TCMSqlParams.Create( Nil );
  Try
    GravaLog( '- Alteração - AGL' );
    StartTransaction;
    //----------------------------- Busca o texto de busca da conta origem
    GravaLog( '  Lendo dados de origem' );
    PopulaOrigemArqGenerico( pContaOrigem );
    Atualizados := 0;
    CdsBase.First;
    While ( Not CdsBase.Eof ) And
          ( memStatus.Tag = 0 ) Do Begin

      BuscaContas( True );     // Busca os contas orçamentárias para o registro atual do cdsbase
      //-----------------------------
      While ( Not CdsConta.EOF ) And
            ( memStatus.Tag = 0 ) Do Begin

        If ( CdsOrigem.IsEmpty ) Then Begin

          IdDataView := 0;
        End Else Begin

          IdDataView := GetSequence( 'DATAVIEW' );

          With CdsDataView Do Begin
            EmptyDataSet;
            Append;
            FieldByName( 'IDDATAVIEW' ).AsFloat        := IdDataView;
            FieldByName( 'CLASSNAME' ).AsString        := CdsOrigem.FieldByName( 'CLASSNAME' ).AsString;
            FieldByName( 'TEMPLATE' ).AsString         := CdsOrigem.FieldByName( 'TEMPLATE' ).AsString;
            FieldByName( 'NAME' ).AsString             := CdsOrigem.FieldByName( 'NAME' ).AsString;
            FieldByName( 'CLASSDESCRIPTION' ).AsString := CdsOrigem.FieldByName( 'CLASSDESCRIPTION' ).AsString;
            FieldByName( 'DESCRIPTION' ).AsString      := CdsOrigem.FieldByName( 'DESCRIPTION' ).AsString;
            Post;
          End;
          // Transformar este applycds em sql local
          ApplyCds( CdsDataView, dbDataView, [], [] )
        End;

        sqlLocal.SQL.Clear;
        sqlLocal.SQL.Add( 'UPDATE' );
        sqlLocal.SQL.Add( '  CONTASORCAMEN' );
        sqlLocal.SQL.Add( 'SET' );
        sqlLocal.SQL.Add( '  IDDATAVIEW = DECODE( ' + FloatToStr( IdDataView ) + ', 0, NULL, ' +
                                                      FloatToStr( IdDataView ) + ' ),' );
        sqlLocal.SQL.Add( '  ORIGEMCMDV = ''0''' );
        sqlLocal.SQL.Add( 'WHERE' );
        sqlLocal.SQL.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
        sqlLocal.SQL.Add( '  IDCONTAORCAMEN = ' + QuotedStr( CdsConta.FieldByName( 'IDCONTAORCAMEN' ).AsString ) );
        AtualizaTabela( sqlLocal.SQL.Text );

        If ( Not CdsConta.FieldByName( 'IDDATAVIEW' ).IsNull ) Then Begin
          sqlLocal.SQL.Clear;
          sqlLocal.SQL.Add( 'DELETE FROM' );
          sqlLocal.SQL.Add( '  DATAVIEW' );
          sqlLocal.SQL.Add( 'WHERE' );
          sqlLocal.SQL.Add( '  IDDATAVIEW = ' + FloatToStr( CdsConta.FieldByName( 'IDDATAVIEW' ).AsFloat ) + ' AND' );
          sqlLocal.SQL.Add( '  ORIGEMCMDV = ''0''' );
          AtualizaTabela( sqlLocal.SQL.Text );
        End;
        Inc( Atualizados );
        CdsConta.Next;
      End;
      CdsBase.Next;
    End;
    Commit;
    MessageInfo := 'Foram atualizadas ' + IntToStr( Atualizados ) + ' contas orçamentárias' + #13 + #10 +
                   ' Alteração concluída';
    Result := True;
    GravaLog( ' ' + MessageInfo );
  Except
    On E:Exception Do Begin
      Result := False;
      Rollback;
      MessageInfo := MessageInfo + #13 + #10 +
                     E.Message;
      GravaLog( ' ' + MessageInfo );
    End;
  End;
  sqllocal.Free;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.PopulaOrigem( pContaOrigem : String );
Var
  sqlLocal  : TStringList;
Begin
  sqlLocal    := TStringList.Create;
  Try
    sqlLocal.Add( 'SELECT' );
    sqlLocal.Add( '  NVL( IDGRUPOORCAMEN   , '''' ) AS IDGRUPOORCAMEN   ,' );
    sqlLocal.Add( '  NVL( NOMECONTAORCAMEN , '''' ) AS NOMECONTAORCAMEN ,' );
    sqlLocal.Add( '  NVL( TIPOCALCREALIZADO, '''' ) AS TIPOCALCREALIZADO,' );
    sqlLocal.Add( '  NVL( TIPOCALCORCADO   , '''' ) AS TIPOCALCORCADO   ,' );
    sqlLocal.Add( '  NVL( FLGSINALCONTA    , '''' ) AS FLGSINALCONTA    ,' );
    sqlLocal.Add( '  NVL( FLGACUMULADO     , '''' ) AS FLGACUMULADO     ,' );
    sqlLocal.Add( '  NVL( DATAINATIVA      , '''' ) AS DATAINATIVA      ,' );
    sqlLocal.Add( '  NVL( DATAATIVA        , '''' ) AS DATAATIVA        ,' );
    sqlLocal.Add( '  NVL( FLGATIVA         , '''' ) AS FLGATIVA         ,' );
    sqlLocal.Add( '  NVL( FLGCONTAMONETARIA, '''' ) AS FLGCONTAMONETARIA,' );
    sqlLocal.Add( '  NVL( FLGTRANSFSALDO   , '''' ) AS FLGTRANSFSALDO   ,' );
    sqlLocal.Add( '  NVL( FORMULAORCADO    , '''' ) AS FORMULAORCADO    ,' );
    sqlLocal.Add( '  NVL( FORMULAREALIZADO , '''' ) AS FORMULAREALIZADO ,' );
    sqlLocal.Add( '  NVL( VLRINFORMADOORC  , '''' ) AS VLRINFORMADOORC  ,' );
    sqlLocal.Add( '  NVL( VLRINFORMADOREAL , '''' ) AS VLRINFORMADOREAL ,' );
    sqlLocal.Add( '  NVL( OBSERVACAO       , '''' ) AS OBSERVACAO       ,' );
    sqlLocal.Add( '  NVL( CODCENTRORESPON  , '''' ) AS CODCENTRORESPON   ' );
    sqlLocal.Add( 'FROM' );
    sqlLocal.Add( '  CONTASORCAMEN' );
    sqlLocal.Add( 'WHERE' );
    sqlLocal.Add( '  IDPESSOA       = ' + FloatToStr( pIdEmpresa ) + ' AND' );
    sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
    sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( pContaOrigem ) );
    CdsOrigem.Close;
    CdsOrigem.Data := GetDataPacket( sqlLocal.Text );
  Finally
    sqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemContab( pContaOrigem : String );
Var
  sqlLocal  : TStringList;
Begin
  sqlLocal    := TStringList.Create;
  Try
    sqlLocal.Add( 'SELECT' );
    sqlLocal.Add( '  PLANO,     PLACONTA,    CODCENTROCUSTO,' );
    sqlLocal.Add( '  UNIDNEGOC, IDPLANOPREV, IDPATRO' );
    sqlLocal.Add( 'FROM' );
    sqlLocal.Add( '  COMPCONTASORCAMEN' );
    sqlLocal.Add( 'WHERE' );
    sqlLocal.Add( '  IDPESSOA       = ' + FloatToStr( pIdEmpresa ) + ' AND' );
    sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
    sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( pContaOrigem ) + ' AND' );
    sqlLocal.Add( '  PLACONTA IS NOT NULL' );

    CdsOrigem.Close;
    CdsOrigem.Data := GetDataPacket( sqlLocal.Text );
  Finally
    sqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemContaOrc( pContaOrigem : String );
Var
  sqlLocal  : TStringList;
Begin
  sqlLocal    := TStringList.Create;
  Try
    sqlLocal.Add( 'SELECT' );
    sqlLocal.Add( '  IDCONTAREFORCADO, PERCCONTAREFORC' );
    sqlLocal.Add( 'FROM' );
    sqlLocal.Add( '  COMPCONTASORCAMEN' );
    sqlLocal.Add( 'WHERE' );
    sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
    sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( pContaOrigem ) + ' AND' );
    sqlLocal.Add( '  IDCONTAREFORCADO IS NOT NULL' );

    CdsOrigem.Close;
    CdsOrigem.Data := GetDataPacket( sqlLocal.Text );
  Finally
    sqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemContaRea( pContaOrigem : String );
Var
  sqlLocal  : TStringList;
Begin
  sqlLocal    := TStringList.Create;
  Try
    sqlLocal.Add( 'SELECT' );
    sqlLocal.Add( '  IDCONTAREFREAL, PERCCONTAREFREA' );
    sqlLocal.Add( 'FROM' );
    sqlLocal.Add( '  COMPCONTASORCAMEN' );
    sqlLocal.Add( 'WHERE' );
    sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
    sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( pContaOrigem ) + ' AND' );
    sqlLocal.Add( '  IDCONTAREFREAL IS NOT NULL' );

    CdsOrigem.Close;
    CdsOrigem.Data := GetDataPacket( sqlLocal.Text );
  Finally
    sqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemFluxoCai( pContaOrigem : String );
Var
  sqlLocal  : TStringList;
Begin
  sqlLocal    := TStringList.Create;
  Try
    sqlLocal.Add( 'SELECT' );
    sqlLocal.Add( '  CODTIPRECDES, RECPAG,    CODCENTRORESPON, IDPLANOPREV,' );
    sqlLocal.Add( '  IDPATRO,      UNIDNEGOC, IDPESSOA,        IDEMPRESA,' );
    sqlLocal.Add( '  CODCENTROCUSTO' );
    sqlLocal.Add( 'FROM' );
    sqlLocal.Add( '  COMPCONTASORCAMEN' );
    sqlLocal.Add( 'WHERE' );
    sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
    sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( pContaOrigem ) + ' AND' );
    sqlLocal.Add( '  CODTIPRECDES IS NOT NULL' );

    CdsOrigem.Close;
    CdsOrigem.Data := GetDataPacket( sqlLocal.Text );
  Finally
    sqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemCondic( pContaOrigem : String );
Var
  sqlLocal  : TStringList;
Begin
  sqlLocal    := TStringList.Create;
  Try
    sqlLocal.Add( 'SELECT' );
    sqlLocal.Add( '  IDCONTACONDINI, IDCONTACONDFIM, IDCONTACONDRES,' );
    sqlLocal.Add( '  TIPOCONDINI,    TIPOCONDRES,    CONDICAO,' );
    sqlLocal.Add( '  VLRCONDINI,     VLRCONDRES' );
    sqlLocal.Add( 'FROM' );
    sqlLocal.Add( '  COMPCONTASORCAMEN' );
    sqlLocal.Add( 'WHERE' );
    sqlLocal.Add( '  IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
    sqlLocal.Add( '  IDCONTAORCAMEN = ' + QuotedStr( pContaOrigem ) + ' AND' );
    sqlLocal.Add( '  IDCONTACONDINI IS NOT NULL' );

    CdsOrigem.Close;
    CdsOrigem.Data := GetDataPacket( sqlLocal.Text );
  Finally
    sqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemArqGenerico( pContaOrigem : String );
Var
  sqlLocal  : TStringList;
Begin
  sqlLocal    := TStringList.Create;
  Try
    sqlLocal.Add( 'SELECT' );
    sqlLocal.Add( '  DV.IDDATAVIEW,       DV.CLASSNAME,  DV.TEMPLATE,   DV.NAME,' );
    sqlLocal.Add( '  DV.CLASSDESCRIPTION, DV.DESCRIPTION' );
    sqlLocal.Add( 'FROM' );
    sqlLocal.Add( '  DATAVIEW DV, CONTASORCAMEN CO' );
    sqlLocal.Add( 'WHERE' );
    sqlLocal.Add( '  CO.IDPLANOORCAMEN = ' + FloatToStr( pPlano ) + ' AND' );
    sqlLocal.Add( '  CO.IDCONTAORCAMEN = ' + QuotedStr( pContaOrigem ) + ' AND' );
    sqlLocal.Add( '  DV.IDDATAVIEW     = CO.IDDATAVIEW AND' );
    sqlLocal.Add( '  DV.ORIGEMCMDV     = ''0''' );

    CdsOrigem.Close;
    CdsOrigem.Data := GetDataPacket( sqlLocal.Text );

    CdsDataView.Data := CdsOrigem.Data;           //   Somente para pegar
    CdsDataView.EmptyDataSet;                     //    a estrutura
  Finally
    sqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.GravaLog( pLog : String );
Begin
  If ( AtualizarLog ) Then Begin
    memStatus.Lines.Add( pLog );

    If ( memStatus.Lines.Count = 1000 ) Or
       ( pLog = 'Fim do Log' ) Then Begin

      memStatus.Lines.SaveToFile( 'LogContasPorGrupo' + FormatFloat( '00', CntStatus ) + '.Txt' );

      If ( memStatus.Lines.Count = 1000 ) Then memStatus.Clear;

      CntStatus := CntStatus + 1;
    End;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.Estimar( pInserir : Boolean );
Var
  Posicao,
  Restantes : Integer;
Begin
  Posicao   := 0;
  Restantes := CdsBase.RecordCount;

  GravaLog( 'Estimar - iniciando' );
  GravaLog( ' Linhas restantes - ' + IntToStr( Restantes ) );
  GravaLog( ' Quantidade de contas que serão atualizadas - 0' );

  CdsBase.First;
  While ( Not CdsBase.EOF ) And
        ( memStatus.Tag = 0 ) Do Begin

    BuscaContas ( False );     // Busca os contas orçamentárias para o registro atual do cdsbase

    If ( pInserir ) Then Begin                     // Se for inserção as combinações que
      If ( CdsConta.RecordCount = 0 ) Then Begin   // interessam são as que não possuem contas
        Inc( Posicao );
      End;
    End Else Begin
      Posicao := Posicao + CdsConta.RecordCount;
    End;
    Dec( Restantes );

    cdsBase.Edit;
    cdsBase.FieldByName( 'BASQUANT' ).AsInteger := CdsConta.RecordCount;
    cdsBase.Post;

    memStatus.Lines[ memStatus.Lines.Count - 1 ] := ' Quantidade de contas que serão atualizadas - ' + IntToStr( Posicao );
    memStatus.Lines[ memStatus.Lines.Count - 2 ] := ' Linhas restantes - ' + IntToSTr( Restantes );

    CdsBase.Next;
    Application.ProcessMessages;
  End;
  GravaLog( StringOfChar( '=', 40 ) );
End;
//************************************************
Function  TCtrlCadContasOrcPorGrupo.TamanhoMinimo( pCdsLocal : TDataSet;
                                                   pLtvSelec : TListView;
                                                   pCampo    : String ) : Integer;
Var
  Posicao : Integer;
Begin
  Result := 0;
  For Posicao := 0 To pLtvSelec.Items.Count - 1 Do Begin

    pCdsLocal.RecNo := StrToInt( pltvSelec.Items[ Posicao ].SubItems[ 0 ] );
    If ( Result < Length( Trim( pCdsLocal.FieldByName( pCampo ).AsString ) ) ) Then Begin

      Result := Length( Trim( pCdsLocal.FieldByName( pCampo ).AsString ) );
    End;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrcPorGrupo.GeraCodigo( pArrCodigo : Array Of TrecCodigo );
Var
  Formato : String;
  Posicao,
  SeqPlano,
  SeqPatro : Integer;
Begin
  SeqPlano := 0;
  SeqPatro := 0;
  cdsBase.Filtered := False;
  cdsBase.Filter   := 'BASQUANT = 0';
  cdsBase.Filtered := True;
  cdsBase.First;

  While ( Not cdsBase.EOF ) And
        ( memStatus.Tag = 0 ) Do Begin

    Posicao := 0;
    While ( Posicao < Length( pArrCodigo ) ) And
          ( memStatus.Tag = 0 ) Do Begin

      If ( pArrcodigo[ Posicao ].Inicio <> 0 ) And
         ( pArrcodigo[ Posicao ].Digitos <> 0 ) Then Begin

        Formato := StringOfChar( '0', pArrcodigo[ Posicao ].Digitos );

        If ( pArrcodigo[ Posicao ].Campo = 'GO' ) Then Begin

          try
          CdsGrupoOrc.Locate( 'CODGRUPOORC',
                              VarArrayOf( [ CdsBase.FieldByName( 'BASGRUP' ).AsFloat ] ),
                              [ loCaseInsensitive ] );
          except
            on e : exception do showmessage( e.message );
          end;
          pArrcodigo[ Posicao ].Conteudo := FormatFloat( Formato,
                                                         StrToFloat( Trim( CdsGrupoOrc.FieldByName( 'CODGRUPOORC' ).AsString ) ) );

        End Else If ( pArrcodigo[ Posicao ].Campo = 'CC' ) Then Begin

          pArrcodigo[ Posicao ].Conteudo := FormatFloat( Formato, CdsBase.FieldByName( 'BASCENT' ).AsFloat );

        End Else If ( pArrcodigo[ Posicao ].Campo = 'AP' ) Then Begin

          CdsAtivProj.Locate( 'UNIDNEGOC',
                              VarArrayOf( [ CdsBase.FieldByName( 'BASATIV' ).AsFloat ] ),
                              [ loCaseInsensitive ] );
          pArrcodigo[ Posicao ].Conteudo := FormatFloat( Formato,
                                                         StrToFloat( Trim( CdsAtivProj.FieldByName( 'UNECODIGO' ).AsString ) ) );

        End Else If ( pArrcodigo[ Posicao ].Campo = 'PP' ) Then Begin

          Inc( SeqPlano );
          If ( SeqPlano > Power( 10, pArrcodigo[ Posicao ].Digitos ) - 1 ) Then Begin
            SeqPlano := 1;
          End;

          pArrcodigo[ Posicao ].Conteudo := FormatFloat( Formato,
                                                         SeqPlano + pArrcodigo[ Posicao ].Valor );

        End Else If ( pArrcodigo[ Posicao ].Campo = 'PT' ) Then Begin

          Inc( SeqPatro );
          If ( SeqPatro > Power( 10, pArrcodigo[ Posicao ].Digitos ) - 1 ) Then Begin
            SeqPatro := 1;
          End;
          pArrcodigo[ Posicao ].Conteudo := FormatFloat( Formato,
                                                         SeqPatro + pArrcodigo[ Posicao ].Valor );
        End Else Begin

          pArrcodigo[ Posicao ].Conteudo := '';
        End;
      End;
      Inc( Posicao );
    End;

    CdsBase.Edit;
    CdsBase.FieldByName( 'BASCONTA' ).AsString := pArrcodigo[ 0 ].Conteudo + pArrcodigo[ 1 ].Conteudo +
                                                  pArrcodigo[ 2 ].Conteudo + pArrcodigo[ 3 ].Conteudo +
                                                  pArrcodigo[ 4 ].Conteudo;
    CdsBase.Post;
    cdsBase.Next;
  End;
  cdsBase.Filtered := False;
  cdsBase.Filter   := '';
End;
//************************************************
Function  TCtrlCadContasOrcPorGrupo.Inclusao( pedtContaText : String;
                                              pArrCodigo    : Array Of TrecCodigo;
                                              pLtvSelec     : TListView ) : Boolean;
Var
  sqlLocal : TStringList;
  Posicao  : Integer;
Begin
  Result := True;
  MessageInfo := '';
  sqlLocal := TStringList.Create;

  GravaLog( '- Inclusão - iniciando' );
  GravaLog( '  Gerando códigos' );
  GeraCodigo( pArrcodigo );  // Gera ID para as contas

  cdsBase.Filtered := False;
  cdsBase.Filter   := 'BASQUANT = 0';
  cdsBase.Filtered := True;
  cdsBase.First;

  While ( Not cdsBase.EOF ) And
        ( memStatus.Tag = 0 ) Do Begin

    Try
      sqlLocal.Clear;
      sqlLocal.Add( 'INSERT INTO' );
      sqlLocal.Add( '  CONTASORCAMEN' );
      sqlLocal.Add( '  ( IDPESSOA,       IDPLANOORCAMEN, IDCONTAORCAMEN,' );
      sqlLocal.Add( '    IDGRUPOORCAMEN, CODCENTROCUSTO, UNIDNEGOC,' );
      sqlLocal.Add( '    IDPLANOPREV,    IDPATRO,        NOMECONTAORCAMEN )' );
      sqlLocal.Add( '  VALUES (' );
      sqlLocal.Add( '    ' + FloatToStr( pIdEmpresa ) + ',' );
      sqlLocal.Add( '    ' + FloatToStr( pPlano ) + ',' );
      sqlLocal.Add( '    ' + QuotedStr( cdsBase.FieldByName( 'BASCONTA' ).AsString ) + ',' );
      sqlLocal.Add( '    ' + Trim( CdsBase.FieldByName( 'BASGRUP' ).AsString ) + ',' );
      sqlLocal.Add( '    DECODE( ' + QuotedStr( cdsBase.FieldByName( 'BASCENT' ).AsString ) + ', '''', NULL, ' +
                                     QuotedStr( cdsBase.FieldByName( 'BASCENT' ).AsString )+ ' ),' );
      sqlLocal.Add( '    DECODE( ' + QuotedStr( cdsBase.FieldByName( 'BASATIV' ).AsString ) + ', '''', NULL, ' +
                                     QuotedStr( cdsBase.FieldByName( 'BASATIV' ).AsString ) + ' ),' );
      sqlLocal.Add( '    DECODE( ' + QuotedStr( cdsBase.FieldByName( 'BASPLAN' ).AsString ) + ', '''', NULL, ' +
                                     QuotedStr( cdsBase.FieldByName( 'BASPLAN' ).AsString ) + ' ),' );
      sqlLocal.Add( '    DECODE( ' + QuotedStr( cdsBase.FieldByName( 'BASPATR' ).AsString ) + ', '''', NULL, ' +
                                     QuotedStr( cdsBase.FieldByName( 'BASPATR' ).AsString ) + ' ),' );
      sqlLocal.Add( '    ' + QuotedStr( cdsBase.FieldByName( 'BASCONTA' ).AsString ) + ' )' );
      AtualizaTabela( sqlLocal.Text );

    Except
      On E:Exception Do Begin
        Result := False;
        MessageInfo := MessageInfo + E.Message;
        GravaLog( ' ' + MessageInfo );
      End;
    End;

    CdsBase.Next;
  End;

  // Utiliza os métodos de alteração para popular os demais dados da conta
  AtualizarLog := False;
  Posicao := 0;
  While ( Posicao < pLtvSelec.Items.Count ) And
        ( memStatus.Tag <> -1 ) Do Begin

    If Not ( Alteracao( pedtContaText,
                        pLtvSelec.Items[ Posicao ].SubItems[ 0 ] ) ) Then Begin
      Posicao := pLtvSelec.Items.Count;       // Para sair do loop
    End;

    Inc( Posicao );
  End;
  AtualizarLog := ( Not isAppServer );
  GravaLog( 'Fim do Log' );
  cdsBase.Filtered := False;
  cdsBase.Filter   := '';
End;
//************************************************
Function TCtrlCadContasOrcPorGrupo.AtualizaTabela( pSql : String ) : Boolean;
Begin
  Application.ProcessMessages;
  If ( memStatus.Tag = 0 ) Then Begin

    If ( ConnectionSide = cnsClient ) Then Begin

      Result := Connection.AppServer.AtualizaTabela( pSql );

      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;

    End Else Begin

        Try
          ExecSql( pSql );
          Result := True;
        Except
          On E : Exception Do Begin
            MessageInfo := E.Message;
            Result := False;
          End;
        End;
    End;
  End Else Begin
    MessageInfo := 'Processo cancelado pelo usuário' + #13 + #10;
    GravaLog( MessageInfo );
    Result := False;
  End;
End;
//************************************************
End.
