{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TRetornoCobranca: Processamento do Retorno para os  }
{   seguinte arquivos de remessa:                       }
{     0/P  Itaú                                         }
{     1/P  Real                                         }
{     4/P  Bradesco Pagamento de Fornecedores           }
{     17/P HSBC - Sistema de Pagamentos                 }
{     18/P Banco do Brasil >>>>> Argh: Foi Ela !!!!!!!! }
{     23/P BBV - Sistema de Pagamentos                  }
{     24/P Banco Santander - Pagamento de Fornecedores  }
{                           (400 Posições)              }
{     58/P Banco de Santa Catarina (BESC)               }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 28/06/2001                             }
{                04/02/2002                             }
{                09/07/2002                             }
{                11/07/2002                             }
{                13/06/2007 amf 12.06.2007 24978 -      }
{                  Retorno de Pagamento do Banco de     }
{                  Santa Catarina (BESC) (idmodelo = 58)}
{                                                       }
{                                                       }
{*******************************************************}
unit uRetornoSispagMT;

interface

Uses classes, SysUtils;

Type
   TRetornoSispag = Class
   private
     {Controle de linha a ser processada: A primeira linha do retorno contem informações da empresa e não dos documentos}
     PrimeiraLinha:Boolean;
     {Datad do pagamento do título no banco}
     sDataPagto: String;
     {valor efetivamente pago ao banco}
     sValorPagto: String;
     {lista de ocorrências para o registro processado pelo banco}
     sOcorrencias: String;
     {Código do documento (DOCUMENTO.CODDOCUMENTO) do registro de retorno}
     sCodDocumento: String;
     {Nome da empresa proprietária do arquivo de retorno}
     sNomeEmpresa: String;
     {Indice para a descrição do erro no processamento}
     iLogErro:Integer;
     {Lista com os dados interpretados do arquivo de retorno}
     ListaRetornoSispag:TStrings;
     {Adiciona os campos pertinendtes para baixa na lista para processamento no financeiro}
     Procedure EncheListaRetornoSispag;
     {Busca descrição do erro de acordo com o processamento e retorna na Lista de Retorno}
     Procedure DescreveErro;
   public
     {Processa o arquivo de retorno para o Itaú}
     function  RetornoSispagItau : TStrings;
     {Processa o arquivo de retorno para o Banco Real}
     function  RetornoPagReal : TStrings;
     { Processa o arquivo de retorno para o Banco Bradesco - Pagamento de Fornecedores }
     function RetornoSispagPagForBradesco : TStrings;
     {Processa o arquivo de retorno para o Banco do Brasil >>>>> Argh: Foi Ela !!!!!!!!!}
     function  RetornoSispagBB:TStrings;   //MARIA
     { Processa o arquivo de retorno para o Banco HSBC - Sistema de Pagamentos }
     function RetornoSispagHSBC:TStrings;
     { Processa o arquivo de retorno para o Banco Santander - Pagament de Fornecedores(400 Posições) }
     function RetornoPagForSANTANDER:TStrings;
     { Processa o arquivo de retorno para o Banco BBV - Sistema de Pagamentos }
     function RetornoPagForBBV:TStrings;
     { André Tavares - pendência 21659 - 28/03/2006 - Recebimento Automático do
       Banco Banespa Cnab 240 - Pagto de Fornecedores (idmodelosCnab = 55)}
     function RetornoSispagBanespa: TStrings;

     //amf 12.06.2007 24978 - Retorno de Pagamento do Banco de Santa Catarina (BESC) (idmodelo = 58)
     function RetornoSisPagBESC: TStrings;

end;

Var
  RetornoSispag: TRetornoSispag;

implementation

Uses uString, uIntBancoManager, uCMFileUtils;

Procedure TRetornoSispag.EncheListaRetornoSispag;
Begin
   If (Trim(sNomeEmpresa)  = '') And (Trim(sCodDocumento) = '') And
      (Trim(sDataPagto)    = '') And (Trim(sValorPagto)   = '') And
      (Trim(sOcorrencias)  = '') Then Exit;

   ListaRetornoSispag.Add(Ae(sNomeEmpresa,30) + Ae(sCodDocumento,20) + Ae(sDataPagto,10) +
                          Ae(sValorPagto,15) + sOcorrencias);
End;


Procedure TRetornoSispag.DescreveErro;
Var DescErro: String;
Begin
   ListaRetornoSispag.Clear;
   ListaRetornoSispag.Add('Erro');
   Case iLogErro of
   0: DescErro := 'Nome da Empresa';
   1: DescErro := 'Código do Documento';
   2: DescErro := 'Data do Pagamento';
   3: DescErro := 'Valor Total do Pagamento';
   4: DescErro := 'Ocorrências de Retorno';
   End;
   WriteLn(IntBancoManager.ArquivoLog,'Ocorreu um erro ler o campo ' + DescErro +  ' do arquivo de retorno');
end;

function TRetornoSispag.RetornoSispagItau:TStrings;
Var sLinha: String;
Begin
 With IntBancoManager Do
 Begin
   Try
     ListaRetornoSispag := TStringList.Create;
     //Cria Arquivo de Log
     AssignFile(ArquivoLog,Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG');
     ReWrite(ArquivoLog);
     WriteLn(ArquivoLog,'Nome Arquivo de Retorno: ' + sNomeArquivo);
     WriteLn(ArquivoLog,'');
     //Abre Arquivo de Retorno

     AssignFile(ArquivoTexto,sNomeArquivo);
     Reset(ArquivoTexto);

     PrimeiraLinha := True;

     While Not Eof(ArquivoTexto) Do
     Begin
        sDataPagto    := '';
        sValorPagto   := '';
        sOcorrencias  := '';
        sCodDocumento := '';
        sNomeEmpresa  := '';

        // Lê cabeçalho do retorno para comparar com empresa proprietária logada
        If PrimeiraLinha Then
        Begin
          iLogErro := 0;
          ReadLn(ArquivoTexto,sLinha);
          WriteLn(ArquivoLog,'Nome da Empresa: ' + Copy(sLinha,73,30));
          WriteLn(ArquivoLog,'');
          PrimeiraLinha := False;
        End
        Else
        Begin
          ReadLn(ArquivoTexto,sLinha);

          If (Copy(sLinha,14,1) = 'A') And (Copy(sLinha,8,1) = '3') Then
          Begin
               iLogErro := 1;
               sCodDocumento   := Copy(sLinha,74,20); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,155,8))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,163,15),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := '''' + Copy(sLinha,231,2) + '''';   // Ocorrencias
               WriteLn(ArquivoLog,'Código de Ocorrência ....................' + sOcorrencias);
               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;

          If (Copy(sLinha,14,1) = 'J')  And (Copy(sLinha,8,1) = '3') Then
          Begin
               iLogErro := 1;
               sCodDocumento   := Copy(sLinha,183,20); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,145,8))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,153,15),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := '''' + Copy(sLinha,231,2) + '''';   // Ocorrencias
               WriteLn(ArquivoLog,'Código de Ocorrência ....................' + sOcorrencias);
               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;
        end;
     End;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     if bExibeArquivoGerado then
       VisualizaArquivo(Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG','');
     Result := ListaRetornoSispag;
   Except
     DescreveErro;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     Raise;
   End;
 End;
End;

function TRetornoSispag.RetornoSispagBB: TStrings;     //MARIA
Var sLinha: String;

Begin
 With IntBancoManager Do
 Begin
   Try
     ListaRetornoSispag := TStringList.Create;
     //Cria Arquivo de Log
     AssignFile(ArquivoLog,Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG');
     ReWrite(ArquivoLog);
     WriteLn(ArquivoLog,'Nome Arquivo de Retorno: ' + sNomeArquivo);
     WriteLn(ArquivoLog,'');
     //Abre Arquivo de Retorno

     AssignFile(ArquivoTexto,sNomeArquivo);
     Reset(ArquivoTexto);

     IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket(' SELECT CODIGO , CODIGO || '' - '' || DESCRICAO || '' '' || ' +
                                                                  ' DECODE(FLGINDICABAIXA,''S'',''(DOCUMENTO QUITADO)'','' '') AS DESCR ' +
                                                                  ' FROM CODIGOSCNAB WHERE IDMODELOSCNAB=18 AND RECPAG=''P''');
     PrimeiraLinha := True;

     While Not Eof(ArquivoTexto) Do
     Begin
        sDataPagto    := '';
        sValorPagto   := '';
        sOcorrencias  := '';
        sCodDocumento := '';
        sNomeEmpresa  := '';

        // Lê cabeçalho do retorno para comparar com empresa proprietária logada
        If PrimeiraLinha Then
        Begin
          iLogErro := 0;
          ReadLn(ArquivoTexto,sLinha);
          WriteLn(ArquivoLog,'Nome da Empresa: ' + Copy(sLinha,73,30));
          WriteLn(ArquivoLog,'');
          PrimeiraLinha := False;
        End
        Else
        Begin
          ReadLn(ArquivoTexto,sLinha);

          If (Copy(sLinha,14,1) = 'A') And (Copy(sLinha,8,1) = '3') Then
          Begin
               iLogErro := 1;

               WriteLn(ArquivoLog,'Favorecido          .....................' + Copy(sLinha,44,30));

               sCodDocumento   := Copy(sLinha,74,20); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,155,8))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,163,15),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := sOcorrencias+'''' + Copy(sLinha,231,2) + '''';
               IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,231,2),[]);
               WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,233,2)) <> '') then    // Ocorrencias
               begin
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,233,2),[]);
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+'''' + Copy(sLinha,233,2) + '''';   // Ocorrencias
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,235,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,235,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,235,2) + '''';   // Ocorrencias
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,237,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,237,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,237,2) + '''';   // Ocorrencias
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,239,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,239,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,239,2) + '''';   // Ocorrencias

               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;

          If (Copy(sLinha,14,1) = 'J')  And (Copy(sLinha,8,1) = '3') Then
          Begin
               iLogErro := 1;
               WriteLn(ArquivoLog,'Favorecido          .....................' + Copy(sLinha,62,30));

               sCodDocumento   := Copy(sLinha,183,20); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,145,8))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,153,15),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := sOcorrencias+'''' + Copy(sLinha,231,2) + '''';
               IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,231,2),[]);
               WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,233,2)) <> '') then    // Ocorrencias
               begin
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,233,2),[]);
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+'''' + Copy(sLinha,233,2) + '''';   // Ocorrencias
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,235,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,235,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,235,2) + '''';   // Ocorrencias
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,237,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,237,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,237,2) + '''';   // Ocorrencias
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,239,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,239,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,239,2) + '''';   // Ocorrencias

               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;

          If (Copy(sLinha,14,1) = 'K')  And (Copy(sLinha,8,1) = '3') Then
          Begin
               iLogErro := 1;
               WriteLn(ArquivoLog,'Favorecido          .....................' + Copy(sLinha,129,30));

               sCodDocumento   := Copy(sLinha,159,20); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,199,8))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,207,15),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := sOcorrencias+'''' + Copy(sLinha,231,2) + '''';
               IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,231,2),[]);
               WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,233,2)) <> '') then    // Ocorrencias
               begin
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,233,2),[]);
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+'''' + Copy(sLinha,233,2) + '''';   // Ocorrencias
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,235,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,235,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,235,2) + '''';   // Ocorrencias
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,237,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,237,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,237,2) + '''';   // Ocorrencias
               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,239,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,239,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;
               sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,239,2) + '''';   // Ocorrencias

               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;


        end;
     End;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     if bExibeArquivoGerado then
       VisualizaArquivo(Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG','');
     Result := ListaRetornoSispag;
   Except
     DescreveErro;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     Raise;
   End;
 End;
End;


function TRetornoSispag.RetornoPagReal:TStrings;
Var sLinha: String;
Begin
 With IntBancoManager Do
 Begin
   Try
     ListaRetornoSispag := TStringList.Create;
     //Cria Arquivo de Log
     AssignFile(ArquivoLog,Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG');
     ReWrite(ArquivoLog);
     WriteLn(ArquivoLog,'Nome Arquivo de Retorno: ' + sNomeArquivo);
     //Abre Arquivo de Retorno

     AssignFile(ArquivoTexto,sNomeArquivo);
     Reset(ArquivoTexto);

     PrimeiraLinha := True;

     sNomeEmpresa  := '';

     While Not Eof(ArquivoTexto) Do
     Begin
        sDataPagto    := '';
        sValorPagto   := '';
        sOcorrencias  := '';
        sCodDocumento := '';

        //Lê cabeçalho do retorno para comparar com empresa proprietária logada
        If PrimeiraLinha Then
        Begin
          iLogErro := 0;
          ReadLn(ArquivoTexto,sLinha);
          WriteLn(ArquivoLog,'Nome da Empresa: ' + Copy(sLinha,47,30));
          PrimeiraLinha := False;
        End
        Else
        Begin
          ReadLn(ArquivoTexto,sLinha);

          If (Copy(sLinha,1,1) = '3')  Then
          Begin
               iLogErro := 1;
               sCodDocumento   := Copy(sLinha, 24,15); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento: ' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,39,6))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência: ' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,46,15),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago: ' + sValorPagto);

               iLogErro := 4;
               If Copy(sLinha,364,1) = '0' Then
                  sOcorrencias := '01,' + Copy(sLinha,114,3) + ',' + Copy(sLinha,117,3)
               Else
                  sOcorrencias := Copy(sLinha,364,1) + ',' + Copy(sLinha,114,3) + ',' + Copy(sLinha,117,3);   // Ocorrencias

               WriteLn(ArquivoLog,'Código de Ocorrência: ' + sOcorrencias);
          End;

          EncheListaRetornoSispag;
        end;
     End;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     if bExibeArquivoGerado then
       VisualizaArquivo(Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG','');
     Result := ListaRetornoSispag;
   Except
     DescreveErro;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     Raise;
   End;
 End;
End;


function TRetornoSispag.RetornoSispagHSBC:TStrings;
Var sLinha: String;
Begin
 With IntBancoManager Do
 Begin
   Try
     ListaRetornoSispag := TStringList.Create;
     //Cria Arquivo de Log
     AssignFile(ArquivoLog,Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG');
     ReWrite(ArquivoLog);
     WriteLn(ArquivoLog,'Nome Arquivo de Retorno: ' + sNomeArquivo);
     WriteLn(ArquivoLog,'');
     //Abre Arquivo de Retorno

     AssignFile(ArquivoTexto,sNomeArquivo);
     Reset(ArquivoTexto);

     PrimeiraLinha := True;

     While Not Eof(ArquivoTexto) Do
     Begin
        sDataPagto    := '';
        sValorPagto   := '';
        sOcorrencias  := '';
        sCodDocumento := '';
        sNomeEmpresa  := '';

        // Lê cabeçalho do retorno para comparar com empresa proprietária logada
        If PrimeiraLinha Then
        Begin
          iLogErro := 0;
          ReadLn(ArquivoTexto,sLinha);
          WriteLn(ArquivoLog,'Nome da Empresa: ' + Copy(sLinha,73,30));
          WriteLn(ArquivoLog,'');
          PrimeiraLinha := False;
        End
        Else
        Begin
          ReadLn(ArquivoTexto,sLinha);

          If (Copy(sLinha,14,1) = 'A') And (Copy(sLinha,8,1) = '3') Then
          Begin
               iLogErro := 1;
               sCodDocumento   := Copy(sLinha,74,16); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,94,8))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,122,13),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := '''' + Copy(sLinha,231,2) + '''';   // Ocorrencias
               WriteLn(ArquivoLog,'Código de Ocorrência ....................' + sOcorrencias);
               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;

          If (Copy(sLinha,14,1) = 'J')  And (Copy(sLinha,8,1) = '3') Then
          Begin
               iLogErro := 1;
               sCodDocumento   := Copy(sLinha,183,20); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,145,8))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,155,13),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := '''' + Copy(sLinha,231,2) + '''';   // Ocorrencias
               WriteLn(ArquivoLog,'Código de Ocorrência ....................' + sOcorrencias);
               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;

          If (Copy(sLinha,14,1) = 'K')  And (Copy(sLinha,8,1) = '3') Then
          Begin
               iLogErro := 1;
               sCodDocumento   := Copy(sLinha,159,20); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,199,8))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,209,13),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := '''' + Copy(sLinha,231,2) + '''';   // Ocorrencias
               WriteLn(ArquivoLog,'Código de Ocorrência ....................' + sOcorrencias);
               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;
        end;
     End;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     if bExibeArquivoGerado then
       VisualizaArquivo(Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG','');
     Result := ListaRetornoSispag;
   Except
     DescreveErro;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     Raise;
   End;
 End;
End;


function TRetornoSispag.RetornoSispagPagForBradesco: TStrings;
Var sLinha: String;
Begin
 With IntBancoManager Do
 Begin
   Try
     ListaRetornoSispag := TStringList.Create;
     { Cria Arquivo de Log }
     AssignFile(ArquivoLog,Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG');
     ReWrite(ArquivoLog);
     WriteLn(ArquivoLog,'Nome Arquivo de Retorno: ' + sNomeArquivo);
     WriteLn(ArquivoLog,'');
     { Abre Arquivo de Retorno }

     AssignFile(ArquivoTexto,sNomeArquivo);
     Reset(ArquivoTexto);

     PrimeiraLinha := True;
     While Not Eof(ArquivoTexto) Do
     Begin
        sDataPagto    := '';
        sValorPagto   := '';
        sOcorrencias  := '';
        sCodDocumento := '';
        sNomeEmpresa  := '';

        { Lê cabeçalho do retorno para comparar com empresa proprietária logada }
        If PrimeiraLinha Then
        Begin
          iLogErro := 0;
          ReadLn(ArquivoTexto,sLinha);
          WriteLn(ArquivoLog,'Nome da Empresa: ' + Copy(sLinha,26,40));
          WriteLn(ArquivoLog,'');
          PrimeiraLinha := False;
        End
        Else
        Begin
          Try
            ReadLn(ArquivoTexto,sLinha);
            iLogErro := 1;
            sCodDocumento   := Copy(sLinha,416,35); //Código Do Documento
            WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

            iLogErro := 2;
            sDataPagto := Copy(sLinha,266,8);
            sDataPagto := Copy(sDataPagto,7,2) + Copy(sDataPagto,5,2) + Copy(sDataPagto,1,4);
            sDataPagto := DateToStr(DevolveBarras(sDataPagto)); // Data Da Ocorrência
            WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

            iLogErro := 3;
            sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,205,15),2)); // Valor Pago
            WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

            iLogErro := 4;
            sOcorrencias := '''' + Copy(sLinha,279,2) + '''';   // Ocorrencias
            WriteLn(ArquivoLog,'Código de Ocorrência ....................' + sOcorrencias);
            WriteLn(ArquivoLog,'');

            EncheListaRetornoSispag;
          Except
          End;
        End;
     End;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     if bExibeArquivoGerado then
       VisualizaArquivo(Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG','');
     Result := ListaRetornoSispag;
   Except
     DescreveErro;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     Raise;
   End;
 End;
End;


function TRetornoSispag.RetornoPagForSANTANDER: TStrings;
Var sLinha: String;
Begin
 With IntBancoManager Do
 Begin
   Try
     ListaRetornoSispag := TStringList.Create;
     //Cria Arquivo de Log
     AssignFile(ArquivoLog,Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG');
     ReWrite(ArquivoLog);
     WriteLn(ArquivoLog,'Nome Arquivo de Retorno: ' + sNomeArquivo);
     WriteLn(ArquivoLog,'');
     //Abre Arquivo de Retorno

     AssignFile(ArquivoTexto,sNomeArquivo);
     Reset(ArquivoTexto);

     PrimeiraLinha := True;

     While Not Eof(ArquivoTexto) Do
     Begin
        sDataPagto    := '';
        sValorPagto   := '';
        sOcorrencias  := '';
        sCodDocumento := '';
        sNomeEmpresa  := '';

        // Lê cabeçalho do retorno para comparar com empresa proprietária logada
        If PrimeiraLinha Then
        Begin
          iLogErro := 0;
          ReadLn(ArquivoTexto,sLinha);
          WriteLn(ArquivoLog,'Nome da Empresa: ' + Copy(sLinha,47,30));
          WriteLn(ArquivoLog,'');
          PrimeiraLinha := False;
        End
        Else
        Begin
          ReadLn(ArquivoTexto,sLinha);

          If (Copy(sLinha,108,1) = 'L') Then
          Begin
               iLogErro := 1;
               sCodDocumento   := Copy(sLinha,80,10); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,111,6))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,218,13),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := '''' + Copy(sLinha,109,2) + '''';   // Ocorrencias
               WriteLn(ArquivoLog,'Código de Ocorrência ....................' + sOcorrencias);
               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;

        end;
     End;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     if bExibeArquivoGerado then
       VisualizaArquivo(Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG','');
     Result := ListaRetornoSispag;
   Except
     DescreveErro;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     Raise;
   End;
 End;
End;

function TRetornoSispag.RetornoPagForBBV: TStrings;
Var sLinha: String;
Begin
 With IntBancoManager Do
 Begin
   Try
     ListaRetornoSispag := TStringList.Create;
     //Cria Arquivo de Log
     AssignFile(ArquivoLog,Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG');
     ReWrite(ArquivoLog);
     WriteLn(ArquivoLog,'Nome Arquivo de Retorno: ' + sNomeArquivo);
     WriteLn(ArquivoLog,'');
     //Abre Arquivo de Retorno

     AssignFile(ArquivoTexto,sNomeArquivo);
     Reset(ArquivoTexto);

     PrimeiraLinha := True;

     While Not Eof(ArquivoTexto) Do
     Begin
        sDataPagto    := '';
        sValorPagto   := '';
        sOcorrencias  := '';
        sCodDocumento := '';
        sNomeEmpresa  := '';

        // Lê cabeçalho do retorno para comparar com empresa proprietária logada
        If PrimeiraLinha Then
        Begin
          iLogErro := 0;
          ReadLn(ArquivoTexto,sLinha);
          WriteLn(ArquivoLog,'Nome da Empresa: ' + Copy(sLinha,47,30));
          WriteLn(ArquivoLog,'');
          PrimeiraLinha := False;
        End
        Else
        Begin
          ReadLn(ArquivoTexto,sLinha);
          try
          iLogErro := 1;
          sCodDocumento   := Copy(sLinha,243,10); // Código Do Documento
          WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

          iLogErro := 2;
          sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,47,6))); // Data Da Ocorrência
          WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

          iLogErro := 3;
          sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,11,15),2)); // Valor Pago
          WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

          iLogErro := 4;
          sOcorrencias := '''' + Copy(sLinha,2,2) + '''';   // Ocorrencias
          WriteLn(ArquivoLog,'Código de Ocorrência ....................' + sOcorrencias);
          WriteLn(ArquivoLog,'');

          EncheListaRetornoSispag;
          except
          end;
        end;
     End;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     if bExibeArquivoGerado then
       VisualizaArquivo(Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG','');
     Result := ListaRetornoSispag;
   Except
     DescreveErro;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     Raise;
   End;
 End;
End;



//início - André Tavares - pendência 21659 - 28/03/2006 - Recebimento Automático do
//Banco Banespa Cnab 240 - Pagto de Fornecedores (idmodelosCnab = 55)
function TRetornoSispag.RetornoSispagBanespa: TStrings;
Var sLinha: String;
Begin
 With IntBancoManager Do
 Begin
   Try
     ListaRetornoSispag := TStringList.Create;
     //Cria Arquivo de Log
     AssignFile(ArquivoLog,Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG');
     ReWrite(ArquivoLog);
     WriteLn(ArquivoLog,'Nome Arquivo de Retorno: ' + sNomeArquivo);
     WriteLn(ArquivoLog,'');
     //Abre Arquivo de Retorno

     AssignFile(ArquivoTexto,sNomeArquivo);
     Reset(ArquivoTexto);

     IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket(' SELECT CODIGO , CODIGO || '' - '' || DESCRICAO || '' '' || ' +
                                                                  ' DECODE(FLGINDICABAIXA,''S'',''(DOCUMENTO QUITADO)'','' '') AS DESCR ' +
                                                                  ' FROM CODIGOSCNAB WHERE IDMODELOSCNAB = 55 AND RECPAG = ''P''');
     PrimeiraLinha := True;

     While Not Eof(ArquivoTexto) Do
     Begin
        sDataPagto    := '';
        sValorPagto   := '';
        sOcorrencias  := '';
        sCodDocumento := '';
        sNomeEmpresa  := '';

        // Lê cabeçalho do retorno para comparar com empresa proprietária logada
        If PrimeiraLinha Then
        Begin
          iLogErro := 0;
          ReadLn(ArquivoTexto,sLinha);
          WriteLn(ArquivoLog,'Nome da Empresa: ' + Copy(sLinha,73,30));
          WriteLn(ArquivoLog,'');
          PrimeiraLinha := False;
        End
        Else
        Begin
          ReadLn(ArquivoTexto,sLinha);

          If (Copy(sLinha,14,1) = 'A') And (Copy(sLinha,8,1) = '3') Then
          Begin
               iLogErro := 1;

               WriteLn(ArquivoLog,'Favorecido          .....................' + Copy(sLinha,44,30));

               sCodDocumento   := trim(Copy(sLinha,74,20)); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,155,8))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,163,15),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := sOcorrencias+'''' + Copy(sLinha,231,2) + '''';
               IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,231,2),[]);
               WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,233,2)) <> '') then    // Ocorrencias
               begin
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,233,2),[]);
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,233,2)) <> '' then
                 sOcorrencias := sOcorrencias+'''' + Copy(sLinha,233,2) + '''';   // Ocorrencias

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,235,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,235,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,235,2)) <> '' then
                 sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,235,2) + '''';   // Ocorrencias

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,237,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,237,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,237,2)) <> '' then
                 sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,237,2) + '''';   // Ocorrencias

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,239,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,239,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,239,2)) <> '' then
                 sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,239,2) + '''';   // Ocorrencias

               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;

          If (Copy(sLinha,14,1) = 'J')  And (Copy(sLinha,8,1) = '3') Then
          Begin
               iLogErro := 1;
               WriteLn(ArquivoLog,'Favorecido          .....................' + Copy(sLinha,62,30));

               sCodDocumento   := trim(Copy(sLinha,183,20)); // Código Do Documento
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,145,8))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,153,15),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := sOcorrencias+'''' + Copy(sLinha,231,2) + '''';
               IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,231,2),[]);
               WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,233,2)) <> '') then    // Ocorrencias
               begin
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,233,2),[]);
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,233,2)) <> '' then
                 sOcorrencias := sOcorrencias+'''' + Copy(sLinha,233,2) + '''';   // Ocorrencias

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,235,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,235,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,235,2)) <> '' then
                 sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,235,2) + '''';   // Ocorrencias

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,237,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,237,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,237,2)) <> '' then
                 sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,237,2) + '''';   // Ocorrencias

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,239,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,239,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,239,2)) <> '' then
                 sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,239,2) + '''';   // Ocorrencias

               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;

        end;
     End;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     if bExibeArquivoGerado then
       VisualizaArquivo(Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG','');
     Result := ListaRetornoSispag;
   Except
     DescreveErro;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     Raise;
   End;
 End;
End;
//fim - André Tavares - pendência 21659 - 28/03/2006



function TRetornoSispag.RetornoSisPagBESC: TStrings;
Var sLinha: String;
Begin
 With IntBancoManager Do
 Begin
   Try
     ListaRetornoSispag := TStringList.Create;
     //Cria Arquivo de Log
     AssignFile(ArquivoLog,Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG');
     ReWrite(ArquivoLog);
     WriteLn(ArquivoLog,'Nome Arquivo de Retorno: ' + sNomeArquivo);
     WriteLn(ArquivoLog,'');
     //Abre Arquivo de Retorno

     AssignFile(ArquivoTexto,sNomeArquivo);
     Reset(ArquivoTexto);

     IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket(' SELECT CODIGO , CODIGO || '' - '' || DESCRICAO || '' '' || ' +
                                                                  ' DECODE(FLGINDICABAIXA,''S'',''(DOCUMENTO QUITADO)'','' '') AS DESCR ' +
                                                                  ' FROM CODIGOSCNAB WHERE IDMODELOSCNAB = 58 AND RECPAG = ''P''');
     PrimeiraLinha := True;

     While Not Eof(ArquivoTexto) Do
     Begin
        sDataPagto    := '';
        sValorPagto   := '';
        sOcorrencias  := '';
        sCodDocumento := '';
        sNomeEmpresa  := '';

        // Lê cabeçalho do retorno para comparar com empresa proprietária logada
        If PrimeiraLinha Then
        Begin
          iLogErro := 0;
          ReadLn(ArquivoTexto,sLinha);
          WriteLn(ArquivoLog,'Nome da Empresa: ' + Copy(sLinha,73,30));
          WriteLn(ArquivoLog,'');
          PrimeiraLinha := False;
        End
        Else
        Begin
          ReadLn(ArquivoTexto,sLinha);

          If (Copy(sLinha,14,1) = 'A') And (Copy(sLinha,8,1) = '3') Then
          Begin
               iLogErro := 1;

               WriteLn(ArquivoLog,'Favorecido          .....................' + Copy(sLinha,44,30));

               //sCodDocumento   := trim(Copy(sLinha,74,20)); // Código Do Documento
               sCodDocumento   := trim(Copy(sLinha, 187, 31)); // Código Do Documento - andre tavares - 06/07/2007
               WriteLn(ArquivoLog,'Código Do Documento .....................' + sCodDocumento);

               iLogErro := 2;
               sDataPagto := DateToStr(DevolveBarras(Copy(sLinha,155,8))); // Data Da Ocorrência
               WriteLn(ArquivoLog,'Data Da Ocorrência ......................' + sDataPagto);

               iLogErro := 3;
               sValorPagto := FloatToStr(DevolveVirgulas(Copy(sLinha,163,15),2)); // Valor Pago
               WriteLn(ArquivoLog,'Valor Total Pago ........................' + sValorPagto);

               iLogErro := 4;
               sOcorrencias := sOcorrencias+'''' + Copy(sLinha,231,2) + '''';
               IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,231,2),[]);
               WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,233,2)) <> '') then    // Ocorrencias
               begin
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,233,2),[]);
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,233,2)) <> '' then
                 sOcorrencias := sOcorrencias+'''' + Copy(sLinha,233,2) + '''';   // Ocorrencias

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,235,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,235,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,235,2)) <> '' then
                 sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,235,2) + '''';   // Ocorrencias

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,237,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,237,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,237,2)) <> '' then
                 sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,237,2) + '''';   // Ocorrencias

               if (trim(sOcorrencias)<>'' ) and ( trim(Copy(sLinha,239,2)) <> '') then    // Ocorrencias
               begin
                   IntBancoManager.CdsAux.locate('codigo',Copy(sLinha,239,2),[]);
                   sOcorrencias:=sOcorrencias+#39+' '+#39;
                   WriteLn(ArquivoLog,'Ocorrência       ........................' +IntBancoManager.CdsAux.fieldbyname('descr').asstring  );
               end;

               if trim(Copy(sLinha,239,2)) <> '' then
                 sOcorrencias := sOcorrencias+ '''' + Copy(sLinha,239,2) + '''';   // Ocorrencias

               WriteLn(ArquivoLog,'');

               EncheListaRetornoSispag;
          End;

        end;
     End;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     if bExibeArquivoGerado then
       VisualizaArquivo(Copy(sNomeArquivo,1,Pos('.',sNomeArquivo))+ 'LOG','');
     Result := ListaRetornoSispag;
   Except
     DescreveErro;
     CloseFile(ArquivoTexto);
     CloseFile(ArquivoLog);
     Raise;
   End;
 End;
end;

end.
