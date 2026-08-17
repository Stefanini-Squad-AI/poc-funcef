unit uAvaliForn2;

interface
uses SysUtils,Forms,Classes,Wwquery,dbtables,db,uString;

type TAvaliForn = Class
   private
          _IdForCli        : LongInt;     // Chave da Tabela do Fornencedor
          _IdNFRecDev      : LongInt;     // Chave da Table de Nota do Almoxarifado
          _IdPessoa        : LongInt;     // Empresa que está logada
          _RazaoSocial     : String;      // RazaoSocial do Fornecedor
          _CodDocumento    : String;      // Chave da Table de Nota do Contas a Pagar
          _RecPag          : String;      // Indica se é a pagar ou a receber
          _NumDocumento    : String;      // Número do documento no Contas a Pagar
          _CodArtigo       : String;      // Código do artigo para mostrar suas restricoes
          _MostraRestricao : Boolean;     // Indica se mostra ou não a tela de restriçao
   public
         // Atributos
         Property IdForCli         : LongInt    Read _IdForCli        Write _IdForCli;
         Property IdNFRecDev       : LongInt    Read _IdNFRecDev      Write _IdNFRecDev;
         Property IdPessoa         : LongInt    Read _IdPessoa        Write _IdPessoa;
         Property RazaoSocial      : String     Read _RazaoSocial     Write _RazaoSocial;
         Property CodDocumento     : String     Read _CodDocumento    Write _CodDocumento;
         Property RecPag           : String     Read _RecPag          Write _RecPag;
         Property NumDocumento     : String     Read _NumDocumento    Write _NumDocumento;
         Property CodArtigo        : String     Read _CodArtigo       Write _CodArtigo;
         Property MostraRestricao  : Boolean    Read _MostraRestricao Write _MostraRestricao;

         // Mensagens
         Constructor Create;
         Function    Executar      : Boolean;
         Function    ViewRestricao : TwwQuery;
   end;
Var
    AvaliForn : TAvaliForn;

implementation

Uses FAvaliacao, DBaseDados,uDataBase, FViewRestricao;

Constructor TAvaliForn.Create;
Begin
   Inherited Create;
   _IdForCli         := -1;
   _IdNFRecDev       := -1;
   _IdPessoa         := -1;
   _RazaoSocial      := '';
   _CodDocumento     := '';
   _RecPag           := '';
   _NumDocumento     := '';
   _CodArtigo        := '';
   _MostraRestricao  := True;
End;

Function TAvaliForn.Executar : Boolean;
Begin
   Result := False;
   If FazQuery(DtmBaseDados.qry,'SELECT NUMAVALI FROM PARAMSCQ WHERE (IDPESSOA = '+IntToStr(_IdPessoa)+')')
   Then
      Begin
          if (DtmBaseDados.qry.FieldByName('NUMAVALI').asInteger > 0) and ( Not DtmBaseDados.qry.FieldByName('NUMAVALI').IsNull) Then
             Begin
                 Try
                    Application.CreateForm(TfrmAvaliacao, frmAvaliacao);
                    FrmAvaliacao.sNomeForn     := _RazaoSocial;
                    FrmAvaliacao.sNota         := _CodDocumento;
                    FrmAvaliacao.sNumDocumento := _NumDocumento;
                    FrmAvaliacao.iIDPessoa     := _IdPessoa;
                    FrmAvaliacao.iIdNfRecDev   := _IdNFRecDev;
                    FrmAvaliacao.sRecPag       := _RecPag;

                    if _IdNFRecDev < 0 Then
                      Begin
                         FrmAvaliacao.qryTipo.Close;
                         FrmAvaliacao.qryTipo.Sql.Clear;
                         FrmAvaliacao.qryTipo.Sql.Add(' SELECT DISTINCT          ');
                         FrmAvaliacao.qryTipo.Sql.Add('     TA.IDTIPOAVALIACAO,  ');
                         FrmAvaliacao.qryTipo.Sql.Add('     TA.DESCTIPOAVALIACAO ');
                         FrmAvaliacao.qryTipo.Sql.Add(' FROM                     ');
                         FrmAvaliacao.qryTipo.Sql.Add('   TIPOAVALIACAO TA,      ');
                         FrmAvaliacao.qryTipo.Sql.Add('   TIPORECEBDESEMB TD,    ');
                         FrmAvaliacao.qryTipo.Sql.Add('   RATEIODOCUM RD         ');
                         FrmAvaliacao.qryTipo.Sql.Add(' WHERE                    ');
                         FrmAvaliacao.qryTipo.Sql.Add('      (RD.RECPAG = '''+Trim(_RecPag)+''') ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (RD.IDPESSOA = '+IntToStr(_IdPessoa)+')   ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (RTRIM(RD.CODDOCUMENTO) = '''+Trim(_CodDocumento)+''') ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (RD.CODTIPRECDES = TD.CODTIPRECDES)       ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (RD.IDPESSOA = TD.IDPESSOA)               ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (RD.RECPAG = TD.RECPAG)                   ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (TA.IDTIPOAVALIACAO = TD.IDTIPOAVALIACAO) ');
                         FrmAvaliacao.qryTipo.Sql.Add(' ORDER BY  TA.DESCTIPOAVALIACAO ');
                      End
                    Else
                      Begin
                         FrmAvaliacao.qryTipo.Close;
                         FrmAvaliacao.qryTipo.Sql.Clear;
                         FrmAvaliacao.qryTipo.Sql.Add(' SELECT                   ');
                         FrmAvaliacao.qryTipo.Sql.Add('     TA.IDTIPOAVALIACAO,  ');
                         FrmAvaliacao.qryTipo.Sql.Add('     TA.DESCTIPOAVALIACAO ');
                         FrmAvaliacao.qryTipo.Sql.Add(' FROM                     ');
                         FrmAvaliacao.qryTipo.Sql.Add('   TIPOAVALIACAO TA,      ');
                         FrmAvaliacao.qryTipo.Sql.Add('   TIPORECEBDESEMB TD,    ');
                         FrmAvaliacao.qryTipo.Sql.Add('   ITENSRECEBDEVOL NF     ');
                         FrmAvaliacao.qryTipo.Sql.Add(' WHERE                    ');
                         FrmAvaliacao.qryTipo.Sql.Add('      (NF.RECPAG = '''+Trim(_RecPag)+''') ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (NF.IDPESSOA = '+IntToStr(_IdPessoa)+')   ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (NF.IDNFRECEBDEVOL = '+IntToStr(_IdNFRecDev)+') ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (NF.CODTIPRECDES = TD.CODTIPRECDES)       ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (NF.IDPESSOA = TD.IDPESSOA)               ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (NF.RECPAG = TD.RECPAG)                   ');
                         FrmAvaliacao.qryTipo.Sql.Add('  AND (TA.IDTIPOAVALIACAO = TD.IDTIPOAVALIACAO) ');
                         FrmAvaliacao.qryTipo.Sql.Add(' ORDER BY  TA.DESCTIPOAVALIACAO ');
                      End;

                    FrmAvaliacao.qryCrit.Open;
                    FrmAvaliacao.qryTipo.Open;

                    If Not FrmAvaliacao.qryTipo.isEmpty Then
                       FrmAvaliacao.ShowModal;

                    If FrmAvaliacao.qryCrit.Active Then
                       FrmAvaliacao.qryCrit.Close;

                    If FrmAvaliacao.qryTipo.Active Then
                       FrmAvaliacao.qryTipo.Close;

                    Result := True;
                 Finally
                    frmAvaliacao.Free;
                 End;
             End
          Else
            Result := False;
      End;
End;

Function TAvaliForn.ViewRestricao : TwwQuery;
var sSql:String;
Begin
    Result := nil;
    if _CodArtigo <> '' then
       _CodArtigo := Espaco(trim(_CodArtigo),14);

    Try
       sSql:=      ' SELECT            '+
                   '       R.CODARTIGO,'+
                   '       (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO,'+
                   '       R.DATAINI,     '+
                   '       R.DATAFIM,     '+
                   '       R.FLGFLEXIVEL, '+
                   '       DECODE(R.FLGFLEXIVEL,''S'',''SIM'',''NÃO'') AS FLEXIVEL, '+
                   '       R.MOTIVO    '+
                   ' FROM              '+
                   '      RESTRICAO R, '+
                   '      ARTIGO A,    '+
                   '      PRODUTO P    '+
                   ' WHERE '+
                   '       (R.IDFORCLI = '+IntToStr(_IdForCli)+') '+
                   '   AND (R.IDPESSOA = '+IntToStr(_IdPessoa)+') ';
        if _CodArtigo <> '' then
           sSql:=sSql+'   AND ((R.CODARTIGO = '''+_CodArtigo+''') OR (R.CODARTIGO IS NULL))';
        sSql:=sSql+'   AND (R.DATAFIM IS NULL)'+
                   '   AND (R.CODARTIGO = A.CODARTIGO(+)) '+
                   '   AND (A.CODPRODUTO = P.CODPRODUTO(+)) ';
       If FazQuery(DtmBaseDados.qry,sSql) Then
         Begin
             Result := DtmBaseDados.qry;
             if _MostraRestricao then
                Begin
                   Application.CreateForm(TFrmViewRestricao, FrmViewRestricao);
                   FrmViewRestricao.ShowModal;
                end;
         End
       Else
         Result := nil;
    Except
        Result := nil;
        Raise;
    End;
end;


end.
{

 SELECT
       R.CODARTIGO,
       (P.DESCPROD || ' ' || A.CODCOR || ' ' || A.CODTAMANHO ) AS DESCRICAO,
       R.DATAINI,
       R.DATAFIM,
       R.FLGFLEXIVEL,
       DECODE(R.FLGFLEXIVEL,'S','SIM','NÃO') AS FLEXIVEL,
       R.MOTIVO
 FROM
      RESTRICAO R,
      ARTIGO A,
      PRODUTO P
 WHERE
       (R.IDFORCLI = 71)
   AND (R.IDPESSOA = 1)
   AND ((R.CODARTIGO = 'ABACAT') OR (R.CODARTIGO IS NULL))
   AND (R.DATAFIM IS NULL)
   AND (R.CODARTIGO = A.CODARTIGO(+))
   AND (A.CODPRODUTO = P.CODPRODUTO(+))
 }
