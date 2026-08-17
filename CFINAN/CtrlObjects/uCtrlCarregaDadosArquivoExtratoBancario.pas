//********************************************************************************************
//N. WO...........: 7698
//Data............: 08/02/2024
//Responsável.....: Lendro Pocebon
//Descrição.......: Tratamento do arquivo no formato .CSV
//********************************************************************************************
//N. Sol..........: 211114
//N. Kintana......: 2033158
//Data............: 11/07/2013
//Responsável.....: Paulo Nobre / Thiago Melo
//Descrição.......: Inclusão de critica para a inexistência do valor dos campos no arquivo
//********************************************************************************************
//N. Sol..........: 31714_38358
//N. Kintana......: 523349_523362
//Data............: 06/06/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Objeto para leitura de arquivos bancários - .OFX
//                  Será criada uma classe que guardará os conteúdos de todo o arquivo lido:
//                  Dados do cabeçalho como os dados dos lançamentos
//********************************************************************************************
Unit uCtrlCarregaDadosArquivoExtratoBancario;

Interface

Uses classes, SysUtils, Controls, Messages, Dialogs;

Type
   // Classe que guarda os conteúdos dos lançamentos
   TOFXItem = Class
      TipoLanc: String;
      DataLancamento: TDate;
      Valor: double;
      NumControle: String;
      NumDocto: String;
      Historico: String;
   End;

   TCtrlCarregaDadosArquivoExtratoBancario = Class(TComponent)
   Private
      FArquivoOFX: String;
      FListaDeItems: TList;
      Procedure Clear;
      Procedure Deletar(iIndex: integer);
      Function AdiconarItem: TOFXItem;
      Function PrepararFloat(sString: String): String;
      Function PrepararFloatCSV(sString: String): String;
      Function PegaValorDoCampo(sTag, sLinha: String): String;
      Function AcharTexto(sTag, sString: String): boolean;
      Function TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
   Public
      // Dados do cabeçalho
      NumBanco: Integer;
      NumContaCorrente: String;
      TipoConta: String;
      SaldoAnterior: double;
      SaldoDia: double;
      SaldoAtual: double;
      QtdItems: Integer;

      Constructor Create(AOwner: TComponent); Override;
      Destructor Destroy; Override;
      Function Processar: boolean;
      Function ObtemItem(iIndex: integer): TOFXItem;
   Protected
   Published
      Property ArquivoOFX: String Read FArquivoOFX Write FArquivoOFX;
   End;

Implementation

Constructor TCtrlCarregaDadosArquivoExtratoBancario.Create(AOwner: TComponent);
Begin
   Inherited Create(AOwner);
   FListaDeItems := TList.Create;
End;

Destructor TCtrlCarregaDadosArquivoExtratoBancario.Destroy;
Begin
   FListaDeItems.Free;
   Inherited Destroy;
End;

Procedure TCtrlCarregaDadosArquivoExtratoBancario.Deletar(iIndex: integer);
Begin
   TOFXItem(FListaDeItems.Items[iIndex]).Free;
   FListaDeItems.Delete(iIndex);
End;

Procedure TCtrlCarregaDadosArquivoExtratoBancario.Clear;
Var oPointer: Pointer;
Begin
   While FListaDeItems.Count > 0 Do
      Deletar(0);
   FListaDeItems.Clear;
End;

Function TCtrlCarregaDadosArquivoExtratoBancario.ObtemItem(iIndex: integer): TOFXItem;
Begin
   Result := TOFXItem(FListaDeItems.Items[iIndex]);
End;

Function TCtrlCarregaDadosArquivoExtratoBancario.Processar: boolean;
Var
   oItem: TOFXItem;
   sLinha, sMsgErro: String;  // Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158}
   ArquivoBancarioOFX: TextFile;
   // Leandro WO7698 - inicio
   ArquivoExt : string;
   sValorLido : string;

   I: Integer;
   // Lê Linha e Monta os valores
   function MontaValor: String;
   var
     ValorMontado: String;
   begin
     ValorMontado := '';
     Inc(I);
     While sLinha[I] >= ' ' do
     begin
       If sLinha[I] = ';' then
         break;

       ValorMontado := ValorMontado + sLinha[I];
       inc(I);
     end;
     result := ValorMontado;
   end;
   // Leandro WO7698 - fim
Begin
   Clear; // Limpando os items
   SaldoDia := 0;
   SaldoAtual := 0;
   QtdItems := 0;

   ArquivoExt := ExtractFileExt(FArquivoOFX); //Leandro WO7698

   // Lendo o arquivo OFX
   AssignFile(ArquivoBancarioOFX, FArquivoOFX);
   Reset(ArquivoBancarioOFX);
   //Leandro WO7698 - Inicio
   IF UpperCase(ArquivoExt) = '.OFX' then
   begin
      Readln(ArquivoBancarioOFX, sLinha); // Lendo a 2ª linha para saber se é um arquivo .OFX
      Result := AcharTexto('OFX', sLinha);
      If Result Then // É um arquivo .OFX válido
      Begin
         While Not EOF(ArquivoBancarioOFX) Do
            Begin
               //
               // Lendo dados do Cabeçalho
               //
               Readln(ArquivoBancarioOFX, sLinha);
               // -----------------------------------------------------------------------
               // Código do Banco
               If AcharTexto('<BANKID>', sLinha) Then
                  NumBanco := strtoint(PegaValorDoCampo('<BANKID>', sLinha));
               // -----------------------------------------------------------------------
               // Conta Corrente
               If AcharTexto('<ACCTID>', sLinha) Then
                  NumContaCorrente := PegaValorDoCampo('<ACCTID>', sLinha);
               // -----------------------------------------------------------------------
               // Tipo da Conta
               If AcharTexto('<ACCTTYPE>', sLinha) Then
                  TipoConta := PegaValorDoCampo('<ACCTTYPE>', sLinha);
               // -----------------------------------------------------------------------

{              Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158 Ini
               // Saldo Atual
               If AcharTexto('<BALAMT>', sLinha) Then
                  SaldoAtual := StrToFloat(PrepararFloat(PegaValorDoCampo('<BALAMT>', sLinha)));
               // -----------------------------------------------------------------------
               Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158}

               //
               // Lendo dados do Lançamentos
               //
               // TAG de grupo que contem as transações bancárias
               If AcharTexto('<BANKTRANLIST>', sLinha) Then
                  Begin
                     While Not AcharTexto('</BANKTRANLIST>', sLinha) Do
                        Begin
                           // TAG de grupo que contem todos os lançamentos transacionados
                           If AcharTexto('<STMTTRN>', sLinha) Then
                              Begin
                                 inc(QtdItems); // conta os items lidos

                                 oItem := AdiconarItem;

                                 While Not AcharTexto('</STMTTRN>', sLinha) Do
                                    Begin
                                       Result := True;
                                       // Tipo do Lançamento - Débito ou Crédito  (*)
                                       If AcharTexto('<TRNTYPE>', sLinha) Then
                                          If PegaValorDoCampo('<TRNTYPE>', sLinha) <> '' Then
                                             oItem.TipoLanc := copy(PegaValorDoCampo('<TRNTYPE>', sLinha), 1, 1) // D/C
                                          // Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158 Ini
                                          Else
                                             Begin
                                                showmessage('Valor do Campo Tipo do Lançamento - Débito ou Crédito não Encontrado no Arquivo...!');
                                                Result := False;
                                                Exit;
                                             End;
                                          // Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158

                                       // Data do Lançamento   (*)
                                       If AcharTexto('<DTPOSTED>', sLinha) Then
                                          Begin
                                             If PegaValorDoCampo('<DTPOSTED>', sLinha) <> '' Then
                                                Begin
                                                   oItem.DataLancamento := EncodeDate(StrToIntDef(copy(PegaValorDoCampo('<DTPOSTED>', sLinha), 1, 4), 0),
                                                      StrToIntDef(copy(PegaValorDoCampo('<DTPOSTED>', sLinha), 5, 2), 0),
                                                      StrToIntDef(copy(PegaValorDoCampo('<DTPOSTED>', sLinha), 7, 2), 0));
                                                End
                                             // Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158 Ini
                                             Else
                                                Begin
                                                   showmessage('Valor do Campo Data do Lançamento não Encontrado no Arquivo...!');
                                                   Result := False;
                                                   Exit;
                                                End;
                                             // Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158
                                          End;

                                       // Número de Controle Bancário
                                       If AcharTexto('<FITID>', sLinha) Then
                                          oItem.NumControle := PegaValorDoCampo('<FITID>', sLinha);

                                       // Número do Documento   (*)
                                       If AcharTexto('<CHECKNUM>', sLinha) Then
                                          Begin
                                             If PegaValorDoCampo('<MEMO>', sLinha) <> '' Then
                                                oItem.NumDocto := PegaValorDoCampo('<CHECKNUM>', sLinha)
                                             // Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158 Ini
                                             Else
                                                Begin
                                                   showmessage('Valor do Campo Número do Documento não Encontrado no Arquivo...!');
                                                   Result := False;
                                                   Exit;
                                                End;
                                             // Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158
                                          End;

                                       // Histórico    (*)
                                       If AcharTexto('<MEMO>', sLinha) Then
                                          Begin
                                             If PegaValorDoCampo('<MEMO>', sLinha) <> '' Then
                                                oItem.Historico := PegaValorDoCampo('<MEMO>', sLinha)
                                             // Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158 Ini
                                             Else
                                                Begin
                                                   showmessage('Valor do Campo Histórico do Lançamento não Encontrado no Arquivo...!');
                                                   Result := False;
                                                   Exit;
                                                End;
                                             // Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158
                                          End;

                                       // Valor    (*)
                                       If AcharTexto('<TRNAMT>', sLinha) Then
                                          Begin
                                             If PegaValorDoCampo('<TRNAMT>', sLinha) <> '' Then
                                                Begin
                                                   oItem.Valor := StrToFloat(PrepararFloat(PegaValorDoCampo('<TRNAMT>', sLinha)));
                                                   SaldoDia := SaldoDia + oItem.Valor;
                                                End
                                             // Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158 Ini
                                             Else
                                                Begin
                                                   showmessage('Valor do Campo Valor do Lançamento não Encontrado no Arquivo...!');
                                                   Result := False;
                                                   Exit;
                                                End;
                                             // Paulo Nobre / Thiago Melo SOL 211114 Kintana 2033158
                                          End;

                                       Readln(ArquivoBancarioOFX, sLinha);
                                    End;
                              End;

                           Readln(ArquivoBancarioOFX, sLinha);
                        End;
                  End;
            End;
      End;
    End
    Else
    Begin
      Readln(ArquivoBancarioOFX, sLinha);
      Result := AcharTexto('Saldo anterior', sLinha);
      If Result Then // É um arquivo .CSV válido
      Begin
        Readln(ArquivoBancarioOFX, sLinha);
        // Código do Banco
        NumBanco := 0;
        // Conta Corrente
        NumContaCorrente := '';
        // Tipo da Conta
        TipoConta := '';

        //
        // Lendo dados do Lançamentos
        //
        While Not AcharTexto('Saldo do dia', sLinha) Do
        Begin
          inc(QtdItems); // conta os items lidos

          oItem := AdiconarItem;

          Result := True;


          I := 0;
          MontaValor; // Primeiro campo despreza;

          // Data do Lançamento   (*)
          sValorLido := MontaValor;
          If sValorLido <> '' Then
          Begin
            oItem.DataLancamento := EncodeDate(StrToIntDef(Copy(sValorLido, 7, 4), 0),
                                    StrToIntDef(copy(sValorLido, 4, 2), 0),
                                    StrToIntDef(copy(sValorLido, 1, 2), 0));
          End
          Else
          Begin
            showmessage('Valor do Campo Data do Lançamento não Encontrado no Arquivo...!');
            Result := False;
            Exit;
          End;

          MontaValor; // Terceiro campo despreza;

          // Histórico    (*)
          sValorLido := MontaValor;
          If sValorLido <> '' Then
            oItem.Historico := sValorLido
          Else
          Begin
            showmessage('Valor do Campo Histórico do Lançamento não Encontrado no Arquivo...!');
            Result := False;
            Exit;
          End;

          sValorLido := MontaValor;

          // Número de Controle Bancário
          If sValorLido <> '' Then
            oItem.NumControle := sValorLido;

          // Número do Documento   (*)
          If sValorLido <> '' Then
            oItem.NumDocto := sValorLido
          Else
          Begin
            showmessage('Valor do Campo Número do Documento não Encontrado no Arquivo...!');
            Result := False;
            Exit;
          End;

          // Valor    (*)
          sValorLido := MontaValor;
          If sValorLido <> '' Then
          Begin
            oItem.Valor := StrToFloat(PrepararFloatCSV(sValorLido));
            SaldoDia := SaldoDia + oItem.Valor;
          End
          Else
          Begin
            showmessage('Valor do Campo Valor do Lançamento não Encontrado no Arquivo...!');
            Result := False;
            Exit;
          End;

          // Tipo do Lançamento - Débito ou Crédito  (*)
          If oItem.Valor > 0 Then
            oItem.TipoLanc := 'C'
          Else
            oItem.TipoLanc := 'D';

          Readln(ArquivoBancarioOFX, sLinha);
        End;
      End;
    End;
    //Leandro WO7698 - Fim

   // -----------------------------------------------------------------------

   SaldoAnterior := SaldoAtual - SaldoDia;
   CloseFile(ArquivoBancarioOFX);
End;

Function TCtrlCarregaDadosArquivoExtratoBancario.PrepararFloatCSV(sString: String): String;
Begin
   Result := Trim(sString);
   Result := TrocaTexto(Result, 'R$ ', '');
   Result := TrocaTexto(Result, '.', '');
   Result := TrocaTexto(Result, ',', DecimalSeparator);
End;

Function TCtrlCarregaDadosArquivoExtratoBancario.PrepararFloat(sString: String): String;
Begin
   Result := sString;
   Result := TrocaTexto(Result, '.', DecimalSeparator);
   Result := TrocaTexto(Result, ',', DecimalSeparator);
End;

Function TCtrlCarregaDadosArquivoExtratoBancario.TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
Var
   iPosition: integer;
   sTemp: String;
Begin
   iPosition := 1;
   sTemp := '';
   While (iPosition > 0) Do
      Begin
         If bInsensitive Then
            iPosition := AnsiPos(UpperCase(sOld), UpperCase(sString))
         Else
            iPosition := AnsiPos(sOld, sString);
         If (iPosition > 0) Then
            Begin
               sTemp := sTemp + copy(sString, 1, iPosition - 1) + sNew;
               sString := copy(sString, iPosition + Length(sOld), Length(sString));
            End;
      End;
   sTemp := sTemp + sString;
   Result := (sTemp);
End;

Function TCtrlCarregaDadosArquivoExtratoBancario.PegaValorDoCampo(sTag, sLinha: String): String;
Var iTamTag, iInicioTag: integer;
Begin
   Result := '';
   sLinha := Trim(sLinha);
   If AcharTexto('>', sLinha) Then
      Begin
         iTamTag := Length(sTag) + 1;
         iInicioTag := Pos('</', sLinha);
         Result := copy(sLinha, iTamTag, iInicioTag - iTamTag);
      End;
End;

Function TCtrlCarregaDadosArquivoExtratoBancario.AdiconarItem: TOFXItem;
Var oItem: TOFXItem;
Begin
   oItem := TOFXItem.Create;
   FListaDeItems.Add(oItem);
   Result := oItem;
End;

Function TCtrlCarregaDadosArquivoExtratoBancario.AcharTexto(sTag, sString: String): boolean;
Begin
   Result := Pos(UpperCase(sTag), UpperCase(sString)) > 0;
End;

End.

