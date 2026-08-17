unit uCtrlGeraEntradaPis;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uDbNfLivro, uDbNfLivroDetalhe, uCtrlTerceiros, uCtrlTipoAltxImpostos,
     uCtrlParamLivro, uCtrlapuracaoPis, DBaseDados, uMensErro, Dialogs, uFuncaoGeral,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlGeraEntradaPis = Class(TCmControlObject)
    private
      Terceiros : TCtrlTerceiros;
      TipoAltxImpostos : TCtrlTipoAltxImpostos;
      ParamLivro : TCtrlParamLivro;
      ApuracaoPis : TCtrlApuracaoPis;
      FuncaoGeral : TFuncaoGeral;
      sSql  :String;


      //Cds a serem utilizados
      CdsApuracaoPis: TClientDataSet;
      CdsImpostoNF : TclientDataSet;
      CdsItensNF : TClientDataSet;
      CdsImpostoItem : TClientDataSet;
      CdsAltxImposto : TClientDataSet;
      CdsParamLivro : TClientDataSet;
      CdsAuxFor : TClientDataSet;
      CdsAux : TClientDataSet;
      sCodigoFiscal : Array of string;
      procedure ListaCodigosFiscaisSemIncidencia;
      function VerificaCodigoFiscal(CodFiscal : string) : Boolean;
      procedure CarregaCdsLimpo;
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      {Faz a geração do livro}
      function GeraLivroEntradaPIS(cdsRecebeNF : OleVariant; ModeloNFEntra, ModeloNFFrete, ModeloNFDevol : string; IdPessoa : integer) : Boolean;
      {Pega as notas do almoxerifado que ainda não foram geradas para o livro - Pertence ao Almoxarifado - Igor}
      function ListAlmoxaParaLivro(IdEmpresa : integer; DataFim : string) : OleVariant;
      function ListAgradosRecDevPis(IdNfRecebeDevol : LongInt) : OleVariant;


    protected

    End;

implementation

{ TCtrlGeraEntradaPis }

procedure TCtrlGeraEntradaPis.AfterInitialize;
begin
  inherited;
  Terceiros.InitializeAs(self);
  ApuracaoPis.InitializeAs(self);
  TipoAltxImpostos.InitializeAs(Self);
  ParamLivro.InitializeAs(Self);
  FuncaoGeral.InitializeAs(Self);
  Terceiros.OpenTransaction := false;
  TipoAltxImpostos.OpenTransaction := false;
  ParamLivro.OpenTransaction := false;
  ApuracaoPis.OpenTransaction := false;
end;


procedure TCtrlGeraEntradaPis.CarregaCdsLimpo;
Var
   Ssql : string;
begin
  //Traz apenas a estrutura da tabela
  Ssql := 'SELECT * FROM APURACAOPIS WHERE (1 = 2)';
  CdsApuracaoPis.data := GetDataPacket(Ssql);
end;

constructor TCtrlGeraEntradaPis.Create;
begin
  inherited;
  DecimalSeparator := ',';
  //Lists de terceiros
  Terceiros := TCtrlTerceiros.Create;

  //Carrega classe de negócio do livro
  ApuracaoPis := TCtrlApuracaoPis.Create;
  CdsApuracaoPis         := TClientDataSet.Create(nil);
  CdsImpostoNF       := TClientDataSet.Create(nil);
  CdsItensNF         := TClientDataSet.Create(nil);
  CdsImpostoItem     := TClientDataSet.Create(nil);
  CdsAltxImposto     := TClientDataSet.Create(nil);
  CdsParamLivro      := TClientDataSet.Create(nil);
  CdsAuxFor          := TClientDataSet.Create(nil);
  CdsAux             := TClientDataSet.Create(nil);
  FuncaoGeral        := TFuncaoGeral.create;
  //Carrega classe de negócio Alterador x Imposto
  TipoAltxImpostos := TCtrlTipoAltxImpostos.Create;

  //Carrega classe de negócio Paramêtros do livro
  ParamLivro := TCtrlParamLivro.Create;

end;

destructor TCtrlGeraEntradaPis.Destroy;
begin
  inherited;
  CdsApuracaoPis.free;
  CdsImpostoNF.free;
  CdsItensNF.free;
  CdsImpostoItem.free;
  CdsAltxImposto.free;
  CdsParamLivro.free;
  CdsAuxFor.free;
  CdsAux.free;
  FuncaoGeral.free;
end;

procedure TCtrlGeraEntradaPis.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlGeraEntradaPis.GeraLivroEntradaPIS(cdsRecebeNF: OleVariant; ModeloNFEntra, ModeloNFFrete, ModeloNFDevol : string; IdPessoa : integer): Boolean;
begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.GeraLivroEntradaPIS(cdsRecebeNF, ModeloNFEntra, ModeloNFFrete, ModeloNFDevol, IdPessoa);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    Begin
      CdsAux.Data := cdsRecebeNF;
      //Carrega o cdsParamlivro
      CdsParamLivro.data := ParamLivro.ListCodICMSIPI(IdPessoa);
      Result := True;
      //lista os códigos fiscais sem incidência de icms
      ListaCodigosFiscaisSemIncidencia;

      StartTransaction;

      CdsAux.First;
      while not CdsAux.eof do
      Begin
         Try
            CarregaCdsLimpo; // carrega apenas a estrutura das tabelas para o cds

            // pega o imposto da nota
            CdsImpostoNF.data := ListAgradosRecDevPis(CdsAux.FieldByName('IDNFRECEBDEVOL').Asinteger);

            if not CdsImpostoNF.IsEmpty then
              Begin
                //insere os registros de nfrecebdevol em nflivro
                CdsApuracaoPis.append;
                CdsApuracaoPis.fieldByname('IDFORCLI').Asinteger     := CdsAux.FieldByName('IDFORCLI').AsInteger;
                CdsApuracaoPis.fieldByname('IDPESSOA').Asinteger     := IdPessoa;
                CdsApuracaoPis.fieldByname('NUMNOTA').AsInteger      := CdsAux.FieldByName('NUMNF').AsInteger;
                CdsApuracaoPis.fieldByname('NUMNOTAFINAL').AsInteger := CdsAux.FieldByName('NUMNF').AsInteger;
                CdsApuracaoPis.fieldByname('COMPLEMENTO').Asstring   := CdsAux.FieldByName('COMPLNF').AsString;
                CdsApuracaoPis.fieldByname('DATAEMISSAONF').Asstring := CdsAux.FieldByName('DATAEMISNF').AsString;
                CdsApuracaoPis.fieldByname('DATALANCTO').Asstring    := CdsAux.FieldByName('DATAENTDEVOL').AsString;
                CdsApuracaoPis.fieldByname('VLRTOTAL').AsFloat       := CdsAux.FieldByName('VLRNOTAFISCAL').AsFloat;
                if CdsAux.FieldByName('FLGTIPONOTA').AsString = 'R' then
                   CdsApuracaoPis.fieldByname('CODMODELO').Asstring := ModeloNFEntra
                else if CdsAux.FieldByName('FLGTIPONOTA').AsString = 'A' then
                        CdsApuracaoPis.fieldByname('CODMODELO').Asstring := ModeloNFFrete
                else
                     CdsApuracaoPis.fieldByname('CODMODELO').Asstring := ModeloNFDevol;
                CdsApuracaoPis.fieldByname('FLGENTRADASAIDA').Asstring := 'E';


                CdsApuracaoPis.fieldByname('ALIQUOTAPIS').AsFloat := CdsImpostoNF.fieldByname('ALIQUOTA').AsFloat;
                CdsApuracaoPis.fieldByname('VALORPIS').AsFloat    := CdsImpostoNF.fieldByname('VLRAGREGADO').AsFloat;


                //Liga meus cds aos da classe de negócio
                ApuracaoPis.CdsApuracaoPis := CdsApuracaoPis;
                //Grava Livro
                if not ApuracaoPis.GravarApuracaoPIS then
                   Begin
                     Result := false;
                     Raise Exception.Create(messageinfo);
                   end;

                sSql := 'UPDATE NFRECEBDEVOL SET IDAPURACAOPIS = '+ ApuracaoPis.DbApuracaoPIS.Idapuracaopis.AsString +' WHERE '+
                        'IDNFRECEBDEVOL = '+CdsAux.FieldByName('IDNFRECEBDEVOL').AsString;
                //executa o update na nfrecebdevol
                if not ExecSQL(Ssql) then
                   Begin
                     Result := false;
                     Raise Exception.Create(messageinfo);
                   end;
              end;
         Except
            On E:Exception Do
            Begin
               cdsAuxFor.data := Terceiros.ListRazaoSocialEmpresaProp(IdPessoa);
               MessageInfo :=  ('Geração da Nota ') + CdsAux.FieldByName('NUMNF').AsString+'/' + CdsAux.FieldByName('COMPLNF').AsString +
                               (' do fornecedor ') + cdsAuxFor.FieldByName('RAZAOSOCIAL').AsString +
                               (' do dia ') + CdsAux.FieldByName('DATAENTDEVOL').AsString +
                               (' não Efetuada');
               Result := False;
               MessageInfo := E.Message;
               Rollback;
            End;
         end;
         CdsAux.Next;
      end;
      Commit;
    end;
end;


procedure TCtrlGeraEntradaPis.ListaCodigosFiscaisSemIncidencia;
Var
  i : integer;
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT CODFISCAL '+
              '  FROM CLASFISC '+
              ' WHERE FLGICMS = ''S''';  //se não incide icms sobre esse código fiscal
      data := GetDataPacket(Ssql);
      SetLength(scodigoFiscal, RecordCount + 1); //seta o tamanho do Vetor para o tamanho da query mais 1
      first;
      for i := 0 to Recordcount - 1 do
        Begin
          sCodigoFiscal[i] := fieldByname('CODFISCAL').Asstring;
          next;
        end;
    end;
end;

function TCtrlGeraEntradaPis.ListAgradosRecDevPis(IdNfRecebeDevol: Integer): OleVariant;
Var
   Ssql : string;
begin
  Ssql := 'SELECT A.ALIQUOTA, A.VLRAGREGADO, A.VLRRECUPERADO, A.BASECALCULO '+
          '  FROM AGRNFRECDEV A '+
          ' WHERE (A.IDNFRECEBDEVOL = '+intTostr(IdNfRecebeDevol)+') '+
          '   AND (A.CODTIPOCUSTAGREG IN (SELECT CODTIPOCUSTAGREG '+
          '                                 FROM ALTXIMPOSTO WHERE (CODIMPOSTO = 17))) '; //pis
  Result := GetDataPacket(Ssql);
end;

function TCtrlGeraEntradaPis.ListAlmoxaParaLivro(IdEmpresa: integer;
                                              DataFim: string): OleVariant;
Var
   Ssql : string;
begin
  Ssql := 'SELECT N.IDNFRECEBDEVOL,N.CODFISCAL,N.IDFORCLI, N.NUMNF,N.COMPLNF,N.DATAEMISNF,'+
          '       N.DATAENTDEVOL,N.FLGTIPONOTA,N.VLRNOTAFISCAL '+
          '  FROM NFRECEBDEVOL N '+
          ' WHERE (N.IDAPURACAOPIS IS NULL) '+
          '   AND (N.IDPESSOA = '+IntToStr(IdEmpresa)+')'+
          '   AND (N.DATAENTDEVOL <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'')) '+
          '   AND (N.IDNFRECEBDEVOL IN (SELECT IDNFRECEBDEVOL '+
          '                               FROM AGRNFRECDEV A '+
          '                              WHERE (A.CODTIPOCUSTAGREG IN (SELECT CODTIPOCUSTAGREG '+
          '                                                              FROM ALTXIMPOSTO WHERE (CODIMPOSTO = 17))))) '; //pis '+
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlGeraEntradaPis.OnCreateAppServer;
begin
  inherited;

end;




function TCtrlGeraEntradaPis.VerificaCodigoFiscal(CodFiscal: string): Boolean;
Var
  i : integer;
begin
  Result := false;
  for i := 0 to Length(sCodigoFiscal) - 1 do
    if CodFiscal = sCodigoFiscal[i] then
       result := true;
end;

end.
