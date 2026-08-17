unit uCtrlExpDaiea;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
     uCtrlImovel;

Type
  TCtrlExpDaiea = class(TCmControlObject)
    private
      CtrlImovel : TCtrlImovel;

     protected
       procedure AfterInitialize;   Override;

    public
      constructor Create;  override;
      destructor  Destroy; override;

      function GeraArquivo(const dGeracao : TDateTime; var vArquivo: OLEVariant; sNomeBilhete:String) : Boolean;
    published

  end;

implementation

uses uComunsImobiliario, uCaf;

{ TCtrlExpDaiea }

constructor TCtrlExpDaiea.Create;
begin
  inherited;
  CtrlImovel := TCtrlImovel.Create;
end;

destructor TCtrlExpDaiea.Destroy;
begin
  inherited;
  FreeAndNil( CtrlImovel );
end;

procedure TCtrlExpDaiea.AfterInitialize;
begin
  inherited;
  CtrlImovel.InitializeAs( Self );
end;

function TCtrlExpDaiea.GeraArquivo(const dGeracao: TDateTime; var vArquivo: OLEVariant; sNomeBilhete:String) : Boolean;
var _cdsResult, _cdsImovel : TCMClientDataSet;
    sReg, sErro, sCampo : String;
    iAtual, iTotReg : Integer;
    fCampo : Extended;
begin
  Result := True;
  try
    _cdsResult := TCMClientDataSet.Create( nil );
    _cdsImovel := TCMClientDataSet.Create( nil );
    _cdsResult.Data := GetDataPacket('SELECT ' + QuotedStr(ComunsImobiliario.Space(2000)) + ' AS LINHA FROM DUAL WHERE 1=2');
    _cdsImovel.Data := CtrlImovel.LookupImovelDaiea;
    iTotReg := _cdsImovel.RecordCount;
    iAtual  := 1;

    _cdsImovel.First;
    while not _cdsImovel.Eof do begin
      // Início do Registro  ( num )
      sErro := '';
      sReg  := '19' +#9;

      // Código da Entidade  ( num )

      // Código do Plano  ( num )

      // Data de Referência  ( Data )
      sReg := sReg + QuotedStr(FormatDateTime('DD/MM/YYYY',dGeracao)) +#9;

      // Código do Tipo de CNPJ  ( num )

      // CNPJ do Fundo  ( char )

      // Inclui Sigla do Estado  ( char )
      sCampo := _cdsImovel.FieldByName('UF').AsString;
      sReg   := sReg + QuotedStr(sCampo) +#9;
      if sCampo = '' then
        sErro := sErro + _cdsImovel.FieldByName('IMOVEL_EXTENSO').AsString + ' - UF Inválido'+#13;

      // Inclui Código do IBGE da cidade  ( num )
      sCampo := _cdsImovel.FieldByName('CODMUNICIPIOIBGE').AsString;
      if sCampo = '' then begin
        sReg  := sReg  + QuotedStr('');
        sErro := sErro + _cdsImovel.FieldByName('IMOVEL_EXTENSO').AsString + ' - Código do IBGE da cidade inválido'+#13;
      end else begin
        sReg := sReg + sCampo +#9;
      end;

      // Inclui Rua / Logradouro  ( char )
      sCampo := _cdsImovel.FieldByName('IMOLOGRADOURO').AsString;
      sReg   := sReg + QuotedStr(sCampo) +#9;
      if sCampo = '' then
        sErro := sErro + _cdsImovel.FieldByName('IMOVEL_EXTENSO').AsString + ' - Logradouro Inválido'+#13;

      // Inclui Número  ( char )
      sCampo := _cdsImovel.FieldByName('IMONUMERO').AsString;
      sReg   := sReg + QuotedStr(sCampo) +#9;
      if sCampo = '' then
        sErro := sErro + _cdsImovel.FieldByName('IMOVEL_EXTENSO').AsString + ' - Número Inválido'+#13;

      // Inclui Complemento ( char )
      sCampo := _cdsImovel.FieldByName('IMOCOMPLEMENTO').AsString + ' ' + _cdsImovel.FieldByName('IMOBAIRRO').AsString;
      sReg   := sReg + QuotedStr(sCampo) +#9;
      if sCampo = ' ' then
        sErro := sErro + _cdsImovel.FieldByName('IMOVEL_EXTENSO').AsString + ' - Complemento / Bairro Inválido'+#13;

      // Inclui CEP ( char )
      sCampo := _cdsImovel.FieldByName('IMOCEP').AsString;
      sCampo := ComunsImobiliario.StrTran(sCampo,'.');
      sCampo := ComunsImobiliario.StrTran(sCampo,'-');
      sReg   := sReg + QuotedStr(sCampo) +#9;
      if sCampo = '' then
        sErro := sErro + _cdsImovel.FieldByName('IMOVEL_EXTENSO').AsString + ' - CEP Inválido'+#13;

      // Inclui Nome Comercial ( char )
      sReg := sReg + QuotedStr(_cdsImovel.FieldByName('IMOVEL_EXTENSO').AsString) +#9;

      // Código da carteira da 2829  ( char )

      // Percentual do Plano no imóvel  ( num )
      sReg := sReg + IntToStr(100) +#9;

      // Valor Contábil  ( num )
   if iAtual < 20 then begin
      fCampo := ComunsImobiliario.Arredonda( CAF.SaldoContabilImovel(_cdsImovel.FieldByName('IDIMOVEL').AsInteger, -1, dGeracao), 2);
      sCampo := ComunsImobiliario.StrTran(FloatToStr(fCampo),',','.');
      sReg   := sReg  + sCampo +#9;
      if fCampo <= 0 then
        sErro := sErro + _cdsImovel.FieldByName('IMOVEL_EXTENSO').AsString + ' - Saldo Contábil Inválido'+#13;
   end;

      // Justificativa para o valor contábil  ( num / opcional )
      sReg   := sReg + '0' +#9;

      // Valor de Avaliação  ( num / opcional )
      fCampo := _cdsImovel.FieldByName('IMOVLRREAVAL').AsFloat;
      sCampo := ComunsImobiliario.StrTran(FloatToStr(fCampo),',','.');
      sReg   := sReg + sCampo +#9;

      // Data da Avaliação  ( Data / opcional )
      if _cdsImovel.FieldByName('IMODATAREAVAL').IsNull then
           sReg := sReg + QuotedStr('') +#9
      else sReg := sReg + QuotedStr(FormatDateTime('DD/MM/YYYY',_cdsImovel.FieldByName('IMODATAREAVAL').AsDateTime)) +#9;

      // CNPJ da empresa avaliadora  ( char / opcional )
      sReg := sReg + QuotedStr('') +#9;

      // Aluguel Contratado  ( num / opcional )
      sReg := sReg + '0' +#9;

      // Aluguel Atrasado  ( num / opcional )
      sReg := sReg + '0' +#9;

      // Opção/Obrigação de recompra  ( char / opcional )
      sReg := sReg + QuotedStr('') +#9;

      // Data da opção / obrigação de recompra  ( Data / opcional )
      sReg := sReg + QuotedStr('') +#9;

      // Tipo de Imóvel  ( num )
      sReg := sReg + '0' +#9;

      // Questionamento Jurídico  ( char / opcional )
      sReg := sReg + QuotedStr('') +#9;

      // Motivo do Questionamento Jurídico  ( char / opcional )
      sReg := sReg + QuotedStr('') +#9;

      // Locado a Patrocinadora  ( char / opcional )
      if _cdsImovel.FieldByName('CODTIPIMOVEL').AsString = 'PATRO' then
           sReg := sReg + QuotedStr('S') +#13
      else sReg := sReg + QuotedStr('N') +#13;

      _cdsResult.Insert;
      _cdsResult.FieldByName('LINHA').AsString := sReg;
      _cdsResult.Post;

      // Envia o identificador do registro processado para o Cliente
      DoProgresso([sNomeBilhete, iAtual, iTotReg, sErro]);

      if sErro <> '' then Result := False;
      Inc(iAtual);
      _cdsImovel.Next;
    end;
  finally
    vArquivo := _cdsResult.Data;
    FreeAndNil( _cdsResult );
    if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);
  end;
end;

end.
