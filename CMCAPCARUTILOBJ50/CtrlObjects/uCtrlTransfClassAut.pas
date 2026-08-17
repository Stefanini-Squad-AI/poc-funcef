unit uCtrlTransfClassAut;

{-------------------------------------------------------------------------------
Data      : 13/01/04
Pendência : 14451 - Nova Segregação de Recursos
Descrição : Passar a nova estrutura - IDSEGREGACRITER e DATASEGREGACRITER

Métodos Pendentes:
         TCtrlTransfClassAut.GravaTransfClassAut InsereLancaContab - 2 ocorrências


------------------------------------------------------------------------------}
interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, Classes,
     DbClient, uCMTypes, uCMClientDataSet, uCtrlDocumento, uCtrlLancamento,
     uListaCamposHistCapCar,  uCtrlModeloHistorico, JclMath;

type
  TCtrlTransfClassAut = class(TCmControlObject)
  Protected
    procedure AfterInitialize; Override;
  private
    _CdsAltTipo      : TCMClientDataSet;
    _Cds             : TCMClientDataSet;
    _CdsParam        : TCMClientDataSet;
    _CdsRateioDocum  : TCMClientDataSet;
    _Documento       : TCtrlDocumento;
    _Lancamento      : TCtrlLancamento;
    _ModeloHist      : TCtrlModeloHistorico;
  Public
    constructor Create;  Override;
    destructor  Destroy; Override;
    function GravaTransfClassAut(sDataAte, sDataRef, sRecPag : String;
                                 iTipoData, iIDEmpresa, iIDModulo, iIDUsuario, iPlano : Integer;
                                 ValorZero : Double;
                                 bIntegraContab : Boolean) : Boolean;

End;


implementation

{ TCtrlTransfClassAut }

procedure TCtrlTransfClassAut.AfterInitialize;
begin
  inherited;
  _Documento.InitializeAs(self);
  _Lancamento.InitializeAs(self);
  _ModeloHist.InitializeAs(self);
end;

constructor TCtrlTransfClassAut.Create;
begin
  inherited;
  _CdsAltTipo := TCMClientDataSet.Create(nil);
  _Cds := TCMClientDataSet.Create(nil);
  _CdsParam := TCMClientDataSet.Create(nil);
  _Documento := TCtrlDocumento.Create;
  _CdsRateioDocum := TCMClientDataSet.Create(nil);
  _Lancamento := TCtrlLancamento.Create;
  _ModeloHist    := TCtrlModeloHistorico.Create;
end;

destructor TCtrlTransfClassAut.Destroy;
begin
  _CdsAltTipo.Free;
  _Cds.Free;
  _CdsParam.Free;
  _Documento.Free;
  _CdsRateioDocum.Free;
  _Lancamento.Free;
  _ModeloHist.Free;
  inherited;
end;

function TCtrlTransfClassAut.GravaTransfClassAut(sDataAte, sDataRef, sRecPag : String;
                                                 iTipoData, iIDEmpresa, iIDModulo, iIDUsuario, iPlano : Integer;
                                                 ValorZero : Double;
                                                 bIntegraContab : Boolean) : Boolean;

var
  sCCustoD, sContaD, sCCustoC, sContaC, sSql, sHistorico : String;
  rSaldo, rValor, rTotal, rTotUN : Double;
  LstSQL : TStrings;
begin
  inherited;
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaTransfClassAut(sDataAte, sDataRef, sRecPag,
                                                       iTipoData, iIDEmpresa, iIDModulo,
                                                       iIDUsuario, iPlano, ValorZero,
                                                       bIntegraContab);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    LstSQL := TStringList.Create;
    try
      StartTransaction;

      Result := True;
      if trim(sDataAte) = '' then
        raise Exception.Create('Obrigatório preencher a Data');
      if trim(sDataRef) = '' then
        raise Exception.Create('Obrigatório preencher a Data do Lançamento');
      if StrToDate(sDataAte) >= Date then
        raise Exception.Create('Data não pode ser maior ou igual a data de hoje');

      with LstSQL do
      begin
        Clear;
        Append('SELECT                                                            ');
        Append('  IDPARAMTRFCONTAB,                                               ');
        Append('  IDPESSOA,                                                       ');
        Append('  RECPAG,                                                         ');
        Append('  CODTIPRECDESORIG,                                               ');
        Append('  CODTIPRECDESDEST,                                               ');
        Append('  PLANOORIG,                                                      ');
        Append('  PLACONTAORIG,                                                   ');
        Append('  PLANODEST,                                                      ');
        Append('  PLACONTADEST,                                                   ');
        Append('  FLGATIVO                                                        ');
        Append('FROM                                                              ');
        Append('  PARAMTRFCONTAB                                                  ');
        Append('WHERE                                                             ');
        Append('  IDPESSOA      = ' + IntToStr(iIDEmpresa)                         );
        Append('  AND RECPAG    = ' + QuotedStr(sRECPAG)                           );
        Append('  AND FLGAtivo  = ''S''                                           ');
        Append('  AND PLANOORIG = ' + IntToStr(iPlano)                             );
        Append('  AND PLANODEST = ' + IntToStr(iPlano)                             );
      end;
      _CdsParam.Data := GetDataPacket(LstSQL);
      if _CdsParam.IsEmpty then
        raise Exception.Create('Não existem Parâmetros de Transferência de Classificação Ativos.');
    {
      frmAguarde.Min:=0;
      frmAguarde.pos:=1;
      frmAguarde.max:=qryparam.recordcount;
      frmAguarde.Mostra('Processando ...') ;
      Application.ProcessMessages;
    }
      _CdsParam.First;
      while not _cdsParam.EOF do
      begin
        if (not _CdsParam.FieldByName('PLACONTADEST').IsNull) and
           (not _CdsParam.FieldByName('PLACONTAORIG').IsNull) then
        begin
          if bIntegraContab then
          begin
            _Cds.Close;
            with LstSQL do
            begin
              Clear;
              Append('SELECT DISTINCT                                                   ');
              Append('  D.CODDOCUMENTO,                                                 ');
              Append('  D.CODCENTROCUSTO,                                               ');
              Append('  D.NODOCUMENTO,                                                  ');
              Append('  D.COMPLDOCUMENTO,                                               ');
              Append('  P.RAZAOSOCIAL                                                   ');
              Append('FROM                                                              ');
              Append('  PESSOA P,                                                       ');
              Append('  DOCUMENTO D,                                                    ');
              Append('  RATEIODOCUM R                                                   ');
              Append('WHERE                                                             ');
              Append('  (D.IDPESSOA = ' + IntToStr(iIDEmpresa) + ') AND                 ');
              Append('  (RTRIM(D.PLACONTA) = RTRIM(' + QuotedStr(_CdsParam.FieldByName('PLACONTAORIG').AsString) + ')) AND   ');
              Append('  (D.PLANO = ' + IntToStr(iPlano) + ') AND                        ');
              Append('  (D.STATUS <> ''2'') AND                                         ');
              Append('  (D.RECPAG = ' + QuotedStr(sRecPag) + ') AND                     ');
              Append('  (D.IDFORCLI = P.IDPESSOA) AND                                   ');
              Append('  (D.CODDOCUMENTO = R.CODDOCUMENTO)                               ');
              if iTipoData = 0 Then
                Append('AND (D.DATAPROGRAMADA <= TO_DATE(' + QuotedStr(sDataAte) + ',''DD/MM/YYYY''))')
              else
                Append('AND (D.DATAVENCTO <= TO_DATE(' + QuotedStr(sDataAte) + ',''DD/MM/YYYY''))');

              if not _cdsParam.FieldByName('CODTIPRECDESORIG').IsNull then
                Append('AND (RTRIM(R.CODTIPRECDES) = RTRIM(' + _Cdsparam.FieldByName('CODTIPRECDESORIG').AsString + '))');
            end;
            _Cds.Data := GetDataPacket(LstSQL);

            if not _Cds.IsEmpty then
            begin
              _Cds.First;
              while not _Cds.EOF do
              begin
                _Documento.Saldo.CalculaSaldo(_Cds.FieldByName('CODDOCUMENTO').AsInteger, 0);
                rSaldo := _Documento.Saldo.Valor;

                if not IsFloatZero(rSaldo) then
                begin
                  if sRecPag = 'R' then
                  begin
                    sCCustoD := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                    sContaD  := _CdsParam.FieldByName('PLACONTADEST').AsString;
                    sCCustoC := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                    sContaC  := _CdsParam.FieldByName('PLACONTAORIG').AsString;
                  end
                  else
                  begin
                    sCCustoC := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                    sContaC  := _CdsParam.FieldByName('PLACONTADEST').AsString;
                    sCCustoD := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                    sContaD  := _CdsParam.FieldByName('PLACONTAORIG').AsString;
                  end;

                  with LstSQL do
                  begin
                    Clear;
                    Append('SELECT                                                ');
                    Append('  UNIDNEGOC,                                          ');
                    Append('  SUM(VALOR) AS VALOR                                 ');
                    Append('FROM                                                  ');
                    Append('  RATEIODOCUM                                         ');
                    Append('WHERE                                                 ');
                    Append('  CODDOCUMENTO = ' + _Cds.FieldByName('CODDOCUMENTO').AsString);
                    Append('GROUP BY                                              ');
                    Append('  UNIDNEGOC                                           ');
                  end;
                  _CdsRateioDocum.Data := GetDataPacket(LstSQL);

                  rTotUN := 0;
                  while not _CdsRateioDocum.EOF do
                  begin
                    rTotUN := rTotUN + _CdsRateioDocum.FieldByName('VALOR').AsFloat;
                    _CdsRateioDocum.Next;
                  end;

                  rTotal:=0;
                  _CdsRateioDocum.First;
                  while not _CdsRateioDocum.EOF do
                  begin
                    rValor := _CdsRateioDocum.FieldByName('VALOR').AsFloat * rSaldo/rTotUN;
                    rValor := StrToFloat(Format('%17.2f',[rValor]));
                    rTotal := rTotal + rValor;

                    sHistorico := 'Transferência da Conta ' +
                                  _CdsParam.FieldByName('PLACONTAORIG').AsString +
                                  ' para Conta ' + _CdsParam.FieldByName('PLACONTADEST').AsString +
                                  ' ref. atraso do documento ' + _Cds.FieldByName('NODOCUMENTO').AsString +
                                  '/' + _Cds.FieldByName('COMPLDOCUMENTO').AsString + ' ' +
                                  _Cds.FieldByName('RAZAOSOCIAL').AsString;
                    {

                    Ver historico padrao
                    if sRecPag = 'P' then idmodulo := 3 else idmodulo := 4;

                    sHistorico := GetHistoricoCapCar( _ModeloHist,iIDEmpresa, idmodulo 5,5, sHistorico,
                               [CdsMov.FieldByName('ALMOXORIGEM').AsString,
                               CdsMov.FieldByNama'NOMECENTROCUSTO').AsString,
                               CdsMov.FieldByName('CODCENTROCUSTO').AsString ]);
                     }

                    if not _Lancamento.InsereLancaContab('0',
                                                         iIDEmpresa,
                                                         iIDModulo,
                                                         iIDUsuario,
                                                         iPlano,
                                                         _cdsRateioDocum.FieldByName('UNIDNEGOC').AsFloat,
                                                         0,
                                                         0,
                                                         -1,
                                                         -1,
                                                         0,
                                                         0,
                                                         sDataRef,
                                                         _Cds.FieldByName('NODOCUMENTO').AsString + '/' +_Cds.FieldByName('COMPLDOCUMENTO').AsString,
                                                         sHistorico,
                                                         '','','','','03',
                                                         sCCustoD, sContaD,sCCustoC,sContaC,
                                                         '',
                                                         rValor,
                                                         False,
                                                         False,
                                                         -1, -1) then
                      raise Exception.Create(_Lancamento.MessageInfo);
                    _CdsRateioDocum.Next;
                  end;

                  if Format('%17.2f',[rSaldo]) <> Format('%17.2f',[rTotal]) then
                  begin
                    _CdsRateioDocum.First;
                    rValor := rSaldo - rTotal;
                    if not _Lancamento.InsereLancaContab('0',
                                                         iIDEmpresa,
                                                         iIDModulo,
                                                         iIDUsuario,
                                                         iPlano,
                                                         _cdsRateioDocum.FieldByName('UNIDNEGOC').AsFloat,
                                                         0,
                                                         0,
                                                         -1,
                                                         -1,
                                                         0,
                                                         0,
                                                         sDataRef,
                                                         _Cds.FieldByName('NODOCUMENTO').AsString + '/' +_Cds.FieldByName('COMPLDOCUMENTO').AsString,
                                                         sHistorico,
                                                         '','','','','03',
                                                         sCCustoD, sContaD,sCCustoC,sContaC,
                                                         '',
                                                         rValor,
                                                         False,
                                                         False,
                                                         -1, -1) then
                      raise Exception.Create(_Lancamento.MessageInfo);
                  end;

                  if not ExecSQL(' UPDATE DOCUMENTO SET PLACONTA = ' +
                                   QuotedStr(_CdsParam.FieldByName('PLACONTADEST').AsString) +
                                 ' WHERE CODDOCUMENTO = ' +
                                  _Cds.FieldByName('CODDOCUMENTO').AsString) then
                    raise Exception.Create(MessageInfo);
                end;
                _Cds.Next;
              end;
            end
            else
              raise Exception.Create('Não existem registros a serem reclassificados no período.');
          end;
        end;

        if (trim(_CdsParam.FieldByName('CODTIPRECDESDEST').AsString) <> '') and
           (trim(_CdsParam.FieldByName('CODTIPRECDESORIG').AsString) <> '') then
        begin
          with LstSQL do
          begin
            Clear;
            Append('SELECT                                                            ');
            Append('  R.CODDOCUMENTO,                                                 ');
            Append('  R.IDPESSOA,                                                     ');
            Append('  R.CODTIPRECDES,                                                 ');
            Append('  R.RECPAG,                                                       ');
            Append('  R.CODCENTRORESPON,                                              ');
            Append('  R.UNIDNEGOC                                                     ');
            Append('FROM                                                              ');
            Append('  DOCUMENTO D,                                                    ');
            Append('  RATEIODOCUM R                                                   ');
            Append('WHERE                                                             ');
            Append('  (D.IDPESSOA = ' + IntToStr(iIDEmpresa) + ') AND                 ');
            Append('  (D.STATUS <> ''2'') AND                                         ');
            Append('  (D.RECPAG = ' + QuotedStr(sRecPag) + ') AND                     ');
            Append('  (D.CODDOCUMENTO = R.CODDOCUMENTO) AND                           ');
            Append('  (RTRIM(R.CODTIPRECDES) = RTRIM(' + QuotedStr(_CdsParam.FieldByName('CODTIPRECDESORIG').AsString) + '))');
            if iTipoData = 0 Then
              Append('AND (D.DATAPROGRAMADA <= TO_DATE(' + QuotedStr(sDataAte) + ',''DD/MM/YYYY''))')
            else
              Append('AND (D.DATAVENCTO <= TO_DATE(' + QuotedStr(sDataAte) + ',''DD/MM/YYYY''))');
          end;
          _CdsAltTipo.Data := GetDataPacket(LstSQL);

          if _CdsAltTipo.IsEmpty then
            raise Exception.Create('Não foi encontrado nenhum registro para reclassificação')

          else
          begin
            _CdsAltTipo.First;
            while not _CdsAltTipo.EOF do
            begin
              _Documento.Saldo.CalculaSaldo(_CdsAltTipo.FieldByName('CODDOCUMENTO').AsInteger,0);
              rSaldo := _Documento.Saldo.Valor;

              if not IsFloatZero(rSaldo) then
              begin
                sSql := ' UPDATE RATEIODOCUM SET CODTIPRECDES = ' + QuotedStr(_CdsParam.FieldByName('CODTIPRECDESDEST').AsString) + ' ' +
                        ' WHERE CODDOCUMENTO = ' + _CdsAltTipo.FieldByName('CODDOCUMENTO').AsString + ' AND ' +
                        ' IDPESSOA = ' + _CdsAltTipo.FieldByName('IDPESSOA').AsString + ' AND ' +
                        ' CODTIPRECDES = ' + QuotedStr(_CdsAltTipo.FieldByName('CODTIPRECDES').AsString) + ' AND ' +
                        ' RECPAG = ' + QuotedStr(_CdsAltTipo.FieldByName('RECPAG').AsString) + ' AND ' +
                        ' CODCENTRORESPON = ' + QuotedStr(_CdsAltTipo.FieldByName('CODCENTRORESPON').AsString) + ' AND ' +
                        ' UNIDNEGOC = ' + QuotedStr(_CdsAltTipo.FieldByName('UNIDNEGOC').AsString);
                if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);
              end;
              _CdsAltTipo.Next;
            end;
          end;
        end
        else
          raise Exception.Create('Não existem registros a serem reclassificados no período.');
        _CdsParam.Next;
      end;
      Commit;
      LstSQL.Free;
    except
      on E:Exception do
      begin
        if LstSQL <> Nil then LstSQL.Free;
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
