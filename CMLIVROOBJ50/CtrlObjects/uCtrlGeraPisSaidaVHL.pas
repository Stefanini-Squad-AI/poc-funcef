unit uCtrlGeraPisSaidaVHL;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCtrlTerceiros, uCtrlTipoAltxImpostos,
     uCtrlParamLivro, uCtrlApuracaoPis, DBaseDados, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlGeraPisSaidaVhl = Class(TCmControlObject)
    private
      Terceiros : TCtrlTerceiros;
      ApuracaoPis : TCtrlApuracaoPIS;
      sSql :String;

      //Cds a serem utilizados
      CdsApuracaoPis: TClientDataSet;
      CdsTestaData : TClientDataSet;
      CdsLancamenVHL : TClientDataSet;

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
      function GeraPisSaidaVhl(cdsNotaVHL : OleVariant; IdEmpresa, IdHotel : LongInt) : Boolean;
      {Apaga todos os registros do cds}
      procedure ZeraCds(cds : TClientDataSet);
      {Lista as notas do VHL}
      function ListNotasVHL(DataLimite, DataFinal, IdHotel : string) : OleVariant;
      {Lista o Hotel da empresa própria - Pertence ao VHF}
      function ListHotel(IdPesoa : LongInt) : OleVariant;
      {Lista os lançamentos do VHL com o imposto PIS}
      function ListLancamentosVHLPis(NumNota, IdHotel, IdPessoa : string) : OleVariant;

    protected

    End;

implementation

{ TCtrlGeraPisSaidaVhl }


procedure TCtrlGeraPisSaidaVhl.AfterInitialize;
begin
  inherited;
  Terceiros.InitializeAs(Self);
  ApuracaoPis.InitializeAs(Self);
  Terceiros.OpenTransaction := false;
  ApuracaoPis.OpenTransaction := false;
end;

procedure TCtrlGeraPisSaidaVhl.CarregaCdsLimpo;
Var
   Ssql : string;
begin
  //Traz apenas a estrutura da tabela
  Ssql := 'SELECT * FROM APURACAOPIS WHERE (1 = 2)';
  CdsApuracaoPis.data := GetDataPacket(Ssql);
end;

constructor TCtrlGeraPisSaidaVhl.Create;
begin
  inherited;
  //Lists de terceiros
  Terceiros := TCtrlTerceiros.Create;
  ApuracaoPis := TCtrlApuracaoPIS.create;
  CdsApuracaoPis          := TClientDataSet.Create(nil);
  CdsTestaData        := TClientDataSet.Create(nil);
  CdsLancamenVHL      := TClientDataSet.Create(nil);
end;

destructor TCtrlGeraPisSaidaVhl.Destroy;
begin
  inherited;
  CdsApuracaoPis.free;
  CdsTestaData.free;
  CdsLancamenVHL.free;
end;

procedure TCtrlGeraPisSaidaVhl.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlGeraPisSaidaVhl.GeraPisSaidaVhl(cdsNotaVHL : OleVariant;  IdEmpresa, IdHotel : Integer): Boolean;
begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.GeraPisSaidaVhl(cdsNotaVHL, IdEmpresa, IdHotel);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    Begin
      _Cds.Data := cdsNotaVHL;
      Result := True;
      _Cds.First;
      StartTransaction;
      While not _Cds.EOF do
      Begin
         Try
            CarregaCdsLimpo;
            CdsLancamenVHL.data := ListLancamentosVHLPis(_Cds.FieldByName('NUM_NOTA').AsString,
                                                            IntToStr(IdHotel),
                                                            IntToStr(IdEmpresa));
            if not CdsLancamenVHL.IsEmpty then
              Begin
                CdsTestaData.data := ApuracaoPis.ListLivroVhlPis(_Cds.FieldByName('FLAGSERIE').Asstring,
                                                            _Cds.FieldByName('DATA_NOTA').AsString);
                //Verifica se já foi importada a nota corrente para o livro de pis
                //caso positivo atualiza os dados da nota, senão importa a nota.
                if CdsTestaData.isEmpty then
                  Begin
                    CdsApuracaoPis.Append;
                    CdsApuracaoPis.fieldByname('IDPESSOA').Asinteger := IdEmpresa;

                    if _Cds.FieldByName('NOTA_INICIAL').IsNull then
                       CdsApuracaoPis.fieldByname('NUMNOTA').AsInteger := _Cds.FieldByName('NUM_NOTA').AsInteger
                    else
                       CdsApuracaoPis.fieldByname('NUMNOTA').AsInteger := _Cds.FieldByName('NOTA_INICIAL').AsInteger;

                    CdsApuracaoPis.fieldByname('NUMNOTAFINAL').AsInteger := _Cds.FieldByName('NOTA_FINAL').AsInteger;

                    if not _Cds.FieldByName('FLAGSERIE').IsNull then
                      CdsApuracaoPis.fieldByname('COMPLEMENTO').Asstring := _Cds.FieldByName('FLAGSERIE').AsString;

                    If UpperCase(trim(_Cds.FieldByName('FLAG_CANCELAMENTO').AsString)) = 'FALSE' then
                      Begin
                        CdsApuracaoPis.fieldByname('VLRTOTAL').AsFloat :=  _Cds.FieldByName('TOTAL_NOTA').AsFloat;
                      end
                    else
                      Begin
                        if _Cds.FieldByName('NOTA_INICIAL').IsNull then
                          Begin
                            if (_Cds.FieldByName('NOTA_FINAL').IsNull) or
                               (_Cds.FieldByName('NUM_NOTA').AsInteger = _Cds.FieldByName('NOTA_FINAL').AsInteger) then
                               CdsApuracaoPis.fieldByname('OBSERVACAO').Asstring := 'NFs Canceladas: '+ _Cds.FieldByName('NUM_NOTA').Asstring
                            else
                               CdsApuracaoPis.fieldByname('OBSERVACAO').Asstring := 'NFs Canceladas: '+ _Cds.FieldByName('NUM_NOTA').Asstring +'-'+ _Cds.FieldByName('NOTA_FINAL').Asstring;
                          end
                        else
                          Begin
                            if (_Cds.FieldByName('NOTA_FINAL').IsNull) or
                               (_Cds.FieldByName('NOTA_INICIAL').AsInteger = _Cds.FieldByName('NOTA_FINAL').AsInteger) then
                               CdsApuracaoPis.fieldByname('OBSERVACAO').Asstring := 'NFs Canceladas: '+ _Cds.FieldByName('NOTA_INICIAL').Asstring
                            else
                              CdsApuracaoPis.fieldByname('OBSERVACAO').Asstring := 'NFs Canceladas: '+ _Cds.FieldByName('NOTA_INICIAL').Asstring +'-'+ _Cds.FieldByName('NOTA_FINAL').Asstring;
                          end;
                      end;

                    CdsApuracaoPis.fieldByname('FLGENTRADASAIDA').Asstring := 'S';
                    CdsApuracaoPis.fieldByname('DATAEMISSAONF').AsDateTime := _Cds.FieldByName('DATA_NOTA').AsDateTime;
                    CdsApuracaoPis.fieldByname('DATALANCTO').AsDateTime    := _Cds.FieldByName('DATA_NOTA').AsDateTime;
                    CdsApuracaoPis.fieldByname('ALIQUOTAPIS').AsFloat      := cdsLancamenVHL.FieldByName('ALIQUOTA').AsFloat;
                    CdsApuracaoPis.fieldByname('VALORPIS').AsFloat         := cdsLancamenVHL.FieldByName('VALORIMPOSTO').AsFloat;
                  end
                else
                  Begin
                    Ssql := 'UPDATE APURACAOPIS SET ';

                    if UpperCase(trim(_Cds.FieldByName('FLAG_CANCELAMENTO').AsString)) = 'FALSE' then
                      Begin
                        sSql := sSql + '   VLRTOTAL = VLRTOTAL + '+OraNumero(_Cds.FieldByName('TOTAL_NOTA').AsFloat)+',';
                      end
                    else
                      Begin
                        If cdsTestaData.fieldByname('OBSERVACAO').IsNull then
                          Begin
                            if _Cds.FieldByName('NOTA_INICIAL').IsNull then
                              Begin
                                if (_Cds.FieldByName('NOTA_FINAL').IsNull) or
                                   (_Cds.FieldByName('NUM_NOTA').AsInteger = _Cds.FieldByName('NOTA_FINAL').AsInteger) then
                                    sSql := sSql + ' OBSERVACAO = '+'''NFs Canceladas: ' + IntToStr(_Cds.FieldByName('NUM_NOTA').AsInteger)+''','
                                else
                                    sSql := sSql + ' OBSERVACAO = '+'''NFs Canceladas: '+IntToStr(_Cds.FieldByName('NUM_NOTA').AsInteger)+'-' + IntToStr(_Cds.FieldByName('NOTA_FINAL').AsInteger)+''',';
                              end
                            else
                              Begin
                                if (_Cds.FieldByName('NOTA_FINAL').IsNull) or
                                   (_Cds.FieldByName('NOTA_INICIAL').AsInteger = _Cds.FieldByName('NOTA_FINAL').AsInteger) then
                                   sSql := sSql + ' OBSERVACAO = '+'''NFs Canceladas: ' + IntToStr(_Cds.FieldByName('NOTA_INICIAL').AsInteger)+''','
                                else
                                   sSql := sSql + ' OBSERVACAO = '+'''NFs Canceladas: ' + IntToStr(_Cds.FieldByName('NOTA_INICIAL').AsInteger)+'-'+IntToStr(_Cds.FieldByName('NOTA_FINAL').AsInteger)+''',';
                              end;
                          end
                        else
                          Begin
                            if _Cds.FieldByName('NOTA_INICIAL').IsNull then
                              Begin
                                if (_Cds.FieldByName('NOTA_FINAL').IsNull) or
                                   (_Cds.FieldByName('NUM_NOTA').AsInteger = _Cds.FieldByName('NOTA_FINAL').AsInteger) then
                                   sSql := sSql+'   OBSERVACAO = OBSERVACAO || '','+IntToStr(_Cds.FieldByName('NUM_NOTA').AsInteger)+''','
                                else
                                   sSql := sSql+'   OBSERVACAO = OBSERVACAO || '','+IntToStr(_Cds.FieldByName('NUM_NOTA').AsInteger)+'-'+IntToStr(_Cds.FieldByName('NOTA_FINAL').AsInteger)+''',';
                              end
                            else
                              Begin
                                if (_Cds.FieldByName('NOTA_FINAL').IsNull) or
                                   (_Cds.FieldByName('NOTA_INICIAL').AsInteger = _Cds.FieldByName('NOTA_FINAL').AsInteger) then
                                   sSql := sSql+'   OBSERVACAO = OBSERVACAO || '','+IntToStr(_Cds.FieldByName('NOTA_INICIAL').AsInteger)+''','
                                else
                                   sSql := sSql+'   OBSERVACAO = OBSERVACAO || '','+IntToStr(_Cds.FieldByName('NOTA_INICIAL').AsInteger)+'-'+IntToStr(_Cds.FieldByName('NOTA_FINAL').AsInteger)+''',';
                              end;
                          end;
                      end;

                      if _Cds.FieldByName('NOTA_INICIAL').IsNull then
                        Begin
                          if cdsTestaData.fieldByname('NUMNOTA').AsInteger > _Cds.FieldByName('NUM_NOTA').AsInteger then
                             sSql := sSql+'   NUMNOTA = '+IntToStr(_Cds.FieldByName('NUM_NOTA').AsInteger)+',';
                        end
                      else
                        Begin
                          if cdsTestaData.fieldByname('NUMNOTA').AsInteger > _Cds.FieldByName('NOTA_INICIAL').AsInteger then
                             sSql := sSql + '   NUMNOTA = '+IntToStr(_Cds.FieldByName('NOTA_INICIAL').AsInteger)+',';
                         end;

                      if cdsTestaData.fieldByname('NUMNOTAFINAL').AsInteger < _Cds.FieldByName('NOTA_FINAL').AsInteger then
                        sSql := sSql+'   NUMNOTAFINAL = '+IntToStr(_Cds.FieldByName('NOTA_FINAL').AsInteger)+','
                     else
                        sSql := sSql+'   NUMNOTAFINAL = '+IntToStr(cdsTestaData.fieldByname('NUMNOTAFINAL').AsInteger)+',';

                      sSql := sSql + ' ALIQUOTAPIS = '+OraNumero(cdsLancamenVHL.FieldByName('ALIQUOTA').AsFloat)+',';
                      sSql := sSql + ' VALORPIS  = VALORPIS  + '+OraNumero(cdsLancamenVHL.FieldByName('VALORIMPOSTO').AsFloat);
                      sSql := sSql +' WHERE IDAPURACAOPIS = '+cdsTestaData.fieldByname('IDAPURACAOPIS').AsString;

                      if not ExecSQL(Ssql) then
                         Raise Exception.Create(messageinfo);
                end;

                // Atualiza o flag de gerou registro na tabela de NFLivro
                sSql:='UPDATE NOTAVHL SET FLGGEROULIVROPIS = ''S'' '+
                      'WHERE NUM_NOTA = '+_Cds.FieldByName('NUM_NOTA').AsString;

                if not ExecSQL(Ssql) then
                   Raise Exception.Create(messageinfo);

                //Liga meus cds aos da classe de negócio
                ApuracaoPis.CdsApuracaoPIS := CdsApuracaoPis;
                if not ApuracaoPis.GravarApuracaoPIS then
                  Raise Exception.Create(messageinfo);
              end;
         Except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := 'Geração da Nota '+_Cds.FieldByName('NUM_NOTA').AsString +
                              ' do dia '+_Cds.FieldByName('DATA_NOTA').AsString +
                              ' não Efetuada';
               MessageInfo := E.Message;
            End;
         end;
         _Cds.Next;
      end;
       Commit;
    end;
end;


function TCtrlGeraPisSaidaVhl.ListHotel(IdPesoa: Integer): OleVariant;
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

function TCtrlGeraPisSaidaVhl.ListLancamentosVHLPis(NumNota, IdHotel,
                                                    IdPessoa: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT L.NUM_NOTA, ' +
          '       I.PERCENTUAL AS ALIQUOTA, ' +
          '       P.IDPISHOTEL, SUM((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1)) * I.BASE/100) ) AS BASECALCULO, ' +
          '       SUM(((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1)) * I.BASE/100)*(I.PERCENTUAL/100)) ) AS VALORIMPOSTO, ' +
          '       SUM(DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1))) AS VALORCONTABIL ' +
          '  FROM LANCAMENVHL L, TIPODEBCREDHOTEL T, IMPOSXTIPODCHOTEL I, PARAMLIVRO P ' +
          ' WHERE (L.NUM_NOTA      = '+NumNota+') ' +
          '   AND (T.IDHOTEL       = '+IdHotel+') ' +
          '   AND (P.IDPESSOA      = '+IdPessoa+') ' +
          '   AND (L.COD_TIPO_DC   = T.CODREDUZIDO) ' +
          '   AND (I.IDTIPODEBCRED = T.IDTIPODEBCRED) ' +
          '   AND (I.IDHOTEL       = T.IDHOTEL) ' +
          '   AND (I.IDIMPOSTO     = P.IDPISHOTEL) ' +
          ' GROUP BY L.NUM_NOTA, I.PERCENTUAL, P.IDPISHOTEL';
  Result := GetDataPacket(Ssql);
end;

function TCtrlGeraPisSaidaVhl.ListNotasVHL(DataLimite, DataFinal,
                                        IdHotel: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT NUM_NOTA,DATA_NOTA, TAXA_SERVICO, TOTAL_NOTA,FLAG_CANCELAMENTO,NOTA_FINAL,NOTA_INICIAL,FLAGSERIE ' +
          '  FROM NOTAVHL ' +
          ' WHERE (DATA_NOTA BETWEEN TO_DATE('''+DataLimite+''',''DD/MM/YYYY'') ' +
          '   AND TO_DATE('''+DataFinal+''',''DD/MM/YYYY'')) AND ' +
          '       ((FLGGEROULIVROPIS = ''N'') OR (FLGGEROULIVROPIS IS NULL)) ';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlGeraPisSaidaVhl.OnCreateAppServer;
begin
  inherited;
  
end;

function TCtrlGeraPisSaidaVhl.OraNumero(rNumero: Double): string;
var sNumero : string;
    AuxDec  : char;
begin
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   sNumero:= FloatToStr(rNumero);
   Result :=sNumero;
   DecimalSeparator:=AuxDec;
end;


procedure TCtrlGeraPisSaidaVhl.ZeraCds(cds: TClientDataSet);
begin
  cds.First;
  while not cds.eof do
    cds.delete;
end;

end.
