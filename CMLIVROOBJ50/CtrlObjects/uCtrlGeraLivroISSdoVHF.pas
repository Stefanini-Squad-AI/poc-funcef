unit uCtrlGeraLivroISSdoVHF;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, 
     uDbNfLivro, uDbNfLivroDetalhe, uCtrlTerceiros, uCtrlTipoAltxImpostos,
     uCtrlParamLivro, uCtrlLivroICMS, DBaseDados, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlGeraLivroISSdoVHF = Class(TCmControlObject)
    private
      Terceiros : TCtrlTerceiros;
      LivroICMS : TCtrlLivroICMS;
      sSql :String;

      //Cds a serem utilizados
      CdsNflivro: TClientDataSet;
      CdsNflivroDetalhe: TClientDataSet;
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
      function GeraLivroISSVHF(cdsNotaFront : OleVariant; IdEmpresa, IdHotel : LongInt) : Boolean;
      {inclui o detalhe da nota no cds}
      procedure IncluiDetalhe(rIdIssHotel,rAliquota, rBaseCalculo, rValorImposto, rValorContabil : Double; DataCancelamento : string);
      {Lista as notas do Front - VHF}
      function ListNotasFront(DataLimite, DataFinal, IdHotel : string) : OleVariant;
      {Lista o Hotel da empresa própria - Pertence ao VHF}
      function ListHotel(IdPesoa : LongInt) : OleVariant;


    protected

    End;

implementation

{ TCtrlGeraLivroISSdoVHF }


procedure TCtrlGeraLivroISSdoVHF.AfterInitialize;
begin
  inherited;
  Terceiros.InitializeAs(self);
  LivroICMS.InitializeAs(self);
  Terceiros.OpenTransaction := false;
  LivroICMS.OpenTransaction := false;
end;

procedure TCtrlGeraLivroISSdoVHF.CarregaCdsLimpo;
Var
   Ssql : string;
begin
  //Traz apenas a estrutura da tabela
  Ssql := 'SELECT * FROM NFLIVRO WHERE (1 = 2)';
  CdsNflivro.data := GetDataPacket(Ssql);
  Ssql := 'SELECT * FROM NFLIVRODETALHE WHERE (1 = 2)';
  CdsNflivroDetalhe.data := GetDataPacket(Ssql);
end;

constructor TCtrlGeraLivroISSdoVHF.Create;
begin
  inherited;
  //Lists de terceiros
  Terceiros := TCtrlTerceiros.Create;
  //Carrega classe de negócio do livro
  LivroICMS := TCtrlLivroICMS.Create;
  CdsNflivrodetalhe  := TClientDataSet.Create(nil);
  cdsNflivro         := TClientDataSet.Create(nil);
  CdsLancamenFront   := TClientDataSet.Create(nil);
  CdsLancamenFront1  := TClientDataSet.Create(nil);
end;

destructor TCtrlGeraLivroISSdoVHF.Destroy;
begin
  inherited;
  CdsNflivrodetalhe.Free;
  CdsNflivro.free;
  CdsLancamenFront.free;
  CdsLancamenFront1.free;
end;

procedure TCtrlGeraLivroISSdoVHF.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlGeraLivroISSdoVHF.GeraLivroISSVHF(cdsNotaFront: OleVariant;  IdEmpresa, IdHotel : Integer): Boolean;
var
  TotalNota:Double;
begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.GeraLivroISSVHF(cdsNotaFront, IdEmpresa, IdHotel);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    Begin
      _Cds.data := cdsNotaFront;
      Result := True;
      _Cds.First;
      While not _Cds.EOF do
      Begin
         Try
            StartTransaction;
            CarregaCdsLimpo;
            CdsNflivro.append;
            CdsNflivro.fieldByname('IDPESSOA').Asinteger       := IdEmpresa;
            CdsNflivro.fieldByname('NUMNFINI').AsInteger       := _Cds.FieldByName('NUMERONOTA').AsInteger;
            CdsNflivro.fieldByname('NUMNFFIM').AsInteger       := _Cds.FieldByName('NUMERONOTAFINAL').AsInteger;
            CdsNflivro.fieldByname('DATAEMISSAONF').AsdateTime := _Cds.FieldByName('DATAEMISSAO').AsdateTime;
            CdsNflivro.fieldByname('DATAENTRADANF').AsdateTime := _Cds.FieldByName('DATAEMISSAO').AsdateTime;
            CdsNflivro.fieldByname('FLGENTRADASAIDA').Asstring := 'I';
            CdsNflivro.fieldByname('VLRTOTALNF').AsFloat       := 0;
            CdsNflivro.fieldByname('NFCOMPLEMENTO').AsFloat    := _Cds.FieldByName('SERIE').AsFloat;

            if not _Cds.FieldByName('IDFORCLI').isNull then
               CdsNflivro.fieldByname('IDFORCLI').AsFloat := _Cds.FieldByName('IDFORCLI').AsInteger;

            If not _Cds.FieldByName('DATACANCELAMENTO').isnull then
               CdsNflivro.fieldByname('OBSERVACAO').Asstring := 'Cancelada';


            sSql:='UPDATE NOTAFRONT SET FLGGEROULIVROISS = ''S'''+
                  'WHERE NUMERONOTA = '+_Cds.FieldByName('NUMERONOTA').AsString;

            if not ExecSQL(Ssql) then
               Raise Exception.Create(messageinfo);

            // Trata os lancamentos da nota
            CdsLancamenFront.data := Terceiros.ListLancamentosFront(_Cds.FieldByName('IDCONTA').AsInteger,
                                                                    IdHotel, IdEmpresa);
            CdsLancamenFront.first;
            if not cdsLancamenFront.IsEmpty then begin
               cdsLancamenFront.First;
               TotalNota := 0;
               while not cdsLancamenFront.Eof do begin
                  IncluiDetalhe(cdsLancamenFront.FieldByName('IDISSHOTEL').AsFloat,
                                cdsLancamenFront.FieldByName('ALIQUOTA').AsFloat,
                                cdsLancamenFront.FieldByName('BASECALCULO').AsFloat,
                                cdsLancamenFront.FieldByName('VALORIMPOSTO').AsFloat,
                                cdsLancamenFront.FieldByName('VALORCONTABIL').AsFloat,
                                _Cds.FieldByName('DATACANCELAMENTO').AsString);
                  TotalNota := TotalNota + cdsLancamenFront.FieldByName('VALORCONTABIL').AsFloat;
                  cdsLancamenFront.Next;
               end;
            end else begin
               CdsLancamenFront1.data := Terceiros.ListLancamentosFront1(_Cds.FieldByName('NUMERONOTA').AsInteger,
                                                                         IdHotel, IdEmpresa);
               cdsLancamenFront1.First;
               TotalNota := 0;
               while not cdsLancamenFront1.Eof do begin
                  IncluiDetalhe(cdsLancamenFront1.FieldByName('IDISSHOTEL').AsFloat,
                                cdsLancamenFront1.FieldByName('ALIQUOTA').AsFloat,
                                cdsLancamenFront1.FieldByName('BASECALCULO').AsFloat,
                                cdsLancamenFront1.FieldByName('VALORIMPOSTO').AsFloat,
                                cdsLancamenFront1.FieldByName('VALORCONTABIL').AsFloat,
                                _Cds.FieldByName('DATACANCELAMENTO').AsString);
                  TotalNota := TotalNota + cdsLancamenFront1.FieldByName('VALORCONTABIL').AsFloat;
                  cdsLancamenFront1.Next;
               end;
            end;

            //Liga meus cds aos da classe de negócio
            LivroICMS.CdsNflivro := CdsNflivro;
            LivroICMS.CdsNflivroDetalhe := CdsNflivroDetalhe;

            if not LivroICMS.GravarLivro then
               Raise Exception.Create(messageinfo);

            // Coloca o valor total da nota
            if TotalNota > 0 then begin
               sSql:='UPDATE NFLIVRO SET VLRTOTALNF = '+
                      OraNumero(TotalNota)+
                     ' WHERE IDNFLIVRO = '+IntToStr(LivroICMS.GetLastIdnflivro);
               if not ExecSQL(Ssql) then
                 Raise Exception.Create(messageinfo);
            End;
            Commit;
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
    end;
end;

procedure TCtrlGeraLivroISSdoVHF.IncluiDetalhe(rIdIssHotel,rAliquota, rBaseCalculo, rValorImposto, rValorContabil : Double; DataCancelamento : string);
begin
   CdsNflivroDetalhe.Append;
   CdsNflivroDetalhe.fieldByname('IDIMPOSTO').AsFloat   := rIdIssHotel;
   CdsNflivroDetalhe.fieldByname('ALIQUOTA').AsFloat    := rAliquota;


   If Trim(DataCancelamento) = '' then
     Begin
       CdsNflivroDetalhe.fieldByname('BASECALCULO').AsFloat   := rBaseCalculo;
       CdsNflivroDetalhe.fieldByname('VALORIMPOSTO').AsFloat  := rValorImposto;
       CdsNflivroDetalhe.fieldByname('VALORCONTABIL').ASFloat := rValorContabil;
       CdsNflivroDetalhe.fieldByname('VALORISENTO').ASFloat   := rValorContabil-rBaseCalculo;
     end
   else
     Begin
       CdsNflivroDetalhe.fieldByname('BASECALCULO').AsFloat   := 0;
       CdsNflivroDetalhe.fieldByname('VALORIMPOSTO').AsFloat  := 0;
       CdsNflivroDetalhe.fieldByname('VALORCONTABIL').ASFloat := 0;
       CdsNflivroDetalhe.fieldByname('VALORISENTO').ASFloat   := 0;
     end;
   CdsNflivroDetalhe.post;
end;



function TCtrlGeraLivroISSdoVHF.ListHotel(IdPesoa: Integer): OleVariant;
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

function TCtrlGeraLivroISSdoVHF.ListNotasFront(DataLimite, DataFinal,
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
          '   AND ((N.FLGGEROULIVROISS = ''N'') OR (N.FLGGEROULIVROISS IS NULL)) ';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlGeraLivroISSdoVHF.OnCreateAppServer;
begin
  inherited;
end;

function TCtrlGeraLivroISSdoVHF.OraNumero(rNumero: Double): string;
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
