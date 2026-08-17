{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 13/12/2001                                 }
{                                                       }
{*******************************************************}

unit uCtrlLancaHoras;

interface

uses SysUtils, Classes, Db, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlHoraTrab, uCtrlCustomRH, uDbRubricaIndiv, uCtrlPessoaFuncionario,
  uCtrlFerias, uCtrlAssociaHorario, uCtrlListTerceirosRH, uCtrlRegAcessoFunc, uCtrlGlobalRH,
  uCtrlRubricaIndiv, uCtrlPessoaFilialPessoa, uCtrlProvDesc, uCtrlBancoHoras,
  uCtrlHorarioVariavel, uCtrlTipOcMed;

type
  TCtrlLancaHoras = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbRubricaIndiv: TDbRubricaIndiv;
  public
    constructor Create(UsuXFilial: string = ''; UsuXCCusto: string = '';
      IdUsuarioGeral: string = ''); reintroduce;
    destructor  Destroy; override;

    function Processar(MesRef: string; IdEmpresa: integer;
      IdPessoa, IdProvento, IdRegra, ValorRubrica: double; SeqRubricaIndiv: integer): boolean;
    function ProcessarColetivo(const IAppCliente: OleVariant; MesRef: string;
      IdEmpresa: integer; ListaIdPessoa, CodRub1, CodRub2, CodRub3, CodRub4,
      CodRub5, CodRub6, CodRub7, CodRub8: string; DataIni, DataFim: TDateTime;
      SeqRubricaIndiv, Transferir: integer; AbateAtrasos, AbateFaltas: boolean;
      TolEntra, TolSaida: integer; Sabado, Domingo, FeriadoOrd, FeriadoExtra: boolean): boolean;
  end;

implementation

uses  uCMTypes, uSistema, uCmCustomCdbObject, uCtrlPadroes, uCtrlFuncoesRH,
  uCtrlUsoGeralRH;
  //*Variants,

{ TCtrlLancaHoras }

constructor TCtrlLancaHoras.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FDbRubricaIndiv := TDbRubricaIndiv.Create(Self);
end;

destructor TCtrlLancaHoras.Destroy;
begin
  inherited;
  FDbRubricaIndiv.Free;
end;

procedure TCtrlLancaHoras.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlLancaHoras.DoChangeDataBase;
begin
  inherited;
  FDbRubricaIndiv.DataBaseName := DataBaseName;
end;

function TCtrlLancaHoras.Processar(MesRef: string; IdEmpresa: integer;
  IdPessoa, IdProvento, IdRegra, ValorRubrica: double; SeqRubricaIndiv: integer): boolean;
var
  bOk: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ProcessarLancamentoHoras(MesRef, IdEmpresa,
      IdPessoa, IdProvento, IdRegra, ValorRubrica, SeqRubricaIndiv);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := false;
      if (ValorRubrica > 0) then
      begin
        FDbRubricaIndiv.Clear;
        FDbRubricaIndiv.FieldByName('IDEMPRESA').asInteger := IdEmpresa;
        FDbRubricaIndiv.FieldByName('IDPESSOA').asFloat := IdPessoa;
        FDbRubricaIndiv.FieldByName('IDRUBRICA').asFloat := IdProvento;
        FDbRubricaIndiv.FieldByName('SEQRUBRICAINDIV').asInteger := SeqRubricaIndiv;
        FDbRubricaIndiv.LoadFromDb;

        FDbRubricaIndiv.FieldByName('IDREGRACALCULO').asFloat := IdRegra;
        FDbRubricaIndiv.FieldByName('ANOMESINICIO').asString := MesRef;
        FDbRubricaIndiv.FieldByName('VALORRUBRICA').asFloat := ValorRubrica;
        if (FDbRubricaIndiv.RecordCount = 0) or
           (FDbRubricaIndiv.FieldByName('FLGPERMANENTE').asString = '') then
        begin
          FDbRubricaIndiv.FieldByName('IDEMPRESA').asInteger := IdEmpresa;
          FDbRubricaIndiv.FieldByName('IDPESSOA').asFloat := IdPessoa;
          FDbRubricaIndiv.FieldByName('IDRUBRICA').asFloat := IdProvento;
          FDbRubricaIndiv.FieldByName('SEQRUBRICAINDIV').asInteger := 1;
          FDbRubricaIndiv.FieldByName('NUMOCORRENCIAS').asInteger := 0;
          FDbRubricaIndiv.FieldByName('FLGPERMANENTE').asInteger := 0;
          FDbRubricaIndiv.FieldByName('FLGTPRUBMANUT').asString := '2';
          FDbRubricaIndiv.FieldByName('PARCELAS').asInteger := 1;

          StartTransaction;
          bOk := FDbRubricaIndiv.Insert;
        end
        else
        begin
          if (FDbRubricaIndiv.FieldByName('FLGPERMANENTE').asInteger = 0) then
            FDbRubricaIndiv.FieldByName('PARCELAS').asInteger :=
              FDbRubricaIndiv.FieldByName('NUMOCORRENCIAS').asInteger + 1;

          StartTransaction;
          bOk := FDbRubricaIndiv.Update;
        end;

        if (bOk) then
        begin
          Commit;
          Result := true;
        end
        else
          Rollback;
      end;
    except
      on E: Exception do
      begin
        Rollback;
        MessageInfo := E.Message;
        Result := false;
      end;
    end;
  end;
end;

function TCtrlLancaHoras.ProcessarColetivo(const IAppCliente: OleVariant; MesRef: string;
  IdEmpresa: integer; ListaIdPessoa, CodRub1, CodRub2, CodRub3, CodRub4, CodRub5, CodRub6,
  CodRub7, CodRub8: string; DataIni, DataFim: TDateTime; SeqRubricaIndiv, Transferir: integer;
  AbateAtrasos, AbateFaltas: boolean; TolEntra, TolSaida: integer;
  Sabado, Domingo, FeriadoOrd, FeriadoExtra: boolean): boolean;
var
  iTam, iCol, iLin, TotHoras, SvLin, iOldRowCount, iQtdRepouso, QtMin, QtMin1, QtMin2,
  iLimAnt, iLimApo, iLimite, iUltEstab, iLimAntec, iLimAposE, iNumSeq, QtMinInter,
  iTotAtraso, iTotAdicNot, iTotExtra, iTotDiurno, iTotNoturno, iTransfer, iTotExtraTrf,
  iTotFolga, iTotFalta, iTotFaltaAbon, iCredito, iDebito, iSaldoAnterior: integer;
  bDiaNormalTrb, bHorarioVariavel: boolean;
  Hora1, Hora2, IdPessoa: double;
  DataPesq, DataRefBancoHoras, DataLimBancoHoras: TDateTime;
  sIdPessoa, sDifer, sNormal, sHoraEnt, sHoraSai, sAdNotIni, sAdNotFim, sAdNotF24,
  sDifer2, sNormal2, sData, sMultHoraEnt, sMultHoraSai: string;
  stgrHoras, ArrayFeriado, ArrayAlmoco, ArrayIniAlmoco, ArrayFimAlmoco, ArrayHorario,
  ArrayEntradas, DataRefHorario: Variant;
  CodRub: array[1..8] of string;
  iTot: array[1..8] of integer;
  IdRegra: array[1..8] of double;
  iMultExtra, iMultAtraso, iMultHoras, iMultNormal, iTotBatidas, iNumBatida,
  iMultExtraAntes, iMultExtraApos, iFlgForcaFolha: integer;
  dHoraEnt, dHoraSai: TDateTime;

  _ListaCodAcesso, _ListaIdMotivo: TStringList;

  _CdsFunc: TCMClientDataSet;
  _CdsHorario: TCMClientDataSet;
  _CdsTurno: TCMClientDataSet;
  _CdsHorarioVariavel: TCMClientDataSet;
  _CdsFerias: TCMClientDataSet;
  _CdsFeriados: TCMClientDataSet;
  _CdsParamRH: TCMClientDataSet;
  _CdsAcessoFunc: TCMClientDataSet;
  _CdsEstab: TCMClientDataSet;
  _CdsRubricaIndiv: TCMClientDataSet;
  _CdsProvDesc: TCMClientDataSet;
  _CdsMotivo: TCMClientDataSet;

  _CtrlGlobalRH: TCtrlGlobalRH;
  _CtrlBancoHoras: TCtrlBancoHoras;
  _CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
  _CtrlFerias: TCtrlFerias;
  _CtrlHoraTrab: TCtrlHoraTrab;
  _CtrlHorarioVariavel: TCtrlHorarioVariavel;
  _CtrlAssociaHorario: TCtrlAssociaHorario;
  _CtrlListTerceirosRH: TCtrlListTerceirosRH;
  _CtrlRegAcessoFunc: TCtrlRegAcessoFunc;
  _CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
  _CtrlRubricaIndiv: TCtrlRubricaIndiv;
  _CtrlProvDesc: TCtrlProvDesc;
  _CtrlTipOcMed: TCtrlTipOcMed;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.LancamentoColetivoHorasTrab(IAppCliente,
      FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, MesRef, IdEmpresa, ListaIdPessoa,
      CodRub1, CodRub2, CodRub3, CodRub4, CodRub5, CodRub6, CodRub7, CodRub8, DataIni, DataFim,
      SeqRubricaIndiv, AbateAtrasos, AbateFaltas, Sabado, Domingo, FeriadoOrd, FeriadoExtra);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    iUltEstab := -1;
    QtMinInter := 0;
    Result := false;
    try
      _CdsFunc := TCMClientDataSet.Create(nil);
      _CdsHorario := TCMClientDataSet.Create(nil);
      _CdsTurno := TCMClientDataSet.Create(nil);
      _CdsHorarioVariavel := TCMClientDataSet.Create(nil);
      _CdsFerias := TCMClientDataSet.Create(nil);
      _CdsFeriados := TCMClientDataSet.Create(nil);
      _CdsAcessoFunc := TCMClientDataSet.Create(nil);
      _CdsEstab := TCMClientDataSet.Create(nil);
      _CdsRubricaIndiv := TCMClientDataSet.Create(nil);
      _CdsProvDesc := TCMClientDataSet.Create(nil);
      _CdsParamRH := TCMClientDataSet.Create(nil);
      _CdsMotivo := TCMClientDataSet.Create(nil);

      _CtrlGlobalRH := TCtrlGlobalRH.Create;
      _CtrlGlobalRH.InitializeAs(Self);
      //*_CtrlGlobalRH.DataBaseName := DataBaseName;

      _CtrlBancoHoras := TCtrlBancoHoras.Create;
      _CtrlBancoHoras.InitializeAs(Self);
      //*_CtrlBancoHoras.DataBaseName := DataBaseName;
      _CtrlBancoHoras.OpenTransaction := false;
      if not(IsAppServer) then
        _CtrlBancoHoras.CdsBancoHoras := TCMClientDataSet.Create(nil);

      _CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral);
      _CtrlPessoaFuncionario.InitializeAs(Self);
      //*_CtrlPessoaFuncionario.DataBaseName := DataBaseName;

      _CtrlFerias := TCtrlFerias.Create;
      _CtrlFerias.InitializeAs(Self);
      //*_CtrlFerias.DataBaseName := DataBaseName;

      _CtrlHoraTrab := TCtrlHoraTrab.Create;
      _CtrlHoraTrab.InitializeAs(Self);
      //*_CtrlHoraTrab.DataBaseName := DataBaseName;

      _CtrlHorarioVariavel := TCtrlHorarioVariavel.Create;
      _CtrlHorarioVariavel.InitializeAs(Self);
      //*_CtrlHorarioVariavel.DataBaseName := DataBaseName;

      _CtrlAssociaHorario := TCtrlAssociaHorario.Create;
      _CtrlAssociaHorario.InitializeAs(Self);
      //*_CtrlAssociaHorario.DataBaseName := DataBaseName;

      _CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral);
      _CtrlListTerceirosRH.InitializeAs(Self);
      //*_CtrlListTerceirosRH.DataBaseName := DataBaseName;

      _CtrlRegAcessoFunc := TCtrlRegAcessoFunc.Create;
      _CtrlRegAcessoFunc.InitializeAs(Self);
      //*_CtrlRegAcessoFunc.DataBaseName := DataBaseName;
      _CtrlRegAcessoFunc.OpenTransaction := false;

      _CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral);
      _CtrlPessoaFilialPessoa.InitializeAs(Self);
      //*_CtrlPessoaFilialPessoa.DataBaseName := DataBaseName;

      _CtrlRubricaIndiv := TCtrlRubricaIndiv.Create(FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral);
      _CtrlRubricaIndiv.InitializeAs(Self);
      //*_CtrlRubricaIndiv.DataBaseName := DataBaseName;

      _CtrlProvDesc := TCtrlProvDesc.Create;
      _CtrlProvDesc.InitializeAs(Self);
      //*_CtrlProvDesc.DataBaseName := DataBaseName;

      _CtrlTipOcMed := TCtrlTipOcMed.Create;
      _CtrlTipOcMed.InitializeAs(Padroes);

      _ListaCodAcesso := TStringList.Create;
      _ListaIdMotivo := TStringList.Create;

      CodRub[1] := CodRub1;
      CodRub[2] := CodRub2;
      CodRub[3] := CodRub3;
      CodRub[4] := CodRub4;
      CodRub[5] := CodRub5;
      CodRub[6] := CodRub6;
      CodRub[7] := CodRub7;
      CodRub[8] := CodRub8;

      // Envia Mensagem de Progresso para o Cliente (Número de Registros a Processar)
      try
        if (Trim(ListaIdPessoa) <> '') then
          IAppCliente.LancamentoColetivoHorasTrab_CB(ContaCaracter(ListaIdPessoa,',')+1);
      except
      end;

      _CdsRubricaIndiv.Data := _CtrlRubricaIndiv.ListRubricaIndiv(-1, 0, 0, 0);
      _CdsParamRH.Data := _CtrlGlobalRH.GetParamRH('NORMALINI, NORMALFIM, FLGBANCOHORAS, '+
       'PERBANCOHORAS, LIMBANCOHORAS, DSRBANCOHORAS, NORBANCOHORAS, INDPERBCHORAS, DATBANCOHORAS');

      if (_CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
         (_CdsParamRH.FieldByName('INDPERBCHORAS').asInteger = 1) then
      begin
        DataRefBancoHoras := _CdsParamRH.FieldByName('DATBANCOHORAS').asDateTime;
        DataLimBancoHoras := IncData2(DataRefBancoHoras,
          0, _CdsParamRH.FieldByName('PERBANCOHORAS').asInteger, 0);
      end
      else
      begin
        DataRefBancoHoras := 0;
        DataLimBancoHoras := 0;
      end;

      iTam := Round(DataFim - DataIni + 2);
      stgrHoras := VarArrayCreate([0, 7, 0, iTam], varVariant);

      for iLin:=1 to 8 do
      begin
        if (CodRub[iLin] <> '') then
        begin
          _CdsProvDesc.Data := _CtrlProvDesc.ListProvDesc(StrToFloat(CodRub[iLin]));
          IdRegra[iLin] := _CdsProvDesc.FieldByName('IDREGRA').asFloat;
        end
        else
          IdRegra[iLin] := 0;
      end;

      try
        StartTransaction;

        // loop das pessoas selecionadas
        while (Trim(ListaIdPessoa) <> '') do
        begin
          ExtraiString(ListaIdPessoa, sIdPessoa, ',');
          IdPessoa := StrToFloat(sIdPessoa);
          _ListaCodAcesso.Clear;
          _ListaIdMotivo.Clear;

          for iCol := 0 to 7 do
            for iLin := 0 to iTam do
               stgrHoras[iCol,iLin] := '';

          _CdsFunc.Data := _CtrlPessoaFuncionario.ListEnderecoEmpresaFuncionario(IdPessoa,
            'F.IDHORARIO, F.IDPESSOA, E.IDCIDADES, E.IDPAIS, ES.CODESTADO AS UF, F.DATAREFHORARIO, '+
            'F.DATAADMISSAO, F.IDESTAB, F.FLGMARCAINTERVALO');
          _CdsHorario.Data := _CtrlHoraTrab.ListHoraTrab(_CdsFunc.FieldByName('IDHORARIO').asInteger);
          _CdsTurno.Data := _CtrlAssociaHorario.ListTurnoDiaSel(_CdsFunc.FieldByName('IDHORARIO').asInteger);

          _CdsHorarioVariavel.Data := _CtrlHorarioVariavel.ListHorarioVariavel(
            _CdsFunc.FieldByName('IDPESSOA').asFloat, DateToStr(DataIni), DateToStr(DataFim));
          bHorarioVariavel := not _CdsHorarioVariavel.Eof;
          if bHorarioVariavel then
          begin
            ArrayHorario := VarArrayCreate([0, Round(DataFim - DataIni)], varInteger);
            for iLin := 0 to Round(DataFim - DataIni) do
            begin
              ArrayHorario [iLin] := _CdsFunc.FieldByName('IDHORARIO').asInteger;
              _CdsHorarioVariavel.First;
              while not _CdsHorarioVariavel.Eof do
              begin
                if (_CdsHorarioVariavel.FieldByName('DATAINI').asDateTime <= DataIni+iLin) and
                   (_CdsHorarioVariavel.FieldByName('DATAFIM').asDateTime >= DataIni+iLin) then
                begin
                  ArrayHorario [iLin] := _CdsHorarioVariavel.FieldByName('IDHORARIO').asInteger;
                  break;
                end;
                _CdsHorarioVariavel.Next;
              end;
            end;
          end;

          _CdsFerias.Data := _CtrlFerias.ListFeriasNoPeriodo(
            _CdsFunc.FieldByName('IDPESSOA').asString, DataIni, DataFim);

          _CdsFeriados.Data := _CtrlListTerceirosRH.ListFeriados(
            _CdsFunc.FieldByName('IDCIDADES').asInteger,
            _CdsFunc.FieldByName('IDPAIS').asInteger,
            _CdsFunc.FieldByName('UF').asString,
            DataIni, DataFim);

          ArrayFeriado := VarArrayCreate([0, iTam - 2], varVariant);
          ArrayAlmoco := VarArrayCreate([0, iTam - 2], varVariant);
          ArrayIniAlmoco := VarArrayCreate([0, iTam - 2], varVariant);
          ArrayFimAlmoco := VarArrayCreate([0, iTam - 2], varVariant);
          ArrayEntradas := VarArrayCreate([0, iTam - 2], varVariant);

          TotHoras := 0;
          iLin := 0;

          while (iLin <= iTam - 2) do
          begin
            _ListaCodAcesso.Add(''); // alimenta a lista dos IdAcessoFunc com nada
            _ListaIdMotivo.Add(''); // alimenta a lista dos IdMotivo com nada
            SvLin := iLin; // isto foi criado porque qryFeriado.Locate ferrava o iLin
            ArrayAlmoco[SvLin] := 0;
            ArrayIniAlmoco[SvLin] := ' ';
            ArrayFimAlmoco[SvLin] := ' ';
            ArrayFeriado[SvLin] := ' ';
            ArrayEntradas[SvLin] := 0;

            case (DayOfWeek(DataIni + SvLin)) of
              1 : ArrayFeriado[SvLin] := 'D';
              7 : ArrayFeriado[SvLin] := 'S';
            end;

            if (_CdsFeriados.Locate('DATAFERIADO', StrToDate(DateToStr(DataIni + SvLin)), [])) then
              ArrayFeriado[SvLin] := _CdsFeriados.FieldByName('FLGTIPO').asString;

            iLin := SvLin;
            Inc(iLin);
          end;
          _ListaCodAcesso.Add(''); // alimenta + 1 na lista dos IdAcessoFunc com nada
          _ListaIdMotivo.Add(''); // alimenta + 1 na lista dos IdMotivo com nada

          // Coloca as Datas nas Linhas da Matriz
          for iLin:=1 to (iTam - 1) do
            stgrHoras[0, iLin] := DateToStr(DataIni + iLin - 1);

          iQtdRepouso:=0; iLin:=1;
          while (iLin <= (iTam - 1)) do
          begin
            SvLin := iLin; // isto foi criado porque qryFeriado.Locate ferrava o iLin

            // Para não processar nada antes da data de admissão
            if (_CdsFunc.FieldByName('DATAADMISSAO').asDateTime > Dataini + SvLin - 1) then
            begin
              inc(iLin);
              continue;
            end;
            //

            if bHorarioVariavel then
            begin
              _CdsHorario.Data := _CtrlHoraTrab.ListHoraTrab(ArrayHorario [SvLin - 1]);
              _CdsTurno.Data := _CtrlAssociaHorario.ListTurnoDiaSel(ArrayHorario [SvLin - 1]);
            end;

            for iCol:=2 to 3 do
            begin
              DataPesq := DataIni + SvLin - 1;
              if (_CdsHorario.EOF) then
              begin
                if ((DayOfWeek(DataIni + SvLin - 1) = 1) or
                    (DayOfWeek(DataIni + SvLin - 1) = 7)) or
                    (_CdsFeriados.Locate('DATAFERIADO', DataIni+SvLin-1, [])) then
                begin
                  stgrHoras[iCol, SvLin] := '';
                  stgrHoras[6, SvLin] := '';
                  if (iCol = 2) and (DayOfWeek(DataIni + SvLin - 1) <> 7) then
                  begin
                    Inc(iQtdRepouso);
                    if (ArrayFeriado[SvLin - 1] = 'E') then
                      Dec(iQtdRepouso);
                  end;
                end
                else
                  stgrHoras[iCol, SvLin] :=  ('Indefinido');
              end
              else
              begin
                if (_CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 0) then
                begin
                  if not(_CdsFeriados.Locate('DATAFERIADO', DateToStr(DataPesq), [])) and
                     (_CdsTurno.Locate('IDDIASEMANA', DayOfWeek(DataPesq), [])) then
                  begin
                    if (iCol = 2) then
                    begin
                      stgrHoras[iCol, SvLin] := _CdsTurno.FieldByName('INICIOEXPEDIENTE').asString;
                      if (_CdsTurno.FieldByName('INICIOALMOCO').asString <> '') then
                      begin
                        ArrayAlmoco[SvLin - 1] :=
                          (StrInt(Copy(_CdsTurno.FieldByName('FINALALMOCO').asString,1,2)) -
                           StrInt(Copy(_CdsTurno.FieldByName('INICIOALMOCO').asString,1,2))) * 60 +
                           (StrInt(Copy(_CdsTurno.FieldByName('FINALALMOCO').asString,4,2)) -
                            StrInt(Copy(_CdsTurno.FieldByName('INICIOALMOCO').asString,4,2)));
                        ArrayIniAlmoco[SvLin - 1] :=
                          Trim(_CdsTurno.FieldByName('INICIOALMOCO').asString);
                        ArrayFimAlmoco[SvLin - 1] :=
                          Trim(_CdsTurno.FieldByName('FINALALMOCO').asString);

                        stgrHoras[6, SvLin] :=
                          Trim(_CdsTurno.FieldByName('INICIOALMOCO').asString) + ' - ' +
                          Trim(_CdsTurno.FieldByName('FINALALMOCO').asString);
                      end;
                    end
                    else
                      stgrHoras[iCol, SvLin] := _CdsTurno.FieldByName('FINALEXPEDIENTE').asString;
                  end
                  else
                  begin
                    stgrHoras[iCol, SvLin] := '';
                    if (iCol = 2) and (DayOfWeek(DataIni + SvLin - 1) <> 7) then
                    begin
                      Inc(iQtdRepouso);
                      if (ArrayFeriado[SvLin - 1] = 'E') then
                        Dec(iQtdRepouso);
                    end;
                  end;
                end
                else
                begin  // Escala Rotativa
                  if (iCol = 2) and
                     ((DayOfWeek(DataIni + SvLin - 1) = 1) or
                      (_CdsFeriados.Locate('DATAFERIADO', DateToStr(DataIni+SvLin-1), [])) and
                      (_CdsFeriados.FieldByName('FLGTIPO').asString <> 'E')) then
                    Inc(iQtdRepouso);

                  if (iCol = 2) then
                    Continue;

                  if (SvLin = 1) then
                  begin
                    TotHoras := _CdsHorario.FieldByName('HORASFOLGA1').asInteger +
                      _CdsHorario.FieldByName('HORASSERVICO').asInteger +
                      _CdsHorario.FieldByName('HORASFOLGA2').asInteger;
                  end;

                  if (TotHoras = 0) then
                    TotHoras := 1;

                  if (_CdsFunc.FieldByName('DATAREFHORARIO').IsNull) then
                    DataRefHorario := _CdsFunc.FieldByName('DATAADMISSAO').asDateTime
                  else
                    DataRefHorario := _CdsFunc.FieldByName('DATAREFHORARIO').asDateTime;

                  Hora1 := ((DataIni + SvLin - 1 - DataRefHorario) * 24 mod TotHoras) +
                    _CdsHorario.FieldByName('HORASFOLGA1').asInteger;

                  if (Hora1 < 24) then
                  begin
                    Hora2 := Hora1 + _CdsHorario.FieldByName('HORASSERVICO').asFloat;

                    if (Hora2 > 24) then
                      Hora2 := Hora2 - 24;

                    stgrHoras[2, SvLin] :=
                      PoeZero(Round(Hora1)) + ':' +
                      PoeZero(Round(Frac(Hora1) * 60));
                    stgrHoras[3, SvLin] :=
                      PoeZero(Round(Hora2)) + ':' +
                      PoeZero(Round(frac(Hora2) * 60));
                  end
                  else
                  begin
                    stgrHoras[2, SvLin] := '';
                    stgrHoras[3, SvLin] := '';
                  end;
                end;
              end;

              if (iCol = 3) and (not _CdsFerias.IsEmpty) and
                 (DataIni + iLin - 1 >= _CdsFerias.FieldByName('INIGOZOFERIAS').asDateTime) and
                 (DataIni + iLin - 1 <= _CdsFerias.FieldByName('FIMGOZOFERIAS').asDateTime) then
              begin
                stgrHoras[2, iLin] := '';
                stgrHoras[3, iLin] := '';
              end;
            end;
            iLin := SvLin;
            inc(iLin);
          end;

          // Traz os registros do Ponto
          _CdsAcessoFunc.Data := _CtrlRegAcessoFunc.ListAcessosPeriodo(
            IdPessoa, 'P', DataIni, DataFim);

          while not(_CdsAcessoFunc.EOF) do
          begin
            if (_CdsAcessoFunc.FieldByName('SAIDA').asString <> '') then
            begin
              for iLin:=1 to (iTam - 1) do
              begin
                if (Copy(stgrHoras[0, iLin],1,10) =
                    Copy(_CdsAcessoFunc.FieldByName('ENTRADA').asString,1,10)) then
                begin
                  stgrHoras[1,iLin] := copy(_CdsAcessoFunc.FieldByName('ENTRADA').asString,12,5);
                  stgrHoras[4,iLin] := copy(_CdsAcessoFunc.FieldByName('SAIDA').asString,12,5);

                  ArrayEntradas[iLin-1] := ArrayEntradas[iLin-1] + 1; // Soma batidas feitas no mesmo dia

                  if (_CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) then
                  begin
                    stgrHoras[7,iLin] :=
                      copy(_CdsAcessoFunc.FieldByName('SAIDAINTERVALO').asString,12,5) +
                      ' - ' +
                      copy(_CdsAcessoFunc.FieldByName('RETORNOINTERVALO').asString,12,5);
                    if stgrHoras[7,iLin] = ' - ' then stgrHoras[7,iLin] := '00:00 - 00:00';
                  end;

                  _ListaCodAcesso[iLin] := _CdsAcessoFunc.FieldByName('IDACESSOFUNC').asString;
                  _ListaIdMotivo[iLin-1] := _CdsAcessoFunc.FieldByName('CODTIPOOCMED').asString;
                  if _CdsAcessoFunc.FieldByName('FLGABONADO').asInteger = 1 then
                    stgrHoras[5,iLin] := 'S';
                  break;
                end;
              end;
            end;
            _CdsAcessoFunc.Next;
          end;

          iTotAtraso := 0;
          iTotAdicNot := 0;
          iTotExtra := 0;
          iTotDiurno := 0;
          iTotNoturno := 0;
          iTotFolga := 0;
          iTotFalta := 0;
          iTotFaltaAbon := 0;
          iLimite := 0;
          iLimAntec := 0;
          iLimAposE := 0;
          iCredito := 0;
          iDebito := 0;
          iTransfer := 0;
          iTotExtraTrf := 0;

          if (_CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) then
          begin
            if (_CdsParamRH.FieldByName('INDPERBCHORAS').asInteger = 2) then
            begin
              DataRefBancoHoras := _CdsParamRH.FieldByName('DATBANCOHORAS').asDateTime;
              DataLimBancoHoras := IncData2(DataRefBancoHoras,
                0, _CdsParamRH.FieldByName('PERBANCOHORAS').asInteger, 0);
            end;
            iSaldoAnterior := _CtrlBancoHoras.VerificaSaldoBancoHoras(IdPessoa,
              DateToStr(DataRefBancoHoras), DateToStr(DatalimBancoHoras));
          end;

          if (_CdsFunc.FieldByName('IDESTAB').asInteger <> iUltEstab) then
          begin
            _CdsEstab.Data := _CtrlPessoaFilialPessoa.ListSubTipo(
              _CdsFunc.FieldByName('IDESTAB').asFloat);

            iUltEstab := _CdsFunc.FieldByName('IDESTAB').asInteger;
            iLimAntec := StrToIntDef(_CdsEstab.FieldByName('EXTRADIURNOINI').asString,0);
            iLimAposE := StrToIntDef(_CdsEstab.FieldByName('EXTRADIURNOFIM').asString,0);
            sAdNotIni := _CdsEstab.FieldByName('ADICNOTURINI').asString;
            sAdNotFim := _CdsEstab.FieldByName('ADICNOTURFIM').asString;
            sAdNotF24 := IntToStr(StrInt(Copy(sAdNotFim,1,2)) + 24) + Copy(sAdNotFim,3,3);
          end;

          for iLin:=1 to (iTam - 1) do
          begin
            QtMin1 := 0;
            QtMin2 := 0;

            iMultNormal := 0;
            if (stgrHoras[2, iLin] <> '') then
              iMultNormal :=
                StrToInt(copy(stgrHoras[3, iLin],1,2)) * 60 +
                StrToInt(copy(stgrHoras[3, iLin],4,2)) -
                StrToInt(copy(stgrHoras[2, iLin],1,2)) * 60 -
                StrToInt(copy(stgrHoras[2, iLin],4,2));
              // ECF 10/08/07 COLOQUEI ESTA CONDIÇÃO SEPARADA
              if (stgrHoras[6, iLin] <> '') then
                iMultNormal := iMultNormal -
                  (StrToInt(copy(trim(stgrHoras[6, iLin]),9,2)) * 60 +
                   StrToInt(copy(trim(stgrHoras[6, iLin]),12,2)) -
                   StrToInt(copy(trim(stgrHoras[6, iLin]),1,2)) * 60 -
                   StrToInt(copy(trim(stgrHoras[6, iLin]),4,2)));

            {bDiaNormalTrb := ((_CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 0) and
                             (ArrayFeriado[iLin-1] = 'E')) or
                            ((_CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 1) and
                             ((ArrayFeriado[iLin-1] = 'S') or
                              (ArrayFeriado[iLin-1] = 'D') or
                              (ArrayFeriado[iLin-1] = 'O') or
                              (ArrayFeriado[iLin-1] = 'E') or
                              (ArrayFeriado[iLin-1] = ' ')));}
            bDiaNormalTrb :=
                ((not(Sabado)       and (ArrayFeriado[iLin-1] = 'S')) or
                 (not(Domingo)      and (ArrayFeriado[iLin-1] = 'D')) or
                 (not(FeriadoOrd)   and (ArrayFeriado[iLin-1] = 'O')) or
                 (not(FeriadoExtra) and (ArrayFeriado[iLin-1] = 'E')) or
                (ArrayFeriado[iLin - 1] = ' '));

            if ArrayEntradas[iLin-1] <= 1 then // Só para NÃO multiplas batidas
            begin
              iFlgForcaFolha := 0;
              if _ListaIdMotivo[iLin-1] <> '' then
              begin
                _CdsMotivo.Data := _CtrlTipOcMed.ListTipoOcorrenciaMed(StrToFloat(_ListaIdMotivo[iLin-1]));
                iFlgForcaFolha := _CdsMotivo.FieldByName('FLGFORCAFOLHA').AsInteger;
              end;
            end;

            //******************************************************************
            if ArrayEntradas[iLin-1] > 1 then // Tratar multiplas batidas
            begin
              sData := copy(stgrHoras[0, iLin],1,10);
              iMultAtraso := 0; iMultExtra := 0; iMultHoras := 0;
              iMultExtraAntes := 0; iMultExtraApos := 0;
              _CdsAcessoFunc.Filter := 'Date(ENTRADA) = ' + QuotedStr(sData);
              _CdsAcessoFunc.Filtered := true;
              _CdsAcessoFunc.First;
              iTotBatidas := _CdsAcessoFunc.RecordCount;
              iNumBatida := 0;
              while not _CdsAcessoFunc.Eof do
              begin
                inc(iNumBatida);
                if (_CdsAcessoFunc.FieldByName('FLGABONADO').asInteger <> 1) then
                begin
                  sHoraEnt := Trim(stgrHoras[2, iLin]);
                  sHoraSai := Trim(stgrHoras[3, iLin]);
                  dHoraEnt := StrToDateTime(copy(stgrHoras[0, iLin],1,10)+' '+sHoraEnt);
                  dHoraSai := StrToDateTime(copy(stgrHoras[0, iLin],1,10)+' '+sHoraSai);
                  if dHoraSai < dHoraEnt then
                    dHoraSai := dHoraSai + 1;

                  iFlgForcaFolha := 0;
                  if (not _CdsAcessoFunc.FieldByName('CODTIPOOCMED').IsNull) then
                  begin
                    _CdsMotivo.Data := _CtrlTipOcMed.ListTipoOcorrenciaMed(_CdsAcessoFunc.FieldByName('CODTIPOOCMED').AsFloat);
                    iFlgForcaFolha := _CdsMotivo.FieldByName('FLGFORCAFOLHA').AsInteger;
                  end;

                  // VERIF. ADIC. NOTURNO
                  sMultHoraEnt := FormatDateTime('HH:NN',_CdsAcessoFunc.FieldByName('ENTRADA').asDateTime);

                  sMultHoraSai := FormatDateTime('HH:NN',_CdsAcessoFunc.FieldByName('SAIDA').asDateTime);

                  if (sMultHoraEnt < sAdNotFim) then
                    if (sMultHoraSai > sAdNotFim) then
                      iTotAdicNot := iTotAdicNot +
                        (FU.StrInt(Copy(sAdNotFim,1,2)) - FU.StrInt(Copy(sMultHoraEnt,1,2))) * 60 +
                        (FU.StrInt(Copy(sAdNotFim,4,2)) - FU.StrInt(Copy(sMultHoraEnt,4,2)))
                    else
                      iTotAdicNot := iTotAdicNot +
                        (FU.StrInt(Copy(sMultHoraSai,1,2)) - FU.StrInt(Copy(sHoraEnt,1,2))) * 60 +
                        (FU.StrInt(Copy(sMultHoraSai,4,2)) - FU.StrInt(Copy(sHoraEnt,4,2)));

                  if (sMultHoraSai < sMultHoraEnt) then
                    sMultHoraSai := IntToStr(FU.StrInt(Copy(sMultHoraSai,1,2)) + 24) + Copy(sMultHoraSai,3,3);

                  if (sMultHoraEnt > sAdNotIni) then
                    sAdNotIni := sMultHoraEnt;

                  if (sMultHoraSai > sAdNotIni) then
                    if (sMultHoraSai < sAdNotF24) then
                      iTotAdicNot := iTotAdicNot +
                        (FU.StrInt(Copy(sMultHoraSai,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
                        (FU.StrInt(Copy(sMultHoraSai,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)))
                    else
                      iTotAdicNot := iTotAdicNot +
                        (FU.StrInt(Copy(sAdNotF24,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
                        (FU.StrInt(Copy(sAdNotF24,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)));

                  // FIM ADIC. NOTURNO

                  // Se for a primeira batida, verificar a tolerancia de entrada e extra antecip.
                  if (iNumBatida = 1) then
                  begin
                    if (Abs(round(24*60*(dHoraEnt -
                      _CdsAcessoFunc.FieldByName('ENTRADA').asDateTime))) > TolEntra) then
                    begin
                      if (dHoraEnt > _CdsAcessoFunc.FieldByName('ENTRADA').asDateTime) then
                      begin
                        iMultExtra := iMultExtra + round(24*60*(dHoraEnt -
                          _CdsAcessoFunc.FieldByName('ENTRADA').asDateTime));
                        iMultExtraAntes := iMultExtraAntes + round(24*60*(dHoraEnt -
                          _CdsAcessoFunc.FieldByName('ENTRADA').asDateTime));
                      end;
                      dHoraEnt := _CdsAcessoFunc.FieldByName('ENTRADA').asDateTime;
                    end;
                  end
                  else
                    dHoraEnt := _CdsAcessoFunc.FieldByName('ENTRADA').asDateTime;

                  //  Se for a última batida, verificar a tolerancia de saida e extra após exped.
                  if (iNumBatida = iTotBatidas) then
                  begin
                    if (Abs(round(24*60*(dHoraSai -
                      _CdsAcessoFunc.FieldByName('SAIDA').asDateTime))) > TolSaida) then
                    begin
                      if (dHoraSai < _CdsAcessoFunc.FieldByName('SAIDA').asDateTime) then
                      begin
                        iMultExtra := iMultExtra + round(24*60*(- dHoraSai +
                          _CdsAcessoFunc.FieldByName('SAIDA').asDateTime));
                        iMultExtraApos := iMultExtraApos + round(24*60*(- dHoraSai +
                          _CdsAcessoFunc.FieldByName('SAIDA').asDateTime));
                      end;
                      dHoraSai := _CdsAcessoFunc.FieldByName('SAIDA').asDateTime;
                    end;
                  end
                  else
                    dHoraSai := _CdsAcessoFunc.FieldByName('SAIDA').asDateTime;

                  iMultHoras := iMultHoras + round(24*60*(dHoraSai - dHoraEnt));

                  // Abater o horário de intervalo
                  if (copy(trim(stgrHoras[6, iLin]),1,5) <> '') and
                     (sMultHoraSai >= copy(trim(stgrHoras[6, iLin]),9,5)) and
                     (sMultHoraEnt <= copy(trim(stgrHoras[6, iLin]),1,5)) then
                    iMultHoras := iMultHoras -
                      StrToInt(copy(trim(stgrHoras[6, iLin]),9,2)) * 60 -
                      StrToInt(copy(trim(stgrHoras[6, iLin]),12,2)) +
                      StrToInt(copy(trim(stgrHoras[6, iLin]),1,2)) * 60 +
                      StrToInt(copy(trim(stgrHoras[6, iLin]),4,2));
                  //
                end;
                _CdsAcessoFunc.Next;
              end;
              _CdsAcessoFunc.Filtered := false;
              _CdsAcessoFunc.First;
              if (stgrHoras[2, iLin] = '') then
                iMultExtra := iMultHoras
              else
              begin
                iMultAtraso := iMultAtraso + iMultNormal - iMultHoras + iMultExtra;

                if (AbateAtrasos) and (iFlgForcaFolha = 0) then
                  iDebito := iDebito + iMultAtraso
                else
                  iTotAtraso := iTotAtraso + iMultAtraso;
              end;

              if (iMultExtra > 0) then
              begin
                if (_CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
                   (_CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger > 0) and
                   (iFlgForcaFolha = 0) and
                   (StrToDate(copy(stgrHoras[0, iLin],1,10)) <= DataLimBancoHoras) then
                begin
                  // Considerar o limite diário de horas extras para o Banco de Horas (LIMBANCOHORAS)
                  iCredito := iCredito +
                    Round(FU.IFF(iMultExtra <= _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60,
                      iMultExtra, _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) *
                      FU.IFF(bDiaNormalTrb, _CdsParamRH.FieldByName('DSRBANCOHORAS').AsFloat,
                      _CdsParamRH.FieldByName('DSRBANCOHORAS').AsFloat));

                  if (iMultExtra > _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) then
                  begin
                    iMultExtra := iMultExtra - _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60;
                    iMultExtraApos := iMultExtraApos - _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60;
                    if iMultExtraApos < 0 then
                    begin
                      iMultExtraAntes := iMultExtraAntes + iMultExtraApos;
                      iMultExtraApos := 0;
                      if iMultExtraAntes < 0 then
                        iMultExtraAntes := 0;
                    end;
                  end
                  else
                  begin
                    iMultExtra := 0;
                    iMultExtraAntes := 0;
                    iMultExtraApos := 0;
                  end;
                end;
                if (stgrHoras[2, iLin] = '') then
                  iTotFolga := iTotFolga + iMultExtra;

{                iLimite := 0;
                case (rgLimiteDiurnas.ItemIndex) of
                  0 : iLimite := iLimAntec;
                  1 : iLimite := iLimAposE;
                end;
}
                if (True) then  // (rgLimiteDiurnas.ItemIndex = 2) then
                begin
                  if (iMultExtraAntes <= iLimAntec) then
                    iTotDiurno := iTotDiurno + iMultExtraAntes
                  else
                  begin
                    iTotDiurno  := iTotDiurno + iLimAntec;
                    iTotNoturno := iTotNoturno + iMultExtraAntes - iLimAntec;
                  end;
                end
                else
                begin
                  if (iMultExtraAntes <= iLimite) then
                  begin
                    iTotDiurno := iTotDiurno + iMultExtraAntes;
                    iLimite := iLimite - iMultExtraAntes;
                  end
                  else
                  begin
                    iTotDiurno := iTotDiurno + iLimite;
                    iTotNoturno := iTotNoturno + iMultExtraAntes - iLimite;
                    iLimite := 0;
                  end;
                end;

                if (True) then // (rgLimiteDiurnas.ItemIndex = 2) then
                begin
                  if (iMultExtraApos <= iLimAposE) then
                    iTotDiurno := iTotDiurno + iMultExtraApos
                  else
                  begin
                    iTotDiurno  := iTotDiurno + iLimAposE;
                    iTotNoturno := iTotNoturno + iMultExtraApos - iLimAposE;
                  end;
                end
                else
                begin
                  if (iMultExtraApos <= iLimite) then
                  begin
                    iTotDiurno := iTotDiurno + iMultExtraApos;
                    iLimite := iLimite - iMultExtraApos;
                  end
                  else
                  begin
                    iTotDiurno := iTotDiurno + iLimite;
                    iTotNoturno := iTotNoturno + iMultExtraApos - iLimite;
                    iLimite := 0;
                  end;
                end;
              end;
            end // // Final do Tratamento de multiplas batidas
            else
            //******************************************************************
            for iCol:=2 to 3 do
            begin
              if (stgrHoras[iCol,iLin] = '') and
                 (((stgrHoras[1,iLin]  = '') and (stgrHoras[4,iLin] <> '')) or
                  ((stgrHoras[1,iLin] <> '') and (stgrHoras[4,iLin]  = ''))) then
              begin
                continue;
              end;

              if (iCol = 2) then
              begin
                // Faltas
                if (stgrHoras[1,iLin] = '') and (stgrHoras[2,iLin] <> '') and
                   (iFlgForcaFolha = 0) and
                   (stgrHoras[4,iLin] = '') and (stgrHoras[3,iLin] <> '') then
                begin
                  if (stgrHoras[5,iLin] <> 'S') then
                  begin
                    if (_CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
                       (AbateFaltas) and
                       (StrToDate(DateToStr(DataIni+iLin-1)) <= DataLimBancoHoras) then
                      iDebito := iDebito + iMultNormal
                    else
                      inc(iTotFalta);
                  end
                  else  // Abonado
                  begin
                    Inc(iTotFaltaAbon);
                    continue;
                  end;
                end;

                //Atualiza FlgAbonado
                if (_ListaCodAcesso[iLin] <> '') then
                  if (stgrHoras[5,iLin] = 'S') then
                    _CtrlRegAcessoFunc.GravarFlgAbonado(_ListaCodAcesso[iLin],'1')
                  else
                    _CtrlRegAcessoFunc.GravarFlgAbonado(_ListaCodAcesso[iLin],'0');

                // ECF 12/08/07 COLOQUEI ESTA CONDIÇÃO AQUI PQ CALCULAVA ADIC. NOT. SEM BATIDAS
                if (stgrHoras[1,iLin] = '') and (stgrHoras[4,iLin] = '') then
                  Continue;

                sHoraEnt := Trim(stgrHoras[2, iLin]);
                if (stgrHoras[1, iLin] <> '') then
                  sHoraEnt := Trim(stgrHoras[1, iLin]);
                if (sHoraEnt = '') then
                  sHoraEnt := '00:00';

                sHoraSai := Trim(stgrHoras[3, iLin]);
                if (stgrHoras[4, iLin] <> '') then
                  sHoraSai := Trim(stgrHoras[4, iLin]);
                if (sHoraSai = '') then
                  sHoraSai := '00:00';

                if (sHoraEnt = '00:00') and (sHoraSai = '00:00') then
                  Continue;

                if (sHoraEnt < sAdNotFim) then
                  if (sHoraSai > sAdNotFim) then
                    iTotAdicNot := iTotAdicNot +
                      (StrInt(Copy(sAdNotFim,1,2)) - StrInt(Copy(sHoraEnt,1,2))) * 60 +
                      (StrInt(Copy(sAdNotFim,4,2)) - StrInt(Copy(sHoraEnt,4,2)))
                  else
                    iTotAdicNot := iTotAdicNot +
                      (StrInt(Copy(sHoraSai,1,2)) - StrInt(Copy(sHoraEnt,1,2))) * 60 +
                      (StrInt(Copy(sHoraSai,4,2)) - StrInt(Copy(sHoraEnt,4,2)));

                if (sHoraSai < sHoraEnt) then
                  sHoraSai := IntToStr(StrInt(Copy(sHoraSai,1,2)) + 24) + Copy(sHoraSai,3,3);

                if (sHoraEnt > sAdNotIni) then
                  sAdNotIni := sHoraEnt;

                if (sHoraSai > sAdNotIni) then
                  if (sHoraSai < sAdNotF24) then
                    iTotAdicNot := iTotAdicNot +
                      (StrInt(Copy(sHoraSai,1,2)) - StrInt(Copy(sAdNotIni,1,2))) * 60 +
                      (StrInt(Copy(sHoraSai,4,2)) - StrInt(Copy(sAdNotIni,4,2)))
                  else
                    iTotAdicNot := iTotAdicNot +
                      (StrInt(Copy(sAdNotF24,1,2)) - StrInt(Copy(sAdNotIni,1,2))) * 60 +
                      (StrInt(Copy(sAdNotF24,4,2)) - StrInt(Copy(sAdNotIni,4,2)));
              end;

              if (stgrHoras[5,iLin] = 'S') or // Abonado (colocado em 12/02/08 - faltava)
                 ((stgrHoras[1,iLin] = '') and (stgrHoras[4,iLin] = '')) then
                Continue;

              if ((iCol = 2) and (stgrHoras[1, iLin] = '')) or
                 ((iCol = 3) and (stgrHoras[4, iLin] = '')) then
                Continue;

              if ((iCol = 3) and (stgrHoras[3, iLin] = '')) then
                Continue;

              QtMin := 0;
              sNormal := Trim(stgrHoras[iCol, iLin]);

              if (iCol = 2) and (stgrHoras[2, iLin] = '') then
                sNormal := Trim(stgrHoras[4, iLin]);

              if (iCol = 3) and (stgrHoras[3, iLin] <> '') and
                (stgrHoras[3, iLin] < stgrHoras[4, iLin]) and
                (stgrHoras[3, iLin] < stgrHoras[2, iLin]) then
                sNormal := IntToStr(StrInt(Copy(sNormal,1,2)) + 24) + Copy(sNormal,3,3);

              if (iCol = 2) and (stgrHoras[1, iLin] <> '') then
              begin
                sDifer := Trim(stgrHoras[1, iLin]);
                QtMin  := (StrInt(Copy(sNormal,1,2)) - StrInt(Copy(sDifer,1,2))) * 60 +
                          (StrInt(Copy(sNormal,4,2)) - StrInt(Copy(sDifer,4,2)));

                // 02/09/07 ACERTO PARA SAIDA DURANTE O INTERVALO
                if (_CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 0) and
                   (QtMin < 0) and
                   (sDifer <= ArrayFimAlmoco[iLin-1]) and
                   (sDifer >= ArrayIniAlmoco[iLin-1]) then
                  QtMin  := (FU.StrInt(Copy(sNormal,1,2)) - FU.StrInt(Copy(ArrayIniAlmoco[iLin-1],1,2))) * 60 +
                            (FU.StrInt(Copy(sNormal,4,2)) - FU.StrInt(Copy(ArrayIniAlmoco[iLin-1],4,2)));

                if (stgrHoras[3, iLin] = '') and (QtMin < 0) and
                   (Trim(stgrHoras[4, iLin]) <  Trim(stgrHoras[1, iLin])) then
                  QtMin := 24*60 + QtMin;

                if abs(QtMin) <= TolEntra then
                  QtMin := 0;

                //QtMin1 := 0;
                QtMin1 := IFF(QtMin < 0, 0, QtMin);

                // Retorno Intervalo
                QtMinInter := 0;
                if (_CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) then
                begin
                  sDifer2 := copy(Trim(stgrHoras[7, iLin]), 9, 5);
                  sNormal2 := copy(Trim(stgrHoras[6, iLin]), 9, 5);
                  QtMinInter := (StrInt(Copy(sNormal2,1,2)) - StrInt(Copy(sDifer2,1,2))) * 60 +
                                (StrInt(Copy(sNormal2,4,2)) - StrInt(Copy(sDifer2,4,2)));

                  if abs(QtMinInter) <= TolEntra then
                    QtMinInter := 0;

                  //QtMin1 := 0;
                  QtMin1 := QtMin1 + IFF(QtMinInter < 0, 0, QtMinInter);
                end;
              end;

              if (iCol = 3) and (stgrHoras[4, iLin] <> '') then
              begin
                sDifer := Trim(stgrHoras[4, iLin]);
                QtMin  := (- StrInt(Copy(sNormal,1,2)) + StrInt(Copy(sDifer,1,2))) * 60 +
                          (- StrInt(Copy(sNormal,4,2)) + StrInt(Copy(sDifer,4,2)));

                // 02/09/07 ACERTO PARA SAIDA DURANTE O INTERVALO
                if (_CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 0) and
                   (QtMin < 0) and
                   (sDifer <= ArrayFimAlmoco[iLin-1]) and
                   (sDifer >= ArrayIniAlmoco[iLin-1]) then
                  QtMin  := (- FU.StrInt(Copy(sNormal,1,2)) + FU.StrInt(Copy(ArrayFimAlmoco[iLin-1],1,2))) * 60 +
                            (- FU.StrInt(Copy(sNormal,4,2)) + FU.StrInt(Copy(ArrayFimAlmoco[iLin-1],4,2)));

                if (stgrHoras[3, iLin] <> '') and (QtMin < 0) and
                   (Trim(stgrHoras[4, iLin]) < Trim(stgrHoras[2, iLin])) and
                   ((Trim(stgrHoras[4, iLin]) > Trim(stgrHoras[3, iLin])) or
                    (Trim(stgrHoras[3, iLin]) > Trim(stgrHoras[2, iLin]))) then
                  QtMin := 24*60 + QtMin;

                if abs(QtMin) <= TolSaida then
                  QtMin := 0;

                //QtMin2 :=0;
                QtMin2 := IFF(QtMin < 0, 0, QtMin);

                // Saída Intervalo
                if (_CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) then
                begin
                  sDifer2 := copy(Trim(stgrHoras[7, iLin]), 1, 5);
                  sNormal2 := copy(Trim(stgrHoras[6, iLin]), 1, 5);
                  QtMinInter := (- StrInt(Copy(sNormal2,1,2)) + StrInt(Copy(sDifer2,1,2))) * 60 +
                                (- StrInt(Copy(sNormal2,4,2)) + StrInt(Copy(sDifer2,4,2)));

                  if abs(QtMinInter) <= TolSaida then
                    QtMinInter := 0;

                  //QtMin2 := 0;
                  QtMin2 := QtMin2 + IFF(QtMinInter < 0, 0, QtMinInter);
                end;
              end;

              iLimAnt := iLimAntec;
              iLimApo := iLimAposE;

              if (_CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 1) and
                 not(bDiaNormalTrb) then
              begin
                iLimAnt := 0;
                iLimApo := 0;
                iLimite := 0;
              end;

              if (QtMin < 0) then
              begin
                if (_CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
                   (AbateAtrasos) and
                   (iFlgForcaFolha = 0) and
                   (StrToDate(DateToStr(DataIni+iLin-1)) <= DataLimBancoHoras) then
                begin
                  iDebito := iDebito - QtMin;

                  if ((iCol = 2) and (ArrayAlmoco[iLin-1] > 0) and (sDifer > ArrayFimAlmoco[iLin-1]) and
                      (stgrHoras[2, iLin] < ArrayIniAlmoco[iLin-1])) or
                     ((iCol = 3) and (ArrayAlmoco[iLin-1] > 0) and (sDifer < ArrayIniAlmoco[iLin-1]) and
                      (stgrHoras[3, iLin] > ArrayFimAlmoco[iLin-1])) then
                    iDebito := iDebito - ArrayAlmoco[iLin-1];
                end
                else
                begin
                  iTotAtraso := iTotAtraso - QtMin;

                  // 02/09/07 ACERTO DOS SINAIS
                  if ((iCol = 2) and (ArrayAlmoco[iLin-1] > 0) and (sDifer >= ArrayFimAlmoco[iLin-1]) and
                  //if ((iCol = 2) and (ArrayAlmoco[iLin-1] > 0) and (sDifer > ArrayFimAlmoco[iLin-1]) and
                      (stgrHoras[2, iLin] < ArrayIniAlmoco[iLin-1])) or
                     ((iCol = 3) and (ArrayAlmoco[iLin-1] > 0) and (sDifer <= ArrayIniAlmoco[iLin-1]) and
                  //   ((iCol = 3) and (ArrayAlmoco[iLin-1] > 0) and (sDifer < ArrayIniAlmoco[iLin-1]) and
                      (stgrHoras[3, iLin] > ArrayFimAlmoco[iLin-1])) then
                    iTotAtraso := iTotAtraso - ArrayAlmoco[iLin-1];
                end;
              end;
              if (QtMin >= 0) or (QtMinInter > 0) then
              begin
                QtMin := IFF(QtMin > 0, QtMin, 0) + IFF(QtMinInter > 0, QtMinInter, 0);

                if (iCol = 2) and (stgrHoras[2, iLin] = '') and
                   not(bDiaNormalTrb) and (QtMin > 0) then
                begin
                  if (_CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
                     (_CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger > 0) and
                     (_CdsParamRH.FieldByName('DSRBANCOHORAS').AsFloat > 0) and
                     (iFlgForcaFolha = 0) and
                     (StrToDate(DateToStr(DataIni+iLin-1)) <= DataLimBancoHoras) then
                  begin
                    // Considerar o limite diário de horas extras para o Banco de Horas (LIMBANCOHORAS)
                    iCredito := iCredito +
                      Round(IFF(QtMin <= _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60,
                        QtMin, _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) *
                        _CdsParamRH.FieldByName('DSRBANCOHORAS').AsFloat);

                    if (QtMin > _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) then
                      QtMin := QtMin - _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60
                    else
                      QtMin := 0;
                  end;
                  iTotFolga := iTotFolga + QtMin;
                end;

                if (iCol = 2) and ((stgrHoras[2, iLin] <> '') or (bDiaNormalTrb)) then
                begin
                  // Considera o limite diário de horas extras para o Banco de Horas (LIMBANCOHORAS)
                  if (_CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
                     (_CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger > 0) and
                     (iFlgForcaFolha = 0) and
                     (StrToDate(DateToStr(DataIni+iLin-1)) <= DataLimBancoHoras) then
                  begin
                    iCredito := iCredito +
                      Round(IFF(QtMin1+QtMin2 <= _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60,
                        QtMin1+QtMin2, _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) *
                        _CdsParamRH.FieldByName('NORBANCOHORAS').AsFloat);

                    if (QtMin > _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) then
                      QtMin := QtMin - _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60
                    else
                      QtMin := 0;
                  end;

                  if (true) then //(rgLimiteDiurnas.ItemIndex = 2) then
                  begin
                    if (QtMin <= iLimAnt) then
                      iTotDiurno := iTotDiurno + QtMin
                    else
                    begin
                      iTotDiurno  := iTotDiurno + iLimAnt;
                      iTotNoturno := iTotNoturno + QtMin - iLimAnt;
                    end;
                  end
                  else
                  begin
                    if (QtMin <= iLimite) then
                    begin
                      iTotDiurno := iTotDiurno + QtMin;
                      iLimite := iLimite - QtMin;
                    end
                    else
                    begin
                      iTotDiurno := iTotDiurno + iLimite;
                      iTotNoturno := iTotNoturno + QtMin - iLimite;
                      iLimite := 0;
                    end;
                  end;
                end;

                if (iCol = 3) and (stgrHoras[3, iLin] <> '') then
                begin
                  // Considera o limite diário de horas extras para o Banco de Horas (LIMBANCOHORAS)
                  if (_CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
                     (_CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger > 0) and
                     (iFlgForcaFolha = 0) and
                     (StrToDate(DateToStr(DataIni+iLin-1)) <= DataLimBancoHoras) then
                  begin
                    iCredito := iCredito +
                      round(FU.IFF(QtMin1+QtMin2 <= _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60,
                        QtMin2, _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60 - QtMin1) * _CdsParamRH.FieldByName('NORBANCOHORAS').AsFloat);

                    if (QtMin1+QtMin2 > _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) then
                      QtMin := QtMin1+QtMin2 - _CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60
                    else
                      QtMin := 0;
                  end;

                  if (true) then //(rgLimiteDiurnas.ItemIndex = 2) then
                  begin
                    if (QtMin <= iLimApo) then
                      iTotDiurno := iTotDiurno + QtMin
                    else
                    begin
                      iTotDiurno  := iTotDiurno + iLimApo;
                      iTotNoturno := iTotNoturno + QtMin - iLimApo;
                    end;
                  end
                  else
                  begin
                    if (QtMin <= iLimite) then
                      iTotDiurno := iTotDiurno + QtMin
                    else
                    begin
                      iTotDiurno  := iTotDiurno + iLimite;
                      iTotNoturno := iTotNoturno + QtMin - iLimite;
                    end;
                  end;
                end;
                iTotExtra := iTotExtra + QtMin;
              end;
              //
              if (QtMinInter < 0) then
              begin
                if (_CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
                   (AbateAtrasos) and
                   (iFlgForcaFolha = 0) and
                   (StrToDate(DateToStr(DataIni+iLin-1)) <= DataLimBancoHoras) then
                  iDebito := iDebito - QtMinInter
                else
                  iTotAtraso := iTotAtraso - QtMinInter;
              end;
            end;
          end;

          if (_CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
             (DataFim >= DataLimBancoHoras) then
          begin
            if (Transferir = 1) then
              iTransfer := - iSaldoAnterior - iCredito + iDebito
            else
              iTransfer := - iSaldoAnterior;
            if (iTransfer > 0) then
            begin
              iTotAtraso := iTotAtraso + iTransfer;
            end
            else
            begin
              iTotExtra := iTotExtra - iTransfer;
              iTotExtraTrf := - iTransfer;
            end;
          end;

          iTot[1] := iTotAtraso;
          iTot[2] := iTotDiurno;
          iTot[3] := iTotNoturno;
          iTot[4] := iTotFolga;
          iTot[5] := iTotAdicNot;
          iTot[6] := iTotFalta;
          iTot[7] := iTotFaltaAbon;
          iTot[8] := iTotExtraTrf;

          for iLin:=1 to 8 do
          begin
            if (CodRub[iLin] <> '') and (iTot[iLin] > 0) then
            begin
              iNumSeq := _CtrlRubricaIndiv.UltimoNumSeq(IdPessoa, StrToFloat(CodRub[iLin]),
                IdEmpresa) + 1;

              _CdsRubricaIndiv.Insert;
              _CdsRubricaIndiv.FieldByName('IDEMPRESA').asInteger := IdEmpresa;
              _CdsRubricaIndiv.FieldByName('IDPESSOA').asFloat := IdPessoa;
              _CdsRubricaIndiv.FieldByName('IDRUBRICA').asString := CodRub[iLin];
              _CdsRubricaIndiv.FieldByName('SEQRUBRICAINDIV').asInteger := iNumSeq;
              _CdsRubricaIndiv.FieldByName('NUMOCORRENCIAS').asInteger := 0;
              _CdsRubricaIndiv.FieldByName('FLGPERMANENTE').asInteger := 0;
              _CdsRubricaIndiv.FieldByName('FLGTPRUBMANUT').asString := '2';
              _CdsRubricaIndiv.FieldByName('PARCELAS').asInteger := 1;
              _CdsRubricaIndiv.FieldByName('IDREGRACALCULO').asFloat := IdRegra[iLin];
              _CdsRubricaIndiv.FieldByName('ANOMESINICIO').asString := MesRef;
              _CdsRubricaIndiv.FieldByName('VALORRUBRICA').asFloat := iTot[iLin];
              _CdsRubricaIndiv.Post;
            end;
          end;

          // Gravar Banco Horas
          if (_CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) then
          begin
            if (iCredito > 0) or (iDebito > 0) or (iTransfer <> 0) then
            begin
              with (_CtrlBancoHoras.CdsBancoHoras) do
              begin
                Data := _CtrlBancoHoras.ListBancoHoras(-1);
                if (iCredito > 0) then
                begin
                  Insert;
                  FieldByName('IDPESSOA').asFloat := IdPessoa;
                  FieldByName('DATABANCOHORAS').asDateTime := Date;
                  FieldByName('VALBANCOHORAS').asFloat := iCredito;
                  FieldByName('SITBANCOHORAS').asFloat := 0;
                  Post;
                end;

                if (iDebito > 0) then
                begin
                  Insert;
                  FieldByName('IDPESSOA').asFloat := IdPessoa;
                  FieldByName('DATABANCOHORAS').asDateTime := Date;
                  FieldByName('VALBANCOHORAS').asFloat := -iDebito;
                  FieldByName('SITBANCOHORAS').asFloat := 0;
                  Post;
                end;

                if (iTransfer <> 0) then
                begin
                  Insert;
                  FieldByName('IDPESSOA').asFloat := IdPessoa;
                  FieldByName('DATABANCOHORAS').asDateTime := Date;
                  FieldByName('VALBANCOHORAS').asFloat := iTransfer;
                  FieldByName('SITBANCOHORAS').asFloat := 1;
                  Post;
                end;
              end;

              if not(_CtrlBancoHoras.GravarBancoHoras) then
                raise Exception.Create(_CtrlBancoHoras.MessageInfo);
            end;

            if (DataFim >= DataLimBancoHoras) then
            begin
              with (_CtrlBancoHoras.CdsBancoHoras) do
              begin
                Data := _CtrlBancoHoras.ListBancoHorasPeriodo(IdPessoa,
                  DateToStr(DataRefBancoHoras), DateToStr(Date));
                First;
                while not(EOF) do
                begin
                  if (FieldByName('SITBANCOHORAS').asFloat = 0) then
                    if not(_CtrlBancoHoras.GravarSitBancoHoras(
                        FieldByName('IDBANCOHORAS').asFloat,'1')) then
                      raise Exception.Create(_CtrlBancoHoras.MessageInfo);
                  Next;
                end;
              end;
            end;
          end;

          // Envia Mensagem de Progresso para o Cliente
          try


            IAppCliente.LancamentoColetivoHorasTrab_CB(0);
          except
          end;
        end;

        if (_CdsRubricaIndiv.Active) and not(_CdsRubricaIndiv.IsEmpty) then
        begin
          Result := ApplyCds(_CdsRubricaIndiv, FDbRubricaIndiv, [], []);
          if not(Result) then
            raise Exception.Create(FDbRubricaIndiv.MessageInfo);
        end;

        Commit;
        Result := true;
      except
        on E: Exception do
        begin
          MessageInfo := E.Message;
          Result := false;
          Rollback;
        end;
      end;
    finally
      FreeAndNil(_CtrlGlobalRH);
      if not(IsAppServer) then
        _CtrlBancoHoras.CdsBancoHoras.Free;
      FreeAndNil(_CtrlBancoHoras);
      FreeAndNil(_CtrlPessoaFuncionario);
      FreeAndNil(_CtrlFerias);
      FreeAndNil(_CtrlHoraTrab);
      FreeAndNil(_CtrlHorarioVariavel);
      FreeAndNil(_CtrlAssociaHorario);
      FreeAndNil(_CtrlListTerceirosRH);
      FreeAndNil(_CtrlRegAcessoFunc);
      FreeAndNil(_CtrlPessoaFilialPessoa);
      FreeAndNil(_CtrlRubricaIndiv);
      FreeAndNil(_CtrlProvDesc);
      FreeAndNil(_CtrlTipOcMed);


      FreeAndNil(_ListaCodAcesso);
      FreeAndNil(_ListaIdMotivo);

      FreeAndNil(_CdsParamRH);
      FreeAndNil(_CdsFunc);
      FreeAndNil(_CdsHorario);
      FreeAndNil(_CdsTurno);
      FreeAndNil(_CdsHorarioVariavel);
      FreeAndNil(_CdsFerias);
      FreeAndNil(_CdsFeriados);
      FreeAndNil(_CdsAcessoFunc);
      FreeAndNil(_CdsEstab);
      FreeAndNil(_CdsRubricaIndiv);
      FreeAndNil(_CdsProvDesc);
      FreeAndNil(_CdsMotivo);
    end;
  end;
end;

end.
