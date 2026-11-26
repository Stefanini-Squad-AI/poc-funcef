{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCnabCEF: Implementação do arquivo de               }
{             Cobrança Eletrônica CEF                   }
{   CEF REMESSA - 240 Posições                          }
{   IDMODELOSCNAB = 8/R                                 }
{                                                       }
{ Analista Responsável: Fábio Barros                    }
{ Criado em: 22/08/2002                                 }
{*******************************************************}

unit uCnabCefMT;

interface

Uses Forms, Classes, SysUtils, Dialogs, Graphics, Controls, 
     Windows;

Type
   TMensagensCnab = array [0..8] of string;

Type
   TCnabCEF = Class
   private
    //Arquivo de remessa a ser gerado
    ArquivoRemessa :TextFile;
    //Contador sequencial de registros do arquivo
    _iNumSeq: Integer;
    //Contador sequencial de lotes no arquivo
    _iNumLote: Integer;
    //Contador sequencial de registros no lote
    _iNumRegLote: Integer;

    //Tipo de inscrição da empresa na ficha de compensação
    _TipoInsc:String;

    //Código de inscrição da empresa
    _CodInscEmpresa :String;

    //Nosso número do documento gerado
    _NossoNumero :Real;

    fMensagensCnab :TMensagensCnab;
    fDataCredito,       fCarteira,        fCodDevolve,        fTipoImpressao,     fNumLInhaImpressao,
    fFormaCadTit,       fTipodeDocumento, fIdentEmissao,      fIdentDistrib,      fEspecieTitulo,
    fAceite,            fCodJuros,        fCodDesconto,       fCodProtesto,       fNumDiasProtesto,
    fNumDiasBaixa,      fNumContrato,     fCodDesconto2,      fDataDesconto2,     fValorDesconto2,
    fCodDesconto3,      fDataDesconto3,   fValorDesconto3,    fCodMulta,          fDataMulta,
    fMensagemImpressao, fValorMulta,      fTipocaracter,      fNumConvenio,       fCarteiraConvenio,
    fVariacaoConvenio, fTipoCobranca :String;

    //Buscao o número do convênio da empresa no banco
    Function  GetNumConvenio :String;
    //Gera o header principal do arquivo
    procedure HeaderArquivo;
    //gera o trailer principal do arquivo
    procedure TrailerArquivo;
    //gerar o header de lote de cobrança
    procedure HeaderLoteCobr;
    //gerao trailder de lote de cobrança
    procedure TrailerLoteCobr;
    //gera detalhe tipo P ( Ver manual )
    procedure DetalheP;
    //gera detalhe tipo Q ( Ver manual )
    procedure DetalheQ;
   public
    //Monta arquivo de dados bancários
    procedure MontaArquivo;

    //Data do crédito na conta do favorecido
    property DataCredito       :string         read fDataCredito       write fDataCredito;
    //Carteira do documento a ser creditado
    property Carteira          :string         read fCarteira          write fCarteira;
    //Código de devolução para o registro
    property CodDevolve        :string         read fCodDevolve        write fCodDevolve;
    //Tipo de impressão da ficha de compensação
    property TipoImpressao     :string         read fTipoImpressao     write fTipoImpressao;
    //Numero da linha gerada
    property NumLInhaImpressao :string         read fNumLInhaImpressao write fNumLInhaImpressao;
    //Forma dd cadastro do título no banco
    property FormaCadTit       :string         read fFormaCadTit       write fFormaCadTit;
    //Tipo de documento
    property TipodeDocumento   :string         read fTipodeDocumento   write fTipodeDocumento;
    //Identificação a forma de emissão da ficha de compensação
    property IdentEmissao      :string         read fIdentEmissao      write fIdentEmissao;
    //Identifica a forma de distribuição da ficha de compensação
    property IdentDistrib      :string         read fIdentDistrib      write fIdentDistrib;
    //Espécie do documento
    property EspecieTitulo     :string         read fEspecieTitulo     write fEspecieTitulo;
    //Aceite do documento
    property Aceite            :string         read fAceite            write fAceite;
    //Código para cobrança de juros
    property CodJuros          :string         read fCodJuros          write fCodJuros;
    //Código para concessão de desconto
    property CodDesconto       :string         read fCodDesconto       write fCodDesconto;
    //Código da ocorrencia e indicação de protesto
    property CodProtesto       :string         read fCodProtesto       write fCodProtesto;
    //Número de dias pós vencimento para protestp
    property NumDiasProtesto   :string         read fNumDiasProtesto   write fNumDiasProtesto;
    //Número de dias para baixa do título
    property NumDiasBaixa      :string         read fNumDiasBaixa      write fNumDiasBaixa;
    //Número do contrato de cobrança
    property NumContrato       :string         read fNumContrato       write fNumContrato;
    //Código para tipo de desconto
    property CodDesconto2      :string         read fCodDesconto2      write fCodDesconto2;
    //data do desconto indicado no Código 2
    property DataDesconto2     :string         read fDataDesconto2     write fDataDesconto2;
    //valor do desconto indicado no Código 2
    property ValorDesconto2    :string         read fValorDesconto2    write fValorDesconto2;
    //Código para tipo de desconto
    property CodDesconto3      :string         read fCodDesconto3      write fCodDesconto3;
    //data do desconto indicado no Código 2
    property DataDesconto3     :string         read fDataDesconto3     write fDataDesconto3;
    //valor do desconto indicado no Código 3
    property ValorDesconto3    :string         read fValorDesconto3    write fValorDesconto3;
    //Código para tipo de multa
    property CodMulta          :string         read fCodMulta          write fCodMulta;
    //data base para aplicação da multa
    property DataMulta         :string         read fDataMulta         write fDataMulta;
    //valor da multa a ser cobrada
    property ValorMulta        :string         read fValorMulta        write fValorMulta;
    //Mensagem gerada na impressão
    property MensagemImpressao :string         read fMensagemImpressao write fMensagemImpressao;
    property Tipocaracter      :string         read fTipocaracter      write fTipocaracter;
    //Número do convênio da empresa com o banco
    property NumConvenio      :string          read fNumConvenio       write fNumConvenio;
    //Número da carteira que forma o número do convenio
    property CarteiraConvenio :string          read fCarteiraConvenio  write fCarteiraConvenio;
    //Número da variação que forma o número do convenio
    property VariacaoConvenio :string          read fVariacaoConvenio  write fVariacaoConvenio;
    //Tipo de cobrança
    property TipoCobranca :string          read fTipoCobranca  write fTipoCobranca;
    //Mensagens a serem impressas no arquivo
    property MensagensCnab     :TMensagensCnab read fMensagensCnab     write fMensagensCnab;
end;

Var
  CnabCEF: TCnabCEF;


implementation

Uses fParamCnabCEFMT, uString, uIntBancoManager, uCMDialogs;

Function TCnabCEF.GetNumConvenio:String;
Begin
   Result := ZD(fNumConvenio, 16);
End;

procedure TCnabCEF.MontaArquivo;
begin
  With IntBancoManager Do
  Begin
    Application.CreateForm(TfrmParamCnabCEFMT, frmParamCnabCEFMT);
    If (frmParamCnabCEFMT.ShowModal = MrOk) Then
    Begin
       frmParamCnabCEFMT.Free;

       _iNumSeq     := 1; // Usado nos detalhes
       _iNumLote    := 0; // Incrementado apenas no Header
       _iNumRegLote := 0; // Incrementado em todos os segmentos do lote inclusive header e trailler
       _TipoInsc    := '2';
       _NossoNumero := StrToFloat(NossoNumero);

       Try
          If CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
             _CodInscEmpresa := '2'
          Else
             _CodInscEmpresa := '1';

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          HeaderArquivo;
          HeaderLoteCobr;

          CdsTexto.First;
          While Not CdsTexto.Eof Do
          Begin
             If CdsTexto.FieldByName('TIPO').AsString = 'F' Then
                 _TipoInsc := '1'
             Else
                 _TipoInsc := '2';

             _NossoNumero := _NossoNumero + 1;

             DetalheP;
             DetalheQ;

             if not IntBancoManager.AtualizaDoc('1','S',FloatToStr(_NossoNumero),DateToStr(Date),CodArquivoRemessa,CdsTexto.FieldByName('CodDocumento').AsString,CdsTexto.FieldByName('FLGGRUPO').AsString) then
                raise Exception.Create(IntBancoManager.MessageInfo);
                
             CdsTexto.Next;
          End;

          TrailerLoteCobr;
          TrailerArquivo;


          CloseFile(ArquivoRemessa);

          UltNossoNumero      := FloatToStr(_NossoNumero);
          UltCodArquivoGerado := CodArquivoRemessa;
          MostraArquivo;
        Except
          On E:Exception Do
          Begin
            MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + e.Message,'Atenção');
            CloseFile(ArquivoRemessa);
            Raise;
          End;
        End;
    End
    Else
    Begin
      frmParamCnabCEFMT.Free;
      Raise Exception.Create('O arquivo de remessa para o Banco do Brasil não foi gerado');
    End;
  End;
End;

procedure TCnabCEF.HeaderArquivo;
var sConvenio : String;
begin
 with IntBancoManager do
 begin
   sConvenio := spc(20);
   sConvenio := GetNumConvenio;
   WriteLn(ArquivoRemessa,Concat('104', //Código do Banco
                                 '0000', //Lote de serviço
                                 '0', //Indicação do Header de arquivo
                                 Spc(9), //Brancos
                                 _CodInscEmpresa, //Tipo de inscrição da empresa
                                 ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),//numero de inscricao
                                 sConvenio, //Numero do Convênio
                                 spc(4), //Brancos
                                 ZD(Copy(CdsTexto.FieldByName('NUMAGENCIA').AsString,1,6),6), // Agencia Cedente
                                 ZD(CdsTexto.FieldByName('NUMCONTA').AsString,13),//Conta Cedente
                                 ' ', //DV Agência/Conta
                                 AE(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30),//Nome do Cedente
                                 AE('CAIXA ECONOMICA FEDERAL',30),//Nome do Banco
                                 Spc(10), //Branco
                                 '1', //Código da Remessa
                                 RemoveBarras2(DateToStr(Date)), //Data da geração do arquivo
                                 RemovePontos(TimeToStr(Time)), //Hota da geração do arquivo
                                 ZD(CodArquivoRemessa,6), //Sequencia do Movimento
                                 '030', //Versão do layoute do arquivo
                                 '00000',//Densidade da gravação do arquivo
                                 Spc(20), //Brancos
                                 Spc(20), //Uso da Empresa
                                 Spc(29))); //USO Febraban/Cnab
 end;
end;

procedure TCnabCEF.TrailerArquivo;
begin
  with IntBancoManager do
  begin
    WriteLn(ArquivoRemessa,Concat('104', //Código do Banco na
                                  '9999', //Lote de serviço
                                  '9', //Indicação do Header de arquivo
                                  Spc(9), //Brancos
                                  Zd(IntToStr(_iNumLote),6), //Quantidade de Lotes
                                  Zd(IntToStr( 4 + _iNumSeq ),6), //Total de registros
                                  Zd('0',6), //Qtde de contas para conciliação
                                  Spc(205))); //Brancos
  end;
end;

procedure TCnabCEF.HeaderLoteCobr;
Var sConvenio : String;
begin
  with IntBancoManager do
  begin
    Inc(_iNumLote); // Só incrementa aqui...
    sConvenio := spc(20);
    sConvenio := GetNumConvenio;
    WriteLn(ArquivoRemessa,Concat('104', //Código do Banco
                                   zd(IntToStr(_iNumLote),4), //Número do lote de serviço
                                   '1', //Indicação do Trailer de lote
                                   'R', //Tipo de Operação3u/
                                   '01', //Tipo de Serviço
                                   '00', //Forma de Lançamento
                                   '020', //Nº da versão do layout
                                   spc(1), //Brancos
                                   _CodInscEmpresa, //Tipo de inscrição da empresa
                                   ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,15),//numero de inscricao
                                   sConvenio,
                                   spc(4), //Brancos
                                   ZD(Copy(CdsTexto.FieldByName('NUMAGENCIA').AsString,1,6),6), //Agência//Agencia Cedente
                                   ZD(CdsTexto.FieldByName('NUMCONTA').AsString,13),//Conta Cedente
                                   spc(1),
                                   AE(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30),//Nome do Cedente
                                   Ae(fMensagensCnab[0],40),
                                   Ae(fMensagensCnab[1],40),
                                   ZD(CodArquivoRemessa,8), //Sequencia do Movimento
                                   RemoveBarras2(DateToStr(Date)), //Data da geração do arquivo
                                   ZD('0',8), //Data da Geração do Crédito em conta
                                   Spc(33))); //Brancos
    Inc(_iNumRegLote);
  end;
end;

procedure TCnabCEF.TrailerLoteCobr;
begin
  with IntBancoManager do
  begin
    inc(_iNumRegLote);
    WriteLn(ArquivoRemessa,Concat('104', //Código do Banco na
                                  Zd(IntToStr(_iNumLote),4), //Número do lote de serviço
                                  '5', //Indicação do Trailer de lote
                                  Spc(9), //Brancos
                                  Zd(IntToStr(_iNumRegLote),6), //Número de registros do lote (inclusive header e trailler)
                                  Zd('0',23), //Zeros, uso no retorno
                                  spc(23), //Brancos
                                  Zd('0',23), //Zeros, uso no retorno
                                  Spc(31), //Número do aviso do lançamento
                                  Spc(117))); //Brancos
  end;
end;

Procedure TCnabCEF.DetalheP;
var sCodDesconto, sDataDesconto, sValorDesconto : String;
Begin
 With IntBancoManager Do
 Begin
   if CdsTexto.FieldByName('VALORDESCONTO').AsFloat = 0 then
   begin
     sCodDesconto   := '0';
     sDataDesconto  := ZD('0',8);
     sValorDesconto := ZD('0',15);
   end
   else
   begin
     sCodDesconto   := '1';
     sDataDesconto  := RemoveBarras2(CdsTexto.FieldByName('DATALIMITE').AsString);
     sValorDesconto := ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15);
   end;

   WriteLn(ArquivoRemessa,Concat('104', //Código do Banco
                                 Zd(IntToStr(_iNumLote),4), //Número do lote de serviço
                                 '3', //Indicação do Trailer de lote
                                 Zd(IntToStr(_iNumSeq),5), //Número de registro dos lotes
                                 'P', //Código do segmento
                                 spc(1), //Brancos
                                 '01', //Código do movimento - 01 = Entrada de Titulos
                                 ZD(Copy(CdsTexto.FieldByName('NUMAGENCIA').AsString,1,6),6), //Agência//Agencia Cedente
                                 ZD(CdsTexto.FieldByName('NUMCONTA').AsString,12),//Conta Cedente
                                 '0', //DV da CONTA
                                 spc(1),
                                 spc(9), //Brancos
                                 ZD(FloatToStr(_NossoNumero),11),//Nosso Número zerado será informado pelo Banco
                                 fCarteira, //Código da carteira
                                 fFormaCadTit, //Forma de cadastramento do título no banco
                                 fTipodeDocumento, //Tipo de documento
                                 fIdentEmissao, //Identifica emissão do bloqueto
                                 fIdentDistrib, //Identifica distribuição do bloqueto
                                 AE(CdsTexto.FieldByName('NoDocumento').AsString,11), //ident titulo empresa
                                 spc(4), //Brancos
                                 RemoveBarras2(CdsTexto.FieldByName('DATAPROGRAMADA').AsString), //data venciento
                                 ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15), //Valor
                                 '00000',//Agência encerregada da cobrança
                                 spc(1), //Dígito da Agência encarregada da cobrança
                                 fEspecieTitulo, //Espécie do título
                                 fAceite, //Aceite/não aceiet
                                 RemoveBarras2(CdsTexto.FieldByName('DATAEMISSAO').AsString), //data de emissão
                                 fCodJuros, //Código do juros de mora
                                 RemoveBarras2(CdsTexto.FieldByName('DATAPROGRAMADA').AsString), //data p/JUROS
                                 ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15), //valor do Juros/Dia
                                 sCodDesconto, //Código do desconto - Variável local
                                 sDataDesconto, //Data limite desconto
                                 sValorDesconto, //valor do desconto
                                 ZD('0',15), //valor do IOF
                                 ZD('0',15), //valor abatimento
                                 AE(CdsTexto.FieldByName('FLGGRUPO').AsString + IdentificaOrigem + CdsTexto.FieldByName('CodDocumento').AsString,25), // Identificação do Titulo no sistema do Cliente(CAMPO LIVRE)
                                 fCodProtesto, //Código para protesto
                                 fNumDiasProtesto, //Número de dias para protesto
                                 fCodDevolve, //Código para devolução
                                 fNumDiasBaixa, //Número de dias para baixa
                                 '09', //Código da moeda
                                 spc(10), //Uso FEBRABAN
                                 spc(1)));
   Inc(_iNumSeq);
   Inc(_iNumRegLote);
 End;
End;

procedure TCnabCEF.DetalheQ;
begin
 with IntBancoManager do
 begin
   WriteLn(ArquivoRemessa,Concat('104', //Código do Banco
                                 Zd(IntToStr(_iNumLote),4), //Número do lote de serviço
                                 '3', //Indicação do Trailer de lote
                                 Zd(IntToStr(_iNumSeq),5), //Número de registro dos lotes
                                 'Q', //Código do segmento
                                 spc(1), //Brancos
                                 '01', //Código do movimento  - Entrada de Titulos
                                 _TipoInsc, //Cod Inscrição do Sacado
                                 ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //numero de inscricao
                                 AE(CdsTexto.FieldByName('NOME').AsString,40),
                                 AE(Copy(CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                         CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                         CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40),
                                 AE(CdsTexto.FieldByName('BAIRRO').AsString,15),
                                 ZE(CdsTexto.FieldByName('CEP').AsString,8),
                                 AE(CdsTexto.FieldByName('CIDADE').AsString,15),
                                 AE(CdsTexto.FieldByName('CODESTADO').AsString,2),
                                 '0',//Tipo de inscrção avalista
                                 Zd('0',15),//Num Documento
                                 Spc(40),//Nome do sacador avalista
                                 spc(3), //Febraban/Cnab
                                 Spc(20),//Febraban/Cnab
                                 Spc(8))); //Febraban/Cnab

   Inc(_iNumSeq);
   Inc(_iNumRegLote);
 end;
end;

end.
