// *****************************************************************************
// Descricao   : Contém as rotinas de integraçao dos sistemas previdenciários
//               com o sistema de RH e Folha de Pagamento da Fundação
// Responsável : Camille Monteiro Viana
// Setor       : Desenvolvimento TotalPrev
// Última Alt. : 29/05/2003
// *****************************************************************************

{*******************************************************
RESPONSÁVEL.: Douglas Siqueira
Nº SOL......: 171426
Nº KINTANA..: 1537613
Data........: 06/01/2012
Descrição...: Alteração do limite de faixas de 9 para 20.
*******************************************************}



unit uIntegraPrevRH;

interface

uses  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit, Windows, Messages, SysUtils,
  Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, UDataBase;

const
  ceEmprNovo             = '69';
  ceCCustoAlterado       = '70';
  ceMatriculaAlterada    = '72';
  ceDataAdmAlterada      = '4';
  ceDtDemissaoAlterada   = '61';
  ceSalarioAlterado      = '71';
  ceDtReadmissaoAlterada = '62';
  ceFilialAlterada       = '55';
  ceCargoAlterado        = '9';

function AtualizaDadosPrevFuncionario(IdFundacao, IdPessoa: LongInt): boolean;
function AtualizaFaixasSalariais(IdFundacao: LongInt): boolean;

function InsereFuncionarioElegivel(IdFundacao, IdPessoa: LongInt): boolean;
function AlteraFuncionarioElegivel(IdFundacao, IdPessoa: LongInt): boolean;
function ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa, IdCargoElegPatro: LongInt;
  Tipo: char; var IdCargo: LongInt): boolean;
function ProcessaDE_PARA_CONTABANCARIA(IdPessoa, IdAgencia: LongInt; NumConta: string): boolean;
function InsereCriticaInterface(qryAux: TwwQuery; IdFundacao, IdPessoa: LongInt;
  ValorNoRH, ValorNoAdmPREV, Matricula, CodErro, TipoDado: string): boolean;
function OraNumero(Numero: string): string;

implementation

uses uMensErro;

function AtualizaDadosPrevFuncionario(IdFundacao, IdPessoa: LongInt): boolean;
var
  qryElegivel: TwwQuery;
begin
  Result := false;

  qryElegivel := TwwQuery.Create(Application);
  qryElegivel.DataBaseName := 'BaseDados';

  // Verificar se pessoa é elegivel da fundacao
  with (qryElegivel) do
  begin
    Close;
    SQL.Clear;
    SQL.Add(
      'SELECT MATRICULA' +#13+
      'FROM   ELEGPATRO' +#13+
      'WHERE  (IDPESSJUR         = ' +IntToStr(IdFundacao)+ ') AND' +#13+
      '       ((IDPESSJURCEDIDO IS NULL) OR' +#13+
      '       (IDPESSJURCEDIDO   = ' +IntToStr(IdFundacao)+ ')) AND' +#13+
      '       (IDPESSOA          = ' +IntToStr(IdPessoa)+ ')');
    Open;

    if (qryElegivel.IsEmpty) then
    begin
      if not(InsereFuncionarioElegivel(IdFundacao, IdPessoa)) then
      begin
        qryElegivel.Free;
        exit;
      end;
    end
    else
    begin
      if not(AlteraFuncionarioElegivel(IdFundacao, IdPessoa)) then
      begin
        qryElegivel.Free;
        exit;
      end;
    end;
  end;
  qryElegivel.Free;
  Result := true;
end;

function AtualizaFaixasSalariais(IdFundacao: LongInt): boolean;
var
  qryFaixasRH, qryFaixasPREV: TwwQuery;
  iIdCargoRH, iIdCargoExt: LongInt;
  iFaixa: word;
  sIdNivel: string;
begin
  Result := false;

  qryFaixasRH := TwwQuery.Create(Application);
  qryFaixasRH.DataBaseName := 'BaseDados';
  qryFaixasPREV := TwwQuery.Create(Application);
  qryFaixasPREV.DataBaseName := 'BaseDados';

  // Verificar se pessoa é elegivel da fundacao
  with (qryFaixasRH) do
  begin
    // Trazer todos os cargos e suas faixas
    Close;
    SQL.Clear;
    SQL.Add(
      'SELECT' +#13+
      '  C.IDCARGO, F.IDFAIXASALARIAL, F.STEP1, F.STEP2, F.STEP3,' +#13+
      '  F.STEP4, F.STEP5, F.STEP6, F.STEP7, F.STEP8, F.STEP9,' +#13+

      //Douglas.Siqueira SOL 171426 Kintana 1537613
      '        F.STEP10,   F.STEP11, F.STEP12,  F.STEP13, F.STEP14, F.STEP15, '+
      '        F.STEP16,   F.STEP17, F.STEP18,  F.STEP19, F.STEP20, '+
      //Douglas.Siqueira SOL 171426 Kintana 1537613 - FIM


      '  F.DATAEFETIV' +#13+
      'FROM' +#13+
      '  CARGO@CM C, FAIXASAL@CM F' +#13+
      'WHERE' +#13+
      '  (F.IDFAIXASALARIAL = C.IDFAIXASALARIAL)' +#13+
      'UNION' +#13+
      'SELECT' +#13+
      '  C.IDCARGO, F.IDFAIXASALARIAL, F.STEP1, F.STEP2, F.STEP3,' +#13+
      '  F.STEP4, F.STEP5, F.STEP6, F.STEP7, F.STEP8, F.STEP9,' +#13+

      //Douglas.Siqueira SOL 171426 Kintana 1537613
      '        F.STEP10,   F.STEP11, F.STEP12,  F.STEP13, F.STEP14, F.STEP15, '+
      '        F.STEP16,   F.STEP17, F.STEP18,  F.STEP19, F.STEP20, '+
      //Douglas.Siqueira SOL 171426 Kintana 1537613

      '  F.DATAEFETIV' +#13+
      'FROM' +#13+
      '  FUNCIONARIO@CM C, FAIXASAL@CM F' +#13+
      'WHERE' +#13+
      '  (F.IDFAIXASALARIAL = C.IDFAIXACARGO)' +#13+
      'ORDER BY' +#13+
      '  IDCARGO');
    Open;
    while not(EOF) do
    begin
      iIdCargoRH := FieldByName('IDCARGO').asInteger;

      while not(EOF) and (iIdCargoRH = FieldByName('IDCARGO').asInteger) do
      begin
        // Verificar se cargo já existe
        qryFaixasPREV.Close;
        qryFaixasPREV.SQL.Clear;
        qryFaixasPREV.SQL.Add(
          'SELECT IDCARGOEXT' +#13+
          'FROM   CARGOEXT' +#13+
          'WHERE (IDPESSJUR     = ' +IntToStr(IdFundacao)+ ') AND' +#13+
          '      (RTRIM(CODIGO) = ''' +IntToStr(iIdCargoRH)+ ''')');
        qryFaixasPREV.Open;

        if (qryFaixasPREV.IsEmpty) then
        begin
          iIdCargoExt := iIdCargoRH;
          if not(ProcessaDE_PARA_CARGO(IdFundacao, -1, -1, 'C', iIdCargoExt)) then
          begin
            qryFaixasRH.Free;
            qryFaixasPREV.Free;
            exit;
          end;
        end
        else
          iIdCargoExt := qryFaixasPREV.FieldByName('IDCARGOEXT').asInteger;

        // Verificar se faixa salarial existe
        for iFaixa:=1 to 20 {9} do //Douglas.Siqueira SOL 171426 Kintana 1537613
        begin
          //Douglas.Siqueira SOL 171426 Kintana 1537613
          //sIdNivel := Trim(FieldByName('IDFAIXASALARIAL').asString)+'0'+IntToStr(iFaixa);
          sIdNivel := Trim(FieldByName('IDFAIXASALARIAL').AsString);
          if iFaixa < 10 then
             sIdNivel := sIdNivel +'0';
          sIdNivel := sIdNivel + IntToStr(iFaixa);
          //Douglas.Siqueira SOL 171426 Kintana 1537613 - fim

          // Verificar se nivel existe
          qryFaixasPREV.Close;
          qryFaixasPREV.SQL.Clear;
          qryFaixasPREV.SQL.Add(
            'SELECT IDNIVEL' +#13+
            'FROM   NIVEL' +#13+
            'WHERE (IDNIVEL   = ' +sIdNivel+ ') AND' +#13+
            '      (IDPESSJUR = ' +IntToStr(IdFundacao)+ ')');
          qryFaixasPREV.Open;
          if (qryFaixasPrev.IsEmpty) then
          begin
            qryFaixasPREV.Close;
            qryFaixasPREV.SQL.Clear;
            qryFaixasPREV.SQL.Add(
              'INSERT INTO NIVEL (IDPESSJUR, IDNIVEL, CODIGO)' +#13+
              'VALUES ( '+IntToStr(IdFundacao) +', '+
              sIdNivel +', '+
              '''' +sIdNivel+ ''')');
            try
              qryFaixasPREV.ExecSQL;
            except
              qryFaixasRH.Free;
              qryFaixasPREV.Free;
              exit;
            end;
          end;

          // Verificar se existe cargoxnivel
          qryFaixasPREV.Close;
          qryFaixasPREV.SQL.Clear;
          qryFaixasPREV.SQL.Add(
            'SELECT IDNIVEL' +#13+
            'FROM   CARGOXNIVEL' +#13+
            'WHERE  (IDCARGOEXT = ' +IntToStr(iIdCargoExt)+ ') AND' +#13+
            '       (IDNIVEL    = ' +sIdNivel+ ') AND' +#13+
            '       (IDPESSJUR  = ' +IntToStr(IdFundacao)+ ')');
          qryFaixasPREV.Open;
          if (qryFaixasPREV.IsEmpty) then
          begin
            qryFaixasPREV.Close;
            qryFaixasPREV.SQL.Clear;
            qryFaixasPREV.SQL.Add(
              'INSERT INTO CARGOXNIVEL (IDPESSJUR, IDCARGOEXT, IDPESSJURNIVEL, IDNIVEL, '+
              'DATAVIGENCIA, DATAFIM)' +#13+
              'VALUES (' +
              IntToStr(IdFundacao) +', '+
              IntToStr(iIdCargoext) +', '+
              IntToStr(IdFundacao) +', '+
              sIdNivel +', '+
              'TO_DATE(''' +FieldByName('DATAEFETIV').asString+ ''',''DD/MM/YYYY''), ' +
              'NULL )');
            try
              qryFaixasPREV.ExecSQL;
            except
              qryFaixasRH.Free;
              qryFaixasPREV.Free;
              exit;
            end;
          end;

          qryFaixasPREV.Close;
          qryFaixasPREV.SQL.Clear;
          qryFaixasPREV.SQL.Add(
            'SELECT VALOR' +#13+
            'FROM   FAIXANIVEL' +#13+
            'WHERE  (IDNIVEL        = ' +sIdNivel +') AND' +#13+
            '       (DATAEFETIVACAO = TO_DATE(''' +FieldByName('DATAEFETIV').asString+ ''',''DD/MM/YYYY'')) AND' +#13+
            '       (IDPESSJUR      = ' +IntToStr(IdFundacao)+ ')');
          qryFaixasPREV.Open;

          if (qryFaixasPREV.IsEmpty) then
          begin
            if (FieldByName('STEP'+IntToStr(iFaixa)).asFloat > 0) then
            begin
              qryFaixasPREV.Close;
              qryFaixasPREV.SQL.Clear;
              qryFaixasPREV.SQL.Add(
                'INSERT INTO FAIXANIVEL (IDPESSJUR, IDNIVEL, IDFAIXASALEXT, DATAEFETIVACAO, VALOR)' +#13+
                'VALUES (' +
                IntToStr(IdFundacao) +', '+
                sIdNivel +', '+
                IntToStr(LeUltRegistro(nil,'FAIXANIVEL')) +', '+
                'TO_DATE(''' +FieldByName('DATAEFETIV').asString+ ''',''DD/MM/YYYY''), '+
                OraNumero(FieldByName('STEP'+IntToStr(iFaixa)).asString)+ ')');
              try
                qryFaixasPREV.ExecSQL;
              except
                qryFaixasRH.Free;
                qryFaixasPREV.Free;
                exit;
              end;
            end;
          end
          else
          begin
            if (qryFaixasPREV.FieldByName('VALOR').asString <>
                FieldByName('STEP'+IntToStr(iFaixa)).asString) then
            begin // faixa foi apenas alterada
              qryFaixasPREV.Close;
              qryFaixasPREV.SQL.Clear;
              qryFaixasPREV.SQL.Add(
                'UPDATE FAIXANIVEL SET VALOR = ' +
                OraNumero(FieldByName('STEP'+IntToStr(iFaixa)).asString)+
                ' WHERE  IDPESSJUR = '+IntToStr(IdFundacao)+
                ' AND    IDNIVEL   = '+sIdNivel              +
                ' AND    DATAEFETIVACAO = TO_DATE(''' +FieldByName('DATAEFETIV').asString+ ''',''DD/MM/YYYY'') ');
              try
                qryFaixasPREV.ExecSQL;
              except
                qryFaixasRH.Free;
                qryFaixasPREV.Free;
                exit;
              end;
            end;
          end;
        end;
        Next;
      end;
    end;
  end;
  qryFaixasRH.Free;
  qryFaixasPREV.Free;
  Result := true;
end;

function OraNumero(Numero: string):string;
var
  i: integer;
  sResult, sOra: string;
  bPrimPonto: boolean;
begin
  if (Trim(Numero) = '') then
  begin
    Result := '0';
    exit;
  end;
  sOra := '';
  bPrimPonto := false;
  for i:=length(Trim(Numero)) downto 1 do
  begin
    if (Numero[i] = ',') then
    begin
      if not(bPrimPonto) then
      begin
        sOra := sOra + '.';
        bPrimPonto := true;
      end
      else
        sOra := sOra;
    end
    else
    begin
      if (Numero[i] <> '.') then
        sOra := sOra + Numero[i]
      else
      begin
        if not(bPrimPonto) then
        begin
          sOra := sOra+'.';
          bPrimPonto := true;
        end
        else
          sOra := sOra;
      end;
    end;
  end;
  sResult := '';
  for i:=length(sOra) downto 1 do
    sResult := sResult + sOra[i];

  Result := sResult;
end;

function InsereCriticaInterface (qryAux: TwwQuery;
  IdFundacao, IdPessoa: LongInt; ValorNoRH, ValorNoAdmPREV, Matricula, CodErro,
  TipoDado: string): boolean;
var
  iSeqCritica: LongInt;
begin
  Result := false;

  qryaux.Close;
  qryaux.sql.Clear;
  qryaux.sql.Add('SELECT MAX(SEQCRITICA) SEQCRITICA FROM TABCRITICASCCP');
  qryAux.Open;

  if (qryAux.IsEmpty) then
    iSeqCritica := 1
  else
    iSeqCritica := qryAux.FieldByName('SEQCRITICA').asInteger + 1;

  qryAux.Close;
  qryAux.sql.Clear;
  qryAux.sql.Add(
    'INSERT INTO TABCRITICASCCP (IDPESSJUR, IDPESSOA, SEQCRITICA, MESCOBRANCA, '+
    'VALORCHAVE, VALORNAFUNDACAO, VALORNOINTERFACE, CHAVE, CODERRO, TIPODADO, GRUPO, '+
    'FLGPROCESSADO, DTPROCESSADO)' +#13+
    'VALUES (' +
    IntToStr(IdFundacao) +', '+
    IntToStr(IdPessoa)   +', '+
    IntToStr(iSeqCritica)  +', '+
    ''''+Copy(DateToStr(date),7,4)+Copy(DateToStr(date),4,2)+''','+
    ''''+Matricula       +''', '+
    ''''+ValorNoAdmPREV  +''', '+
    ''''+ValorNoRH       +''', '+
    '''M'''                +',   '+
    CodErro              +',   '+
    ''''+TipoDado        +''', '+
    '''R'''                +',   '+
    '0'                    +',   '+
    'SYSDATE ) ');

  try
    qryAux.ExecSQL;
  except
    exit;
  end;

  Result := true;
end;


function ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa, IdCargoElegPatro: LongInt;
  Tipo: char; var IdCargo: LongInt): boolean;
var
  qryAux: TwwQuery;
  iIdPCS, iIdCargoOriginal, iIdCargoPrev: LongInt;
  sDataAlterFunc, sSQL: string;
begin
  Result := false;

  if (IdCargo <= 0) then
  begin
    Result := true;
    exit;
  end;

  iIdCargoOriginal := IdCargo;
  qryAux := TwwQuery.Create(Application);
  qryAux.DatabaseName := 'BaseDados';

  // Verificar se cargo está na tabela CARGOEXT
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(
    'SELECT IDCARGOEXT' +#13+
    'FROM   CARGOEXT' +#13+
    'WHERE  (IDPESSJUR     = ' +IntToStr(IdFundacao)+ ') AND' +#13+
    '       (RTRIM(CODIGO) = ''' +IntToStr(IdCargo)+ ''')');

  qryAux.Open;

  if not(qryAux.IsEmpty) then
    IdCargo := qryAux.FieldByName('IDCARGOEXT').asInteger
  else
  begin
    // Cargo não está na tabela CARGOEXT. O cargo deverá ser inserido na tabela de cargos
    // Buscar PCS válido no momento
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(
      ' SELECT IDPCS '+
      ' FROM   PCS '+
      ' WHERE  IDPESSJUR = '+IntToStr(IdFundacao)+
      ' AND    FINALVIGENCIA IS NULL');
    qryAux.Open;

    if not(qryAux.IsEmpty) then
      iIdPCS := qryAux.FieldByName('IDPCS').asInteger
    else
      iIdPCS := -1;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(
      'SELECT IDCARGO, TITULO, DESCRICAO, CBO, IDFAIXASALARIAL, CODNIVEL '+
      ' FROM  CARGO'+
      ' WHERE IDCARGO  = '+IntToStr(IdCargo));
    qryAux.Open;

    iIdCargoPrev := LeUltRegistro(nil, 'CARGOEXT');
    IdCargo := iIdCargoPrev;

    sSQL := 'INSERT INTO CARGOEXT (IDCARGOEXT, IDFAIXASALEXT, TITULO, CBO,'+
            ' DESCRICAO, IDPESSJUR, IDPCS, IDCARREIRA, '+
            ' TIPO, JORNADA, FLGATIVO, IDTIPOFUNC, '+
            ' CODIGO, NOMERESUMIDO, FLGPCC, IDCARGOCORRESP, '+
            ' DATACRIACAO, ANOMESALT, ULTMESPROC ) '+
            ' VALUES (';

    sSQL := sSQL + IntToStr(iIdCargoPrev)+', ';
    sSQL := sSQL + ' NULL, '; // idfaixasalext não é usado
    sSQL := sSQL + ''''+qryAux.FieldbyName('TITULO').asString+''', ';

    if (qryAux.FieldbyName('CBO').asString = '') then
      sSQL := sSQL + ' NULL, '
    else
      sSQL := sSQL + qryAux.FieldbyName('CBO').asString+', ';

    sSQL := sSQL + ' NULL, '; // descricao é um campo memo
    sSQL := sSQL + IntToStr(IdFundacao)+',';

    if (iIdPCS > 0) then
      sSQL := sSQL + IntToStr(iIdPCS)+','
    else
      sSQL := sSQL + ' NULL, ';

    sSQL := sSQL + ' NULL, ';
    sSQL := sSQL + ''''+Tipo+''', ';
    sSQL := sSQL + ' NULL, ';
    sSQL := sSQL + ' 1, ';
    sSQL := sSQL + ' NULL, ';
    sSQL := sSQL + IntToStr(IdCargo)+', ';
    sSQL := sSQL + ' NULL, ';
    sSQL := sSQL + ' 0, ';
    sSQL := sSQL + ' NULL, ';
    sSQL := sSQL + ' TO_DATE('''+DateToStr(date)+''', ''DD/MM/YYYY''), ';
    sSQL := sSQL + ' ''0000/00'', ';
    sSQL := sSQL + ' ''0000/00''  ';

    sSQL := sSQL + ' ) ';

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSQL);

    try
      qryAux.ExecSQL;
    except
      qryAux.Free;
      exit;
    end;
  end;

  if (IdPessoa <= 0) then
  begin
    qryAux.Free;
    Result := true;
    exit
  end;

  // Inserir CARGO na tabela EVOLFUNCPREV
  with (qryAux) do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT MAX(E.DATAALTERFUNC) AS DATAALTERFUNC '+
            ' FROM   EVOLFUNC E, MOTIVO M '+
            ' WHERE  E.IDPESSOA = ' +IntToStr(IdPessoa));
    if (Tipo = 'C') then
      SQL.Add('AND    E.IDCARGO  = '+IntToStr(iIdCargoOriginal))
    else
      SQL.Add('AND    E.IDFUNCAO = '+IntToStr(iIdCargoOriginal));

    SQL.Add(' AND    M.IDMOTIVO = E.IDMOTIVO '+
            ' AND    M.GRUPOMOTIVO = ''A'' ');
    Open;

    if (IsEmpty) or (FieldByName('DATAALTERFUNC').asString = '') then
    begin
      qryAux.Free;
      Result := true;
      exit;
    end;

    sDataAlterFunc := FieldbyName('DATAALTERFUNC').asString;

    // Atualizar cargo/função anterior com datafinal = (data inicio do novo cargo) - 1
    sSQL := ' UPDATE EVOLFUNCPREV SET DATAFINAL = TO_DATE('''+DateToStr(StrToDate(sDataAlterFunc) - 1)+''', ''DD/MM/YYYY'') '+
            ' WHERE  IDPESSJUR  = '+IntToStr(IdFundacao)+
            ' AND    IDPESSOA   = '+IntToStr(IdPessoa);

    if (Tipo = 'C') then
      sSQL := sSQL + ' AND    IDCARGOEXT = '+IntToStr(IdCargoElegPatro)
    else
      sSQL := sSQL + ' AND    IDFUNCAO   = '+IntToStr(IdCargoElegPatro);

    sSQL := sSQL + ' AND DATAINICIO = ( SELECT MAX(DATAINICIO) '+
            '                           FROM   EVOLFUNCPREV '+
            '                           WHERE  IDPESSJUR  = '+IntToStr(IdFundacao)+
            '                           AND    IDPESSOA   = '+IntToStr(IdPessoa) ;

    if (Tipo = 'C') then
      sSQL := sSQL + '               AND    IDCARGOEXT = '+IntToStr(IdCargoElegPatro)
    else
      sSQL := sSQL + '               AND    IDFUNCAO   = '+IntToStr(IdCargoElegPatro);

    sSQL := sSQL + '                  ) ';

    Close;
    SQL.Clear;
    SQL.Add(sSQL);
  end;

  try
    qryAux.ExecSQL;
  except
    qryAux.Free;
    exit;
  end;

  with qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT SEQHISTFUNC FROM EVOLFUNCPREV '+
            ' WHERE  IDPESSOA = ' +IntToStr(IdPessoa));

    if (Tipo = 'C') then
      SQL.Add(' AND    IDCARGOEXT = '+IntToStr(IdCargo))
    else
      SQL.Add(' AND    IDFUNCAO   = '+IntToStr(IdCargo));

    SQL.Add(' AND DATAINICIO = TO_DATE('''+sDataAlterFunc+''', ''DD/MM/YYYY'') ');
    Open;

    if not(IsEmpty) then
    begin
      qryAux.Free;
      Result := true;
      exit;
    end;

    sSQL := ' INSERT INTO EVOLFUNCPREV ( DATAINICIO,  DATAFINAL,    IDPESSJURCG, IDCARGOEXT,  '+
            '                            IDPESSJURFG, IDFUNCAO,     IDPESSJURGR, IDGRUPOFUNC, '+
            '                            IDPESSJUR,   IDPESSOA,     MODOFUNCAO,   ORIGEM,     '+
            '                            PERCADNOT,   PERCATS,      PERCADICIONALNOT,         '+
            '                            PERCFUNCAO,  PERCINSALUB,  PERCPERICUL,              '+
            '                            PERC1AC,     PERC2AC,      QTDEMINUTOS,              '+
            '                            SEQHISTFUNC                                          )'+
            ' VALUES ( ';
    sSQL := sSQL +' TO_DATE('''+sDataAlterFunc+''', ''DD/MM/YYYY''), '; // DATAINICIO
    sSQL := sSQL +' NULL, ';                                            // DATAFINAL

    if (Tipo = 'C') then
    begin
      sSQL := sSQL +IntToStr(IdFundacao)+' , ';                      // IDPESSJURCG
      sSQL := sSQL +IntToStr(IdCargo)+' , ';                         // IDCARGOEXT
      sSQL := sSQL +' NULL, ';                                         // IDPESSJURFG
      sSQL := sSQL +' NULL, ';                                         // IDFUNCAO
      sSQL := sSQL +' NULL, ';                                         // IDPESSJURGR
      sSQL := sSQL +' NULL, ';                                         // IDGRUPOFUNC
    end
    else
    begin
      sSQL := sSQL +' NULL, ';                                         // IDPESSJURCG
      sSQL := sSQL +' NULL, ';                                         // IDCARGOEXT
      sSQL := sSQL +IntToStr(IdFundacao)+' , ';                      // IDPESSJURFG
      sSQL := sSQL +IntToStr(IdCargo)+' , ';                         // IDFUNCAO
      sSQL := sSQL +' NULL, ';                                         // IDPESSJURGR
      sSQL := sSQL +' NULL, ';                                         // IDGRUPOFUNC
    end;

    sSQL := sSQL +IntToStr(IdFundacao)+' , ';                         // IDPESSJUR
    sSQL := sSQL +IntToStr(IdPessoa)+', ';                            // IDPESSOA

    if (Tipo = 'C') then
      sSQL := sSQL +' NULL, '                                        // MODOFUNCAO
    else
      sSQL := sSQL +' ''ES'', ';                                     // MODOFUNCAO : ES = EVENTUAL/SUBSTITUIÇÃO

    sSQL := sSQL +'''I'', ';                                            // ORIGEM
    sSQL := sSQL +' NULL, ';                                            // PERCADNOT
    sSQL := sSQL +' NULL, ';                                            // PERCATS
    sSQL := sSQL +' NULL, ';                                            // PERCADICIONALNOT
    sSQL := sSQL +' NULL, ';                                            // PERCFUNCAO
    sSQL := sSQL +' NULL, ';                                            // PERCINSALUB
    sSQL := sSQL +' NULL, ';                                            // PERCPERICUL
    sSQL := sSQL +' NULL, ';                                            // PERC1AC
    sSQL := sSQL +' NULL, ';                                            // PERC2AC
    sSQL := sSQL +' NULL, ';                                            // QTDEMINUTOS
    sSQL := sSQL + IntToStr(LeUltRegistro(nil,'EVOLFUNCPREV'));         // SEQHISTFUNC
    sSQL := sSQL + ')';

    Close;
    SQL.Clear;
    SQL.Add(sSQL);
  end;

  try
    qryAux.ExecSQL;
  except
    qryAux.Free;
    exit;
  end;

  qryAux.Free;
  Result := true;
end;

function ProcessaDE_PARA_CONTABANCARIA(IdPessoa, IdAgencia: LongInt; NumConta: string): boolean;
var
  qryAux: TwwQuery;
  sSQL: string;
begin
  Result := false;
  qryAux := TwwQuery.Create(Application);
  qryAux.DatabaseName := 'BaseDados';

  // Verificar se conta bancária está na tabela CONTABANCARIA
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT C.IDCBANCARIA, C.CONTACORRENTE, C.IDAGENCIA, '+
                 '        C.FLGCONTAPREF, C.IDPESSOA, C.TIPOCONTA, '+
                 '        C.FLGCONTACONJUNTA '+
                 ' FROM   CONTABANCARIA C '+
                 ' WHERE  C.IDPESSOA  = '+IntToStr(IdPessoa));
  qryAux.Open;

  if (qryAux.IsEmpty) then
  begin // pessoa nao tem contabancaria cadastrada
    sSQL := ' INSERT INTO CONTABANCARIA (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, '+
            '             FLGCONTAPREF,  IDPESSOA,    TIPOCONTA,     FLGCONTACONJUNTA) '+
            ' VALUES ( '+IntToStr(LeUltRegistro(nil, 'CONTABANCARIA'))+','+
                         ''''+NumConta+''', '+
                         IntToStr(IdAgencia)+','+
                         '1, '+
                         IntToStr(IdPessoa)+','+
                         '''0'', ''N'') ';
  end
  else
  begin // pessoa já tem conta bancaria
    if ((qryAux.FieldByName('IDAGENCIA').asInteger =  IdAgencia) and
        (qryAux.FieldByName('CONTACORRENTE').asString <> NumConta)) or
       ((qryAux.FieldByName('IDAGENCIA').asInteger <> IdAgencia) and
        (qryAux.FieldByName('CONTACORRENTE').asString =  NumConta)) then
    begin // pessoa apenas mudou de agencia ou conta
      sSQL := ' UPDATE CONTABANCARIA SET IDAGENCIA = '+IntToStr(IdAgencia)+', CONTACORRENTE = '''+NumConta+''''+
              ' WHERE  IDCBANCARIA = '+qryAux.FieldByName('IDCBANCARIA').asString;
    end
    else
    begin // pessoa tem uma nova conta bancaria
          // Alterar a conta anterior para NAO-PREFERENCIAL e inserir a nova como PREFERENCIAL
      sSQL := ' UPDATE CONTABANCARIA SET FLGCONTAPREF = 0 '+
              ' WHERE  IDCBANCARIA = '+qryAux.FieldByName('IDCBANCARIA').asString;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSQL);
      try
        qryAux.ExecSQL;
      except
        qryAux.Free;
        exit;
      end;
      sSQL := ' INSERT INTO CONTABANCARIA (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, '+
              '             FLGCONTAPREF,  IDPESSOA,    TIPOCONTA,     FLGCONTACONJUNTA) '+
              ' VALUES ( '+IntToStr(LeUltRegistro(nil, 'CONTABANCARIA'))+','+
                           ''''+NumConta+''', '+
                           IntToStr(IdAgencia)+','+
                           '1, '+
                           IntToStr(IdPessoa)+','+
                           '''0'', ''N'') ';
    end;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  try
    qryAux.ExecSQL;
  except
    qryAux.Free;
    exit;
  end;

  qryAux.Free;
  Result := true;
end;

function InsereFuncionarioElegivel(IdFundacao, IdPessoa: LongInt): boolean;
var
  qryElegivel : TwwQuery;
  sSQL: string;
  iIdCargo, iIdFuncao: LongInt;
begin
  Result := false;

  qryElegivel := TwwQuery.Create(Application);
  qryElegivel.DatabaseName := 'BaseDados';

  with (qryElegivel) do
  begin
    // Inserir pessoa na tabela ELEGIVEL
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO ELEGIVEL (IDPESSOA) VALUES (' +IntToStr(IdPessoa)+ ')');

    try
      ExecSQL;
    except
    end;

    // Buscar dados da pessoa a inserir
    Close;
    SQL.Clear;
    SQL.Add(
      'SELECT IDPESSOA,       IDSITFUNC,    IDEMPRESA AS IDEMPRESAPROP, CODCENTROCUSTO, MATRICULA,      '+
      '        DATAADMISSAO,   DATADESLIGAMENTO AS DATADEMISSAO, SALARIOATUAL AS SALTOTAL,               '+
      '        DATARETORNO AS  DATAREADMISSAO,                                                           '+
      '        IDESTAB,        IDCARGO,      IDFUNCAO,           IDFAIXACARGO,   IDFAIXAFUNCAO,          '+
      '        NIVELINDIV1,    NIVELINDIV2,  IDAGENCIASALARIO,   IDAGENCIAFGTS,  NUMCONTASALARIO,        '+
      '        NUMCONTAFGTS                                                                              '+
      ' FROM   FUNCIONARIO@CM  F                                                                            '+
      ' WHERE  IDPESSOA = '+IntToStr(IdPessoa));
    Open;

    iIdCargo := FieldByName('IDCARGO').asInteger;
    if not(ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa, -1, 'C', iIdCargo)) then
    begin
      qryElegivel.Free;
      exit;
    end;

    iIdFuncao := FieldByName('IDFUNCAO').asInteger;
    if not(ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa, -1, 'F', iIdFuncao)) then
    begin
      qryElegivel.Free;
      exit;
    end;

    if (FieldByName('IDAGENCIASALARIO').asInteger > 0) and
       (FieldByName('NUMCONTASALARIO').asString <> '') then
    begin
      if not(ProcessaDE_PARA_CONTABANCARIA(IdPessoa,
             FieldByName('IDAGENCIASALARIO').asInteger,
             FieldByName('NUMCONTASALARIO').asString)) then
      begin
        qryElegivel.Free;
        exit;
      end;
    end;

    // Inserir pessoa na tabela ELEGPATRO
    sSQL := ' INSERT INTO ELEGPATRO                                                            '+
            '  (IDPESSJUR,         IDPESSOA,          IDSITFUNC,        IDEMPRESAPROP,    CODCENTROCUSTO, MATRICULA,      '+
            '   DATAADMISSAO,      DATADEMISSAO,      SALTOTAL,         DATAREADMISSAO,   IDESTAB,                        '+
            '   IDPESSJURCARGO,    IDCARGOEXT,        IDPESSJURFUNC,    IDFUNCAOEXT,                                      '+
            '   PARTICIPPREVID,    PARTICIPASSIST,    NIVEL,            DATAINICIOAFAST,  DATAFIMAFAST,                   '+
            '   TEMPONAOCREDITADO, TEMPOSERVANTERIOR, TEMPOSERVANTREAL, TEMPOSITESPECIAL,                                 '+
            '   VALORBASE1,        VALORBASE2,        VALORBASE3,       IDPESSJURORGAO,                                   '+
            '   SIGLA,             FLGDIRETOR,        CODVINCULAFUNC) '+
            ' VALUES ( '+IntToStr(IdFundacao) +','+IntToStr(IdPessoa)+',';

    if (Trim(FieldByName('IDSITFUNC').asString) <> '') then
      sSQL := sSQL + FieldByName('IDSITFUNC').asString+','
    else
      sSQL := sSQL + ' NULL ,';

    if (Trim(FieldByName('IDEMPRESAPROP').asString) <> '') then
      sSQL := sSQL + FieldByName('IDEMPRESAPROP').asString+','
    else
      sSQL := sSQL + ' NULL ,';

    if (Trim(FieldByName('CODCENTROCUSTO').asString) <> '') then
      sSQL := sSQL + ''''+FieldByName('CODCENTROCUSTO').asString+''','
    else
      sSQL := sSQL + ' NULL ,';

    if (Trim(FieldByName('MATRICULA').asString) <> '') then
      sSQL := sSQL + ''''+FieldByName('MATRICULA').asString+''','
    else
      sSQL := sSQL + ' NULL ,';

    if (Trim(FieldByName('DATAADMISSAO').asString) <> '') then
      sSQL := sSQL + 'TO_DATE('''+FieldByName('DATAADMISSAO').asString+''',''DD/MM/YYYY''), '
    else
      sSQL := sSQL + ' NULL ,';

    if (Trim(FieldByName('DATADEMISSAO').asString) <> '') then
      sSQL := sSQL + 'TO_DATE('''+FieldByName('DATADEMISSAO').asString+''',''DD/MM/YYYY''), '
    else
      sSQL := sSQL + ' NULL ,';

    if (Trim(FieldByName('SALTOTAL').asString) <> '') then
      sSQL := sSQL + OraNumero(FieldByName('SALTOTAL').asString)+', '
    else
      sSQL := sSQL + ' NULL ,';

    if (Trim(FieldByName('DATAREADMISSAO').asString) <> '') then
      sSQL := sSQL + 'TO_DATE('''+FieldByName('DATAREADMISSAO').asString+''',''DD/MM/YYYY''), '
    else
      sSQL := sSQL + ' NULL ,';

    if (Trim(FieldByName('IDESTAB').asString) <> '') then
      sSQL := sSQL + FieldByName('IDESTAB').asString+','
    else
      sSQL := sSQL + ' NULL ,';

    if (iIdCargo > 0) then
    begin
      sSQL := sSQL + IntToStr(IdFundacao) +', ';
      sSQL := sSQL + IntToStr(iIdCargo) +', ';
    end
    else
    begin
      sSQL := sSQL + 'NULL, ';
      sSQL := sSQL + 'NULL, ';
    end;

    if (iIdFuncao > 0) then
    begin
      sSQL := sSQL + IntToStr(IdFundacao)+',';
      sSQL := sSQL + IntToStr(iIdFuncao)+',';
    end
    else
    begin
      sSQL := sSQL + ' NULL ,';
      sSQL := sSQL + ' NULL ,';
    end;

    sSQL := sSQL + ' 0 ,';    // PARTICIPPREVID
    sSQL := sSQL + ' 0 ,';    // PARTICIPASSIST
    sSQL := sSQL + ' NULL ,'; // NIVEL
    sSQL := sSQL + ' NULL ,'; // INICIOAFAST
    sSQL := sSQL + ' NULL ,'; // FIMAFAST

    sSQL := sSQL + ' 0 ,';    // TEMPONAOCREDITADO
    sSQL := sSQL + ' 0 ,';    // TEMPOSERVANTERIOR
    sSQL := sSQL + ' 0 ,';    // TEMPOSERVANTREAL
    sSQL := sSQL + ' 0 ,';    // TEMPOSITESPECIAL
    sSQL := sSQL + ' NULL ,'; // VALORBASE1
    sSQL := sSQL + ' NULL ,'; // VALORBASE2
    sSQL := sSQL + ' NULL ,'; // VALORBASE3

    sSQL := sSQL + ' NULL ,'; // IDPESSJURORGAO
    sSQL := sSQL + ' NULL ,'; // SIGLA
    sSQL := sSQL + ' 0,';     // FLGDIRETOR
    sSQL := sSQL + ' NULL  '; // CODVINCULAFUNC

    sSQL := sSQL + ' ) ';

    Close;
    SQL.Clear;
    SQL.Add(sSQL);

    try
      ExecSQL;
    except
      qryElegivel.Free;
      exit;
    end;
  end;
  qryElegivel.Free;
  Result := true;
end;

function AlteraFuncionarioElegivel(IdFundacao, IdPessoa: LongInt): boolean;
var
  sSQL: string;
  qryAux, qryElegivel, qryFuncionario: TwwQuery;
  iIdCargo: LongInt;
begin
  Result := false;
  sSQL := '';

  qryAux := TwwQuery.Create(Application);
  qryAux.DatabaseName := 'BaseDados';

  qryElegivel := TwwQuery.Create(Application);
  qryElegivel.DatabaseName := 'BaseDados';

  qryFuncionario := TwwQuery.Create(Application);
  qryFuncionario.DatabaseName := 'BaseDados';

  with (qryFuncionario) do
  begin
    // Buscar dados da pessoa na tabela de funcionario
    Close;
    SQL.Clear;
    SQL.Add(
      'SELECT F.IDPESSOA,       F.IDSITFUNC,    F.IDEMPRESA AS IDEMPRESAPROP, F.CODCENTROCUSTO, F.MATRICULA,  '+
      '        F.DATAADMISSAO,   F.DATADESLIGAMENTO AS DATADEMISSAO, F.SALARIOATUAL AS SALTOTAL,               '+
      '        F.DATARETORNO AS  DATAREADMISSAO,                                                               '+
      '        F.IDESTAB,        F.IDCARGO,      F.IDFUNCAO,           F.IDFAIXACARGO,   F.IDFAIXAFUNCAO,      '+
      '        F.NIVELINDIV1,    F.NIVELINDIV2,  F.IDAGENCIASALARIO,   F.NUMCONTASALARIO,                      '+
      '        C.IDCARGO AS CODCARGO                                                                           '+
      ' FROM   CARGO@CM C, FUNCIONARIO@CM  F                                                                         '+
      ' WHERE  F.IDPESSOA = '+IntToStr(IdPessoa)+
      ' AND    F.IDCARGO  = C.IDCARGO(+) ');
    Open;
  end;

  with (qryElegivel) do
  begin
    // Buscar dados da pessoa na tabela de elegpatro
    Close;
    SQL.Clear;
    SQL.Add(
      'SELECT EL.IDPESSOA,EL.IDSITFUNC, EL.IDEMPRESAPROP, EL.CODCENTROCUSTO, EL.MATRICULA,'+
      '        EL.DATAADMISSAO, EL.DATADEMISSAO, EL.SALTOTAL,'+
      '        EL.DATAREADMISSAO, '+
      '        EL.IDESTAB, EL.IDCARGOEXT, EL.IDFUNCAOEXT, C.IDAGENCIA, C.CONTACORRENTE,'+
      '        CEXT.CODIGO AS CODCARGO'+
      ' FROM   CONTABANCARIA C, CARGOEXT CEXT, ELEGPATRO EL'+
      ' WHERE  EL.IDPESSJUR = '+IntToStr(IdFundacao)+
      ' AND    EL.IDPESSOA  = '+IntToStr(IdPessoa)+
      ' AND    EL.IDPESSOA  = C.IDPESSOA(+)'+
      ' AND    EL.IDCARGOEXT = CEXT.IDCARGOEXT');
    Open;
  end;

  if (qryElegivel.FieldByName('IDSITFUNC').asString <>
      qryFuncionario.FieldByName('IDSITFUNC').asString) then
  begin
    sSQL := sSQL + ', IDSITFUNC = '+qryFuncionario.FieldByName('IDSITFUNC').asString;
  end;

  if (qryElegivel.FieldByName('CODCENTROCUSTO').asString <>
      qryFuncionario.FieldByName('CODCENTROCUSTO').asString) then
  begin
    sSQL := sSQL + ', IDEMPRESAPROP  = '+qryFuncionario.FieldByName('IDEMPRESAPROP').asString+
                   ', CODCENTROCUSTO = '''+qryFuncionario.FieldByName('CODCENTROCUSTO').asString+'''';
  end;

  if (qryElegivel.FieldByName('MATRICULA').asString <>
      qryFuncionario.FieldByName('MATRICULA').asString) then
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT FLGATUMATRICULA FROM PARAMAPREV');
    qryAux.Open;

    if not(qryAux.IsEmpty) and (qryAux.FieldByName('FLGATUMATRICULA').asInteger = 1) then
    begin
      sSQL := sSQL + ', MATRICULA     = '''+qryFuncionario.FieldByName('MATRICULA').asString+'''';
    end;
  end;

  if (qryElegivel.FieldByName('DATAADMISSAO').asString <>
      qryFuncionario.FieldByName('DATAADMISSAO').asString) then
  begin
    if (qryFuncionario.FieldByName('DATAADMISSAO').asString <> '') then
      sSQL := sSQL + ', DATAADMISSAO = TO_DATE('''+qryFuncionario.FieldByName('DATAADMISSAO').asString+''', ''DD/MM/YYYY'')'
    else
      sSQL := sSQL + ', DATAADMISSAO = NULL ';
  end;

  if (qryElegivel.FieldByName('DATADEMISSAO').asString <>
      qryFuncionario.FieldByName('DATADEMISSAO').asString) then
  begin
    if (qryFuncionario.FieldByName('DATADEMISSAO').asString <> '') then
      sSQL := sSQL + ', DATADEMISSAO = TO_DATE('''+qryFuncionario.FieldByName('DATADEMISSAO').asString+''', ''DD/MM/YYYY'')'
    else
      sSQL := sSQL + ', DATADEMISSAO = NULL ';
  end;

  if (qryElegivel.FieldByName('SALTOTAL').asString <>
      qryFuncionario.FieldByName('SALTOTAL').asString) then
  begin
    sSQL := sSQL + ', SALTOTAL = '+OraNumero(qryFuncionario.FieldByName('SALTOTAL').asString);
  end;

  if (qryElegivel.FieldByName('DATAREADMISSAO').asString <>
      qryFuncionario.FieldByName('DATAREADMISSAO').asString) then
  begin
    if (qryFuncionario.FieldByName('DATAREADMISSAO').asString <> '') then
      sSQL := sSQL + ', DATAREADMISSAO = TO_DATE('''+qryFuncionario.FieldByName('DATAREADMISSAO').asString+''', ''DD/MM/YYYY'')'
    else
      sSQL := sSQL + ', DATAREADMISSAO = NULL ';
  end;

  if (qryElegivel.FieldByName('IDESTAB').asString <>
      qryFuncionario.FieldByName('IDESTAB').asString) then
  begin
    sSQL := sSQL + ', IDESTAB = '+qryFuncionario.FieldByName('IDESTAB').asString;
  end;

  if (qryElegivel.FieldByName('CODCARGO').asString <>
      qryFuncionario.FieldByName('CODCARGO').asString) then
  begin
    iIdCargo := qryFuncionario.FieldByName('IDCARGO').asInteger;

    if not(ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa,
           qryElegivel.FieldByName('IDCARGOEXT').asInteger, 'C', iIdCargo)) then
    begin
      qryElegivel.Free;
      exit;
    end;
    sSQL := sSQL + ', IDCARGOEXT = '+IntToStr(iIdCargo);
  end;

  if (Trim(sSQL) <> '') then
  begin
    sSQL := Copy(sSQL, 2, Length(sSQL)-1);
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(
      'UPDATE ELEGPATRO SET ' +sSQL+ #13+
      'WHERE  (IDPESSJUR = ' +IntToStr(IdFundacao)+ ') AND' +#13+
      '       (IDPESSOA  = ' +IntToStr(IdPessoa)+ ')');
    try
      qryAux.ExecSQL;
    except
      qryFuncionario.Free;
      qryElegivel.Free;
      qryAux.Free;
      exit;
    end;
  end;
  qryFuncionario.Free;
  qryElegivel.Free;
  qryAux.Free;

  Result := true;
end;



end.