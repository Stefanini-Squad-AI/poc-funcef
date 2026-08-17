unit uCtrlAcertaBaixa;

{-------------------------------------------------------------------------------
Data      : 13/01/04
Pendência : 14451 - Nova Segregação de Recursos
Descrição : Passar a nova estrutura - IDSEGREGACRITER e DATASEGREGACRITER

Métodos Pendentes:
          TCtrlAcertaBaixa.GravaAcertoBaixa

------------------------------------------------------------------------------}

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
  DbClient, uCMTypes, uCtrlLancamento, uCMClientDataSet, Classes ;

type
  TCtrlAcertaBaixa = class(TCmControlObject)
  protected
    procedure AfterInitialize; override;
  private
    _cds        : TCMClientDataSet;
    _cdsPlanil  : TCMClientDataSet;
    _Lancamento : TCtrlLancamento;
  public
    constructor Create; override;
    destructor  Destroy; override;
    function    GravaAcertoBaixa(iIDEmpresa, iIDUsuario, iIDModulo, iPlano : Integer;
                                 bUsaPlanoPatro, bExcluiPlanilha : Boolean;
                                 sDataInicial, sDataFinal : String) : Boolean;
  end;
implementation

{ TCtrlAcertaBaixa }

procedure TCtrlAcertaBaixa.AfterInitialize;
begin
  inherited;
  _Lancamento.InitializeAs(self);
end;

constructor TCtrlAcertaBaixa.Create;
begin
  inherited;
  _cds := TCMClientDataSet.Create(nil);
  _cdsPlanil := TCMClientDataSet.Create(nil);
  _Lancamento := TCtrlLancamento.Create;
end;

destructor TCtrlAcertaBaixa.Destroy;
begin
  _cds.Free;
  _cdsPlanil.Free;
  _Lancamento.Free;
  inherited;
end;

function TCtrlAcertaBaixa.GravaAcertoBaixa(iIDEmpresa, iIDUsuario, iIDModulo, iPlano : Integer;
                                           bUsaPlanoPatro, bExcluiPlanilha : Boolean;
                                           sDataInicial, sDataFinal : String): Boolean;
var
  rValorLanc : Double;
  iNumLancNao, iNumLancAcer : Integer;
  LstSQL : TStrings;
begin
  inherited;
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaAcertoBaixa(iIDEmpresa, iIDUsuario, iIDModulo, iPlano,
                                                    bUsaPlanoPatro, bExcluiPlanilha,
                                                    sDataInicial, sDataFinal);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Try
      StartTransaction;
      Result       := True;
      iNumLancNao  := 0;
      iNumLancAcer := 0;
      LstSQL := TStringList.Create;
      with LstSQL do
      begin
        Append('SELECT DISTINCT L.PLNCODIGO, P.PLACONTA, P.UNIDNEGOC,           ');
        Append('  DECODE(P.DESCFINAN,NULL,                                      ');
        Append('  F.DESCRICAO||'' No. ''||LTRIM(RTRIM(R.NUMCHQBORDERO)),        ');
        Append('  P.DESCFINAN||'' No. ''||LTRIM(RTRIM(R.NUMCHQBORDERO))) AS DESCRICAO');
        Append('FROM LANCTODOCUM L, RECBTOPAGTO R, PORTADORFORMA P, DOCUMENTO D,');
        Append('     FORMARECPAG F                                              ');
        Append('WHERE (RTRIM(L.OPERACAO) = ''5'') AND                           ');
        Append('      (D.RECPAG = ''P'') AND                                    ');
        Append('      (D.IDPESSOA = ' + IntToStr(iIDEmpresa) + ') AND           ');
        Append('      (L.DATALANCTO >= TO_DATE(' + QuotedStr(sDataInicial) + ' ,''DD/MM/YYYY'') ) AND ');
        Append('      (L.DATALANCTO <= TO_DATE(' + QuotedStr(sDataFinal) + ' ,''DD/MM/YYYY'') ) AND ');
        Append('      (P.UNIDNEGOC IS NOT NULL) AND                             ');
        Append('      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                     ');
        Append('      (L.CODDOCUMENTO = R.CODDOCUMENTO) AND                     ');
        Append('      (L.NUMLANCTO = R.NUMLANCTO) AND                           ');
        Append('      (R.CODPORTFORMA = P.CODPORTFORMA) AND                     ');
        Append('      (P.CODFORMA = F.CODFORMA)                                 ');
      end;
      _cds.Data := GetDataPacket(LstSQL);

      LstSQL.Free;

      if _cds.IsEmpty then
        raise Exception.Create('Não existe nenhum Lançamento neste Período');

      _cds.First;
      while not _cds.EOF do
      begin
        _cdsPlanil.Data := GetDataPacket('SELECT P.PLNCODIGO,L.LACNUMLAN, P.PLNDATDIA,L.LACVALOR, ' +
                                         '  P.PERNUMERO, P.PEREXERCICIO, L.LACNUMDOC,L.PLACONTA, ' +
                                         '  L.LACHIST1,L.LACHIST2,L.LACHIST3,L.LACHIST4, ' +
                                         '  L.LACHIST5,L.LACDEBCRE,P.IDMODULO ' +
                                         'FROM LANCAMENTO L, PLANILHA P ' +
                                         'WHERE (P.PLNCODIGO = ' + _cds.FieldByName('PLNCODIGO').AsString + ') AND ' +
                                         ' (RTRIM(L.PLACONTA) = ' + QuotedStr(trim(_cds.FieldByName('PLACONTA').AsString)) + ') AND ' +
                                         ' (P.PLNCODIGO = L.PLNCODIGO)');

        if _cdsPlanil.IsEmpty then
           iNumLancNao := iNumLancNao + 1
        else
        begin
          iNumLancAcer := iNumLancAcer + 1;
          rValorLanc   := 0;
          _cdsPlanil.First;
          While not _cdsPlanil.EOF do
          begin
            if _cdsPlanil.FieldByName('LACDEBCRE').AsString = 'D' then
              rValorLanc := rValorLanc + _cdsPlanil.FieldByName('LACVALOR').AsFloat
            else
              rValorLanc := rValorLanc - _cdsPlanil.FieldByName('LACVALOR').AsFloat;

            if not _Lancamento.ExcluiLancaContab(iIDUsuario, _cdsPlanil.FieldByName('PLNCODIGO').AsInteger,
                                                 iIDModulo, _cdsPlanil.FieldByName('LACNUMLAN').AsInteger,
                                                 bUsaPlanoPatro, bExcluiPlanilha) then
              Raise Exception.Create(_Lancamento.MessageInfo);
            _cdsPlanil.Next;
          end;
          _cdsPlanil.First;

          if not _Lancamento.InsereLancaContab('0',
                                               iIDEmpresa,
                                               iIDModulo,
                                               iIDUsuario,
                                               iPlano,
                                               _cds.FieldByName('UNIDNEGOC').AsFloat,
                                               0,
                                               0,
                                               -1,
                                               -1,
                                               _cds.FieldByName('PLNCODIGO').AsInteger,
                                               _cdsPlanil.FieldByName('LACNUMLAN').AsInteger,
                                               _cdsPlanil.FieldByName('PLNDATDIA').AsString,
                                               _cdsPlanil.FieldByName('LACNUMDOC').AsString,
                                               _cds.FieldByName('DESCRICAO').AsString,
                                               '','','','','03', '',
                                               _cdsPlanil.FieldByName('PLACONTA').AsString,
                                               '','','',
                                               rValorLanc,
                                               True,
                                               bUsaPlanoPatro,
                                               // 13/01/04 Alex 14451 Pendente
                                               -1, -1) then
            Raise Exception.Create(_Lancamento.MessageInfo);
        end;
        _cds.Next;
      end;
      if iNumLancNao = 0 then
        MessageInfo := 'Foram acertados TODOS os lançamentos'
      else
        MessageInfo := 'Não Foram acertados ' + IntToStr(iNumLancNao) + ' lançamentos. Foram acertados ' + IntToStr(iNumLancAcer) + ' lançamentos.';
      Commit;
    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
