// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
// *** ATENCAO *** ATENCAO *** ATENCAO *** ATENCAO *** ATENCAO *** ATENCAO ***
// -----------------------------------------------------------------------------
// Caso esta Unit sofra alguma alteração de código a mesma é usada pelos módulos
//  - Contas a Pagar
//  - Administração imobiliária (LANÇAMENTO MULTIPLO DE DESPESAS)
//      -José Roberto Marque - 13/11/2011
// -----------------------------------------------------------------------------
{-------------------------------------------------------------------------------
Rotina......: InsereAlterador
Data        : 19/10/2012
Autor       : José Roberto Marque
SOL/KINTANA : 189816/1793898
Descrição   : Alterado para criação dos alteradores automáticos de impostos
              (quando parametrizado no tipo de desembolso)
-----------------------------------------------------------------------------
 Rotina......: InsereAlterador
 Nº SOL......: 199641
 Nº KINTANA..: 1921256
 Data........: 25/01/2013
 Responsável.: Edilaine Ferraresi
 Descrição...: permitir que o NODOCUMENTO não seja limitado pelo tipo integer
-------------------------------------------------------------------------------
  N. Sol..........: 179108
  N. Kintana......: 1654527
  Data............: 27/06/2012
  Responsável.....: Edilaine Ferraresi
  Rotina..........: varreOperacoesMes
  Descrição.......: efetuar pesquisa pela DataLancamentou ou DataVencimento
--------------------------------------------------------------------------------
  N. Sol..........: 136242
  N. Kintana......: 813941
  Data............: 03/10/2011
  Responsável.....: José Roberto Marque
  Descrição.......: Implementação inicial da Unit.
-------------------------------------------------------------------------------}


Unit uCtrlTipoRecDesembxAlterador;

Interface

Uses Classes, sysutils, uCmControlObject, uCmDbObject, uDbTipoRecDesembxAlterador,
  DB, DbClient, uCMTypes, uCtrlPadroes, wwQuery;


// Type declaration
Type
  tTipoBusca = (tbDtLancamento, tbDtVencimento); // Edilaine - SOL 179108 / KTN 1654527

  TCtrlTipoRecDesembxAlterador = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbTipoRecDesembxAlterador: TDbTipoRecDesembxAlterador;
    Fcds: TClientDataSet;
    _Padroes: TCtrlPadroes;
    Procedure Setcds(Const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;

    Function GravarTipoRecDesembxAlterador( IDPESSOA: integer;
                                            RECPAG: String;
                                            CODTIPRECDES: string;
                                            CODALTERADOR: Double;
                                            PERCENTUAL: Double;
                                            ORDEM: Integer;
                                            TRGDTINCLUSAO: TDateTime;
                                            TRGUSERINCLUSAO: string ;
                                            TPIMPOSTO: string ): Boolean;

    Function ListTipoRecDesembxAlterador(
      IDASSOCIACAO: Integer;
      IDPESSOA: integer;
      RECPAG: String;
      CODTIPRECDES: string;
      CODALTERADOR: Double
      ): OleVariant;

    function PesqTipoRecDesembxAlterador(
      IDPESSOA: integer;
      RECPAG: String;
      CODTIPRECDES: string;
      CODALTERADOR: Double
      ): Integer;

    function Pesq2TipoRecDesembxAlterador(
      IDPESSOA: integer;
      RECPAG: String;
      CODTIPRECDES: string;
      CODALTERADOR: Double
      ): Integer;

    function DelTipoRecDesembxAlterador( IDASSOCIACAO: Integer ): Boolean;

    Function ListParamCap(idpessoa: double; sRecPag: string): TStringList;

    function BuscaDocCliente( IdPessoa: Integer ): string;

    function VarreOperacoesMes(
      IDROOTCNPJ: string;
      IDMES:  string;
      IDANO:  string;
      IDOPERACAO: Integer;
      const TipoBusca : tTipoBusca = tbDtLancamento;  // Edilaine - SOL 179108 / KTN 1654527
      const codDocumento : string = ''    // Edilaine - SOL 179108 / KTN 1654527
      ): OleVariant;

    function PegaNumlancto( p_coddocumento: Integer): Integer;

    function PegaCodDocum( p_numlancto: Integer): Integer;

    function InsereAlterador( p_coddocumento: Integer;
                              p_numlancto: Int64;     // Edilaine - SOL 199641 / KTN 1921256
                              p_datalancto:TDateTime; p_valor: Double;
                              p_debcre, p_historicocompl: String;
                              p_lotetransmissao: Integer; p_codtipdoc: integer;
                              p_vlrliquido: Double; p_numfatura, p_flgtipofatura,
                              p_flgfatemitida, p_numrecibo: String;
                              p_unidnegoc, p_numlotemanual: Integer;
                              p_numnf, p_flgrecebeunf: String;
                              p_idmotivocancfat: Integer; p_flglancbaixaadto,
                              p_flglancbaixa, p_flgcontabiliza: String;
                              p_idenviodocumento: Integer;
                              p_IDPESSOA: integer; p_OPERACAO: String ; P_CODALTERADOR: Double ): Boolean;

    function ProcuraAlteradorLancado( p_coddocumento: Integer;
                                      p_historicocompl: String ;
                                      P_CODALTERADOR: Double ): String;

    function AtualizaValorAlterador( p_coddocumento: Integer;
                                     p_numlancto: Integer;
                                     p_valor: Double): Boolean;

   End;

Implementation

uses
  Dialogs, USistema;

{ TCtrlTipoRecDesembxAlterador }

Function TCtrlTipoRecDesembxAlterador.GravarTipoRecDesembxAlterador(IDPESSOA: integer;
                                                                    RECPAG: string;
                                                                    CODTIPRECDES: string;
                                                                    CODALTERADOR: Double;
                                                                    PERCENTUAL: Double;
                                                                    ORDEM: Integer;
                                                                    TRGDTINCLUSAO: TDateTime;
                                                                    TRGUSERINCLUSAO: string ;
                                                                    TPIMPOSTO: string ): Boolean;
Var
  Action: Integer;
  Msg: String;
  sDscLog: String;

Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarTipoRecDesembxAlterador( IDPESSOA, RECPAG, CODTIPRECDES,
                                                                  CODALTERADOR, PERCENTUAL, ORDEM,
                                                                  TRGDTINCLUSAO, TRGUSERINCLUSAO, TPIMPOSTO );
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Action  := 0; // 0-Insert, 1-Update
      sDscLog := '';

      // Vai determinar a ação buscando o alterador para o Tipo de Desembolso em questão
      // Caso encontre um registro, então vai alterar o mesmo, ao invés de Inserir
      // Caso não encontre o registro, faz a inserção
      Action := PesqTipoRecDesembxAlterador(IDPESSOA, RECPAG, CODTIPRECDES, CODALTERADOR);

      if Action = 0 then
      begin
        _DbTipoRecDesembxAlterador.FieldByName('IDPESSOA').AsInteger        :=  IDPESSOA;
        _DbTipoRecDesembxAlterador.FieldByName('RECPAG').AsString           :=  RECPAG;
        _DbTipoRecDesembxAlterador.FieldByName('CODTIPRECDES').AsString     :=  CODTIPRECDES;
        _DbTipoRecDesembxAlterador.FieldByName('CODALTERADOR').AsFloat      :=  CODALTERADOR;
        _DbTipoRecDesembxAlterador.FieldByName('TRGDTINCLUSAO').AsDateTime  :=  TRGDTINCLUSAO;
        _DbTipoRecDesembxAlterador.FieldByName('TRGUSERINCLUSAO').AsString  :=  TRGUSERINCLUSAO;
        sDscLog := 'Inclusao de Tipo de Rec/Des X Alterador';

        _DbTipoRecDesembxAlterador.FieldByName('PERCENTUAL').AsFloat        :=  PERCENTUAL;
        _DbTipoRecDesembxAlterador.FieldByName('ORDEM').AsInteger           :=  ORDEM;
        _DbTipoRecDesembxAlterador.FieldByName('TPIMPOSTO').AsString        :=  TPIMPOSTO;
      end;

      if Action = 0 then
        Result := _DbTipoRecDesembxAlterador.Insert
      else
      begin
        Result := False;
      end;

      If Not _Padroes.GravaLogOperacoes(IdPessoa, Sistema.IdModulo, Sistema.IdUsuario, sDscLog, False) Then
        Raise Exception.Create(_Padroes.MessageInfo);

      If Not Result Then
        MessageInfo := _DbTipoRecDesembxAlterador.MessageInfo;

      Commit;

    Except
      On E: Exception Do
      Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;


Constructor TCtrlTipoRecDesembxAlterador.Create;
Begin
  Inherited;
  _DbTipoRecDesembxAlterador := TDbTipoRecDesembxAlterador.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;


Destructor TCtrlTipoRecDesembxAlterador.Destroy;
Begin
  _DbTipoRecDesembxAlterador.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;


Procedure TCtrlTipoRecDesembxAlterador.DoChangeDataBase;
Begin
  Inherited;
  _DbTipoRecDesembxAlterador.DataBaseName := DataBaseName;
End;


Function TCtrlTipoRecDesembxAlterador.ListTipoRecDesembxAlterador( IDASSOCIACAO:  Integer;
                                                                   IDPESSOA: integer;
                                                                   RECPAG: String;
                                                                   CODTIPRECDES: string;
                                                                   CODALTERADOR: Double ): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT ' +
          ' B.DESCRICAO, ' +
          ' T.PERCENTUAL, ' +
          ' T.ORDEM, ' +
          ' T.TPIMPOSTO, ' +
          ' T.IDASSOCIACAO, ' +
          ' T.IDPESSOA, ' +
          ' T.RECPAG, ' +
          ' T.CODTIPRECDES, ' +
          ' T.CODALTERADOR, ' +
          ' T.TRGDTINCLUSAO, ' +
          ' T.TRGUSERINCLUSAO ' +
          ' FROM TIPORECDESEMBXALTERADOR T INNER JOIN TIPOALTERADOR B ON ( B.CODALTERADOR = T.CODALTERADOR) ';
  {}
  if IDASSOCIACAO > 0 then
    ssql := ssql +
          ' WHERE (T.IDASSOCIACAO = ' + inttostr( IDASSOCIACAO ) + ') '
  else begin
    ssql := ssql +
          ' WHERE (T.IDPESSOA = ' + inttostr( IDPESSOA ) + ') ' ;
    {}
    If trim(RECPAG) <> '' Then
      ssql := ssql + ' AND (T.RECPAG  = ' + Quotedstr( trim( RECPAG ) ) + ') ';
    {}
    If trim(CODTIPRECDES) <> '' Then
      ssql := ssql + ' AND (T.CODTIPRECDES  = ' + Quotedstr( trim( CODTIPRECDES ) ) + ') ';
    {}
    If CODALTERADOR > 0 Then
      ssql := ssql + ' AND (T.CODALTERADOR  = ' + FloatToStr( CODALTERADOR ) + ') ';
    {}
    ssql := ssql + ' ORDER BY T.ORDEM ';
  end;

  Result := GetDataPacket(ssql);
  
End;


Procedure TCtrlTipoRecDesembxAlterador.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;


Function TCtrlTipoRecDesembxAlterador.ListParamCap(idpessoa: double; sRecPag: string): TStringList;
var
  sSql: string;
  oSql : TWWquery;

Begin
  // Propósito : Recuperar os valores relacionados em Paramcap
  try
    try
      Result := tstringlist.create;
      sSql := '';

      oSql := TwwQuery.Create(Nil);
      oSql.DatabaseName := 'BaseDados';
      sSql := 'SELECT ' +
              '   P.VLRMINIRRF, ' +
              '   P.VLRMINCS,   ' +
              '   P.VLRBASEINSS ' +
              'FROM ' +
              '   PARAMCAP P ' +
              'WHERE ' +
              '     P.RECPAG = ' + QuotedStr(sRecPag) +
              ' AND P.IDPESSOA = ' + FloatToStr(IdPessoa);

      oSql.SQL.Text := sSql;
      oSql.Open;

      Result.add(oSql.fieldbyname('VLRMINIRRF').AsString);
      Result.add(oSql.fieldbyname('VLRMINCS').AsString);
      oSql.Close;
    except
      on e:exception do
      begin
        Result := Nil;
        raise exception.create('Falha ao tentar recuperar os parametros para retenção de Impostos! ' + #10#13 + e.message);
      end;

    end;
  Finally
    FreeAndNil(oSql);
  End;
End;


(*****************************************************************************)

Procedure TCtrlTipoRecDesembxAlterador.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs( Self );
  _Padroes.OpenTransaction := false;
End;


Procedure TCtrlTipoRecDesembxAlterador.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;


(*-----------------------------------------------------------------------------
function TCtrlTipoRecDesembxAlterador.TipoDesembObrigaCota(idpessoa: integer;
  srecpag, codtiprecdes: string): boolean;
var
  sSQL: string;
  cdsObrigaCota: TClientDataSet;
begin
  try
    try
       Result := False;

       cdsObrigaCota := TClientDataSet.Create(nil);

       sSQL :=
         'SELECT FLGOBRQTDECOTAS ' +
         'FROM TipoRecDesembxAlterador ' +
         'WHERE IDPESSOA = ' + IntToStr(idpessoa) +
         '  AND RECPAG = ' + QuotedStr(srecpag) +
         '  AND CODTIPRECDES = ' + QuotedStr(codtiprecdes);

       cdsObrigaCota.Data := GetDataPacket(sSQL);

       Result := cdsObrigaCota.FieldByName('FLGOBRQTDECOTAS').AsString = 'S';

    except
       on e:exception do
       begin
         Result := False;
         raise exception.create('Falha ao verificar a obrigação de cotas ' + e.message);
       end;
    end
  finally
    FreeAndNil(cdsObrigaCota);
  end;
end;
------------------------------------------------------------------------------*)

function TCtrlTipoRecDesembxAlterador.PesqTipoRecDesembxAlterador(
  IDPESSOA: integer; RECPAG, CODTIPRECDES: string;
  CODALTERADOR: Double): Integer;

var
  ssql: string;
  oSql : TWWquery;

begin
  try
    try
      oSql := TwwQuery.Create(Nil);
      oSql.DatabaseName := 'BaseDados';

      // Pesquisa por select count
      ssql := 'SELECT COUNT(*) AS CONTAGEM' +
              ' FROM TIPORECDESEMBXALTERADOR T ' +
              ' WHERE (T.IDPESSOA = ' + inttostr( IDPESSOA ) + ') ' +
              '   AND (T.RECPAG  = ' + Quotedstr( trim( RECPAG ) ) + ') ' +
              '   AND (T.CODTIPRECDES  = ' + Quotedstr( trim( CODTIPRECDES ) ) + ') ';
      if CODALTERADOR <> 0 then
        ssql := ssql + '   AND (T.CODALTERADOR  = ' + FloatToStr( CODALTERADOR ) + ') ';
        {}
      oSql.SQL.Text := sSql;
      oSql.Open;

      Result := oSql.FieldByName('CONTAGEM').AsInteger;
      oSql.Close;
    except
       on e:exception do
       begin
         Result := 0;
         raise exception.create('Falha ao contar Tipos de desembolso x alteradores! ' + #10#13 + e.message);
       end;
    end;
  finally
    FreeAndNil(oSql);
  end;

end;

function TCtrlTipoRecDesembxAlterador.Pesq2TipoRecDesembxAlterador(
  IDPESSOA: integer; RECPAG, CODTIPRECDES: string;
  CODALTERADOR: Double): Integer;
var
  ssql: string;
  cdsContagem: TClientDataSet;

begin
  try
    cdsContagem := TClientDataSet.Create(Nil);

    // Pesquisa por select count
    ssql := 'SELECT T.IDASSOCIACAO AS IDASSOCIACAO' +
            ' FROM TIPORECDESEMBXALTERADOR T ' +
            ' WHERE (T.IDPESSOA = ' + inttostr( IDPESSOA ) + ') ' +
            '   AND (T.RECPAG  = ' + Quotedstr( trim( RECPAG ) ) + ') ' +
            '   AND (T.CODTIPRECDES  = ' + Quotedstr( trim( CODTIPRECDES ) ) + ') ' +
            '   AND (T.CODALTERADOR  = ' + FloatToStr( CODALTERADOR ) + ') ';
      {}
    cdsContagem.Data := GetDataPacket(ssql);

    Result := cdsContagem.FieldByName('IDASSOCIACAO').AsInteger;
  finally
    FreeAndNil(cdsContagem);
  end;


end;

function TCtrlTipoRecDesembxAlterador.DelTipoRecDesembxAlterador(
  IDASSOCIACAO: Integer): Boolean;
var
  ssql: string;

begin
  try

    ssql := 'DELETE ' +
            ' FROM TIPORECDESEMBXALTERADOR T ' +
            ' WHERE (T.IDASSOCIACAO = ' + inttostr( IDASSOCIACAO ) + ')';
    {}
    ExecSQL(ssql);
    {}
  finally
    Result := True;
  end;
end;

function TCtrlTipoRecDesembxAlterador.VarreOperacoesMes(IDROOTCNPJ: string;
  IDMES, IDANO: string; IDOPERACAO: Integer;
  const TipoBusca : tTipoBusca; // Edilaine - SOL 179108 / KTN 1654527
  const codDocumento : string   // Edilaine - SOL 179108 / KTN 1654527
  ): OleVariant;
var
  SSQl: string;

begin
  // Recupera os pagamentos em haver/ realizados para determinado cnpj em dado período
  SSQl := 'SELECT DISTINCT ' +  // Edilaine - SOL 179108 / KTN 1654527
          '       A.VALOR, ' +  // Edilaine - SOL 179108 / KTN 1654527
          '       A.DATALANCTO, ';
          // Edilaine - SOL 179108 / KTN 1654527
          if TipoBusca = tbDtLancamento then
          begin
            SSQl := SSQl +
            '       SUBSTR( TO_CHAR( A.DATALANCTO,''DD-MM-YYYY HH:MI:SS''),4,2) AS MESLANC, ' +
            '       SUBSTR( TO_CHAR( A.DATALANCTO,''DD-MM-YYYY HH:MI:SS''),7,4) AS ANOLANC, ';
          end
          else
          begin
            SSQl := SSQl +
            '       SUBSTR( TO_CHAR( D.DATAVENCTO,''DD-MM-YYYY HH:MI:SS''),4,2) AS MESLANC, ' +
            '       SUBSTR( TO_CHAR( D.DATAVENCTO,''DD-MM-YYYY HH:MI:SS''),7,4) AS ANOLANC, ';
          end;
          // Edilaine - SOL 179108 / KTN 1654527 - fim
  SSQl := SSQl +
          '       A.CODDOCUMENTO, ' +
          '       A.OPERACAO, ' +
          '       D.IDFORCLI, ' +
          '       P.NOME, ' +
          '       P.NUMDOCUMENTO, ' +
          '       D.NODOCUMENTO, ' +
          '       D.COMPLDOCUMENTO, ' +
          '       NVL(C.TPIMPOSTO, ''None'' ) AS TPIMPOSTO ' +
          '  FROM CM.LANCTODOCUM A INNER JOIN DOCUMENTO D ON D.CODDOCUMENTO = A.CODDOCUMENTO '  +
          '                        INNER JOIN PESSOA P    ON P.IDPESSOA = D.IDFORCLI ' +
          '                        LEFT OUTER JOIN TIPORECDESEMBXALTERADOR C ON C.CODALTERADOR = A.CODALTERADOR ' +
          '  WHERE SUBSTR( P.NUMDOCUMENTO,1,8) = ' + QuotedStr( IDROOTCNPJ );
          // Edilaine - SOL 179108 / KTN 1654527
          if TipoBusca = tbDtLancamento then
          begin
            SSQl := SSQl +
            '    AND SUBSTR( TO_CHAR( TRUNC( A.DATALANCTO, ''MM'' ),  ''DD-MM-YYYY HH:MI:SS''),4,2) = ' + IDMES +
            '    AND SUBSTR( TO_CHAR( TRUNC( A.DATALANCTO, ''YYYY''), ''DD-MM-YYYY HH:MI:SS''),7,4) = ' + IDANO;
          end
          else
          begin
            SSQl := SSQl +
            '    AND SUBSTR( TO_CHAR( TRUNC( D.DATAVENCTO, ''MM'' ),  ''DD-MM-YYYY HH:MI:SS''),4,2) = ' + IDMES +
            '    AND SUBSTR( TO_CHAR( TRUNC( D.DATAVENCTO, ''YYYY''), ''DD-MM-YYYY HH:MI:SS''),7,4) = ' + IDANO;
          end;
          if CodDocumento <> '' then
             SSQl := SSQl + '    AND A.CODDOCUMENTO <> ' + CODDOCUMENTO;
          // Edilaine - SOL 179108 / KTN 1654527 - fim

  if IDOPERACAO <> 0 then
  begin
    SSQl := SSQl + '    AND A.OPERACAO = ' + IntToStr(IDOPERACAO);
  end;

  Result := GetDataPacket(ssql);

end;

function TCtrlTipoRecDesembxAlterador.InsereAlterador( p_coddocumento: Integer;
  p_numlancto: Int64;   // Edilaine - SOL 199641 / KTN 1921256
  p_datalancto: TDateTime; p_valor: Double;
  p_debcre, p_historicocompl: String;
  p_lotetransmissao, p_codtipdoc: Integer; p_vlrliquido: Double; p_numfatura,
  p_flgtipofatura, p_flgfatemitida, p_numrecibo: String;
  p_unidnegoc, p_numlotemanual: Integer; p_numnf,
  p_flgrecebeunf: String; p_idmotivocancfat: Integer;
  p_flglancbaixaadto, p_flglancbaixa, p_flgcontabiliza: String;
  p_idenviodocumento,
  p_IDPESSOA: integer; p_OPERACAO: string; P_CODALTERADOR: Double): Boolean;

Var
  SSql: string;
  bInTrans : boolean;   {SOL:189816 KTN:1793898 JRM6}
begin
  try
    bInTrans := inTransaction;  {SOL:189816 KTN:1793898 JRM6}

    // Edilaine - SOL 179108 / KTN 1654527
    if not bInTrans then     {SOL:189816 KTN:1793898 JRM6}
       StartTransaction;

    p_numlancto := GetSequence('LANCTODOCUM');
    {}
    p_coddocumento := p_coddocumento - 1;
    {}
    SSql := 'INSERT INTO LANCTODOCUM ' +
            ' ( coddocumento, numlancto, datalancto, valor, ' + #13#10 +        //  4
            '   debcre, operacao, historicocompl,  ' + #13#10;                  //  7

    if p_codtipdoc <> 0 then
      SSql := SSql + 'codtipdoc,';                                              //  8

    SSql := SSql + ' vlrliquido, numfatura,  flgfatemitida, ' + #13#10 +        //  10 ou 11
            '   numrecibo, idpessoa, ' + #13#10 +                               //  12 ou 13
            '   numnf, flglancbaixaadto, ' + #13#10 +                           //  14 ou 15
            '   flglancbaixa, flgcontabiliza, CODALTERADOR ) ' +                //  17 ou 18
            ' VALUES( ' +
                IntToStr(p_coddocumento) +', ' +              //  1
                IntToStr(p_numlancto) +', ' +                 //  2
                ' TO_DATE(' +
                QuotedStr(DateToStr(p_datalancto)) + ','+ QuotedStr('dd/mm/yyyy')+') ,' +     //  3
                StringReplace(FloatToStr(p_valor),',','.',[rfreplaceall]) + ', ' + #13#10 +   //  4

                QuotedStr(p_debcre) + ', ' +                  //  5
                QuotedStr(p_OPERACAO) + ', ' +                //  6
                QuotedStr(p_historicocompl) + ', ';          //  7
                // IntToStr( p_lotetransmissao )+', '+#13#10+

        if p_codtipdoc <> 0 then
          SSql := SSql + IntToStr( p_codtipdoc ) + ', ';              //  8

        SSql := SSql +
                StringReplace(FloatToStr(p_vlrliquido),',','.',[rfreplaceall]) + ', ' +             //  8 ou 9
                QuotedStr(p_numfatura) + ', ' +               //  9/10
                // QuotedStr( p_flgtipofatura ) + ', ' +
                QuotedStr(p_flgfatemitida ) + ', ' + #13#10 + //  10/11

                QuotedStr(p_numrecibo) + ', ' +               //  11/12
                // IntToStr( p_unidnegoc ) + ', ' +
                IntToStr( p_IDPESSOA ) + ', ' +               //  12/13
                // IntToStr( p_numlotemanual ) + ', ' + #13#10 +

                QuotedStr( p_numnf ) + ', ' +                 //  13/14
                // IntToStr( p_idmotivocancfat ) + ', '+
                QuotedStr( p_flglancbaixaadto ) + ', '+#13#10+//  14/15

                QuotedStr( p_flglancbaixa ) + ', ' +          //  15/16
                QuotedStr( p_flgcontabiliza ) + ', '+         //  16/17
                floatToStr( P_CODALTERADOR ) + ') ';          //  17/18

    if p_coddocumento = 0 then
    begin
      if p_numlancto <> 0 then
      begin
        //  Faz o contrário (busca o valor para p_coddocumento pelo numlancto.
        p_coddocumento := PegaCodDocum( p_numlancto )
      end;
    end;

    ExecSQL(ssql);
  //finally    // Edilaine - SOL 179108 / KTN 1654527 - COMENTADO

    if not bInTrans then     {SOL:189816 KTN:1793898 JRM6}
       Commit;  // Edilaine - SOL 179108 / KTN 1654527
    Result := True;
  Except
    On E:Exception Do
    Begin
       Result := False;
       if not bInTrans then     {SOL:189816 KTN:1793898 JRM6}
          Rollback;
       MessageInfo := E.Message;
    End;
  end;
  // Edilaine - SOL 179108 / KTN 1654527 - FIM
end;


function TCtrlTipoRecDesembxAlterador.PegaNumlancto(
  p_coddocumento: Integer): Integer;
var sSql: String;
    oSql: TClientDataSet;

begin
  //  Recupera o valor de NUMLANCTO ATRAVÉS DE P_CODDOCUMENTO
  try
    oSql := TClientDataSet.Create(Nil);

    // Pesquisa por select exato
    ssql := 'SELECT T.NUMLANCTO AS NUMLANCTO' +
            ' FROM LANCTODOCUM T ' +
            ' WHERE (T.CODDOCUMENTO = ' + inttostr( p_coddocumento ) + ') ';
      {}
    oSql.Data := GetDataPacket(ssql);

    Result := oSql.FieldByName('NUMLANCTO').AsInteger;
  finally
    FreeAndNil(oSql);
  end;
end;

function TCtrlTipoRecDesembxAlterador.PegaCodDocum(
  p_numlancto: Integer): Integer;
var sSql: String;
    oSql: TClientDataSet;

begin
  //  Recupera o valor de P_CODDOCUMENTO ATRAVÉS DE NUMLANCTO
  try
    oSql := TClientDataSet.Create(Nil);

    // Pesquisa por select exato
    ssql := 'SELECT T.CODDOCUMENTO AS CODDOCUMENTO' +
            ' FROM LANCTODOCUM T ' +
            ' WHERE (T.NUMLANCTO = ' + inttostr( p_numlancto ) + ') ';
      {}
    oSql.Data := GetDataPacket(ssql);

    Result := oSql.FieldByName('CODDOCUMENTO').AsInteger;
  finally
    FreeAndNil(oSql);
  end;
end;

function TCtrlTipoRecDesembxAlterador.BuscaDocCliente(
  IdPessoa: Integer ): string;

var sSql: String;
    oSql: TClientDataSet;

begin
  //  Recupera o valor de Numdocumento Através de idpessoa
  try
    oSql := TClientDataSet.Create(Nil);

    // Pesquisa por select exato
    ssql := 'SELECT P.NUMDOCUMENTO AS NUMDOCUMENTO' +
            ' FROM PESSOA P ' +
            ' WHERE (P.IDPESSOA = ' + inttostr( idPessoa ) + ') ';
      {}
    oSql.Data := GetDataPacket(ssql);

    Result := oSql.FieldByName('NUMDOCUMENTO').AsString;
  finally
    FreeAndNil(oSql);
  end;

end;

function TCtrlTipoRecDesembxAlterador.ProcuraAlteradorLancado(
  p_coddocumento: Integer; p_historicocompl: String;
  P_CODALTERADOR: Double): String;

Var
  sSql: string;
  oSql: TClientDataSet;

begin
  try
    oSql   := TClientDataSet.Create(Nil);
    sSql   := '';
    Result := '';

    p_coddocumento := p_coddocumento - 1;
    sSql := 'SELECT A.CODDOCUMENTO, A.NUMLANCTO, A.VALOR ' +
            '  FROM LANCTODOCUM A ' +
            ' WHERE A.CODDOCUMENTO   = ' + IntToStr(p_coddocumento) +
            '   AND A.HISTORICOCOMPL = ' + QuotedStr(p_historicocompl) +
            '   AND A.CODALTERADOR   = ' + floatToStr( P_CODALTERADOR );

    oSql.Data := GetDataPacket(sSql);

    if oSql.RecordCount > 0 then
    begin
      Result := oSql.FieldByName('CODDOCUMENTO').AsString + ',' +
                oSql.FieldByName('NUMLANCTO').AsString + ',' +
                oSql.FieldByName('VALOR').AsString;
    end;
    oSql.Close;
  finally
    FreeAndNil( oSql );
  end;

end;

function TCtrlTipoRecDesembxAlterador.AtualizaValorAlterador(
  p_coddocumento, p_numlancto: Integer; p_valor: Double): Boolean;
Var
  sSql: string;

begin
  {}
  try

    // Edilaine - SOL 179108 / KTN 1654527
    if not inTransaction then
       StartTransaction;
    // Edilaine - SOL 179108 / KTN 1654527 - FIM
  
    sSql   := '';
    Result := False;

    sSql := 'UPDATE LANCTODOCUM A SET A.VALOR = ' + StringReplace(FloatToStr(p_valor),',','.',[rfreplaceall]) + ', ' + #13#10 +
                                    ' A.VLRLIQUIDO = ' + StringReplace(FloatToStr(p_valor),',','.',[rfreplaceall]) + ' ' + #13#10 +
            ' WHERE A.CODDOCUMENTO  = ' + IntToStr(p_coddocumento) +
            '   AND A.NUMLANCTO     = ' + IntToStr(p_numlancto);

    ExecSQL(sSql);

  //finally      // Edilaine - SOL 179108 / KTN 1654527 - COMENTADO

  // Edilaine - SOL 179108 / KTN 1654527
    Commit;
    Result := True;
  Except
    On E:Exception Do
    Begin
       Result := False;
       Rollback;
       MessageInfo := E.Message;
    End;
  // Edilaine - SOL 179108 / KTN 1654527 - FIM
  end;
{}
end;

End.

