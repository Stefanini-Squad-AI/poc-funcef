unit uCtrlGeraCapPis;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uDbNfLivro, uDbNfLivroDetalhe, uCtrlTerceiros, uCtrlTipoAltxImpostos,
     uCtrlApuracaoPis, DBaseDados, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlGeraCApPis = Class(TCmControlObject)
    private
      ApuracaoPis : TCtrlApuracaoPis;

      //Cds a serem utilizados
      CdsPis: TClientDataSet;
      CdsAux : TClientDataSet;
      procedure CarregaCdsLimpo;
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      {Faz a geração do livro}
      function GeraLivroPis(cdsLancamentos : OleVariant; IdEmpresa : LongInt; CodModelo : string) : Boolean;
      {Lista os lançamentos do CAP - CAP - pertence ao Clementino e ao Vampeta}
      function ListLancamentosCAP(IdEmpresa : LongInt; DataIni, DataFim, CodTipodoc : string) : OleVariant;
      {Lista os tipos de documento do CAP - CAP}
      function ListTipoDocumento : OleVariant;
      {Paga o códgio de ICMS de entrada dos parametros do livro}
      function PegaCodTipoCustAgreg(IdEmpresa : LongInt) : integer;
      function ListAgradosRecDevPis(IdNfRecebeDevol : LongInt) : OleVariant;

    protected

    End;

implementation

{ TCtrlGeraCApPis }


procedure TCtrlGeraCApPis.AfterInitialize;
begin
  inherited;
  ApuracaoPis.InitializeAs(self);
  ApuracaoPis.OpenTransaction  := false;
end;

procedure TCtrlGeraCApPis.CarregaCdsLimpo;
Var
   Ssql : string;
begin
  //Traz apenas a estrutura da tabela
  Ssql := 'SELECT * FROM APURACAOPIS WHERE (1 = 2)';
  CdsPis.data := GetDataPacket(Ssql);
end;

constructor TCtrlGeraCApPis.Create;
begin
  inherited;
  //cria livro
  ApuracaoPis := TCtrlApuracaoPis.Create;
  CdsPis      := TClientDataSet.Create(nil);
  CdsAux      := TClientDataSet.Create(nil);

  //Liga meus cds aos da classe de negócio
  ApuracaoPis.CdsApuracaoPIS := CdsPis;
  //Seta os providers para os cds
end;

destructor TCtrlGeraCApPis.Destroy;
begin
  inherited;
  CdsAux.free;
  CdsPis.free;
  ApuracaoPis.free;
end;

procedure TCtrlGeraCApPis.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlGeraCApPis.GeraLivroPis(cdsLancamentos : OleVariant; IdEmpresa : LongInt; CodModelo : string) : Boolean;
Var
  iCodCodTipoCustAgreg : LongInt;
  Ssql : string;
begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.GeraLivroPis(cdsLancamentos, IdEmpresa, CodModelo);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    Begin
      Try
        StartTransaction;
        _Cds.data := cdsLancamentos;
        Result := True;
        iCodCodTipoCustAgreg := PegaCodTipoCustAgreg(IdEmpresa);
        _Cds.first;
        while not _Cds.eof do
          Begin
            //Inclui Livro
            CarregaCdsLimpo;
            CdsPis.Append;
            CdsPis.fieldByname('IDFORCLI').Asinteger       := _Cds.fieldByname('IdForCli').AsInteger;
            CdsPis.fieldByname('NUMNOTA').AsInteger        := _Cds.fieldByname('NODOCUMENTO').Asinteger;
            CdsPis.fieldByname('NUMNOTAFINAL').AsInteger   := _Cds.fieldByname('NODOCUMENTO').Asinteger;
            CdsPis.fieldByname('COMPLEMENTO').Asstring     := _Cds.fieldByname('COMPLDOCUMENTO').AsString;
            CdsPis.fieldByname('DATAEMISSAONF').AsDateTime := _Cds.fieldByname('DATAEMISSAO').AsDateTime;
            CdsPis.fieldByname('DATALANCTO').AsDateTime    := _Cds.fieldByname('DATALANCTO').AsDateTime;
            CdsPis.fieldByname('VLRTOTAL').AsFloat         := _Cds.fieldByname('VLRBASE').AsFloat;
            CdsPis.fieldByname('CODMODELO').Asstring       := CodModelo;
            CdsPis.fieldByname('FLGENTRADASAIDA').Asstring := 'E';
            CdsPis.fieldByname('IDPESSOA').Asinteger       := IdEmpresa;
            CdsPis.fieldByname('ALIQUOTAPIS').AsFloat      := _Cds.fieldByname('PERCENTUAL').AsFloat;
            CdsPis.fieldByname('VALORPIS').AsFloat         := _Cds.fieldByname('VLRRETIDO').AsFloat;

            ApuracaoPis.CdsApuracaoPIS := CdsPis;
            if not ApuracaoPis.GravarApuracaoPIS then
               Raise Exception.Create(messageinfo);

            //informa que o livro já foi gerado para o lançamento corrente.
            Ssql := 'UPDATE LANCTODOCUM SET IDAPURACAOPIS = '+ApuracaoPis.DbApuracaoPIS.Idapuracaopis.AsString+' '+
                    ' WHERE CODDOCUMENTO = '+ _Cds.fieldByname('CODDOCUMENTO').Asstring+ ' '+
                    '   AND NUMLANCTO = '+ _Cds.fieldByname('NUMLANCTO').Asstring;
            if not execSql(Ssql) then
               Raise Exception.Create(messageinfo);

            _Cds.Next;
          end;
        Commit;  //aplica as alterações no banco
      except
        On E:Exception Do
          Begin
             Rollback;
             Result := False;
             MessageInfo := E.Message;
          End;
      end;
    end;

end;



function TCtrlGeraCApPis.ListAgradosRecDevPis(IdNfRecebeDevol: Integer): OleVariant;
Var
   Ssql : string;
begin
  Ssql := 'SELECT A.ALIQUOTA, A.VLRAGREGADO, A.VLRRECUPERADO, A.BASECALCULO '+
          '  FROM AGRNFRECDEV A '+
          ' WHERE (A.IDNFRECEBDEVOL = '+intTostr(IdNfRecebeDevol)+') AND '+
          '   AND (A.CODTIPOCUSTAGREG IN (SELECT CODTIPOCUSTAGREG '+
          '                                 FROM ALTXIMPOSTO WHERE (CODIMPOSTO = 17))) '; //pis
  Result := GetDataPacket(Ssql);
end;

function TCtrlGeraCApPis.ListLancamentosCAP(IdEmpresa: Integer; DataIni,
                                         DataFim, CodTipodoc : string): OleVariant;
var
  Ssql : string;
begin
  Ssql := 'SELECT D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, L.DATALANCTO, I.VLRBASE, I.VLRRETIDO, '+
          '       ((I.VLRRETIDO * 100) / I.VLRBASE) AS PERCENTUAL, D.IDFORCLI, D.CODDOCUMENTO, L.NUMLANCTO '+
          '  FROM DOCUMENTO D, LANCTODOCUM L, IMPOSTORETIDO I  ' +
          ' WHERE (D.IDPESSOA = '+intTostr(IdEmpresa)+ ') '+
          '   AND (D.RECPAG = ''P'') '+
          '   AND (RTRIM(D.OPERACAO) IN (''1'',''2'',''10'')) ';
  if Trim(CodTipodoc) <> '' then
     Ssql := Ssql + '   AND (D.CODTIPDOC = '+CodTipodoc+') ';

  Ssql := Ssql + '   AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+
          '   AND (D.OPERACAO = L.OPERACAO) '+
          '   AND (L.ESTORNO IS NULL) '+
          '   AND (L.IDAPURACAOPIS IS NULL) '+
          '   AND (L.DATALANCTO >= TO_DATE('+quotedStr(DataIni)+', ''DD/MM/YYYY'')) '+
          '   AND (L.DATALANCTO <= TO_DATE('+quotedStr(DataFim)+', ''DD/MM/YYYY'')) '+
          '   AND (D.CODDOCUMENTO = I.CODDOCUMENTO) '+
          '   AND (I.CODTIPOCUSTAGREG IN (SELECT CODTIPOCUSTAGREG '+
          '                                 FROM ALTXIMPOSTO WHERE (CODIMPOSTO = 17))) '; //pis


  Result := GetDataPacket(Ssql);
end;

function TCtrlGeraCApPis.ListTipoDocumento : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODTIPDOC, DESCRICAO '+
          '  FROM TIPODOCRECPAG '+
          ' ORDER BY DESCRICAO';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlGeraCApPis.OnCreateAppServer;
begin
  inherited;
  
end;

function TCtrlGeraCApPis.PegaCodTipoCustAgreg(IdEmpresa: Integer): integer;
Var
  Ssql : string;
begin
  with CdsAux do
    Begin
      Ssql := 'SELECT IDPISHOTEL '+
              '  FROM PARAMLIVRO ' +
              ' WHERE IDPESSOA = '+ intTostr(IdEmpresa);
      Data := GetDataPacket(Ssql);
      Result := fieldByname('IDPISHOTEL').AsInteger;
    end;
end;

end.
