{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TPagUnibanco: arquivo de Pagto do UNIBANCO          }
{   UNIBANCO CRÉDITO EM CONTA - 6/P                     }
{   UNIBANCO DOC - 7/P                                  }
{   UNIBANCO PAGTO ELETRÔNICO, CARTÃO - 8/P             }
{   UNIBANCO OCT, COBRANÇA ESPECIAL - 9/P               }
{   UNIBANCO ORDEM PAGAMENTO, CHEQUE ADM - 10/P         }
{   UNIBANCO TÍTULOS UNICOBRANÇA - 11/P                 }
{   UNIBANCO TÍTULOS OUTROS BANCOS - 12/P               }
{   UNIBANCO DÉBITO EM CONTA - 16/P                     }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 28/06/2001                             }
{                                                       }
{*******************************************************}



unit uPagUnibancoMT;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls;

Type
   TPagUnibanco = Class
   private
     {Arquivo de Remessa a ser gerado}
     ArquivoRemessa: TextFile;
     {Código do CVT >>>> Oque é Isso !!?!?!?!?!!??!}
     sCodCVT: String;
     {Código da solicitação >>>> Kgy !!!!}
     sCodSolicitacao: String;
     {Tipo de serviço a ser executado pelo banco}
     sTipoServ: String;
     {Passo o Ponto ? >>>> Não sei !?!?!?!?!}
     sPasso: String;
     {Número do documento da empresa}
     sCodInscEmpresa: String;
     {Número do documento do fornecedor}
     sCodInscFornecedor: String;
     {Indicador de emissão de aviso ao favorecido}
     sAviso: String;
     {String para acumular os caracteres para montagem do Check Horizontal}
     sAuxCheck: String;
     {Contador de registros do arquivo}
     iTotRegArq: Integer;
     {Layout do arquivo a ser gerado}
     iLayout: Integer;
     {Valor total de pagamentos do arquivo}
     rTotalValorPago: Real;
     {Query para seleção do nome da agência do favorecido caso o tipo de arquivo obrigue a conta bancária}
     {Monta o header do arquivio}
     Procedure HeaderUnibanco;
     {Monta detalhe para Crédito em conta}
     Procedure DetalheCC;
     {Monta detalhe para DOC}
     Procedure DetalheDOC(isTED: boolean);
     {Monta detalhe para pagamento com cartão - Conta Salário}
     Procedure DetalhePAGTOCARTAO;
     {Monta detalhe pra processamento de Tele Cobtança}
     Procedure DetalheOCTCOBRANCA;
     {Monta Detalhe para pagamento com cheque administrativo}
     Procedure DetalheORDEMPAGTOCHQADM;
     {Monta Detalhe para pagamento com Unicobrança}
     Procedure DetalheUNICOBRANCA;
     {Monta Detalhe para pagamento de títulos de outros bancos}
     Procedure DetalheTITULOSOUTROSBANCOS;
     {Monta trailer do arquivo}
     Procedure TraillerUnibanco;
     {Monta detalhe para registro de contas a receber}
     Procedure DetalheCAR;
     {Retorna o valor do Checke Horizontal do registro}
     Function CheckHorizontal(sCheck :String):String;
     {retorna data de geração do arquivo}
     Function GetDate:String;
   public
     {Monta arquivo para pagamento de acordo com o modelo}
     Procedure MontaPagtoUnibanco(iModelo:Integer);
end;

Var
  PagUnibanco: TPagUnibanco;

implementation

Uses uSistema, uString, uIntBancoManager, uCmFileUtils, uCMDialogs, uContaBancariaMT;

procedure TPagUnibanco.MontaPagtoUnibanco(iModelo:Integer);
Begin
  With IntBancoManager Do
  Begin
     Try
          sPasso := 'Acessar Dados Da Cobrança e Da Empresa';

          iLayout := iModelo;

          sTipoServ := '1';
          sCodSolicitacao := '00';
          sCodCvt := '00000';

          Case iLayout of
            1,10,7,6: sTipoServ := Copy(IntBancoManager.BuscaParamIntBanco('CATEGLANC','S'),1,1);
            9: sCodCvt := Copy(IntBancoManager.BuscaParamIntBanco('CODTRANSACAOCVT','S'),1,5);
            Else
              If iLayout = 8 Then
              Begin
               sCodSolicitacao := Copy(IntBancoManager.BuscaParamIntBanco('CODIGOSOLICITACAO','S'),1,2);
               sTipoServ := Copy(IntBancoManager.BuscaParamIntBanco('CATEGLANC','S'),1,1);
              End;
            End;

          If Trim(sTipoServ) = '' Then sTipoServ := '1';

          iTotRegArq  := 0;
          rTotalValorPago := 0;

          sPasso := 'Criar Arquivo Para Gravar Os Dados';

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
             sCodInscEmpresa := '2'
          Else
             sCodInscEmpresa := '1';

          sPasso := 'Montar Header do Arquivo';

          HeaderUnibanco;

          While Not IntBancoManager.CdsTexto.Eof Do
          Begin
            If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
               sCodInscFornecedor := '1'
            Else
               sCodInscFornecedor := '2';

            If IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').isNull Then
               sAviso := '0'
            Else
              Case IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').AsInteger of
               3:   sAviso := '1';
               5,9: sAviso := '2';
               Else
                 sAviso := '0';
              End;

            rTotalValorPago := rTotalValorPago + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;

            Inc(iTotRegArq);
            Case iModelo Of
            1:  DetalheCAR;
            6:  DetalheCC;
            7:  DetalheDOC(false);
            8:  DetalhePAGTOCARTAO;
            9:  DetalheOCTCOBRANCA;
            10: DetalheORDEMPAGTOCHQADM;
            11: DetalheUNICOBRANCA;
            12: DetalheTITULOSOUTROSBANCOS;
            // implementação do TED Unibanco - André Tavares - 31/03/2004 - pendência 16160
            51: DetalheDOC(true);
            End;
            IntBancoManager.CdsTexto.Next;
          End;

          TraillerUnibanco;

          CloseFile(ArquivoRemessa);

          sPasso := 'Fechar Dados Do Cliente e da Cobrança';
          IntBancoManager.CdsEmpresa.Close;

          sPasso := 'Preparar Visualização do Arquivo';
          if bExibeArquivoGerado then
            VisualizaArquivo(sNomeArquivo,'');
          bArquivoCriado:= True;

     Except
        On E:Exception Do
        Begin

          bArquivoCriado:= False;
          MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso + (#13+#10) + E.Message,
              'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
        End;
     End;
  End;
End;

procedure TPagUnibanco.HeaderUnibanco;
Begin
   With IntBancoManager Do
   Begin
    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
            Concat('0', // Código do Registro
                   '1',// Identificação de Arquivo de Remessa
                   'REMESSA',//Literal da Remessa
                   '08',//Código do Serviço
                   'CONTAS A PAGAR',//Literal do Serviço
                   ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do Cliente
                   ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta + Dv
                   AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                   '409', //Número Do Banco
                   Ae('UNIBANCO',15), //Nome do Banco
                   RemoveBarras(GetDate),//Data da Gravação
                   Spc(224),
                   '000001'));
   End;
End;

procedure TPagUnibanco.TraillerUnibanco;
Begin
 Inc(iTotRegArq);
 WriteLn(ArquivoRemessa,
         Concat('9', // Código do registro
                ZD(IntToStr(iTotRegArq-2),6)), //Quantidade de Títulos
                ZD(RemoveVirgulas(rTotalValorPago,2),13), // Somatorio dos valores pagos
                ZD(IntToStr(iTotRegArq),6), //Quantidade de Registros
                Spc(288), //Brancos
                ZD(IntToStr(iTotRegArq),6)); // Total de Registros no Arquivo
End;


Function TPagUnibanco.CheckHorizontal(sCheck :String):String;
Var
  sAux, sNumBanco, sCheck1 :String;
  I, A, B, C : extended;
Begin
  A := 0;
  B := 0;
  C := 0;
  Result := 'O';
  {
   Rgistro de Detalhe
   (A) Dados do Favorecido > Posição 33 a 50 = Banco + Agencia (Sem DV) + Conta (Sem DV)
   (B) Tipo de Operação > Posição 53 = Tipo de Operacao (1 > 6, 6,12,10,9,8,5 > 5)
   (C) Valor da Transacao > Posição 55 a 67
   Check = (A + C) * B
   18 Digitos > Desprezar dígitos da esquerda
  }

  If iLayout <> 8 Then
  Begin
    A := StrToFloat(Copy(sCheck,37,14));
    B := StrToFloat(Copy(sCheck,53,1));
    C := strtofloat(copy(sCheck,55,13));
    sAux := FloatToStrF( ((A + C) * B), ffNumber, 28, 0);
    While Pos('.',sAux) <> 0 Do
        Delete(sAux,Pos('.',sAux),1);
    While Pos(',',sAux) <> 0 Do
        Delete(sAux,Pos(',',sAux),1);
    While Pos(' ',sAux) <> 0 Do
        Delete(sAux,Pos(' ',sAux),1);
    Result := sAux;
  End;

  sNumBanco := ZD(FloatToStr(StrToInt(Copy(sCheck,33,4)) * B),4);

  If Length(Result) > 14 Then
    Result := sNumBanco {'2045'} + Result
  Else
    Result := sNumBanco {'2045'} + Zd(Result,14);

  if length(result) > 18 then
     result:=copy(result,length(result) + 1 -18 ,18);

  sCheck1 := Result;
// -----------------------------------------------------------------------------

  I := StrToFloat(ZE(Copy(sCheck,33,4),18));

  sAux := FloatToStrF((((A + I) + C) * B), ffNumber, 28, 0);

  While Pos('.',sAux) <> 0 Do
      Delete(sAux,Pos('.',sAux),1);
  While Pos(',',sAux) <> 0 Do
      Delete(sAux,Pos(',',sAux),1);
  While Pos(' ',sAux) <> 0 Do
      Delete(sAux,Pos(' ',sAux),1);
  Result := sAux;

  if length(result) > 18 then
     result:=copy(result,length(result) + 1 -18 ,18);

  sNumBanco := Copy(ZD(Result,18),1,4);
  Result := sNumBanco + copy(sCheck1,5,14);
end;

procedure TPagUnibanco.DetalheCC;
Begin
   sAuxCheck := Concat('2', // Código do Registro
                       Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do Cliente
                       Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta + Dv
                       Spc(20),//Brancos
                       ZD(IntBancoManager.CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,4), //Banco Favorecido
                       GetAg(4,False,True),
                       GetCC(10,False,True),
                       '4',//Meio de Repasse
                       sAviso, //Emite Aviso Ao Favorecido
                       '5', //Tipo de Operação)
                       sTipoServ, //Tipo de Serviço
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13),
                       ZD(TRIM(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString),15), //Num Inscricao do Favorecido
                       RemoveBarras(GetDate),//Data da Gravação
                       RemoveBarras(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)),//Data do Crédito ao Favorecido
                       AE(IntBancoManager.CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                       Spc(95), //Reservado
                       Ae(TRIM(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString) + TRIM(IntBancoManager.CdsTexto.FieldByName('COMPLDOCUMENTO').AsString)+Spc(20),15), //Num Doc + Complemento
                       '14',
                       Spc(11), //Reservado
                       ZD('0',11), //Nosso Número
                       '01',  //Código da Ocorrência
                       '0',  //Mesma Titularidade
                       ' '); //Valor Pagto
   WriteLn(ArquivoRemessa,
          Concat(sAuxCheck, //Reservado
                 CheckHorizontal(sAuxCheck), //Ammarração Horizontal do Registro
                 Spc(26), //Cód. de Inscrição + Número de Inscrição + Reservado
                 ZD('0',5), //Código do Histórico
                 Spc(2), //Reservado
                 GetDvCC, //Dv Conta Corrente
                 ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

procedure TPagUnibanco.DetalheDOC(isTED: boolean);
Var
  sNomeAgencia, sNumAgencia, sPraca, sBanco, sTipoOper :String;
  X :Integer;
Begin

   //início - implementação do TED Unibanco - André Tavares - 31/03/2004 - pendência 16160
   sTipoOper := '';
   if isTED then // se é TED
     sTipoOper := '7'
   else // senão é DOC
   begin
     IntBancoManager.DtmIntBanco.CdsValMaximo.Close;
     IntBancoManager.DtmIntBanco.sqlValMaximo.prepare;
     IntBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').asString;
     IntBancoManager.DtmIntBanco.sqlValMaximo.Open;

     if // se é doc e valor >= varMáximo então vira TED
        (IntBancoManager.CdsTexto.FieldByName('VALOR').asFloat >= IntBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat) and
        (IntBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat > 0) and (not IntBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').isnull) then
     begin
       sTipoOper := '7' // O DOC vira TED
     end
     else
     begin
       sTipoOper := '5'; // DOC
     end;
   end;
   //fim - implementação do TED Unibanco - André Tavares - 31/03/2004 - pendência 16160

   sNumAgencia := Trim(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString);
   sBanco      := Trim(IntBancoManager.CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString);

   for X:=1 to length(sNumAgencia) do
     if sNumAgencia[x] = '&' then sNumAgencia[x]:=' ';

   sNumAgencia := QuotedStr(Trim(sNumAgencia));
   {
   ---------------------------------------------------------------------------
   Fábio Barros - 03/03/2002
   Implementação, na query abaixo, do campo CODIGO que contém a
   PRAÇA da AGÊNCIA
   ---------------------------------------------------------------------------
   }
   IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket(' SELECT P.NOME, PR.CODIGO FROM PESSOA P, AGENCIABANCARIA A, PRACACOMP PR, BANCO B WHERE  ' +
      ' P.IDPESSOA = A.IDPESSOA AND PR.IDPRACACOMP(+) = A.IDPRACACOMP AND RTRIM(A.NUMAGENCIA) = ' + sNumAgencia +
      ' AND B.IDPESSOA = A.IDBANCO AND RTRIM(B.NUMBANCO) = ''' + sBanco+'''');

   if not IntBancoManager.CdsAux.IsEmpty then
   begin
     sNomeAgencia := IntBancoManager.CdsAux.Fields[0].AsString;
     sPraca       := Copy(IntBancoManager.CdsAux.Fields[1].AsString,1,3);
   end
   else
   begin
     sNomeAgencia := '';
     sPraca       := '000';
   end;

   sNomeagencia := Ae(sNomeagencia+Spc(20),20);

   If IntBancoManager.CdsAux.Active Then IntBancoManager.CdsAux.Close;

   sAuxCheck := Concat('2', // Código do Registro
                      Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do Cliente
                      Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta + Dv
                      Spc(17),//Brancos
                      Copy(ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),6,3),//Complemento do Cep
                      ZD(IntBancoManager.CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,4), //Banco Favorecido
                      GetAg(4,False,True),
                      GetCC(10,False,True),
                      '4',//Meio de Repasse
                      sAviso, //Emite Aviso Ao Favorecido
                      //início - implementação do TED Unibanco - André Tavares - 31/03/2004 - pendência 16160
                      // '5', //Tipo de Operação
                      sTipoOper,
                      //fim - implementação do TED Unibanco - André Tavares - 31/03/2004 - pendência 16160
                      sTipoServ, //Tipo de Serviço
                      ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13),
                      ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //Num Inscricao do Favorecido
                      RemoveBarras(GetDate),//Data da Gravação
                      RemoveBarras(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)),//Data do Crédito ao Favorecido
                      AE(IntBancoManager.CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                      AE(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString,25), //Endereço
                      AE(IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString,5),//Número
                      AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),//Cidade
                      AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),//Estado
                      ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,5),//Cep
                      Spc(20), //Reservado
                      sNomeagencia, //Nome da Agência do Favorecido
                      sPraca, //Praça do Favorecido
                      Ae(Copy(TRIM(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString) + ' ' + TRIM(IntBancoManager.CdsTexto.FieldByName('COMPLDOCUMENTO').AsString)+Spc(35),1,15),15), //Num Doc + Complemento
                      '14', //Real
                      Spc(11), //Reservado
                      Spc(11), //Nosso Número
                      '01', //Código da Ocorrência
                      '0', //Mesma Titularidade
                      ' '//Reservado
                      );//Valor Pagto

   WriteLn(ArquivoRemessa,
          Concat(sAuxCheck,
                 CheckHorizontal(sAuxCheck), //Ammarração Horizontal do Registro
                 Zd(sCodInscEmpresa,2),// Tipo de Documento do Favorecido (2)
                 ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14),// Numero do Documento do Favorecido (14)
                 Spc(10), // Reservado (10)
                 Spc(5), //Código do Histórico
                 Spc(1), //Reservado
                 AE(GetDvAg+Spc(1),1),
                 AE(GetDvCC+Spc(1),1),
                 ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

procedure TPagUnibanco.DetalhePAGTOCARTAO;
Begin
   sAuxCheck := Concat('2', // Código do Registro
                      Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do Cliente
                      Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta + Dv
                      Spc(20),//Brancos
                      ZD('0',10),//Código da Empresa e Número do Favorecido no Pagamento Eletônico
                      sCodSolicitacao, //Código da Solicitação
                      ZD(Copy(Trim(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString),1,Length(Trim(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString))-1),4), //Codigo da Agencia SemDv
                      '00', //Reservado
                      '5',//Meio de Repasse
                      '0', //Reservado
                      '5', //Tipo de Operação
                      sTipoServ, //Tipo de Serviço
                      ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13),
                 AE(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //Num Inscricao do Favorecido
                 RemoveBarras(GetDate),//Data da Gravação
                 RemoveBarras(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)),//Data do Crédito ao Favorecido
                 AE(IntBancoManager.CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                 Spc(110), //reservado
                 '14',
                 Spc(11), //Reservado
                 Spc(11), //Nosso Número
                 '01', //Código da Ocorrência
                 '  ' //Reservado
                 );//Valor Pagto

   WriteLn(ArquivoRemessa,
           Concat(sAuxCheck,
                  CheckHorizontal(sAuxCheck), //Ammarração Horizontal do Registro
                  Spc(34), //Reservado
                  ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

procedure TPagUnibanco.DetalheOCTCOBRANCA;
Begin
   sAuxCheck := Concat('2', // Código do Registro
                      Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do Cliente
                      Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta + Dv
                      Spc(20),//Brancos
                      '0409', //Banco Favorecido
                      GetAg(4,False,True),
                      GetCC(10,False,True),
                      '4',//Meio de Repasse
                      sAviso, //Emite Aviso Ao Favorecido
                      '5', //Tipo de Operação
                      '0', //Tipo de Serviço
                      ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13),
                      AE(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //Num Inscricao do Favorecido
                      RemoveBarras(GetDate),//Data da Gravação
                      RemoveBarras(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)),//Data do Crédito ao Favorecido
                      AE(IntBancoManager.CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                      Spc(95), //Reservado
                      ZD(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,15), //Nº da OCT
                      '14',
                      sCodCVT,
                      RemoveBarras(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString),//Data do Crédito ao Favorecido
                      Spc(11), //Nosso Número
                      '01', //Código da Ocorrência
                      '  ' //Reservado
                      );//Valor Pagto

   WriteLn(ArquivoRemessa,
           Concat(sAuxCheck,
                  CheckHorizontal(sAuxCheck), //Ammarração Horizontal do Registro
                  AE(IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CODDOCUMENTO').AsString,20), //Num Referencia do Favorecido
                  Spc(13), //Reservado
                  GetDvCC, //Dv Conta Corrente
                  ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

procedure TPagUnibanco.DetalheORDEMPAGTOCHQADM;
Begin
   sAuxCheck := Concat('2', // Código do Registro
                      Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do Cliente
                      Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta + Dv
                      Spc(17),//Brancos
                      Copy(ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),6,3),//Complemento do Cep
                      ZD(IntBancoManager.CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,4), //Banco Favorecido
                      ZD(Copy(Trim(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString),1,Length(Trim(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString))-1),4), //Codigo da Agencia SemDv
                      zd('0',10),//Reservado
                      '4',//Meio de Repasse
                      sAviso, //Emite Aviso Ao Favorecido
                      '5', //Tipo de Operação
                      sTipoServ, //Tipo de Serviço
                      ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13),
               AE(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //Num Inscricao do Favorecido
               RemoveBarras(GetDate),//Data da Gravação
               RemoveBarras(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)),//Data do Crédito ao Favorecido
               AE(IntBancoManager.CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
               AE(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString,25), //Endereço
               AD(IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString,5),//Número
               AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),//Cidade
               AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),//Estado
               ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,5),//Cep
               Spc(43), //Reservado
               Ae(TRIM(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString) + ' ' + TRIM(IntBancoManager.CdsTexto.FieldByName('COMPLDOCUMENTO').AsString),15), //Num Doc + Complemento
               '14',
               Spc(11), //Reservado
               Spc(11), //Nosso Número
               '01', //Código da Ocorrência
               '  ' //Reservado
               );//Valor Pagto

   WriteLn(ArquivoRemessa,
        Concat(sAuxCheck,
               CheckHorizontal(sAuxCheck), //Ammarração Horizontal do Registro
               Spc(34), //Reservado
               ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

procedure TPagUnibanco.DetalheUNICOBRANCA;
Var
   sBarras,sCampoLivre,sNossoNum: String;
Begin
   If IntBancoManager.CdsTexto.FieldByName('CODBARRA').IsNull Then
   Begin
      sBarras     := IntBancoManager.CdsTexto.FieldByName('CODBARRAVALOR').AsString;
      sBarras     := AE(sBarras,47);
      sCampoLivre := Copy(sBarras,5,5) + Copy(sBarras,11,10) + Copy(sBarras,22,10);
   End
   Else
   Begin
      sBarras     := IntBancoManager.CdsTexto.FieldByName('CODBARRA').AsString;
      sBarras     := AE(sBarras,44);
      sCampoLivre := Copy(sBarras,20,25);
      sBarras := 'CDB' + sBarras;
   End;

   sNossoNum := Copy(sCampoLivre,7,11);

   WriteLn(ArquivoRemessa,
           Concat('2', // Código do Registro
                  Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do Cliente
                  Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta + Dv
                  Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do Cliente
                  Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta + Dv
                  Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do Cliente
                  Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta + Dv
                  '01',//Reservado
                  Spc(7),//Reservado
                  Ae(TRIM(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString) + ' ' + TRIM(IntBancoManager.CdsTexto.FieldByName('COMPLDOCUMENTO').AsString),25), //Num Doc + Complemento
                  '14', //Moeda
                  '01', //Código da Ocorrência
                  sNossoNum, //Nosso Número do Documento
                  RemoveBarras(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)),//Data do Crédito ao Favorecido

                  //inicio - andre tavares - pendência 21789 - 20/03/2006
                  //ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13),//Valor Pagto
                  ZD(RemoveVirgulas(IntBancoManager.ValorBrutoDoc(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat, IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat, IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat),2),13), // Valor do NOMINAL
                  //fim - andre tavares - pendência 21789 - 20/03/2006

                  ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13),//Valor Juros
                  ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13),//Valor Abatimento
                  ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13),//Valor Desconto

                  //inicio - andre tavares - pendência 21789 - 20/03/2006
                  {ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat +
                                    IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat -
                                    IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13),//Valor Líquido Pagto}
                  ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13),//Valor Pagto
                  //fim - andre tavares - pendência 21789 - 20/03/2006

                  ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13),//Valor Juros
                  Spc(147), //Brancos
                  ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

procedure TPagUnibanco.DetalheTITULOSOUTROSBANCOS;
Var
   sBarras,sCampoLivre,sNossoNum,sAgenciaContaCedente, sBanco: String;
Begin
    If IntBancoManager.CdsTexto.FieldByName('CODBARRA').IsNull Then
    Begin
       sBarras     := IntBancoManager.CdsTexto.FieldByName('CODBARRAVALOR').AsString;
       sBarras     := AE(sBarras,47);
       sBanco      := Copy(sBarras,1,3);
       sCampoLivre := Copy(sBarras,5,5) + Copy(sBarras,11,10) + Copy(sBarras,22,10);
    End
    Else
    Begin
       sBarras     := IntBancoManager.CdsTexto.FieldByName('CODBARRA').AsString;
       sBarras     := AE(sBarras,44);
       sBanco      := Copy(sBarras,1,3);
       sCampoLivre := Copy(sBarras,20,25);
       sBarras := 'CDB' + sBarras;
    End;

    sNossoNum := Copy(sCampoLivre,7,11);

    sAgenciaContaCedente := Copy(sCampoLivre,1,4) + Copy(sCampoLivre,18,7);

    sAuxCheck := Concat('2', // Código do Registro
                       Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do Cliente
                       Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta + Dv
                       Spc(20),//Brancos
                       zd(sBanco,4), //Banco Favorecido
                       ZD('0',14),//Reservado
                       '4',//Meio de Repasse
                       '0', //Emite Aviso Ao Favorecido
                       '5', //Tipo de Operação
                       '9', //Tipo de Serviço
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13),
                   ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //Num Inscricao do Favorecido
                   RemoveBarras(GetDate),//Data da Gravação
                   RemoveBarras(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)),//Data do Crédito ao Favorecido
                   AE(IntBancoManager.CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                   sBarras, //Código de Barras
                   Spc(5), //reservado
                   Spc(20),//Reservado
                   Ae('0',20),//Nosso Número
                   '000', //Zeros
                   Spc(15), //Espaço
                   '14', //Moeda
                   Spc(5), //reservado
                   RemoveBarras(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)),//Data do Crédito ao Favorecido
                   Spc(11), //Noosso Número - Opcional
                   '01', //Código da Ocorrência
                   Spc(2) //Reservado
                   );//Valor Pagto



    WriteLn(ArquivoRemessa,
            Concat(sAuxCheck,
                   CheckHorizontal(sAuxCheck), //Ammarração Horizontal do Registro
                   Ae(sAgenciaContaCedente,20), //Agência Código Cendente
                   Spc(14), //Reservado
                   ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

procedure TPagUnibanco.DetalheCAR;
Begin
   sAuxCheck := Concat('2', // Código do Registro
                      Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência do Cliente
                      Zd(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta + Dv
                      Spc(20),//Brancos
                      '0409', //Banco Favorecido
                      GetAg(4,False,True),
                      GetCC(10,False,True),
                      '4',//Meio de Repasse
                      sAviso, //Emite Aviso Ao Favorecido
                      '6', //Tipo de Operação
                      sTipoServ, //Tipo de Serviço
                      ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13),
                AE(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //Num Inscricao do Favorecido
                RemoveBarras(GetDate),//Data da Gravação
                RemoveBarras(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)),//Data do Crédito ao Favorecido
                AE(IntBancoManager.CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                Spc(95), //Reservado
                Ae(TRIM(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString) + ' ' + TRIM(IntBancoManager.CdsTexto.FieldByName('COMPLDOCUMENTO').AsString),15), //Num Doc + Complemento
                '14',
                Spc(11), //Reservado
                Spc(11), //Nosso Número
                '01', //Código da Ocorrência
                '  ' //Reservado
                );//Valor Pagto

   WriteLn(ArquivoRemessa,
         Concat(sAuxCheck,
                CheckHorizontal(sAuxCheck), //Ammarração Horizontal do Registro
                Spc(26), //Reservado
                Spc(5), //Código do Histórico
                Spc(2), //Reservado
                GetDvCC,
                ZD(IntToStr(iTotRegArq),6))); // Total de Registros no Arquivo
End;

Function TPagUnibanco.GetDate:String;
Begin
   {If Biblioteca.DataPagamento <> '' Then
      Result := Biblioteca.DataPagamento
   Else}
      Result := DateToStr(Date);
End;

end.
