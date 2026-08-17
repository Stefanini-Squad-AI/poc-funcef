{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

Nº SIG.....: 60379
Data.......: 19/09/2019
Autor......: Everson Cunha
Descrição..: Inclusão do campo Nº Documento(s)
--------------------------------------------------------------------------------
Nº Pendência.: 16136
Data.........: 12/04/2004
Autor........: André Tavares
Descrição....: Inclusão do campo Nº Documento(s)
--------------------------------------------------------------------------------
}


Unit
  uCtrlAlteraDadosRemessa;

Interface

Uses
  SysUtils, uCmControlObject, uCmDbObject, uSistema, DB, Classes, uDataBase,
  DbClient, ExtCtrls, uCMTypes, uMidasUtil, uCtrlDocumento, uCtrlIntBanco, Machklb;

Type
  TCtrlAlteraDadosRemessa = Class(TCmControlObject)
  Protected
    Procedure AfterInitialize; override;
    Procedure OnCreateAppServer; Override;
  Private
    CtrlDocumento     : TCtrlDocumento;
    CtrlIntBanco      : TCtrlIntBanco;

    FCdsDocEmi     : TClientDataSet;
    FCdsDocSel     : TClientDataSet;
    FCdsBanco      : TClientDataSet;
    FUsaPlanoPatro : Boolean;
    FIdUsuario     : Double;
    FIdModulo      : Double;
    FIdEspAcesso   : Double;
    FIdEmpresa     : Double;
    FPlanoConta    : Double;
    procedure SetCdsBanco(const Value: TClientDataSet);
    procedure SetCdsDocEmi(const Value: TClientDataSet);
    procedure SetCdsDocSel(const Value: TClientDataSet);
  Public
    Constructor Create; override;
    Destructor Destroy; override;

    Function bbtnSelecionaDocClick( pParamIntegraRecPag,
                                    pEdtNossoNumText,
                                    pDbLcPortadorText,
                                    pDbLcPortadorLookUpValue,
                                    pdtedDataProgText,
                                    pNumDocumento, //Everson Cunha - SIG60379
                                    pRazaoSocial : String;
                                    pForCliRegId : Integer;
                                    pModuloValorZero : Double  ) : Boolean;
    Function AbreCdsDocEmi : Boolean;
    Function AbreCdsBanco( pPrefixoServidor,
                           pParamIntegraRecPag : String ) : Boolean;
    Function bbtnConfirmarClick( pPnlCamposParaAlteracao : TPanel;
                                 pCklCampos              : TCMchklistbox;
                                 pCmbOperacaoText        : String ) : Boolean;
    Function EncheLista( Var pTStrings : TStringList ) : Boolean;

    Property IdEmpresa     : Double         Read FIdEmpresa              Write FIdEmpresa;
    Property IdModulo      : Double         Read FIdModulo               Write FIdModulo;
    Property IdUsuario     : Double         Read FIdUsuario              Write FIdUsuario;
    Property IdEspAcesso   : Double         Read FIdEspAcesso            Write FIdEspAcesso;
    Property UsaPlanoPatro : Boolean        Read FUsaPlanoPatro          Write FUsaPlanoPatro;
    Property PlanoConta    : Double         Read FPlanoConta             Write FPlanoConta;
    Property CdsDocEmi     : TClientDataSet Read FCdsDocEmi Write SetCdsDocEmi;
    Property CdsDocSel     : TClientDataSet Read FCdsDocSel Write SetCdsDocSel;
    Property CdsBanco      : TClientDataSet Read FCdsBanco  Write SetCdsBanco;
  End;

Implementation

{ TCtrlAlteraVenc }

Constructor TCtrlAlteraDadosRemessa.Create;
Begin
  Inherited;
  CtrlDocumento     := TCtrlDocumento.Create;
  CtrlIntBanco      := TCtrlIntBanco.Create;

End;

Destructor TCtrlAlteraDadosRemessa.Destroy;
Begin
  Inherited;
  CtrlDocumento.Free;
  CtrlIntBanco.Free;

  If ( isAppServer ) Then FreeCds( [ CdsDocEmi, CdsDocSel, CdsBanco ] );
End;

Procedure TCtrlAlteraDadosRemessa.AfterInitialize;
Begin
  Inherited;
  CtrlDocumento.InitializeAs( Self );
  CtrlDocumento.OpenTransaction := False;

  CtrlDocumento.IdModulo          := Trunc( IdModulo );
  CtrlDocumento.IdUsuario         := Trunc( IdUsuario );
  CtrlDocumento.UsaPlanoPatro     := UsaPlanoPatro;
  CtrlDocumento.IdEspAcesso       := Trunc( IdEspAcesso );

  CtrlIntBanco.InitializeAs( Self );
  CtrlIntBanco.OpenTransaction := False;
End;

Procedure TCtrlAlteraDadosRemessa.OnCreateAppServer;
Begin
  Inherited;
  CdsDocEmi := TClientDataSet.Create( Nil );
  CdsDocSel := TClientDataSet.Create( Nil );
  CdsBanco  := TClientDataSet.Create( Nil );
End;

Procedure TCtrlAlteraDadosRemessa.SetCdsBanco(const Value: TClientDataSet);
Begin
  FCdsBanco := Value;
End;

Procedure TCtrlAlteraDadosRemessa.SetCdsDocEmi( Const Value: TClientDataSet);
Begin
  FCdsDocEmi := Value;
End;

Procedure TCtrlAlteraDadosRemessa.SetCdsDocSel( Const Value: TClientDataSet);
Begin
  FCdsDocSel := Value;
End;

Function TCtrlAlteraDadosRemessa.bbtnSelecionaDocClick( pParamIntegraRecPag,
                                                        pEdtNossoNumText,
                                                        pDbLcPortadorText,
                                                        pDbLcPortadorLookUpValue,
                                                        pdtedDataProgText,
                                                        pNumDocumento, //Everson Cunha - SIG60379
                                                        pRazaoSocial : String;
                                                        pForCliRegId : Integer;
                                                        pModuloValorZero : Double  ) : Boolean;
Var
  sSql : String;
Begin

  sSql := 'SELECT DISTINCT' +
          '(0) As VALOR, ' +
          ' P.RAZAOSOCIAL AS NOME, ' +
          ' E.CEP, ES.CODESTADO, C.NOME AS CIDADE, E.BAIRRO, '+
          ' E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, P.NUMDOCUMENTO, '+
          ' P.RAZAOSOCIAL, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, '+
          ' D.CODPORTFORMA, D.DATAVENCTO, '+
          ' D.DATAEMISSAO, D.NODOCUMENTO, M.MOESIGLA, D.CODDOCUMENTO, P.TIPO, D.NOSSONUMERO,'+
          ' D.COMPLDOCUMENTO, E.TIPOENDERECO,  AB.NUMAGENCIA, PC.NOCONTACORR AS NUMCONTA, F.JUROSPORDIA AS VALORJUROS, '+
          ' D.IDFORCLI, F.NUMRAZAOCC '+
          'FROM '+
           ' ENDPESS E, CIDADES C, ESTADO ES, ' +
           ' PESSOA P, DOCUMENTO D, PORTADORFORMA F , MOEDA M, ' +
           ' AGENCIABANCARIA AB, PORTADORCONTA PC ' +
          'WHERE' +
          '  (D.EMISBLOQ = ''S'') AND' +
          '  (D.STATUS <> ''2'') AND' +
          '  (D.OPERACAO IN (''2'',''3'')) AND' +
          '  (D.RECPAG = ''' + pParamIntegraRecPag + '''' + ') AND' +
          '  (D.IDFORCLI=P.IDPESSOA) AND '+
          ' d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + pParamIntegraRecPag +
          ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + pParamIntegraRecPag + #39 +
          ' and b.idusuario=' + IntToStr( Trunc( IdUsuario ) ) + ') ' +
          ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = ''' + pParamIntegraRecPag +
          '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39+ pParamIntegraRecPag + #39 +
          ' and a.codtipdoc=b.codtipdoc and b.idusuario='+ IntToStr( Trunc( idUsuario ) )+')) and ' ;

          If pEdtNossoNumText <> '' Then
             sSql := sSql + ' (D.NOSSONUMERO LIKE ''' + pEdtNossoNumText + '%'') AND';

          If pDbLcPortadorText <> '' Then
             sSql := sSql + ' (F.CODPORTFORMA = ' + pDbLcPortadorLookupValue + ') AND';

          If pdtedDataProgText <> '' Then
             sSql := sSql + ' (D.DATAPROGRAMADA = TO_DATE(''' + pdtedDataProgText + ''',''DD/MM/YYYY'')) AND';

          If pRazaoSocial <> '' Then
             sSql := sSql + ' (D.IDFORCLI = ' + IntToStr( pForCliRegId ) + ') AND';

          //Everson Cunha - SIG60379 - Início
          If Trim(pNumDocumento) <> '' Then
             sSql := sSql + ' (D.NODOCUMENTO IN (' + pNumDocumento + ')) AND';
          //Everson Cunha - SIG60379 - Fim

          sSql := sSql + '  (D.MOECODIGO = M.MOECODIGO(+)) AND'+
// início - andré tavares - 12/04/2004 - pendência 16136
       ' (D.IDFORCLI = P.IDPESSOA) AND '+
       ' (E.IDPESSOA(+) = P.IDPESSOA) AND '+
       ' (E.IDENDERECO(+) = P.IDENDCOBRANCA) AND '+
       ' (E.IDCIDADES = C.IDCIDADES(+)) AND '+
       ' (ES.IDESTADO(+) = C.IDESTADO) AND '+
       ' (D.CODPORTFORMA = F.CODPORTFORMA) AND '+
       ' (F.CODPORTADOR = PC.CODPORTADOR(+)) AND '+
       ' (PC.IDAGENCIA = AB.IDPESSOA(+)) '+
// fim - andré tavares - 12/04/2004 - pendência 16136

       '  ORDER BY P.RAZAOSOCIAL, D.NOSSONUMERO';

  If FazQuery( CdsDocEmi,sSql ) Then Begin
    While Not ( CdsDocEmi.Eof ) Do Begin
      CtrlDocumento.Saldo.CalculaSaldo( CdsDocEmi.FieldByName('CODDOCUMENTO').Asinteger );
      
      If Format( '%17.2f',[ CtrlDocumento.Saldo.Valor ] ) <> Format( '%17.2f',[ pModuloValorZero ] ) Then Begin
        CdsDocEmi.edit;
        CdsDocEmi.FieldByName('VALOR').AsFloat := CtrlDocumento.Saldo.Valor;
        CdsDocEmi.post;
        CdsDocEmi.Next;
      End Else Begin
        CdsDocEmi.Delete;
      End;
    End;
    CdsDocEmi.First;

    If Not CdsDocSel.IsEmpty Then
    Begin
      CdsDocSel.First;
      While Not CdsDocSel.Eof Do Begin

        While Not CdsDocEmi.Eof Do Begin
          If CdsDocEmi.FieldByName('CodDocumento').AsInteger = CdsDocSel.FieldByName('CodDocumento').AsInteger Then Begin
            CdsDocEmi.Delete;
            CdsDocEmi.Last;
          End Else Begin
            CdsDocEmi.Next;
          End;
        End;
        CdsDocSel.Next;
        CdsDocEmi.First;
      End;
      CdsDocSel.First;
    End;
  End;
  Result := True;
End;

Function TCtrlAlteraDadosRemessa.AbreCdsDocEmi : Boolean;
Begin
  Try
    FazQuery( CdsDocEmi,'SELECT DISTINCT (0) As VALOR, E.CEP, ES.CODESTADO, C.NOME AS CIDADE, E.BAIRRO, ' +
              'E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, P.NUMDOCUMENTO, P.RAZAOSOCIAL AS NOME,  ' +
              'D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, D.CODPORTFORMA, D.DATAVENCTO,  ' +
              'D.NOSSONUMERO, D.DATAEMISSAO, D.NODOCUMENTO, M.MOESIGLA, D.CODDOCUMENTO, P.TIPO,  ' +
              'D.COMPLDOCUMENTO, E.TIPOENDERECO,  AB.NUMAGENCIA, PC.NOCONTACORR AS NUMCONTA,  ' +
              'F.JUROSPORDIA AS VALORJUROS ' +
              'FROM ' +
              'PESSOA P, DOCUMENTO D, PORTADORFORMA F , MOEDA M, AGENCIABANCARIA AB, PORTADORCONTA PC, ' +
              'ENDPESS E, CIDADES C, ESTADO ES WHERE  1=2');
    Result := True;
  Except
    On E : Exception Do Begin
      Result := False;
      MessageInfo := E.Message;
    End;
  End;
End;

Function TCtrlAlteraDadosRemessa.AbreCdsBanco( pPrefixoServidor,
                                               pParamIntegraRecPag : String ) : Boolean;
Begin
  Try
    FazQuery( CdsBanco, ' Select CodPortForma, Descricao, CodBloqChe, CodArquivoRemessa, NossoNumero,' +
              ' JurosPorDia,PrazoProtesto,NumEmpresaBanco,ControleRemessa,PathArquivoRem'    +
              ' From ' + pPrefixoServidor + 'PortadorForma' +
              ' Where RecPag = ''' + pParamIntegraRecPag + ''''   +
              ' and idPessoa = ' + FloatToStr( idEmpresa ) +
              ' Order by Descricao' );
    Result := True;
  Except
    On E : Exception Do Begin
      Result := False;
      MessageInfo := E.Message;
    End;
  End;
End;

Function TCtrlAlteraDadosRemessa.bbtnConfirmarClick( pPnlCamposParaAlteracao : TPanel;
                                                     pCklCampos              : TCMchklistbox;
                                                     pCmbOperacaoText        : String ) : Boolean;
Var
  X: Integer;
  sCodOcorrencia, sAuxCampos, sCamposAlteracao: String;
Begin
  Result := False;
  sCamposAlteracao := CtrlIntBanco.VerificaCamposParaAlteracao(CdsBanco.FieldByName('CodArquivoRemessa').AsInteger,
                                                        StrToInt( trim(Copy( pCmbOperacaoText,1,2))));

  if not CdsBanco.FieldByName('CodArquivoRemessa').AsInteger in [1, 50] then
  begin
    If sCamposAlteracao = '-1' Then Begin
      pPnlCamposParaAlteracao.Visible := Not pPnlCamposParaAlteracao.Visible;
      If pPnlCamposParaAlteracao.Visible Then Exit;
    End;

    sAuxCampos := sCamposAlteracao;
    While sAuxCampos <> '-1' Do Begin
      If Pos(',',sAuxCampos) = 0 Then Begin
        pCklCampos.Selected[StrToInt(sAuxCampos)] := True;
        sAuxCampos := '-1'
      End Else Begin
        sCodOcorrencia := Copy(sAuxCampos,1,Pos(',',sAuxCampos) - 1);
        pCklCampos.Selected[StrToInt(sCodOcorrencia)] := True;
        sAuxCampos := Copy(sAuxCampos,Pos(',',sAuxCampos) + 1,Length(sAuxCampos));
      End
    End;

    If ( pCklCampos.SelCount = 0 ) Then Begin
      MessageInfo := 'Favor Indicar Um ou Mais Campos Para Alteração.';
      pPnlCamposParaAlteracao.Visible := True;
      Exit;
    End;
    For X := 0 To pCklCampos.Items.Count - 1 Do
      If pCklCampos.Selected[X] Then
        CdsDocSel.Fields[X].Tag := 1
      Else
        CdsDocSel.Fields[X].Tag := 0;
  end;

  If CtrlIntBanco.VerficaDadosEmpresa('R',CdsBanco.FieldByName('CODPORTFORMA').AsInteger) Then
  begin
    CtrlIntBanco.ExibeArquivoGerado := true; //Everson Cunha - SIG60379

    CtrlIntBanco.MostraFormAlteracao( CdsBanco.FieldByName('CodArquivoRemessa').AsInteger,
                               CdsDocSel.Data,
                               CdsBanco.FieldByName('PathArquivoRem').AsString,
                               CdsBanco.FieldByName('NumEmpresaBanco').AsString,
                               Copy( pCmbOperacaoText, 1, 2 ) );
  end;

  Result := True;
End;

Function TCtrlAlteraDadosRemessa.EncheLista( Var pTStrings : TStringList ) : Boolean;
Begin
  Try
    if not CdsBanco.FieldByName('CodArquivoRemessa').isNull then // andre tavares - pendência 16136 e 16137
      pTStrings.AddStrings( CtrlIntBanco.EncheListaOcorrencia( CdsBanco.FieldByName('CodArquivoRemessa').AsInteger ) );
    Result := True;
  Except
    On E : Exception Do Begin
      Result := False;
      MessageInfo := E.Message;
    End;
  End;
End;

End.

