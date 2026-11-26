{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - LayOut dos arquivos de Pagamento para:              }
{   - Pagamento a Fornecedores Banco Real               }
{     BANCO REAL PAGTO FORNECEDORES 1/P                 }
{                                                       }
{   - Folha de Pagamento Banco Real                     }
{     BANCO REAL FOLHA DE PAGAMENTO 2/P                 }
{                                                       }
{   - Folha de Pagamento Bradesco                       }
{     BRADESCO FOLHA DE PAGAMENTO 3/P                   }
{                                                       }
{   - Pagamento de Fornecedores Banco do Brasil         }
{     BANCO DO BRASIL - PAGAMENTO DE FORNECEDORES 5/P   }
{                                                       }
{   - Pagto Fornecedores Bradesco                       }
{     BRADESCO PAGTO FORNECEDORES 4/P                   }
{                                                       }
{   - Folha de Pagamento Caixa Econômica Federal        }
{     CEF FOLHA DE PAGAMENTO 13/P                       }
{                                                       }
{   - Folha de Pagamento Meridional                     }
{     MERIDIONAL SAQUE RÁPIDO 14/P                      }
{                                                       }
{   - Pagamento MontaPagBanespa                         }
{     BANESPA CONTAS CORRENTES 15/P                     }
{                                                       }
{   - Transferencia Bancára - banco do Brasil           }
{     BANCO DO BRASIL TRANSF 19/P                       }
{                                                       }
{   - Payments sem pré-cadastramento de Fornecedor      }
{     BANCO DE BOSTON  20/P                             }
{                                                       }
{   - Lançamentos em Conta Corrente                     }
{     BANCO BANRISUL  22 /P                             }
{                                                       }
{   - Pagamento de Titulos usando qq Forma de Pagamento }
{     PAGAMENTOS - BANCO BBV(400 Posições) 23/P         }
{                                                       }
{   - Pagamento de Titulos usando qq Forma de Pagamento }
{     PAGAMENTOS - BANCO SANTANDER(400 Posições) 24/P   }
{                                                       }
{                                                       }


unit uPagDiversosMT;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls, udiasUteis, uCmClientDataSet;

Type
   TPagDiversos = Class
   private
     {Agência centralizadora de pagamentos para o BBTransg}
     sAgenciaCentral: String;
     {Conta centralizadora de pagamentos para o BBTransg}
     sContaCentral: String;
     {Arquivo a ser gerado}
     ArquivoRemessa: TextFile;
     {Total de Registros do arquivo}
     iTotRegArq: Integer;
     {Total de registros a Crédito para o modelo do banco Banespa}
     iTotRegC: Integer;
     {Total de registros a Débito para o modelo do banco Banespa}
     iTotRegD: Integer;
     {Razào dá conta corrente da empresa proprietária}
     sRazaoConta: String;
     {String para informação da ação a ser executada}
     sPasso: String;
     {Tipo de serviço a ser executado pelo banco}
     sTipoServicos: String;
     {Número do documento da empresa proprietária}
     sCodInscEmpresa: String;
     {Código do serviço a ser executado pelo banco}
     sCodServ: String;
     {Número da empresa no banco}
     sNumEmpresaBanco,
     {Tipo de documento a ser pago}
     sTipoDoc: String;
     {Indica a conferência do núnmero do documento do arquivo}
     sConfere: String;
     {mensagem genéria a ser impressa}
     sMensagem: String;
     {número do convênio da empresa no banco}
     sNumConv: String;
     {Instrução a ser seguida para pagamento}
     sInstCheque: String;
     {Valor total dos registros no arquivo}
     rTotalValorPago: Real;
     {Valore total dos registro a crédito}
     rValorC: Real;
     {Valor total dos registros a débito}
     rValorD: Real;
     {Data do débito na conta da empresa}
     dDataDebito: TDatetime;
     {Calcula o DV das Agências e da Conta Corrente para o PAGFOR do Bradesco}
     function  CalculaMod11(sNumero: String; Base : Integer): String;

     {Pagamento a Fornecedores Banco Real}
     Procedure HeaderPagFornReal;
     Procedure DetalhePagFornReal;
     Procedure DetalheBarrasPagFornReal;
     Procedure TraillerPagFornReal;
     {Folha de Pagamento Banco Real}
     Procedure HeaderFolhaPagReal;
     Procedure DetalheFolhaPagReal;
     Procedure TraillerFolhaPagReal;
     {Folha de Pagamento Bradesco}
     Procedure HeaderFolhaPagBradesco;
     Procedure DetalheFolhaPagBradesco;
     Procedure TraillerFolhaPagBradesco;
     {Pagamento de Fornecedores Banco do Brasil}
     Procedure HeaderPagBancoDoBrasil;
     Procedure DetalhePagBancoDoBrasil;
     Procedure TraillerPagBancoDoBrasil;
     {Pagto Fornecedores Bradesco}
     Procedure HeaderPagForneBradesco;
     Procedure DetalhePagForneBradesco;
     Procedure TraillerPagForneBradesco;
     {Folha de Pagamento Caixa Econômica Federal}
     Procedure HeaderPagCef;
     Procedure DetalhePagCef;
     Procedure TraillerPagCef;
     {Folha de Pagamento Meridional}
     Procedure HeaderPagMeridional;
     Procedure DetalhePagMeridional;
     Procedure TraillerPagMeridional;
     {Pagamento MontaPagBanespa}
     Procedure HeaderPagBanespa;
     Procedure DetalhePagBanespa;
     Procedure TraillerPagBanespa;
     {Tranferencia Bancára - Banco do Brasil}
     Procedure HeaderTransfBB;
     Procedure DetalhetransfBB;
     Procedure TraillerTransfBB;
     {Pré-Cadastramento de Fornecedores - Banco de Boston}
     Procedure HeaderBKBForn;
     Procedure DetalheBKBForn;
     Procedure TraillerBKBForn;

     {Lançamento em Conta Corrente - BANRISUL}
     Procedure HeaderBanrisulCC;
     Procedure DetalheBanrisulCC;
     Procedure TraillerBanrisulCC;

     {Pagamentos - Banco BBV}
     Procedure HeaderPagamentoBBV;
     Procedure DetalhePagamentoBBV;
     Procedure TraillerPagamentoBBV;

     {Pagamento de Fornecedores - Banco Santander}
     Procedure HeaderPagFornSantander;
     Procedure DetalhePagFornSantander;
     Procedure DetalhePagFornCompSantander;
     Procedure TraillerPagFornSantander;

     {Cartão ACC Card - Folha de Pagamento}
     Procedure HeaderPagamentoACCCARD;
     Procedure DetalhePagamentoACCCARD;

   //início - André Tavares - 23/03/2004 - pendência 16244
     function UsaAlteradorEnvio(CodPortForma: Extended): Boolean;
     function ListaAlteradores(CodDocumento : Extended): OleVariant;
     function PegaValorNominalDocum(CodPortForma: Extended): extended;
   //fim - André Tavares - 23/03/2004 - pendência 16244

     procedure MudaFormaPag; //pendência 26604

   public
   //início - André Tavares - 25/09/2003 - pendência 15101
    iSeqArquivo : longInt;   // numero sequencial do arquivo
    iSeqRemessa : longInt;   // numero sequencial do arquivo
   //fim - André Tavares - 25/09/2003 - pendência 15101
     {Pagamento a Fornecedores Banco Real}
     Procedure MontaPagFornReal;
     {Folha de Pagamento Banco Real}
     Procedure MontaFolhaPagReal;
     {Folha de Pagamento Bradesco}
     Procedure MontaFolhaPagBradesco;
     {Pagamento de Fornecedores Banco do Brasil}
     Procedure MontaPagBancoDoBrasil;
     {Pagto Fornecedores Bradesco}
     Procedure MontaPagForneBradesco;
     {Folha de Pagamento Caixa Econômica Federal}
     Procedure MontaPagCef;
     {Folha de Pagamento Meridional}
     Procedure MontaPagMeridional;
     {Pagamento MontaPagBanespa}
     Procedure MontaPagBanespa;
     {Tranferencia Bancára - banco do Brasil}
     Procedure TransfBB;
     {Pré-Cadastramento de Fornecedores - Banco de Boston}
     Procedure MontaPagForBoston;
     {Lançamento em Conta Corrente - BANCO BANRISUL}
     Procedure MontaLancamentoCCBanrisul;
     {BBV - Pagamentos}
     Procedure MontaPagamentoBBV;
     {Santander - Pagamento de Fornecedores(400 posições) }
     Procedure MontaPagamentoFornecedorSantander;
     {CARTAO ACC CARD - Folha de Pagamento}
     Procedure MontaFolhaPagamentoACCCARD;
end;

Var
  PagDiversos: TPagDiversos;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString, uCmDialogs;

function TPagDiversos.CalculaMod11(sNumero: String; Base: Integer): String;
var
   sString, sDigito : String;
   Divisor, iResto, iBase, x, iDividendo : Integer;
begin
  sString    := sNumero;
  iBase      := 2;
  iDividendo := 0;
  Divisor    := 11;
  For X := Length(sString) downto 1 do
  begin
    iDividendo := iDividendo + (StrToInt(sString[x]) * ibase);
    Inc(iBase);
    if iBase > Base Then
       iBase := 2;
  end;
  iResto := (iDividendo Mod Divisor);
  sDigito := IntToStr(Divisor - (iDividendo Mod Divisor));
  Case iResto of
    0: sDigito := '0';
    1: sDigito := 'P';
  end;
  Result := sDigito;
end;

procedure TPagDiversos.MontaPagFornReal;
Var
  sAuxArquivo: String;
begin
  With IntBancoManager Do
  Begin
     Try
        iTotRegArq  := 0;
        rTotalValorPago := 0;

        sPasso := '';

        sAuxArquivo  := sNomeArquivo;
        SNomeArquivo := sAuxArquivo + 'REALPG.TXT';

        If fileexists(sNomeArquivo) Then
           Raise Exception.Create('Existe remessa pendente de emissão para o banco. Impossível gerar arquivo');

        sPasso := 'Criar Arquivo Para Gravar Os Dados';

        AssignFile(ArquivoRemessa,sNomeArquivo);
        ReWrite(ArquivoRemessa);

        If CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
           sCodInscEmpresa := '1'
        Else
           sCodInscEmpresa := '2';

        sPasso := 'Montar Header do Arquivo';

        HeaderPagFornReal;

        While Not CdsTexto.Eof Do
        Begin
          MudaFormaPag; //pendência 26604

          DetalhePagFornReal;

          If CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 6 Then
             DetalheBarrasPagFornReal;

          //pendência 26926 - 09/01/2008
          if not intBancoManager.bUsaDataIntBanco then
            intBancoManager.DataPagamento := '';

          CdsTexto.Next;
        End;

        TraillerPagFornReal;

        CloseFile(ArquivoRemessa);

        sPasso := 'Preparando Visualização do Arquivo';
        MostraArquivo;
        bArquivoCriado:= True;
     Except
        On E:Exception Do
        Begin
          bArquivoCriado:= False;
          If sPasso <> '' Then
          Begin
            MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
            CloseFile(ArquivoRemessa);
          End;
          Raise;
        End;
     End;
  End;
End;


procedure TPagDiversos.HeaderPagFornReal;
Begin
With IntBancoManager Do
Begin
 Inc(iTotRegArq);
 WriteLn(ArquivoRemessa,
         Concat('0', // Código do Registro
               '1', // Código da Remessa
               'REMESSA', // Literal da Remessa
               '05', // Código do Serviço
               'PG FORNECEDORES', // Literal do Serviço
               ZD(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do convênio
               '0', // Dac - Opcional
               ZD(CdsEmpresa.FieldByName('NUMCONTA').AsString,8), //Conta do Convênio
               Spc(7), // Brancos
               Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
               '356', //Número do Banco
               'BANCO REAL S.A.', //Nome do Banco
               RemoveBarras(DateToStr(Date)), //Data Gravação do Arquivo
               RemoveBarras(DateToStr(Date)), //Data Gravação do Arquivo
               RemovePontos(TimeToStr(Time)), //Hora Gravação do Arquivo
               '000000', //Nº da Geração do Arquivo
               'PG  ', //Sigla da Legenda
               spc(30), //Filler
               '0'+ sCodInscEmpresa, //Tipo Cod. Empresa
               Spc(15), //Código da Empresa
               Spc(185), // Filler
               Spc(40), //Filler
               '000001'));
End;
End;

procedure TPagDiversos.TraillerPagFornReal;
Begin
 Inc(iTotRegArq);
With IntBancoManager Do
 WriteLn(ArquivoRemessa,
         Concat('9', // Código do registro
               ZD(RemoveVirgulas(rTotalValorPago,2),15), // Somatorio dos valores pagos
               Spc(378), //Brancos
               ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

procedure TPagDiversos.DetalhePagFornReal;
var
  sTipoPagamento, sTipoInsc: String;
Begin
With IntBancoManager Do
Begin
 Inc(iTotRegArq);

 If CdsTexto.FieldByName('TIPO').AsString = 'J' Then
   sTipoInsc := '01'
 Else
   If CdsTexto.FieldByName('TIPO').AsString = 'F' Then
     sTipoInsc := '02';

 if trim(CdsTexto.FieldByName('NUMDOCUMENTO').AsString) = '' then
   sTipoInsc := '99';

 rTotalValorPago := rTotalValorPago + CdsTexto.FieldByName('VALOR').AsFloat;

 sTipoPagamento := '000';
 case CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger of
   18: sTipoPagamento := '018';
   70: sTipoPagamento := '700';
 end;
 WriteLn(ArquivoRemessa,
         Concat('1', // Código do Registro
                'I', //Tipo de Operação
                'PG  ', //Sigla da legenda
                '1', //Codigo de Liberação
                ZD(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do convênio
                '0', // Dac - Opcional
                ZD(CdsEmpresa.FieldByName('NUMCONTA').AsString,8), //Conta do Convênio
                Spc(3), // Brancos
                ZD(CdsTexto.FieldByName('NODOCUMENTO').AsString,15), //Nº Do Título do Cliente
                RemoveBarras(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data Prevista Para Pagto
                '0', //Cod Antecipacao do Pagto
                ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
                '000', //Codigo de finalidade
                Spc(30), //Descricao da finalidade
                CdsTexto.FieldByName('CODFORMAPAGTO').AsString, //Codigo da forma de pagamento
                '0', //Aviso de credito
                '000', //Tipo de Moeda
                Zd('0',15), //Valor em outra moeda
                '000', //Codigo de erro 1
                '000', //Codigo de erro 2
                '0', //Ind. N/numero de cobr
                ZD(IdentificaOrigem +  CdsTexto.FieldByName('CODDOCUMENTO').AsString,18), //Informacao do cliente 3
                sTipoInsc, //Tipo do Cod. do Fornecedor
                AE(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Num Inscricao do Favorecido
                ZD(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido
                '0',
                GetAG(5,True,True),
                GetCC(11,True,True),
                AE(CdsTexto.FieldByName('NOMEAGENCIA').AsString,30), //Nome da Agência
                '00000', //Cep do pagamento
                '000', //Complemento cep do pagamento
                '0', //A ordem
                AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,40), // Nome da Favorecido
                Spc(30), //Logradouro
                Spc(5), //Numero
                Spc(10), //Complemento
                Spc(15), //Bairro
                '00000', //Cep do pagamento
                '000', //Complemento cep do pagamento
                Spc(20), //Cidade
                Spc(2), //Estado
                Spc(11),//Informacoes do cliente
                RemoveBarras(DateToStr(Date)), //Data de movimento
                ' ', //Contra entrega
                '00', //Numero do lote - uso interno do banco
                '0', //Codigo erro retorno
                '000000', //Data ult alteracao, retorno
                sTipoPagamento, //Cod Camara de comp
                ' ', //Interno do banco
                '  ', //Dac da conta com mais de 2 digitos
                '000000',//Num do doc
                '0',//tipo de comunicacao
                '0', //uso interno
                '00',//situacao do titulo no banco
                '00000000', //num do titulo no banco
                ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;
End;

procedure TPagDiversos.DetalheBarrasPagFornReal;
Var
  sBarrasLeitora, sBarrasDig: String;
Begin

With IntBancoManager Do
Begin
 if CdsTexto.FieldByName('CODBARRA').IsNull then
    sBarrasDig := ZE(CdsTexto.FieldByName('CODBARRAVALOR').AsString,47)
 else
    sBarrasLeitora := CdsTexto.FieldByName('CODBARRA').AsString;

 Inc(iTotRegArq);
 WriteLn(ArquivoRemessa,
         Concat('4', // Código do registro
                'I', //Tipo de operacao
                'PG  ', //Sigla da legenda
                '0', //filler
                ZD(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do convênio
                '0', // Dac - Opcional
                ZD(CdsEmpresa.FieldByName('NUMCONTA').AsString,8), //Conta do Convênio
                AE(sBarrasLeitora,44), //Cod Barra leitora
                AE(sBarrasDig,47), //Cod Barra Digitado
                Spc(20), //Nro doc
                Spc(3), //Especie de moeda
                Spc(20), //Ag/Cod Cedente
                Spc(20), //Nosso numero
                Spc(30), //instrucoes
                Spc(30), //instrucoes
                Spc(152), //filler
                '00000000', //nº titulo no banco retorno
               ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;
End;

// Fim Pagamento a Fornecedores Banco Real
// -----------------------------------------------------------------------------

// inicio Folha de Pagamento Banco Real
// -----------------------------------------------------------------------------

procedure TPagDiversos.MontaFolhaPagReal;
begin
  With IntBancoManager Do
  Begin
     Try
          sTipoServicos := Zd(Copy(BuscaParamIntBanco('CATEGORIALANC','S'),1,3),3);

          If sTipoServicos = '000' Then
             sTipoServicos := '001';

          iTotRegArq  := 0;
          rTotalValorPago := 0;

          sPasso := 'Criar Arquivo Para Gravar Os Dados';

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          If CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
             sCodInscEmpresa := '2'
          Else
             sCodInscEmpresa := '1';

          sPasso := 'Montar Header do Arquivo';

          HeaderFolhaPagReal;

          MudaFormaPag; //pendência 26604 //Bruno Bastos - 05/12/2007
          While Not CdsTexto.Eof Do
          Begin
            //Bruno Bastos - 05/12/2007 - MudaFormaPag; //pendência 26604
            DetalheFolhaPagReal;

            //pendência 26926 - 09/01/2008
            if not intBancoManager.bUsaDataIntBanco then
              intBancoManager.DataPagamento := '';

            CdsTexto.Next;
          End;

          TraillerFolhaPagReal;

          CloseFile(ArquivoRemessa);


          sPasso := 'Prepar Visualização do Arquivo';
          MostraArquivo;
          bArquivoCriado:= True;
     Except
          bArquivoCriado:= False;
          MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
     End;
  End;
End;

procedure TPagDiversos.HeaderFolhaPagReal;
Begin
 Inc(iTotRegArq);
 With IntBancoManager Do
 WriteLn(ArquivoRemessa,
         Concat('0', // Tipo do Registro
                spc(8), //Reservado
                '03', // Identificação do Tipo de Serviço
                Ae('CREDITOS em C/C',15), // Descrição do Tipo de Serviço
                Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,20), // Nome da Empresa
                spc(30), // Controle
                '356', // Codigo do Banco
                Ae('Banco Real S.A',15), //Nome do Banco
                RemoveBarras(DateToStr(Date)), //Data Gravação do Arquivo
                '01600', //Densidade da Fita
                'BPI', //Unidade de Densidade de gravação
                Spc(86), //Reservados
                '000001'));
End;

procedure TPagDiversos.DetalheFolhaPagReal;
Begin
  Inc(iTotRegArq);
  With IntBancoManager Do
  Begin
     rTotalValorPago := rTotalValorPago + CdsTexto.FieldByName('VALOR').AsFloat;
     WriteLn(ArquivoRemessa,
             Concat('1', // Código do Registro
                    '0' + sCodInscEmpresa, //Codigo de Inscrição de Impresa
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), //Número de Inscrição
                    Ae(CdsEmpresa.FieldByName('NOME').AsString,20), // Nome da Empresa
                    AE(CdsTexto.FieldByName('CODDOCUMENTO').AsString, 25), // Identificação do Lançamento na Empresa
                    GetAG(4,False,True), // Agencia de Crédito
                    GetCC(7,False,True), // C/C de Crédito
                    ' ', // Dac Fornecido Pelo Banco
                    spc(8), // Reservado
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,40), // Nome da Favorecido
                    RemoveBarras(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data Prevista Para Pagto
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),//Valor Pagto
                    '001', //Tipo de Serviço
                    spc(6), // Controle
                    ZD(Copy(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,1,4),4), //Agência do convênio
                    ZD(Copy(CdsEmpresa.FieldByName('NUMCONTA').AsString,1,7),7), //Conta do Convênio
                    ' ', // DAC fornecido pelo Banco
                    spc(32), // Controle
                    ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
  End;
End;

procedure TPagDiversos.TraillerFolhaPagReal;
Begin
 Inc(iTotRegArq);
 With IntBancoManager Do
 WriteLn(ArquivoRemessa,
         Concat('9', // Código do registro
                ZD(IntToStr(iTotRegArq-2),6),//TotalRegistros
                ZD(RemoveVirgulas(rTotalValorPago,2),15),//Valor Pagto
                Spc(172), //Brancos
                ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

//Folha de Pagamento Bradesco
// -----------------------------------------------------------------------------
procedure TPagDiversos.MontaFolhaPagBradesco;
Var sExtensaoArquivo, sPath: String;
    iContArq: Integer;
Begin
With IntBancoManager Do
Begin
     Try

          MudaFormaPag; //pendência 26604

          If Copy(sPath,Length(sPath),1) <> '\' Then
             sPath := sPath + '\';

          CodigoPortadorForma := CdsTexto.FieldByName('CodPortForma').AsInteger;

          If DataPagamento <> '' Then
             dDataDebito := StrToDate(DataPagamento)
          Else
             dDataDebito := StrToDate(BuscaParamIntBanco('DATADODEBITO','D'));

          If BuscaParamIntBanco('NUMRAZAOCC','N') = '0' Then
             sRazaoConta := '07050'
          Else
             sRazaoConta := ZE(BuscaParamIntBanco('NUMRAZAOCC','N'),5);

          If BuscaParamIntBanco('STATUSREMESSA','N') = '0' Then
             sExtensaoArquivo := '.REM'
          Else
             sExtensaoArquivo := '.TST';

          sNumEmpresaBanco := BuscaParamIntBanco('NUMEMPRESABANCO','N');

          iTotRegArq  := 0;
          rTotalValorPago := 0;

          sPasso := 'Criar Arquivo Para Gravar Os Dados';

          iContArq := 0;
          sPath := SNomeArquivo;

          SNomeArquivo := sPath + 'FP' +Copy(RemoveBarras(DateToStr(Date)),1,4) + IntToStr(iContArq) + sExtensaoArquivo;

          While fileexists(sNomeArquivo) do
          Begin
            Inc(iContArq);
            SNomeArquivo := sPath + 'FP' +Copy(RemoveBarras(DateToStr(Date)),1,4) + IntToStr(iContArq) + sExtensaoArquivo;
          End;

          If iContArq > 9 Then
          Begin
            MsgAviso('O Número máximo de Remessas por dia é de 10 Arquivos','Atenção');
            bArquivoCriado:= False;
            Exit;
          End;

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          If CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
             sCodInscEmpresa := '2'
          Else
             sCodInscEmpresa := '1';

          sPasso := 'Montar Header do Arquivo';

          HeaderFolhaPagBradesco;

          While Not CdsTexto.Eof Do
          Begin
            DetalheFolhaPagBradesco;

            //pendência 26926 - 09/01/2008
            if not intBancoManager.bUsaDataIntBanco then
              intBancoManager.DataPagamento := '';

            CdsTexto.Next;
          End;

          TraillerFolhaPagBradesco;

          CloseFile(ArquivoRemessa);

          sPasso := 'Prepar Visualização do Arquivo';
          MostraArquivo;
          bArquivoCriado:= True;
     Except
       bArquivoCriado:= False;
       MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
       CloseFile(ArquivoRemessa);
       Raise;
     End;
End;
End;

procedure TPagDiversos.HeaderFolhaPagBradesco;
Var
  sDac: String;
Begin
With IntBancoManager Do
Begin
 Inc(iTotRegArq);
 sDac:=Copy(CdsEmpresa.FieldByName('NUMCONTA').AsString,
            Length(Trim(CdsEmpresa.FieldByName('NUMCONTA').AsString)),1);
 WriteLn(ArquivoRemessa,
         Concat('0', // Código do Registro
                '1', // Identificação da Fita Remessa/Retorno
                'REMESSA', // Descrição Identificação da Fita Remessa/Retorno
                '03', //Tipo de Serviço
                Ae('CRÉDITO C/C',15), // Descrição do Tipo de Serviço
//              ZD(copy(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,1,length(CdsEmpresa.FieldByName('NUMAGENCIA').AsString)-1),5), // Código da Agência que a Empresa tem Conta
                GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString, 5, False, True), // Código da Agência que a Empresa tem Conta
                '07050', // Número do Razão da Conta Corrente - Zd(sRazaoConta,5),
                ZD(Copy(CdsEmpresa.FieldByName('NUMCONTA').AsString,1,Length(Trim(CdsEmpresa.FieldByName('NUMCONTA').AsString)) - 1),7), //Contas
                sDac, // Dígito CC
                ' ', //Reservado
                ' ', //Reservado
                Zd(sNumEmpresaBanco,5), //Código Fornecido Pelo Banco
                Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,25), // Nome da Empresa
                '237', //Código do Banco
                Ae('BRADESCO',15), //Nome do Banco
                RemoveBarras(DateToStr(Date)), //Data Gravação do Arquivo
                '01600', //Densidade da Fita
                'BPI', //Unidade de Densidade de gravação
                RemoveBarras(DateToStr(dDataDebito)), //Data de Pagamento /Bruno Bastos - 05/12/2007
                Spc(80), //Reservados
                '000001'));
End;
End;

procedure TPagDiversos.DetalheFolhaPagBradesco;
Begin
With IntBancoManager Do
Begin
 Inc(iTotRegArq);
 rTotalValorPago := rTotalValorPago + CdsTexto.FieldByName('VALOR').AsFloat;

 WriteLn(ArquivoRemessa,
         Concat('1', // Código do Registro
                Spc(61), //Brancos
                GetAG(5,False,True),
                '07050', //Número do Razão da Conta Corrente
                GetCC(8,True,True),
                Spc(2),//Brancos
                AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,40), // Nome da Favorecido
                ZD(CdsTexto.FieldByName('CODDOCUMENTO').AsString,6), //Controle da Empresa
                ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),//Valor Pagto
                '298', // Tipo de Servico
                Spc(6), //Brancos
                Spc(44), //Brnacos
                ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;
End;

procedure TPagDiversos.TraillerFolhaPagBradesco;
Begin
 Inc(iTotRegArq);
 With IntBancoManager Do
 WriteLn(ArquivoRemessa,
         Concat('9', // Código do registro
                ZD(RemoveVirgulas(rTotalValorPago,2),13),//Valor Pagto
               Spc(180), //Brancos
               ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

// Fim Folha de Pagamento Bradesco
// -----------------------------------------------------------------------------

//Pagamento BancoDoBrasil
// -----------------------------------------------------------------------------
procedure TPagDiversos.MontaPagBancoDoBrasil;
Begin
  MudaFormaPag; //pendência 26604

  With IntBancoManager Do
  Begin
     Try
          CodigoPortadorForma := CdsTexto.FieldByName('CodPortForma').AsInteger;

          If DataPagamento <> '' Then
             dDataDebito := StrToDate(DataPagamento)
          Else
             dDataDebito  := StrToDate(BuscaParamIntBanco('DATADODEBITO','D'));

          sConfere     := Copy(BuscaParamIntBanco('INDICACOESCONFERENCIA','S'),1,1);
          sCodServ     := Copy(BuscaParamIntBanco('CODIGODOSERVICO','S'),1,3);

          If (sCodServ = '002') or (sCodServ = '056') Then
            sMensagem    := BuscaParamIntBanco('MENSAGEMPADRAO','S')
          Else
            sMensagem    := '   ';

          sNumConv     := BuscaParamIntBanco('NUMCONVENIO','N');

          iTotRegArq  := 0;
          rTotalValorPago := 0;

          sPasso := 'Criar Arquivo Para Gravar Os Dados';

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          If CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
             sCodInscEmpresa := '2'
          Else
             sCodInscEmpresa := '1';

          sPasso := 'Montar Header do Arquivo';

          HeaderPagBancoDoBrasil;

          While Not CdsTexto.Eof Do
          Begin
            //Bruno Bastos - 05/12/2007 - MudaFormaPag; //pendência 26604
            If DataPagamento <> '' Then
               dDataDebito := StrToDate(DataPagamento)
            Else
               dDataDebito  := StrToDate(BuscaParamIntBanco('DATADODEBITO','D'));
            DetalhePagBancoDoBrasil;

            //pendência 26926 - 09/01/2008
            if not intBancoManager.bUsaDataIntBanco then
              intBancoManager.DataPagamento := '';

            CdsTexto.Next;
          End;

          TraillerPagBancoDoBrasil;

          CloseFile(ArquivoRemessa);

          sPasso := 'Prepar Visualização do Arquivo';
          MostraArquivo;
          bArquivoCriado:= True;
     Except
          bArquivoCriado:= False;
          MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
     End;
  End;
End;

procedure TPagDiversos.HeaderPagBancoDoBrasil;
Begin
With IntBancoManager Do
Begin
 Inc(iTotRegArq);
 WriteLn(ArquivoRemessa,
         Concat('0', // Código do Registro
                '1', // Identificação da Fita Remessa/Retorno
                Spc(7), // Filler - Brancos
                '03', //Tipo de Serviço
                spc(1), // Indica Que Será Usado Nº da Agência ao invés de CGC
                '00000', //Valor da Tarifa a Ser Cobrada
                Spc(9), // Filler - Brancos
                Zd(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5),
                Zd(CdsEmpresa.FieldByName('NUMCONTA').AsString,10),
                Spc(5), // Filler - Brancos
                Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                '001', //Código do Banco
                ZD(sNumConv,6),//Número do Convênio
                'RET', // Tipo de Retorno: RET - Previa e Processamento
                spc(10), //Livre uso do Convenente
                ZD('0',5), // Meio Fisico de Retorno + Contador de Remessas(Utilizado pelo Banco)
                spc(46), //Brancos
                spc(8), // Uso Exclusivo do Sistema
                spc(9), // Uso Exclusivo do Sistema
                'NOVO', //Fixo
                Spc(15),//Brancos
                Spc(9),//Brancos
                '000001'));
End;
End;

procedure TPagDiversos.DetalhePagBancoDoBrasil;
Var
  sCompoDoc, sDocumento, sDvDocumento, sDetMensagem, sDetCodServ,
  sAgencia, sConta, sFormaPagamento, sBanco : String;
Begin
With IntBancoManager Do
Begin
 Inc(iTotRegArq);
 rTotalValorPago := rTotalValorPago + CdsTexto.FieldByName('VALOR').AsFloat;

 If (sConfere = '0') Or (sConfere = '1') Then
    sDocumento := Spc(12)
 Else
    If (sConfere = '2') Or (sConfere = '3') Then
        sDocumento := ZE(Copy(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,1,9),12)
    Else
    If sConfere = '6' Then
        sDocumento := ZE(Copy(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,1,8),12)
    Else
        sDocumento := AE(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,12);

 If (sConfere = '3') or (sConfere = '4') Then
    sDvDocumento := Copy(Trim(CdsTexto.FieldByName('NUMDOCUMENTO').AsString),
                         Length(Trim(CdsTexto.FieldByName('NUMDOCUMENTO').AsString)) - 2,2)
 Else
    sDvDocumento := '  ';

 sDetCodServ  := sCodServ;

 sDetMensagem := sMensagem;

 if (BuscaParamIntBanco('INDICACOESCONFERENCIA','S') = '0') or
    (BuscaParamIntBanco('INDICACOESCONFERENCIA','S') = '1') then
   sCompoDoc := BuscaParamIntBanco('INDICACOESCONFERENCIA','S') + ZD('0',14)
 else
   sCompoDoc := BuscaParamIntBanco('INDICACOESCONFERENCIA','S') + ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14);

 sAgencia    := RetiraEspacos(MascaraAlfa(CdsTexto.FieldByName('NUMAGENCIA').AsString));
//P.RAMOS - CBS - 26.02.2002 - NAO OBRIGAR QUE O CODIGO DA AGENCIA SEJA NUMERICO
// sAgencia    := ZD(Trim(IntToStr(StrToInt(sAgencia))),5);
 sAgencia    := AE(Trim(sAgencia),5);
//P.RAMOS - CBS - 26.02.2002 - ATE AQUI

//P.RAMOS - CBS - 26.02.2002 - NAO OBRIGAR QUE A CONTA CORRENTE SEJA NUMERICO
 sConta      := RetiraEspacos(MascaraAlfa(CdsTexto.FieldByName('CONTACORRENTE').AsString));
// sConta      := ZD(Trim(IntToStr(StrToInt(sConta))),13);
 sConta      := ZD(Trim(sConta),13);
//P.RAMOS - CBS - 26.02.2002 - ATE AQUI
 sFormaPagamento := copy(BuscaParamIntBanco('TIPODERETORNO','S'),1,3);
 if ((sFormaPagamento <> '000') and
     (sFormaPagamento <> '018') and
     (sFormaPagamento <> '700')) then  sFormaPagamento := '000';

 if copy(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,1,3) = '001' then
 begin
   sFormaPagamento := '000';
   sBanco          := '000';
 end
 else
   sBanco          := ZE(copy(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,1,3),3);

 WriteLn(ArquivoRemessa,
          Concat('1', // Código do Registro
                spc(1), // Brancos
                sCompoDoc, //Indicador de Conferencia + CNPJ/CPF
                zd('0',15), //Zeros
                spc(10), //Livre uso do Convenente
                Spc(8), //Brancos
                zd(CdsTexto.FieldByName('NODOCUMENTO').AsString,6), //Numero do Documento
                sFormaPagamento, //Código da Camara Centralizadora
                sBanco, //Cód Banco Destinatário
                sAgencia, //Agencia
                sConta, //Conta Corrente + DV
                Spc(2),//Brancos
                AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,40), // Nome da Favorecido
                RemoveBarras(DateToStr(dDataDebito)), //Data Prevista Para Pagto
                ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),//Valor Pagto
                ZD(sDetCodServ,3),
                AE(sDetMensagem,40),
                Spc(10),
                ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;
End;

procedure TPagDiversos.TraillerPagBancoDoBrasil;
Begin
 Inc(iTotRegArq);
 With IntBancoManager Do
 WriteLn(ArquivoRemessa,
         Concat('9', // Código do registro
                Spc(193), //Brancos
                ZD(IntToStr(iTotRegArq),6))); // Sequencial
End;

// Fim Pagamento BancoDoBrasil

// -----------------------------------------------------------------------------
//Pagamento A Fornecedores Bradesco
// -----------------------------------------------------------------------------
procedure TPagDiversos.MontaPagForneBradesco;
var idModeloCnab : integer;
Begin
  idModeloCnab := 0;
  With IntBancoManager Do
  Begin
     Try
        //  SNomeArquivo        := 'PG'+Copy(RemoveBarras(DateToStr(Date)),1,4)+'A.REM';
          CodigoPortadorForma := CdsTexto.FieldByName('CodPortForma').AsInteger;
          sTipoDoc            := Copy(BuscaParamIntBanco('TIPODEDOCUMENTO','S'),1,2);
          sNumConv            := BuscaParamIntBanco('NUMEMPRESABANCO','N');
          sInstCheque         := BuscaParamIntBanco('INSTRUCOES','S');
          iTotRegArq          := 0;
          rTotalValorPago     := 0;

          sPasso := 'Criar Arquivo Para Gravar Os Dados';

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          If CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
             sCodInscEmpresa := '1'
          Else
             sCodInscEmpresa := '2';

          sPasso := 'Montar Header do Arquivo';

          if sTipoDoc = '' then sTipoDoc := '  ';

          IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
          IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Sql.Text :=
          ' SELECT '+
          '   P.CODARQUIVOREMESSA,                           '+
          '   NVL(P.CONTROLEREMESSA, 0) AS CONTROLEREMESSA,  '+
          '   NVL(M.CONTROLEREMESSA, 0) AS SEQPAGTO,         '+
          '   NVL(M.SEQARQUIVO, 0) AS SEQARQUIVO             '+
          ' FROM PORTADORFORMA P, MODELOSCNAB M              '+
          ' WHERE P.CODPORTFORMA = '+ IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').AsString + ' AND '+
          '       IDPESSOA = ' + inttostr(sistema.idempresa) + ' AND '+
          '       P.CODARQUIVOREMESSA = M.IDMODELOSCNAB AND '+
          '       P.RECPAG = M.RECPAG ';
          IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Open;
          iSeqArquivo  := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('SEQPAGTO').asInteger + 1;
          idModeloCnab := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('CODARQUIVOREMESSA').asInteger;
          iSeqRemessa  := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('SEQARQUIVO').asInteger + 1;

          HeaderPagForneBradesco;

          While Not CdsTexto.Eof Do
          Begin
            MudaFormaPag; //pendência 26604
            DetalhePagForneBradesco;

            //pendência 26926 - 09/01/2008
            if not intBancoManager.bUsaDataIntBanco then
              intBancoManager.DataPagamento := '';

            CdsTexto.Next;
            iSeqArquivo := iSeqArquivo + 1;
          End;

          TraillerPagForneBradesco;

          CloseFile(ArquivoRemessa);

          if iSeqArquivo = 9999999 then
            iSeqArquivo := 0;
          if not IntBancoManager.ExecSQL(
            ' UPDATE MODELOSCNAB SET CONTROLEREMESSA = ' + intToStr(iSeqArquivo) +
            '                      , SEQARQUIVO = ' + intToStr(iseqRemessa)+
            ' WHERE IDMODELOSCNAB = ' + intToStr(idModeloCnab)
            ) then
          begin
            showMessage(IntBancoManager.MessageInfo);
            raise Exception.Create(IntBancoManager.MessageInfo);
          end;

          sPasso := 'Prepar Visualização do Arquivo';
          MostraArquivo;
          bArquivoCriado:= True;

     Except
          bArquivoCriado:= False;
          MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
     End;
  End;
End;

procedure TPagDiversos.HeaderPagForneBradesco;
Var
  sIdentCli, sDocumento, sDacDoc, sDac: String;
Begin
With IntBancoManager Do
Begin
 sDocumento := Copy(Trim(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString),1,
                    Length(Trim(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString))-2);

 sDacDoc :=  Copy(Trim(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString),
                  Length(Trim(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString))-1,
                  2);

 If sCodInscEmpresa = '2' Then
    sIdentCli := Zd(sDocumento,13) + sDacDoc
 Else
    sIdentCli := Zd(sDocumento,9) + '0000' + sDacDoc;

 If CdsEmpresa.FieldByName('NUMCONTA').IsNull Then
    sDac := '0'
 Else
    sDac := Copy(Trim(CdsEmpresa.FieldByName('NUMCONTA').AsString),
                 Length(Trim(CdsEmpresa.FieldByName('NUMCONTA').AsString)),1);

 If CdsEmpresa.FieldByName('NUMAGENCIA').IsNull Then
    sDac := '0'
 Else
    sDac := Copy(Trim(CdsEmpresa.FieldByName('NUMAGENCIA').AsString),
                 Length(Trim(CdsEmpresa.FieldByName('NUMAGENCIA').AsString)),1);


 Inc(iTotRegArq);
 WriteLn(ArquivoRemessa,
         Concat('0', // Código do Registro
                Zd(sNumConv,8),// Identificação da Empresa no Banco
                sCodInscEmpresa, // Tipo Documento
                sIdentCli, //Documento da Empresa
                Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,40), // Nome da Empresa
                '20', //Tipo de Serviço
                '1', //Indica Remessa
//inicio - André TaVARES - pendência 15155 - 02/10/2003
//                Zd(CodArquivoRemessa,5), //Número Sequencial Da Remessa
                Zd(intToStr(iSeqRemessa),5), //Número Sequencial Da Remessa
//fim - André TaVARES - pendência 15155 - 02/10/2003
                '00000', //Número Sequencial Do Retorno
                RemoveBarras3(DateToStr(Date)),//Data da Gravação
                RemovePontos(TimeToStr(Time)),//Hora da Gravação
                Spc(5), // Densidade
                Spc(3), // Unidade Densidade
                spc(5), //Módulo Micro
                '0', //Tipo Processamento
                Spc(74), //Reservado Empresa
                Spc(80), //Reservado Banco
                Spc(234), //Expansão
                '000001'));
End;
End;

procedure TPagDiversos.DetalhePagForneBradesco;
Var
  sIdentCli, sTipoInsc, sInfoCompl, sBarras, sBanco, sMoeda, sDv,
  sCampoLivre, sValor, sDataDesconto, sCarteira, sAnoNossoNumero,
  sNossoBradescoNumero, sValorDesconto, sValorAcrescimo, sValorPagamento,
  DadosBancarios, sNoDocumento,  sAgenciaDV, sCCorrenteDV, sTipoConta, sFormaPgto,
  sNumSeq : String;
  wdia, wmes, wano : word;
  dtaux    : TdateTime;
  i : integer;
  cdsAlter : TcmClientDataSet; //- André Tavares - 23/03/2004 - pendência 16244
  rValorAcrescimo, rValorDesconto : extended; // - André Tavares - 23/03/2004 - pendência 16244
Begin
  //início - André Tavares - 23/03/2004 - pendência 16244
  cdsAlter := TcmClientDataSet.Create(nil); //- André Tavares - 23/03/2004 - pendência 16244
{  sValorDesconto  := '';
  sValorAcrescimo := '';
  sValor          := '';}
  sDataDesconto   := '00000000';
  sValorDesconto  := '000000000000000';
  sValorAcrescimo := '000000000000000';
  sValor          := '000000000000000';

  sValorPagamento := '';
  rValorAcrescimo := 0;
  rValorDesconto  := 0;
  if trim(IntBancoManager.IdentificaOrigem) = '' then
    IntBancoManager.IdentificaOrigem := intToStr(sistema.idmodulo);
  //fim - André Tavares - 23/03/2004 - pendência 16244

  with IntBancoManager do
  begin
     Inc(iTotRegArq);
    rTotalValorPago := rTotalValorPago + CdsTexto.FieldByName('VALOR').AsFloat;
// -----------------------------------------------------------------------------
    if CdsTexto.FieldByName('TIPO').AsString = 'F' then
    begin
      sTipoInsc := '1';
      sIdentCli := Zd(Copy(Trim(CdsTexto.FieldByName('NUMDOCUMENTO').AsString),1,
                           Length(Trim(CdsTexto.FieldByName('NUMDOCUMENTO').AsString))-2),9) + '0000' +
                   Copy(Trim(CdsTexto.FieldByName('NUMDOCUMENTO').AsString),
                        Length(Trim(CdsTexto.FieldByName('NUMDOCUMENTO').AsString))-1,2);
    end
    else
    begin
      sTipoInsc := '2';
      sIdentCli := Zd(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15);
    end;
// -----------------------------------------------------------------------------
    sInfoCompl := '';
    sValor := ZD('0',14);
    if CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3 then
      sInfoCompl := sInstCheque
    else
   { Liquidação de Títulos do Próprio Banco/Pagamento de Títulos de outros Bancos }
// ------------------------------------------------------------------------------
    if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 30) or
       (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 31) then
    begin
      if CdsTexto.FieldByName('CODBARRA').IsNull then
      begin
        {Linha Digitavel}
        if Length(CdsTexto.FieldByName('CODBARRAVALOR').AsString) < 47 then
          sBarras := Copy(CdsTexto.FieldByName('CODBARRAVALOR').AsString, 1,33) +
                     ZD(trim(Copy(CdsTexto.FieldByName('CODBARRAVALOR').AsString, 34, 14)),14)
        else
          sBarras := CdsTexto.FieldByName('CODBARRAVALOR').AsString;
        sBarras     := ZE(sBarras,47);
        sBanco      := Copy(sBarras,1,3);
        sMoeda      := Copy(sBarras,4,1);
        sCampoLivre := Copy(sBarras,5,5) + Copy(sBarras,11,10) + Copy(sBarras,22,10);
        sDv         := Copy(sBarras,33,1);
        sValor      := ZD(Trim(Copy(sBarras,34,14)),14);
      end
      else
      begin
        {Código de Barras}
        sBarras       := CdsTexto.FieldByName('CODBARRA').AsString;
        sBarras       := ZE(sBarras,44);
        sBanco        := Copy(sBarras,1,3);
        sMoeda        := Copy(sBarras,4,1);
        sCarteira     := Copy(sBarras,24,2);
        sDv           := Copy(sBarras,5,1);
        sValor        := ZD(Trim(Copy(sBarras,6,14)),14);
        sCampoLivre   := Copy(sBarras,20,25);
      end;
      sInfoCompl := sCampoLivre + sDv + sMoeda + Spc(13);
    end;

    // andré tavares - se não é Folha ben., emprestimo, folha Pag.
    if (trim(IntBancoManager.IdentificaOrigem) <> '3') and //cap
       (trim(IntBancoManager.IdentificaOrigem) <> '4')  //car
    then
      sValor := ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').asFloat,2),14);

     if trim(sValor) = '00000000000000' then
       sValor := ZD(RemoveVirgulas(PegaValorNominalDocum(cdsTexto.fieldByName('codDocumento').asFloat),2),14);

    // -------------------------------------------------------------------------


    // início - André Tavares - 23/03/2004 - pendência 16244
    // andré tavares - se não é Folha ben., emprestimo, folha Pag.
    if (trim(IntBancoManager.IdentificaOrigem) = '3') or //cap
       (trim(IntBancoManager.IdentificaOrigem) = '4')  //car // tavares pendência 17798 - 28/09/2004
    then
    begin
      cdsAlter.Data := ListaAlteradores(CdsTexto.FieldByName('CODDOCUMENTO').AsFloat); //- André Tavares - 23/03/2004 - pendência 16244
      if (cdsAlter.IsEmpty = false) {and (UsaAlteradorEnvio(cdsTexto.fieldByName('CODPORTFORMA').asFloat) = true)} then
      begin
        cdsAlter.First;
        while not cdsAlter.Eof do
        begin
          if (cdsAlter.fieldByName('RECPAG').asString = 'P') then
          begin
            if (cdsAlter.fieldByName('ACRESDECRES').asString = 'C') then
            begin
              // +
              rValorAcrescimo := rValorAcrescimo + CdsAlter.FieldByName('VALOR').AsFloat;
            end
            else //'D'
            begin
              // -
              rValorDesconto := rValorDesconto + CdsAlter.FieldByName('VALOR').AsFloat;
            end;
          end
          else //'R'
          begin
            if (cdsAlter.fieldByName('ACRESDECRES').asString = 'C') then
            begin
              // -
              rValorDesconto := rValorDesconto + CdsAlter.FieldByName('VALOR').AsFloat;
            end
            else //'D'
            begin
              // +
              rValorAcrescimo := rValorAcrescimo + CdsAlter.FieldByName('VALOR').AsFloat;
            end;
          end;
          cdsAlter.Next;
        end; //while
        sValorPagamento := ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15);//Valor Pagamento - (Valor do Documento + Juros) - Desconto
        sValorAcrescimo := ZD(RemoveVirgulas(rValorAcrescimo,2),15);
        sValorDesconto  := ZD(RemoveVirgulas(rValorDesconto,2),15);
    end else // tavares pendência 17798 - 28/09/2004
    begin
      sValorPagamento := ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15); //andre tavares - pendência 17877 - 06/10/2004
      sDataDesconto   := '00000000';
      sValorDesconto  := '000000000000000';
      sValorAcrescimo := '000000000000000';
    end;

    if trim(svalor) = '' then
    begin
      // andré tavares - se não é Folha ben., emprestimo, folha Pag.
      if (trim(IntBancoManager.IdentificaOrigem) <> '3') and //cap
         (trim(IntBancoManager.IdentificaOrigem) <> '4')  //car
      then
      begin
        sValor := ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').asFloat,2),14);
        sDataDesconto   := '00000000';
        sValorDesconto  := '000000000000000';
        sValorAcrescimo := '000000000000000';
      end
      else
        sValor := ZD(RemoveVirgulas(PegaValorNominalDocum(cdsTexto.fieldByName('codDocumento').asFloat),2),14)
    end;

    end
    else
    begin
      sDataDesconto   := '00000000';
      sValorDesconto  := '000000000000000';
      sValorAcrescimo := '000000000000000';
      sValorPagamento := ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15);
    end;

    if rValorDesconto <> 0 then
      sDataDesconto  := RemoveBarras3(CdsTexto.FieldByName('DATAVENCTO').AsString)
    else
      sDataDesconto  := '00000000';

    // fim - André Tavares - 23/03/2004 - pendência 16244


    // -------------------------------------------------------------------------

    sCampoLivre := Trim(sCampoLivre);
    if ((CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 30) or
       (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 31)) and
       (Copy(Trim(sBarras),1,3) = '237') Then
    begin
      sAnoNossoNumero      := ZD(Copy(sCampoLivre,7,2),3); { Ano Nosso Número If Tipo = 31 e Banco = 237 Else Zeros }
      sNossoBradescoNumero := ZD(Copy(sCampoLivre,9,9),9); { Nosso Número If Tipo = 31 e Banco = 237 Else Zeros }
    end
    else
    begin
      sAnoNossoNumero      := '000';
      sNossoBradescoNumero := '000000000';
    end;

    If (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 30) then
      sNoDocumento := AE(CdsTexto.FieldByName('NODOCUMENTO').AsString,15)
    else
      sNoDocumento := spc(15);

  { ----------------------------------------------------------------------------
    Fábio Barros - 09/08/2001
                   14/02/2002
    Implementação do Calculo do DV da AGÊNCIA e da CONTA CORRENTE nas posições
    99 a 119 do registro de transação.
    ---------------------------------------------------------------------------- }
    if CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 31 then
    begin
      if sBanco = '237' then
      begin
        { Se o Banco for Bradesco, eu não preencho o campo Informações complementares }
        sCarteira      := zd(sCarteira,3);
        sAgenciaDV     := CalculaMod11(Copy(sCampoLivre,1,4), 7);
        sCCorrenteDV   := CalculaMod11(Copy(sCampoLivre,18,7), 7);
        DadosBancarios := '237' +                                             // Banco
                          ZD(Copy(sCampoLivre,1,4),5) + sAgenciaDV +          // Agência e DV da Agência
                          ZD(Copy(sCampoLivre,18,7),13) + AE(sCCorrenteDV,2); // C/C e DV da C/C
      end
      else
      begin
        DadosBancarios := ZE(sBanco,24); // Se o Banco não for Bradesco
                                         // os dados bancários(Agência e C/C) recebem '0'
        sCarteira      := '000'
      end;
    end
    else // Se NÃO for Títulos de Terceiros, pega os dados bancários do cadastro
    begin
      { O DV da conta corrente é ALFANUMERICO }
      DadosBancarios   := AE(Concat(ZD(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //banco Do favorecido
                                    Trim(MascaraAlfa(GetAG(6,True,True))),
                                    Trim(MascaraAlfa(GetCC(13,False,True)))+
                                    AE(COPY(CdsTexto.FieldByName('CONTACORRENTE').AsString,
                                    Length(CdsTexto.FieldByName('CONTACORRENTE').AsString),1),2)
                                    ),24);
      sCarteira  := '000';
      sInfoCompl :=  ' ';
    end;
  { ---------------------------------------------------------------------------- }
    if CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 1 then // Credito em C/C
    begin
      if CdsTexto.FieldByName('TIPOCONTA').AsString = '3' then
        sTipoConta := '2'
      else
        sTipoConta := '1';
    end
    else
      sTipoConta := '0';

  { Para Forma de Pagamento - DOC }
    if CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3 then
      sInfoCompl := 'C' + ZD('0',6) + '01' + spc(31); // Tipo do DOC - C +
                                                      // Número do DOC +
                                                      // Cód. Finalidade do DOC +
                                                      // Brancos

//início 01/08/2003 - André Tavares - pendência 14643
// substituído o sinal de > por >= a pedido da CBS 10/09/2003
      DtmIntBanco.CdsValMaximo.Close;
      DtmIntBanco.sqlValMaximo.prepare;
      DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := CdsTexto.FieldByName('CODPORTFORMA').asString;
      DtmIntBanco.sqlValMaximo.Open;

    if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
       (CdsTexto.FieldByName('VALOR').asFloat >= DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat) and
       (DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat > 0) and (not DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').isnull) then
    begin
      sFormaPgto := DtmIntBanco.CdsValMaximo.FieldByName('CODFORMAPGTOALT').AsString;
//início 26/11/2003 - André Tavares - pendência 15675
      if (not DtmIntBanco.CdsValMaximo.fieldbyname('DMAISALT').isNull) and
         (DtmIntBanco.CdsValMaximo.fieldbyname('DMAISALT').asInteger > 0) then
      begin
        dtaux := CdsTexto.FieldByName('DATAPROGRAMADA').AsDateTime + 1 - CdsTexto.fieldbyname('DMAISALT').asinteger;
        dtaux := DiasUteis.UltDiaUtilAnterior(dtaux, -1,-1,'',true,true,false);
      end
      else
      begin
        dtaux := CdsTexto.FieldByName('DATAPROGRAMADA').AsDateTime + 1;
        dtaux := DiasUteis.UltDiaUtilAnterior(dtaux, -1,-1,'',true,true,false);
      end;
//fim 26/11/2003 - André Tavares - pendência 15675
    end
    else
    begin
      sFormaPgto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
      if trim(dataPagamento) = '' then
        dataPagamento := CdsTexto.FieldByName('DATAPROGRAMADA').AsString;
      dtaux := strToDate(DataPagamento);
    end;
//Fim 01/08/2003 - André Tavares - pendência 14643

//início - André Tavares - 25/09/2003 - pendência 15101
    sNumSeq := '';
    decodedate(date, wano, wmes, wdia);
    sNumSeq := intToStr(wdia)+ intToStr(wmes)+IntToStr(wano)+ intToStr(iSeqArquivo);
//fim - André Tavares - 25/09/2003 - pendência 15101

//início - André Tavares - 02/10/2003 - pendência 15158
   if cdsTexto.FieldByName('CODTIPOPAGTO').asInteger = 1 then
     sTipoConta := '1'
   else if cdsTexto.FieldByName('CODTIPOPAGTO').asInteger = 11 then
     sTipoConta := '2';
//fim - André Tavares - 02/10/2003 - pendência 15158

    WriteLn(ArquivoRemessa,
            Concat('1', // Código do Registro
                   sTipoInsc, //Tipo Identificacao do Fornecedor
                   sIdentCli, //Identificacao do Fornecedor
                   AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                   AE(CdsTexto.FieldByName('LOGRADOURO').AsString,40), //Endereço
                   ZE(CdsTexto.FieldByName('CEP').AsString,8),//Cep
                   DadosBancarios, // Banco, Agencia, DV Agencia, Conta e DV da Conta
//inicio - André Tavares - 25/09/2003 - pendência 15101
//                   AE(CdsTexto.FieldByName('NODOCUMENTO').AsString,16), //Número do Pagamento
                   AE(sNumSeq,16), //Número do Pagamento
//fim - André Tavares - 25/09/2003 - pendência 15101
                   sCarteira, //Carteira
                   sAnoNossoNumero, //Ano Nosso Número
                   sNossoBradescoNumero, //Nosso Número
                   sNoDocumento, //Seu Numero
//                   RemoveBarras3(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data Vencimento
                   RemoveBarras3(FormatDateTime('dd/mm/yyyy', dtaux)), //Data Vencimento
// início - André Tavares - 25/09/2003 - pendência 15096
//                   RemoveBarras3(CdsTexto.FieldByName('DATAVENCTO').AsString), //Dats de Emissao
                   RemoveBarras3(DateToStr(date)), //Dats de Emissao
// fim - André Tavares - 25/09/2003 - pendência 15096

                   sDataDesconto, //Data Limite Para Desconto
                   '0' + sValor, //'0' - Fixo + (Fator de Vencimento + Valor Documento) - Informados na Linha Digitável/Código de Barras
//                   ZD(RemoveVirgulas((CdsTexto.FieldByName('VALOR').AsFloat + CdsTexto.FieldByName('VALORJUROS').AsFloat) -
//                                     CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15),//Valor Pagamento - (Valor do Documento + Juros) - Desconto
                   sValorPagamento, // André Tavares - 23/03/2004 - pendência 16244
                   sValorDesconto,//Valor Desconto
//                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),//Valor Juros
                   sValorAcrescimo, // André Tavares - 23/03/2004 - pendência 16244
                   sTipoDoc,
                   AE(CdsTexto.FieldByName('NODOCUMENTO').AsString,10), //Num Nota Fiscal Fatura
                   AE(CdsTexto.FieldByName('COMPLDOCUMENTO').AsString,2), //Serie Nota Fiscal Fatura
                   ZD(sFormaPgto, 2), //Forma de Pagamento
//início - André Tavares - 17/12/2003 - pendência 15790
//                   RemoveBarras3(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data Vencimento
                   RemoveBarras3(FormatDateTime('dd/mm/yyyy', dtaux)), //Data Vencimento
//fim - André Tavares - 17/12/2003 - pendência 15790
                   Spc(3), //Moeda
                   '01', //Situação do Agendamento
                   Spc(10), //Retorno
                   '0', //Tipo de Movimento
                   '00', //Código do Movimento
                   Spc(40), //Endereço Sacado
                   Spc(40), //Sacador Avalista
                   spc(1), //Reservado
                   spc(1), //Nível - Somento para o Retorno
                   AE(sInfoCompl,40),//Informações Complementares
                   Spc(2),//Código de Área na Empresa
                   AE(CdsTexto.FieldByName('CODDOCUMENTO').AsString,35), //Uso da Empresa
                   Spc(28), //Reserva(22)/Código de Lançamento(5)/Reserva(1)
                   sTipoConta, //Tipo Conta
                   Zd(Copy(Trim(CdsEmpresa.FieldByName('NUMCONTA').AsString),1,Length(Trim(CdsEmpresa.FieldByName('NUMCONTA').AsString)) - 1),7),
                   Spc(8), //Reserva
                   ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
  end;

 cdsAlter.Free;
End;

procedure TPagDiversos.TraillerPagForneBradesco;
Begin
 Inc(iTotRegArq);
 With IntBancoManager Do
 WriteLn(ArquivoRemessa,
         Concat('9', // Código do registro
                ZD(IntToStr(iTotRegArq),6)), //Quantidade de Registros
                ZD(RemoveVirgulas(rTotalValorPago,2),17), // Somatorio dos valores pagos
                Spc(470), //Brancos
                ZD(IntToStr(iTotRegArq),6)); // Total de Registros no Arquivo
End;



//Pagamento CEF
// -----------------------------------------------------------------------------
procedure TPagDiversos.MontaPagCEF;
Begin
   With IntBancoManager Do
   Begin
     Try
          iTotRegArq  := 0;
          rTotalValorPago := 0;

          sPasso := 'Criar Arquivo Para Gravar Os Dados';

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          sPasso := 'Montar Header do Arquivo';

          HeaderPagCEF;

          While Not CdsTexto.Eof Do
          Begin
            MudaFormaPag; //pendência 26604          
            DetalhePagCEF;

            //pendência 26926 - 09/01/2008
            if not intBancoManager.bUsaDataIntBanco then
              intBancoManager.DataPagamento := '';

            CdsTexto.Next;
          End;

          TraillerPagCEF;

          CloseFile(ArquivoRemessa);

          sPasso := 'Prepar Visualização do Arquivo';
          MostraArquivo;
          bArquivoCriado:= True;
     Except
          bArquivoCriado:= False;
          MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
     End;
   End;
End;

procedure TPagDiversos.HeaderPagCEF;
var sDescricao : String;
Begin
 Inc(iTotRegArq);

 With IntBancoManager Do
 begin
   sDescricao := Trim(BuscaParamIntBanco('DESCRICAO','S'));
    
   if sDescricao <> 'DÉBITO AUTOMÁTICO' then
     sDescricao := AE('FOLHA PAGAMENTO',17);

     WriteLn(ArquivoRemessa,
           Concat('A', // Código do Registro
                  '1', // Identificação da Fita Remessa/Retorno
                   Ae(CdsTexto.FieldByName('NUMEMPRESABANCO').AsString,20), //Código do Convênio
                   Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,20), // Nome da Empresa
                  '104', //Código do Banco
                   Ae('CAIXA ECONOMICA FEDERAL',20), //Nome do Banco
                   Copy(RemoveBarras3(DateToStr(Date)),1,8), //Data de Geracao do Arquivo
                   Zd(CodArquivoRemessa,6),
                  '04', //LayOut
                   sDescricao, //Identificação do Serviço
                   Spc(52)));
 end;

End;

procedure TPagDiversos.DetalhePagCEF;
var livre:string;
Begin
 Inc(iTotRegArq);

 With IntBancoManager Do
 begin
 rTotalValorPago := rTotalValorPago + CdsTexto.FieldByName('VALOR').AsFloat; 
 livre := CdsTexto.FieldByName('CODDOCUMENTO').AsString ;
 if trim(CdsTexto.FieldByName('livre').asstring) <> '' then
    livre := CdsTexto.FieldByName('livre').asstring;

 WriteLn(ArquivoRemessa,
         Concat('E', // Código do Registro
                AE(livre,25), //Identificação do Cliente na empresa
                GetAg(4,False,True),
                GetCC(12,True,True),
                '  ',
                Copy(RemoveBarras3(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)),1,8), //Data do Crédito
                ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Crédito
                '03', //Código da Moeda
                AE(CdsTexto.FieldByName('RazaoSocial').asstring,30), // Uso da Empresa. O resto esta na parte de baixo.
                Spc(30), //Uso da Empresa
                Spc(20), //Filer
                '2')); //Código do Movimento
 end;
End;

procedure TPagDiversos.TraillerPagCEF;
Begin
 Inc(iTotRegArq);
 With IntBancoManager Do
 WriteLn(ArquivoRemessa,
         Concat('Z', // Código do registro
                ZD(IntToStr(iTotRegArq),6), // Total de Registros no Arquivo
                zd('0',17),//Zeros
                ZD(RemoveVirgulas(rTotalValorPago,2),17), // Somatorio dos valores pagos
                Spc(109)));
End;

// Fim Pagamento CEF
// -----------------------------------------------------------------------------


//Pagamento Meridional
// -----------------------------------------------------------------------------
procedure TPagDiversos.MontaPagMeridional;
Begin
  With IntBancoManager Do
  Begin

     Try
          iTotRegArq  := 0;
          rTotalValorPago := 0;

          sPasso := 'Criar Arquivo Para Gravar Os Dados';

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          sPasso := 'Montar Header do Arquivo';

          HeaderPagMeridional;

          While Not CdsTexto.Eof Do
          Begin
            MudaFormaPag; //pendência 26604          
            DetalhePagMeridional;

            //pendência 26926 - 09/01/2008
            if not intBancoManager.bUsaDataIntBanco then
              intBancoManager.DataPagamento := '';

            CdsTexto.Next;
          End;

          TraillerPagMeridional;

          CloseFile(ArquivoRemessa);

          sPasso := 'Prepar Visualização do Arquivo';
          MostraArquivo;
          bArquivoCriado:= True;
     Except
          bArquivoCriado:= False;
          MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
     End;
  End;
End;

procedure TPagDiversos.HeaderPagMeridional;
Begin
 Inc(iTotRegArq);
 With IntBancoManager Do
 WriteLn(ArquivoRemessa,
         Concat(zd(CdsTexto.FieldByName('NUMEMPRESABANCO').AsString,9), //Cadum
                zd('0',13),//Zeros
                '05', //Código do Serviço
                '008', //Código do Banco
                'MERIDIONAL', //Nome do Banco
                RemoveBarras3(DateToStr(Date)), //Data de Geracao do Arquivo
                Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,10), // Nome da Empresa Reduzido
                Spc(44),
                '*'));
End;

procedure TPagDiversos.DetalhePagMeridional;
var
 Conta  : string;
Begin
   Inc(iTotRegArq);
   With IntBancoManager Do
   begin

   rTotalValorPago := rTotalValorPago + CdsTexto.FieldByName('VALOR').AsFloat;   
     Conta :=  GetAG(CdsTexto.FieldByName('NUMAGENCIA').AsString,3,False,True) +
               ZD(Trim(FloatToStr(CdsTexto.FieldByName('CONTACORRENTE').AsFloat)),10);

     WriteLn(ArquivoRemessa,
             Concat(ZD(CdsTexto.FieldByName('NUMEMPRESABANCO').AsString,9), //Cadum
                    Conta, // Código do Funcionário
                    '2', //Tipo de Movimento
                    Ae(CdsTexto.FieldByName('RazaoSocial').AsString,40), //Nome do Funcionário
                    Conta, // Agencia + Conta Corrente. O TIPO DA CONTA (C/C, Salario, Poupança) se encontra no numero da CONTA do Funcionário
                    RemoveBarras3(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data do Crédito
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor Crédito
                    Spc(2),
                    '*'));
   end;
End;

procedure TPagDiversos.TraillerPagMeridional;
Begin
 Inc(iTotRegArq);
 With IntBancoManager Do
 WriteLn(ArquivoRemessa,
         Concat(zd(CdsTexto.FieldByName('NUMEMPRESABANCO').AsString,9), //Cadum
                '9999999999999',
                ZD(IntToStr(iTotRegArq),6), // Total de Registros no Arquivo
                ZD(RemoveVirgulas(rTotalValorPago,2),15), // Somatorio dos valores pagos
                Spc(56),
                '*'));
End;

// Fim Pagamento Meridional
// -----------------------------------------------------------------------------

//Pagamento Banespa
// -----------------------------------------------------------------------------
procedure TPagDiversos.MontaPagBanespa;
Begin
  With IntBancoManager Do
  Begin
//     Try
          iTotRegArq      := 0;
          rTotalValorPago := 0;
          rValorC         := 0;
          rValorD         := 0;
          iTotRegC        := 0;
          iTotRegD        := 0;

          sPasso := 'Criar Arquivo Para Gravar Os Dados';

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          sPasso := 'Montar Header do Arquivo';

          HeaderPagBanespa;

          While Not CdsTexto.Eof Do
          Begin
            sPasso := 'Montar Detalhe do Arquivo';
            MudaFormaPag; //pendência 26604          
            DetalhePagBanespa;

            //pendência 26926 - 09/01/2008
            if not intBancoManager.bUsaDataIntBanco then
              intBancoManager.DataPagamento := '';

            CdsTexto.Next;
          End;

          TraillerPagBanespa;

          CloseFile(ArquivoRemessa);

          sPasso := 'Prepar Visualização do Arquivo';
          MostraArquivo;
          bArquivoCriado:= True;
//     Except
//          bArquivoCriado:= False;
//          MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
//          CloseFile(ArquivoRemessa);
//          Raise;
//     End;
  End;
End;

procedure TPagDiversos.HeaderPagBanespa;
Begin
 Inc(iTotRegArq);
 With IntBancoManager Do
 WriteLn(ArquivoRemessa,
         Concat('0', //Código do Registro
                '1', //Indica Remessa
                'REMESSA', //Literal da Remessa
                '03', //Código do Serviço
                Ae('CREDITO EM C/C',14), //Literal do Serviço
                Ae(CdsTexto.FieldByName('NUMEMPRESABANCO').AsString,4), //Código da Empresa no Banco
                Spc(17), //Brancos
                Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa Reduzido
                '033', //Nº do Banco
                Ae('BANESPA',15), //Nome do banco
                RemoveBarras(DateToStr(Date)), //Data de Geracao do Arquivo
                '00000', //Densidade da Fita
                'BPI', //Unidade de Densidade
                '01', // Versao do Layout
                Spc(84),//Brancos
                '000001'));
End;

procedure TPagDiversos.DetalhePagBanespa;
Var
 sIdCreditado, sAgencia : String;
 iDv, iConta: Integer;
Begin
  Try
    With IntBancoManager Do
    Begin
     Inc(iTotRegArq);

     If CdsTexto.FieldByName('DEBCRE').AsString = 'D' Then
     Begin
       rValorD := rValorD + CdsTexto.FieldByName('VALOR').AsFloat;
       Inc(iTotRegD);
     End
     Else
     Begin
       rValorC := rValorC + CdsTexto.FieldByName('VALOR').AsFloat;
       inc(iTotRegC);
     End;

     sAgencia     := GetAg(CdsTexto.FieldByName('NUMAGENCIA').AsString,3,False,True);

     sIdCreditado := sAgencia + ZD(CdsTexto.FieldByName('CONTACORRENTE').AsString,8);
     iConta := (7 * StrToInt(Copy(sIdCreditado,1,1))) +
               (3 * StrToInt(Copy(sIdCreditado,2,1))) +
               (1 * StrToInt(Copy(sIdCreditado,3,1))) +
               (9 * StrToInt(Copy(sIdCreditado,4,1))) +
               (7 * StrToInt(Copy(sIdCreditado,5,1))) +
               (1 * StrToInt(Copy(sIdCreditado,6,1))) +
               (3 * StrToInt(Copy(sIdCreditado,7,1))) +
               (1 * StrToInt(Copy(sIdCreditado,8,1))) +
               (9 * StrToInt(Copy(sIdCreditado,9,1))) +
               (7 * StrToInt(Copy(sIdCreditado,10,1))) +
               (3 * StrToInt(Copy(sIdCreditado,11,1)));

     iDv := 10 - StrToInt(Copy(IntToStr(iConta),Length(IntToStr(iConta)),1));

     if iDv = 10 then iDV := 0;

     sIdCreditado := sIdCreditado + IntToStr(iDv);

     rTotalValorPago := rTotalValorPago + CdsTexto.FieldByName('VALOR').AsFloat;

     WriteLn(ArquivoRemessa,
             Concat('1', //Código do Registro
                    '02',//Código de Inscrição da Empresa - CGC
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição da Empresa
                    Ae(CdsTexto.FieldByName('NUMEMPRESABANCO').AsString,4), //Código da Empresa no banco
                    Spc(16),//Brancos
                    Ae(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString,25), //identificação do Título na empresa
                    sIdCreditado, //Código do Creditado
                    Spc(8), //Brancos
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,40), // Nome da Favorecido
                    RemoveBarras(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data do Lançamento
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),//Valor do Lançamento
                    '001', //Tipo de Serviço
                    '021', // Identidicador para o extrato - ZD(CodArquivoRemessa + IntToStr(iTotRegArq),3),
                    Spc(3), //Branco
                    'C', //SINAL
                    Spc(3), //Brancos
                    Ae(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString,14), //identificação do Título na empresa
                    Spc(26), //Brancos
                    ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
    End;
  except
    Raise;
  end;

End;

procedure TPagDiversos.TraillerPagBanespa;
Begin
 Inc(iTotRegArq);
 With IntBancoManager Do
 WriteLn(ArquivoRemessa,
         Concat('9', //Id Do Registro
                Spc(149), //Branco
                ZD(IntToStr(iTotRegD),6), //Total de Registros a Débito
                ZD(RemoveVirgulas(rValorD,2),15), // Somatorio dos valores a Débito
                ZD(IntToStr(iTotRegC),6), //Total de Registros a Crédito
                ZD(RemoveVirgulas(rValorC,2),15), // Somatorio dos valores a Crédito
                Spc(2),
                ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

// Fim Pagamento Banespa
// -----------------------------------------------------------------------------

//Tranferencia Bancára - banco do Brasil

Procedure TPagDiversos.TransfBB;
Begin
  With IntBancoManager Do
  Begin
     Try
          CodigoPortadorForma := CdsTexto.FieldByName('CodPortForma').AsInteger;

          sAgenciaCentral := Trim(BuscaParamIntBanco('AGENCIACENTRALBB','S'));
          sContaCentral := Trim(BuscaParamIntBanco('CONTACENTRALBB','S'));

          If (sCodServ = '002') or (sCodServ = '026') Then
             sMensagem    := BuscaParamIntBanco('MENSAGEMPADRAO','S')
          Else
             sMensagem    := '   ';

          sNumConv     := BuscaParamIntBanco('NUMCONVENIO','N');

          //Alterado para a Claudia solicitado pela Aneliza para a Refer em 20/06/2001
          If StrToIntDef(sNumConv,0) = 0 Then
             sNumConv := CdsTexto.FieldByName('NUMEMPRESABANCO').AsString;

          iTotRegArq  := 0;
          rTotalValorPago := 0;

          sPasso := 'Criar Arquivo Para Gravar Os Dados';

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          If CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
             sCodInscEmpresa := '2'
          Else
             sCodInscEmpresa := '1';

          sPasso := 'Montar Header do Arquivo';

          HeaderTransfBB;

          While Not CdsTexto.Eof Do
          Begin
            MudaFormaPag; //pendência 26604
            DetalhetransfBB;

            //pendência 26926 - 09/01/2008
            if not intBancoManager.bUsaDataIntBanco then
              intBancoManager.DataPagamento := '';

            CdsTexto.Next;
          End;

          TraillerTransfBB;

          CloseFile(ArquivoRemessa);

          sPasso := 'Prepar Visualização do Arquivo';
          MostraArquivo;
          bArquivoCriado:= True;
     Except
          bArquivoCriado:= False;
          MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
     End;
  End;
End;

Procedure TPagDiversos.HeaderTransfBB;
Begin
   With IntBancoManager Do
   Begin
    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
            Concat('0', // Código do Registro
                   '1', // Identificação da Fita Remessa/Retorno
                   Spc(7), // Filler - Brancos
                   '03', //Tipo de Serviço
                   ' ', // Indica Que Será Usado Nº da Agência ao invés de CGC
                   '00000', //Valor da Tarifa a Ser Cobrada
                   Spc(9), // Filler - Brancos
                   Zd(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5),
                   Zd(CdsEmpresa.FieldByName('NUMCONTA').AsString,10),
                   Spc(5), // Filler - Brancos
                   Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                   '001', //Código do Banco
                   ZD(sNumConv,6),//Número do Convênio
                   'RET', //Layout Prg Clipper
                   Spc(10),//Layout Prg Clipper
                   '05',//Layout Prg Clipper
                   Spc(66),//Layout Prg Clipper
                   'NOVO',//Layout Prg Clipper
                   sPC(24),//Layout Prg Clipper
                   '000001'));
   End;
End;


Procedure TPagDiversos.DetalhetransfBB;
Begin
  Inc(iTotRegArq);
  With IntBancoManager Do
  Begin

   If DataPagamento <> '' Then
      dDataDebito := StrToDate(DataPagamento)
   Else
      dDataDebito := CdsTexto.FieldByName('DATAPROGRAMADA').AsDateTime;

   WriteLn(ArquivoRemessa,
           Concat('1', // Código do Registro
                  ' ', //Brancos
                  '8', //Indica CPF
                  ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //CPF
                  Zd('0',15), // Agencia + Dv + Conta + Dv Participante
                  AE(IdentificaOrigem +  CdsTexto.FieldByName('CODDOCUMENTO').AsString,24), //Uso da Empresa, Identificação do título
                  '000', //Cod Cam. Compe
                  Spc(3),
                  AE(sAgenciaCentral,5),
                  AD(sContaCentral,13),
                  '  ',
                  AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,40), // Nome da Favorecido
                  RemoveBarras(DateToStr(dDataDebito)), //Data Prevista Para Pagto
                  ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),//Valor Pagto
                  '036', //Código do Serviço
                  Spc(50),//Brancos
                  ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
  End;
End;

Procedure TPagDiversos.TraillerTransfBB;
Begin
  Inc(iTotRegArq);
  With IntBancoManager Do
  WriteLn(ArquivoRemessa,
          Concat('9', // Código do registro
                 Spc(193), //Brancos
                 ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;
{Fim Tranferencia Bancára - banco do Brasil}


{ BANCO DE BOSTON - Pré-Cadastramento de FORNECEDOR }
procedure TPagDiversos.HeaderBKBForn;
begin
   With IntBancoManager Do
   Begin
    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
            Concat('0', // Identificação do Registro
                   '1', // Identificação do Arquivo de Remessa
                   'REMESSA', // Identificação por Extenso
                   '11', // Tipo de Serviço
                   AE('PAGAMENTO',15), // Tipo de Serviço por extenso
                   AE(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,8), //Código do Convênio
                   spc(3), //Brancos
                   ZD(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,7), //Agência do convênio
                   spc(2), //Brancos
                   Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                   '479', // Numero do Banco
                   AE('BANCO DE BOSTON',15), // Nome do Banco
                   RemoveBarras(DateToStr(Date)), //Data de Geracao do Arquivo
                   spc(288), // Brancos
                   Zd(CodArquivoRemessa,6), //Número Sequencial da Remessa
                   '000001'));
   End;
end;


procedure TPagDiversos.DetalheBKBForn;
var sTipoInsc, sBarra : String;
begin
 with IntBancoManager do
 begin
  If CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
     sTipoInsc := '01'
  Else
     sTipoInsc := '02';

   if CdsTexto.FieldByName('CODBARRA').IsNull then
     sBarra := CdsTexto.FieldByName('CODBARRAVALOR').AsString
   else
     sBarra := CdsTexto.FieldByName('CODBARRA').AsString;

  Inc(iTotRegArq);
  With IntBancoManager Do
  Begin
   If DataPagamento <> '' Then
      dDataDebito := StrToDate(DataPagamento)
   Else
      dDataDebito := CdsTexto.FieldByName('DATAPROGRAMADA').AsDateTime;

   WriteLn(ArquivoRemessa,
           Concat('1', // Identificação do Registro
                  sTipoInsc, // Identificação - 01(CGC) 02(CPF)
                  ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Ident. do Cliente(CGC/CPF)
                  AE(CdsTexto.FieldByName('NUMEMPRESABANCO').AsString,8), //Código do Convênio
                  spc(3), // Brancos
                  ZD(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,7), //Agência do Cliente no Banco
                  spc(2), // Brancos
                  ZD(IdentificaOrigem +  CdsTexto.FieldByName('CODDOCUMENTO').AsString,25), //Campo Livre
                  ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), // Ident. do Fornecedor(CGC/CPF)
                  'DUP', // Tipo Compromisso
                  AE(CdsTexto.FieldByName('NODOCUMENTO').AsString,10), // Identificacao do Compromisso
                  spc(1), // Sequencia do Compromisso
                  'TA', // Identificação do Serviço
                  spc(15), // Brancos
                  'C', // Código da Operação
                  '01', // Tipo da Operação - Inclusão
                  spc(10), // Uso do Cliente
                  RemoveBarras(CdsTexto.FieldByName('DATAVENCTO').AsString), // Vencimento
                  ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13), // Valor
                  'DOC', // Tipo de Pagamento
                  ZE(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), // Banco Destinatario
                  GetAG(7,True,True), // Agencia do Destinatario
                  '000', // ZEROS
                  GetCC(10,True,True), // Conta Corrente do Destinatario
                  spc(20), // Nome da Agencia do destinatario
                  ZD(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,7), //Agência do Cliente no Banco
                  Ae(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,53), // Nome do Fornecedor
                  spc(5), // Brancos
                  ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), // Valor de ABATIMENTO
                  AE(sBarra,44), // Codigo de Barra
                  spc(40), // Descricao de Compromisso

                  //inicio - andre tavares - pendência 21789 - 20/03/2006
                  //ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), // Valor de JUROS/MULTA
                  ZD('0',13),
                  //fim - andre tavares - pendência 21789 - 20/03/2006

                  RemoveBarras(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data Prevista Para Pagto
                  ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13), // Valor Autorizado
                  AE('R$',4), // Moeda do Compromisso
                  'N', // Pré-Cadastramento de Fornecedor
                  spc(10), // Brancos
                  ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
  End;
 end;
end;

procedure TPagDiversos.TraillerBKBForn;
begin
  Inc(iTotRegArq);
  With IntBancoManager Do
  WriteLn(ArquivoRemessa,
          Concat('9', // Identificacao do registro
                 ZD('0',54), // Somatorios : CPF/CGC - Valor Original - Data de Pagamento
                 spc(339), // Brancos
                 ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo

end;

procedure TPagDiversos.MontaPagForBoston;
begin
  With IntBancoManager Do
  begin
    try
      iTotRegArq  := 0;
      rTotalValorPago := 0;
      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);

      if CdsEmpresa.FieldByName('TIPO').AsString = 'F' then
         sCodInscEmpresa := '2'
      else
         sCodInscEmpresa := '1';

      HeaderBKBForn;

      While Not CdsTexto.Eof Do
      begin
        MudaFormaPag; //pendência 26604          
        DetalheBKBForn;

        //pendência 26926 - 09/01/2008
        if not intBancoManager.bUsaDataIntBanco then
          intBancoManager.DataPagamento := '';

        CdsTexto.Next;
      end;

      TraillerBKBForn;

      CloseFile(ArquivoRemessa);

      MostraArquivo;
      bArquivoCriado:= True;
    except
      bArquivoCriado:= False;
      MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
      CloseFile(ArquivoRemessa);
      raise;
    end;
  end;
end;

procedure TPagDiversos.DetalheBanrisulCC;
begin
 with IntBancoManager do
 begin
    Inc(iTotRegArq);

    CdsAux.Data := GetDataPacket('SELECT CONTACORRENTE FROM CONTABANCARIA WHERE ' +
                                 ' FLGCONTAPREF = 1 AND' +
                                 ' IDPESSOA = ' + Trim(CdsTexto.FieldByName('IDPESSOA').AsString));

    MudaFormaPag; //pendência 26604

    with IntBancoManager do
    begin
     if DataPagamento <> '' then
       dDataDebito := StrToDate(DataPagamento)
     else
       dDataDebito := CdsTexto.FieldByName('DATAPROGRAMADA').AsDateTime;
     rValorC    := rValorC + CdsTexto.FieldByName('VALOR').AsFloat;
     WriteLn(ArquivoRemessa,
             Concat('BCZF01',
                    '1',
                    spc(6),
                    spc(10),
                    GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,3, False, True),
                    spc(2),
                    ZD(CdsTexto.FieldByName('LIVRE').AsString,8),
                    GetCC(CdsAux.FieldByName('CONTACORRENTE').AsString,10, True, True),
                    Ae(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,35),
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),
                    '1',
                    AE(copy(RemoveBarras(DateToStr(Date)),3,4),15),
                    spc(17),
                    '*'));
    End;
    if CdsAux.Active then CdsAux.Close;
 end;
end;

procedure TPagDiversos.HeaderBanrisulCC;
begin
  With IntBancoManager Do
  Begin
//    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
            Concat('BCZF00',
                   spc(22),
                   RemoveBarras(DateToStr(Date)), //Data de Geracao do Arquivo
                   RemovePontos(TimeToStr(Time)), //Hora Gravação do Arquivo
                   GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString, 3, False, True), //Agência do convênio
                   GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 10, True, True), //Conta Corrente
                   spc(74),
                   '*'));
  end;
end;

procedure TPagDiversos.TraillerBanrisulCC;
begin
  With IntBancoManager Do
  Begin
    WriteLn(ArquivoRemessa,
            Concat('BCZF99',
                   spc(22),
                   ZD('0',7),
                   ZD('0',15),
                   ZD(IntToStr(iTotRegArq),7),
                   ZD(RemoveVirgulas(rValorC,2),15),
                   spc(55),
                   '*'));
  end;
end;

procedure TPagDiversos.MontaLancamentoCCBanrisul;
var slArquivo : String;
begin
  With IntBancoManager Do
  begin
    try
      {Nome do Arquivo a ser Gerado}
      slArquivo := 'SRA' + FormatDateTime('DDMM',Date) + CodArquivoRemessa + '.ENT';

      sNomeArquivo := ExtractFilePAth(sNomeArquivo) + slArquivo;
      iTotRegArq := 0;
      rValorC    := 0;
      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);

      HeaderBanrisulCC;
      While Not CdsTexto.Eof Do
      begin
        MudaFormaPag;
        DetalheBanrisulCC;

        //pendência 26926 - 09/01/2008
        if not intBancoManager.bUsaDataIntBanco then
          intBancoManager.DataPagamento := '';

        CdsTexto.Next;
      end;
      TraillerBanrisulCC;
      CloseFile(ArquivoRemessa);
      MostraArquivo;
      bArquivoCriado:= True;
    except
      bArquivoCriado:= False;
      MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
      CloseFile(ArquivoRemessa);
      raise;
    end;
  end;
end;

procedure TPagDiversos.HeaderPagamentoBBV;
begin
  With IntBancoManager Do
  Begin
    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
            Concat('000',
                   'REMESSA',
                   ZD(Trim(IntToStr(CdsEmpresa.FieldByName('NUMAGENCIA').AsInteger)),3), //Agência do convênio
                   spc(1), //Brancos
                   ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,15), //CNPJ/CPF do Cliente
                   ZD(CdsTexto.FieldByName('CODTIPOPAGTO').AsString,2), //Código da Modalidade
                   RemoveBarras(DateToStr(Date)), //Data do Movimento
                   '641', //Numero do Banco na Compensação
                   AE('BBV BANCO',20), // Nome do Banco por extenso
                   Zd(CodArquivoRemessa,5), //Número Sequencial Da Remessa
                   zd('0',15), // Controle Interno
                   spc(265), //Brancos
                   '00001', // Numero sequencial do registro
                   spc(50)));
  end;
end;

procedure TPagDiversos.DetalhePagamentoBBV;
var sTipoInsc : String;
begin
  with IntBancoManager do
  begin
    If CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
       sTipoInsc := '01'
    Else
       sTipoInsc := '02';
    Inc(iTotRegArq);

    WriteLn(ArquivoRemessa,
             Concat('001', //Código do Registro
                    zd(CdsTexto.FieldByName('CODFORMAPAGTO').AsString,2), //Forma de Pagamento
                    'R$   ', //Moeda
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15), //Valor
                    SPC(15), // Brancos
                    RemoveBarras(CdsTexto.FieldByName('DATAVENCTO').AsString), //Vencimento
                    RemoveBarras(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data Prevista Para Pagto
                    Ae(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,36), //Nome do Favorecido
                    ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //Ident. do Cliente(CGC/CPF)
                    AE(Copy(CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                            CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                            CdsTexto.FieldByName('COMPLEMENTO').AsString,1,35),35), //Endereço
                    AE(CdsTexto.FieldByName('CIDADE').AsString,15), //Cidade
                    AE(CdsTexto.FieldByName('CODESTADO').AsString,2), //Estado
                    AE(CdsTexto.FieldByName('CEP').AsString,8), //Cep

                    ZE(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido
                    GetAG(5,True,True), //Agencia do Favorecido
                    GetCC(11,True,True), //Conta Corrente do Favorecido
                    AE(CdsTexto.FieldByName('CODBARRA').AsString,44), //Código de Barra
                    SPC(16), //Brancos
                    AE(CdsTexto.FieldByName('CODDOCUMENTO').AsString,10), //Seu Numero
                    spc(40), //Historico
                    ZD('0',16), //Nosso Numero
                    spc(37), //Brancos
                    ZD(IntToStr(iTotRegArq),5), //Sequencial de Registro
                    AE(CdsTexto.FieldByName('CODBARRAVALOR').AsString,47), // Linha digitável do Cod. Barras
                    spc(3)));
 end;
end;

procedure TPagDiversos.TraillerPagamentoBBV;
begin
  With IntBancoManager Do
  Begin
  inc(iTotRegArq);
  WriteLn(ArquivoRemessa,
            Concat('999',
                   spc(342),
                   ZD(IntToStr(iTotRegArq),5),
                   spc(50)));
  end;
end;

procedure TPagDiversos.MontaPagamentoBBV;
begin
  With IntBancoManager Do
  begin
    try
      iTotRegArq := 0;
      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);
      HeaderPagamentoBBV;
      While Not CdsTexto.Eof Do
      begin
        MudaFormaPag; //pendência 26604
        DetalhePagamentoBBV;

        //pendência 26926 - 09/01/2008
        if not intBancoManager.bUsaDataIntBanco then
          intBancoManager.DataPagamento := '';

        CdsTexto.Next;
      end;
      TraillerPagamentoBBV;
      CloseFile(ArquivoRemessa);
      MostraArquivo;
      bArquivoCriado:= True;
    except
      bArquivoCriado:= False;
      MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
      CloseFile(ArquivoRemessa);
      raise;
    end;
  end;
end;

procedure TPagDiversos.MontaPagamentoFornecedorSantander;
begin
  With IntBancoManager Do
  begin
    try
      iTotRegArq := 0;
      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);
      HeaderPagFornSantander;
      While Not CdsTexto.Eof Do
      begin
        MudaFormaPag; //pendência 26604
        DetalhePagFornSantander;
        DetalhePagFornCompSantander;

        //pendência 26926 - 09/01/2008
        if not intBancoManager.bUsaDataIntBanco then
          intBancoManager.DataPagamento := '';

        CdsTexto.Next;
      end;
      TraillerPagFornSantander;


      CloseFile(ArquivoRemessa);
      MostraArquivo;
      bArquivoCriado:= True;
    except
      bArquivoCriado:= False;
      MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
      CloseFile(ArquivoRemessa);
      raise;
    end;
  end;

end;



procedure TPagDiversos.HeaderPagFornSantander;
begin
  With IntBancoManager Do
  Begin
    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
            Concat('0',
                   '1',
                   'REMESSA',
                   '11', //Código de Serviço
                   'PAGTOS FORNECED',
                   GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 8, True, True), //Conta Movimento Cliente
                   spc(3), //Brancos
                   GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString, 7, True, True), //Código da Agência do Cliente
                   spc(2), //Brancos
                   AE(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString, 30), //
                   '353', //Código do Banco
                   AE('SANTANDER',15), //Nome do Banco
                   RemoveBarras(DateToStr(Date)), //Data de Gravação
                   spc(288), //Brancos
                   ZD('0',6), //Volume Gravado
                   '000001' ));// Numero sequencial do registro
  end;
end;

procedure TPagDiversos.DetalhePagFornSantander;
var
  sTipoInscCliente,
  sTipoInscFornecedor,
  sCodFormPagto,
  sCondicao : String;
begin
  with IntBancoManager do
  begin
    if CdsEmpresa.FieldByName('TIPO').AsString = 'J' then
       sTipoInscCliente := '01'
    else
       sTipoInscCliente := '02';

    if CdsTexto.FieldByName('TIPO').AsString = 'J' then
       sTipoInscFornecedor := '1'
    else
       sTipoInscFornecedor := '2';
// -----------------------------------------------------------------------------
    sCodFormPagto := 'DOC';

    sCondicao     :=  ZD(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString, 3) + //Cód. Banco de Crédito
                      GetAG(7, True, True) + //Código da Agência de Crédito
                      '000' + //Câmara de Compensação
                      GetCC(10, True, True); //Número da Conta Corrente de Crédito

// -----------------------------------------------------------------------------
    try
      case CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger of
      1:  sCodFormPagto := 'DOC';
      2:  sCodFormPagto := 'CHQ';
      3:  sCodFormPagto := 'C/C';
      31: sCodFormPagto := 'BLQ';
      4:  sCodFormPagto := 'STR';
      5:  sCodFormPagto := 'CIP';
      end;
      case CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger of
        2,3,31:  sCondicao :=  ZD('0', 23);
      end;
    except
    end;
// -----------------------------------------------------------------------------

    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
             Concat('1', //Código do Registro
                    sTipoInscCliente, //Tipo de Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), //Ident. do Cliente(CGC/CPF)
                    GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 8, True, True), //Conta Movimento Cliente
                    spc(3), //Brancos
                    GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString, 7, True, True), //Código da Agência Cliente
                    spc(27), //Brancos
                    ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Ident. do Fornecedor
                    sTipoInscFornecedor, //Tipo de Inscrição do Fornecedor
                    spc(30), //Brancos
                    'F', //Tipo de Operação
                    '01', //Código de Ocorrência
                    spc(29), //Brancos
                    sCodFormPagto, //Tipo de Pagamento
                    sCondicao, // Ver na atribuicao de valor desta variavel
                    spc(20), //Nome da Agência(opcional)
                    FuncaoGeral.Decode(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString, '353', 'S', 'N'), //Identificação de Correntista
                    GetAG(7,  True, True), //Cód. Agência do Fornecedor
                    GetAG(10, True, True), //Número da Conta do Fornecedor
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,45), //Nome do Fornecedor

                    AE(Copy(CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                            CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                            CdsTexto.FieldByName('COMPLEMENTO').AsString,1,30),30), //Endereço
                    AE(CdsTexto.FieldByName('CIDADE').AsString,20), //Bairro
                    AE(CdsTexto.FieldByName('CIDADE').AsString,20), //Cidade
                    AE(CdsTexto.FieldByName('CODESTADO').AsString,2), //Estado
                    AE(CdsTexto.FieldByName('CEP').AsString,8), //Cep
                    ZD('0',15), // DDD + Telefone + Ramal
                    GetAG(7, True, True), //Cód. Agência de Pagamento
                    ZD('0',24),
                    spc(20), //Brancos
                    ZD(IntToStr(iTotRegArq),6)));
  end;
end;

procedure TPagDiversos.DetalhePagFornCompSantander;
var
  sTipoInscCliente,
  sCodFormPagto,
  sHoraTed,
  sAgenciaCred,
  sContaCred,
  sBarras, sBanco, sMoeda, sCampoLivre, sDv, sValor, sCodBarra: String;
begin
  with IntBancoManager do
  begin

    if CdsEmpresa.FieldByName('TIPO').AsString = 'J' then
      sTipoInscCliente := '01'
    else
      sTipoInscCliente := '02';

    sCodFormPagto := 'DOC';
    try
      case CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger of
        1:  sCodFormPagto := 'DOC';
        2:  sCodFormPagto := 'CHQ';
        3:  sCodFormPagto := 'C/C';
        31: sCodFormPagto := 'BLQ';
        4:  sCodFormPagto := 'STR';
        5:  sCodFormPagto := 'CIP';
      end;
    except
    end;

    if (sCodFormPagto = 'STR') or (sCodFormPagto = 'CIP') then
      sHoraTed := RemovePontos(Copy(TimeToStr(Time),1,5))
    else
      sHoraTed := '0000';


    sAgenciaCred := GetAG(7, True, True);
    sContaCred   := GetCC(10, True, True);

// ----------------------------- CODIGO DE BARRAS ------------------------------
    If CdsTexto.FieldByName('CODBARRA').IsNull Then
    begin
    { Fábio Barros - Coloquei esse filtro porque existem boletos que NÃO possuem
      o VALOR DO BOLETO na linha Digitável }
      if Length(CdsTexto.FieldByName('CODBARRAVALOR').AsString) < 47 then
        sBarras := Copy(CdsTexto.FieldByName('CODBARRAVALOR').AsString, 1,33) +
                   ZD(trim(Copy(CdsTexto.FieldByName('CODBARRAVALOR').AsString, 34, 14)),14)
      else
        sBarras := CdsTexto.FieldByName('CODBARRAVALOR').AsString;
     sBarras     := ZE(sBarras,47);
     sBanco      := Copy(sBarras,1,3);
     sMoeda      := Copy(sBarras,4,1);
     sCampoLivre := Copy(sBarras,5,5) + Copy(sBarras,11,10) + Copy(sBarras,22,10);
     sDv         := Copy(sBarras,33,1);
     sValor      := ZD(Trim(Copy(sBarras,34,14)),14);

    end
    else
    begin
      {
      Código de Barras
      Não é necessário verificar se o boleto possui valor, porque
      os boletos que não possuem, são completados automaticamente com ZEROS.
       }
      sBarras     := CdsTexto.FieldByName('CODBARRA').AsString;
      sBarras     := ZE(sBarras,47);
      sBanco      := Copy(sBarras,1,3);
      sMoeda      := Copy(sBarras,4,1);
      sDv         := Copy(sBarras,5,1);
      sValor      := ZD(Trim(Copy(sBarras,6,14)),14);
      sCampoLivre := Copy(sBarras,20,25);
    end;
    sCodBarra     := sBanco + sMoeda + sDV + sValor + sCampoLivre;

    // -------------------------------------------------------------------------
    if CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger <> 3 then //Bloqueto
    begin
      {Se a forma de pagamento for BLOQUETO e o boleto for do SANTANDER,
       eu pego do próprio boleto a Agência e a Conta do FORNECEDOR}
      if sBanco = '353' then
      begin
        sAgenciaCred := ZD(Copy(sCampoLivre, 1, 4),7);
        sContaCred   := ZD(Copy(sCampoLivre, 5, 8),10);
      end;
      sBanco := ZD(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3);
    end;
   // -------------------------------------------------------------------------

// ----------------------------- CODIGO DE BARRAS ------------------------------

    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
             Concat('1', //Código do Registro
                    sTipoInscCliente, //Tipo de Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), //Ident. do Cliente(CGC/CPF)
                    GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 8, True, True), //Conta Movimento Cliente
                    spc(3), //Brancos
                    GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString, 7, True, True), //Código da Agência Cliente
                    spc(27), //Brancos
                    ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Ident. do Fornecedor
                    BuscaParamIntBanco('TIPODOCUMENTO','S'),
                    ZD(CdsTexto.FieldByName('NODOCUMENTO').AsString,10), // Número do Compromisso
                    '0', //Seq. do Compromisso(opcional)
                    spc(17), //Brancos
                    'C', //Tipo de Operação
                    '01', // Tipo de Transação
                    ZD(CdsTexto.FieldByName('CODDOCUMENTO').AsString,10), // Número do Compromisso p/Fornecedor
                    RemoveBarras(CdsTexto.FieldByName('DATAPROGRAMADA').AsString), // Data de Vencimento

                    //inicio - andre tavares - pendência 21789 - 20/03/2006
                    ZD(RemoveVirgulas(ValorBrutoDoc(CdsTexto.FieldByName('VALOR').AsFloat, CdsTexto.FieldByName('VALORDESCONTO').AsFloat, CdsTexto.FieldByName('VALORJUROS').AsFloat),2),13), // Valor do NOMINAL
                    //ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor do Compromisso
                    //fim - andre tavares - pendência 21789 - 20/03/2006

                    sCodFormPagto, //Tipo de Pagamento

                    sBanco, //Cód. do Banco de Crédito
                    sAgenciaCred, //Cód. Agência de Crédito
                    '000', // Cód. da Camâra de Compensação de Crédito
                    sContaCred, //Número da Conta de Crédito

                    spc(20), //Nome da Agência
                    sAgenciaCred, //Cód. Agência de Pagamento
                    spc(11), //Descrição do Compromisso

                    sCodBarra,
                    sBanco, //Banco do Codigo de Barra/Favorecido

                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //Valor do Compromisso
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,42), //Nome do Fornecedor
                    spc(11), //Brancos
                    BuscaParamIntBanco('FINALIDADE','S'), // Finalidade do DOC
                    sHoraTed, //Hora de envio da TED STR
                    zd('0',24), // DDD+FAX + DDD+FONE
                    'N', //Confirming

                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), // Valor de JUROS/MULTA
                    RemoveBarras(CdsTexto.FieldByName('DATAPROGRAMADA').AsString), // Data de Vencimento
                    //inicio - andre tavares - pendência 21789 - 20/03/2006
                    {ZD(RemoveVirgulas( ((CdsTexto.FieldByName('VALOR').AsFloat +
                                        CdsTexto.FieldByName('VALORJUROS').AsFloat) -
                                        CdsTexto.FieldByName('VALORDESCONTO').AsFloat),2),13), //Valor autorizado pagamento}
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor autorizado pagamento
                    //fim - andre tavares - pendência 21789 - 20/03/2006
                    '0999', //Moeda REAL
                    spc(11), // Brancos
                    ZD(IntToStr(iTotRegArq),6)));
  end;
end;





procedure TPagDiversos.TraillerPagFornSantander;
begin
  With IntBancoManager Do
  Begin
  inc(iTotRegArq);
  WriteLn(ArquivoRemessa,
            Concat('9',
                   spc(393),
                   ZD(IntToStr(iTotRegArq),6)));
  end;
end;


procedure TPagDiversos.HeaderPagamentoACCCARD;
begin
  With IntBancoManager Do
  Begin
    WriteLn(ArquivoRemessa,
            Concat('D02',
                   Copy(TimeToStr(Date),4,2)+Copy(TimeToStr(Date),7,4)));
  end;
end;

procedure TPagDiversos.DetalhePagamentoACCCARD;
begin
  With IntBancoManager Do
  Begin
    WriteLn(ArquivoRemessa,
            Concat(ZD(CdsTexto.FieldByName('NUMEMPRESABANCO').AsString, 6),
                   '000',
                   ZD(CdsTexto.FieldByName('LIVRE').AsString, 8),
                   ZD(CdsTexto.FieldByName('VALOR').AsString, 9)));
  end;
end;


procedure TPagDiversos.MontaFolhaPagamentoACCCARD;
begin
  With IntBancoManager Do
  begin
    try

      sNomeArquivo := ExtractFilePAth(sNomeArquivo) + 'DEPAUT.TXT';

      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);
      HeaderPagamentoACCCARD;
      While Not CdsTexto.Eof Do
      begin
        DetalhePagamentoACCCARD;
        CdsTexto.Next;
      end;

      CloseFile(ArquivoRemessa);
      MostraArquivo;
      bArquivoCriado:= True;
    except
      bArquivoCriado:= False;
      MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
      CloseFile(ArquivoRemessa);
      raise;
    end;
  end;
end;

 //início - André Tavares - 23/03/2004 - pendência 16244
function TPagDiversos.UsaAlteradorEnvio(CodPortForma: Extended): Boolean;
var cds: TcmClientDataSet;
begin
  result := false;
  cds := TcmClientDataSet.Create(nil);
  cds.data := intBancoManager.GetDataPacket(' SELECT FLGUSAALTENVIO FROM PORTADORFORMA WHERE CODPORTFORMA = '+ floatToStr(CodPortForma));
  result := (cds.fieldByName('FLGUSAALTENVIO').asInteger = 1);
  cds.Free;
end;

function TPagDiversos.ListaAlteradores(CodDocumento : Extended): OleVariant;
begin
  result := intBancoManager.GetDataPacket(' SELECT A.RECPAG, A.ACRESDECRES, L.VALOR '+
                                          ' FROM LANCTODOCUM L, TIPOALTERADOR A     '+
                                          ' WHERE L.CODDOCUMENTO = '+ FloatToStr(CodDocumento) + ' AND '+
                                          '       L.CODALTERADOR = A.CODALTERADOR   ');

end;


function TPagDiversos.PegaValorNominalDocum(CodPortForma: Extended): extended;
var cds: TcmClientDataSet;
begin
  result := 0;
  cds := TcmClientDataSet.Create(nil);
  cds.data := intBancoManager.GetDataPacket(' SELECT VALOR FROM LANCTODOCUM '+
                                            ' WHERE CODALTERADOR IS NULL AND OPERACAO = 2 AND CODDOCUMENTO = ' + floatToStr(CodPortForma));
  result := cds.fieldByName('VALOR').asFloat;
  cds.Free;
end;
//fim - André Tavares - 23/03/2004 - pendência 16244


procedure TPagDiversos.MudaFormaPag; //pendência 26604
var dataAux: TDateTime;
begin
  intBancoManager.DtmIntBanco.CdsValMaximo.Close;
  intBancoManager.DtmIntBanco.sqlValMaximo.prepare;
  intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := intBancoManager.CdsTexto.FieldByName('CODPORTFORMA').asString;
  intBancoManager.DtmIntBanco.sqlValMaximo.Open;

  //pendência 26926 - 09/01/2008 - se o módulo de origem preencha a dataPagamento
  //--
  if (intBancoManager.bUsaDataIntBanco = true) then
  begin
    if trim(intBancoManager.DataPagamento) = '' then
      intBancoManager.bUsaDataIntBanco := false
    else
      intBancoManager.bUsaDataIntBanco := true;
  end;
  //--
  if (trunc(intBancoManager.dRestoreDtPagamento) = 0) then
  begin
    if intBancoManager.bUsaDataIntBanco then
      intBancoManager.dRestoreDtPagamento := strToDate(intBancoManager.DataPagamento)
    else
      intBancoManager.dRestoreDtPagamento := intBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').asDateTime;
  end;
  //--
  if (intBancoManager.bUsaDataIntBanco = true) then
    dataAux := strToDate(intBancoManager.DataPagamento)
  else
  begin
    intBancoManager.dRestoreDtPagamento := intBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').asDateTime;
    dataAux := intBancoManager.dRestoreDtPagamento;
  end;

  if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
     (intBancoManager.CdsTexto.FieldByName('VALOR').asFloat >= intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat) and
     (intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat > 0) and (not intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').isnull) then
  begin
    //sFormaPagto := intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('CODFORMAPGTOALT').AsString;
    if intBancoManager.iFloatExternoAlt > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
      //pendência 27109
      intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                          dataAux,
                                          intBancoManager.iFloatExternoAlt,
                                          intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                          intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
    else //senão usa o float do portadorforma
      //pendência 27109
      intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                          dataAux,
                                          intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAISALT').AsInteger,
                                          intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                          intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
  end
  else
  begin
    if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) then //doc normal
    begin
      //sFormaPagto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
      if intBancoManager.iFloatExterno > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
        //pendência x
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.iFloatExterno,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      else //senão usa o float do portadorforma
        //pendência 27109
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAIS').AsInteger,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
    end
    else if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 1) then //Cred CC
    begin
      //sFormaPagto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
      if intBancoManager.iFloatExterno > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
        //pendência 27109
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.iFloatExterno,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      else //senão usa o float do portadorforma
        //pendência 27109
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAIS').AsInteger,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
    end else
    begin
      //sFormaPagto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString; //ted str
      if intBancoManager.iFloatExterno > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
        //pendência 27109
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.iFloatExterno,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      else //senão usa o float do portadorforma
        //pendência 27109
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAIS').AsInteger,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
    end
  end;
end;


end.

