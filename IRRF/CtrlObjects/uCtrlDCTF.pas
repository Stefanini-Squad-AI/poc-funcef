{ --------------------------------------------------------------------------------------------------
Rotina......: EscreveDebito
Nº SOL......: 179258
Nº KINTANA..: 1649137
Data........: 30/04/2012
Responsável.: Otacilio Aquino
Descrição...: Implementação na condição o codigo 7431
---------------------------------------------------------------------------------------------------}
unit uCtrlDCTF;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, Classes,
     uFuncoesUteisIR;
  Type
    TCtrlDCTF = Class(TCmControlObject)

    private
      Arquivo : TextFile;
      Cds : TclientDataSet;
      cdsProcura : TclientDataSet;
      cdsRepresentante : TclientDataSet;
      cdsPrincipal : TclientDataSet;
      cdsBusca : TclientDataSet;
      cdsAux : TclientDataSet;
      TotalReg : LongInt;                                                           
      cdsResponsavel : TclientDataSet;
    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      {gera o txt da DCTF}
      function GeraTXT(Caminho : string; IdPessoa, IdDocumento, IdResponsavel, IdReprsentante : LongInt;
                       DataIni, DataFim, CRCContador : string; AnoCalendario, TipoDeclaracao, DataIniHeader, DataFimHeader, DataOcorrencia, NaturezaJuridica, CNAE : string;
                       Situacao, Trimestre,  rgRetifica, Qualificacao, Lucro, ProdTerceiro, Cred, Apuracao, cbReducao : integer; PeriodoInicial, PeriodoFinal : string; idEndereco : integer) : Boolean;
      {inicia o txt}
      procedure IniciaTXT(Var Arquivo : textFile; Caminho : string);
      //Monta as consultas necessárias
      procedure MontaSelect(TipoRegistro : Byte; IdPessoa, IdDocumento, IdResponsavel, IdReprsentante : LongInt;
                            PeriodoInicial, PeriodoFinal : string); //monta o select para o tipo de registro solicitado
      //escreve o header da declaracao
      procedure HeaderDeclaracao(cds : TclientDataSet; AnoCalendario, TipoDeclaracao, DataIniHeader, DataFimHeader, DataOcorrencia : string;
                                 Situacao, Trimestre : integer);

      procedure EscreveDadosCadastrais(cds : TClientDataSet; Trimestre, Situacao, rgRetifica, Qualificacao, Lucro, ProdTerceiro, Cred, Apuracao : integer; DataOcorrencia, NaturezaJuridica, CNAE,
                                       DataIni, DataFim, AnoCalendario : string; idEndereco : integer);

      procedure EscreveRepresentanteResponsavel(cds : TclientDataSet; AnoCalendario, DataOcorrencia, CRCContador, NaturezaJuridica, DataIni, DataFim : string; Trimestre,  Situacao : integer);

      procedure EscreveRepresentante(cds : TclientDataSet; AnoCalendario, DataOcorrencia, CRCContador, NaturezaJuridica, DataIni, DataFim : string; Trimestre, Situacao : integer);
       //Ficha Quota - Tipo R10
      procedure EscreveDebito(cdsPrincipal, cdsBusca : TClientDataSet; AnoCalendario, DataOcorrencia, DataIni, DataFim : string; Trimestre,  Situacao, cbReducao, IdPessoa : integer);

      procedure TraillerDeclaracao(cds : TClientDataSet; AnoCalendario, DataOcorrencia : string;  Situacao, Trimestre : integer);
      function  VerPerApuracao(dData : TDatetime; CodNatureza : string) : string;
      procedure Gera04(Idpessoa,  Situacao, Trimestre : integer; PeriodoInicial, PeriodoFinal, AnoCalendario, DataOcorrencia, DiaDaApuracao, sMes : string);
      procedure Gera05(IdPessoa : integer; DataInicioApuracao, DataFinalApuracao, AnoCalendario,  DataOcorrencia, DataIni,DataFim : string; Trimestre,  Situacao : integer);
      //Pagamento da Quota - Tipo R11
      procedure EscrevePagamentoDebito(cds : TclientDataSet; AnoCalendario, DataOcorrencia, DiaDaApuracao, DataFinalApuracao, sMes : string;  Situacao, Trimestre : integer);
      procedure EscreveCompensacaoDebitoDarf(cds : TClientDataSet; AnoCalendario,  DataFinalApuracao, DataOcorrencia, DataIni,DataFim : string; Trimestre,  Situacao, IdPessoa: integer);

      procedure EscreveQuota(cds : TclientDataSet; AnoCalendario, DataOcorrencia  : string; Trimestre, Situacao : integer);

      procedure EscrevePagamentoQuota(cds : TclientDataSet; AnoCalendario, DataOcorrencia : string; Trimestre,  Situacao : integer);
      //Compensação da Quota com Darf - Tipo R12
      procedure EscreveCompensacaoQuotaDArf(cds : TclientDataSet; AnoCalendario, DataOcorrencia : string; Trimestre,  Situacao: integer);

    protected

    End;

implementation

Var
  DataInicioApuracao,
  DataFinalApuracao : string;
  

  { TCtrlDCTF }

constructor TCtrlDCTF.Create;
begin
  inherited;
  Cds               := TClientDataSet.Create(nil);
  cdsProcura        := TClientDataSet.Create(nil);
  cdsRepresentante  := TClientDataSet.create(nil);
  cdsPrincipal      := TclientDataSet.Create(nil);
  cdsBusca          := TClientDataSet.create(nil);
  cdsAux            := TclientdataSet.create(nil);
  cdsResponsavel    := TClientDataSet.create(nil);
end;

destructor TCtrlDCTF.Destroy;
begin
  inherited;
  Cds.free;
  cdsProcura.free;
  cdsRepresentante.free;
  cdsPrincipal.free;
  cdsBusca.free;
  cdsAux.free;
  cdsResponsavel.free;
end;

procedure TCtrlDCTF.DoChangeDataBase;
begin
  inherited;

end;

procedure TCtrlDCTF.EscreveCompensacaoDebitoDarf(cds: TClientDataSet; AnoCalendario, DataFinalApuracao, DataOcorrencia, DataIni,DataFim : string; Trimestre,  Situacao, IdPessoa : integer);
Var
  CNPJ, Processo, codnat : string;
  tamanho, posicao : integer;
begin
  ////////////////////////////////////////////////////////////////
  //                                                            //
  //        Compensação do Débito com DARF - Tipo R14           //
  //                                                            //
  ///////////////////////////////////////////////////////////////
  with cds do
    Begin
      cdsProcura.first;
      while not cdsProcura.eof do
        Begin
          Tamanho := Length(trim(cdsProcura.fieldByname('Numdocumento').asstring));
          posicao := tamanho - 5;

          if cdsProcura.fieldByname('GRUPOTRIBUTO').asstring = '02' then //se o tributo for IPI pegar as últimas 6 posições do CNPJ do estabelecimento
             CNPJ := copy(trim(cdsProcura.fieldByname('Numdocumento').asstring), posicao, tamanho)
          else
             CNPJ := '000000';

          if cdsProcura.fieldByname('TipoProcesso').asstring = '' then
             Begin
               cdsProcura.edit;
               cdsProcura.fieldByname('TipoProcesso').Asinteger := 0;
               cdsProcura.Post;
             end;

          case cdsProcura.fieldByname('TipoProcesso').AsInteger of
            0 : // Preencher com espaços
               Processo := strEspaco(24, '');
            1 : // Administrativo
               Processo := strEspaco(24, strEspaco(24, copy(cdsProcura.fieldByname('PROCESSO').asstring, 1, 24))); 
            2 : // Judicial
               Processo := strEspaco(24, copy(cdsProcura.fieldByname('PROCESSO').asstring, 1, 24));
          else // Sem processo, preencher com zeros
               Processo := strEspaco(24, '');
          end;
          writeln(Arquivo, 'R14' + // 1- Tipo do Registro
                           strZero(14, copy(fieldByname('Numdocumento').asstring, 1, 14)) + // 2- CNPJ
                           AnoCalendario + copy(DataINI, 4, 2)      + //3 MOFG
                           intTostr(Situacao) + // 5- Situação
                           DataOcorrencia +
                           strZero(2, cdsProcura.fieldByname('GRUPOTRIBUTO').asstring) + //7- Grupo de Tributo
                           '056102'+
                           cdsProcura.fieldByname('PERIODICIDADE').Asstring + //9- periodicidade
                           copy(DataFinalApuracao, 7, 4) + // 12- Ano do Período de Apuração
                           copy(DataFinalApuracao, 4, 2) + // 11- Mês do Período de Apuração
                           copy(DataFinalApuracao,2,1) + // 10- Dia do Período de apuração
                           strZero(6, '') + // 13- reservado
                           strZero(14, CNPJ) + // 14- CNPJ do estabelecimento
                           '0'+
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRIRRF').asstring)) + // 20- Valor Principal
                           '2' +
                           '1' +
                           '0' +
                           processo +
                           strEspaco(2, cdsProcura.fieldByname('VARA').asstring) + // 27- Vara
                           strEspaco(50, cdsProcura.fieldByname('NOME').asstring) + // 28- Município
                           strEspaco(2, copy(cdsProcura.fieldByname('UF').asstring, 1, 2)) + // 29- UF

                           strZero(8, copy(DataFinalApuracao, 7, 4) + copy(DataFinalApuracao, 4, 2) + copy(DataFinalApuracao, 1, 2)) + // 15- Data de Apuração
                           strZero(14, copy(Trim(cdsProcura.fieldByname('NumDocumento').Asstring), 1, 14)) + // 16- CNPJ do DARF
                           strZero(4, cdsProcura.fieldByname('CodNatureza').asstring) + // 17- Código de receita do DARF
                           copy(DataFinalApuracao, 7, 4) + copy(DataFinalApuracao, 4, 2) + copy(DataFinalApuracao, 1, 2) + // 18- Data de Vencimento
                           strZero(8, copy(cdsProcura.fieldByname('REFERENCIA').asstring, 1, 8)) +  // 19- Número de Referência

                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRMULTA').asstring)) + // 21- Valor da Multa
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRJUROS').asstring)) + // 22- Valor dos Juros
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRTOTAL').asstring)) + // 23- Valor Pago do Débito
                           strZero(1, cdsProcura.fieldByname('TIPOPROCESSO').asstring) +  // 24- Tipo de Processo 
                           Processo + // 25- Número do Processo
                           strZero(1, cdsProcura.fieldByname('MEDIDAJUDICIAL').asstring) +  // 26- Medida Judicial intTostr(cbJudicial.ItemIndex) +


                           strEspaco(10, '')); // 30- Reservado
          //o delimitador #13#10 já está embutido no writeln

          TotalReg := TotalReg + 1;
          cdsprocura.next;
        end;
    end;
end;

procedure TCtrlDCTF.EscreveCompensacaoQuotaDArf(cds: TclientDataSet;
                                                AnoCalendario, DataOcorrencia : string; Trimestre, 
                                                Situacao: integer);
begin
  ////////////////////////////////////////////////////////////////
  //                                                            //
  //                    Débito - Tipo R12                       //
  //                                                            //
  ///////////////////////////////////////////////////////////////

  with cdsProcura do
    Begin
           writeln(Arquivo, 'R12' + // 1- tipo do registro
                           strZero(14, copy(cds.fieldByname('Numdocumento').asstring, 1, 14)) + // 2- CNPJ
                           intTostr(Situacao) + // 5- Situação
                           DataOcorrencia + // 6- Data de Ocorrência do Evento
                           strZero(2, fieldByname('GRUPOTRIBUTO').asstring) + //7- Grupo de Tributo
                           Completadireita(5, copy(fieldByname('CODNATUREZA').asstring, 1, 5), '1') + // 8- Código de Receita
                           '1' + // 9- Número da Quota
                           intTostr(Trimestre + 1) + // 10- Trimestre do Fato Gerador
                           AnoCalendario + // 11- Ano do Fato Gerador
                           strZero(8, '') + // 12- Reservado
                           copy(fieldByname('DATAFINALAPURACAO').Asstring, 5, 4) + copy(fieldByname('DATAFINALAPURACAO').Asstring, 3, 2) + copy(fieldByname('DATAFINALAPURACAO').Asstring, 1, 2) +// 13- Período de Apuração
                           strZero(14, copy(cds.fieldByname('Numdocumento').asstring, 1, 14)) + // 14- CNPJ do DARF
                           strZero(4, copy(fieldByname('CODNATUREZA').asstring, 1, 4)) + // 15- Código de natureza do Darf
                           strZero(8, fieldByname('DATAVENCDARF').Asstring) + // 16- Data de vencimento
                           strEspaco(8, fieldByname('REFERENCIA').Asstring) + // 17- Referência
                           strZero(14, FormataVAlor(2, (FloatTostr(cdsProcura.fieldByname('VLRIRRF').asFloat)))) + // 18- Valor Principal
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRMULTA').asstring)) + // 19- Valor da Multa
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRJUROS').asstring)) + // 20- Valor dos Juros
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRIRRF').asstring)) + // 21- Valor Compensado da Quota
                           strZero(1, fieldByname('TIPOPROCESSO').Asstring) + //22- Tipo de Processo
                           strEspaco(17, fieldByname('PROCESSO').Asstring) + //23- Número do Processo
                           strZero(1, fieldByname('MEDIDAJUDICIAL').Asstring) + //24- Medida Judicial
                           strEspaco(2, fieldByname('VARA').Asstring) + //25- Vara
                           strEspaco(50, fieldByname('NOME').Asstring) + //26- Município
                           strEspaco(2, trim(fieldByname('CODESTADO').Asstring)) + //27- UF
                           strEspaco(10, '')); // 28- Reservado
          //o delimitador #13#10 já está embmutido no writeln
          TotalReg := TotalReg + 1;
    end;
end;

procedure TCtrlDCTF.EscreveDadosCadastrais(cds: TClientDataSet; Trimestre,  Situacao, rgRetifica, Qualificacao, Lucro, ProdTerceiro, Cred, Apuracao : integer; DataOcorrencia, NaturezaJuridica, CNAE,
                                           DataIni, DataFim, AnoCalendario : string; idEndereco : integer);
Begin
  ////////////////////////////////////////////////////////////////
  //                                                            //
  //       Dados cadastrais e dados Iniciais - Tipo R01         //
  //                                                            //
  ///////////////////////////////////////////////////////////////
  with cds do
    Begin
      writeln(Arquivo, 'R01' + // 1- Tipo do registro
                       strZero(14, copy(fieldByname('NumDocumento').Asstring, 1, 14)) + // 2- CNPJ ds Matriz
                       AnoCalendario + copy(DataINI, 3, 2)      + // 3- MOFG - Mês da Ocorrência do Fato Gerador
                       intTostr(Situacao) + // 4- Situação
                       copy(DataOcorrencia, 5, 4) + copy(DataOcorrencia, 3, 2) + copy(DataOcorrencia, 1, 2) +// 5- Data de Ocorrência do Evento
                       copy(DataIni, 1, 2) + copy(DataIni, 3, 2) + // 6- Início do Período
                       copy(DataFim, 1, 2) + copy(DataFim, 3, 2) + // 7 - Final do Período
                       intTostr(rgRetifica) + // 8- Declaração Retificadora
                       '000000000000'+ // 9 - nro do recibo de Entrega a ser retificada
                       intTostr(Lucro) + // 10- Forma de Tributaçào do Lucro
                       intTostr(Qualificacao + 1) + // 11- Qualificação da Pessoa Jurídica
                       '0' +//12 - Levantou balanço
                       '0' +// 13- PJ com Débitos de SCP a serem Declarados
                       '0' +//14- PJ inativa desde o início do ano
                       '0' +//15-
                       '0' +//16-
                       strEspaco(10, '')) ; // 17- Reservado

      //o delimitador #13#10 já está embutido no writeln
      TotalReg := TotalReg + 1;
    end;
end;

procedure TCtrlDCTF.EscreveDebito(cdsPrincipal, cdsBusca: TClientDataSet; AnoCalendario, DataOcorrencia, DataIni, DataFim : string; Trimestre,  Situacao, cbReducao, IdPessoa : integer);
Var
  CNPJ, DiaDaApuracao, sMes, compl , sdia: string;
  Tamanho,
  posicao : integer;
begin
  ////////////////////////////////////////////////////////////////
  //                                                            //
  //                    Débito - Tipo R03 =R10                      //
  //                                                            //
  ///////////////////////////////////////////////////////////////

  with cdsPrincipal do
    Begin
      while (not cdsBusca.eof) do
        Begin
          Tamanho := Length(trim(fieldByname('Numdocumento').asstring));
          posicao := tamanho - 5;

          if (cdsBusca.fieldByname('CODNATUREZA').asstring = '7893') then
              begin
            compl:='03' ;
            sdia := '02';
           end
          else  if

           (cdsBusca.fieldByname('CODNATUREZA').asstring = '5960') or
            (cdsBusca.fieldByname('CODNATUREZA').asstring = '5987') or
            (cdsBusca.fieldByname('CODNATUREZA').asstring = '5979') then
              compl:='04'
          else
              compl:='02';

          if (cdsBusca.fieldByname('PERIODICIDADE').Asstring = 'Q') then
             sdia :='02'
          else
             sdia :='00' ;

          if (cdsBusca.fieldByname('GRUPOTRIBUTO').asstring = '03') or
             (cdsBusca.fieldByname('GRUPOTRIBUTO').asstring = '09') then //se o tributo for IPI pegar as últimas 6 posições do CNPJ do estabelecimento
             CNPJ := copy(trim(fieldByname('Numdocumento').asstring), posicao, tamanho)
          else
             CNPJ := '000000';

          if (cdsBusca.fieldByname('PERIODICIDADE').Asstring = 'T') or
             (cdsBusca.fieldByname('PERIODICIDADE').Asstring = 'A') then
             sMes := '00'
          else
             sMes := copy(cdsBusca.fieldByname('DATAFINALAPURACAO').Asstring, 4, 2);

           IF
            (cdsBusca.fieldByname('CODNATUREZA').asstring = '7460') or
            (cdsBusca.fieldByname('CODNATUREZA').asstring = '7498') then
             compl:='00';
           IF  (cdsBusca.fieldByname('CODNATUREZA').asstring = '4574') or
            (cdsBusca.fieldByname('CODNATUREZA').asstring = '7987') THEN
            compl:='01' ;
           IF  (cdsBusca.fieldByname('CODNATUREZA').asstring = '7893') then
            begin
            compl:='03' ;
            sdia :='02';
           end;


          DiaDaApuracao := VerPerApuracao(cdsBusca.fieldByname('DATAFINALAPURACAO').AsDateTime, cdsBusca.fieldByname('CODNATUREZA').Asstring);
          // Otacilio Aquino SOL 179258 KTN 1649137
          IF((cdsBusca.fieldByname('CODNATUREZA').asstring <> '7416') or (cdsBusca.fieldByname('CODNATUREZA').asstring <> '7431' ))  THEN
           begin
          writeln(Arquivo, 'R10' + // 1- tipo do registro
                           strZero(14, copy(fieldByname('Numdocumento').asstring, 1, 14)) + // 2- CNPJ
                           AnoCalendario + copy(DataINI, 4, 2)      + //3 MOFG
                           intTostr(Situacao) + // 5- Situação
                           copy(DataOcorrencia, 5, 4) + copy(DataOcorrencia, 3, 2) + copy(DataOcorrencia, 1, 2) +// 6- Data de Ocorrência do Evento
                           strZero(2, cdsBusca.fieldByname('GRUPOTRIBUTO').asstring) + //7- Grupo de Tributo
                           cdsBusca.fieldByname('CODNATUREZA').asstring + // 8- Código de Receita
                           compl +
                           cdsBusca.fieldByname('PERIODICIDADE').Asstring + //9- Periodicidade
                           copy(cdsBusca.fieldByname('DATAFINALAPURACAO').Asstring, 7, 4) + // 12- Ano do Período de Apuração
                           smes + // 11- Mês do Período de Apuração
                           DiadaApuracao +
                           strZero(6, CNPJ) + // 14- CNPJ do estabelecimento
                           strZero(14,'') +
                           strZero(1, '') + // 13- reservado
                           strZero(14, FormataVAlor(2, cdsBusca.fieldByname('VLRTOTAL').Asstring)) + // 15- Valor  do Débito
                           intTostr(cbReducao) + // 16- Balanço de Redução
                           '0' + // 17- O saldo deste débito será dividido em duas ou três quotas
                           strZero(1, '') + // 13- reservado
                           strEspaco(10, '')); // 18- Reservado
          //o delimitador #13#10 já está embmutido no writeln
          TotalReg := TotalReg + 1;
          Gera04(IdPessoa,  Situacao, Trimestre, DataIni, DataFim, AnoCalendario,
                 DataOcorrencia, DiaDaApuracao, sMes);
                 cdsBusca.next;
          end;
          cdsBusca.next;
          end;
          cdsBusca.first;
          while (not cdsBusca.eof) do
          Begin
          // Otacilio Aquino SOL 179258 KTN 1649137
          IF((cdsBusca.fieldByname('CODNATUREZA').asstring = '7416') or (cdsBusca.fieldByname('CODNATUREZA').asstring = '7431' ))  THEN
           begin
          
           writeln(Arquivo, 'R10' + // 1- tipo do registro
                           strZero(14, copy(fieldByname('Numdocumento').asstring, 1, 14)) + // 2- CNPJ
                           AnoCalendario + copy(DataINI, 4, 2)      + //3 MOFG
                           intTostr(Situacao) + // 5- Situação
                           copy(DataOcorrencia, 5, 4) + copy(DataOcorrencia, 3, 2) + copy(DataOcorrencia, 1, 2) +// 6- Data de Ocorrência do Evento
                           strZero(2, cdsBusca.fieldByname('GRUPOTRIBUTO').asstring) + //7- Grupo de Tributo
                           '056102'+
                           compl +
                           cdsBusca.fieldByname('PERIODICIDADE').Asstring + //9- Periodicidade
                           copy(cdsBusca.fieldByname('DATAFINALAPURACAO').Asstring, 7, 4) + // 12- Ano do Período de Apuração
                           smes + // 11- Mês do Período de Apuração
                           DiadaApuracao +
                           strZero(6, CNPJ) + // 14- CNPJ do estabelecimento
                           strZero(14,'') +
                           strZero(1, '') + // 13- reservado
                           strZero(14, FormataVAlor(2, cdsBusca.fieldByname('VLRTOTAL').Asstring)) + // 15- Valor  do Débito
                           intTostr(cbReducao) + // 16- Balanço de Redução
                           '0' + // 17- O saldo deste débito será dividido em duas ou três quotas
                           strZero(1, '') + // 13- reservado
                           strEspaco(10, '')); // 18- Reservado
          //o delimitador #13#10 já está embmutido no writeln
          TotalReg := TotalReg + 1;
          Gera05(IdPessoa , DataInicioApuracao, DataFinalApuracao, AnoCalendario,  DataOcorrencia, DataIni, DataFim , Trimestre,  Situacao );
                 cdsBusca.next;
          end
          else
          cdsBusca.next;
          end;
          end;


end;

procedure TCtrlDCTF.EscrevePagamentoDebito(cds: TclientDataSet; AnoCalendario, DataOcorrencia, DiaDaApuracao, DataFinalApuracao, sMes : string;  Situacao, Trimestre : integer);
Var
  CNPJ,compl, sdia,treg,codnat: string;
  tamanho, posicao : integer;
begin
  ////////////////////////////////////////////////////////////////
  //                                                            //
  //             Pagamento do Débito - Tipo R04=>R11            //
  //                                                            //
  ///////////////////////////////////////////////////////////////
  with cds do
    Begin
      cdsProcura.first;
      while not cdsProcura.eof do
        Begin
          Tamanho := Length(trim(cdsProcura.fieldByname('Numdocumento').asstring));
          posicao := tamanho - 5;
          codnat  := cdsprocura.fieldByname('CODNATUREZA').asstring;
          if (cdsProcura.fieldByname('GRUPOTRIBUTO').asstring = '03') or
             (cdsProcura.fieldByname('GRUPOTRIBUTO').asstring = '09') then 
             CNPJ := copy(trim(cdsProcura.fieldByname('Numdocumento').asstring), posicao, tamanho)
          else
             CNPJ := '000000';
          //
          if (cdsProcura.fieldByname('CODNATUREZA').asstring = '7893') then
              begin
            compl:='03' ;
            sdia :='02';
           end
          else if

            (cdsProcura.fieldByname('CODNATUREZA').asstring = '5960') or
            (cdsProcura.fieldByname('CODNATUREZA').asstring = '5987') or
            (cdsProcura.fieldByname('CODNATUREZA').asstring = '5979') then
              compl:='04'
          else
              compl:='02';

           if (cdsBusca.fieldByname('PERIODICIDADE').Asstring = 'Q') then
             sdia :='02'
          else
             sdia :='00' ;
           IF   
            (cdsProcura.fieldByname('CODNATUREZA').asstring = '7460') or
            (cdsProcura.fieldByname('CODNATUREZA').asstring = '7498') then
             compl:='00' ;
           IF  (cdsProcura.fieldByname('CODNATUREZA').asstring = '4574') or
            (cdsProcura.fieldByname('CODNATUREZA').asstring = '7987') THEN
            compl:='01' ;
             IF   (cdsProcura.fieldByname('CODNATUREZA').asstring = '7893') THEN
            begin
            compl:='03' ;
            sdia:='02';
           end;
          writeln(Arquivo, 'R11' + //Tipo do registro
                           strZero(14, copy(fieldByname('Numdocumento').asstring, 1, 14)) + // 2- CNPJ
                           AnoCalendario + sMes      + //3 MOFG
                           intTostr(Situacao) + // 5- Situação
                           copy(DataOcorrencia, 5, 4) + copy(DataOcorrencia, 3, 2) + copy(DataOcorrencia, 1, 2) +// 6- Data de Ocorrência do Evento
                           strZero(2, cdsProcura.fieldByname('GRUPOTRIBUTO').asstring) + //7- Grupo de Tributo
                           codnat +
                           compl +
                           cdsProcura.fieldByname('PERIODICIDADE').Asstring + //9- Periodicidade
                           copy(DataFinalApuracao, 7, 4) + // 12- Ano do Período de Apuração
                           sMes +// 11- Mês do Período de Apuração
                           DiadaApuracao + 
                           strZero(6, CNPJ) + // 14- CNPJ do estabelecimento
                           strZero(14, CNPJ) + // 14- CNPJ do estabelecimento
                           '0'+
                           strZero(8, cdsProcura.fieldByname('DATAFINALAPURACAO').asstring) + // 15- Data de Apuração
                           strZero(14, copy(Trim(cds.fieldByname('NumDocumento').Asstring), 1, 14)) + // 16- CNPJ do DARF
                           strZero(4, cdsProcura.fieldByname('CodNatureza').asstring) + // 17- Código de receita do DARF
                           cdsProcura.fieldByname('DATAVENCDARF').Asstring + // 18- Data de Vencimento
                           strEspaco(17, copy(cdsProcura.fieldByname('REFERENCIA').asstring, 1, 17)) +  // 19- Número de Referência
                           strZero(14, FormataVAlor(2, (FloatTostr(cdsProcura.fieldByname('VLRIRRF').asFloat)))) + // 20- Valor Principal
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRMULTA').asstring)) + // 21- Valor da Multa
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRJUROS').asstring)) + // 22- Valor dos Juros
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRIRRF').asstring)) + // 23- Valor Pago do Débito
                           StrEspaco(10, ''));  // Reservado
                          
          //o delimitador #13#10 já está embutido no writeln
          cdsProcura.next;
          TotalReg := TotalReg + 1;

       end; 
    end;
end;

procedure TCtrlDCTF.EscrevePagamentoQuota(cds: TclientDataSet;
                                          AnoCalendario, DataOcorrencia : string; Trimestre, 
                                          Situacao: integer);
begin
  ////////////////////////////////////////////////////////////////
  //                                                            //
  //                    Débito - Tipo R11                       //
  //                                                            //
  ///////////////////////////////////////////////////////////////

  with cdsProcura do
    Begin
           writeln(Arquivo, 'R11' + // 1- tipo do registro
                           strZero(14, copy(cds.fieldByname('Numdocumento').asstring, 1, 14)) + // 2- CNPJ
                           AnoCalendario + intTostr(Trimestre + 1) + // 3- Trimestre de Ocorrência do Fato Gerador
                           intTostr(Situacao) + // 5- Situação
                           DataOcorrencia + // 6- Data de Ocorrência do Evento
                           strZero(2, fieldByname('GRUPOTRIBUTO').asstring) + //7- Grupo de Tributo
                           Completadireita(5, copy(fieldByname('CODNATUREZA').asstring, 1, 5), '1') + // 8- Código de Receita
                           '1' + // 9- Número da Quota
                           intTostr(Trimestre + 1) + // 10- Trimestre do Fato Gerador
                           AnoCalendario + // 11- Ano do Fato Gerador
                           strZero(8, '') + // 12- Reservado
                           copy(fieldByname('DATAFINALAPURACAO').Asstring, 5, 4) + copy(fieldByname('DATAFINALAPURACAO').Asstring, 3, 2) + copy(fieldByname('DATAFINALAPURACAO').Asstring, 1, 2) +// 13- Período de Apuração
                           strZero(14, copy(cds.fieldByname('Numdocumento').asstring, 1, 14)) + // 14- CNPJ do DARF
                           strZero(4, copy(fieldByname('CODNATUREZA').asstring, 1, 4)) + // 15- Código de natureza do Darf
                           strZero(8, fieldByname('DATAVENCDARF').Asstring) + // 16- Data de vencimento
                           strEspaco(8, fieldByname('REFERENCIA').Asstring) + // 17- Referência
                           strZero(14, FormataVAlor(2, (FloatTostr(cdsProcura.fieldByname('VLRIRRF').asFloat)))) + // 18- Valor Principal
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRMULTA').asstring)) + // 19- Valor da Multa
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRJUROS').asstring)) + // 20- Valor dos Juros
                           strZero(14, FormataVAlor(2, cdsProcura.fieldByname('VLRIRRF').asstring)) + // 21- Valor Pago do Débito
                           strEspaco(10, '')); // 22- Reservado
          //o delimitador #13#10 já está embmutido no writeln
          TotalReg := TotalReg + 1;
    end;
end;

procedure TCtrlDCTF.EscreveQuota(cds: TclientDataSet; AnoCalendario, DataOcorrencia : string; Trimestre,
                                  Situacao: integer);
var
DiadaApuracao,DataIni,DataFim : string;
IdPessoa : integer;                               
begin
  ////////////////////////////////////////////////////////////////
  //                                                            //
  //                    Débito - Tipo R10                       //
  //                                                            //
  ///////////////////////////////////////////////////////////////

  with cdsProcura do
    Begin
      while (not eof) do
        Begin
         // Otacilio Aquino SOL 179258 KTN 1649137
         IF  ((cdsBusca.fieldByname('CODNATUREZA').asstring = '7416') or (cdsBusca.fieldByname('CODNATUREZA').asstring = '7431' )) then
          begin
          writeln(Arquivo, 'R10' + // 1- tipo do registro
                           strZero(14, copy(cds.fieldByname('Numdocumento').asstring, 1, 14)) + // 2- CNPJ
                           AnoCalendario + intTostr(Trimestre + 1) + // 3- Trimestre de Ocorrência do Fato Gerador
                           intTostr(Situacao) + // 5- Situação
                           DataOcorrencia + // 6- Data de Ocorrência do Evento
                           strZero(2, fieldByname('GRUPOTRIBUTO').asstring) + //7- Grupo de Tributo
                           Completadireita(5, copy(fieldByname('CODNATUREZA').asstring, 1, 5), '1') + // 8- Código de Receita
                           '1' + // 9- Número da Quota
                           intTostr(Trimestre + 1) + // 10- Trimestre do Fato Gerador
                           AnoCalendario + // 11- Ano do Fato Gerador
                           strZero(8, '') + // 12- Reservado
                           strZero(14, FormataVAlor(2, fieldByname('VLRIRRF').Asstring)) + // 13- Valor  da quota
                           strEspaco(10, '')); // 14- Reservado
          //o delimitador #13#10 já está embmutido no writeln
          TotalReg := TotalReg + 1;
          end;
          next;
        end;
    end;
end;

procedure TCtrlDCTF.EscreveRepresentanteResponsavel(cds: TclientDataSet; AnoCalendario, DataOcorrencia, CRCContador, NaturezaJuridica, DataIni, DataFim : string; Trimestre,  Situacao : integer);
begin
  ////////////////////////////////////////////////////////////////
  //                                                            //
  //         Representante  e Responsável - Tipo R02            //
  //                                                            //
  ///////////////////////////////////////////////////////////////
  if Trim(CRCContador) = '' then
     Begin
       cdsResponsavel.edit;
       cdsResponsavel.fieldByname('CodEstado').asstring := '';
       cdsResponsavel.post;
     end;
  with cds do
    Begin
      writeln(Arquivo, 'R02' + // 1- Tipo do Registro
                       strZero(14, copy(fieldByname('Numdocumento').Asstring, 1, 14)) + // 2- CNPJ do Contribuinte
                       AnoCalendario + copy(DataINI, 3, 2)      + //3 MOFG
                       intTostr(Situacao) + // 5- Situação
                       copy(DataOcorrencia, 5, 4) + copy(DataOcorrencia, 3, 2) + copy(DataOcorrencia, 1, 2) +// 5- Data de Ocorrência do Evento
                       strEspaco(115, copy(fieldByname('RazaoSocial').Asstring, 1, 115)) + //  7- Nome empresarial
                       strZero(4, NaturezaJuridica) +    // 8- Código de Natureza Jurídica
                       strEspaco(40, copy(fieldByname('LOGRADOURO').asstring, 1, 40)) + // 10- Logradouro
                       strEspaco(6, copy(fieldByname('Numero').asstring, 1, 6)) + // 11- Número
                       strEspaco(21, copy(fieldByname('Complemento').asstring, 1, 21)) + // 12- Complemento
                       strEspaco(20, copy(fieldByname('Bairro').asstring, 1, 20)) + // 13- Bairro
                       strEspaco(50, copy(fieldByname('CIDADE').asstring, 1, 50)) + // 14- Municipio
                       strEspaco(2, copy(fieldByname('CodEstado').asstring, 1, 2)) + // 15- UF
                       strZero(8, copy(fieldByname('Cep').asstring, 1, 8)) + // 16- Cep
                       strEspaco(4, copy(fieldByname('DDD').asstring, 1, 4)) + // 17- DDD do telefone
                       strEspaco(8, copy(StringReplace(Trim(fieldByname('Telefone').asstring), '-', '', [rfReplaceAll]), 1, 8)) + // 18- telefone
                       strEspaco(4, copy(fieldByname('DDDFax').asstring, 1, 4)) + //19- DDD do fax
                       strEspaco(8, copy(StringReplace(Trim(fieldByname('Fax').asstring), '-', '', [rfReplaceAll]), 1, 8)) + // 20- Número do Fax
                       strEspaco(6, '') + // 21- Caixa Postal
                       strEspaco(2, '') + // 22- Uf da Caixa Postal
                       strEspaco(8, '') + // 23- Cep da Caixa Postal
                       StrEspaco(40, copy(fieldByname('email').asstring, 1, 40)) + // 24- Correio eletrônico
                       strEspaco(10, '')); // reservado

      //o delimitador #13#10 já está embutido no writeln
      TotalReg := TotalReg + 1;
    end;
end;

procedure TCtrlDCTF.Gera04(Idpessoa,  Situacao, Trimestre : integer; PeriodoInicial, PeriodoFinal, AnoCalendario, DataOcorrencia, DiaDaApuracao, sMes : string);
Var
  Ssql, SsqlProcura : TstringList;
begin
  Ssql               := TstringList.Create;
  SsqlProcura        := TstringList.Create;
  DataInicioApuracao := cdsBusca.fieldByname('DATAINIAPURACAO').Asstring;
  DataFinalApuracao  := cdsBusca.fieldByname('DATAFINALAPURACAO').ASstring;
  Ssql.Append('SELECT NUMDOCUMENTO');
  Ssql.Append('  FROM PESSOA');
  Ssql.Append(' WHERE IDPESSOA = '+intTostr(Idpessoa));
  Cds.data := GetDataPacket(Ssql.text);
  //Pagamento do Dábito - Tipo 04
  SsqlProcura.Append('SELECT D.NUMDOCUMENTO, D.CODNATUREZA, D.DATAFINALAPURACAO AS DATAFINAL, TO_CHAR(D.DATAFINALAPURACAO, ''YYYYMMDD'') AS DATAFINALAPURACAO, N.GRUPOTRIBUTO, N.PERIODICIDADE, ');
  SsqlProcura.Append('       D.REFERENCIA, D.DATAINIAPURACAO, D.VLRIRRF, D.VLRMULTA, D.VLRJUROS, D.VLRTOTAL, TO_CHAR(D.DATAVENCDARF, ''DDMMYYYY'') AS DATAVENCDARF');
  SsqlProcura.Append('  FROM DARF D, DOCUMENTO DO, NATURENDIMENTO N');
  SsqlProcura.Append(' WHERE D.IDPESSOA = '+intTostr(Idpessoa));
  SsqlProcura.Append('   AND D.CODDOCUMENTO = DO.CODDOCUMENTO');
  SsqlProcura.Append('   AND DO.STATUS = ''2'''); //documento pago
  SsqlProcura.Append('   AND D.CODNATUREZA = '+quotedStr(cdsBusca.fieldByname('CodNatureza').Asstring));
  SsqlProcura.Append('   AND D.CODNATUREZA = N.CODNATUREZA(+)');
  SsqlProcura.Append('   AND (N.FLGUSADONADCTF = ''S'' OR N.FLGUSADONADCTF IS NULL)');
  SsqlProcura.Append('   AND To_CHAR(D.DATAINIAPURACAO, ''DD/MM/YYYY'') = '+ quotedStr(DataInicioApuracao));
  SsqlProcura.Append('   AND TO_CHAR(D.DATAFINALAPURACAO, ''DD/MM/YYYY'') = '+ QuotedStr(DataFinalApuracao));
  SsqlProcura.Append(' ORDER BY D.CODNATUREZA, D.DATAINIAPURACAO, D.DATAFINALAPURACAO, N.GRUPOTRIBUTO, N.PERIODICIDADE');
  cdsProcura.Data := GetDataPacket(SsqlProcura.text);
  escrevePagamentoDebito(cds, AnoCalendario, DataOcorrencia, DiaDaApuracao, DataFinalApuracao, sMes, Situacao, Trimestre);
  Ssql.free;
  SsqlProcura.free;
end;

procedure TCtrlDCTF.Gera05(IdPessoa : integer; DataInicioApuracao, DataFinalApuracao, AnoCalendario,  DataOcorrencia, DataIni, DataFim : string; Trimestre,  Situacao : integer);
Var
  Ssql, SsqlProcura  : TstringList;
begin
  Ssql              := TstringList.Create;
  SsqlProcura       := TstringList.Create;
  Ssql.Append('SELECT NUMDOCUMENTO');
  Ssql.Append('  FROM PESSOA');
  Ssql.Append(' WHERE IDPESSOA = '+intTostr(IdPessoa));
  cds.data := GetDataPacket(Ssql.text);

  SsqlProcura.Append('SELECT D.*, C.NOME, C.UF, N.GRUPOTRIBUTO, N.PERIODICIDADE');
  SsqlProcura.Append('  FROM DARF D, CIDADES C, NATURENDIMENTO N, CONTABANCARIA CB, AGENCIABANCARIA AG ');
  SsqlProcura.Append(' WHERE D.IDPESSOA = '+intTostr(IdPessoa));
  SsqlProcura.Append('   AND D.IDCIDADES = C.IDCIDADES(+)');
  SsqlProcura.Append('   AND D.IDPESSOA= AG.IDPESSOA(+)');
  SsqlProcura.Append('   AND D.IDPESSOA= CB.IDPESSOA(+)');
  SsqlProcura.Append('   AND LTRIM(RTRIM(D.CODNATUREZA)) = '+quotedStr(cdsBusca.fieldByname('CodNatureza').Asstring));
  SsqlProcura.Append('   AND D.CODNATUREZA = N.CODNATUREZA(+)');
  SsqlProcura.Append('   AND (N.FLGUSADONADCTF = ''S'' OR N.FLGUSADONADCTF IS NULL)');
  SsqlProcura.Append('   AND D.DATAINIAPURACAO = '+quotedStr(DataIni));
  SsqlProcura.Append('   AND D.DATAFINALAPURACAO = '+quotedStr(DataFim));
  cdsProcura.data := GetDataPacket(SsqlProcura.text);
  EscreveCompensacaoDebitoDarf(cds, AnoCalendario,  DataFinalApuracao, DataOcorrencia, DataIni, DataFim,
                               Trimestre,  Situacao,IdPessoa);
  Ssql.free;
  SsqlProcura.free;
end;

function TCtrlDCTF.GeraTXT(Caminho : string; IdPessoa, IdDocumento, IdResponsavel, IdReprsentante : LongInt;
                           DataIni, DataFim, CRCContador : string; AnoCalendario, TipoDeclaracao, DataIniHeader, DataFimHeader, DataOcorrencia, NaturezaJuridica, CNAE : string;
                           Situacao, Trimestre,  rgRetifica, Qualificacao, Lucro, ProdTerceiro, Cred, Apuracao, cbReducao : integer; PeriodoInicial, PeriodoFinal : string; idEndereco : integer) : Boolean;
begin
  Result := True;
  Try
    //Inicia o txt a ser gerado
    IniciaTXT(Arquivo, Caminho);

    MontaSelect(1, IdPessoa, IdDocumento, IdResponsavel, IdReprsentante, PeriodoInicial, PeriodoFinal);
    //Header da Declaração
    HeaderDeclaracao(Cds, AnoCalendario, TipoDeclaracao, DataIniHeader, DataFimHeader, DataOcorrencia, Situacao,
                     Trimestre);
    MontaSelect(2, IdPessoa, IdDocumento, IdResponsavel, IdReprsentante, PeriodoInicial, PeriodoFinal);
    //Dados Cadastrais e Dados Iniciais - R01
    EscreveDadosCadastrais(cds, Trimestre,  Situacao, rgRetifica, Qualificacao, Lucro, ProdTerceiro, Cred, Apuracao, DataOcorrencia,
                           NaturezaJuridica, CNAE, DataIni, DataFim, AnoCalendario, idEndereco);

    MontaSelect(3, IdPessoa, IdDocumento, IdResponsavel, IdReprsentante, PeriodoInicial, PeriodoFinal);
    //Representante e Responsável - R02
    EscreveRepresentanteResponsavel(cds, AnoCalendario, DataOcorrencia, CRCContador, NaturezaJuridica, DataIni, DataFim, Trimestre, Situacao);

    MontaSelect(20, IdPessoa, IdDocumento, IdResponsavel, IdReprsentante, PeriodoInicial, PeriodoFinal);

    EscreveRepresentante(cds, AnoCalendario, DataOcorrencia, CRCContador, NaturezaJuridica, DataIni, DataFim, Trimestre, Situacao);


     MontaSelect(4, IdPessoa, IdDocumento, IdResponsavel, IdReprsentante, PeriodoInicial, PeriodoFinal);
    //Débito  - R10
    EscreveDebito(cdsPrincipal, cdsBusca, AnoCalendario, DataOcorrencia, PeriodoInicial, PeriodoFinal, Trimestre, Situacao, cbReducao, IdPessoa);

    MontaSelect(10, IdPessoa, IdDocumento, IdResponsavel, IdReprsentante, PeriodoInicial, PeriodoFinal);
          
    MontaSelect(6, IdPessoa, IdDocumento, IdResponsavel, IdReprsentante, PeriodoInicial, PeriodoFinal);
    EscreveCompensacaoDebitoDarf(cds, AnoCalendario,  DataFinalApuracao, DataOcorrencia, DataIni, DataFim,
                                Trimestre,  Situacao,IdPessoa);

   
    //Trailler da Declaração - R99
    TraillerDeclaracao(cds, AnoCalendario, DataOcorrencia,  Situacao,
                       Trimestre);
    //Fecha o arquivo
    CloseFile(Arquivo);
    TotalReg := 0;
  except
    Result := False;
    CloseFile(Arquivo);
  end;
end;

procedure TCtrlDCTF.HeaderDeclaracao(cds: TclientDataSet; AnoCalendario, TipoDeclaracao, DataIniHeader, DataFimHeader, DataOcorrencia : string;
                                     Situacao, Trimestre : integer);
begin
  ////////////////////////////////////////////////////////////////
  //                                                            //
  //                Cabeçalho da Declaração                     //
  //                                                            //
  ///////////////////////////////////////////////////////////////
  with cds do
    Begin
      writeln(Arquivo, 'DCTFM' + // 1- constante que representa sistema
                     strEspaco(3, '') + // 2- brancos
                     strEspaco(4, '') + // 3- brancos
                     AnoCalendario + // 4- ano de competência
                     '0000' + // 5- brancos
                     copy(TipoDeclaracao, 1, 1) + // 6- Tipo Declaração
                     strZero(14, copy(fieldByname('Numdocumento').Asstring, 1, 14)) + // 7- CNPJ do contribuinte
                     '0' + //8- Reservado
                     '130' + // 9- versão
                     strEspaco(60, copy(fieldByname('RazaoSocial').Asstring, 1, 60)) + //  10- Nome empresarial
                     strEspaco(2, fieldByname('CODESTADO').Asstring) + // 11- UF
                     '0000000000' + //12-reservado
                     '0' + //13 - reservado
                     '0' + intTostr(Situacao) + // 14- situação
                     AnoCalendario + // 15- Ano de competência da Declaração
                     copy(DataIniHeader, 3, 2)+//16- Mes de competência da Declaração
                     '00000000000' + // 17-Reservado
                     DataIniHeader + // 18- Período Base inicial
                     DataFimHeader + // 19- Período Base Final
                     DataOcorrencia + // 20- Data de Ocorrência do Evento
                     '0' + // 21- reservado
                     '0' + //22-reservado
                     strEspaco(81, '') + // 23- brancos
                     '0000000000' ); //24-reservado
      //o delimitador #13#10 já está embutido no writeln
      TotalReg := TotalReg + 1;
    end;
end;
procedure TCtrlDCTF.EscreveRepresentante(cds: TclientDataSet; AnoCalendario, DataOcorrencia, CRCContador, NaturezaJuridica, DataIni, DataFim : string; Trimestre, Situacao : integer);
begin
 ////////////////////////////////////////////////////////////////
  //                                                            //
  //         Representante  e Responsável - Tipo R03- r20          //
  //                                                            //
  ///////////////////////////////////////////////////////////////
  if Trim(CRCContador) = '' then
     Begin
       cdsResponsavel.edit;
       cdsResponsavel.fieldByname('CodEstado').asstring := '';
       cdsResponsavel.post;
     end;
  with cds do
    Begin
      writeln(Arquivo, 'R03' + // 1- Tipo do Registro
                       strZero(14, copy(fieldByname('Numdocumento').Asstring, 1, 14)) + // 2- CNPJ do Contribuinte
                       AnoCalendario + copy(DataINI, 3, 2)      + //3 MOFG
                       intTostr(Situacao) + // 5- Situação
                       copy(DataOcorrencia, 5, 4) + copy(DataOcorrencia, 3, 2) + copy(DataOcorrencia, 1, 2) +// 5- Data de Ocorrência do Evento
                       strEspaco(60, copy(cdsRepresentante.fieldByname('RazaoSocial').Asstring, 1, 60)) + //  7- Nome Representante
                       strZero(11, copy(cdsRepresentante.fieldByname('CPF').asstring, 1, 11)) + // 8- CPF representante
                       strEspaco(4, copy(cdsRepresentante.fieldByname('DDD').asstring, 1, 4)) + // 16- DDD do telefone
                       strZero(8, copy(Trim(cdsRepresentante.fieldByname('Telefone').asstring), 1, 8)) + // 17- telefone
                       strEspaco(5, '') + // 18- ramal
                       strEspaco(4, copy(cdsRepresentante.fieldByname('DDDFax').asstring, 1, 4)) + //19- DDD do fax
                       strEspaco(8, copy(Trim(cdsRepresentante.fieldByname('Fax').asstring), 1, 8)) + // 20- Número do Fax
                       StrEspaco(40, copy(cdsRepresentante.fieldByname('email').asstring, 1, 40)) + // 21- Correio eletrônico
                       //dados do Responsável
                       strEspaco(60, copy(cdsResponsavel.fieldByname('RazaoSocial').Asstring, 1, 60)) + //  6- Razão Social
                       strZero(11, copy(cdsResponsavel.fieldByname('CPF').asstring, 1, 11)) + // 23- CPF representante
                       strEspaco(15, CRCContador) + // 24- CRC
                       strEspaco(2, copy(cdsResponsavel.fieldByname('CodEstado').asstring, 1, 2)) + // 25- UF
                       strEspaco(4, copy(cdsResponsavel.fieldByname('DDD').asstring, 1, 4)) + // 26- DDD do telefone
                       strZero(8, copy(Trim(cdsResponsavel.fieldByname('Telefone').asstring), 1, 8)) + // 27- telefone
                       strEspaco(5, '') + // 28- ramal
                       strEspaco(4, copy(cdsResponsavel.fieldByname('DDDFax').asstring, 1, 4)) + //29- DDD do fax
                       strEspaco(8, copy(Trim(cdsResponsavel.fieldByname('Fax').asstring), 1, 8)) + // 30- Número do Fax
                       StrEspaco(40, copy(cdsResponsavel.fieldByname('email').asstring, 1, 40)) + // 31- Correio eletrônico
                       StrEspaco(10, ''));  //Reservado
      //o delimitador #13#10 já está embutido no writeln
      TotalReg := TotalReg + 1;
    end;
end;
procedure TCtrlDCTF.IniciaTXT(var Arquivo: textFile; Caminho: string);
begin
  Assignfile(Arquivo, Caminho);
  Rewrite(Arquivo);
end;

procedure TCtrlDCTF.MontaSelect(TipoRegistro: Byte; IdPessoa, IdDocumento, IdResponsavel, IdReprsentante : LongInt;
                                PeriodoInicial, PeriodoFinal : string);
Var
  Ssql, SsqlProcura,SsqlProcuras, SSqlRepresentante, SsqlPrincipal, SsqlBusca, SSqlResponsavel : TstringList;
begin
  Ssql              := TstringList.Create;
  SsqlProcura       := TstringList.Create;
  SsqlProcuras       := TstringList.Create;
  SSqlRepresentante := TstringList.create;
  SsqlPrincipal     := TstringList.create;
  SsqlBusca         := TstringList.create;
  SSqlResponsavel   := TstringList.create;
  Case TipoRegistro of
    1 :  //Header da Declaração
       Begin
         Ssql.Append('SELECT DISTINCT PJ.IDPESSOA, RTRIM(PJ.NOME) AS NOME, RTRIM(PJ.RAZAOSOCIAL) AS RAZAOSOCIAL, ');
         Ssql.Append('       PJ.NUMDOCUMENTO, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, CI.NOME  AS CIDADE,');
         Ssql.Append('       ES.CODESTADO, TELEFONE.DDD, TELEFONE.NUMERO AS TELEFONE, PJ.EMAIL, ');
         Ssql.Append('       FAX.DDD AS DDDFAX, FAX.NUMERO AS FAX');
         Ssql.Append('  FROM PESSOA PJ, ENDPESS E, TELENDPESS TE, CIDADES CI, ESTADO ES,');
         Ssql.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
         Ssql.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
         Ssql.Append('                                 FROM TELENDPESS');
         Ssql.Append('                                GROUP BY IDENDERECO) END');
         Ssql.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE,');
         Ssql.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
         Ssql.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
         Ssql.Append('                                 FROM TELENDPESS');
         Ssql.Append('                                GROUP BY IDENDERECO) END');
         Ssql.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE)');
         Ssql.Append('           AND (TE.TIPO LIKE ''%F%'')) FAX');
         Ssql.Append(' WHERE (PJ.IDPESSOA = '+intTostr(IdPessoa)+')');
         Ssql.Append('   AND (PJ.NUMDOCUMENTO IS NOT NULL)');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = E.IDENDERECO)');
         Ssql.Append('   AND (PJ.IDPESSOA = E.IDPESSOA)');
         Ssql.Append('   AND (E.IDCIDADES = CI.IDCIDADES)');
         Ssql.Append('   AND (CI.IDESTADO = ES.IDESTADO)');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = TELEFONE.IDENDERECO(+))');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = TE.IDENDERECO(+))');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = FAX.IDENDERECO(+))');
       end;
    2 :  //Dados Cadastrais e Dados iniciais - R01
       Begin
         Ssql.Append('SELECT DISTINCT PJ.IDPESSOA, RTRIM(PJ.NOME) AS NOME, RTRIM(PJ.RAZAOSOCIAL) AS RAZAOSOCIAL, ');
         Ssql.Append('       PJ.NUMDOCUMENTO, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, CI.NOME  AS CIDADE,');
         Ssql.Append('       ES.CODESTADO, TELEFONE.DDD, TELEFONE.NUMERO AS TELEFONE, PJ.EMAIL, ');
         Ssql.Append('       FAX.DDD AS DDDFAX, FAX.NUMERO AS FAX');
         Ssql.Append('  FROM PESSOA PJ, ENDPESS E, TELENDPESS TE, CIDADES CI, ESTADO ES,');
         Ssql.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
         Ssql.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
         Ssql.Append('                                 FROM TELENDPESS');
         Ssql.Append('                                GROUP BY IDENDERECO) END');
         Ssql.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE,');
         Ssql.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
         Ssql.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
         Ssql.Append('                                 FROM TELENDPESS');
         Ssql.Append('                                GROUP BY IDENDERECO) END');
         Ssql.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE)');
         Ssql.Append('           AND (TE.TIPO LIKE ''%F%'')) FAX');
         Ssql.Append(' WHERE (PJ.IDPESSOA = '+intTostr(IdPessoa)+')');
         Ssql.Append('   AND (PJ.NUMDOCUMENTO IS NOT NULL)');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = E.IDENDERECO)');
         Ssql.Append('   AND (PJ.IDPESSOA = E.IDPESSOA)');
         Ssql.Append('   AND (E.IDCIDADES = CI.IDCIDADES)');
         Ssql.Append('   AND (CI.IDESTADO = ES.IDESTADO)');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = TELEFONE.IDENDERECO(+))');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = TE.IDENDERECO(+))');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = FAX.IDENDERECO(+))');
       end;
    3 :  //Representante e responsável - R02  E R03
       Begin
         Ssql.Append('SELECT DISTINCT PJ.IDPESSOA, RTRIM(PJ.NOME) AS NOME, RTRIM(PJ.RAZAOSOCIAL) AS RAZAOSOCIAL, ');
         Ssql.Append('       PJ.NUMDOCUMENTO, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, CI.NOME  AS CIDADE,');
         Ssql.Append('       ES.CODESTADO, TELEFONE.DDD, TELEFONE.NUMERO AS TELEFONE, PJ.EMAIL, ');
         Ssql.Append('       FAX.DDD AS DDDFAX, FAX.NUMERO AS FAX');
         Ssql.Append('  FROM PESSOA PJ, ENDPESS E, TELENDPESS TE, CIDADES CI, ESTADO ES,');
         Ssql.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
         Ssql.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
         Ssql.Append('                                 FROM TELENDPESS');
         Ssql.Append('                                GROUP BY IDENDERECO) END');
         Ssql.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE,');
         Ssql.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
         Ssql.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
         Ssql.Append('                                 FROM TELENDPESS');
         Ssql.Append('                                GROUP BY IDENDERECO) END');
         Ssql.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE)');
         Ssql.Append('           AND (TE.TIPO LIKE ''%F%'')) FAX');
         Ssql.Append(' WHERE (PJ.IDPESSOA = '+intTostr(IdPessoa)+')');
         Ssql.Append('   AND (PJ.NUMDOCUMENTO IS NOT NULL)');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = E.IDENDERECO)');
         Ssql.Append('   AND (PJ.IDPESSOA = E.IDPESSOA)');
         Ssql.Append('   AND (E.IDCIDADES = CI.IDCIDADES)');
         Ssql.Append('   AND (CI.IDESTADO = ES.IDESTADO)');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = TELEFONE.IDENDERECO(+))');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = TE.IDENDERECO(+))');
         Ssql.Append('   AND (PJ.IDENDCOMERCIAL = FAX.IDENDERECO(+))');
         cdsResponsavel.data := GetDataPacket(SSql.text);


       end;
    4 :  // Débito - R10
       Begin

         SsqlPrincipal.Append('SELECT NUMDOCUMENTO');
         SsqlPrincipal.Append('  FROM PESSOA');
         SsqlPrincipal.Append(' WHERE IDPESSOA = '+intTostr(IdPessoa));
         cdsPrincipal.data := GetDataPacket(SsqlPrincipal.text);

         SsqlBusca.Append('SELECT D.CODNATUREZA, To_char(D.DATAINIAPURACAO, ''DD/MM/YYYY'') as DATAINIAPURACAO, To_char(D.DATAFINALAPURACAO, ''DD/MM/YYYY'') as DATAFINALAPURACAO, N.GRUPOTRIBUTO, N.PERIODICIDADE, SUM(D.VLRIRRF) AS VLRTOTAL ');
         SsqlBusca.Append('  FROM DARF D, NATURENDIMENTO N');
         SsqlBusca.Append(' WHERE D.IDPESSOA = '+intTostr(IdPessoa));
         SsqlBusca.Append('   AND D.CODNATUREZA = N.CODNATUREZA(+)');
         SsqlBusca.Append('   AND D.DATAINIAPURACAO >= '+quotedStr(PeriodoInicial));
         SsqlBusca.Append('   AND D.DATAFINALAPURACAO <= '+quotedStr(PeriodoFinal));
         SsqlBusca.Append('   AND (N.FLGUSADONADCTF = ''S'' OR N.FLGUSADONADCTF IS NULL)');
         SsqlBusca.Append(' GROUP BY D.CODNATUREZA, D.DATAINIAPURACAO, D.DATAFINALAPURACAO, N.GRUPOTRIBUTO, N.PERIODICIDADE');
         SsqlBusca.Append(' ORDER BY D.CODNATUREZA, D.DATAINIAPURACAO, D.DATAFINALAPURACAO, N.GRUPOTRIBUTO, N.PERIODICIDADE');
         cdsBusca.data := GetDataPacket(SsqlBusca.text);

         //a ficha R10 deve ser uma linha somatória para cada código da receita do período. Está vindo individual.
         //Os valores que aparecerão somados são da apropriação do imposto

       end;
    5 :  // Pagamento do Débito - R04  ==>R11

       Begin
         Ssql.Append('SELECT NUMDOCUMENTO');
         Ssql.Append('  FROM PESSOA');
         Ssql.Append(' WHERE IDPESSOA = '+IntToStr(IdPessoa));

         SsqlProcura.Append('SELECT D.NUMDOCUMENTO, D.CODNATUREZA, To_char(D.DATAFINALAPURACAO, ''DD/MM/YYYY'') AS DATAFINAL, TO_CHAR(D.DATAFINALAPURACAO, ''YYYYMMDD'') AS DATAFINALAPURACAO, N.GRUPOTRIBUTO, N.PERIODICIDADE, ');
         SsqlProcura.Append('       D.REFERENCIA, D.VLRIRRF, D.VLRMULTA, D.VLRJUROS, D.VLRTOTAL, To_char(D.DATAVENCDARF, ''DD/MM/YYYY'') as DATAVENCDARF');
         SsqlProcura.Append('  FROM DARF D, DOCUMENTO DO, NATURENDIMENTO N');
         SsqlProcura.Append(' WHERE D.IDPESSOA = '+intTostr(IdPessoa));
         SsqlProcura.Append('   AND D.CODDOCUMENTO = DO.CODDOCUMENTO');
         SsqlProcura.Append('   AND D.CODNATUREZA = N.CODNATUREZA(+)');
         SsqlProcura.Append('   AND ((N.FLGUSADONADCTF = ''S'') OR (N.FLGUSADONADCTF IS NULL))');
         SsqlProcura.Append('   AND DO.STATUS = ''2'''); //documento pago
         SsqlProcura.Append('   AND D.DATAINIAPURACAO >= '+quoteDstr(PeriodoInicial));
         SsqlProcura.Append('   AND D.DATAFINALAPURACAO <= '+quotedStr(PeriodoFinal));
         SsqlProcura.Append(' ORDER BY D.CODNATUREZA, D.DATAINIAPURACAO, D.DATAFINALAPURACAO, N.GRUPOTRIBUTO, N.PERIODICIDADE');
         cdsProcura.data := GetDataPacket(SsqlProcura.text);
       end;
    6 :  //Compensação do Débito com DARF - R05  = R14
       Begin
         Ssql.Append('SELECT NUMDOCUMENTO');
         Ssql.Append('  FROM PESSOA');
         Ssql.Append(' WHERE IDPESSOA = '+IntToStr(IdPessoa));

         SsqlProcura.Append('SELECT DISTINCT         ');
         SsqlProcura.Append('   PS.NOME,             ');
         SsqlProcura.Append('   PS.IDPESSOA,         ');
         SsqlProcura.Append('   SUM((DECODE(P.FLGDESCONTO,1,VALORPROVENTO, -VALORPROVENTO))) AS H_VALOR1, ');
         SsqlProcura.Append('   PJ.NPROCESSO AS PROCESSO, ');
         SsqlProcura.Append('   PJ.CODVARA ,');
         SsqlProcura.Append('   PJ.NOMEVARA AS VARA, ');
         SsqlProcura.Append('   PJ.UFSECAO AS SECAO,        ');
         SsqlProcura.Append('  (lTRIM(REPLACE(REPLACE((trim(AG.NUMAGENCIA)|| ''00'')||RPAD(CB.CONTACORRENTE,9,''0''),''-'',''''),''.'','''')||''    '')) AS IDENTIFICACAO, ');
         SsqlProcura.Append('            D.NUMDOCUMENTO AS NUMDOC  ');
         SsqlProcura.Append(' FROM CM.HISTRUBSAL H, CM.PROVDESC P, CONTABANCARIA CB, AGENCIABANCARIA AG,PESSOA PS, DARF D, ');
         SsqlProcura.Append(' (SELECT DISTINCT IDPESSOA,     ');
         SsqlProcura.Append('                               PJ.NUMEROPROCESSO NPROCESSO,   ');
         SsqlProcura.Append('                               PJ.IDCBANCARIA,                ');
         SsqlProcura.Append('                               PJ.NUMEROPROCESSO,             ');
         SsqlProcura.Append('                               PJ.CODSECAO,                   ');
         SsqlProcura.Append('                               PJ.CODVARA,                    ');
         SsqlProcura.Append('                               PJ.UFSECAO,                    ');
         SsqlProcura.Append('                               PJ.NOMEVARA                    ');
         SsqlProcura.Append('  FROM procjud PJ                                             ');
         SsqlProcura.Append('  WHERE  SITPROCESSO in (0)                                   ');
         SsqlProcura.Append('  AND pj.datafinal IS NULL                                    ');
         SsqlProcura.Append('  UNION                                                       ');
         SsqlProcura.Append('  SELECT DISTINCT IDPESSOA,                                   ');
         SsqlProcura.Append('                               PJ.NUMEROPROCESSO NPROCESSO,   ');
         SsqlProcura.Append('                               PJ.IDCBANCARIA,                ');
         SsqlProcura.Append('                               PJ.NUMEROPROCESSO,             ');
         SsqlProcura.Append('                               PJ.CODSECAO,                   ');
         SsqlProcura.Append('                               PJ.CODVARA,                    ');
         SsqlProcura.Append('                               PJ.UFSECAO,                    ');
         SsqlProcura.Append('                               PJ.NOMEVARA                    ');
         SsqlProcura.Append('  FROM PROCJUD PJ                                             ');
         SsqlProcura.Append('  WHERE SITPROCESSO = 2 AND                                   ');
         SsqlProcura.Append('  NOT EXISTS (SELECT 1 FROM PROCJUD PJ1                       ');
         SsqlProcura.Append('                       WHERE PJ1.IDPESSOA = PJ.Idpessoa       ');
         SsqlProcura.Append('                       AND PJ1.SITPROCESSO = 0                ');
         SsqlProcura.Append(' )                                                            ');
         SsqlProcura.Append(' ) PJ                                                         ');
         SsqlProcura.Append(' WHERE                                                        ');
         SsqlProcura.Append(' P.IDPROVENTO = H.IDRUBRICA                                   ');
         SsqlProcura.Append(' AND H.IDHSTFOLHABENEF = (809)                                ');
         SsqlProcura.Append(' AND substr(p.codprovdesc,2,3) in (''324'',''424'',''326'',''426'')   ');
         SsqlProcura.Append(' AND ( (H.CODIRRFDARF = ''7416'') OR (H.CODIRRFDARF=''7431'')) ');
         SsqlProcura.Append(' AND h.idpessoa = pj.idpessoa                                 ');
         SsqlProcura.Append(' AND H.IDPESSOA = PS.IDPESSOA                                 ');
         SsqlProcura.Append(' and pJ.idcbancaria = cb.idcbancaria(+)                       ');
         SsqlProcura.Append(' and cb.idagencia = ag.idpessoa(+)                            ');
         SsqlProcura.Append(' AND valorprovento>0                                          ');
         SsqlProcura.Append(' AND D.CODNATUREZA = H.CODIRRFDARF                                          ');
         SsqlProcura.Append('   AND D.DATAINIAPURACAO >= '+QuotedStr(PeriodoInicial));
         SsqlProcura.Append('   AND D.DATAFINALAPURACAO <= '+quotedStr(PeriodoFinal));
         SsqlProcura.Append(' group by PJ.NPROCESSO, CODSECAO, CODVARA, DATAPAGAMENTO, UFSECAO,NOMEVARA, ');
         SsqlProcura.Append(' AG.NUMAGENCIA, CB.CONTACORRENTE, D.NUMDOCUMENTO, PS.NOME, PS.IDPESSOA        ');
         cdsProcura.data := GetDataPacket(SsqlProcura.text);
       end;
    7 :  //Compensação do Débito sem DARF - R06
       Begin
         //talves precise disso mais tarde
       end;
    8 : //Parcelamento do Débito - R07
       Begin
         //talves precise disso mais tarde
       end;
    9 :  // Suspensão do Débito R08
       Begin
         //talves precise disso mais tarde
       end;
    10 :  //Quota - R10
        Begin
          Ssql.Append('SELECT NUMDOCUMENTO');
          Ssql.Append('  FROM PESSOA');
          Ssql.Append(' WHERE IDPESSOA = '+IntToStr(IdPessoa));

          SsqlProcura.Append('SELECT D.VLRIRRF, TO_CHAR(D.DATAFINALAPURACAO, ''YYYYMMDD'') AS  DATAFINALAPURACAO, D.CODNATUREZA, N.GRUPOTRIBUTO,');
          SsqlProcura.Append('       D.REFERENCIA, D.VLRIRRF, D.VLRMULTA, D.VLRJUROS, To_char(D.DATAVENCDARF, ''DDMMYYYY'') AS DATAVENCDARF, ');
          SsqlProcura.Append('       D.TIPOPROCESSO, D.PROCESSO, D.MEDIDAJUDICIAL, D.VARA, C.NOME, C.CODESTADO ');
          SsqlProcura.Append('  FROM DARF D, DOCUMENTO DO, NATURENDIMENTO N, CIDADES C');
          SsqlProcura.Append(' WHERE D.IDPESSOA = '+intTostr(IdPessoa));
          SsqlProcura.Append('   AND D.IDCIDADES = C.IDCIDADES(+) ');
          SsqlProcura.Append('   AND D.CODDOCUMENTO = DO.CODDOCUMENTO');
          SsqlProcura.Append('   AND D.CODNATUREZA = N.CODNATUREZA(+)');
          SsqlProcura.Append('   AND ((N.FLGUSADONADCTF = ''S'') OR (N.FLGUSADONADCTF IS NULL))');
          SsqlProcura.Append('   AND DO.STATUS = ''2'''); //documento pago
          SsqlProcura.Append('   AND D.DATAINIAPURACAO >= '+quoteDstr(PeriodoInicial));
          SsqlProcura.Append('   AND D.DATAFINALAPURACAO <= '+quotedStr(PeriodoFinal));
          SsqlProcura.Append('   AND N.GRUPOTRIBUTO IN (''01'', ''05'', ''06'') ');
          SsqlProcura.Append(' ORDER BY DATAFINALAPURACAO');
          cdsProcura.data := GetDataPacket(SsqlProcura.text);
         
        end;
    11 : // R11 - Pagamento da Quota
        Begin
          Ssql.Append('SELECT NUMDOCUMENTO');
          Ssql.Append('  FROM PESSOA');
          Ssql.Append(' WHERE IDPESSOA = '+IntToStr(IdPessoa));

          SsqlProcura.Append('SELECT P.NUMDOCUMENTO, D.CODNATUREZA, TO_CHAR(D.DATAFINALAPURACAO, ''YYYYMMDD'') AS DATAFINALAPURACAO, N.GRUPOTRIBUTO, ');
          SsqlProcura.Append('       D.REFERENCIA, D.VLRIRRF, D.VLRMULTA, D.VLRJUROS, To_char(D.DATAVENCDARF, ''DDMMYYYY'') as DATAVENCDARF');
          SsqlProcura.Append('  FROM DARF D, DOCUMENTO DO, NATURENDIMENTO N, PESSOA P, CIDADES C');
          SsqlProcura.Append(' WHERE D.IDPESSOA = '+intTostr(IdPessoa));
          SsqlProcura.Append('   AND D.CODDOCUMENTO = DO.CODDOCUMENTO');
          SsqlProcura.Append('   AND DO.IDFORCLI = P.IDPESSOA ');
          SsqlProcura.Append('   AND D.CODNATUREZA = N.CODNATUREZA(+)');
          SsqlProcura.Append('   AND ((N.FLGUSADONADCTF = ''S'') OR (N.FLGUSADONADCTF IS NULL))');
          SsqlProcura.Append('   AND DO.STATUS = ''2'''); //documento pago
          SsqlProcura.Append('   AND D.DATAINIAPURACAO >= '+quoteDstr(PeriodoInicial));
          SsqlProcura.Append('   AND D.DATAFINALAPURACAO <= '+quotedStr(PeriodoFinal));
          SsqlProcura.Append('   AND N.GRUPOTRIBUTO IN (''01'', ''05'', ''06'') ');
          SsqlProcura.Append(' ORDER BY D.CODNATUREZA, DATAFINALAPURACAO, N.GRUPOTRIBUTO');
          cdsProcura.data := GetDataPacket(SsqlProcura.text);
        end;
    12 :  //R12 - Compensação da Quota com DARF
        Begin
          Ssql.Append('SELECT NUMDOCUMENTO');
          Ssql.Append('  FROM PESSOA');
          Ssql.Append(' WHERE IDPESSOA = '+IntToStr(IdPessoa));

          SsqlProcura.Append('SELECT P.NUMDOCUMENTO, D.CODNATUREZA, TO_CHAR(D.DATAFINALAPURACAO, ''YYYYMMDD'') AS DATAFINALAPURACAO, N.GRUPOTRIBUTO, ');
          SsqlProcura.Append('       D.REFERENCIA, D.VLRIRRF, D.VLRMULTA, D.VLRJUROS, To_char(D.DATAVENCDARF, ''DDMMYYYY'') AS DATAVENCDARF, ');
          SsqlProcura.Append('       D.TIPOPROCESSO, D.PROCESSO, D.MEDIDAJUDICIAL, D.VARA, C.NOME, C.CODESTADO, PJ. ');
          SsqlProcura.Append('  FROM DARF D, DOCUMENTO DO, NATURENDIMENTO N, PESSOA P, CIDADES C   ');
          SsqlProcura.Append(' WHERE D.IDPESSOA = '+intTostr(IdPessoa));
          SsqlProcura.Append('   AND D.IDCIDADES = C.IDCIDADES(+) ');
          SsqlProcura.Append('   AND D.CODDOCUMENTO = DO.CODDOCUMENTO');
          SsqlProcura.Append('   AND DO.IDFORCLI = P.IDPESSOA ');
          SsqlProcura.Append('   AND D.CODNATUREZA = N.CODNATUREZA');
          SsqlProcura.Append('   AND ((N.FLGUSADONADCTF = ''S'') OR (N.FLGUSADONADCTF IS NULL))');
          SsqlProcura.Append('   AND DO.STATUS = ''2'''); //documento pago
          SsqlProcura.Append('   AND D.DATAINIAPURACAO >= '+quoteDstr(PeriodoInicial));
          SsqlProcura.Append('   AND D.DATAFINALAPURACAO <= '+quotedStr(PeriodoFinal));
          SsqlProcura.Append('   AND N.GRUPOTRIBUTO IN (''01'', ''05'', ''06'') ');
          SsqlProcura.Append(' ORDER BY D.CODNATUREZA, DATAFINALAPURACAO, N.GRUPOTRIBUTO');
          cdsProcura.data := GetDataPacket(SsqlProcura.text);
        end;
    13 : //Compensação da Quota sem DARF - R13
        Begin
          //talves precise disso mais tarde
        end;
    14 : //Parcelado da Quota - R14
        Begin
          //talves precise disso mais tarde
        end;
    17 : //Apuração do Crédito Presumido com base em Sistemas de Custos Integrado - R17
        Begin
          //talves precise disso mais tarde
        end;
    18 : //Vendas a Comercial Exportadora - Tipo R18
        Begin
          //talves precise disso mais tarde
        end;
    19 :  //Transferência de Crédito Presumido
        Begin
          //talves precise disso mais tarde
        end;
    20 : //Representante e responsável - R03
        Begin
          SsqlProcura.Append('SELECT DISTINCT PF.IDPESSOA, RTRIM(PF.NOME) AS RAZAOSOCIAL,');
         SsqlProcura.Append('       D.NUMDOCUMENTO AS CPF, ES.CODESTADO, TELEFONE.DDD, TELEFONE.NUMERO AS TELEFONE,');
         SsqlProcura.Append('       PF.EMAIL, FAX.DDD AS DDDFAX, FAX.NUMERO AS FAX');
         SsqlProcura.Append('  FROM PESSOA PF, ENDPESS E, TELENDPESS TE, CIDADES CI, ESTADO ES, DOCPESSOA D,');
         SsqlProcura.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
         SsqlProcura.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
         SsqlProcura.Append('                                 FROM TELENDPESS');
         SsqlProcura.Append('                                GROUP BY IDENDERECO) END');
         SsqlProcura.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE,');
         SsqlProcura.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
         SsqlProcura.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
         SsqlProcura.Append('                                 FROM TELENDPESS');
         SsqlProcura.Append('                                GROUP BY IDENDERECO) END');
         SsqlProcura.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE)');
         SsqlProcura.Append('           AND (TE.TIPO LIKE ''%F%'')) FAX');
         SsqlProcura.Append(' WHERE (PF.IDPESSOA = '+intTostr(IdPessoa)+')');
         SsqlProcura.Append('   AND (PF.NUMDOCUMENTO IS NOT NULL)');
         SsqlProcura.Append('   AND (PF.IDENDRESIDENCIAL = E.IDENDERECO)');
         SsqlProcura.Append('   AND (PF.IDPESSOA = E.IDPESSOA)');
         SsqlProcura.Append('   AND (E.IDCIDADES = CI.IDCIDADES)');
         SsqlProcura.Append('   AND (CI.IDESTADO = ES.IDESTADO)');
         SsqlProcura.Append('   AND (PF.IDENDCOMERCIAL = TELEFONE.IDENDERECO(+))');
         SsqlProcura.Append('   AND (PF.IDENDCOMERCIAL = TE.IDENDERECO(+))');
         SsqlProcura.Append('   AND (PF.IDENDCOMERCIAL = FAX.IDENDERECO(+))');
         SsqlProcura.Append('   AND (PF.IDPESSOA = D.IDPESSOA(+))');
         SsqlProcura.Append('   AND (D.IDDOCUMENTO(+) = '+intTostr(IdDocumento)+')');
         cdsProcura.data := GetDataPacket(SsqlProcura.text);     

         SSqlRepresentante.Append('SELECT DISTINCT PF.IDPESSOA, RTRIM(PF.NOME) AS RAZAOSOCIAL, ');
         SSqlRepresentante.Append('       D.NUMDOCUMENTO AS CPF, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, CI.NOME  AS CIDADE,');
         SSqlRepresentante.Append('       ES.CODESTADO, TELEFONE.DDD, TELEFONE.NUMERO AS TELEFONE, PF.EMAIL,');
         SSqlRepresentante.Append('       FAX.DDD AS DDDFAX, FAX.NUMERO AS FAX ');
         SSqlRepresentante.Append('  FROM PESSOA PF, ENDPESS E, TELENDPESS TE, CIDADES CI, ESTADO ES, DOCPESSOA D, ');
         SSqlRepresentante.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO ');
         SSqlRepresentante.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
         SSqlRepresentante.Append('                                 FROM TELENDPESS ');
         SSqlRepresentante.Append('                                GROUP BY IDENDERECO) END ');
         SSqlRepresentante.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE, ');
         SSqlRepresentante.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO ');
         SSqlRepresentante.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO ');
         SSqlRepresentante.Append('                                 FROM TELENDPESS ');
         SSqlRepresentante.Append('                                GROUP BY IDENDERECO) END ');
         SSqlRepresentante.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE) ');
         SSqlRepresentante.Append('           AND (TE.TIPO LIKE ''%F%'')) FAX ');
         SSqlRepresentante.Append(' WHERE (PF.IDPESSOA = '+intTostr(IdReprsentante)+') ');
         SSqlRepresentante.Append('   AND (PF.NUMDOCUMENTO IS NOT NULL) ');
         SSqlRepresentante.Append('   AND (PF.IDENDRESIDENCIAL = E.IDENDERECO(+)) ');
         SSqlRepresentante.Append('   AND (PF.IDPESSOA = E.IDPESSOA(+)) ');
         SSqlRepresentante.Append('   AND (E.IDCIDADES = CI.IDCIDADES(+)) ');
         SSqlRepresentante.Append('   AND (CI.IDESTADO = ES.IDESTADO(+)) ');
         SSqlRepresentante.Append('   AND (PF.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+)) ');
         SSqlRepresentante.Append('   AND (PF.IDENDRESIDENCIAL = TE.IDENDERECO(+)) ');
         SSqlRepresentante.Append('   AND (PF.IDENDRESIDENCIAL = FAX.IDENDERECO(+)) ');
         SSqlRepresentante.Append('   AND (PF.IDPESSOA = D.IDPESSOA(+)) ');
         SSqlRepresentante.Append('   AND (D.IDDOCUMENTO(+) = '+intTostr(IdDocumento)+') ');
         cdsRepresentante.data := GetDataPacket(SSqlRepresentante.text);

         SSqlResponsavel.Append('SELECT DISTINCT PF.IDPESSOA, RTRIM(PF.NOME) AS RAZAOSOCIAL,');
         SSqlResponsavel.Append('       D.NUMDOCUMENTO AS CPF, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, CI.NOME  AS CIDADE,');
         SSqlResponsavel.Append('       ES.CODESTADO, TELEFONE.DDD, TELEFONE.NUMERO AS TELEFONE, PF.EMAIL,');
         SSqlResponsavel.Append('       FAX.DDD AS DDDFAX, FAX.NUMERO AS FAX');
         SSqlResponsavel.Append('  FROM PESSOA PF, ENDPESS E, TELENDPESS TE, CIDADES CI, ESTADO ES, DOCPESSOA D,');
         SSqlResponsavel.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
         SSqlResponsavel.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
         SSqlResponsavel.Append('                                 FROM TELENDPESS');
         SSqlResponsavel.Append('                                GROUP BY IDENDERECO) END');
         SSqlResponsavel.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE,');
         SSqlResponsavel.Append('       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
         SSqlResponsavel.Append('          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
         SSqlResponsavel.Append('                                 FROM TELENDPESS');
         SSqlResponsavel.Append('                                GROUP BY IDENDERECO) END');
         SSqlResponsavel.Append('         WHERE (END.IDTELEFONE = TE.IDTELEFONE)');
         SSqlResponsavel.Append('           AND (TE.TIPO LIKE ''%F%'')) FAX');
         SSqlResponsavel.Append(' WHERE (PF.IDPESSOA = '+intTostr(IdResponsavel)+')');
         SSqlResponsavel.Append('   AND (PF.NUMDOCUMENTO IS NOT NULL)');
         SSqlResponsavel.Append('   AND (PF.IDENDRESIDENCIAL = E.IDENDERECO(+))');
         SSqlResponsavel.Append('   AND (PF.IDPESSOA = E.IDPESSOA(+))');
         SSqlResponsavel.Append('   AND (E.IDCIDADES = CI.IDCIDADES(+))');
         SSqlResponsavel.Append('   AND (CI.IDESTADO = ES.IDESTADO(+))');
         SSqlResponsavel.Append('   AND (PF.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+))');
         SSqlResponsavel.Append('   AND (PF.IDENDRESIDENCIAL = TE.IDENDERECO(+))');
         SSqlResponsavel.Append('   AND (PF.IDENDRESIDENCIAL = FAX.IDENDERECO(+))');
         SSqlResponsavel.Append('   AND (PF.IDPESSOA = D.IDPESSOA(+))');
         SSqlResponsavel.Append('   AND (D.IDDOCUMENTO(+) = '+intTostr(IdDocumento)+')');
         cdsResponsavel.data := GetDataPacket(SSqlResponsavel.text);

        end;
  end;

  if Trim(Ssql.text) <> '' then
    cds.data := GetDataPacket(SSql.text);

  Ssql.free;
  SsqlProcura.free;
  SSqlRepresentante.free;
  SsqlPrincipal.free;
  SsqlBusca.free;
  SSqlResponsavel.Free;
end;

procedure TCtrlDCTF.TraillerDeclaracao(cds: TClientDataSet; AnoCalendario, DataOcorrencia : string;  Situacao, Trimestre : integer);
begin
  ////////////////////////////////////////////////////////////////
  //                                                            //
  //           Trailler da Declaração - Tipo R99                //
  //                                                            //
  ///////////////////////////////////////////////////////////////
  with cds do
    Begin
      writeln(Arquivo, 'T9' + // 1- Tipo do Registro
                           strZero(14, copy(fieldByname('Numdocumento').asstring, 1, 14)) + // 2- CNPJ
                           AnoCalendario + intTostr(Trimestre + 1) + // 3- Trimestre de Ocorrência do Fato Gerador
                           intTostr(Situacao) + // 5- Situação
                           copy(DataOcorrencia, 5, 4) + copy(DataOcorrencia, 3, 2) + copy(DataOcorrencia, 1, 2) +// 6- Data de Ocorrência do Evento
                           StrZero(5, intTostr(TotalReg + 1)) +  // 7- Quantidade de registros
                           strEspaco(65, '')); // 14- Filler
          //o delimitador #13#10 já está embutido no writeln
    end;
end;

function TCtrlDCTF.VerPerApuracao(dData: TDatetime;
                                             CodNatureza: string): string;
Var
  cPeriodicidade, Ssql,compl : string;
  iDia : integer;
  Dia,Mes,Ano : Word;
begin
  DecodeDate(dData,Ano,Mes,Dia);

  with cdsAux do
    Begin
      Ssql := 'SELECT PERIODICIDADE FROM NATURENDIMENTO '+
              ' WHERE CODNATUREZA = '+quotedStr(CodNatureza);
      Data := GetDataPacket(Ssql);
      if fieldByname('PERIODICIDADE').IsNull then
         cPeriodicidade := ' '
      else
         cPeriodicidade := fieldByname('PERIODICIDADE').Asstring;
      if cPeriodicidade = 'D' then
         Result := strZero(2, intTostr(Dia))
      else if cPeriodicidade = 'S' then
          Result := '0' + intToStr(NumWeekMonth(dData))
      else if cPeriodicidade = 'X' then
        Begin
          compl:= '03';

          iDia := strToint(strZero(2, intTostr(Dia)));
          if iDia <= 10 then
             Result := '01'
          else if (iDia > 10) and (iDia <= 20) then
             Result := '02'
          else if iDia > 20 then
             Result := '03';
        end
      else if cPeriodicidade = 'Q' then
        Begin
          iDia := strToint(strZero(2, intTostr(Dia)));
          if iDia <= 15 then
             Result := '01'
          else
             result := '02';
        end
        else if cPeriodicidade = 'Q' then
        Begin
         compl :='04';
        end
        else if ( cPeriodicidade = 'Q' ) and (CodNatureza = '5952') then
        Begin
         compl :='02';
        end
      else if (cPeriodicidade = 'M') or (cPeriodicidade = 'T') or (cPeriodicidade = 'A') then
          Result := '00'
      else
          Result := '00';
    end;
end;

end.
R100043692300019020060900000000011595202Q2006090200000000000000000000000000003577209000
R140043692300019020060900000000002056102M2006060000000000000000000000000000000006379210000000000960013         09CURITIBA                                          PR0650800635000508    2006200614722569991   743110072006000000000063790000000000000000000000000000
