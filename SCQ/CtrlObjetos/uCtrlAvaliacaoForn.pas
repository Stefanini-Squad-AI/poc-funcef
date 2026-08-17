unit uCtrlAvaliacaoForn;

interface

Uses DB, uDataBase,Classes, uCmControlObject, dbclient,uCmDbObject,
     sysUtils, uMidasUtil, uCmTypes, FMTViewRestricao, FMTAvaliacao,
     uDbAvaliacao,uDbItemAvaliacao ;
Type

  TCtrlAvaliacaoForn = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
    _DbAvaliacao     : TDbAvaliacao;
    _DbItemAvaliacao : TDbItemAvaliacao;
    //
    FMostraRestricao: Boolean;
    FIdNFRecDev: Double;
    FIdForCli: Double;
    FIdPessoa: Double;
    FCodDocumento: String;
    FCodArtigo: String;
    FNumDocumento: String;
    FRecPag: String;
    FRazaoSocial: String;
    procedure SetCodArtigo(const Value: String);
    procedure SetCodDocumento(const Value: String);
    procedure SetIdForCli(const Value: Double);
    procedure SetIdNFRecDev(const Value: Double);
    procedure SetIdPessoa(const Value: Double);
    procedure SetMostraRestricao(const Value: Boolean);
    procedure SetNumDocumento(const Value: String);
    procedure SetRazaoSocial(const Value: String);
    procedure SetRecPag(const Value: String);

  Public
     Property IdForCli         : Double read FIdForCli write SetIdForCli;                // Chave da Tabela do Fornencedor
     Property IdNFRecDev       : Double read FIdNFRecDev write SetIdNFRecDev;            // Chave da Table de Nota do Almo0xarifado
     Property IdPessoa         : Double read FIdPessoa write SetIdPessoa;                // Empresa que está logada
     Property RazaoSocial      : String read FRazaoSocial write SetRazaoSocial;          // RazaoSocial do Fornecedor
     Property CodDocumento     : String read FCodDocumento write SetCodDocumento;        // Chave da Table de Nota do Contas a Pagar
     Property RecPag           : String read FRecPag write SetRecPag;                    // Indica se é a pagar ou a receber
     Property NumDocumento     : String read FNumDocumento write SetNumDocumento;        // Número do documento no Contas a Pagar
     Property CodArtigo        : String read FCodArtigo write SetCodArtigo;              // Código do artigo para mostrar suas restricoes
     Property MostraRestricao  : Boolean read FMostraRestricao write SetMostraRestricao; // Indica se mostra ou não a tela de restriçao
     //
     Constructor Create;  Override;
     Destructor  Destroy; Override;
     {**
        Verifica se a empresa possui esquema de Avaliação de fornecedor
     **}
     Function    PossuiAavaliacao(IdPessoa : Integer) : Boolean;
     {**
        Faz a coleta das notas do fornecedor segundo os critérios cadastrados
     **}
     Function   Executar  : Boolean;
     {**
        Mostra as restrições de um determinado produto
     **}
     Function    ViewRestricao : OleVariant;
     {**
        Fornece uma lista com os resultado da avaliação
     **}
     Function ListAvaliacao( IdAvaliacao : Double ) : OleVariant;
     {**
       Forneece uma lista com os resultado dos itens da avaliação
     **}
     Function ListItensAvaliacao( IdAvaliacao : Double ) : OleVariant;
     {**
       Fornece uma lista com os critérios de determinada avaliação
     **}
     Function ListCriterios : OleVariant;
     {**
        Fornece uma lista com os tipos de avaliação
     **}
     Function ListTipoAvaliacao : OleVariant;
     {**
        Grava a avaliação do fornecedor propriamente dita
     **}
     Function GravaAvaliacao( Avaliacao, ItemAvaliacao : OleVariant) : Boolean; 


  End;
implementation

{ TCtrlAvaliacaoForn }

constructor TCtrlAvaliacaoForn.Create;
begin
   Inherited Create;
   _DbAvaliacao     := TDbAvaliacao.Create(Self);
   _DbItemAvaliacao := TDbItemAvaliacao.Create(Self);

   FIdForCli         := -1;
   FIdNFRecDev       := -1;
   FIdPessoa         := -1;
   FRazaoSocial      := '';
   FCodDocumento     := '';
   FRecPag           := '';
   FNumDocumento     := '';
   FCodArtigo        := '';
   FMostraRestricao  := True;
end;

destructor TCtrlAvaliacaoForn.Destroy;
begin
   _DbAvaliacao.Free;
   _DbItemAvaliacao.Free;
end;

procedure TCtrlAvaliacaoForn.DoChangeDataBase;
begin
  inherited;
  _DbAvaliacao.DataBaseName     := DataBaseName;
  _DbItemAvaliacao.DataBaseName := DataBaseName;

end;

function TCtrlAvaliacaoForn.Executar: Boolean;
Var
   SQL           : TStringList;
   CdsAvali      : TClientDataSet;
   CdsItemAvali  : TClientDataSet;
begin
   Result       := True;
   
   SQL          := TStringList.Create;
   CdsAvali     := TClientDataSet.Create(nil);
   CdsItemAvali := TClientDataSet.Create(nil);
   Try
      If FIdNFRecDev < 0 Then
         Begin
            Sql.Clear;
            Sql.Add(' SELECT DISTINCT          ');
            Sql.Add('     TA.IDTIPOAVALIACAO,  ');
            Sql.Add('     TA.DESCTIPOAVALIACAO ');
            Sql.Add(' FROM                     ');
            Sql.Add('   TIPOAVALIACAO TA,      ');
            Sql.Add('   TIPORECEBDESEMB TD,    ');
            Sql.Add('   RATEIODOCUM RD         ');
            Sql.Add(' WHERE                    ');
            Sql.Add('      (RD.RECPAG = '''+Trim(FRecPag)+''') ');
            Sql.Add('  AND (RD.IDPESSOA = '+FloatToStr(FIdPessoa)+')   ');
            Sql.Add('  AND (RTRIM(RD.CODDOCUMENTO) = '''+Trim(FCodDocumento)+''') ');
            Sql.Add('  AND (RD.CODTIPRECDES = TD.CODTIPRECDES)       ');
            Sql.Add('  AND (RD.IDPESSOA = TD.IDPESSOA)               ');
            Sql.Add('  AND (RD.RECPAG = TD.RECPAG)                   ');
            Sql.Add('  AND (TA.IDTIPOAVALIACAO = TD.IDTIPOAVALIACAO) ');
            Sql.Add(' ORDER BY  TA.DESCTIPOAVALIACAO ');
         End
       Else
         Begin
            Sql.Clear;
            Sql.Add(' SELECT                   ');
            Sql.Add('     TA.IDTIPOAVALIACAO,  ');
            Sql.Add('     TA.DESCTIPOAVALIACAO ');
            Sql.Add(' FROM                     ');
            Sql.Add('   TIPOAVALIACAO TA,      ');
            Sql.Add('   TIPORECEBDESEMB TD,    ');
            Sql.Add('   ITENSRECEBDEVOL NF     ');
            Sql.Add(' WHERE                    ');
            Sql.Add('      (NF.RECPAG = '''+Trim(FRecPag)+''') ');
            Sql.Add('  AND (NF.IDPESSOA = '+FloatToStr(FIdPessoa)+')   ');
            Sql.Add('  AND (NF.IDNFRECEBDEVOL = '+FloatToStr(FIdNFRecDev)+') ');
            Sql.Add('  AND (NF.CODTIPRECDES = TD.CODTIPRECDES)       ');
            Sql.Add('  AND (NF.IDPESSOA = TD.IDPESSOA)               ');
            Sql.Add('  AND (NF.RECPAG = TD.RECPAG)                   ');
            Sql.Add('  AND (TA.IDTIPOAVALIACAO = TD.IDTIPOAVALIACAO) ');
            Sql.Add(' ORDER BY  TA.DESCTIPOAVALIACAO ');
         End;
         CdsAvali.Data     := ListAvaliacao(-1);
         CdsItemAvali.Data := ListItensAvaliacao(-1);

         FrmMTAvaliacao := TFrmMTAvaliacao.Create(nil);
         FrmMTAvaliacao.CdsTipo.Data  :=  GetDataPacket(SQL.Text );
         FrmMTAvaliacao.CdsCrit.Data  := ListCriterios;
         FrmMTAvaliacao.ds.DataSet    := CdsAvali;
         FrmMTAvaliacao.dsDet.DataSet := CdsItemAvali;

         FrmMTAvaliacao.ShowModal;
         If Not CdsAvali.IsEmpty Then
            Begin
               Result := GravaAvaliacao(CdsAvali.Data ,CdsItemAvali.Data );
               If Not Result Then
                  Exception.Create( MessageInfo );
            End;

   Finally
      SQL.Free;
      CdsAvali.Free;
      CdsItemAvali.Free;
      FrmMTAvaliacao.Free;
   End;
end;

function TCtrlAvaliacaoForn.GravaAvaliacao(Avaliacao,ItemAvaliacao: OleVariant): Boolean;
Var
  CdsAvaliacao     : TClientDataSet;
  CdsItemAvaliacao : TClientDataSet;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GravaAvaliacao(Avaliacao, ItemAvaliacao);
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         CdsAvaliacao     := TClientDataSet.Create(nil);
         CdsItemAvaliacao := TClientDataSet.Create(nil);
         Try
            Try
               StartTransaction;

               Result := ApplyCds( CdsAvaliacao , _DbAvaliacao, [], [] );
               If Not Result Then Raise Exception.Create( _DbAvaliacao.MessageInfo );

               Result := ApplyCds( CdsItemAvaliacao , _DbItemAvaliacao, [_DbAvaliacao.IdAvaliacao], [_DbItemAvaliacao.IdAvaliacao] );
               If Not Result Then Raise Exception.Create( _DbItemAvaliacao.MessageInfo );

               Commit;
            except
               On E:Exception Do
                Begin
                   Rollback;
                   Result := False;
                   MessageInfo := E.Message;
                End;
            End;
         Finally
            CdsAvaliacao.Free;
            CdsItemAvaliacao.Free;
         End;
      End;
end;

function TCtrlAvaliacaoForn.ListAvaliacao(IdAvaliacao: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT IDAVALIACAO, IDNFRECEBDEVOL, CODDOCUMENTO, NOTA '+
          ' FROM AVALIACAO WHERE  (IDAVALIACAO = '+FloatToStr(IdAvaliacao)+') ';

   Result := GetDataPacket(SQL);
end;

function TCtrlAvaliacaoForn.ListCriterios: OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT IDTIPOAVALIACAO,IDCRITAVALIACAO, DESCCRITAVALIACAO, '+
          ' PESO,  (10) AS NOTA '+
          ' FROM CRITAVALIACAO ORDER BY DESCCRITAVALIACAO';

   Result := GetDataPacket(SQL);

end;

function TCtrlAvaliacaoForn.ListItensAvaliacao(
  IdAvaliacao: Double): OleVariant;
Var
   SQL : String;
Begin
   SQL := ' SELECT IDAVALIACAO, IDCRITAVALIACAO, PESO, NOTA  '+
          ' FROM ITEMAVALIACAO  WHERE (IDAVALIACAO = '+FloatToStr(IdAvaliacao)+') ';

   Result := GetDataPacket(SQL);
end;

function TCtrlAvaliacaoForn.ListTipoAvaliacao: OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT DISTINCT TA.IDTIPOAVALIACAO, TA.DESCTIPOAVALIACAO '+
          ' FROM TIPOAVALIACAO TA ORDER BY TA.DESCTIPOAVALIACAO ';

   Result := GetDataPacket(SQL);
end;

procedure TCtrlAvaliacaoForn.OnCreateAppServer;
begin
  inherited;

end;

function TCtrlAvaliacaoForn.PossuiAavaliacao(IdPessoa: Integer): Boolean;
Var
  SQL : String;
begin
  SQL := ' SELECT NUMAVALI FROM PARAMSCQ '+
         ' WHERE (IDPESSOA = '+IntToStr(IdPessoa)+')';

  _Cds.Data := GetDataPacket(SQL);

  Result :=  _Cds.FieldByName('NUMAVALI').AsInteger > 0;
end;

procedure TCtrlAvaliacaoForn.SetCodArtigo(const Value: String);
begin
  FCodArtigo := Value;
end;

procedure TCtrlAvaliacaoForn.SetCodDocumento(const Value: String);
begin
  FCodDocumento := Value;
end;

procedure TCtrlAvaliacaoForn.SetIdForCli(const Value: Double);
begin
  FIdForCli := Value;
end;

procedure TCtrlAvaliacaoForn.SetIdNFRecDev(const Value: Double);
begin
  FIdNFRecDev := Value;
end;

procedure TCtrlAvaliacaoForn.SetIdPessoa(const Value: Double);
begin
  FIdPessoa := Value;
end;

procedure TCtrlAvaliacaoForn.SetMostraRestricao(const Value: Boolean);
begin
  FMostraRestricao := Value;
end;

procedure TCtrlAvaliacaoForn.SetNumDocumento(const Value: String);
begin
  FNumDocumento := Value;
end;

procedure TCtrlAvaliacaoForn.SetRazaoSocial(const Value: String);
begin
  FRazaoSocial := Value;
end;

procedure TCtrlAvaliacaoForn.SetRecPag(const Value: String);
begin
  FRecPag := Value;
end;

function TCtrlAvaliacaoForn.ViewRestricao: OleVariant;
Var
   SQL : String;
begin
   If FCodArtigo <> '' then
      FCodArtigo := Copy(FCodArtigo+'                 ',1,14);
   Try
      Sql:= ' SELECT            '+
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
            '       (R.IDFORCLI = '+FloatToStr(FIdForCli)+') '+
            '   AND (R.IDPESSOA = '+FloatToStr(FIdPessoa)+') ';

       If FCodArtigo <> '' then
          Sql := Sql+'   AND ((R.CODARTIGO = '''+FCodArtigo+''') OR (R.CODARTIGO IS NULL))';

       Sql := Sql+'   AND (R.DATAFIM IS NULL)'+
                  '   AND (R.CODARTIGO = A.CODARTIGO(+)) '+
                  '   AND (A.CODPRODUTO = P.CODPRODUTO(+)) ';

      _Cds.Data := GetDataPacket(SQL);

      Result := _Cds.Data;
            
      If Not _Cds.IsEmpty Then
         Begin
            if FMostraRestricao then
               Begin
                  FrmMTViewRestricao := TFrmMTViewRestricao.Create(nil);
                  FrmMTViewRestricao.Cds.Data := _Cds.Data;
                  FrmMTViewRestricao.edForn.Text := FRazaoSocial; 
                  FrmMTViewRestricao.ShowModal;
               end;
         End;
   Finally
      FrmMTViewRestricao.Free;
   End;
end;

end.

