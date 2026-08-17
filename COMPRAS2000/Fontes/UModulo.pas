unit UModulo;

interface

Uses uSistema,SysUtils,Grids, fPrincipal, uDataBase, dbasedados,
     uIntegraBack, dialogs, uMenserro, uString, uFuncaoGeral, uCMDialogs,
     uCmControlObject,stdctrls;

type TModulo = class(TCmControlObject)

   private

   public
      sFormCancela        : String;
      sFormSumario        : String;
      DataBaseName        : String;
      iConfForneAuto      : String;
      SisCodOrigem        : String;
      UnidNegoc           : Integer;
      bFlagSuperUsuario   : Boolean;   //Falta preencher na Autorizacao!!!!
      sNomePessoaCompleto : String;
      sCodCCusto          : String;
      sDescCCusto         : String; { Centro de Custo fornecido pelo usuario ao entrar}
      iCodCusteio         : Integer;
      iCodAlmoxa          : Integer; { Almoxarifado fornecido pelo usuario ao entrar}
      sAlmoxaUsuario      : String;
      sPrincSec           : String;
      sSistema            : String;
      sMascaraPlano       : String;
      sMascaraDesemb      : String;
      sIntegraContab      : String;
      ObrigaCrespon       : String;
      ObrigaAbc           : String;
      sExisteCPag         : String;  { Parametro que diz se Existe o Sistema de Contas a Pagar}
      sTipoArtigo         : String;
      sCCustoAlmoxa       : String;
      sEstorna            : String;
      bTipoOper           : Boolean;
      bAchouProduto       : Boolean;
      sMascaraGrupoProd   : String;
      sContabGrupo        : String;
      sContabTransf       : String;
      SFlgVerifRAD        : String;
      sExisteDV,
      sExisteCompra,               { Parametro que diz se Existe o Sistema de Compras }
      sRecebAutomatico,            { Parametro que diz se o Recebimento de Compras                                     deve ser automatico ou não }
      sCodTabProdUtilizada,        { Tabela de Produto utilizada por Empresa (Opcional)
                                     é identificado pelo primeiro nível da máscara de
                                     Grupo de Produto - se está preenchido então há o controle}
      sTipoAtenPedido,              { Tipo de Atendimento do Pedido :
                                      'AN' - Atendimento normal
                                      'AI'- Atendimento por transf. de Inventário }
      sTipoBaixa,                   { Tipo de Baixa :
                                      'BM' - Baixa de Material
                                      'BI' - Baixa por Inventario }
      sTipoReceCompra     : String; { Tipo de Recebimento :
                                      'RC'- Recebimento de compra
                                      'CI'- Correção de Inventário }
      sTipoInventConsulta,          { Tipo de Consulta de Inventario :
                                      'C' - contagem
                                      'M' - movimento }
      sTipoListaCega,               { 'C'- Contagem
                                      'R'- Recontagem }
      sControle            : String; { 'R' = Contas a Receber; 'P' = Contas a Pagar}
      sCodArtigo           : String; { Codigo do Artigo selecionado pelo AchaArtigo}
      idInventarioCorrecao : integer; { Inventario que ira fazer Atendimento por Correcao}
      bVeioAnalise         : boolean;
      idAnalise            : Integer;
      iCodTipDoc           : Integer;

//      sLancFinanc         : String;

      //Variaveis referentes ao Sistema de Compras
      TxJuros                         : Double;
      PesoPreco                       : Double;
      PesoPrazoEnt                    : Double;
      PesoPrazoPgto                   : Double;
      PesoAvaliacao                   : Double;
      ComprarAlemSC                   : Integer;
      ObsOC                           : String;
      ImpObsAParte                    : Boolean;
      sAssinatura1                    : String;
      sAssinatura2                    : String;
      sAssinatura3                    : String;
      sImpLogo                        : String;
      sTrasObs                        : String;
      sFlgOrcamento                   : String;
      sCodTipoDoc                     : String;
      sFlgObsSCIOC                    : String;
      iIdPatro                        : Integer;
      iIdPlanoPrev                    : Integer;
      ModeloImpOC                     : Integer;

      constructor Create; Override;

      procedure AtualizarParametros( IdEmpresa : Integer);
      Function  ExistMov(sCodArt : String) : Boolean;
      Function  ProdVari( Var sDesc : String ) : LongInt;
      Function  leUnCusteio( iCodAlmox : LongInt ) : LongInt;
      Function  LeGrupoProd( sCodArt : String) : String;
      Procedure CalcImposto( sCODPRODUTO, sCODUF : String; iIDPAIS, iCODTIPOCUSTAGREG : LongInt; rValorItem : Double; var rBase : Double; var rPerc : Double; var rValorImp : Double);
      Function  LeCodTipRecDes( sGrupoProd : String ) : String;
      Function  LeUltContato( idForCli,idPessoa : LongInt ) : String;
      Function  GravaUltContato(idForCli,idPessoa : LongInt; Contato : String ) :Boolean;
      Function  VerifCC( pCodArt, pCentCust : String; IdEmpresa : Integer ) : Boolean;
   end;

var Modulo : TModulo;

implementation

constructor TModulo.Create;
begin
   Inherited;
   SisCodOrigem := 'A';
   UnidNegoc    := -1;
end;

Function TModulo.leUnCusteio( iCodAlmox : LongInt ) : LongInt;
Begin
  If Fazquery(DtmBaseDados.qry,' SELECT CODCUSTEIO '+
                               ' FROM  ALMOX A '+
                               ' WHERE '+
                               '       (A.CODALMOXARIFADO = '+IntToStr(iCodAlmox)+') ')
  Then
     Result :=  DtmBaseDados.qry.FieldByName('CODCUSTEIO').asInteger
  Else
     Result  := -1;
End;

procedure TModulo.AtualizarParametros( IdEmpresa : Integer);
var
   sSql : String;
begin

      sSql := 'SELECT CODALTDEVOLUCAO,CODTIPDOC,MASCGRUPOPROD,EXISTEDV,'+
              '       EXISTECOMPRA,RECEBAUTOMATICO,CODTABPRODUTIL,     '+
              '       EXISTECONTASPAGAR,EXISTECONTABIL,FLGCONTABGRUPO, '+
              '       FLGCONTABTRANSF,CODTIPDOC,IDPATRO,IDPLANOPREV    '+
              'FROM PARALMOX WHERE ( IDPESSOA = '+IntToStr(IdEmpresa)+')';

      _Cds.Data := GetDataPacket(sSql);

      sMascaraGrupoProd         := _Cds.FieldByName('MASCGRUPOPROD').AsString;
      sExisteDV                 := _Cds.FieldByName('EXISTEDV').AsString;
      sExisteCompra             := _Cds.FieldByName('EXISTECOMPRA').AsString;
      sRecebAutomatico          := _Cds.FieldByName('RECEBAUTOMATICO').AsString;
      sCodTabProdUtilizada      := _Cds.FieldByName('CODTABPRODUTIL').AsString;
      IntegraBack.Contabilidade := _Cds.FieldByName('EXISTECONTABIL').AsString;
      sContabGrupo              := _Cds.FieldByName('FLGCONTABGRUPO').AsString;
      sContabTransf             := _Cds.FieldByName('FLGCONTABTRANSF').AsString;
      sCodTipoDoc               := _Cds.FieldByName('CODTIPDOC').AsString;
      iIdPatro                  := _Cds.FieldByName('IDPATRO').AsInteger;
      iIdPlanoPrev              := _Cds.FieldByName('IDPLANOPREV').AsInteger;

      sSql := 'SELECT NOME FROM PESSOA WHERE (IDPESSOA = '+IntToStr(Sistema.idUsuario)+')';

      _Cds.Data := GetDataPacket(sSql);

      sNomePessoaCompleto := _Cds.FieldByName('NOME').AsString;

      //Compras
      sSql := ' SELECT TXJUROS,PESOPRECO,PESOPRAZOENT,PESOPRAZOPGTO,PESOAVALIACAO,'+
              ' COMPRARALEMSC,INSTRUCAOOC,ASSINATURA1,ASSINATURA2,ASSINATURA3, '+
              ' IMPOBSAPARTE,IMPLOGO,TRASOBS, FLGORCAMENTO, FLGOBSSCIOC, CODTIPDOC,'+
              ' MODELOIMPOC, FLGVERIFRAD ' +
              ' FROM PARAMCOMPRAS WHERE (IDPESSOA = '+IntToStr(idEmpresa)+')';

      _Cds.Data := GetDataPacket(sSql);

      TxJuros       := _Cds.FieldByName('TXJUROS').AsFloat;
      PesoPreco     := _Cds.FieldByName('PESOPRECO').AsFloat;
      PesoPrazoEnt  := _Cds.FieldByName('PESOPRAZOENT').AsFloat;
      PesoPrazoPgto := _Cds.FieldByName('PESOPRAZOPGTO').AsFloat;
      PesoAvaliacao := _Cds.FieldByName('PESOAVALIACAO').AsFloat;
      ComprarAlemSC := _Cds.FieldByName('COMPRARALEMSC').AsInteger;
      ObsOC         := _Cds.FieldByName('INSTRUCAOOC').AsString;
      sAssinatura1  := _Cds.FieldByName('ASSINATURA1').AsString;
      sAssinatura2  := _Cds.FieldByName('ASSINATURA2').AsString;
      sAssinatura3  := _Cds.FieldByName('ASSINATURA3').AsString;
      sImpLogo      := _Cds.FieldByName('IMPLOGO').AsString;
      sTrasObs      := _Cds.FieldByName('TRASOBS').AsString;
      sFlgOrcamento := _Cds.FieldByName('FLGORCAMENTO').AsString;
      sFlgObsSCIOC  := _Cds.FieldByName('FLGOBSSCIOC').AsString;
      iCodTipDoc    := _Cds.FieldByName('CODTIPDOC').AsInteger;
      ModeloImpOC   := _Cds.FieldByName('MODELOIMPOC').AsInteger;

      if _Cds.FieldByName('FLGVERIFRAD').isNull then
         sFlgVerifRAD  := 'O'
      else
         sFlgVerifRAD  := _Cds.FieldByName('FLGVERIFRAD').AsString;

      If _Cds.FieldByName('IMPOBSAPARTE').AsInteger = 0 Then
          ImpObsAParte := False
      Else
          ImpObsAParte := True;
      //
      IntegraBack.IntegraOrcamento := Modulo.sFlgOrcamento;

      If IntegraBack.Contabilidade = 'S' Then
         Begin
            sSql := ' Select PL.MASCARA,PC.PLANO '+
                    ' from ParamContab Pc, Plano Pl '+
                    ' where  '+
                    '        (Pc.IdPessoa = '+IntToStr( idEmpresa )+')'+
                    '    and (Pc.Plano = Pl.Plano) ';

            _Cds.Data := GetDataPacket(sSql);

            IntegraBack.Plano        := _Cds.FieldByName( 'Plano' ).AsInteger;
            IntegraBack.MascaraPlano := _Cds.FieldByName('MASCARA').AsString;
         End;
End;

Function TModulo.ExistMov(sCodArt : String) : Boolean;
Begin
  Result := Fazquery(DtmBasedados.qry,' SELECT M.CODARTIGO '+
                                      ' FROM MOVIMENT M, ALMOX A '+
                                      ' WHERE '+
                                      '       (A.CODCUSTEIO = '+IntToStr(Modulo.iCodCusteio)+') '+
                                      '   AND (A.CODALMOXARIFADO = M.CODALMOXARIFADO) '+
                                      '   AND (RTRIM(M.CODARTIGO) = '''+sCodArt+''')');
End;

Function TModulo.LeGrupoProd( sCodArt : String) : String;
Begin
    If FazQuery(dtmBaseDados.qry,'SELECT CODGRUPOPROD FROM PRODUTO WHERE '+
                                 '(RTRIM(CODPRODUTO) = '''+copy(sCodArt,1,6)+''')')
    Then
       Begin
           LeGrupoProd := dtmBaseDados.qry.FieldByName('CODGRUPOPROD').asString;
       End
    Else
       LeGrupoProd := '';
End;

Function TModulo.ProdVari( Var sDesc : String ) : LongInt;
Var
   ID    : Longint;
   bOk   : Boolean;
Begin
   Result := -1;
   sDesc  := '';
   bOk    :=  True;
   While (Trim(sDesc) = '') And ( bOK ) Do
     Begin
        bOk := InputMemo('Produto de Descrição variável','Descrição',sDesc);
        If  Not bOk Then
           Result := -1
        Else
           Begin
               If( Trim(sDesc) <> '' ) Then
                 Begin
                     If FazQuery(dtmBasedados.qry, ' SELECT IDPRODVARI,DESCPRODVARI'+
                                                   ' FROM PRODVARI '+
                                                   ' WHERE (UPPER(DESCPRODVARI) = '''+Trim(UpperCase(sDesc))+''')')
                     Then
                       Begin
                          Result := dtmBasedados.qry.FieldByName('IDPRODVARI').asInteger;
                          sDesc  := dtmBasedados.qry.FieldByName('DESCPRODVARI').asString;
                       End
                     Else
                       Begin
                          ID := LeUltRegistro(nil,'PRODVARI');
                          if Not ExecutarQuery(dtmBasedados.qry, 'INSERT INTO PRODVARI VALUES('+intToStr(ID)+','''+sDesc+''')') Then
                             Result := -1
                          Else
                             Result := ID;
                       End;
                  End
               Else
                  MsgDlg('Descrição não preenchida','Erro',mtError,[mbOK],0);
           End;
     End;
End;

Procedure TModulo.CalcImposto(sCODPRODUTO, sCODUF : String; iIDPAIS, iCODTIPOCUSTAGREG : LongInt; rValorItem : Double; var rBase : Double; var rPerc : Double; var rValorImp : Double);
Begin

   With DtmBaseDados.qry Do
     Begin
         Close;
         Sql.Text := ' SELECT PERCIMPOSTO,PERCBASEIMP '+
                     ' FROM IMPOSTOSXPRODUTOS '+
                     ' WHERE '+
                     '      (RTRIM(CODPRODUTO) = '''+ sCODPRODUTO +''') '+
                     '  AND (CODTIPOCUSTAGREG = '+ IntToStr(iCODTIPOCUSTAGREG) +') '+
                     '  AND (CODESTADO  = '''+ sCODUF +''') '+
                     '  AND (IDPAIS     = '''+ IntToStr(iIDPAIS) +''') ';
         Open;
     End;
  If Not DtmBaseDados.qry.IsEmpty Then
     Begin
        rBase := DtmBaseDados.qry.FieldByName('PERCBASEIMP').asFloat;
        rPerc := DtmBaseDados.qry.FieldByName('PERCIMPOSTO').asFloat;
        //
        rBase     := rValorItem*(rBase/100);
        rValorImp := rBase*(rPerc/100);
     End
  Else
     Begin
        rBase     := 0;
        rPerc     := 0;
        rValorImp := 0;
     End;
end;

Function  TModulo.LeCodTipRecDes( sGrupoProd : String ) : String;
Begin
    If FazQuery(dtmBaseDados.qry,'SELECT CODTIPRECDES FROM GRUPPROD WHERE '+
                                 '(RTRIM(CODGRUPOPROD) = '''+Trim(sGrupoProd)+''')')
    Then
       Begin
           Result := dtmBaseDados.qry.FieldByName('CODTIPRECDES').asString;
       End
    Else
       Result := '';
End;

function TModulo.LeUltContato(idForCli, idPessoa: Integer): String;
begin
  If FazQuery(dtmBaseDados.qry,'SELECT ULTCONTATO FROM EMPRESAFORN '+
                                 'WHERE (IDFORCLI = '+IntToStr(idForCli)+')'+
                                 '  AND (IDPESSOA = '+IntToStr(idPessoa)+')')
    Then
       Begin
           Result := dtmBaseDados.qry.FieldByName('ULTCONTATO').asString;
       End
    Else
       Result := '';
end;

function TModulo.GravaUltContato(idForCli, idPessoa: Integer;
  Contato: String): Boolean;
begin
 Result := ExecutarQuery(dtmBaseDados.qry,'UPDATE EMPRESAFORN SET ULTCONTATO = '+QuotedStr(Contato)+
                                          ' WHERE (IDFORCLI = '+IntToStr(idForCli)+')'+
                                          '   AND (IDPESSOA = '+IntToStr(idPessoa)+')');
end;

Function TModulo.VerifCC( pCodArt, pCentCust : String; IdEmpresa : Integer ) : Boolean;
Var
  bOk : Boolean;
  sCodGrupoProd,sDescConta,sObrigaCC,sSubConta:String;
  sPlano, sPlaConta : String;
Begin
   VerifCC := False;
   bOk := FazQuery(dtmBasedados.qry,' Select             '+
                                    '    Plano,          '+
                                    '    ContaEntrada,   '+
                                    '    SubContaEntrada,'+
                                    '    ContaSaida,     '+
                                    '    SubContaSaida,  '+
                                    '    CodCentroCusto  '+
                                    ' From               '+
                                    '    ArtxContaxCC    '+
                                    ' Where              '+
                                    '     (CodArtigo =  '''+Espaco(pCodArt,14) +''') '+
                                    ' And (CodCentroCusto = '''+Espaco(pCentCust,10)+''')'+
                                    ' And (IDPESSOA = '+IntToStr(IdEmpresa)+' )');
   if Not BOk Then
   Begin
      bOk := FazQuery(dtmBasedados.qry,' Select             '+
                                       '    Plano,          '+
                                       '    ContaEntrada,   '+
                                       '    SubContaEntrada,'+
                                       '    ContaSaida,     '+
                                       '    SubContaSaida,  '+
                                       '    CodCentroCusto  '+
                                       ' From               '+
                                       '    ArtxContaxCC    '+
                                       ' Where              '+
                                       '     (CodArtigo =  '''+Espaco(pCodArt,14) +''')' +
                                       ' And (IDPESSOA = '+IntToStr(IdEmpresa)+' )');
      If Not BOk Then
      Begin
         FazQuery(dtmBasedados.qry,' Select               '+
                                   '    CodGrupoProd      '+
                                   ' From                 '+
                                   '     Produto          '+
                                   ' Where                '+
                                   '      ( Rtrim(CodProduto) = Rtrim(SubStr('''+pCodArt+''',1,6)))');
         sCodGrupoProd := dtmBasedados.qry.FieldByName('CodGrupoProd').asString;
         bOk := FazQuery(dtmBasedados.qry,' Select             '+
                                          '    Plano,          '+
                                          '    ContaEntrada,   '+
                                          '    SubContaEntrada,'+
                                          '    ContaSaida,     '+
                                          '    SubContaSaida,  '+
                                          '    CodCentroCusto  '+
                                          ' From               '+
                                          '    ArtxContaxCC    '+
                                          ' Where              '+
                                          '     (CodGrupoProd =  '''+Espaco(sCodGrupoProd,10) +''') '+
                                          ' And (CodCentroCusto = '''+Espaco(pCentCust,10)+''')'+
                                          ' And (IDPESSOA = '+IntToStr(IdEmpresa)+' )');
         If Not BOk Then
         Begin
            bOk := FazQuery(dtmBasedados.qry,' Select             '+
                                             '    Plano,          '+
                                             '    ContaEntrada,   '+
                                             '    SubContaEntrada,'+
                                             '    ContaSaida,     '+
                                             '    SubContaSaida,  '+
                                             '    CodCentroCusto  '+
                                             ' From               '+
                                             '    ArtxContaxCC    '+
                                             ' Where              '+
                                             '     (CodGrupoProd =  '''+Espaco(sCodGrupoProd,10) +''') '+
                                             ' And (IDPESSOA = '+IntToStr(IdEmpresa)+' )');
         End;
      End;
   End;
   If bOk Then
   Begin
      sDescConta:='';
      sObrigaCC :='';
      sSubConta :='';
      FuncaoGeral.TestaContaCC(False,dtmBasedados.qry.FieldByName('PLANO').asInteger,dtmBasedados.qry.FieldByName('ContaSaida').asString,sObrigaCC,sDescConta,sSubConta);
      sPlano          := dtmBasedados.qry.FieldByName('PLANO').asString;
      sPlaConta       := dtmBasedados.qry.FieldByName('ContaSaida').asString;
      if sObrigaCC = 'S' then
         VerifCC := FazQuery(dtmBasedados.qry,' Select               '+
                                              '     CodCentroCusto   '+
                                              ' From                 '+
                                              '     ContasxCC        '+
                                              ' Where                '+
                                              '      (Plano = '+ sPlano + ')'+
                                              '  AND (PlaCONTA = '''+Espaco(sPlaConta,18)+ ''')'+
                                              '  AND (CodCentroCusto = '''+Espaco(pCentCust,10)+''')'+
                                              '  AND (IDEMPRESA = '+intToStr(IdEmpresa)+')')
      Else
         VerifCC :=True;
   End;
End;

end.
