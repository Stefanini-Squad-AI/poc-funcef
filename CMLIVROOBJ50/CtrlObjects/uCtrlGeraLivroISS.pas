unit uCtrlGeraLivroISS;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCtrlTerceiros, uCtrlTipoAltxImpostos,
     uCtrlParamLivro, uCtrlLivroICMS, DBaseDados, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlGeraLivroISS = Class(TCmControlObject)
    private
      Terceiros : TCtrlTerceiros;
      LivroICMS : TCtrlLivroICMS;
      IdPessoa : longint;
      sSql : string;
      //Cds a serem utilizados
      CdsNflivro: TClientDataSet;
      CdsNflivroDetalhe: TClientDataSet;
      cdsAux : TclientDataSet;
      cds : TclientDataSet;
      CdsTestaData : TClientDataSet;
      CdsLancamenVHL : TClientDataSet;
      CdsVerificaDetalhe : TClientDataSet;
      CdsVerificaDetalhe1 : TClientDataSet;
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
      function GeraLivroISS(cdsNotaVHL : OleVariant; IdEmpresa, IdHotel : LongInt) : Boolean;
      {inclui o detalhe da nota no cds}
      procedure IncluiDetalhe(cdsNotaVHL : TClientDataSet);
      {Pontera o cds do detalhe para a aliquota caso exista}
      function PonteraDetalheAliquota(Aliquota : real) : Boolean;
      {Apaga todos os registros do cds}
      procedure ZeraCds(cds : TClientDataSet);
      {Lista as notas do VHL}
      function ListNotasVHL(DataLimite, DataFinal, IdHotel : string) : OleVariant;
      {Lista o Hotel da empresa própria - Pertence ao VHF}
      function ListHotel(IdPesoa : LongInt) : OleVariant;
      {Insere hospede no pessoa }
      function InsereHospede(ONota : OleVariant) : Boolean;
      function PegaId(Tabela : string) : LongInt;
      function ListHospede(Num_nota, Cod_Hospede : longInt) : OleVariant;

    protected

    End;

implementation

{ TCtrlGeraLivroISS }


procedure TCtrlGeraLivroISS.AfterInitialize;
begin
  inherited;
  Terceiros.InitializeAs(Self);
  LivroICMS.InitializeAs(Self);
  Terceiros.OpenTransaction := false;
  LivroICMS.OpenTransaction := false;
end;

procedure TCtrlGeraLivroISS.CarregaCdsLimpo;
Var
   Ssql : string;
begin
  //Traz apenas a estrutura da tabela
  Ssql := 'SELECT * FROM NFLIVRO WHERE (1 = 2)';
  CdsNflivro.data := GetDataPacket(Ssql);
  Ssql := 'SELECT * FROM NFLIVRODETALHE WHERE (1 = 2)';
  CdsNflivroDetalhe.data := GetDataPacket(Ssql);
end;

constructor TCtrlGeraLivroISS.Create;
begin
  inherited;
  //Lists de terceiros
  Terceiros := TCtrlTerceiros.Create;

  //Carrega classe de negócio do livro
  LivroICMS := TCtrlLivroICMS.Create;
  CdsNflivrodetalhe   := TClientDataSet.Create(nil);
  cdsNflivro          := TClientDataSet.Create(nil);
  CdsTestaData        := TClientDataSet.Create(nil);
  cds                 := TClientDataSet.Create(nil);
  CdsLancamenVHL      := TClientDataSet.Create(nil);
  CdsVerificaDetalhe  := TClientDataSet.Create(nil);
  CdsVerificaDetalhe1 := TClientDataSet.Create(nil);
  cdsAux              := TClientDataSet.Create(nil); 
end;

destructor TCtrlGeraLivroISS.Destroy;
begin
  inherited;
  CdsNflivrodetalhe.Free;
  CdsNflivro.free;
  CdsTestaData.free;
  cds.free;
  CdsLancamenVHL.free;
  CdsVerificaDetalhe.free;
  CdsVerificaDetalhe1.free;
  CdsAux.free;
end;

procedure TCtrlGeraLivroISS.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlGeraLivroISS.GeraLivroISS(cdsNotaVHL : OleVariant;  IdEmpresa, IdHotel : Integer): Boolean;
begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.GeraLivroISS(cdsNotaVHL, IdEmpresa, IdHotel);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    Begin
      _Cds.Data := cdsNotaVHL;
      Result := True;
      _Cds.First;
      While not _Cds.EOF do
      Begin
         Try
            StartTransaction;
            CarregaCdsLimpo;

             CdsNflivro.Append;
             CdsNflivro.fieldByname('IDPESSOA').Asinteger := IdEmpresa;
             if _Cds.FieldByName('NOTA_INICIAL').IsNull then
                CdsNflivro.fieldByname('NUMNFINI').AsInteger := _Cds.FieldByName('NUM_NOTA').AsInteger
             else
                CdsNflivro.fieldByname('NUMNFINI').AsInteger := _Cds.FieldByName('NOTA_INICIAL').AsInteger;

             CdsNflivro.fieldByname('NUMNFFIM').AsInteger := _Cds.FieldByName('NOTA_FINAL').AsInteger;
             CdsNflivro.fieldByname('DATAEMISSAONF').AsDateTime := _Cds.FieldByName('DATA_NOTA').AsDateTime;
             CdsNflivro.fieldByname('DATAENTRADANF').AsdateTime := _Cds.FieldByName('DATA_NOTA').AsDateTime;
             CdsNflivro.fieldByname('FLGENTRADASAIDA').Asstring := 'I';


             if not _Cds.FieldByName('FLAGSERIE').IsNull then
                CdsNflivro.fieldByname('NFCOMPLEMENTO').Asstring := _Cds.FieldByName('FLAGSERIE').AsString;

             If Trim(_Cds.FieldByName('FLAG_CANCELAMENTO').AsString) = 'False' then begin
                CdsNflivro.fieldByname('VLRTOTALNF').AsFloat :=  _Cds.FieldByName('TOTAL_NOTA').AsFloat;
             end else begin
                CdsNflivro.fieldByname('VLRTOTALNF').AsFloat :=  _Cds.FieldByName('TOTAL_NOTA').AsFloat;
                CdsNflivro.fieldByname('OBSERVACAO').Asstring := 'Cancelada';
             end;

            //
            CdsLancamenVHL.data := Terceiros.ListLancamentosVHL(_Cds.FieldByName('NUM_NOTA').AsString,
                                                                IntToStr(IdHotel),
                                                                IntToStr(IdEmpresa));


            cdsAux.data := ListHospede(_Cds.FieldByName('NUM_NOTA').Asinteger, CdsLancamenVHL.fieldByname('COD_HOSPEDE').Asinteger);
            InsereHospede(cdsAux.data);
            CdsNflivro.fieldByname('IDFORCLI').Asinteger := IdPessoa;

            cdsLancamenVHL.First;
            While not cdsLancamenVHL.Eof do
              Begin
                 IncluiDetalhe(_Cds);
                 cdsLancamenVHL.Next;
              end;

            //Liga meus cds aos da classe de negócio
            LivroICMS.CdsNflivro := CdsNflivro;
            LivroICMS.CdsNflivroDetalhe := CdsNflivroDetalhe;
            if not LivroICMS.GravarLivro then
              Raise Exception.Create(LivroICMS.messageinfo)
            else
              Begin
                // Atualiza o flag de gerou registro na tabela de NFLivro
                sSql :='UPDATE NOTAVHL SET FLGGEROULIVROISS = ''S'' '+
                      'WHERE NUM_NOTA = '+_Cds.FieldByName('NUM_NOTA').AsString;

                if not ExecSQL(Ssql) then
                   Raise Exception.Create(messageinfo);
              end;

            Commit;
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
    end;
end;

procedure TCtrlGeraLivroISS.IncluiDetalhe(cdsNotaVHL : TClientDataSet);
begin
  if Trim(cdsNotaVHL.FieldByName('FLAG_CANCELAMENTO').AsString) = 'False' then
    Begin
      CdsNflivroDetalhe.Append;
      CdsNflivroDetalhe.fieldByname('IDIMPOSTO').Asinteger := cdsLancamenVHL.FieldByName('IDISSHOTEL').AsInteger;
      CdsNflivroDetalhe.fieldByname('ALIQUOTA').AsFloat    := cdsLancamenVHL.FieldByName('ALIQUOTA').AsFloat;

      if cdsLancamenVHL.FieldByName('ALIQUOTA').AsFloat <> 0 then begin
        {Quando o parametro FLGTAXASERVICO da tabela paramlivro esta setado com S a taxa de serviço deve set
        incorporada a base de calculo
        }
        CdsNflivroDetalhe.fieldByname('BASECALCULO').AsFloat  := cdsLancamenVHL.FieldByName('BASECALCULO').AsFloat;
        CdsNflivroDetalhe.fieldByname('VALORIMPOSTO').AsFloat := cdsLancamenVHL.FieldByName('VALORIMPOSTO').AsFloat;
      end;

      CdsNflivroDetalhe.fieldByname('VALORCONTABIL').AsFloat := cdsLancamenVHL.FieldByName('VALORCONTABIL').AsFloat;
      CdsNflivroDetalhe.post;
   end;

end;

function TCtrlGeraLivroISS.InsereHospede(ONota: Olevariant): Boolean;
Var
 Ssql : string;
 IdEnPess, IdCidades, idEndereco : longInt;
begin
  If ConnectionSide = cnsClient Then
    Begin
       Result := Connection.AppServer.InsereHospede(cds.Data);
       If Not Result Then
          MessageInfo := Connection.AppServer.MessageInfo;
    End
    else
      Begin
        cds.data := Onota;
        Idpessoa   := PegaId('PESSOA');
        idEndereco := PegaId('ENDPESS');
        idCidades  := PegaId('CIDADES');
        Result := true;
        Ssql := 'INSERT INTO PESSOA (IDPESSOA, NOME, TIPO, EMAIL, NUMDOCUMENTO, IDENDCORRESP) '+
                ' VALUES '+
                ' ('+intTostr(IdPessoa)+ ', '+quotedStr(cds.fieldByname('NOME_HOSPEDE').Asstring + ' ' + cds.fieldByname('SOBRE_NOME').Asstring) + ', '+
                ' ''F'', '+ quotedStr(cds.fieldByname('EMAIL').Asstring) + ', '+ quotedStr(StringReplace(cds.fieldByname('CPF').asstring, '-', '', [rfReplaceAll])) + ', '+intTostr(idEndereco) + ')';

        if not execSql(Ssql) then
           Begin
             Result := False;
             exit;
           end;

        Ssql := 'INSERT INTO ENDPESS (IDPESSOA, IDENDERECO, LOGRADOURO, CODESTADO, '+
                ' BAIRRO, CEP, TIPOENDERECO, IDCIDADES) '+
                ' VALUES ('+ intTostr(IdPessoa)+ ', '+ intTostr(idEndereco)+ ', '+ quotedStr(cds.fieldByname('ENDERECO').Asstring) +', '+
                ' '+ quotedStr(cds.fieldByname('COD_ESTADO').Asstring) + ', '+ quotedStr(cds.fieldByname('BAIRRO').Asstring) + ', '+
                ' '+ quotedStr(cds.fieldByname('CEP').Asstring) + ', '+ quotedStr('C') +', '+ intTostr(idCidades) + ') ';

        if not execSql(Ssql) then
           Begin
             Result := False;
             exit;
           end;

        Ssql := 'INSERT INTO CIDADES (IDCIDADES, CODESTADO, NOME) VALUES ('+
                ' '+intTostr(idcidades) + ', '+ quotedStr(cds.fieldByname('COD_ESTADO').Asstring) + ', '+
                ' '+ quotedStr(cds.fieldByname('CIDADE').Asstring) + ') ';

        if not execSql(Ssql) then
           Begin
             Result := False;
             exit;
           end;
      end;
end;

function TCtrlGeraLivroISS.ListHospede(Num_nota, Cod_Hospede: Integer): OleVariant;
Var
  Ssql : string;
begin
  if CdsLancamenVHL.IsEmpty then
     Begin
       Ssql := 'SELECT COD_HOSPEDE FROM LANCAMENVHL WHERE NUM_NOTA = '+intTostr(Num_nota);
       cdsAux.data := getdatapacket(Ssql);
       Ssql := 'SELECT * FROM HOSPEDEVHL '+
               ' WHERE COD_HOSPEDE = '+cdsAux.fieldByname('COD_HOSPEDE').Asstring;
     end
  else
       Ssql := 'SELECT * FROM HOSPEDEVHL '+
               ' WHERE COD_HOSPEDE = '+intTostr(Cod_Hospede);
  Result := GetDataPacket(Ssql);

end;

function TCtrlGeraLivroISS.ListHotel(IdPesoa: Integer): OleVariant;
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

function TCtrlGeraLivroISS.ListNotasVHL(DataLimite, DataFinal,
                                        IdHotel: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT NUM_NOTA,DATA_NOTA, TAXA_SERVICO, TOTAL_NOTA,FLAG_CANCELAMENTO,NOTA_FINAL,NOTA_INICIAL,FLAGSERIE ' +
          '  FROM NOTAVHL ' +
          ' WHERE (DATA_NOTA BETWEEN TO_DATE('''+DataLimite+''',''DD/MM/YYYY'') ' +
          '   AND TO_DATE('''+DataFinal+''',''DD/MM/YYYY'')) AND ' +
          '       ((FLGGEROULIVROISS = ''N'') OR (FLGGEROULIVROISS IS NULL)) '+
          ' AND TOTAL_NOTA > 0 ';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlGeraLivroISS.OnCreateAppServer;
begin
  inherited;
  
end;

function TCtrlGeraLivroISS.OraNumero(rNumero: Double): string;
var sNumero : string;
    AuxDec  : char;
begin
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   sNumero:= FloatToStr(rNumero);
   Result :=sNumero;
   DecimalSeparator:=AuxDec;
end;

function TCtrlGeraLivroISS.PegaId(Tabela: string): LongInt;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.PegaId(Tabela);
     If Result <= 0 Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  else
    Result := GetSequence(Tabela);

end;

function TCtrlGeraLivroISS.PonteraDetalheAliquota(Aliquota : real) : Boolean;
Var
  bAchou : Boolean;
begin
  bAchou := False;
  CdsNflivroDetalhe.First;
  while (not CdsNflivroDetalhe.eof) and (not bAchou) do
    Begin
      if CdsNflivroDetalhe.fieldByname('Aliquota').AsFloat = Aliquota then
         bAchou := true;
      CdsNflivroDetalhe.next;
    end;
  Result := bAchou;  
end;

procedure TCtrlGeraLivroISS.ZeraCds(cds: TClientDataSet);
begin
  cds.First;
  while not cds.eof do
    cds.delete;
end;

end.
