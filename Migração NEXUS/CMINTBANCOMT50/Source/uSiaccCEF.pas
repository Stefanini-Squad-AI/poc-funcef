// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
//******************************************************************************

//******************************************************************************
//Pendência   :  SIG 114623
//Responsável :  Ewerton Beltramini
//Data        :  29/01/2021
//Descrição   :  Implementação do comando Copy, para igualar as bases de produção.
//******************************************************************************
//N. SIG..........   : 63651
//Data da Alteração: : 12/11/2019
//Alteração Form:    : uSiaccCEF
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Criação da classe SiaccCEF, para tratamento de arquivos bancários.
//******************************************************************************
unit uSiaccCEF;

interface
uses classes, SysUtils, Controls, DDadosBancariosMT, dialogs, Db, DBTables, Wwquery, Windows;

type
  TSiaccCEF = class
  private
    //Arquivo a ser gerado
    ArquivoRemessa: TextFile;
    //Total de Registros do arquivo
    iTotRegArq: Integer;
    //String para informação da ação a ser executada
    sPasso: String;
    //Valor total dos registros no arquivo
    rTotalValorPago: Real;
    //Calcula o DV das Agências e da Conta Corrente para o PAGFOR do Bradesco

    // numEmpresaBanco
    sNumEmpresaBanco : string;
    FiCodOcorrencia: integer;

    //convênio SIACC
    procedure HeaderSiaccCEF;
    Procedure DetalheSiaccCEF(pNumReg: integer);
    Procedure TraillerSiaccCEF;
    procedure SetiCodOcorrencia(const Value: integer);
  public
    iSeqArquivo     : LongInt;   // numero sequencial do arquivo
    sRecPag         : String;
    bMostraMensagem : Boolean;

    constructor Create;
    Procedure MontaSiaccCEF;
    function  GetNomeArq : String;
    property iCodOcorrencia : integer read FiCodOcorrencia write SetiCodOcorrencia;
end;

var SiaccCEF: TSiaccCEF;

implementation

uses uSistema, uContaBancariaMT, uIntBancoManager, uString, uCmDialogs, uCMClientDataSet,faguarde,Forms;

{ TSiaccCEF }

constructor TSiaccCEF.Create;
begin
  inherited Create; 
end;

procedure TSiaccCEF.DetalheSiaccCEF(pNumReg: integer);
var
  sData, sCodMov, sConta, sAgencia, sCodDoc, sNoDoc, sSQL : String;
begin
  sConta := '';
  sAgencia := '';
  sCodDoc := '';

  Inc(iTotRegArq);
  rTotalValorPago := rTotalValorPago + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;
  sData := FormatDateTime('YYYYMMDD', IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsDateTime);

  try
    sSQL := ' SELECT DISTINCT C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA, C.IDCBANCARIA, '  +#13#10 +
            '        B.MASCARACC, B.MASCARAAGENCIA  '  +#13#10 +
            '   FROM PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B '  +#13#10 +
            ' WHERE (D.IDFORCLI = ' + IntBancoManager.CdsTexto.FieldByName('IDFORCLI').AsString +') AND '  +#13#10 +
            '       (C.IDPESSOA = D.IDFORCLI)  AND       ' +#13#10 +
            '       (C.IDAGENCIA = A.IDPESSOA) AND       ' +#13#10 +
            '       (A.IDBANCO   = B.IDPESSOA) AND       ' +#13#10 +
            '       (A.IDPESSOA = PA.IDPESSOA) AND       ' +#13#10 +
            '       (B.IDPESSOA = PB.IDPESSOA) AND       ' +#13#10 +
            '       (NVL(D.CODGRUPOCNAB, D.CODDOCUMENTO) = ' + IntBancoManager.CdsTexto.FieldByName('CODDOCUMENTO').AsString + ') AND ' +#13#10 +
            '       ((C.IDCBANCARIA = D.IDCBANCARIA) OR ((D.IDCBANCARIA IS NULL)  AND (C.FLGCONTAPREF = 1))) ';

    IntBancoManager.DtmDadosBancarios.SqlBuscaCC.SQL.Text := sSQL;
    IntBancoManager.DtmDadosBancarios.SqlBuscaCC.Open;
  except
    raise;
  end;

  sCodMov := '0';
  sAgencia := ZD(IntBancoManager.DtmDadosBancarios.cdsBuscaCC.FieldByName('NUMAGENCIA').asString, 4);
  sConta   := ZD(IntBancoManager.DtmDadosBancarios.cdsBuscaCC.FieldByName('CONTACORRENTE').asString, 14);

  try
    sSQL := 'SELECT D.CODDOCUMENTO,  D.NODOCUMENTO ' +#13#10+
            ' FROM DOCUMENTO D ' +#13#10+
            ' WHERE (D.IDFORCLI = ' + IntBancoManager.CdsTexto.FieldByName('IDFORCLI').AsString +') AND ' +#13#10+
            '       (D.CODGRUPOCNAB = ' + IntBancoManager.CdsTexto.FieldByName('CODDOCUMENTO').AsString +')';

    IntBancoManager.DtmDadosBancarios.SqlBuscaCC.SQL.Text := sSQL;
    IntBancoManager.DtmDadosBancarios.SqlBuscaCC.Open;

    if Trim(IntBancoManager.DtmDadosBancarios.cdsBuscaCC.FieldByName('CODDOCUMENTO').asString) <> '' then
      sCodDoc := IntBancoManager.DtmDadosBancarios.cdsBuscaCC.FieldByName('CODDOCUMENTO').asString
    else
      sCodDoc := IntBancoManager.CdsTexto.FieldByName('CODDOCUMENTO').asString;

    if Trim(IntBancoManager.DtmDadosBancarios.cdsBuscaCC.FieldByName('NODOCUMENTO').asString) <> '' then
      sNoDoc := IntBancoManager.DtmDadosBancarios.cdsBuscaCC.FieldByName('NODOCUMENTO').asString
    else
      sNoDoc := IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').asString;
  except
    Raise;
  end;

  if FiCodOcorrencia >= 0 then
    sCodMov := IntToStr(FiCodOcorrencia);

  if (IntBancoManager.Impersonate) then
  begin
    Writeln(ArquivoRemessa,
            Concat('E', // E.01 - Código do Registro
                   AE(sCodDoc,25), //E.02 - Identificação do Cliente na empresa
                   sAgencia,  // E.03 - Agência para Débito/Crédito
                   sConta, // E.04 - Identificação do cliente no banco
                   sData, //E.05 - Data do vencimento
                   ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),15), //E.06 - Valor Crédito/Débito
                   '03', // E.07 - Código da moeda
                   AE(IntBancoManager.CdsTexto.FieldByName('NOME').asstring,60), //E.08 - Uso da Empresa
                   ZD(IntToStr(pNumReg), 6), //E.09 - Número do Agendamento do Cliente
                   Spc(8), //E.10 - Filler
                   ZD(IntToStr(pNumReg), 6), //E.11 - Número do Sequencial do Registro
                   sCodMov)); //E.12 - Código do Movimento; 0 = Débito/Crédito Normal; 1 = Cancelamento; 5 = Cadastro de OPTANTES
    RevertToSelf;
  end;           
end;

function TSiaccCEF.GetNomeArq: String;
var
  qryNroSeq : TwwQuery;
  sSQL: string;
begin
  sNumEmpresaBanco := '';
  qryNroSeq := TwwQuery.Create(Nil);   
  try
    sSQL := 'SELECT CODPORTFORMA ' + #13#10 +
            '  FROM PORTADORFORMA ' + #13#10 +
            ' WHERE CODPORTFORMA = ' + IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').AsString + ' FOR UPDATE ';

    IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
    IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.SQL.Text := sSQL;
    IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Open;


    sSQL := 'SELECT P.NUMEMPRESABANCO ' +#10#13+
            '  FROM PORTADORFORMA P, SEQREMESSA S' +#10#13+
            ' WHERE CODPORTFORMA = '+ IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').AsString +#10#13+
            '   AND IDPESSOA = ' + inttostr(Sistema.IdEmpresa) +#10#13+
            '   AND P.NUMEMPRESABANCO = S.NUMEMPRESABANCO ';

    IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
    IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.SQL.Text := sSQL;
    IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Open;

    sNumEmpresaBanco := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.FieldByName('NUMEMPRESABANCO').asString;

    qryNroSeq.DataBaseName := 'BaseDados';
    qryNroSeq.Sql.Text := 'SELECT SEQREMESSA' + sNumEmpresaBanco + '.NEXTVAL AS CONTROLEREMESSA FROM DUAL';
                                                                                                           
    try
      qryNroSeq.Open;
      iSeqArquivo := qryNroSeq.FieldByName('CONTROLEREMESSA').asInteger;
      qryNroSeq.Close;
    except
      raise Exception.Create(IntBancoManager.MessageInfo);
    end;
  finally
    FreeAndNil(qryNroSeq);
  end;

  Result := 'ACC.' + FormatDateTime('DDMMYYYY', Date) + '.' + sNumEmpresaBanco + '.' + ZD(IntToStr(iSeqArquivo),6) + '.rem';
end;

procedure TSiaccCEF.HeaderSiaccCEF;
var
  sData, sDescr, sAmbFUNCEF, sAmbCAIXA: string;

begin
  sData := FormatDateTime('YYYYMMDD', Date);

  if SiaccCEF.sRecPag = 'R' then
    sDescr:='DEB AUTOMAT      '
  else
    sDescr:='CRED AUTOMAT     ';

  if copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
  begin
    sAmbCAIXA := 'P';
    sAmbFUNCEF := 'P';
  end
  else
  begin
    sAmbCAIXA := 'T';
    sAmbFUNCEF := 'T';
  end;


  if (IntBancoManager.Impersonate) then
  begin
    Writeln(ArquivoRemessa,
            Concat('A', // A.01 - Código do Registro
                   '1', // A.02 - Código de Remessa: 1 = Remessa - Enviado pela Empresa para o Banco
                   sNumEmpresaBanco + '11' + ZD(IntBancoManager.CodArquivoRemessa,4) + Spc(8), // A.03 - Código do Convênio
                   AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,20), // A.04 - Nome da Empresa
                  '104', // A.05 - Código do Banco
                   AE('CAIXA',20), //A.06 - Nome do Banco
                   sData, // A.07 - Data de Geração
                   ZD(IntToStr(iSeqArquivo),6),  // A.08 - Número Sequencial do Arquivo (NSA)
                   '05', //A.09 - Versão do Layout
                   sDescr, //A.10 - Identificação do Serviço
                   copy(IntBancoManager.CdsTexto.FieldByName('AGENCIACONVENIO').asString, 1, 4) +
                   ZE(copy(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').asString, 1, 3),4)+
                   ZE(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').asString, 9), //A.11 - Conta Compromisso = Conta Funcef
                   sAmbFUNCEF, //A.12 - Identificação do Ambinte Cliente = Ambiente FUNCEF: T = Teste; P = Produção
                   sAmbCAIXA, //A.13 - Identificação do Ambinte CAIXA  = Ambiente CAIXA: T = Teste; P = Produção
                   Spc(26), //A.14 - FILLER
                   '000000', //A.15 - Número Sequencial do Registro - deverá constar 000000
                   Spc(1))); //A.16 - FILLER
    RevertToSelf;
  end;

end;

procedure TSiaccCEF.MontaSiaccCEF;
var
  iNumReg: integer;
begin
  try
    try
      iNumReg:= 0;
      iTotRegArq  := 0;
      rTotalValorPago := 0;
      frmAguarde.Max := IntBancoManager.CdsTexto.RecordCount;
      frmAguarde.Pos := 0;

      sPasso := 'Criar Arquivo Para Gravar Os Dados';

      if not IntBancoManager.ExecSQL('UPDATE SEQREMESSA SET CONTROLEREMESSA = '+ intToStr(iSeqArquivo)+#13+#10+
                                     ' WHERE NUMEMPRESABANCO = '+ quotedStr(sNumEmpresaBanco)+#13+#10+
                                     '   AND CONTROLEREMESSA <= ' + intToStr(iSeqArquivo)) then
      raise Exception.Create(IntBancoManager.MessageInfo);

      if (IntBancoManager.Impersonate) then
      begin
        AssignFile(ArquivoRemessa, IntBancoManager.sNomeArquivo);
        ReWrite(ArquivoRemessa);
        RevertToSelf;
      end;

      sPasso := 'Montar Header do Arquivo';

      HeaderSiaccCef;
      sPasso := 'Montar Detalhe do Arquivo';
      IntBancoManager.CdsTexto.First;

      while not IntBancoManager.CdsTexto.Eof do
      begin
        Application.ProcessMessages;
        frmAguarde.Mostra('Gerando '+IntToStr(frmAguarde.Pos)+' de '+IntToStr(frmAguarde.Max)+ ' documentos para impressao... ');

        Inc(iNumReg);
        DetalheSiaccCEF(iNumReg);
        IntBancoManager.CdsTexto.Next;
        frmAguarde.Pos := frmAguarde.Pos + 1;
      end;
      frmaguarde.Apaga;

      TraillerSiaccCEF;

      if (IntBancoManager.Impersonate) then
      begin
        CloseFile(ArquivoRemessa);

        sPasso := 'Preparar Visualização do Arquivo';
        IntBancoManager.CodArquivoRemessa := IntToStr(iSeqArquivo);

        if bMostraMensagem then
          IntBancoManager.MostraArquivo;
        RevertToSelf;
      end;

      IntBancoManager.bArquivoCriado:= True;
    finally
      if iSeqArquivo = 999999 then
        iSeqArquivo := 0;

    end;
  except
    IntBancoManager.bArquivoCriado:= False;
    MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
    if (IntBancoManager.Impersonate) then
    begin
      CloseFile(ArquivoRemessa);
      RevertToSelf;
    end;

    Raise;
  end;
end;

procedure TSiaccCEF.SetiCodOcorrencia(const Value: integer);
begin
  FiCodOcorrencia := Value;
end;

procedure TSiaccCEF.TraillerSiaccCEF;
begin
  iTotRegArq := iTotRegArq + 2;

  if (IntBancoManager.Impersonate) then
  begin
    WriteLn(ArquivoRemessa,
            Concat('Z', // Z.01 - Código do registro
                   ZD(IntToStr(iTotRegArq),6), //Z.02 -  Total de Registros no Arquivo
                   ZD(RemoveVirgulas(rTotalValorPago,2),17), //Z.03 - Somatório dos valores pagos
                   Spc(119), //Z.04 - Reservado para o futuro
                   ZD(IntToStr(iTotRegArq - 1),6), //Z.05 - Número Sequencial do Registro
                   Spc(1))); //Z.06 - Reservado para o futuro
    RevertToSelf;
  end;
end;

end.
