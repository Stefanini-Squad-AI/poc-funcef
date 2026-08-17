unit uCtrlGeraCap;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uDbNfLivro, uDbNfLivroDetalhe, uCtrlTerceiros, uCtrlTipoAltxImpostos,
     uCtrlLivroICMS, DBaseDados, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlGeraCap = Class(TCmControlObject)
    private
      LivroICMS : TCtrlLivroICMS;

      //Cds a serem utilizados
      CdsNflivro: TClientDataSet;
      CdsNflivroDetalhe: TClientDataSet;
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
      function GeraLivro(cdsLancamentos : OleVariant; IdEmpresa : LongInt; CodModelo, CodFiscal : string) : Boolean;
      {Lista os lançamentos do CAP - CAP - pertence ao Clementino e ao Vampeta}
      function ListLancamentosCAP(IdEmpresa : LongInt; DataIni, DataFim, CodTipodoc, PlaConta : string) : OleVariant;
      {Lista os tipos de documento do CAP - CAP}
      function ListTipoDocumento : OleVariant;
      {Paga o códgio de ICMS de entrada dos parametros do livro}
      function PegaCodTipoCustAgreg(IdEmpresa : LongInt) : integer;

    protected

    End;

implementation

{ TCtrlGeraCap }


procedure TCtrlGeraCap.AfterInitialize;
begin
  inherited;
  LivroICMS.InitializeAs(self);
  LivroICMS.OpenTransaction  := false;
end;

procedure TCtrlGeraCap.CarregaCdsLimpo;
Var
   Ssql : string;
begin
  //Traz apenas a estrutura da tabela
  Ssql := 'SELECT * FROM NFLIVRO WHERE (1 = 2)';
  CdsNflivro.data := GetDataPacket(Ssql);
  Ssql := 'SELECT * FROM NFLIVRODETALHE WHERE (1 = 2)';
  CdsNflivroDetalhe.data := GetDataPacket(Ssql);
end;

constructor TCtrlGeraCap.Create;
begin
  inherited;
  //cria livro
  LivroICMS := TCtrlLivroICMS.Create;
  CdsNflivrodetalhe  := TClientDataSet.Create(nil);
  cdsNflivro         := TClientDataSet.Create(nil);
  CdsAux             := TClientDataSet.Create(nil);

  //Liga meus cds aos da classe de negócio
  LivroICMS.CdsNflivro := CdsNflivro;
  LivroICMS.CdsNflivroDetalhe := CdsNflivroDetalhe;
  //Seta os providers para os cds
end;

destructor TCtrlGeraCap.Destroy;
begin
  inherited;
  CdsAux.free;
  CdsNflivrodetalhe.Free;
  CdsNflivro.free;
  Livroicms.free;
end;

procedure TCtrlGeraCap.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlGeraCap.GeraLivro(cdsLancamentos : OleVariant; IdEmpresa : LongInt; CodModelo, CodFiscal : string) : Boolean;
Var
  iCodCodTipoCustAgreg : LongInt;
  Ssql : string;
begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.GeraLivro(cdsLancamentos, IdEmpresa, CodModelo, CodFiscal);
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
            CdsNflivro.Append;
            CdsNflivro.fieldByname('IDFORCLI').Asinteger       := _Cds.fieldByname('IdForCli').AsInteger;
            CdsNflivro.fieldByname('IDPESSOA').Asinteger       := IdEmpresa;
            CdsNflivro.fieldByname('NUMNFINI').AsInteger       := _Cds.fieldByname('NODOCUMENTO').Asinteger;
            CdsNflivro.fieldByname('NUMNFFIM').AsInteger       := _Cds.fieldByname('NODOCUMENTO').Asinteger;
            CdsNflivro.fieldByname('NFCOMPLEMENTO').Asstring   := _Cds.fieldByname('COMPLDOCUMENTO').AsString;
            CdsNflivro.fieldByname('DATAEMISSAONF').AsDateTime := _Cds.fieldByname('DATAEMISSAO').AsDateTime;
            CdsNflivro.fieldByname('DATAENTRADANF').AsDateTime := _Cds.fieldByname('DATALANCTO').AsDateTime;
            CdsNflivro.fieldByname('FLGENTRADASAIDA').Asstring := 'E';
            CdsNflivro.fieldByname('VLRTOTALNF').AsFloat       := _Cds.fieldByname('VALOR').AsFloat;
            CdsNflivro.fieldByname('CODMODELO').Asstring       := CodModelo;

            //Inclui o detalhe do livro
            CdsNflivroDetalhe.Append;
            CdsNflivroDetalhe.fieldByname('CODTIPOCUSTAGREG').AsInteger := iCodCodTipoCustAgreg;
            CdsNflivroDetalhe.fieldByname('CODFISCAL').Asstring         := CodFiscal;
            CdsNflivroDetalhe.fieldByname('VALORCONTABIL').AsFloat      := _Cds.fieldByname('VALOR').AsFloat;

            if not (_cds.FieldByName('VALICMS').AsFloat > 0) then
              CdsNflivroDetalhe.fieldByname('VALOROUTROS').AsFloat      := _Cds.fieldByname('VALOR').AsFloat
            else
              Begin
                CdsNflivroDetalhe.fieldByname('BASECALCULO').AsFloat    := _Cds.fieldByname('VALOR').AsFloat;
                CdsNflivroDetalhe.FieldByName('VALORIMPOSTO').AsFloat   := _Cds.fieldByname('VALICMS').AsFloat;
                CdsNflivroDetalhe.FieldByName('ALIQUOTA').AsFloat       := (_Cds.fieldByname('VALICMS').AsFloat * 100) / _Cds.fieldByname('VALOR').AsFloat;
              end;

            LivroICMS.CdsNflivro        := CdsNflivro;
            LivroICMS.CdsNflivroDetalhe := CdsNflivroDetalhe;
            if not LivroICMS.GravarLivro then
               Begin
                 messageinfo := LivroICMS.messageinfo;
                 exit;
               end;

            //informa que o livro já foi gerado para o lançamento corrente.
            Ssql := 'UPDATE LANCTODOCUM SET IDNFLIVRO = '+intTostr(LivroICMS.GetLastIdnflivro)+ ' '+
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



function TCtrlGeraCap.ListLancamentosCAP(IdEmpresa: Integer; DataIni,
                                         DataFim, CodTipodoc, PlaConta : string): OleVariant;
var
  Ssql : string;
begin
  Ssql := 'SELECT D.IDFORCLI, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, ' +
          '       L.DATALANCTO, L.VALOR, L.CODDOCUMENTO, L.NUMLANCTO, LANC.VALICMS ' +
          '  FROM DOCUMENTO D, LANCTODOCUM L, (SELECT PLNCODIGO, SUM(DECODE(LACDEBCRE,''D'',LACVALOR,LACVALOR*-1)) AS VALICMS ' +
          '                                      FROM LANCAMENTO ' +
          '                                     WHERE (RTRIM(PLACONTA) = ' + quotedStr(Trim(PlaConta))+') ' +
          '                                     GROUP BY PLNCODIGO) LANC ' +
          ' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) ' +
          '   AND (D.OPERACAO = L.OPERACAO) ';
  if Trim(CodTipodoc) <> '' then
     Ssql := Ssql + '   AND (D.CODTIPDOC = '+CodTipodoc+') ';

  Ssql := Ssql + '   AND (L.ESTORNO IS NULL) ' +
                 '   AND (RTRIM(D.OPERACAO) IN (''1'',''2'',''10'')) ' +
                 '   AND (L.IDNFLIVRO IS NULL) ' +
                 '   AND (D.RECPAG = ''P'') ' +
                 '   AND (L.PLNCODIGO = LANC.PLNCODIGO(+)) '+
                 '   AND (D.IDPESSOA = '+intTostr(IdEmpresa)+ ') '+
                 '   AND (D.IDMODULO <> 5)  '+ //Documentos que não tenham vindo do Almoxarifado
                 '   AND (L.DATALANCTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) ' +
                 '   AND (L.DATALANCTO <= TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlGeraCap.ListTipoDocumento : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODTIPDOC, DESCRICAO '+
          '  FROM TIPODOCRECPAG '+
          ' ORDER BY DESCRICAO';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlGeraCap.OnCreateAppServer;
begin
  inherited;
  
end;

function TCtrlGeraCap.PegaCodTipoCustAgreg(IdEmpresa: Integer): integer;
Var
  Ssql : string;
begin
  with CdsAux do
    Begin
      Ssql := 'SELECT CODICMSENTRADA '+
              '  FROM PARAMLIVRO ' +
              ' WHERE IDPESSOA = '+ intTostr(IdEmpresa);
      Data := GetDataPacket(Ssql);
      Result := fieldByname('CODICMSENTRADA').AsInteger;
    end;
end;

end.
