unit uCtrlGeraLivroPISdoVHF;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uDbNfLivro, uDbNfLivroDetalhe, uCtrlTerceiros, uCtrlTipoAltxImpostos,
     uCtrlParamLivro, uCtrlLivroICMS, DBaseDados, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF},
     uCtrlApuracaoPIS;

  Type
    TCtrlGeraLivroPISdoVHF = Class(TCmControlObject)
    private
      Terceiros : TCtrlTerceiros;
      ApuracaoPis : TCtrlApuracaoPIS;
      sSql :String;

      //Cds a serem utilizados
      CdsApuracaoPis: TClientDataSet;
      CdsLancamenFront : TClientDataSet;
      CdsLancamenFront1 : TClientDataSet;
      procedure CarregaCdsLimpo;
      function OraNumero(rNumero : Double ):string;
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      {Faz a geração do livro}
      function GeraLivroPISVHF(cdsNotaFront : OleVariant; IdEmpresa, IdHotel : LongInt) : Boolean;
      {Lista as notas do Front - VHF}
      function ListNotasFront(DataLimite, DataFinal, IdHotel : string) : OleVariant;
      {Lista o Hotel da empresa própria - Pertence ao VHF}
      function ListHotel(IdPesoa : LongInt) : OleVariant;
      {Lista os lançamento do Front - VHF}
      function ListLancamentosFrontPIS(IdConta, IdHotel, IdPessoa : LongInt) : OleVariant;
      function ListLancamentosFrontPIS1(NumNotaRegime, IdHotel, IdPessoa : LongInt) : OleVariant;

    protected

    End;

implementation

{ TCtrlGeraLivroPISdoVHF }


procedure TCtrlGeraLivroPISdoVHF.AfterInitialize;
begin
  inherited;
  Terceiros.InitializeAs(self);
  ApuracaoPis.InitializeAs(self);
  Terceiros.OpenTransaction := false;
  ApuracaoPis.OpenTransaction := false;
end;

procedure TCtrlGeraLivroPISdoVHF.CarregaCdsLimpo;
Var
   Ssql : string;
begin
  //Traz apenas a estrutura da tabela
  Ssql := 'SELECT * FROM APURACAOPIS WHERE (1 = 2)';
  CdsApuracaoPis.data := GetDataPacket(Ssql);
end;

constructor TCtrlGeraLivroPISdoVHF.Create;
begin
  inherited;
  //Lists de terceiros
  Terceiros := TCtrlTerceiros.Create;
  //Carrega classe de negócio do livro
  ApuracaoPis := TCtrlApuracaoPIS.Create;
  CdsApuracaoPis         := TClientDataSet.Create(nil);
  CdsLancamenFront   := TClientDataSet.Create(nil);
  CdsLancamenFront1  := TClientDataSet.Create(nil);
end;

destructor TCtrlGeraLivroPISdoVHF.Destroy;
begin
  inherited;
  CdsApuracaoPis.free;
  CdsLancamenFront.free;
  CdsLancamenFront1.free;
end;

procedure TCtrlGeraLivroPISdoVHF.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlGeraLivroPISdoVHF.GeraLivroPISVHF(cdsNotaFront: OleVariant;  IdEmpresa, IdHotel : Integer): Boolean;
begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.GeraLivroPISVHF(cdsNotaFront, IdEmpresa, IdHotel);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    Begin
      _Cds.data := cdsNotaFront;
      Result := True;
      _Cds.First;
      StartTransaction;
      While not _Cds.EOF do
      Begin
         Try
            CarregaCdsLimpo;

            // Trata os lancamentos da nota
            CdsLancamenFront.data := ListLancamentosFrontPIS(_Cds.FieldByName('IDCONTA').AsInteger,
                                                                    IdHotel, IdEmpresa);

            if not cdsLancamenFront.IsEmpty then
              Begin
                If _Cds.FieldByName('DATACANCELAMENTO').IsNull then
                  Begin
                    CdsApuracaoPis.append;
                    CdsApuracaoPis.fieldByname('IDPESSOA').Asinteger       := IdEmpresa;
                    CdsApuracaoPis.fieldByname('NUMNOTA').AsInteger        := _Cds.FieldByName('NUMERONOTA').AsInteger;
                    if not _Cds.FieldByName('IDFORCLI').isNull then
                       CdsApuracaoPis.fieldByname('IDFORCLI').AsFloat      := _Cds.FieldByName('IDFORCLI').AsInteger;
                    CdsApuracaoPis.fieldByname('COMPLEMENTO').AsFloat      := _Cds.FieldByName('SERIE').AsFloat;
                    CdsApuracaoPis.fieldByname('FLGENTRADASAIDA').Asstring := 'S';
                    CdsApuracaoPis.fieldByname('DATAEMISSAONF').AsdateTime := _Cds.FieldByName('DATAEMISSAO').AsdateTime;
                    CdsApuracaoPis.fieldByname('DATALANCTO').AsdateTime := _Cds.FieldByName('DATAEMISSAO').AsdateTime;
                    If not _Cds.FieldByName('DATACANCELAMENTO').isnull then
                       CdsApuracaoPis.fieldByname('OBSERVACAO').Asstring   := 'Cancelada';
                    CdsApuracaoPis.fieldByname('NUMNOTAFINAL').AsInteger   := _Cds.FieldByName('NUMERONOTAFINAL').AsInteger;
                    CdsApuracaoPis.fieldByname('ALIQUOTAPIS').Asfloat := cdsLancamenFront.FieldByName('ALIQUOTA').AsFloat;
                    CdsApuracaoPis.fieldByname('VALORPIS').AsFloat    := cdsLancamenFront.FieldByName('VALORIMPOSTO').AsFloat;
                    CdsApuracaoPis.fieldByname('VLRTOTAL').AsFloat    := cdsLancamenFront.FieldByName('VALORCONTABIL').AsFloat;
                  end
                else
                  Begin
                    CdsApuracaoPis.append;
                    CdsApuracaoPis.fieldByname('IDPESSOA').Asinteger       := IdEmpresa;
                    CdsApuracaoPis.fieldByname('NUMNOTA').AsInteger        := _Cds.FieldByName('NUMERONOTA').AsInteger;
                    if not _Cds.FieldByName('IDFORCLI').isNull then
                       CdsApuracaoPis.fieldByname('IDFORCLI').AsFloat      := _Cds.FieldByName('IDFORCLI').AsInteger;
                    CdsApuracaoPis.fieldByname('COMPLEMENTO').AsFloat      := _Cds.FieldByName('SERIE').AsFloat;
                    CdsApuracaoPis.fieldByname('FLGENTRADASAIDA').Asstring := 'S';
                    CdsApuracaoPis.fieldByname('DATAEMISSAONF').AsdateTime := _Cds.FieldByName('DATAEMISSAO').AsdateTime;
                    CdsApuracaoPis.fieldByname('DATALANCTO').AsdateTime := _Cds.FieldByName('DATAEMISSAO').AsdateTime;
                    If not _Cds.FieldByName('DATACANCELAMENTO').isnull then
                       CdsApuracaoPis.fieldByname('OBSERVACAO').Asstring   := 'Cancelada';
                    CdsApuracaoPis.fieldByname('NUMNOTAFINAL').AsInteger   := _Cds.FieldByName('NUMERONOTAFINAL').AsInteger;
                    CdsApuracaoPis.fieldByname('ALIQUOTAPIS').Asfloat := 0;
                    CdsApuracaoPis.fieldByname('VALORPIS').AsFloat    := 0;
                    CdsApuracaoPis.fieldByname('VLRTOTAL').AsFloat    := 0;
                  end;
              end
            else
              Begin
                CdsLancamenFront1.data := ListLancamentosFrontPIS1(_Cds.FieldByName('NUMERONOTA').AsInteger,
                                                                         IdHotel, IdEmpresa);
                if not CdsLancamenFront1.IsEmpty then
                  Begin
                    If _Cds.FieldByName('DATACANCELAMENTO').IsNull then
                      Begin
                        CdsApuracaoPis.append;
                        CdsApuracaoPis.fieldByname('IDPESSOA').Asinteger       := IdEmpresa;
                        CdsApuracaoPis.fieldByname('NUMNOTA').AsInteger        := _Cds.FieldByName('NUMERONOTA').AsInteger;
                        if not _Cds.FieldByName('IDFORCLI').isNull then
                           CdsApuracaoPis.fieldByname('IDFORCLI').AsFloat      := _Cds.FieldByName('IDFORCLI').AsInteger;
                        CdsApuracaoPis.fieldByname('COMPLEMENTO').AsFloat      := _Cds.FieldByName('SERIE').AsFloat;
                        CdsApuracaoPis.fieldByname('FLGENTRADASAIDA').Asstring := 'S';
                        CdsApuracaoPis.fieldByname('DATAEMISSAONF').AsdateTime := _Cds.FieldByName('DATAEMISSAO').AsdateTime;
                        CdsApuracaoPis.fieldByname('DATALANCTO').AsdateTime    := _Cds.FieldByName('DATAEMISSAO').AsdateTime;
                        If not _Cds.FieldByName('DATACANCELAMENTO').isnull then
                           CdsApuracaoPis.fieldByname('OBSERVACAO').Asstring   := 'Cancelada';
                        CdsApuracaoPis.fieldByname('NUMNOTAFINAL').AsInteger   := _Cds.FieldByName('NUMERONOTAFINAL').AsInteger;
                        CdsApuracaoPis.fieldByname('ALIQUOTAPIS').Asfloat := CdsLancamenFront1.FieldByName('ALIQUOTA').AsFloat;
                        CdsApuracaoPis.fieldByname('VALORPIS').AsFloat    := CdsLancamenFront1.FieldByName('VALORIMPOSTO').AsFloat;
                        CdsApuracaoPis.fieldByname('VLRTOTAL').AsFloat    := CdsLancamenFront1.FieldByName('VALORCONTABIL').AsFloat;
                      end
                    else
                      Begin
                        CdsApuracaoPis.append;
                        CdsApuracaoPis.fieldByname('IDPESSOA').Asinteger       := IdEmpresa;
                        CdsApuracaoPis.fieldByname('NUMNOTA').AsInteger        := _Cds.FieldByName('NUMERONOTA').AsInteger;
                        if not _Cds.FieldByName('IDFORCLI').isNull then
                           CdsApuracaoPis.fieldByname('IDFORCLI').AsFloat      := _Cds.FieldByName('IDFORCLI').AsInteger;
                        CdsApuracaoPis.fieldByname('COMPLEMENTO').AsFloat      := _Cds.FieldByName('SERIE').AsFloat;
                        CdsApuracaoPis.fieldByname('FLGENTRADASAIDA').Asstring := 'S';
                        CdsApuracaoPis.fieldByname('DATAEMISSAONF').AsdateTime := _Cds.FieldByName('DATAEMISSAO').AsdateTime;
                        CdsApuracaoPis.fieldByname('DATALANCTO').AsdateTime := _Cds.FieldByName('DATAEMISSAO').AsdateTime;
                        If not _Cds.FieldByName('DATACANCELAMENTO').isnull then
                           CdsApuracaoPis.fieldByname('OBSERVACAO').Asstring   := 'Cancelada';
                        CdsApuracaoPis.fieldByname('NUMNOTAFINAL').AsInteger   := _Cds.FieldByName('NUMERONOTAFINAL').AsInteger;
                        CdsApuracaoPis.fieldByname('ALIQUOTAPIS').Asfloat := 0;
                        CdsApuracaoPis.fieldByname('VALORPIS').AsFloat    := 0;
                        CdsApuracaoPis.fieldByname('VLRTOTAL').AsFloat    := 0;
                      end;
                  end;
              end;

            //Liga meu cds ao da classe de negócio
            ApuracaoPis.CdsApuracaoPis := CdsApuracaoPis;
            if not ApuracaoPis.GravarApuracaoPIS then
               Raise Exception.Create(messageinfo);

            if (not cdsLancamenFront.IsEmpty) or (not cdsLancamenFront1.IsEmpty) then
              Begin
                sSql:='UPDATE NOTAFRONT SET FLGGEROULIVROPIS = ''S'''+
                      'WHERE NUMERONOTA = '+_Cds.FieldByName('NUMERONOTA').AsString;
                if not ExecSQL(Ssql) then
                   Raise Exception.Create(messageinfo);
              end;

         Except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := 'Geração da Nota '+_Cds.FieldByName('NUMERONOTA').AsString+
                              ' do dia '+_Cds.FieldByName('DATAEMISSAO').AsString+
                              ' não Efetuada';
               MessageInfo := E.Message;
            End;
         end;
         _Cds.Next;
      end;
      Commit;
    end;
end;

function TCtrlGeraLivroPISdoVHF.ListHotel(IdPesoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT H.IDHOTEL, P.NOME ' +
          '  FROM HOTEL H, PESSOA P ' +
          ' WHERE H.IDHOTEL = P.IDPESSOA ' +
          '   AND H.IDPESSOA = ' + InttoStr(IdPesoa) + ' ' +
          ' ORDER BY P.NOME';
  Result := GetDataPacket(Ssql);
end;

function TCtrlGeraLivroPISdoVHF.ListLancamentosFrontPIS(IdConta, IdHotel,
                                                        IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT L.NUMERONOTA, I.PERCENTUAL AS ALIQUOTA, P.IDPISHOTEL, ' +
          '       SUM((L.VLRLANCAMENTO * I.BASE/100)) AS BASECALCULO, ' +
          '       SUM(((L.VLRLANCAMENTO * I.BASE/100)*(I.PERCENTUAL/100))) AS VALORIMPOSTO, ' +
          '       SUM( L.VLRLANCAMENTO ) AS VALORCONTABIL ' +
          '  FROM LANCAMENTOSFRONT L, IMPOSXTIPODCHOTEL I, PARAMLIVRO P ' +
          ' WHERE (L.IDCONTA = '+intTostr(IdConta)+') ' +
          '   AND (I.IDHOTEL = '+intTostr(IdHotel)+') ' +
          '   AND (P.IDPESSOA = '+intTostr(IdPessoa)+') ' +
          '   AND (I.IDTIPODEBCRED = L.IDTIPODEBCRED) ' +
          '   AND (I.IDIMPOSTO = P.IDPISHOTEL) ' +
          '   AND (L.NUMNOTAREGIME IS NULL) ' +
          ' GROUP BY L.NUMERONOTA, I.PERCENTUAL, P.IDPISHOTEL';
  Result := GetDataPacket(Ssql);
end;

function TCtrlGeraLivroPISdoVHF.ListLancamentosFrontPIS1(NumNotaRegime, IdHotel,
                                                         IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT L.NUMNOTAREGIME, I.PERCENTUAL AS ALIQUOTA, ' +
          '       P.IDPISHOTEL, SUM((L.VLRLANCAMENTO * I.BASE/100)) AS BASECALCULO, ' +
          '       SUM(((L.VLRLANCAMENTO * I.BASE/100)*(I.PERCENTUAL/100))) AS VALORIMPOSTO, ' +
          '       SUM(L.VLRLANCAMENTO) AS VALORCONTABIL ' +
          '  FROM LANCAMENTOSFRONT L, IMPOSXTIPODCHOTEL I, PARAMLIVRO P ' +
          ' WHERE (L.NUMNOTAREGIME = '+IntTostr(NumNotaRegime)+') '+
          '   AND (I.IDHOTEL = '+IntTostr(IdHotel)+') ' +
          '   AND (P.IDPESSOA = '+IntTostr(IdPessoa)+') ' +
          '   AND (I.IDTIPODEBCRED = L.IDTIPODEBCRED) ' +
          '   AND (I.IDIMPOSTO = P.IDPISHOTEL) ' +
          ' GROUP BY L.NUMNOTAREGIME, I.PERCENTUAL, P.IDPISHOTEL ';
  result := GetDataPacket(Ssql);
end;

function TCtrlGeraLivroPISdoVHF.ListNotasFront(DataLimite, DataFinal,
                                                IdHotel: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT N.IDCONTA, N.NUMERONOTA,N.NUMERONOTAFINAL,N.DATACANCELAMENTO,N.DATAEMISSAO,N.SERIE, ' +
          '       NVL(C.IDFORCLI,C.IDHOSPEDE) AS IDFORCLI '+
          '  FROM NOTAFRONT N, CONTASFRONT C '+
          ' WHERE (N.DATAEMISSAO BETWEEN TO_DATE('''+DataLimite+''',''DD/MM/YYYY'') '+
          '   AND TO_DATE('''+DataFinal+''',''DD/MM/YYYY'')) ' +
          '   AND (N.IDHOTEL = '+IdHotel+') ' +
          '   AND (N.IDHOTEL = C.IDHOTEL) '+
          '   AND (N.IDCONTA = C.IDCONTA) '+
          '   AND ((N.FLGGEROULIVROPIS = ''N'') OR (N.FLGGEROULIVROPIS IS NULL)) ';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlGeraLivroPISdoVHF.OnCreateAppServer;
begin
  inherited;
end;

function TCtrlGeraLivroPISdoVHF.OraNumero(rNumero: Double): string;
var sNumero : string;
    AuxDec  : char;
begin
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   sNumero:= FloatToStr(rNumero);
   Result :=sNumero;
   DecimalSeparator:=AuxDec;
end;

end.
