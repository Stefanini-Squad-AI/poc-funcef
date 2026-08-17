{-------------------------------------------------------------------------------
Nº SIG......: 43010
Data........: 01/09/2022
Responsável.: Luis Ferrari
Descrição...: Incluir novo na tabela Evolfunc
--------------------------------------------------------------------------------
N. SIG..........: 79051
Data............: 11/12/2018
Responsável.....: Eveson Cunha
Descrição.......: Alteração na query do CodResponsavel, pois estava retornando
                  o gestor substituto ao invés do gestor imediato
--------------------------------------------------------------------------------
N. SIG..........: 27758
Data............: 25/10/2016
Responsável.....: MSMT - Michelle Mota
Descrição.......: Alteração na consulta da função ListHistoricoEvolFunc - RNG03.
                  Criação da função ListDiretoriaEvolFunc - RNG04.
--------------------------------------------------------------------------------
N. Sol..........: 188194
N. Kintana......: 1779198
Data............: 25/03/2013
Responsável.....: Higor Nayde Ferreira
Descrição.......: Incluir novos campos das telas de Registro de Alteração
                  Funcional e Cadastro de Pessoal.

--------------------------------------------------------------------------------
N. Sol..........: 205930
N. Kintana......: 1991130
Data............: 02/05/2013
Responsável.....: Thiago Melo
Descrição.......: Não esta sendo persistido o tipo de envento no cadastro de
                  Registro de Alteração Funcional
--------------------------------------------------------------------------------
N. Sol..........: 177516
N. Kintana......: 1658128
Data............: 24/09/2012
Responsável.....: Helen V Bianchi
Descrição.......: GetSalarioEvolFunc - Ao se alterar o registro de alteração
                  funcional, o sistema estava calculando o percentual incorreto.
--------------------------------------------------------------------------------
Rotina......: CodResponsavel
Nº SOL......: 181965
Nº KINTANA..: 1689582
Data........: 06/06/2012
Responsável.: Helen V Bianchi
Descrição...: Adicionado a clausula para trazer apenas Funcionario
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 142865
Nº KINTANA..: 917808
Data........: 12/07/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação da Função CodResponsavel para obter o responsável pelo
              Centro de Custo
--------------------------------------------------------------------------------}

unit uCtrlEvolFunc;

interface

uses SysUtils, Controls, uCmControlObject, uCmDbObject, IvDictio,
  uCMClientDataSet, uCMTypes, uCtrlCustomRH, uDbEvolFunc, uDbFuncionario, UMensErro,
  Db; // Thiago Melo SOL 205930 Ktn 1991130

type
  TCtrlEvolFunc = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FCdsFuncionario: TCMClientDataSet;
    FCdsEvolFunc: TCMClientDataSet;
    FDbFuncionario: TDbFuncionario;
    FDbEvolFunc: TDbEvolFunc;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListEvolFunc(IdPessoa: double; DataAlterFunc: TDate = 0;
      IdMotivo: double = 0): OleVariant;
    function ListHistoricoEvolFunc(IdPessoa: double): OleVariant;
    function ListDiretoriaEvolFunc(CCusto: double): OleVariant; // Michelle Mota - SIG27758
    function GetSalarioEvolFunc(IdPessoa: double; DataRef: TDate): double;

    function GravarEvolFunc(GravarTabelaFunc: boolean = false): boolean;
    function GravarFunc(idvlrFuncao, vlrSalFunc,IdPessoa:string): boolean;  //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    function GravarDataFunc(Datafuncao : string;IdPessoa:double): boolean;  //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    function GravarDataFunc2(Datafuncao : string;IdPessoa:double): boolean;
    function GravarDataCargo(IdPessoa:double): boolean;
    function GravarDataCargo2(IdPessoa:double): boolean;


    function SelecionaFaixa(Step, IdFaixa:string): OleVariant;		        //Higor Nayde Ferreira Sol 188194 - Kintana 1779198

    function TransfereHistoricoRubricas(IdPessoa: double; IdEmpresa: integer): boolean;
    function TransfereLancamentoRubricas(IdPessoa: double; IdEmpresa: integer): boolean;

    function CodResponsavel(CodCentCusto:String): String;

    // Thiago Melo SOL 205930 Ktn 1991130
    function validaEvolFunc(Cds : TCMClientDataSet) : boolean;
    // Thiago Melo SOL 205930 Ktn 1991130

    property CdsFuncionario: TCMClientDataSet read FCdsFuncionario write FCdsFuncionario;
    property CdsEvolFunc: TCMClientDataSet read FCdsEvolFunc write FCdsEvolFunc;


  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlEvolFunc }

constructor TCtrlEvolFunc.Create;
begin
  inherited;
  FDbFuncionario := TDbFuncionario.Create(Self);
  FDbEvolFunc := TDbEvolFunc.Create(Self);
end;

destructor TCtrlEvolFunc.Destroy;
begin
  FDbFuncionario.Free;
  FDbEvolFunc.Free;
  if (IsAppServer) then
  begin
    FCdsEvolFunc.Free;
    FCdsFuncionario.Free;
  end;
  inherited;
end;

procedure TCtrlEvolFunc.OnCreateAppServer;
begin
  inherited;
  FCdsEvolFunc := TCMClientDataSet.Create(nil);
  FCdsFuncionario := TCMClientDataSet.Create(nil);
end;

procedure TCtrlEvolFunc.DoChangeDataBase;
begin
  inherited;
  FDbFuncionario.DataBaseName := DataBaseName;
  FDbEvolFunc.DataBaseName := DataBaseName;
end;

function TCtrlEvolFunc.ListEvolFunc(IdPessoa: double; DataAlterFunc: TDate;
  IdMotivo: double): OleVariant;
var
  sSQL: string;
begin
  // Define Parametros
  if (IdPessoa = -1) then
    sSQL :=
      'WHERE' +CR_LF+
      '  (1 = 2)'
  else
  begin
    sSQL := '';

    if (IdPessoa > 0) then
      sSQL := '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')';

    if (DataAlterFunc > 0) then
    begin
      if (IdPessoa > 0) then
        sSQL := sSQL +' AND';

      sSQL := sSQL +CR_LF+'  (DATAALTERFUNC = TO_DATE(' +
        QuotedStr(DateToStr(DataAlterFunc))+ ',''DD/MM/YYYY''))';
    end;

    if (IdMotivo > 0) then
    begin
      if (IdPessoa > 0) or (DataAlterFunc > 0) then
        sSQL := sSQL +' AND';

      sSQL := sSQL +CR_LF+'  (IDMOTIVO = ' +FloatToStr(IdMotivo)+ ')';
    end;

    if (sSQL <> '') then
      sSQL := 'WHERE' +CR_LF+ sSQL;
  end;

  // Define Sql
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  EVOLFUNC'+CR_LF+
    sSQL);
end;

{Início - Michelle Mota - SIG27758 - RNG04}
function TCtrlEvolFunc.ListDiretoriaEvolFunc(CCusto: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT C.CODCENTROCUSTO, ' +CR_LF+
    '       C.NOME CENT_CUST, ' +CR_LF+
    '       CD.NOME DIRETORIA ' +CR_LF+
    'FROM CENTCUST C ' +CR_LF+
    'JOIN CENTCUST CD ON REGEXP_REPLACE(CD.CODEXTERNO, ''\D'') = SUBSTR(REGEXP_REPLACE(C.CODEXTERNO, ''\D''), 0, 2) ' +CR_LF+
    ' AND CD.IDEMPRESA = C.IDEMPRESA AND CD.IDPLANCENTCUST = C.IDPLANCENTCUST ' +CR_LF+
    'WHERE C.CODCENTROCUSTO = ' + FloatToStr(CCusto) );
end;
{Término - Michelle Mota - SIG27758 - RNG04}

function TCtrlEvolFunc.ListHistoricoEvolFunc(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT H.rowid as LinhaRowId,' + CR_LF +
    '       H.IDPESSOA, H.DATAALTERFUNC, H.IDEMPRESA, H.IDESTAB,' +CR_LF+
    '       H.IDCARGO, H.CODCENTROCUSTO, H.TIPOPAGAMENTO, H.SALARIO,' +CR_LF+
    '       H.IDMOTIVO, H.PERC_REAJ, H.IDFAIXACARGO, H.IDFAIXAFUNCAO,' +CR_LF+
    '       H.NIVELINDIV1, H.NIVELINDIV2, H.IDFUNCAO, H.TRGDTINCLUSAO, H.FLGATUDADOSPREV,' +CR_LF+     // SIG 43010 FERRARI

    '       H.VLRFUNCAO, H.PERC_REAJFUNCAO, H.VLRSALARIOFUNCAO,' +CR_LF+ //Higor Nayde Ferreira Sol 188194 - Kintana 1779198

    '       M.DESCRICAO, C.TITULO, C2.TITULO AS FUNCAO,' +CR_LF+
    '       P.NOME AS FILIAL, CC.NOME AS CENTROCUSTO' +CR_LF+
    {Início - Michelle Mota - SIG27758 - RNG03}
    '       ,CD.NOME AS DIRETORIA ' +CR_LF+
    {'FROM PESSOA P, EVOLFUNC H, MOTIVO M, CARGO C, CARGO C2, CENTCUST CC' +CR_LF+
    'WHERE (H.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ')' +CR_LF+
    '  AND (M.GRUPOMOTIVO   IN (''A'',''D''))' +CR_LF+
    '  AND (H.IDMOTIVO       = M.IDMOTIVO(+))' +CR_LF+
    '  AND (H.IDCARGO        = C.IDCARGO(+))' +CR_LF+
    '  AND (H.IDFUNCAO       = C2.IDCARGO(+))' +CR_LF+
    '  AND (H.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))' +CR_LF+
    '  AND (H.IDEMPRESA      = CC.IDEMPRESA(+))' +CR_LF+
    '  AND (H.IDESTAB        = P.IDPESSOA(+))' +CR_LF+ }
    'FROM PESSOA P  ' +CR_LF+
    '  LEFT JOIN EVOLFUNC H  ' +CR_LF+
    '    ON (H.IDESTAB = P.IDPESSOA) ' +CR_LF+
    '  LEFT JOIN MOTIVO M ' +CR_LF+
    '    ON (H.IDMOTIVO = M.IDMOTIVO) ' +CR_LF+
    '   AND (M.GRUPOMOTIVO IN (''A'', ''D''))  ' +CR_LF+
    '  LEFT JOIN CARGO C  ' +CR_LF+
    '    ON (H.IDCARGO = C.IDCARGO) ' +CR_LF+
    '  LEFT JOIN CARGO C2  ' +CR_LF+
    '    ON (H.IDFUNCAO = C2.IDCARGO)  ' +CR_LF+
    '  LEFT JOIN CENTCUST CC  ' +CR_LF+
    '    ON (H.IDEMPRESA = CC.IDEMPRESA) ' +CR_LF+
    '   AND (H.CODCENTROCUSTO = CC.CODCENTROCUSTO) ' +CR_LF+
    '  JOIN CENTCUST CD ' +CR_LF+
    '    ON REGEXP_REPLACE(CD.CODEXTERNO, ''\D'') = ' +CR_LF+
    '       SUBSTR(REGEXP_REPLACE(CC.CODEXTERNO, ''\D''), 0, 2) ' +CR_LF+
    '   AND CD.IDEMPRESA = CC.IDEMPRESA  ' +CR_LF+
    '   AND CD.IDPLANCENTCUST = CC.IDPLANCENTCUST ' +CR_LF+
    ' WHERE (H.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ')' +CR_LF+
    {Término - Michelle Mota - SIG27758 - RNG03}
    'ORDER BY' +CR_LF+
    '  H.DATAALTERFUNC DESC, TRGDTINCLUSAO DESC');
end;

function TCtrlEvolFunc.GetSalarioEvolFunc(IdPessoa: double; DataRef: TDate): double;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  SALARIO' +CR_LF+
    'FROM' +CR_LF+
    '  EVOLFUNC' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA      = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)' +CR_LF+
    '                    FROM   EVOLFUNC' +CR_LF+
    '                    WHERE (IDPESSOA      = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    //Helen - SOL: 177516 KTN - 1658128 - Inicio
    //'                          (DATAALTERFUNC < TO_DATE(' +
    //Helen - SOL: 177516 KTN - 1658128 - Fim
    '                          (DATAALTERFUNC <= TO_DATE(' +
    QuotedStr(DateToStr(DataRef))+ ',''DD/MM/YYYY''))))' +CR_LF+
    'ORDER BY' +CR_LF+
    '  TRGDTINCLUSAO DESC');

  Result := _Cds.FieldByName('SALARIO').asFloat;

  _Cds.Free;
end;

function TCtrlEvolFunc.GravarEvolFunc(GravarTabelaFunc: boolean): Boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarEvolFunc(FCdsFuncionario.Data, FCdsEvolFunc.Data,
      GravarTabelaFunc);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsEvolFunc, FDbEvolFunc, [], []);
      if (Result) and (GravarTabelaFunc) then
      begin
        Result := ApplyCds(FCdsFuncionario, FDbFuncionario, [], []);
        if not(Result) then
          raise Exception.Create(FDbFuncionario.MessageInfo);
      end
      else
        raise Exception.Create(FDbEvolFunc.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlEvolFunc.TransfereHistoricoRubricas(IdPessoa: double; IdEmpresa: integer): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.TransfereHistoricoRubricas(IdPessoa, IdEmpresa);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSql('UPDATE HISTRUBSAL SET IDPESSJUR = '+IntToStr(IdEmpresa)+
                        ' WHERE IDPESSOA = '+FloatToStr(IdPessoa)+
                        ' AND IDPESSJUR <> '+IntToStr(IdEmpresa));
      if not (Result) then
        raise Exception.Create(MessageInfo);
        
      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlEvolFunc.TransfereLancamentoRubricas(IdPessoa: double; IdEmpresa: integer): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.TransfereHistoricoRubricas(IdPessoa, IdEmpresa);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      
      Result := ExecSql('UPDATE RUBRICAINDIV SET IDEMPRESA = '+IntToStr(IdEmpresa)+
                        ' WHERE IDPESSOA = '+FloatToStr(IdPessoa)+
                        ' AND (FLGPERMANENTE = 1 OR PARCELAS > NUMOCORRENCIAS)'+
                        ' AND IDEMPRESA <> '+IntToStr(IdEmpresa));
      if not (Result) then
        raise Exception.Create(MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        TratarErro(e.Message); //Brunno Mattos - KTN 767861 - SOL 132659
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

//Thaise Sol 142865 - Pesquisando o responsável pelo Centro de Custo
function TCtrlEvolFunc.CodResponsavel(CodCentCusto: String): String;
var sSQL: string;
    _Cds: TCMClientDataSet;
begin
  //Everson Cunha - SIG79051 - Início
  {sSQL:= 'SELECT R.IDPESSOA ' +
         'FROM   RESPCENTCUST R, PESSOA P '  +
         ' , FUNCIONARIO F '+             //HELEN - SOL:181965 KTN:1689582
         'WHERE  R.IDPESSOA = P.IDPESSOA  ' +
         'AND  R.IDPESSOA = F.IDPESSOA '+ //HELEN - SOL:181965 KTN:1689582
         'AND  R.IDEMPRESA = 1 ' +
         'AND  R.CODCENTROCUSTO = ' + QuotedStr(CodCentCusto) +
         ' AND DTFIMVIG IS NULL ';}

  sSQL:= 'SELECT R.IDPESSOA                 ' +
         '  FROM RESPCENTCUST R             ' +
         ' WHERE R.IDEMPRESA = 1            ' +
         '   AND R.CODCENTROCUSTO = ' + QuotedStr(CodCentCusto) +
         '   AND R.TIPORESPCENTCUST = ''G'' ' +
         '   AND R.DTFIMVIG IS NULL         ';
  //Everson Cunha - SIG79051 - Fim

  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(sSql);

  Result := _Cds.FieldByName('IDPESSOA').AsString;

  _Cds.Free;
end;
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 INICIO
function TCtrlEvolFunc.GravarFunc(idvlrFuncao, vlrSalFunc,IdPessoa:string): boolean;
begin
  try
    StartTransaction;
            //TFloatField(CdsDet.FieldByName('PERC_REAJ')).DisplayFormat := '###,###,##0.00';
     Result := ExecSQL(
        'UPDATE FUNCIONARIO SET'+CR_LF+
        '  VLRFUNCAO       = ' +StringReplace(idvlrFuncao, ',', '.', [rfReplaceAll])+','+CR_LF+
        '  VLRSALARIOFUNCAO  = '+StringReplace(vlrSalFunc, ',', '.', [rfReplaceAll])+CR_LF+
        'WHERE'+CR_LF+
        '  IDPESSOA    = ' +(IdPessoa));

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico da Situação Funcional.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;

end;

function TCtrlEvolFunc.GravarDataFunc(Datafuncao: string;
  IdPessoa: double): boolean;
begin
  try
    StartTransaction;

     Result := ExecSQL(
        'UPDATE FUNCIONARIO SET'+CR_LF+
        '  DATAFUNCAO       = ''' +(Datafuncao) +''''+CR_LF+

        'WHERE'+CR_LF+
        '  IDPESSOA    = ' +FloatToStr(IdPessoa));

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico da Situação Funcional.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;

function TCtrlEvolFunc.SelecionaFaixa(Step,
  IdFaixa: string): OleVariant;
var sSQL: string;
   _CdsFaixa: TCMClientDataSet;
begin
    _CdsFaixa := TCMClientDataSet.Create(nil);
    sSql:=  ('SELECT STEP' +(Step)+CR_LF+
        'AS FAIXA  FROM  FAIXASAL'+CR_LF+
        'WHERE'+CR_LF+
        '  IDFAIXASALARIAL = ' +(IdFaixa));

  _CdsFaixa.Data := GetDataPacket(sSql);
  Result := _CdsFaixa.FieldByName('FAIXA').AsFloat;

  _CdsFaixa.Free;

//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 FIM
end;
//Higor Nayde Ferreira Sol 188194 Ktn 1779198
function TCtrlEvolFunc.GravarDataFunc2(Datafuncao: string;
  IdPessoa: double): boolean;
begin
  try
    StartTransaction;

     Result := ExecSQL(
        'UPDATE FUNCIONARIO SET'+CR_LF+
        '  DATACARGO2       = ''' +(Datafuncao) +''''+CR_LF+

        'WHERE'+CR_LF+
        '  IDPESSOA    = ' +FloatToStr(IdPessoa));

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico da Situação Funcional.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;

end;
//Higor Nayde Ferreira Sol 188194 Ktn 1779198
function TCtrlEvolFunc.GravarDataCargo(IdPessoa: double): boolean;
begin
  try
    StartTransaction;

  Result := ExecSQL(
    'UPDATE FUNCIONARIO' + #13#10 +
    '   SET DATACARGO =' + #13#10 +
    '       (SELECT DATAALTER FUNC' + #13#10 +
    '          FROM (SELECT E.DATAALTERFUNC' + #13#10 +
    '                  FROM (SELECT E.DATAALTERFUNC,' + #13#10 +
    '                               E.IDCARGO,' + #13#10 +
    '                               NVL(LEAD(E.IDCARGO)' + #13#10 +
    '                                   OVER(ORDER BY E.DATAALTERFUNC DESC),' + #13#10 +
    '                                   0) AS IDCARGOANT' + #13#10 +
    '                          FROM EVOLFUNC E' + #13#10 +
    '                         WHERE IDPESSOA = ' + FloatToStr(IdPessoa) + #13#10 +
    '                         ORDER BY E.DATAALTERFUNC DESC) E' + #13#10 +
    '                 WHERE (E.IDCARGO <> E.IDCARGOANT)' + #13#10 +
    '                   AND ROWNUM = 1' + #13#10 +
    '                 ORDER BY E.DATAALTERFUNC DESC))' + #13#10 +
    ' WHERE IDPESSOA = ' + FloatToStr(IdPessoa) );

   if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico da Situação Funcional.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;
//Higor Nayde Ferreira Sol 188194 Ktn 1779198
function TCtrlEvolFunc.GravarDataCargo2(IdPessoa: double): boolean;
begin
  try
    StartTransaction;

     Result := ExecSQL(
        'UPDATE FUNCIONARIO F' + #13#10 +
        '   SET F.DATACARGO =' + #13#10 +
        '       (SELECT *' + #13#10 +
        '          FROM (SELECT DECODE(E.IDCARGO, 0, NULL, E.DATAALTERFUNC)' + #13#10 +
        '                  FROM (SELECT E.DATAALTERFUNC,' + #13#10 +
        '                               NVL(E.IDCARGO, 0) AS IDCARGO,' + #13#10 +
        '                               NVL(LEAD(E.IDCARGO)' + #13#10 +
        '                                   OVER(ORDER BY E.DATAALTERFUNC DESC), 0) AS IDCARGOANT' + #13#10 +
        '                          FROM EVOLFUNC E' + #13#10 +
        '                         WHERE IDPESSOA = ' + FloatToStr(IdPessoa) + #13#10 +
        '                         ORDER BY E.DATAALTERFUNC DESC) E' + #13#10 +
        '                 WHERE (E.IDCARGO <> E.IDCARGOANT)' + #13#10 +
        '                   AND ROWNUM = 1' + #13#10 +
        '                 ORDER BY E.DATAALTERFUNC DESC)),' + #13#10 +
        '' + #13#10 +
        '       F.DATACARGO2 =' + #13#10 +
        '       (SELECT *' + #13#10 +
        '          FROM (SELECT DECODE(E.IDFUNCAO, 0, NULL, E.DATAALTERFUNC)' + #13#10 +
        '                  FROM (SELECT E.DATAALTERFUNC,' + #13#10 +
        '                               NVL(E.IDFUNCAO, 0) AS IDFUNCAO,' + #13#10 +
        '                               NVL(LEAD(E.IDFUNCAO)' + #13#10 +
        '                                   OVER(ORDER BY E.DATAALTERFUNC DESC), 0) AS IDFUNCAOANT' + #13#10 +
        '                          FROM EVOLFUNC E' + #13#10 +
        '                         WHERE IDPESSOA = ' + FloatToStr(IdPessoa) + #13#10 +
        '                         ORDER BY E.DATAALTERFUNC DESC) E' + #13#10 +
        '                 WHERE (E.IDFUNCAO <> E.IDFUNCAOANT)' + #13#10 +
        '                   AND ROWNUM = 1' + #13#10 +
        '                 ORDER BY E.DATAALTERFUNC DESC)),' + #13#10 +
        '' + #13#10 +
        '       F.DATASALARIO =' + #13#10 +
        '       (SELECT *' + #13#10 +
        '          FROM (SELECT DECODE(E.SALARIO, 0, NULL, E.DATAALTERFUNC)' + #13#10 +
        '                  FROM (SELECT E.DATAALTERFUNC,' + #13#10 +
        '                               NVL(E.SALARIO, 0) AS SALARIO,' + #13#10 +
        '                               NVL(LEAD(E.SALARIO)' + #13#10 +
        '                                   OVER(ORDER BY E.DATAALTERFUNC DESC), 0) AS SALARIOANT' + #13#10 +
        '                          FROM EVOLFUNC E' + #13#10 +
        '                         WHERE IDPESSOA = ' +FloatToStr(IdPessoa)+ #13#10 +
        '                         ORDER BY E.DATAALTERFUNC DESC) E' + #13#10 +
        '                 WHERE (E.SALARIO <> E.SALARIOANT)' + #13#10 +
        '                   AND ROWNUM = 1' + #13#10 +
        '                 ORDER BY E.DATAALTERFUNC DESC)),' + #13#10 +
        '' + #13#10 +
        '       F.DATAFUNCAO =' + #13#10 +
        '       (SELECT *' + #13#10 +
        '          FROM (SELECT DECODE(E.VLRFUNCAO, 0, NULL, E.DATAALTERFUNC)' + #13#10 +
        '                  FROM (SELECT E.DATAALTERFUNC,' + #13#10 +
        '                               NVL(E.VLRFUNCAO, 0) AS VLRFUNCAO,' + #13#10 +
        '                               NVL(LEAD(E.VLRFUNCAO)' + #13#10 +
        '                                   OVER(ORDER BY E.DATAALTERFUNC DESC), 0) AS VLRFUNCAOANT' + #13#10 +
        '                          FROM EVOLFUNC E' + #13#10 +
        '                         WHERE IDPESSOA = ' + FloatToStr(IdPessoa) + #13#10 +
        '                         ORDER BY E.DATAALTERFUNC DESC) E' + #13#10 +
        '                 WHERE (E.VLRFUNCAO <> E.VLRFUNCAOANT)' + #13#10 +
        '                   AND ROWNUM = 1' + #13#10 +
        '                 ORDER BY E.DATAALTERFUNC DESC)),' + #13#10 +
        '' + #13#10 +
        '       F.SALARIOATUAL =' + #13#10 +
        '       (SELECT *' + #13#10 +
        '          FROM (SELECT *' + #13#10 +
        '                  FROM (SELECT NVL(E.SALARIO, 0)' + #13#10 +
        '                          FROM EVOLFUNC E' + #13#10 +
        '                         WHERE IDPESSOA = ' +FloatToStr(IdPessoa) + #13#10 +
        '                         ORDER BY E.DATAALTERFUNC DESC) E' + #13#10 +
        '                 WHERE ROWNUM = 1)),' + #13#10 +
        '' + #13#10 +
        '       F.VLRFUNCAO =' + #13#10 +
        '       (SELECT *' + #13#10 +
        '          FROM (SELECT *' + #13#10 +
        '                  FROM (SELECT NVL(E.VLRFUNCAO, 0)' + #13#10 +
        '                          FROM EVOLFUNC E' + #13#10 +
        '                         WHERE IDPESSOA = ' + FloatToStr(IdPessoa)+ #13#10 +
        '                         ORDER BY E.DATAALTERFUNC DESC) E' + #13#10 +
        '                 WHERE ROWNUM = 1)),' + #13#10 +
        '' + #13#10 +
        '       F.VLRSALARIOFUNCAO = NVL(F.VLRFUNCAO,0) + NVL(F.SALARIOATUAL,0)' + #13#10 +
        '' + #13#10 +
        ' WHERE F.IDPESSOA = ' + FloatToStr(IdPessoa));


    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico da Situação Funcional.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;
//Higor Nayde Ferreira Sol 188194 Ktn 1779198

function TCtrlEvolFunc.validaEvolFunc(Cds: TCMClientDataSet): boolean;
var
  BookMark : TBookmark;
begin
  if Cds.RecordCount = 0 then
  begin
    Result := False;
    Exit;
  end;

  BookMark := Cds.GetBookmark;

  Cds.Filtered := False;
  Cds.Filter   := ' IDMOTIVO IN ( 25, 29 ) ';
  Cds.Filtered := True;

  if Cds.IsEmpty then begin
    Result := False;
  end else begin
    Result := True;
  end;

  Cds.Filtered := False;
  Cds.GotoBookmark(BookMark);
  Cds.FreeBookmark(BookMark);
end;

end.

