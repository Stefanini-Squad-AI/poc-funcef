{********************************************************************}
{                                                                    }
{ CM Soluções Informática  - CMIntBanco50                            }
{ ** Todos os Direitos Reservados                                    }
{                                                                    }
{ - TCobranca - Classe genérica para arquivos IntBanco               }
{                                                                    }
{   UNIBANCO - COBRANÇA REGISTRADA                                   }
{   IDMODELOSCNAB = 2/R                                              }
{                                                                    }
{   BANCO REAL SEM REGISTRO                                          }
{   IDMODELOSCNAB = 3/R                                              }
{                                                                    }
{   BANCO REAL CÓDIGO DE BARRAS                                      }
{   DMODELOSCNAB = 5/R                                               }
{                                                                    }
{   BCN - COBRANÇA ESCITURAL                                         }
{   IDMODELOSCNAB = 6/R                                              }
{                                                                    }
{   CEF - COBRANÇA ELETRÔNICA                                        }
{   IDMODELOSCNAB = 8/R                                              }
{                                                                    }
{   COBRANÇA NÃO REGISTRADA HSBC                                     }
{   IDMODELOSCNAB = 9/R                                              }
{                                                                    }
{   COBRANÇA REGISTRADA BANCO REAL                                   }
{   IDMODELOSCNAB = 11/R                                             }
{                                                                    }
{   BANCO DO BRASIL DEBITO AUTOMÁTICO                                }
{   IDMODELOSCNAB = 12/R                                             }
{                                                                    }
{   BANCO REAL DEBITO AUTOMÁTICO                                     }
{   IDMODELOSCNAB = 13/R                                             }
{                                                                    }
{   CEF DEBITO AUTOMÁTICO                                            }
{   IDMODELOSCNAB = 14/R                                             }
{                                                                    }
{   BICBANCO REMESSA                                                 }
{   IDMODELOSCNAB = 16/R                                             }
{                                                                    }
{   COBRANÇA REGISTRADA  BANCO SAFRA                                 }
{   IDMODELOSCNAB = 17/R                                             }
{                                                                    }
{   COBRANÇA ESCRITURAL BANCO DE BOSTON                              }
{   IDMODELOSCNAB = 18/R                                             }
{                                                                    }
{   BANCO CIDADE                                                     }
{   IDMODELOSCNAB = 19/R                                             }
{                                                                    }
{   COBRANCA REGISTRADA HSBC                                         }
{   IDMODELOSCNAB = 20/R                                             }
{                                                                    }
{   COBRANÇA ELETRÔNICA BANRISUL                                     }
{   IDMODELOSCNAB = 21/R                                             }
{                                                                    }
{   COBRANÇA ELETRÔNICA BBV                                          }
{   IDMODELOSCNAB = 22/R                                             }
{                                                                    }
{   COBRANÇA SEM REGISTRO UNIBANCO                                   }
{   IDMODELOSCNAB = 23/R                                             }
{                                                                    }
{                                                                    }
{ Analista Responsável: Gustavo Viegas                               }
{ Atualizado Em: 28/06/2001                                          }
{                17/07/2001 - FÁBIO BARROS                           }
{                23/07/2001 - FÁBIO BARROS                           }
{                08/10/2001 - FÁBIO BARROS                           }
{                05/11/2001 - FÁBIO BARROS                           }
{                30/11/2001 - FÁBIO BARROS                           }
{                01/12/2001 - FÁBIO BARROS                           }
{                02/12/2001 - FÁBIO BARROS                           }
{                04/12/2001 - FÁBIO BARROS                           }
{                11/12/2001 - FÁBIO BARROS                           }
{                14/12/2001 - FÁBIO BARROS                           }
{                28/12/2001 - FÁBIO BARROS                           }
{                08/01/2002 - FÁBIO BARROS                           }
{                26/02/2002 - FÁBIO BARROS                           }
{                29/04/2002 - FÁBIO BARROS                           }
{                19/04/2004 - André Tavares - pendência 16382 - Layout do Banrisul  }
{                01/09/2004 - André Tavares - pendência 17531        }
{                                                                    }
{ ------------------------------------------------------------------ }
{ BiBlioteca.CodArquivoRemessa - Codigo sequencial do arquivo a ser gerado
{ BiBlioteca.NossoNumero - Último nosso número gerado na remessa anterior
{ rNossoNumero - Variável de controle do nosso número gerado na remessa atual
{********************************************************************}
unit uCobrancaMT;

interface

Uses Forms, Classes, SysUtils, Dialogs, Graphics, Controls,
     Windows; //, ucmFileUtils;

Type
   TCobranca = Class
   private
    {Arquivo de remessa a ser gerado}
    ArquivoRemessa: TextFile;
    {Número sequencial do documento no arquivo}
    iNumSeqDoc: Integer;
    {Total de Registros no Arquivo}
    iTotSeq: Integer;
    {Número sequencial do registro do arquivo}
    iNumSeq: Integer;
    {Total de Mensagens a serem geradas no arquivo}
    iTotMensagens: Integer;
    {Tipo de documento da empresa}
    sTipoInsc: String;
    {Número do documento da empresa}
    sCodInscEmpresa: String;
    {Valor total dos documento gerados no arquivo}
    rValorDocs: Real;
    {Nosso número calculado no arquivo}
    rNossoNumero: Real;

    {Digito verificador do modulo 10. O calculo deste digito é feito
     apenas na rotina do Banrisul - Cobrança Eletrônica }
    iDVmod10    : Double;
    iRestomod10 : Double;

    {Digito verificador do modulo 11. O calculo deste digito é feito
     apenas na rotina do Banrisul - Cobrança Eletrônica }
    iDVmod11    : Double;
    iRestomod11 : Double;

   public
    { Gera um TSTRINGLIST com as mensagens cadastradas para um Documento/Grupo }
    procedure GeraMensagens(var sAux : TStringList; TamanhoMensagem : Integer; bverso: boolean = false);
    { Gera arquivo de Remessa COBRANÇA REGISTRADA para o UNIBANCO }
    procedure MontaCobrancaRegistradaUnibanco;
    {Gera arquivo do Banco Real Sem Ocorrência de Retorno}
    procedure RealSR;
    {Gera Arquivo do Banco Real para impressão de Ficha de Compensação}
    procedure RealBarras;
    {Gera Arquivo do Banro Real para cobrança registrada ( com ocorrencia de retorno)}
    procedure RealRegistrada;
    {Gera arquivo de cobrança do banco BCN}
    procedure Bcn;
    {Gera arquivo de cobrança da Caixa}
    procedure CEF;
    {Gera arquivo de COBRANÇA NÃO REGISTRADA do HSBC}
    procedure HSBC;
    {Gera arquivo de registro de Débito Automático para os bancos Banco do Brasil, Banco Real e Caixa}
    procedure MontaDebitoProgramado(sNumBanco,sNomeBanco,sArquivo :String);
    { Gera arquivo de Remessa para o BICBANCO}
    procedure MontaBicBanco;
    { Gera arquivo de Remessa CORBRANÇA REGISTRADA para o BANCO SAFRA}
    procedure MontaSafraRegistrada;
    { Gera arquivo de Remessa CORBRANÇA ESCRITURAL para o BANCO DE BOSTON}
    procedure MontaBancoBostonEscritural;
    { Gera arquivo de Remessa para o BANCO CIDADE }
    procedure MontaBancoCidade;
    { Gera arquivo de Remessa COBRANÇA REGISTRADA para o BANCO HSBC }
    procedure MontaRegistradaHSBC;
    { Gera arquivo de Remessa COBRANÇA ELETRÔNICA para o BANCO BANRISUL }
    procedure MontaCobrancaEletronicaBanrisul;
     {Retorna o DV calculado para o padrão MODULO 10
      utilizado na geração do arquivo do BANRISUL - Cobrança Eletônica}
      function Modulo10Banrisul(sNossoNumero: String): String;
     {Retorna o DV calculado para o padrão MODULO 11
      utilizado na geração do arquivo do BANRISUL - Cobrança Eletônica}
      function Modulo11Banrisul(sNossoNumero: String; Base: Integer): String;
    { Gera arquivo de Remessa COBRANÇA ELETRÔNICA para o BBV }
    procedure MontaCobrancaEletronicaBBV;
    { Gera arquivo de Remessa COBRANÇA SEM REGISTRO para o UNIBANCO }
    procedure MontaCobrancaSemRegistroUnibanco;
    { Gera arquivo de Débito Automático para o BANRISUL }
    procedure GeraDebAutBanrisul;
end;

Var
  Cobranca: TCobranca;

implementation

Uses uContaBancariaMT, uIntBancoManager, uString, uCmDialogs, uSistema;

// -----------------------------------------------------------------------------
procedure TCobranca.GeraMensagens(var sAux : TStringList; TamanhoMensagem : Integer; bverso: boolean = false);
var
  x : Integer;
begin
  sAux.Clear;
  if IntBancoManager.MontaSqlTestaMensagem(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString, bverso) Then
  begin
//início - André Tavares - pendência 17041 - 21/06/2004
{    for x := 0 to 8 do
    begin
      sAux.Append(AE(IntBancoManager.CdsMensagens.Fields[x].AsString, TamanhoMensagem));
    end;
}
    if bverso then
    begin
      IntBancoManager.CdsMensagens.first;
      while not IntBancoManager.CdsMensagens.Eof do
      begin
        for x := 0 to 19 do
          sAux.Append(AE(IntBancoManager.CdsMensagens.Fields[x].AsString, TamanhoMensagem));
        IntBancoManager.CdsMensagens.Next;
      end; // while
    end
    else
    begin
      for x := 0 to 9 do
        sAux.Append(AE(IntBancoManager.CdsMensagens.Fields[x].AsString, TamanhoMensagem));
    end;
//fim - André Tavares - pendência 17041 - 21/06/2004

  end;
end;
// -----------------------------------------------------------------------------


procedure TCobranca.RealSR;
var
  sMensagens : TStringList;
  X          : Integer;
  Mensagens  : String;
  { Última Atualização - 11/12/2001 - Fábio Barros }
begin
  rValorDocs        := 0;
  iNumSeq           := 1;
  sTipoInsc         := '02';
  iNumSeqDoc        := 0;
  rNossoNumero      := StrToFloat(IntBancoManager.NossoNumero);

  Try
    If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
       sCodInscEmpresa := '02'
    Else
       sCodInscEmpresa := '01';

    IntBancoManager.sNomeArquivo := ExtractFilePAth(IntBancoManager.sNomeArquivo) + 'REALCOBR.TXT';
    AssignFile(ArquivoRemessa, IntBancoManager.sNomeArquivo);
    ReWrite(ArquivoRemessa);
    { Header }
    WriteLn(ArquivoRemessa,Concat('0', //Código do Registro
                                  AE('1REMESSA01COBRANCA',25), //Constante
                                  '0', //Zero
                                  ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência
                                  '0', //Zero
                                  ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                                  Spc(7), //Vago
                                  AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30),//Nome do Cedente
                                  '356', //Nº do Banco
                                  AE('BANCO REAL  S.A.',15),//Nome do Banco
                                  REMOVEBARRAS(DateToStr(Date)), //Data do Processamento
                                  '01600BPI', //Constante
                                  SPC(282), //Vago
                                  ZD(IntBancoManager.CodArquivoRemessa,4), //Sequencia do Movimento
                                  ZD(IntToStr(iNumSeq),6))); //Nº Sequencial do Registro no arquivo
    Inc(iNumSeq);
    //Transação
    IntBancoManager.CdsTexto.First;
    While Not IntBancoManager.CdsTexto.Eof Do
    Begin
      If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
         sTipoInsc := '01'
      Else
         sTipoInsc := '02';

      rNossoNumero := rNossoNumero + 1;
      WriteLn(ArquivoRemessa,
              Concat('1', //codigo de registro
                     sCodInscEmpresa,//codigo de inscricao
                     FormataCgcCpfConta(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, sCodInscEmpresa), //Numero de Inscricao
                     '0',//Zero
                     ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agencia Cedente
                     '0', //Zero
                     ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                     Spc(32),//Vago
                     '00', //Zero
                     AE(IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,13), //ident titulo empresa
                     Spc(31), //Vago
                     '01', //Código da Ocorrência, Indica Entrada
                     Spc(10),
                     REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //data venciento
                     ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor
                     '356', //Identificação do Banco
                     Spc(5), //Vago
                     '01', //Espécie de Título
                     spc(1), //Vago
                     REMOVEBARRAS(DateToStr(Date)), //data emissao
                     Spc(4), //Vago
                     ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), //valor do Juros/Dia
                     REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), //Data limite desconto
                     ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //valor do desconto
                     ZD('0',13), //Valor IOC
                     ZD('0',13), //Valor Abatimento
                     sTipoInsc, //Cod Inscrição do Sacado

                     FormataCgcCpfConta(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,sTipoInsc), //numero de inscricao

                     AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40),
                     AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                             IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                             IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40),
                     AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,12),
                     ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                     AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                     AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),
                     Spc(40), //Nome do Sacador
                     spc(1), //Vago
                     '7', //Valor Moeda
                     '7', //Tipo de Moeda
                     Zd(IntToStr(iNumSeq),6)));
      Inc(iNumSeq);

{ -----------------------------------------------------------------------------
  Mensagens deste modelo
 ----------------------------------------------------------------------------- }
      sMensagens := TStringList.Create;
      GeraMensagens(sMensagens, 69);
      mensagens  := '';
      for x := 0 to 4 do
      begin
        try
          Mensagens := Mensagens + sMensagens.Strings[x] + '3'
        except
          Mensagens := Mensagens + spc(69) + '3'
        end;
      end;
      if sMensagens.Count <> 0 Then
      begin
      { Monta Mensagens Layout 1 }
        WriteLn(ArquivoRemessa,
                Concat('7', //codigo de registro
                       '1', //Sequencia do Registro da Mensagem
                       ZD(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,4), //Agência//Agencia Cedente
                       ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                       '00', //Zeros
                       AE(IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), //Número do Título
                       Mensagens,
                       Spc(4),
                       Zd(IntToStr(iNumSeq),6)));
        Inc(iNumSeq);
        if iTotMensagens > 5 then
        begin
          { Monta Mensagens Layout 2 }
          mensagens  := '';
          for x := 5 to 8 do
          begin
            try
              Mensagens := Mensagens + sMensagens.Strings[x] + '3'
            except
              Mensagens := Mensagens + spc(69) + '3'
            end;
          end;
          WriteLn(ArquivoRemessa,
                  Concat('7', //codigo de registro
                         '2', //Sequencia do Registro da Mensagem
                         ZD(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,4), //Agência//Agencia Cedente
                         ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                         '00', //Zeros
                         AE(IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), //Número do Título
                         Mensagens,
                         Spc(69),
                         '3', //Local da Mensagem
                         Spc(16),
                         Zd(IntToStr(iNumSeq),6)));
          Inc(iNumSeq);
        End;                                      
      End;
      { Libera a StringList que contém as Mensagens }
      sMensagens.Free;

      if not IntBancoManager.AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),IntBancoManager.CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
         raise Exception.Create(IntBancoManager.MessageInfo);

      rValorDocs := rValorDocs + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;
      Inc(iNumSeqDoc);
      IntBancoManager.CdsTexto.Next;
    End;

    { Trailer }
    WriteLn(ArquivoRemessa, Concat('9',  //Código do Registro
                                   Zd(IntToStr(iNumSeqDoc),6), //Quantidade de Título
                                   ZD(RemoveVirgulas(rValorDocs,2),13), //Valor Total no Arquivo
                                   SPC(374), //Vago
                                   Zd(IntToStr(iNumSeq),6))); //Número de Registros no Arquivo
    CloseFile(ArquivoRemessa);
    IntBancoManager.UltNossoNumero      := FloatToStr(rNossoNumero);
    IntBancoManager.UltCodArquivoGerado := IntBancoManager.CodArquivoRemessa;
    IntBancoManager.MostraArquivo;
  Except
    On E:Exception Do
    Begin
      MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message,'Atenção');
      CloseFile(ArquivoRemessa);
      Raise;
    End;
  End;
end;


procedure TCobranca.RealRegistrada;
Var
  X            : Integer;
  sMensagens   : TStringList;
  Mensagens,
  sNumero      : String;
{ Última Atualização - 11/12/2001 - Fábio Barros }
begin
   rValorDocs := 0;
   iNumSeq := 1;
   sTipoInsc := '02';
   iNumSeqDoc := 0;
   rNossoNumero := StrToFloat(IntBancoManager.NossoNumero);
   Try
     If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
       sCodInscEmpresa := '02'
     Else
       sCodInscEmpresa := '01';

      IntBancoManager.sNomeArquivo := ExtractFilePAth(IntBancoManager.sNomeArquivo) + 'REALREG.TXT';
      AssignFile(ArquivoRemessa,IntBancoManager.sNomeArquivo);
      ReWrite(ArquivoRemessa);

      { Header }
      WriteLn(ArquivoRemessa,Concat('0', //Código do Registro
                                    AE('1REMESSA01COBRANCA',25), //Constante
                                    '0', //Zero
                                    ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4),//Agencia do Cedente
                                    '0', //Zero
                                    ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                                    Spc(7), //Vago
                                    AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30),//Nome do Cedente
                                    '356', //Nº do Banco
                                    AE('BANCO REAL  S.A.',15),//Nome do Banco
                                    REMOVEBARRAS(DateToStr(Date)), //Data do Processamento
                                    '01600BPI', //Constante
                                    SPC(286), //Vago
                                    ZD(IntToStr(iNumSeq),6))); //Nº Sequencial do Registro no arquivo
      Inc(iNumSeq);
      { Transação }
      IntBancoManager.CdsTexto.First;
      While not IntBancoManager.CdsTexto.Eof Do
      begin
        if IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
          sTipoInsc := '01'
        else
          sTipoInsc := '02';
        rNossoNumero := rNossoNumero + 1;

        sNumero := Trim(FloatToStr(rNossoNumero));

        // Clementino  27/03/2003
        // sNumero := Copy(Trim(sNumero),1,6) +
        //                IntToStr(CalculaDac10(ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,15) +
        //                                      ZD(COPY(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,1,4), 4) +
        //                                      ZD(COPY(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,1,7), 7)));
        sNumero := Copy(Trim(sNumero),1,7);
         WriteLn(ArquivoRemessa,
                Concat('1', //Codigo de Registro
                       sCodInscEmpresa,//Codigo de Inscricao
                       FormataCgcCpfConta(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,sCodInscEmpresa), //Numero de Inscricao
                       '0', //Zero
                       ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agencia do Cedente
                       '0', //Zero
                       ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), //Conta Cedente
                       spc(7), //Vago
                       ZD(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), //Campo Livre
                       '00', //Zeros
                       ZD(sNumero,7), //Identificação Titulo no Banco
                       '0', //Incidencia da Multa
                       ZD(IntBancoManager.BuscaParamIntBanco('NUMDIASPROTESTO','N'),2), //Dias p/multa
                       '0', //Tipo da Multa
                       ZD('0',13), //Multa
                       Spc(7), //Vago
                       zd('0',9), //contrato
                       Spc(3), //Vago
                       '5', //Carteira - COBRANÇA ESCRITURAL
                       '01', //Código da Ocorrência, Indica Entrada
                       AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,10), //ident titulo empresa
                       REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString), //data venciento
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor
                       '356', //Identificação do Banco
                       ZD('0',5), //Agencia Cobradora
                       ZD(IntBancoManager.BuscaParamIntBanco('ESPECIETITULO','N'),2),
                       'N',
                       REMOVEBARRAS(DateToStr(Date)), //data emissao
                       ZD(IntBancoManager.BuscaParamIntBanco('PROTESTO','N'),2), //Codigo do Protesto
                       spc(2), //Vago
                       '0',
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),12), //valor do Juros/Dia
                       REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), //Data limite desconto
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //valor do desconto
                       ZD('0',13), //Valor IOC
                       ZD('0',13), //Valor Abatimento
                       sTipoInsc, //Cod Inscrição do Sacado
                       FormataCgcCpfConta(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,sTipoInsc), //numero de inscricao
                       AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40),
                       AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                               IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                               IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40),
                       AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,12),
                       ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                       AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                       AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),
                       Spc(40), //Nome do Sacador
                       '0', // Valor / Moeda
                       '07', //Tipo de Moeda
                       Zd(IntToStr(iNumSeq),6)));
        Inc(iNumSeq);
{ -----------------------------------------------------------------------------
  Mensagens deste modelo
 ----------------------------------------------------------------------------- }
        sMensagens := TStringList.Create;
        GeraMensagens(sMensagens, 69);
        mensagens  := '';
        for x := 0 to 4 do
        begin
          try
            Mensagens := Mensagens + sMensagens.Strings[x] + '3'
          except
            Mensagens := Mensagens + spc(69) + '3'
          end;
        end;
        { Se for diferente de 0 significa que existe mensagens }
        if sMensagens.Count <> 0 Then
        begin
          { Monta Mensagens Layout 1 }
          WriteLn(ArquivoRemessa,
                  Concat('8', //codigo de registro
                         '10', //Sequencia do Registro da Mensagem
                         ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agência//Agencia Cedente
                         '0', //Zeros
                         ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                         AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,10), //Número do Título
                         Mensagens,
                         Spc(19),
                         Zd(IntToStr(iNumSeq),6)));
          Inc(iNumSeq);
          If iTotMensagens > 5 Then
          Begin
            mensagens  := '';
            for x := 5 to 8 do
            begin
              try
                Mensagens := Mensagens + sMensagens.Strings[x] + '3'
              except
                Mensagens := Mensagens + spc(69) + '3'
              end;
            end;
          //Monta Mensagens Layout 2
          WriteLn(ArquivoRemessa,
                  Concat('8', //codigo de registro
                         '20', //Sequencia do Registro da Mensagem
                         ZD(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,4), //Agência//Agencia Cedente
                         '0', //Zeros
                         ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                         AE(IntBancoManager.CdsTexto.FieldByName('noDocumento').AsString,10), //Número do Título
                         Mensagens,
                         Spc(69),
                         '3', //Local da Mensagem
                         Spc(19),
                        Zd(IntToStr(iNumSeq),6)));
          Inc(iNumSeq);
          End;
        End;
        sMensagens.Free;

        if not IntBancoManager.AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),IntBancoManager.CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
           raise Exception.Create(IntBancoManager.MessageInfo);

        rValorDocs := rValorDocs + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;
        Inc(iNumSeqDoc);
        IntBancoManager.CdsTexto.Next;
      End;
      { Trailer }
      WriteLn(ArquivoRemessa,Concat('9',  //Código do Registro
                                    Zd(IntToStr(iNumSeqDoc),6), //Quantidade de Título
                                    ZD(RemoveVirgulas(rValorDocs,2),13), //Valor Total no Arquivo
                                    SPC(374), //Vago
                                    Zd(IntToStr(iNumSeq),6))); //Número de Registros no Arquivo
      CloseFile(ArquivoRemessa);
      IntBancoManager.UltNossoNumero := FloatToStr(rNossoNumero);
      IntBancoManager.UltCodArquivoGerado := IntBancoManager.CodArquivoRemessa;
      IntBancoManager.MostraArquivo;
   except
     On E:Exception Do
     begin
       MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message,'Atenção');
       CloseFile(ArquivoRemessa);
       Raise;
     end;
   end;
end;


procedure TCobranca.RealBarras;
var
  x          : Integer;
  sMensagens : TStringList;
  Mensagens  : String;
{ Última Atualização - 11/12/2001 - Fábio Barros }
begin
  rValorDocs := 0;
  iNumSeq := 1;
  sTipoInsc := '02';
  iNumSeqDoc := 0;
  rNossoNumero := StrToFloat(IntBancoManager.NossoNumero);
  Try
    IntBancoManager.sNomeArquivo := ExtractFilePAth(IntBancoManager.sNomeArquivo) + 'REALCOBR.TXT';
    AssignFile(ArquivoRemessa, IntBancoManager.sNomeArquivo);
    ReWrite(ArquivoRemessa);
    
    If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
      sCodInscEmpresa := '2'
    Else
      sCodInscEmpresa := '1';
    { Transação }
    IntBancoManager.CdsTexto.First;
    While Not IntBancoManager.CdsTexto.Eof Do
    Begin
      If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
        sTipoInsc := '1'
      Else
        sTipoInsc := '2';
        rNossoNumero := rNossoNumero + 1;
        WriteLn(ArquivoRemessa,
                Concat('1', //codigo de registro
                       sCodInscEmpresa,//codigo de inscricao
                       FormataCgcCpfConta(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,sCodInscEmpresa), //numero de inscricao
                       ZD(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,4), //Agência//Agencia Cedente
                       ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                       Ae(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                       ZD(FloatToStr(rNossoNumero),15), //Nosso Número
                       AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,10), {nº do documento}
                       REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //data venciento
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor
                       '57', //Carteira
                       '99', //Espécie do título
                       REMOVEBARRAS(DateToStr(Date)), //data de emissão
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), //valor do Juros/Dia
                       REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), //Data limite desconto
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //valor do desconto
                       ZD('0',13), //I.O.C
                       ZD('0',13), //Abatimento
                         sTipoInsc, //Cod Inscrição Sacado
                         FormataCgcCpfConta(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,sTipoInsc), //numero de inscricao
                         AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40),
                         AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                 IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                 IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40),
                         AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,12),
                         ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                         AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                         AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),
                         Spc(40), //Nome do Sacador
                         '7', //Valor Moeda Real
                         '7', //Tipo Moeda
                         '0277', //Tipo do bloquete
                         ZD(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,4), //Agência//Agencia Cedente
                         'S',
                         Spc(42),//Vago
                         Zd(IntToStr(iNumSeq),6)));
          Inc(iNumSeq);
          sMensagens := TStringList.Create;
          GeraMensagens(sMensagens, 40);
          mensagens  := '';
          for x := 0 to 3 do
          begin
            try
              Mensagens := Mensagens + sMensagens.Strings[x]
            except
              Mensagens := Mensagens + spc(40)
            end;
          end;
          { Se for diferente de 0 significa que existe mensagens }
          if sMensagens.Count <> 0 Then
          begin
              WriteLn(ArquivoRemessa,
                         Concat('2', //codigo de registro
                         ZD(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,4), //Agência//Agencia Cedente
                         ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                         ZD(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,15), //ident titulo empresa
                         mensagens,
                         Spc(207),
                         Zd(IntToStr(iNumSeq),6)));
              Inc(iNumSeq);
          End
          Else
          Begin
              WriteLn(ArquivoRemessa,
                         Concat('2', //codigo de registro
                         ZD(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,4), //Agência//Agencia Cedente
                         ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                         ZD(IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,15), //ident titulo empresa
                         Spc(40),
                         Spc(40),
                         Spc(40),
                         Spc(40),
                         Spc(207),
                         Zd(IntToStr(iNumSeq),6)));
              Inc(iNumSeq);
          End;
          sMensagens.Free;
          if not IntBancoManager.AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),IntBancoManager.CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
             Exception.Create(IntBancoManager.MessageInfo);

          rValorDocs := rValorDocs + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;

          Inc(iNumSeqDoc);
          IntBancoManager.CdsTexto.Next;
      End;

      CloseFile(ArquivoRemessa);

      IntBancoManager.UltNossoNumero      := FloatToStr(rNossoNumero);
      IntBancoManager.UltCodArquivoGerado := IntBancoManager.CodArquivoRemessa;

      CopyFile(PChar(IntBancoManager.sNomeArquivo),PChar(ExtractFilePath(IntBancoManager.sNomeArquivo) + 'ENVMICRO.TXT'),False);
      IntBancoManager.sNomeArquivo := ExtractFilePath(IntBancoManager.sNomeArquivo) + 'ENVMICRO.TXT';
      IntBancoManager.MostraArquivo;
   Except
      On E:Exception Do
      Begin
        MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message,'Atenção');
        CloseFile(ArquivoRemessa);
        Raise;
      End;
   End;
End;

procedure TCobranca.Bcn;
Var
  X          : Integer;
  sMensagens : TStringList;
  Mensagens  : String;
begin
  rValorDocs := 0;
  iNumSeq := 1;
  sTipoInsc := '02';
  iNumSeqDoc := 0;
  rNossoNumero := StrToFloat(IntBancoManager.NossoNumero);

  Try

       If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
          sCodInscEmpresa := '02'
       Else
          sCodInscEmpresa := '01';

       AssignFile(ArquivoRemessa, IntBancoManager.sNomeArquivo);
       ReWrite(ArquivoRemessa);

       //Header
       WriteLn(ArquivoRemessa,Concat('0', //Código do Registro
                                     AE('1REMESSA01COBRANCA',25), //Constante
                                     ZD('0',10), //Zero
                                     ZD(Copy(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,1,3),3), //Agência//Agencia Cedente
                                     ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                                     AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30),//Nome do Cedente
                                     '291', //Nº do Banco
                                     AE('B.C.N.',15),//Nome do Banco
                                     REMOVEBARRAS(DateToStr(Date)), //Data do Processamento
                                     '01600BPI', //Constante
                                     SPC(280), //Vago
                                     ZD(IntBancoManager.CodArquivoRemessa,6), //Sequencia do Movimento
                                     ZD(IntToStr(iNumSeq),6))); //Nº Sequencial do Registro no arquivo
       Inc(iNumSeq);

       //Transação
       IntBancoManager.CdsTexto.First;
       While Not IntBancoManager.CdsTexto.Eof Do
       Begin
          If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
              sTipoInsc := '01'
          Else
              sTipoInsc := '02';

          rNossoNumero := rNossoNumero + 1;

          WriteLn(ArquivoRemessa,
                   Concat('1', //codigo de registro
                          sCodInscEmpresa,//codigo de inscricao
                          ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),//numero de inscricao
                          SPC(10),//Brancos
                          ZD(Copy(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,1,3),3), //Agência//Agencia Cedente
                          ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                          AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), //ident titulo empresa
                          Spc(12), //Vago
                          ZD(FloatToStr(rNossoNumero),8),//NossoNúmero + DV
                          SPC(25),//Brancos
                          '1', //Cobrança Simples
                          '01', //Indica Remessa
                          AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,10), {nº do documento}
                          REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //data venciento
                          ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor
                          '291', //Identificação do Banco
                          '00000', //Vago
                          '99', //Espécie de Título
                          'N', //Aceite
                          REMOVEBARRAS(DateToStr(Date)), //data emissao
                          '00',
                          '00',
                          ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), //valor do Juros/Dia
                          REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), //Data limite desconto
                          ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //valor do desconto
                          ZD('0',13),//Valor IOF
                          ZD('0',13),//Valor Abat Cencelado
                          sTipoInsc, //Cod Inscrição do Sacado
                          FormataCgcCpfConta(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,sTipoInsc), //numero de inscricao
                          AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40),
                          AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                  IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                  IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40),
                          AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,12),
                          ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                          AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                          AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),
                          Spc(40), //Nome do Sacador
                          ' ', //Vago
                          '  ', //Valor Moeda
                          Zd(IntToStr(iNumSeq),6)));
           Inc(iNumSeq);

          sMensagens := TStringList.Create;
          GeraMensagens(sMensagens, 40);
          mensagens  := '';
          for x := 0 to 7 do
          begin
            try
              Mensagens := Mensagens + sMensagens.Strings[x]
            except
              Mensagens := Mensagens + spc(40)
            end;
          end;
          If sMensagens.Count <> 0 Then
           Begin
               //Monta Mensagens Layout 1
               WriteLn(ArquivoRemessa,
                          Concat('4', //codigo de registro
                          ZD(Copy(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,1,3),3), //Agência//Agencia Cedente
                          ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,7),//Conta Cedente
                          ZD(FloatToStr(rNossoNumero),8),//NossoNúmero + DV
                          Mensagens,
                          Spc(55),
                          Zd(IntToStr(iNumSeq),6)));
               Inc(iNumSeq);
           End;
           sMensagens.Free;
           WriteLn(ArquivoRemessa,Concat('9',
                                         SPC(393),
                                         Zd(IntToStr(iNumSeq),6)));

           if not IntBancoManager.AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),IntBancoManager.CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
              raise Exception.Create(IntBancoManager.MessageInfo);

           rValorDocs := rValorDocs + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;

           Inc(iNumSeqDoc);
           IntBancoManager.CdsTexto.Next;
       End;

       CloseFile(ArquivoRemessa);

       IntBancoManager.UltNossoNumero := FloatToStr(rNossoNumero);
       IntBancoManager.UltCodArquivoGerado := IntBancoManager.CodArquivoRemessa;
       IntBancoManager.MostraArquivo;
  Except
     On E:Exception Do
     Begin
       MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
       CloseFile(ArquivoRemessa);
       Raise;
     End;
  End;
end;

procedure TCobranca.CEF;
Var
   nossonumerog:string[11];
   VMENSAGEM3:STRING[40];
   VMENSAGEM4:STRING[40];
   VMENSAGEM5:STRING[40];
   VMENSAGEM6:STRING[40];
   VMENSAGEM7:STRING[40];
   VMENSAGEM8:STRING[40];
   VCOBRANCA:STRING[1];
   VCADASTRAMENTO:STRING[1];
   VDOCUMENTO:STRING[1];
   VEMISSAOBLOQUETO:STRING[1];
   VDISTRIBUICAOBLOQUETO:STRING[1];
   VESPECIETITULO:STRING[2];
   VACEITE:STRING[1];
   VCODJUROS: STRING[1];
   VDIASJUROS:STRING[2];
   VCODDESCONTO: STRING[1];
   VCODMULTA: STRING[1];
   VDIASDESCONTO:STRING[2];
   VDIASMULTA:STRING[2];
   VDIASBAIXADEVOLUCAO:STRING[3];
   VVALORDESCONTO:STRING[18];
   VPERCENTUALIOF:STRING[6];
   VPERCENTUALABATIMENTO:STRING[6];
   VVALORMULTA:STRING[18];
   VBAIXADEVOLUCAO:STRING[1];
   VPROTESTO:STRING[1];
   VDATAJUROS:STRING[10];
   VDATAMULTA:STRING[10];
   VDATADESCONTO:STRING[10];
   VINFORMACAO:STRING[10];
   FAZ : BOOLEAN;
   remessateste:string;
   x : integer;
   sMensagens : TStringList;
   Mensagens : String;
begin
   with IntBancoManager do
   begin
      rValorDocs := 0;
      iNumSeq := 0;
      sTipoInsc := '2';
      iNumSeqDoc := 0;
      rNossoNumero := StrToFloat(IntBancoManager.NossoNumero);

      VCODDESCONTO          :=BuscaParamIntBanco('CODDESCONTO','N');
      VCODMULTA             :=BuscaParamIntBanco('CODMULTA','N');
      VDIASDESCONTO         :=BuscaParamIntBanco('DIASDESCONTO','N');
      VDIASMULTA            :=buscaParamIntBanco('DIASMULTA','N');
      VDIASBAIXADEVOLUCAO   :=BuscaParamIntBanco('DIASBAIXADEVOLUCAO','N');
      VVALORDESCONTO        :=BuscaParamIntBanco('VALORDESCONTO','N');
      VPERCENTUALIOF        :=BuscaParamIntBanco('PERCENTUALIOF','N');
      VPERCENTUALABATIMENTO :=BuscaParamIntBanco('PERCENTUALABATIMENTO','N');
      VVALORMULTA           :=BuscaParamIntBanco('VALORMULTA','N');
      VBAIXADEVOLUCAO       :=BuscaParamIntBanco('BAIXADEVOLUCAO','N');
      VPROTESTO             :=BuscaParamIntBanco('PROTESTO','N');
      VDIASJUROS             :=BuscaParamIntBanco('DIASJUROS','N') ;
      VCOBRANCA             :=BuscaParamIntBanco('COBRANCA','N');
      VCADASTRAMENTO        :=BuscaParamIntBanco('CADASTRAMENTO','N');
      VDOCUMENTO            :=BuscaParamIntBanco('DOCUMENTO','N');
      VEMISSAOBLOQUETO      :=BuscaParamIntBanco('EMISSAOBLOQUETO','N');
      VDISTRIBUICAOBLOQUETO :=BuscaParamIntBanco('DISTRIBUICAOBLOQUETO','N');
      VESPECIETITULO        :=BuscaParamIntBanco('ESPECIETITULO','N');
      VACEITE               :=BuscaParamIntBanco('ACEITE','S');
      VCODJUROS             :=BuscaParamIntBanco('CODJUROS','N');
      VINFORMACAO           :=BuscaParamIntBanco('INFORMACAO','S');

      IF TRIM(VVALORDESCONTO)='' THEN  VVALORDESCONTO:='0';
      IF TRIM(VDIASDESCONTO)='' THEN  VDIASDESCONTO:='0';
      IF TRIM(VDIASMULTA)='' THEN  VDIASMULTA:='0';
      IF TRIM(VDIASBAIXADEVOLUCAO)='' THEN  VDIASBAIXADEVOLUCAO:='0';
      IF TRIM(VPERCENTUALIOF)='' THEN  VPERCENTUALIOF:='0';
      IF TRIM(VPERCENTUALABATIMENTO)='' THEN  VPERCENTUALABATIMENTO:='0';
      IF TRIM(VVALORMULTA)='' THEN  VVALORMULTA:='0';
      IF (TRIM(DiasProtesto)='')  or (VPROTESTO='3') THEN  DiasProtesto:='0';
      remessateste:='';
      if BuscaParamIntBanco('REMESSATESTE','S') ='1' then
        remessateste:='REMESSA-TESTE'  ;
       if VCOBRANCA ='1' then
                 nossonumerog:=zd(modulo(0,11,11,11,FLOATtostr(rNossoNumero)),11)
       else
                 nossonumerog:=zd('9'+modulo(0,11,11,10,FLOATtostr(rNossoNumero)),11) ;


      Try

           If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
              sCodInscEmpresa := '2'
           Else
              sCodInscEmpresa := '1';

           AssignFile(ArquivoRemessa,sNomeArquivo);
           ReWrite(ArquivoRemessa);
           IF TRIM(ValorJuros)='' THEN ValorJuros:='0';

           //Header arquivo
           WriteLn(ArquivoRemessa,Concat('104', //Código do banco
                                         '0000',//lote de serviço
                                         '0', //Zero  registro header
                                         Spc(9),//cnab
                                         trim(sCodInscEmpresa), //cpf cgc
                                         ZD(IntBancoManager.CdsTexto.FieldByName('NUMdocumento').AsString,14),//inscrição empresa
                                         ZD(NumeEmpresaBanco,16),
                                         Spc(4),//USO CAIXA
                                         ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numagencia').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                                         AE(COPY(IntBancoManager.CdsTexto.FieldByName('numagencia').AsString,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numagencia').AsStrinG)),1),1),   //DV AG
                                         ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsStrinG))-1)),12), //CONTACORRENTE
                                         AE(COPY(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsString,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsStrinG)),1),1),   //DV CC                    AE(DVAGCC,1),
                                         COPY(Modulo( 0,11,11,18,(ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numagencia').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numagencia').AsStrinG))-1)),5)+
                                              ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsStrinG))-1)),12)) ),18,1),//DV AG/CC
                                         AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30),//Nome do Cedente
                                         AE('CAIXA ECONOMICA FEDERAL',30),
                                         Spc(10),//CNAB
                                         '1',//REMESSA
                                         REMOVEBARRAS2(DateToStr(Date)), //Data do Processamento
                                         REMOVEPONTOS(TIMEToStr(TIME)), //HORA Processamento
                                         ZD(CodArquivoRemessa,6), //Sequencia do Movimento
                                         '030',     //LAYOUT
                                         '01600', //DENSIDAE ARQ
                                         Spc(20),//  CAIXA
                                         AE((remessateste),30),//  EMP
                                         Spc(29)//  CNAB
                                        ));

           INC(iNumSeq);
           //Header LOTE
           WriteLn(ArquivoRemessa,Concat('104', //Código do banco
                                         '0001',//lote de serviço
                                         '1', //Zero  registro header
                                         'R',//OPERACAO REMESSA
                                         '01', //TIPO SERVIÇO
                                         '00', //FORMA DE LANÇAMENTO
                                         '020',//VERSAO LAYOUT
                                         Spc(1),//cnab
                                         trim(sCodInscEmpresa), //cpf cgc
                                         zd(IntBancoManager.CdsTexto.FieldByName('NUMdocumento').AsString,15),//inscrição empresa
                                         ZD(NumeEmpresaBanco,16),
                                         Spc(4),//USO CAIXA
                                         ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numagencia').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                                         '0', //DV AG
                                         ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsStrinG))-1)),12), //CONTACORRENTE
                                         AE(COPY(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsString,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsStrinG)),1),1),   //DV CC                    AE(DVAGCC,1),
                                         COPY(Modulo( 0,11,11,18,(ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numagencia').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numagencia').AsStrinG))-1)),5)+
                                              ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsStrinG))-1)),12)) ),18,1),//DV AG/CC
                                         AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30),//Nome do Cedente
                                         AE(BuscaParamIntBanco('MENSAGEM1','S'),40),
                                         AE(BuscaParamIntBanco('MENSAGEM2','S'),40),
                                         ZD(CodArquivoRemessa,8), //N REMESSA
                                         REMOVEBARRAS2(DateToStr(Date)), //Data do Processamento
                                         REMOVEBARRAS2(BuscaParamIntBanco('DATACREDITO','D')),
                                         Spc(33)//  CNAB
                                        ));

          //Transação
           IntBancoManager.CdsTexto.First;
           While Not IntBancoManager.CdsTexto.Eof Do
           Begin
              If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
                  sTipoInsc := '1'
              Else
                  sTipoInsc := '2';

              rNossoNumero := rNossoNumero + 1;
              nossonumerog:='0';
              IF VEMISSAOBLOQUETO = '2' THEN
              BEGIN
                if BuscaParamIntBanco('COBRANCA','N') ='1' then
                 nossonumerog:=zd(modulo(0,11,11,11,FLOATtostr(rNossoNumero)),11)
                else
                 nossonumerog:=zd('9'+modulo(0,11,11,10,FLOATtostr(rNossoNumero)),11) ;
              END;

              VDATADESCONTO:='';
              IF VCODDESCONTO <> '0' THEN
              BEGIN
                VDATADESCONTO:= DATETOSTR(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsDateTime+STRTOINT(VDIASDESCONTO))
              END;

              VDATAMULTA:='';
              IF VCODMULTA <> '0' THEN
              BEGIN
               VDATAMULTA   := DATETOSTR(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsDateTime+STRTOINT(VDIASMULTA));
              END;

              VDATAJUROS:='';
              IF VCODJUROS < '3' THEN
              BEGIN
               VDATAJUROS   := DATETOSTR(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsDateTime+STRTOINT(VDIASJUROS));
              END
              else
                ValorJuros:='0' ;

              INC(iNumSeq);
              Inc(iNumSeqDoc);
              //EGMENTO P
              WriteLn(ArquivoRemessa,
                       Concat('104', //Código do banco
                              ZD(INTTOSTR(1),4), //LOTE DE SERVIÇO
                              '3',// REGISTRO DETALHE
                              ZD(INTTOSTR(iNumSeqDoc),5),//SEQ REGISTRO
                              'P',//segmento
                              Spc(1),//cnab
                              '01', // movimento
                              ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numagencia').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                              AE(COPY(IntBancoManager.CdsTexto.FieldByName('numagencia').AsString,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numagencia').AsStrinG)),1),1),   //DV AG
                              ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsStrinG))-1)),12), //CONTACORRENTE
                              '0',   //DV CC
                               COPY(Modulo( 0,11,11,18,(ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numagencia').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numagencia').AsStrinG))-1)),5)+
                                           ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numCONTA').AsStrinG))-1)),12)) ),18,1),//DV AG/CC
                              Spc(9),//caixa
                              ZD(nossonumerog,11),
                              VCOBRANCA, //carteira
                              VCADASTRAMENTO  ,//cadastrameto
                              VDOCUMENTO,//tp documento
                              VEMISSAOBLOQUETO,//emis bloq
                              VDISTRIBUICAOBLOQUETO,//
                              AE(IntBancoManager.CdsTexto.FieldByName('noDocumento').AsString,15) ,//n doc cobrança
                              REMOVEBARRAS2(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //data venciento
                              ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),15), //Valor
                              ZD(TRIM(COPY(IntBancoManager.CdsTexto.FieldByName('numagencia').AsString,1,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                              AE(COPY(IntBancoManager.CdsTexto.FieldByName('numagencia').AsString,LENGTH(TRIM(IntBancoManager.CdsTexto.FieldByName('numagencia').AsStrinG)),1),1),   //DV AG
                              zd(VESPECIETITULO,2),
                              VACEITE,
                              REMOVEBARRAS2(IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsString),
                              VCODJUROS,
                              ZD(REMOVEBARRAS2(VDATAJUROS),8),
                              ZD(RemoveVirgulas(STRTOFLOAT(ValorJuros),2),15),
                              VCODDESCONTO,
                              ZD(REMOVEBARRAS2(VDATADESCONTO),8),
                              ZD(RemoveVirgulas(STRTOFLOAT(VVALORDESCONTO),2),15),
                              ZD(RemoveVirgulas(STRTOFLOAT(VPERCENTUALIOF),2),15),
                              ZD(RemoveVirgulas(STRTOFLOAT(VPERCENTUALABATIMENTO),2),15),
                              AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), //ident titulo empresa
                              VPROTESTO,
                              ZD(DiasProtesto,2),
                              VBAIXADEVOLUCAO,
                              ZD(VDIASBAIXADEVOLUCAO,3),
                              '09',// MOEDA REAL
                              Spc(11) ));


      // SEGMENTO Q
              INC(iNumSeq);
              Inc(iNumSeqDoc);
              WriteLn(ArquivoRemessa,
                       Concat('104', //Código do banco
                              ZD(INTTOSTR(1),4), //LOTE DE SERVIÇO
                              '3',// REGISTRO DETALHE
                              ZD(INTTOSTR(iNumSeqDoc),5),//SEQ REGISTRO
                              'Q',//segmento
                              Spc(1),//cnab
                              '01', // movimento
                              sTipoInsc,
                              ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //numero de inscricao
                              AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40),
                              AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                      IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                      IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40)  ,
                              AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,15),
                              ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                              AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                              AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),
                              ZD('0',16),
                              Spc(71)
                              ));


               VMENSAGEM3 := '';
               VMENSAGEM4 := '';
               VMENSAGEM5 := '';
               VMENSAGEM6 := '';
               VMENSAGEM7 := '';
               VMENSAGEM8 := '';
               iTotMensagens := 0;
               sMensagens := TStringList.Create;
               GeraMensagens(sMensagens, 40);
               FAZ := sMensagens.Count <> 0;
               If FAZ OR (VCODMULTA <> '0') OR (TRIM(VINFORMACAO) <> '') Then
               Begin
                   mensagens  := '';
                   for x := 0 to 1 do
                   begin
                     try
                       Mensagens := Mensagens + sMensagens.Strings[x]
                     except
                       Mensagens := Mensagens + spc(40)
                     end;
                   end;
                   // SEGMENTO R
                   INC(iNumSeq);
                   Inc(iNumSeqDoc);
                   WriteLn(ArquivoRemessa,
                       Concat('104', //Código do banco
                              ZD(INTTOSTR(1),4), //LOTE DE SERVIÇO
                              '3',// REGISTRO DETALHE
                              ZD(INTTOSTR(iNumSeqDoc),5),//SEQ REGISTRO
                              'R',//segmento
                              Spc(1),//cnab
                              '01', // movimento
                              Spc(48),//cnab
                              VCODMULTA,
                              ZD(REMOVEBARRAS2(VDATAMULTA),8),
                              ZD(RemoveVirgulas(STRTOFLOAT(VValorMULTA),2),15),
                              AE(VINFORMACAO,10),
                              Mensagens,
                              Spc(61)
                              ));
                   If TRIM(VMENSAGEM5)<>'' Then
                   Begin
                    mensagens  := '';
                    for x := 2 to 5 do
                    begin
                      try
                        Mensagens := Mensagens + sMensagens.Strings[x]
                      except
                        Mensagens := Mensagens + spc(40)
                      end;
                    end;
                   // SEGMENTO S
                   INC(iNumSeq);
                   Inc(iNumSeqDoc);
                   WriteLn(ArquivoRemessa,
                       Concat('104', //Código do banco
                              ZD(INTTOSTR(1),4), //LOTE DE SERVIÇO
                              '3',// REGISTRO DETALHE
                              ZD(INTTOSTR(iNumSeqDoc),5),//SEQ REGISTRO
                              'S',//segmento
                              Spc(1),//cnab
                              '01', // movimento
                              '3',//ID IMPRESSAO
                              Mensagens,
                              Spc(62)
                              ));
                   End;
               End;
               sMensagens.Free;
               if not IntBancoManager.AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
                  Raise Exception.Create(IntBancoManager.MessageInfo);
               IntBancoManager.CdsTexto.Next;
           End;

           INC(iNumSeq);
           //Trailer    DE LOTE
           WriteLn(ArquivoRemessa,Concat('104', //Código do banco
                                         '0001',//lote de serviço
                                         '5', //  registro TRAILER
                                         Spc(9),//cnab
                                         ZD(INTTOSTR(iNumSeq),6), //QTD REGS INCLUI HEADER E TRAILER DO LOTE
                                         ZD('0',6),
                                         ZD('0',17),
                                         Spc(23),
                                         ZD('0',6),
                                         ZD('0',17),
                                         Spc(29),
                                         Spc(119)));

           //Trailer DO ARQUIVO
           WriteLn(ArquivoRemessa,Concat('104', //Código do banco
                                         '9999',//lote de serviço
                                         '9', //  registro TRAILER
                                         Spc(9),//cnab
                                         ZD('1',6), //QTD LOTES DO TIPO REG=1
                                         ZD(INTTOSTR(iNumSeq+2),6), //INCLUI TRAILER E HEADER DO ARQUIVO
                                         Spc(211) ));


           CloseFile(ArquivoRemessa);

           UltNossoNumero      := FloatToStr(rNossoNumero);
           UltCodArquivoGerado := CodArquivoRemessa;
           MostraArquivo;
      Except
         On E:Exception Do
         Begin
           MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
           CloseFile(ArquivoRemessa);
           Raise;
         End;
      End;
   End;
end;

procedure TCobranca.HSBC;
{ Layout Revisado em 08/01/2002 - Fábio Barros da Silva }
var
  x                    : Integer;
  sMensagens           : TStringList;
  Mensagens            : String;
  GeraRegistroMensagem : BOOLEAN;
  ValorUnico           : Double;
  DtvencUnico          : String[10];
  VPARCELAINI          : String[3];
  VPARCELAFINAL        : String[3];
begin
   With IntBancoManager Do
   Begin
      iNumSeqDoc := 1;
      VPARCELAINI    := BuscaParamIntBanco('PARCELAINI','N');
      VPARCELAFINAL  := BuscaParamIntBanco('PARCELAFINAL','N');
      sMensagens     := TStringList.Create;
      //  rNossoNumero   := StrToFloat(NossoNumero);
      rNossoNumero   := StrToFloat(NossoNumero);
      Try
        AssignFile(ArquivoRemessa,sNomeArquivo);
        ReWrite(ArquivoRemessa);
        { Header arquivo }
        WriteLn(ArquivoRemessa,Concat('0',
                                      '1',
                                      'REMESSA',
                                      '01',
                                      AE('COBRANCA CNR',15),
                                      ZD(NumeEmpresaBanco,10), //Inscrição Empresa
                                      Spc(10), // Espacos
                                      AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30),//Nome do Cedente
                                      '399',
                                      AE('HSBC',15), //Nome do Banco
                                      REMOVEBARRAS2(DateToStr(Date)), //Data do Processamento
                                      '01600BPI', // Densidade e Literal de Densidade
                                      REMOVEPONTOS(TIMEToStr(TIME)), //HORA Processamento
                                      ZD(BuscaParamIntBanco('CODIGOFORMULARIO','N'),4), //Codigo do Formulario
    //                                ZD(BuscaParamIntBanco('PERIODICIDADEPARC','N'),1), //Periodicidade de Vencimento
                                      '0', //Periodicidade de Vencimento
                                      SPC(1),
                                      '09', //Tipo de Moeda:  09 - REAL
    //                                  ZD(BuscaParamIntBanco('VLPARCCONHECIDO','S'),1), //Indicador de Valor da Parcela
                                      '0', //Indicador de Valor da Parcela
                                      '1', //Remessa de Documentos
                                      ZD(BuscaParamIntBanco('MONTAGEMCARNES','N'),1), //Montagem dos Carnes
                                      SPC(94),
                                      AE(BuscaParamIntBanco('OBS1','S'),42),
                                      AE(BuscaParamIntBanco('OBS2','S'),42),
                                      AE(BuscaParamIntBanco('OBS3','S'),42),
                                      'Y2K', //Alfanumérico igual a Y2K
                                      SPC(44),
                                      '000001'));
        { Registro de Detalhe }
        IntBancoManager.CdsTexto.First;
        While Not IntBancoManager.CdsTexto.Eof Do
        Begin
          Inc(iNumSeqDoc);
          valorunico  := 0;
          dtvencunico := '      ';

          if IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat <> 0 then
          begin
            ValorUnico  := (IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat - (IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat * StrToFloat(BuscaParamIntBanco('PERCUNICODESC','N'))/100));
            DtvencUnico := DateToStr(StrToDate(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString) - StrToInt(BuscaParamIntBanco('DIASDESCONTO','N'))) ;
          end;
          rNossoNumero := rNossoNumero + 1;
          WriteLn(ArquivoRemessa,Concat('1',
                                        '99',
                                        ZD(NumeEmpresaBanco,10), //inscrição empresa
                                        SPC(24),
                                        '000',
                                        AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,13), // Identificação do Titulo no sistema do Cliente(CAMPO LIVRE)
                                        SPC(54),
                                        '0',
                                        '01',
                                        ZD(BuscaParamIntBanco('PARCELAINI','N'),3),
                                        ZD(IntToStr((StrToInt(BuscaParamIntBanco('PARCELAFINAL','N')) - StrToInt(BuscaParamIntBanco('PARCELAINI','N'))+1)),3),
                                        ZD(BuscaParamIntBanco('PARCELAFINAL','N'),3),
                                        SPC(1),
                                        RemoveBarras2(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //data venciento
                                        ZD(RemoveVirgulas( (IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat/(StrToInt(BuscaParamIntBanco('PARCELAFINAL','N')) - StrToInt(BuscaParamIntBanco('PARCELAINI','N'))+1)) ,2),12), //Valor
                                        '399',
                                        spc(4),
                                        '99',
                                        'N',
                                        spc(30),
                                        ZD(RemoveVirgulas(ValorUnico ,2),12), //Valor unico
                                        AE(REMOVEBARRAS2(DtvencUnico),8), //data venciento UNICO
                                        SPC(18),
                                        '98',
                                        SPC(6),
                                        ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                                        AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40),
                                        AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                           IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                           IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40)  ,
                                        AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,15),
                                        SPC(5),
                                        AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                                        AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),
                                        AE(' ',43),
                                        ZD(INTTOSTR(iNumSeqDoc),6)//SEQ REGISTR
                                        ));
          if not IntBancoManager.AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
             Raise Exception.Create(IntBancoManager.MessageInfo);
    // ------------------------------------------------------------------------------
          GeraRegistroMensagem := False;
          GeraMensagens(sMensagens, 42);
          { Se as três OBSERVAÇÕES não forem informadas se gera o registro de OBS. }
          if (Trim(BuscaParamIntBanco('OBS1','S')) = '') and (Trim(BuscaParamIntBanco('OBS2','S')) = '') and
             (Trim(BuscaParamIntBanco('OBS3','S')) = '') Then
             GeraRegistroMensagem := (sMensagens.Count <> 0);
          If GeraRegistroMensagem Then
          begin
            { Mensagens!!!! }
            Mensagens := '';
            for x := 0 to 6 do
            begin
              try
                Mensagens := Mensagens + sMensagens.Strings[x]
              except
                Mensagens := Mensagens + spc(42)
              end;
            end;
            if sMensagens.Count <> 0 then
            begin
              WriteLn(ArquivoRemessa,Concat('2', //Código do Registro
                                            Mensagens, //Mensagens: 1-7
                                            spc(99), //Brancos
                                            Zd(IntToStr(iNumSeq),6)));
              Inc(iNumSeq);
            end;
          end;
    // -----------------------------------------------------------------------------
          IntBancoManager.CdsTexto.Next;
        end; // Do While IntBancoManager.CdsTexto
        Inc(iNumSeqDOC);
        { Trailer DO ARQUIVO }
        WriteLn(ArquivoRemessa,Concat('9',
                                      Spc(393),
                                      ZD(INTTOSTR(iNumSeqDOC),6)
                                      ));
        CloseFile(ArquivoRemessa);
        UltNossoNumero      := FloatToStr(rNossoNumero);
        UltCodArquivoGerado := CodArquivoRemessa;
        MostraArquivo;
      Except
        On E:Exception Do
        Begin
          MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
        End;
      End;
      sMensagens.Free;
   End;
end;

procedure TCobranca.MontaDebitoProgramado(sNumBanco,sNomeBanco,sArquivo :String);
Var
  ICompl :Integer;
  ContaCorrente : String;
Begin
  With IntBancoManager Do
  Begin
     rValorDocs := 0;
     iNumSeq := 1;
     sTipoInsc := '02';
     iNumSeqDoc := 0;
     rNossoNumero := StrToFloat(NossoNumero);

     Try
          If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
             sCodInscEmpresa := '02'
          Else
             sCodInscEmpresa := '01';

          //AssignFile(ArquivoRemessa,sNomeArquivo);
          ICompl := 1;
          sNomeArquivo := ExtractFilePAth(sNomeArquivo) + sArquivo + IntToStr(ICompl) + '.REM';

          While fileexists(sNomeArquivo) do
          Begin
            Inc(ICompl);
            sNomeArquivo := ExtractFilePAth(sNomeArquivo) + sArquivo + IntToStr(ICompl) + '.REM';
          End;

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          //Header - Registro Tipo 'A'
          WriteLn(ArquivoRemessa,Concat('A', //Código do Registro
                                        '1',
                                        AE(IntBancoManager.CdsTexto.FieldByName('NUMRAZAOCC').AsString,20),//Código do Convênio
                                        AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,20),//Nome da Empresa
                                        sNumBanco, //Num Banco
                                        AE(sNomeBanco,20), //Nome Banco
                                        REMOVEBARRAS3(DateToStr(Date)), //Data da geração do Arquivo
                                        ZD(CodArquivoRemessa,6), //Sequencia do Movimento
                                        '04', //Layout
                                        AE('DEBITO AUTOMATICO',17), //Indicação de Débito Automático
                                        Spc(52))); //Brancos
          Inc(iNumSeq);

          //Transação - Registro Tipo 'E'
          IntBancoManager.CdsTexto.First;
          While Not IntBancoManager.CdsTexto.Eof Do
          Begin
             If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
                 sTipoInsc := '01'
             Else
                 sTipoInsc := '02';

             DtmDadosBancarios.BuscaContaDoc(IntBancoManager.CdsTexto.FieldByName('CODDOCUMENTO').AsFloat);

             // ------------------------------------------------------------------------------
             // Se for o Banco REAL, o número da CONTACORRENTE deve ter 7 posicoes e o
             // restante deve ser preenchido com BRANCOS...
             // Se for a CAIXA ECONÔMICA, eu não alterei o código.
             // A variável ContaCorrente só será usada se não for BANCO DO BRASIL.
             // 23/07/2001 - Fábio Barros
             // ------------------------------------------------------------------------------
                If StrToInt(Trim(sNumBanco)) = 356 Then
                   ContaCorrente := AE(ZD(Copy(Trim(DtmDadosBancarios.ContaBancaria.Numero),1,7),7),12)
                else
                   ContaCorrente := ZD(Copy(Trim(DtmDadosBancarios.ContaBancaria.Numero),1,12),12);
             // ------------------------------------------------------------------------------

             If StrToIntDef(Trim(sNumBanco),0) = 1 Then
                WriteLn(ArquivoRemessa,
                         Concat('E', //codigo de registro

                                AE(IntBancoManager.CdsTexto.FieldByName('CODDOCUMENTO').AsString + ' ' + FormataCgcCpfConta(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,sTipoInsc),25), //Identificação do Cliente > Documento + CPF


                                ZD(Copy(DtmDadosBancarios.ContaBancaria.Agencia,1,4),4), //Agência Cedente
                                ZD(Copy(Trim(DtmDadosBancarios.ContaBancaria.Numero),1,14),14),//Conta Cedente
                                REMOVEBARRAS3(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //data venciento
                                ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),15), //Valor
                                '03',//Código da Moeda

                                AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,60), //Usado Como Referência do documento para baixa
                                Spc(20),
                                '0'))
             Else
                WriteLn(ArquivoRemessa,
                         Concat('E', //codigo de registro
                                AE(IntBancoManager.CdsTexto.FieldByName('CODDOCUMENTO').AsString + ' ' + FormataCgcCpfConta(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,sTipoInsc),25), //Identificação do Cliente > Documento + CPF
                                ZD(DtmDadosBancarios.ContaBancaria.Agencia,4), //Agência Cedente
                                ContaCorrente,//Conta Cedente
                                '  ',
                                REMOVEBARRAS3(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //data venciento
                                ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),15), //Valor
                                '03',//Código da Moeda
                                AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,60), //Usado Como Referência do documento para baixa
                                Spc(20),
                                '0'));

              if not IntBancoManager.AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
                 Raise Exception.Create(IntBancoManager.MessageInfo);

              rValorDocs := rValorDocs + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;

              Inc(iNumSeq);

              IntBancoManager.CdsTexto.Next;
          End;

          //Trailer
          WriteLn(ArquivoRemessa,Concat('Z',  //Código do Registro
                                        Zd(IntToStr(iNumSeq),6), //Número de Registros no Arquivo
                                        ZD(RemoveVirgulas(rValorDocs,2),17), //Valor Total no Arquivo
                                        SPC(126))); //Vafo

          CloseFile(ArquivoRemessa);

          UltNossoNumero      := FloatToStr(rNossoNumero);
          UltCodArquivoGerado := CodArquivoRemessa;
          MostraArquivo;
     Except
      On E:Exception Do
      Begin
          MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
      End;
     End;
  End;
End;


procedure TCobranca.MontaBicBanco;
var NossoNumeroFinal, Agencia, sNossoNumeroTemp, sdigitotemp : String;
begin
  With IntBancoManager Do
  Begin
     rValorDocs   := 0;
     iNumSeq      := 1;
     iNumSeqDoc   := 0;
     sTipoInsc    := '02';
     rNossoNumero := StrToFloat(NossoNumero);
     Try
          If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
             sCodInscEmpresa := '02'
          Else
             sCodInscEmpresa := '01';
          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);
          //Header
          WriteLn(ArquivoRemessa,Concat('0', //Código Registro
                                        '1', //Código Remessa
                                        'REMESSA', //Literal da Remessa
                                        '01', //Código do Serviço
                                        AE('COBRANÇA',15), //Literal do Serviço
                                        AE(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,10),//Código da Empresa
                                        spc(10), //Filler
                                        AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), //Nome da Empresa
                                        '320', //Código do Banco
                                        AE('BICBANCO',15), //Nome do Banco
                                        REMOVEBARRAS(DateToStr(Date)), //Data da Gravação
                                        '01600', //Densidade
                                        'BPI', //Literal Densidade
                                        ZE(CodArquivoRemessa,7), //Nº do Processamento
                                        SPC(279), //Filler
                                        '000001')); //No. sequencial
          Inc(iNumSeq);

          //Transação

          Agencia := Copy(Trim(MascaraAlfa(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString)),1,3);  // Length(Agencia)-1); por 3 que e o tamanho da agencia
          IntBancoManager.CdsTexto.First;
          While Not IntBancoManager.CdsTexto.Eof Do
          Begin
             If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
                 sTipoInsc := '01'
             Else
                 sTipoInsc := '02';
             rNossoNumero := rNossoNumero + 1;

             {Para o calculo, se utiliza o Numero da Agencia sem o DV}
             sNossoNumeroTemp := CalculaDacNovo(Agencia + Trim(ZD(FloatToStr(rNossoNumero),6)), 320);
             sdigitotemp := copy(sNossoNumeroTemp, Length(sNossoNumeroTemp), 1);
             NossoNumeroFinal := '0'+ ZD(FloatToStr(rNossoNumero),6) + sdigitotemp;
             WriteLn(ArquivoRemessa,
                      Concat('1', //Código de registro
                             sCodInscEmpresa,//Código de inscrição
                             ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),//No.de inscrição
                             AE(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,10),//Código da Empresa
                             spc(10), //Brancos
                             AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), //Uso da Empresa(Campo Livre)
                             ZD(NossoNumeroFinal,8),// '0' + NossoNúmero + DV
                             spc(37), //Filler
                             BuscaParamIntBanco('CARTEIRA','S'), //Carteira
                             '01', //Código da Ocorrência
                             AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,10),//Seu número - Número do Título
                             REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //Data vencimento
                             ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor do título
                             '320', //Banco cobrador
                             AE(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5), //Agência Cobradora
                             '01',
                             BuscaParamIntBanco('ACEITE','S'), //Aceite
                             REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsString), //Data vencimento
                             BuscaParamIntBanco('INSTRUCAO1','S'), //Instrução1
                             BuscaParamIntBanco('INSTRUCAO2','S'), //Instrução2
                             ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), //Juros p/Dia
                             REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), //Data limite p/desconto
                             ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //Valor do desconto
                             ZD('0',13),//Valor IOF
                             ZD('0',13),//Valor Abatimento Cencelado
                             sTipoInsc, //Código Inscrição do Sacado
                             FormataCgcCpfConta(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,sTipoInsc), //Numero de inscrição do SACADO
                             AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40),
                             AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                     IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                     IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40), //Endereço do SACADO
                             AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,12),
                             ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                             AE(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,15), //Praça = Agência Cobradora
                             AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),
                             AE(BuscaParamIntBanco('MENSAGEM','S'),40), //SACADOR/Avalista ou Mensagem
                             ZD(BuscaParamIntBanco('NUMDIASPROTESTO','S'),2), //Prazo - Qts de dias p/protesto
                             '9', //Moeda - Real
                             Zd(IntToStr(iNumSeq),6))); //Número sequencial
              Inc(iNumSeq);
              if not AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
                 Raise Exception.Create(MessageInfo);
              Inc(iNumSeqDoc);
              IntBancoManager.CdsTexto.Next;
          End;
          WriteLn(ArquivoRemessa,Concat('9', //Código do Registro
                                        SPC(393), //Filler
                                        Zd(IntToStr(iNumSeq),6))); //No. Sequencial

          CloseFile(ArquivoRemessa);
          UltNossoNumero      := FloatToStr(rNossoNumero);
          UltCodArquivoGerado := CodArquivoRemessa;
          MostraArquivo;
     Except
        On E:Exception Do
        Begin
          MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
        End;
     End;
  End;
end;

procedure TCobranca.MontaSafraRegistrada;
var
  NossoNumeroFinal : String;
begin
  With IntBancoManager Do
  Begin
     rValorDocs   := 0;
     iNumSeq      := 1;
     iNumSeqDoc   := 0;
     sTipoInsc    := '02';
     rNossoNumero := StrToFloat(NossoNumero);
     Try
          If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
             sCodInscEmpresa := '02'
          Else
             sCodInscEmpresa := '01';
          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);
          //Header
          WriteLn(ArquivoRemessa,Concat('0', //Código Registro
                                        '1', //Código Arq.
                                        'REMESSA', //Ident. Arquivo
                                        '01', //Código do Serviço
                                        'COBRANÇA', //Ident. do Serviço
                                        spc(7), //Brancos
                                        AE(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,14),//Código da Empresa
                                        spc(6), //Brancos
                                        AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), //Nome da Empresa
                                        '422', //Código do Banco
                                        AE('BANCO SAFRA',11), //Nome do Banco
                                        spc(4), //Brancos
                                        REMOVEBARRAS(DateToStr(Date)), //Data da Gravação
                                        SPC(291), //Brancos
                                        ZE(CodArquivoRemessa,3), //Sequencia de Remessa
                                        '000001')); //No. do Registro
          Inc(iNumSeq);
          //Transação
          IntBancoManager.CdsTexto.First;
          While Not IntBancoManager.CdsTexto.Eof Do
          Begin
             If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
                 sTipoInsc := '01'
             Else
                 sTipoInsc := '02';
             rValorDocs := rValorDocs + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;
             rNossoNumero := rNossoNumero + 1;
             { Calculo do NOSSO NUMERO }
             NossoNumeroFinal := CalculaModulo11(Trim(FloatToStr(rNossoNumero)), False, 9);
             
             WriteLn(ArquivoRemessa,
                      Concat('1', //Código de registro
                             sCodInscEmpresa,//Código de inscrição
                             ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),//No.de inscrição
                             AE(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,14),//Código da Empresa
                             spc(6), // Brancos
                             AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), //Uso da Empresa(Campo Livre)
                             ZD(NossoNumeroFinal,9), //  NossoNúmero + DV preenchido com zeros a direita
                             spc(30), //Brancos
                             '0', //Código IOF
                             '00', //Código Moeda - REAL
                             spc(1), //Brancos
                             ZD(BuscaParamIntBanco('NUMDIASPROTESTO','S'),2), //Instrução 3 q é igual a QTD Dias p/protesto
                             BuscaParamIntBanco('CARTEIRA','S'), //Carteira
                             '01', //Código da Ocorrência
                             AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,10),//Seu número - Número do Título
                             REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //Data vencimento
                             ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor Nominal do Título
                             '422', //Banco
                             AE(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5), //Agência Depositária
                             '01', //Espécie do Titulo
                             BuscaParamIntBanco('ACEITE','S'), //Cód. Aceite
                             REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsString), //Data Emissão
                             AE(BuscaParamIntBanco('INSTRUCAO1','S'),2), //Instrução1
                             AE(BuscaParamIntBanco('INSTRUCAO2','S'),2), //Instrução2
                             ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), //Juros p/Dia
                             REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), //Data limite p/desconto
                             ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //Valor do desconto
                             ZD('0',13), //Valor do IOF
                             ZD('0',13),//Valor Abatimento Cencelado
                             sTipoInsc, //Código Inscrição do Sacado
                             FormataCgcCpfConta(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,sTipoInsc), //Numero de Inscrição do SACADO
                             AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40),
                             AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                     IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                     IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40), //Endereço do SACADO
                             AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,10),
                             spc(2),
                             ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                             AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                             AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),
                             AE(BuscaParamIntBanco('MENSAGEM','S'),30), //SACADOR/Avalista ou Mensagem
                             SPC(10),
                             ZE(CodArquivoRemessa,3), //Sequencia de Remessa
                             Zd(IntToStr(iNumSeq),6))); //Número sequencial
              Inc(iNumSeq);
              if not AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
                 Raise Exception.Create(MessageInfo);
              Inc(iNumSeqDoc);
              IntBancoManager.CdsTexto.Next;
          End;
          iNumSeq := iNumSeq - 1;
          WriteLn(ArquivoRemessa,Concat('9', //Código do Registro
                                        SPC(367), //Brancos
                                        Zd(IntToStr(iNumSeq),8),
                                        ZD(RemoveVirgulas(rValorDocs,2),13), //Valor Total
                                        ZE(CodArquivoRemessa,3), //Sequencia de Remessa
                                        Zd(IntToStr(iNumSeq),6))); //No. Sequencial

          CloseFile(ArquivoRemessa);
          UltNossoNumero      := FloatToStr(rNossoNumero);
          UltCodArquivoGerado := CodArquivoRemessa;
          MostraArquivo;
     Except
        On E:Exception Do
        Begin
          MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
        End;
     End;
  End;
end;

procedure TCobranca.MontaBancoBostonEscritural;
begin
  With IntBancoManager Do
  Begin
    rValorDocs   := 0;
    iNumSeq      := 1;
    iNumSeqDoc   := 0;
    sTipoInsc    := '02';
    rNossoNumero := StrToFloat(NossoNumero);
      Try
        If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
           sCodInscEmpresa := '02'
        Else
           sCodInscEmpresa := '01';

        AssignFile(ArquivoRemessa,sNomeArquivo);
        ReWrite(ArquivoRemessa);

       { Header }
        WriteLn(ArquivoRemessa,Concat('0', //Identificação do Registro
                                      '1', //Identificação do Arquivo Remessa
                                      'REMESSA', //Ident. Arquivo (Extenso)
                                      '01', //Tipo de Serviço
                                      AE('COBRANÇA',15), //Ident. do Tipo de Serviço (extenso)
                                      '00', //Zeros
                                      '1', //Tipo de Arquivo
                                      AE(BuscaParamIntBanco('CONVENIO','S'),8), //Convenio
                                      spc(9), //Brancos
                                      AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), //Nome do Cedente
                                      '479', //Banco na Câmara de Compensação
                                      AE('BANCO DE BOSTON',15), //Nome do Banco
                                      REMOVEBARRAS(DateToStr(Date)), //Data da Gravação do Arquivo
                                      '01600', //Densidade de Gravação do Arquivo
                                      'BPI', //Unidade de Gravação
                                      spc(91), //Brancos
                                      ZD('0',8), //Número do Contrato de Caução
                                      spc(187), //Brancos
                                      '000001')); //No. do Registro
        Inc(iNumSeq);
        {  Transação }
        IntBancoManager.CdsTexto.First;
        While Not IntBancoManager.CdsTexto.Eof Do
        Begin
           If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
               sTipoInsc := '01'
           Else
               sTipoInsc := '02';
           rValorDocs   := rValorDocs + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;
           rNossoNumero := rNossoNumero + 1;
           WriteLn(ArquivoRemessa,
                    Concat('1', //Código de Registro
                           sCodInscEmpresa,//Código de inscrição
                           ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),//No.de inscrição
                           spc(20), //Brancos
                           AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), //Uso da Empresa(Campo Livre)
                           AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,9),//Número do Título
                           ZD('0',11), //Valor por Dia Antecipação
                           ' ', // Brancos
                           AE('R$',4), //Código da Moeda
                           spc(20), //Reservado para uso do Banco
                           BuscaParamIntBanco('CARTEIRA','S'), //CARTEIRA
                           BuscaParamIntBanco('OCORRENCIA','S'), //OCORRENCIA
                           AE(FloatToStr(rNossoNumero),10), //Nosso Número - Não calculo o DV. Veja pq no Layout.
                           REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //Data de Vencimento
                           ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor Nominal do Titulo
                           '479', //Cód. do Banco
                           spc(5), //Brancos
                           BuscaParamIntBanco('CODIDENTTIT','S'), //Codigo Identificação do Titulo
                           BuscaParamIntBanco('ACEITE','S'), //ACEITE
                           REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsString), //Data de Emissão
                           BuscaParamIntBanco('INSTRUCAO','S'), //INSTRUCAO
                           ZD(BuscaParamIntBanco('DIAS','S'),2), //DIAS P/INSTRUCAO
                           ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), //Juros p/Dia
                           AE(REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString),6), //Data limite p/desconto
                           ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //Valor do desconto
                           ZD('0',13), //Valor do IOF
                           ZD('0',13),//Valor Abatimento
                           sTipoInsc, //Cód. de Inscrição do Sacado
                           ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14),//No.de inscrição
                           AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40), //Nome do Sacado
                           AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                   IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                   IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,37),37), //Endereço do SACADO
                           spc(3), //Brancos
                           spc(12), //Complemento do Seu número ou Brancos
                           ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                           AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                           AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),
                           AE(BuscaParamIntBanco('MENSAGEM','S'),40), //Brancos ou Mensagem
                           spc(3), //Brancos
                           Zd(IntToStr(iNumSeq),6))); //Número sequencial
            Inc(iNumSeq);
            if not AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
               Raise Exception.Create(MessageInfo);
            Inc(iNumSeqDoc);
            IntBancoManager.CdsTexto.Next;
        end;
        WriteLn(ArquivoRemessa,Concat('9', //Identificação do Registro
                                      SPC(393), //Brancos
                                      '000001')); //No. de Sequenca do Registro

        CloseFile(ArquivoRemessa);
        UltNossoNumero      := FloatToStr(rNossoNumero);
        UltCodArquivoGerado := CodArquivoRemessa;
        MostraArquivo;
      Except
        On E:Exception Do
        Begin
          MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
        End;
      End;
  end;
end;

procedure TCobranca.MontaBancoCidade;
var
   NossoNumeroFinal, Agencia : String;
begin
   With IntBancoManager Do
   Begin
      rValorDocs   := 0;
      iNumSeq      := 1;
      iNumSeqDoc   := 0;
      sTipoInsc    := '02';
      rNossoNumero := StrToFloat(NossoNumero);
      Try
        If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
           sCodInscEmpresa := '02'
        Else
           sCodInscEmpresa := '01';

        AssignFile(ArquivoRemessa,sNomeArquivo);
        ReWrite(ArquivoRemessa);
        { Header }
        WriteLn(ArquivoRemessa,Concat('0', //Registro
                                      '1', //Identificação do Arquivo Remessa
                                      'REMESSA', //Ident. Arquivo (Extenso)
                                      '01', //Produto - Codigo
                                      AE('COBRANÇA',15), //Produto - Extenso
                                      AE(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,8),//Convênio
                                      spc(12), //Brancos
                                      AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), //Nome do Cliente
                                      '244', //Código do Banco
                                      AE('BANCOCIDADE',15), //Nome do Banco
                                      REMOVEBARRAS(DateToStr(Date)), //Data da Gravação do Arquivo
                                      spc(291), //Brancos
                                      ZE(CodArquivoRemessa,3), //Sequencia de Remessa
                                      '000001')); //No. do Registro
        Inc(iNumSeq);
        { Transacao }
        Agencia := Copy(Trim(MascaraAlfa(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString)),1, Length(Agencia)-1);
        IntBancoManager.CdsTexto.First;
        While Not IntBancoManager.CdsTexto.Eof Do
        Begin
           If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
               sTipoInsc := '01'
           Else
               sTipoInsc := '02';

           rNossoNumero := rNossoNumero + 1;
          {Para o Calculo, se utiliza o Numero da Agencia sem o DV}
           NossoNumeroFinal := CalculaModulo11(Trim(FloatToStr(rNossoNumero)) + Agencia, True, 7);
           WriteLn(ArquivoRemessa,
                    Concat('1', //Código de registro
                           sCodInscEmpresa,//Código de inscrição do Cedente
                           ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),//No.de inscrição do Cedente
                           AE(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,8),//Convênio
                           spc(12), //Brancos
                           AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), //Uso da Empresa(Campo Livre)
                           FuncaoGeral.Decode(BuscaParamIntBanco('CARTEIRA','N'), '4', ZE(NossoNumeroFinal,10),ZD('0',10)), // Nosso Numero
                           spc(2), //Brancos
                           ZD('0',14), //IOC em Unidade Monetária
                           ZD('0',15), //Valor (em unidade monetária)
                           '0000', //Moeda - Sempre REAL
                           BuscaParamIntBanco('CARTEIRA','N'), //Carteira
                           ZE(BuscaParamIntBanco('SERVICO','N'),2), //Servico
                           AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,10),//Seu Número
                           REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //Data de Vencimento
                           ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor
                           '244', //Cobrador Banco
                           ZD('0',5), //Agencia/Digito - ver no layout
                           '01', //Titulo
                           BuscaParamIntBanco('ACEITE','N'), //Aceite
                           REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsString), //Data de Emissão
                           BuscaParamIntBanco('PRIMEIRAINSTRUCAO','N'), //Primeira Instrucao
                           BuscaParamIntBanco('SEGUNDAINSTRUCAO','N'), //Segunda Instrucao
                           ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), //Juros
                           AE(REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString),6), //Data limite p/desconto
                           ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //Valor do desconto
                           ZD('0',13), //IOC em Moeda Corrente
                           ZD('0',13), //Abatimento
                           sTipoInsc, // Identificacao do Sacado
                           ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14),//No.de inscrição do Sacado
                           AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,37), //Nome do Sacado
                           spc(3), //Brancos
                           AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                   IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                   IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,39),39), //Logradouro do SACADO
                           spc(1), //Branco
                           ZE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,12), //Bairro
                           ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                           AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                           AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2), //Estado
                           SPC(40), //Sacador ou Avalista e 1 Branco
                           ZE(CodArquivoRemessa,3), //Sequencia de Remessa
                           Zd(IntToStr(iNumSeq),6))); //Número sequencial
            Inc(iNumSeq);
            if not AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
               Raise Exception.Create(MessageInfo);
            Inc(iNumSeqDoc);
            IntBancoManager.CdsTexto.Next;
        end;
        { Trailler }
        WriteLn(ArquivoRemessa,Concat('9', //Identificação do Registro
                                      SPC(390), //Brancos
                                      ZE(CodArquivoRemessa,3), //Sequencia de Remessa
                                      '000001')); //No. de Sequenca do Registro

        CloseFile(ArquivoRemessa);
        UltNossoNumero      := FloatToStr(rNossoNumero);
        UltCodArquivoGerado := CodArquivoRemessa;
        MostraArquivo;
      Except
        On E:Exception Do
        Begin
          MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
        End;
      End;
   end;
end;

procedure TCobranca.MontaRegistradaHSBC;
var  NossoNumeroFinal : String;
     rNossoNumeroF : Double;
begin
   With IntBancoManager Do
   Begin
      rValorDocs   := 0;
      iNumSeq      := 1;
      iNumSeqDoc   := 0;
      sTipoInsc    := '02';

      rNossoNumero := StrToFloat(NossoNumero);
      Try
        If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
           sCodInscEmpresa := '02'
        Else
           sCodInscEmpresa := '01';

        AssignFile(ArquivoRemessa,sNomeArquivo);
        ReWrite(ArquivoRemessa);

        { Header }
        WriteLn(ArquivoRemessa,Concat('0', //Código do Registro
                                      '1', //Código do Arquivo
                                      'REMESSA', //Literal do Arquivo
                                      '01', //Código do Serviço
                                      AE('COBRANÇA',15), //Literal do Serviço
                                      '0', //Zero
                                      AE(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agencia do Cedente
                                      '55', //Sub-Conta
                                      AE(RetiraEspacos(MascaraAlfa(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString+IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString)),11), //(Agencia+Conta) = CC
                                      spc(2), //Uso do Banco
                                      AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), //Nome do Cliente
                                      '399', //Código do Banco
                                      AE('HSBC',15), //Nome do Banco
                                      AE(REMOVEBARRAS(DateToStr(Date)),6), //Data da Gravação do Arquivo
                                      '01600', //Densidade
                                      'BPI', //Literal Densidade
                                      spc(2), //Uso do Banco
                                      'LANCV08', //Sigla Layout
                                      spc(277), //Uso do Banco
                                      '000001')); //No. Sequencial
        Inc(iNumSeq);

        { Transacao }
        IntBancoManager.CdsTexto.First;
        While Not IntBancoManager.CdsTexto.Eof Do
        Begin
           If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
               sTipoInsc := '01'
           Else
               sTipoInsc := '02';
           if IntBancoManager.CdsTexto.FieldByName('NOSSONUMERO').isNull then begin
              rNossoNumero := rNossoNumero + 1;
              rNossoNumeroF := rNossoNumero;
           end else begin
              rNossoNumeroF := IntBancoManager.CdsTexto.FieldByName('NOSSONUMERO').AsFloat;
           end;
          { Numero da Empresa mais o NossoNumero gerado dinamicamente }
            NossoNumeroFinal := CalculaModulo11(Trim(FloatToStr(rNossoNumeroF)), True, 7);
           WriteLn(ArquivoRemessa,
                    Concat('1', //Código do Registro
                           sCodInscEmpresa,//Código de Inscrição do Cedente
                           ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),//No.de Inscrição do Cedente
                           '0', //Zero
                           AE(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), //Agencia do Cedente
                           '55', //Sub-Conta
                           AE(RetiraEspacos(MascaraAlfa(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString+IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString)),11), //(Agencia+Conta) = CC
                           spc(2), // Uso do Banco
                           AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), // Identificação do Titulo no sistema do Cliente(CAMPO LIVRE)
                           NossoNumeroFinal, // Nosso Numero
                           '000000', //Data Desconto(2)
                           ZE('0',11), // Valor Desconto(2)
                           '000000', //Data Desconto(3)
                           ZE('0',11), // Valor Desconto(3)
                           BuscaParamIntBanco('CARTEIRA','N'), //Carteira
                           '01', //Código da Ocorrência
                           AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,10), //Seu Número
                           REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //Data de Vencimento
                           ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor
                           '399', //Banco Cobrador
                           ZD('0',5), //Agencia encarregada da Cobrança
                           Trim(BuscaParamIntBanco('TIPOCOBRANCA','S')), //Especie do Título
                           BuscaParamIntBanco('ACEITE','N'), //Aceite
                           REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsString), //Data de Emissão
                           BuscaParamIntBanco('PRIMEIRAINSTRUCAO','N'), //Primeira Instrucao
                           BuscaParamIntBanco('SEGUNDAINSTRUCAO','N'), //Segunda Instrucao
                           ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), //Juros
                           AE(REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString),6), //Data limite p/Desconto
                           ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //Valor do Desconto
                           ZD('0',13), // Valor do IOF
                           ZD('0',13), // Valor do Abatimento
                           sTipoInsc, // Identificacao do Sacado
                           ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14),//No.de inscrição do Sacado
                           AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40), //Nome do Sacado
                           AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                   IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                   IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,38),38), //Endereço do SACADO
                           spc(2), //Instrução de não recebimento do Bloqueto
                           ZE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,12), //Bairro
                           ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8), // CEP + Sufixo do Cep
                           AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                           AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2), //Estado
                           SPC(39), //Sacador ou Avalista
                           SPC(1), // Tipo de Bloqueto
                           AE(BuscaParamIntBanco('DIAS','N'),2), // Dias p/Protesto
                           '9', //Moeda - REAL
                           Zd(IntToStr(iNumSeq),6))); //Número sequencial
            Inc(iNumSeq);
            if not AtualizaDoc('1','S',FloatToStr(rNossoNumeroF),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
               Raise Exception.Create(MessageInfo);
            Inc(iNumSeqDoc);
            IntBancoManager.CdsTexto.Next;
        end;
        { Trailler }
        WriteLn(ArquivoRemessa,Concat('9', //Código do Registro
                                      SPC(393), //Brancos
                                      Zd(IntToStr(iNumSeq),6))); //No. de Sequenca do Registro

        CloseFile(ArquivoRemessa);
        UltNossoNumero := FloatToStr(rNossoNumero);
        UltCodArquivoGerado := CodArquivoRemessa;
        MostraArquivo;
      Except
        On E:Exception Do
        Begin
          MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
        End;
      End;
   end;
end;



procedure TCobranca.MontaCobrancaEletronicaBanrisul;
var  NossoNumeroFinal,
     NossoNumero10,
     Mensagens,
     slArquivo            : String;
     iSoma                : Double;
     sMensagens, sMsgVerso : TStringList;
     iGrupos, x, iBase, y, ibaseVerso : Integer;
     iTipoDoc             : Integer; // andre Tavares - pendêcia 17041
begin
   iTipoDoc := 0;
   With IntBancoManager Do
   Begin
      rValorDocs   := 0;
      iNumSeq      := 1;
      iNumSeqDoc   := 0;
      sTipoInsc    := '02';

      rNossoNumero := StrToFloat(NossoNumero);
      Try
        If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
           sCodInscEmpresa := '02'
        Else
           sCodInscEmpresa := '01';


        slArquivo := 'COB' + FormatDateTime('DDMM',Date) + '.BDL';
        sNomeArquivo := ExtractFilePAth(sNomeArquivo) + slArquivo;
        AssignFile(ArquivoRemessa,sNomeArquivo);
        ReWrite(ArquivoRemessa);

        { Header }
        WriteLn(ArquivoRemessa,Concat('01REMESSA', //Campo Obrigatório
                                      spc(17), //Brancos
                                      AE(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,12), //Número fornecido pelo banco
                                      spc(8), //Brancos
                                      AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), //Nome do Cliente
                                      '041BANRISUL', //Constante
                                      spc(7), // Brancos
                                      AE(REMOVEBARRAS(DateToStr(Date)),6), //Data da Gravação do Arquivo
                                      spc(294), //Brancos
                                      '000001')); //No. Sequencial
        Inc(iNumSeq);
        { Transacao }
        IntBancoManager.CdsTexto.First;
        While Not IntBancoManager.CdsTexto.Eof Do
        Begin
           rNossoNumero := rNossoNumero + 1;
    { -----------------------------------------------------------------------------
      Calculo do DV do NOSSO NUMERO
      Fábio Barros - 23/11/2001
      ----------------------------------------------------------------------------- }
         { Gera a primeira vez o primeiro DV usando o modulo 10 }
           iDVmod10         := StrToFloat(Modulo10Banrisul(Trim(FloatToStr(rNossoNumero))));
           NossoNumero10    := Trim(FloatToStr(rNossoNumero)) + FloatToStr(iDvmod10);

         { Gera a primeira vez o segundo DV usando o modulo 11 }
           iDVmod11         := StrToFloat(Modulo11Banrisul(NossoNumero10, 7));

         { Se o 'RESTO' obtido no calculo do módulo 11 for igual a 1 }
           if iRestomod11 = 1 then
           begin
             iSoma := iRestomod11 + iDVmod10;
           { Se o somatório do resto(modulo 11) ao DV do modulo 10
             for igual a 10, o DV do modulo 10 será igual a 0.    }
             if iSoma = 10 then
                iDVmod10 := 0
             else
                iDVmod10 := iSoma;
             iDVmod11 := StrToFloat(Modulo11Banrisul(Trim(FloatToStr(rNossoNumero)) + FloatToStr(iDvmod10), 7));
           end;
           if iRestomod11 = 0 then
              NossoNumeroFinal := NossoNumero10 + '0'
           else
              NossoNumeroFinal := Trim(FloatToStr(rNossoNumero)) + Trim(FloatToStr(iDVmod10) + FloatToStr(iDVmod11));
    { ---------------------------------------------------------------------------- }
           rValorDocs := IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;
           If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
               sTipoInsc := '01'
           Else
               sTipoInsc := '02';
           WriteLn(ArquivoRemessa,
                   Concat('1', // Constante
                          spc(16), // Brancos
                          AE(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,12), // Número fornecido pelo banco
                          spc(8), // Brancos
                          AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), // Identificação do Titulo no sistema do Cliente(CAMPO LIVRE)
                          ZD('0',10), // Ident. do titulo para o Banco
                          AE(BuscaParamIntBanco('MENSAGEMBLOQUETO','S'),32), // Mensagem
                          spc(3), // Brancos
                          BuscaParamIntBanco('CARTEIRA','N'), // Carteira
                          '01', // Ocorrência - Remessa
                          spc(10), // Seu Número
                          REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), // Data de Vencimento
                          ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), // Valor do Titulo
                          '041', // Banco Cobrador
                          spc(5), // Brancos
                          BuscaParamIntBanco('TIPODOCUMENTO','S'), // Tipo de Documento
                          BuscaParamIntBanco('ACEITE','S'), // Aceite
                          REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsString), //Data de Emissão
                          BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S'), // Primeira Instrução
                          BuscaParamIntBanco('SEGUNDAINSTRUCAO','S'), // Segunda Instrução
                          '0', // Código de Mora
                          ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),12), // Valor ao DIA ou taxa Mensal de Juros
                          REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), //Data limite p/Desconto
                          ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //Valor do Desconto
                          ZD('0',13), // Valor do IOF
                          ZD('0',13), // Valor do Abatimento
                          sTipoInsc, // Tipo de Inscricao
                          //amf 25.06.2007 25575 - pode ser CNPJ ou CPF
                          ZD(IntBancoManager.cdsTexto.FieldByName('NUMDOCUMENTO').AsString, 14),
                          //amf 25.06.2007 AE(BuscaParamIntBanco('MF','S'),14), // Numero de Inscricao no MF
                          AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,35), //Nome do Sacado
                          spc(5), // Brancos
                          AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                  IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                  IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1, 40), 40), //Endereço do SACADO
                          spc(7), // Brancos
                          '000', // Taxa para multa após o vencimento.
                          '00', // Dias p/Multa apos o Vencimento
                          ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8), // CEP + Sufixo do Cep
                          AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                          AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2), //Estado
                          '0000', // Taxa ao dia para pagamento antecipado
                          spc(1), // Branco
                          ZD('0',13), // Valor para calculo do desconto
                          ZD(BuscaParamIntBanco('DIAS','N'),2), // Dias p/Multa apos o Vencimento
                          spc(23), // Brancos
                          Zd(IntToStr(iNumSeq),6))); //Número sequencial
            Inc(iNumSeq);
            // início - André Tavares - pendência 17041 - 21/06/2004
            iTipoDoc := strToIntDef(trim(BuscaParamIntBanco('TIPODOCUMENTO','S')), -1);
            if iTipoDoc in [4, 6, 8] then
            // if trim(BuscaParamIntBanco('TIPODOCUMENTO','S')) = '08' then
            // fim - André Tavares - pendência 17041 - 21/06/2004
            begin
    { ------------------------------------------------------------------------------
      Mensagens deste MODELO
      ------------------------------------------------------------------------------ }
              sMensagens := TStringList.Create;
              sMsgVerso  := TStringList.Create;
              mensagens  := '';
              iBase      := 0;
              iBaseVerso := 0;
              GeraMensagens(sMensagens, 90);
              GeraMensagens(sMsgVerso, 90, true);
              if sMensagens.Count <> 0 Then
              begin
              { Deleta todas as mensagens que não são do TIPO VERSO da StringList }
              { André Tavares - 19/04/2004 - pendência 16382
                for x := (sMensagens.Count - 1) downto 0 do
                  if copy(sMensagens.Strings[x],1,1) <> 'V' then
                    sMensagens.Delete(x);
              }

                if sMensagens.Count <= 3 then
                  iGrupos := 1
                else
                begin
                  iGrupos := (sMensagens.Count div 3);
                  { Podem existir no máximo 20 mensagens por documento/grupo }
                  if sMensagens.Count > 20 then iGrupos := 7;
                end;
                if (sMensagens.Count mod 3) <> 0 then
                  iGrupos := iGrupos + 1;
              {
                Executa a rotina que cria as mensagens quantas vezes forem necessárias
                para completar as 20 linhas de mensagens. Estas linhas são divididas em
                GRUPOS, onde, cada GRUPO contém 3 mensagens.
              }
                for x := 1 to iGrupos do
                begin
                  Mensagens := '';
                  // -----------------------------------------------------------------
                  for y := iBase to (iBase+2) do
                  begin
                    try
                      Mensagens := mensagens + spc(1) + copy(sMensagens.Strings[y],1,length(sMensagens.Strings[y]))
                    except
                      Mensagens := mensagens + spc(1) + spc(90);
                    end;
                  end;
                  iBase := iBase + 3;
                  // -----------------------------------------------------------------

                  WriteLn(ArquivoRemessa,
                          Concat('1', // Constante
                                 '02', //Tipo de Inscrição
                                 ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), //No.de Inscrição do Cedente
                                 AE(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,12), //Número fornecido pelo banco
                                 spc(8), //Brancos
                                 AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), // Identificação do Titulo do Cliente
                                 ZD(NossoNumeroFinal,10), //Nosso Numero - Identificação do Titulo no Banco
                                 spc(35), //Brancos
                                 '1', //Código da Carteira
                                 '00', //Código da Ocorrência
                                 mensagens, // Conteúdo das Mensagens: Controle do Canal + Mensagen
                                 spc(11), //Brancos
                                 Zd(IntToStr(iNumSeq),6))); //Número sequencial
                  Inc(iNumSeq);
                end; //for
              end;
              // inicio andre tavares  - pendência 17041 - 22/06/2004

              if smsgverso.Count <> 0 Then
              begin
                if (smsgverso.Count mod 3) = 0 then
                  igrupos := smsgverso.Count div 3
                else
                  iGrupos := smsgverso.Count div 3 + 1;
                for x := 1 to iGrupos do
                begin
                  Mensagens := '';
                  for y := iBaseVerso to (iBaseVerso+2) do
                  begin
                    try
                      Mensagens := mensagens + spc(1) + copy(smsgVerso.Strings[y],1,length(smsgVerso.Strings[y]))
                    except
                      Mensagens := mensagens + spc(1) + spc(90);
                    end;

                  end;
                  iBaseVerso := iBaseVerso + 3;

{
                  if CdsTexto.FieldByName('CODDOCUMENTO').AsString = '639' then //***
                  for z := 0 to 19 do
                  begin
                    CmDebugToFile(copy(smsgVerso.Strings[z],1,length(smsgVerso.Strings[z])), 'teste.txt');
                  end;
}
                  WriteLn(ArquivoRemessa,
                          Concat('1', // Constante
                               '02', //Tipo de Inscrição
                               ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), //No.de Inscrição do Cedente
                               AE(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,12), //Número fornecido pelo banco
                               spc(8), //Brancos
                               AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), // Identificação do Titulo do Cliente
                               ZD(NossoNumeroFinal,10), //Nosso Numero - Identificação do Titulo no Banco
                               spc(35), //Brancos
                               '1', //Código da Carteira
                               '98', //Código da Ocorrência
                               mensagens, // Conteúdo das Mensagens: Controle do Canal + Mensagen
                               spc(11), //Brancos
                               Zd(IntToStr(iNumSeq),6))); //Número sequencial
                  Inc(iNumSeq);
                end; // for
              end; // if
                // fim andre tavares
            end;

            if not AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
               Raise Exception.Create(MessageInfo);
            Inc(iNumSeqDoc);
            sMensagens.free;
            sMsgVerso.free;
            IntBancoManager.CdsTexto.Next;
        end;
        { Trailler }
        WriteLn(ArquivoRemessa,Concat('9', //Código do Registro
                                      spc(26), // Brancos
                                      ZD(RemoveVirgulas(rValorDocs,2),13), // Somatório do Valor dos Titulos
                                      spc(354), // Brancos
                                      Zd(IntToStr(iNumSeq),6))); //No. de Sequencia do Registro
        CloseFile(ArquivoRemessa);
        UltNossoNumero      := FloatToStr(rNossoNumero);
        UltCodArquivoGerado := CodArquivoRemessa;
        MostraArquivo;
      Except
        On E:Exception Do
        Begin
          MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
        End;
      End;
   end;
end;






function TCobranca.Modulo10Banrisul(sNossoNumero: String): String;
Var
   sNumero: String;
   Divisor, iResto, iBase, X, iDividendo, iDigito, iSoma : Integer;
Begin
  sNumero    := sNossoNumero;
  iBase      := 2;
  iDividendo := 0;
  Divisor    := 10;
  For X := Length(sNumero) downto 1 do
  begin
    {
      De acordo com o layout do arquivo, a subtração pelo 9 só é efetuada se o produto
      obtido NÃO for menor que 9. Por isso eu utilizei a variável ISOMA.
    }
    if (StrToInt(sNumero[x]) * ibase) <= 9 then
       iSoma := (StrToInt(sNumero[x]) * ibase)
    else
       iSoma := (StrToInt(sNumero[x]) * ibase) - 9;

    iDividendo := iDividendo + iSoma;
    if iBase = 2 then
       iBase := 1
    else
       iBase := 2;
  end;

  iResto := (iDividendo mod Divisor);
  if iResto = 0 then
    iDigito := 0
  else
  begin
    if iDividendo < Divisor then iResto := iDividendo;
    iDigito   := Divisor - iResto;
  end;

  iRestomod10 := iResto;
  Result      := IntToStr(iDigito);
end;


function TCobranca.Modulo11Banrisul(sNossoNumero: String; Base: Integer): String;
var
  sNumero: String;
  Divisor, iResto, iBase, X, iDividendo, iDigito : Integer;
Begin
  sNumero    := sNossoNumero;
  iBase      := 2;
  iDividendo := 0;
  Divisor    := 11;

  For X := Length(sNumero) downto 1 do
  begin
    iDividendo := iDividendo + (StrToInt(sNumero[x]) * ibase);

    Inc(iBase);
    if iBase > Base Then iBase := 2;
  end;

  if iDividendo < Divisor then
     iResto   := iDividendo
  else
     iResto   := (iDividendo Mod Divisor);

  iRestomod11 := iResto;
  iDigito     := Divisor - iResto;
  Result      := IntToStr(iDigito);
end;



procedure TCobranca.MontaCobrancaEletronicaBBV;
var
  NossoNumeroFinal   : String;
  IdentificaEmpresa  : String;
  CodigoEmpresa      : String;
begin
  With IntBancoManager Do
  Begin
    rValorDocs   := 0;
    iNumSeq      := 1;
    sTipoInsc    := '02';
    rNossoNumero := StrToFloat(NossoNumero);

    Try
      { Pega o conteúdo do campo CODIGO EMPRESA no portador forma }
      IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket('SELECT NUMRAZAOCC FROM PORTADORFORMA WHERE CODPORTFORMA = ' + IntToStr(CodigoPortadorForma));
      CodigoEmpresa := IntBancoManager.CdsAux.FieldByName('NUMRAZAOCC').AsString;
      IntBancoManager.CdsAux.Close;

      If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
         sCodInscEmpresa := '02'
      Else
         sCodInscEmpresa := '01';

      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);

      { Header }
      WriteLn(ArquivoRemessa,
              Concat('0', // Identificação do Registro
                     '1', // Identificação arquivo remessa
                     'REMESSA', // Literal remessa
                     '01', // Código do Serviço
                     AE('COBRANÇA',15), // Literal do serviço
                     '1', // Tipo serviço
                     '00000', // Zeros
                     ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),// Numero de Inscricao da Empresa
                     AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), //Nome da Empresa
                     '641', // Código do Banco
                     AE('BBV BANCO',15), // Nome do Banco
                     AE(REMOVEBARRAS(DateToStr(Date)),6), //Data da Gravação do Arquivo
                     spc(14), // Brancos
                     ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), // Numero da Agência
                     ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,10), // Numero da CONTA CORRENTE
                     ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,5), // Número fornecido pelo banco
                     AE(BuscaParamIntBanco('TIPOLAYOUT','S'),1), // Tipo de layout do cedente
                     '20', // Código do Produto
                     '2001', // Código do Sub-Produto
                     spc(251), // Brancos
                     ZE(CodArquivoRemessa,3), //Sequencia de Remessa
                     '000001')); //No. Sequencial de Registro
      Inc(iNumSeq);
      { Transacao }
      IntBancoManager.CdsTexto.First;
      iTotSeq := 0;
      While Not IntBancoManager.CdsTexto.Eof Do
      Begin
        If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
          sTipoInsc := '01'
        Else
          sTipoInsc := '02';

        inc(iTotSeq);
        rValorDocs    := IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;
        rNossoNumero  := rNossoNumero  + 1;


        NossoNumeroFinal := CodigoEmpresa + CalculaModulo11(ZD(Trim(FloatToStr(rNossoNumero)),7), True, 8);

      { Zeros + Tipo de Cobrança + Agencia c/DV + Conta Corrente }
        IdentificaEmpresa := '000' + '01' + ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5) +
                             ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,10);
        WriteLn(ArquivoRemessa,
                Concat('1', // Constante
                       sCodInscEmpresa, // Tipo de Inscrição da Empresa
                       ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),// Numero de Inscricao da Empresa
                       IdentificaEmpresa, // Identificação da Empresa no Banco
                       AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), // Identificação do Titulo no sistema do Cliente(CAMPO LIVRE)
                       '00000' + NossoNumeroFinal, // Nosso Numero
                       spc(4), // Brancos
                       ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,5), // Número fornecido pelo banco
                       AE(BuscaParamIntBanco('TIPOLAYOUT','S'),1), // Tipo de layout do cedente
                       '20', // Código do Produto
                       '2001', // Código do Sub-Produto
                       spc(9), // Brancos
                       AE(BuscaParamIntBanco('CARTEIRA','S'),1), // Carteira
                       '01', // Identificação de Ocorrência: 01 - Remessa
                       Spc(10), // Número do Título
                       REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), // Data de Vencimento
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), // Valor
                       ZD('0',3), // Banco encarregado da cobrança ou Banco do Cheque
                       ZD('0',5), // Agencia Cobradora + digitos. No layout ele diz pra colocar zeros
                       '01', // Espécie de Título: 01 - Duplicata
                       'N', // Identificação: N - Não aceito
                       REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsString), //Data de Emissão
                       BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S'), // Primeira Instrução
                       BuscaParamIntBanco('SEGUNDAINSTRUCAO','S'), // Segunda Instrução
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), // Valor ao DIA de Atraso
                       REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), //Data limite p/Desconto
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //Valor do Desconto
                       ZD('0',13), // IOF
                       ZD('0',13), // Valor do Abatimento
                       sTipoInsc, // Tipo de Inscrição do Cliente
                       ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14),// Numero de Inscricao do Cliente
                       AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40), //Nome do Sacado
                       AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                               IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString,1, 40), 40), //Endereço do SACADO
                       AE(IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,12), // Bairro
                       ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8), // CEP + Sufixo do Cep
                       AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                       AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2), //Estado
                       AE(BuscaParamIntBanco('MENSAGEM','S'),40), // Mensagem
                       ZD(BuscaParamIntBanco('DIAS','N'),2), // Prazo Instrução
                       '9', // Código da Moeda: 9 - REAL
                       Zd(IntToStr(iNumSeq),6))); //Número sequencial
        Inc(iNumSeq);
        if not AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
           Raise Exception.Create(MessageInfo);
        IntBancoManager.CdsTexto.Next;
      end;
      { Trailler }
      WriteLn(ArquivoRemessa,Concat('9', // Identificação do Registro
                                    zd(IntToStr(iTotSeq),10), // Total de Entradas
                                    ZD(RemoveVirgulas(rValorDocs,2),19), // Somatório do Valor das Entradas
                                    spc(364), // Brancos
                                    Zd(IntToStr(iNumSeq),6))); //No. de Sequencia do Registro
      CloseFile(ArquivoRemessa);
      UltNossoNumero      := FloatToStr(rNossoNumero);
      UltCodArquivoGerado := CodArquivoRemessa;
      MostraArquivo
    Except
      On E:Exception Do
      Begin
        MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
        CloseFile(ArquivoRemessa);
        Raise;
      End;
    End;
  end;
end;

procedure TCobranca.MontaCobrancaRegistradaUnibanco;
var
  NossoNumeroFinal   : String;
begin
  With IntBancoManager Do
  Begin
    rValorDocs   := 0;
    iNumSeq      := 1;
    sTipoInsc    := '02';
    rNossoNumero := StrToFloat(NossoNumero);

    Try
      If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
         sCodInscEmpresa := '02'
      Else
         sCodInscEmpresa := '01';

      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);

      { Header }
      WriteLn(ArquivoRemessa,
              Concat('0', // Código Registro
                     '1', // Código Remessa
                     'REMESSA', // Literal remessa
                     '01', // Código Serviço
                     'COBRANÇA', // Literal Serviço
                     spc(7), // Uso do Banco - Brancos
                     ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), // Agência Crédito
                     ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), // Conta Crédito + DV conta Crédito
                     ZD('0',9), // Zeros
                     AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), //Nome da Empresa
                     '409', // Código do Banco
                     'UNIBANCO', // Nome do Banco
                     spc(7), // Uso do Banco - Brancos
                     AE(REMOVEBARRAS(DateToStr(Date)),6), //Data da Gravação do Arquivo
                     '01600', // Densidade
                     'BPI', // Literal da Densidade
                     zd('0',286), // Uso do Banco - Zeros
                     '000001')); //No. Sequencial de Registro
      Inc(iNumSeq);
      { Transacao }
      IntBancoManager.CdsTexto.First;
      iTotSeq := 0;
      While Not IntBancoManager.CdsTexto.Eof Do
      Begin
        If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
          sTipoInsc := '01'
        Else
          sTipoInsc := '02';

        inc(iTotSeq);
        rValorDocs    := IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;
        rNossoNumero  := rNossoNumero  + 1;
        NossoNumeroFinal := ZD(Trim(FloatToStr(rNossoNumero)),11);
        WriteLn(ArquivoRemessa,
                Concat('1', // Código Registro - FIXO
                       '02', // Código Inscrição - FIXO
                       ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),// Numero de Inscricao
                       ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), // Agência onde o Cliente mantém Conta
                       ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), // Conta do Título + DV
                       ZD('0',9), // Uso do Banco - Zeros
                       AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), // Identificação do Titulo no sistema do Cliente(CAMPO LIVRE)
                       NossoNumeroFinal, // Nosso Numero + DV
                       AE(BuscaParamIntBanco('MENSAGEM','S'),30), // Mensagem
                       spc(4), // Codigo Moeda
                       AE(BuscaParamIntBanco('CARTEIRA','S'),1), // Carteira
                       '01', // Tipo de Transação: 01 - REMESSA
                       AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,10),// Numero do Titulo na Empresa
                       REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), // Data de Vencimento
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), // Valor
                       '409', // Banco Cobrador
                       '0', // Uso do Banco - Zero
                       ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), // Agência cobradora
                       '01', // Espécie do Título: 01 - Duplicata Mercantil
                       AE(BuscaParamIntBanco('ACEITE','S'),1), // Aceite
                       REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsString), //Data de Emissão
                       BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S'), // Primeira Instrução
                       BuscaParamIntBanco('SEGUNDAINSTRUCAO','S'), // Segunda Instrução
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), // Valor ao DIA de Atraso
                       REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), //Data limite p/Desconto
                       ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), //Valor do Desconto
                       spc(13), // Uso do Banco - Brancos
                       ZD('0',13), // Abatimento
                       sTipoInsc, // Tipo de Inscrição do Sacado
                       ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14),// Numero de Inscricao do Sacado

                       AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,30), // Nome do Sacado
                       spc(10), // Uso do Banco
                       AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                               IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString,1, 30), 30), //Endereço do SACADO
                       AE(IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,10), // Complemento
                       AE(IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,12), // Bairro
                       ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8), // CEP + Sufixo do Cep
                       AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                       AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2), //Estado
                       spc(30), // Sacador/Avalista
                       ZD('0',10), // Uso do Banco - ZEROS
                       ZD(BuscaParamIntBanco('DIAS','N'),2), // Prazo Protesto
                       '0', // Uso do Banco
                       Zd(IntToStr(iNumSeq),6))); //Número sequencial
        Inc(iNumSeq);
        if not AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
           Raise Exception.Create(MessageInfo);
        IntBancoManager.CdsTexto.Next;
      end;
      { Trailler }
      WriteLn(ArquivoRemessa,Concat('9', // Identificação do Registro
                                    ZD('0',390), // Zeros
                                    ZE(CodArquivoRemessa,3), // Numero de Geração do Arquivo
                                    zd(IntToStr(iTotSeq),6))); // Quantidade total de registros
      CloseFile(ArquivoRemessa);
      UltNossoNumero      := FloatToStr(rNossoNumero);
      UltCodArquivoGerado := CodArquivoRemessa;
      MostraArquivo;
    Except
      On E:Exception Do
      Begin
        MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
        CloseFile(ArquivoRemessa);
        Raise;
      End;
    End;
  end;
end;

procedure TCobranca.MontaCobrancaSemRegistroUnibanco;
var
  NossoNumeroFinal   : String;
begin
   With IntBancoManager Do
   Begin
     rValorDocs   := 0;
     iNumSeq      := 1;
     sTipoInsc    := '02';
     rNossoNumero := StrToFloat(NossoNumero);
     Try
       If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
          sCodInscEmpresa := '2'
       Else
          sCodInscEmpresa := '1';

       AssignFile(ArquivoRemessa,sNomeArquivo);
       ReWrite(ArquivoRemessa);

       { Header }
       WriteLn(ArquivoRemessa,
               Concat('0', // Código Registro
                      '1', // Código Remessa
                      'REMESSA', // Literal remessa
                      '03', // Código Serviço
                      AE('COBR.  ESPECIAL',15), // Literal Serviço
                      ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), // Agência
                      ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7),   // C/C + DV do Cedente
                      ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,4), // Número fornecido pelo banco
                      AE(BuscaParamIntBanco('FORMULARIO','S'),1), // Tipo de Formulario
                      '1', // Tipo de Crítica
                      '0', // Tipo de Postagem
                      ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,7), // Número fornecido pelo Gerente do Banco
                      spc(43), // Brancos
                      AE(REMOVEBARRAS(DateToStr(Date)),6), //Data de envio do Arquivo
                      '01600BPI', // Densidade e Literal Densidade
                      spc(116), // Brancos
                      ZD('0',167), // Zeros
                      ZE(CodArquivoRemessa,3), // Numero da versão do Arquivo
                      '000001')); //No. Sequencial de Registro
       Inc(iNumSeq);
       { Transacao }
       IntBancoManager.CdsTexto.First;
       iTotSeq := 0;
       While Not IntBancoManager.CdsTexto.Eof Do
       Begin
         If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
           sTipoInsc := '1'
         Else
           sTipoInsc := '2';

         inc(iTotSeq);
         rValorDocs    := IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;
         rNossoNumero  := rNossoNumero  + 1;
         NossoNumeroFinal := ZD(Trim(FloatToStr(rNossoNumero)),11);
         WriteLn(ArquivoRemessa,
                 Concat('2', // Código Registro - FIXO
                        ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),// Referencia do Cliente
                        sCodInscEmpresa, // DV da Referencia do Cliente
                        REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), // Data de Vencimento
                        ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), // Agência Depositária

                        ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), // Agência
                        ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), // Conta do Cedente + DV
                        AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,30), // Nome do Sacado
                        AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString,1, 30), 30), //Endereço do SACADO
                        AE(IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,20), // Bairro
                        AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,20),
                        AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2), //Estado
                        ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8), // CEP + Sufixo do Cep
                        REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsString), //Data de Registro
                        spc(2),
                        ZD('0',10), // Qtd de Moedas
                        ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),15), // Valor
                        ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15), //Valor do Desconto
                        ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),12), // Valor ao DIA de Atraso
                        ZD('0',12), // Multa
                        '000', // No de Parcelas
                        spc(42),
                        AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,18),// Numero do Titulo na Empresa
                        AE('MERCAN',6), // Especie
                        AE(BuscaParamIntBanco('ACEITE','N'),2), // ACEITE
                        AE(REMOVEBARRAS(DateToStr(Date)),6), //Data de Processamento
                        '20', // Carteira
                        '0', // Indicador de Mensagem
                        REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), //Data limite p/Desconto
                        ZD('0',6), // Data para multa
                        ZD(BuscaParamIntBanco('DIAS','N'),3), // Prazo de Mora
                        spc(4), // Código de Moeda
                        spc(13), // Brancos
                        spc(60), // Endereço 2 do SACADO
                        spc(3), // Brancos
                        Zd(IntToStr(iNumSeq),6))); //Número sequencial
         Inc(iNumSeq);
         if not AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
            Raise Exception.Create(MessageInfo);
         IntBancoManager.CdsTexto.Next;
       end;
       { Trailler }
       WriteLn(ArquivoRemessa,Concat('9', // Identificação do Registro
                                     spc(25), // Brancos
                                     ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4), // Agência
                                     ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,7), // Conta do Cedente + DV
                                     spc(334), // Brancos
                                     zd(IntToStr(iTotSeq),6), // Quantidade total de registros
                                     ZD(RemoveVirgulas(rValorDocs,2),17), // Somatório do Valor das Entradas
                                     Zd(IntToStr(iNumSeq),6))); // Numero sequencial
       CloseFile(ArquivoRemessa);
       UltNossoNumero      := FloatToStr(rNossoNumero);
       UltCodArquivoGerado := CodArquivoRemessa;
       MostraArquivo;
     Except
       On E:Exception Do
       Begin
         MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
         CloseFile(ArquivoRemessa);
         Raise;
       End;
     End;
   end;
end;

procedure TCobranca.GeraDebAutBanrisul;
var
 slArquivo: String;
 sAgencia, sConta : string;

begin
  With IntBancoManager Do
  Begin
    Try
      rValorDocs   := 0;
      iNumSeq      := 1;
      sTipoInsc    := '02';
      rNossoNumero := StrToFloat(NossoNumero);

      iTotSeq         := 0;
      rValorDocs      := 0;
      {Nome do Arquivo a ser Gerado}
      slArquivo := 'DAUT' + FormatDateTime('DDMM',Date) + '.BJW';
      sNomeArquivo := ExtractFilePAth(sNomeArquivo) + slArquivo;


      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);

      WriteLn(ArquivoRemessa,
        Concat('A', // Código do Registro
               '1', // Código de Remessa
               Ae(IntBancoManager.CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,5), //Código do Convênio
               Spc(15), // Brancos
               AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,20), // Nome da Empresa
               '041', // Código do Banco
               AE(IntBancoManager.CdsEmpresa.FieldByName('NOMEBANCO').AsString,20), // Nome do Banco
               FormatDateTime('YYYYMMDD', Date), //Data da Gravação do Arquivo
               ZD((CodArquivoRemessa),6), //Numero Sequencial da Remessa
               '04', // Versão do Layout
               AE('DÉBITO AUTOMÁTICO',17), // Descrição do Layout
               spc(52))); // Brancos
      Inc(iTotSeq);

      IntBancoManager.CdsTexto.First;
      While Not IntBancoManager.CdsTexto.Eof Do
      begin
  // início - andré tavares - pendência 17531 - 01/09/2004
      sAgencia := '0000';
      sConta := '0000000000';
      IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
      IntBancoManager.DtmDadosBancarios.SqlBuscaCC.Sql.Text :=
        ' SELECT  '+
        '   D.CODDOCUMENTO,  C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA, C.IDCBANCARIA, '+
        '   B.MASCARACC, '+
        '   B.MASCARAAGENCIA  '+
        ' FROM '+
        '   PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B '+
        ' WHERE '+
        '   (D.IDFORCLI = ' + IntBancoManager.CdsTexto.FieldByName('IDFORCLI').AsString +') AND '+
        '   (C.IDPESSOA = D.IDFORCLI)  AND       '+
        '   (C.FLGCONTAPREF = 1)       AND       '+
        '   (C.IDAGENCIA = A.IDPESSOA) AND       '+
        '   (A.IDBANCO   = B.IDPESSOA) AND       '+
        '   (A.IDPESSOA = PA.IDPESSOA) AND       '+
        '   (B.IDPESSOA = PB.IDPESSOA)           ';
      IntBancoManager.DtmDadosBancarios.SqlBuscaCC.Open;
      sAgencia := zd(IntBancoManager.DtmDadosBancarios.cdsBuscaCC.FieldByName('NUMAGENCIA').asString, 4);
      sConta   := zd(IntBancoManager.DtmDadosBancarios.cdsBuscaCC.FieldByName('CONTACORRENTE').asString, 10);
  // fim - andré tavares - pendência 17531 - 01/09/2004

        WriteLn(ArquivoRemessa,
            Concat('E', // Código do Registro
                   AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,25), //Identificação do Cliente na Empresa
  // início - andré tavares - pendência 17531 - 01/09/2004
  //                   GetAG(4,False,True), //Agência para Débito
  //                   GetCC(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString, 10, True, True),
                  sAgencia, sConta,  
  // fim - andré tavares - pendência 17531 - 01/09/2004
                   spc(4), //Brancos
                   RemoveBarras3(FuncaoGeral.Decode(DataPagamento,'', IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data do Vencimento
                   ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),15), //Valor Pagto
                   '03', //Código da Moeda - '03' para REAL / '01' para UFIR
                   AE(IntBancoManager.CdsTexto.FieldByName('CODDOCUMENTO').AsString,60), //Uso da Empresa
                   spc(20), //Reservado para o futuro
                   '0')); //Código do Movimento
        if not AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
           Raise Exception.Create(MessageInfo);
        rValorDocs := rValorDocs + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;
        Inc(iTotSeq);
        IntBancoManager.CdsTexto.Next;
      End;
      //Trailer Geral
      Inc(iTotSeq);
      Write(ArquivoRemessa,
              Concat('Z', // Código do Registro
                     Zd(IntToStr(iTotSeq),6), // Quantidade Total de Registros no Arquivo(inclusive header e trailler)
                     Zd(RemoveVirgulas(rValorDocs,2),17), // Soma dos Valores de todos os registros do arquivo
                     spc(126) )); // Filler

      CloseFile(ArquivoRemessa);
      UltNossoNumero      := FloatToStr(rNossoNumero);
      UltCodArquivoGerado := CodArquivoRemessa;
      MostraArquivo;
    Except
      On E:Exception Do
      Begin
        MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message ,'Atenção');
        CloseFile(ArquivoRemessa);
        Raise;
      End;
    End;
 End;
End;





end.
