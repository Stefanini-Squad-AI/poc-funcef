{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCnabBB: Implementação do arquivo de remessa BB     }
{   BANCO DO BRASIL REMESSA                             }
{   IDMODELOSCNAB = 7/R                                 }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                20/02/2001 - Fábio Barros da Silva     }
{                02/03/2002 - Fábio Barros da Silva     }
{                Correções em algumas posições do       }
{                Header de Lote e retirada da geração   }
{                dos segmentos R & S.                   }
{ Andre tavares : 08/12/2004 - pendencia 18213 - implementação dos seguimentos R e S e preenchimento da variável nosso número conforme parâmetro }
{*******************************************************}

unit uCnabBBMT;

interface

Uses Forms, Classes, SysUtils, Dialogs, Graphics, Controls, Windows;

Type
   TMensagensCnab = array [0..8] of string;

Type
   TCnabBB = Class
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

     // inicio - andre tavares - 18213 - 06/12/2004
     VMENSAGEM3:STRING[40];
     VMENSAGEM4:STRING[40];
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
     Mensagens : String;
     sMensagens : TStringList;
     // fim - andre tavares - 18213 - 06/12/2004

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
    procedure DetalheR;
    procedure DetalheS;
    procedure GeraMensagens(var sAux : TStringList; TamanhoMensagem : Integer);
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
  CnabBB: TCnabBB;


implementation

Uses fParamCnabBbMT, uString, uIntBancoManager, uCMFileUtils, uCMDialogs;

Function TCnabBB.GetNumConvenio:String;
Begin
//   Result := ZD(fNumConvenio + '0014' +  fCarteiraConvenio + fVariacaoConvenio + Spc(2),20);
   Result := zd(fNumConvenio, 9) + '0014' +  fCarteiraConvenio + fVariacaoConvenio + Spc(2); // andre tavares - pendencia 18213
End;

procedure TCnabBB.MontaArquivo;
begin
  Application.CreateForm(TfrmParamCnabBbMT, frmParamCnabBbMT);
  If (frmParamCnabBbMT.ShowModal = MrOk) Then
  Begin
     frmParamCnabBbMT.Free;

     _iNumSeq     := 1; // Usado nos detalhes
     _iNumLote    := 0; // Incrementado apenas no Header
     _iNumRegLote := 0; // Incrementado em todos os segmentos do lote inclusive header e trailler
     _TipoInsc    := '2';
     _NossoNumero := StrToFloat(IntBancoManager.NossoNumero);

     Try

        If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
           _CodInscEmpresa := '2'
        Else
           _CodInscEmpresa := '1';

        AssignFile(ArquivoRemessa, IntBancoManager.sNomeArquivo);
        ReWrite(ArquivoRemessa);

         // inicio - andre tavares - 18213 - 06/12/2004
         with IntBancoManager.DtmIntBanco.SQLParamIntBanco do
         begin
           Prepare;
           ParamByName('RECPAG').asstring := 'R';
           ParamByName('IDMODELOSCNAB').AsInteger := 7;
           ParamByName('CODPORTFORMA').AsInteger := IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').AsInteger;
           Open;
         end;

         VMENSAGEM3            := IntBancoManager.BuscaParamIntBanco('MENSAGEM3','S');
         VMENSAGEM4            := IntBancoManager.BuscaParamIntBanco('MENSAGEM4','S');
         VCODDESCONTO          := IntBancoManager.BuscaParamIntBanco('CODDESCONTO','N');
         VCODMULTA             := IntBancoManager.BuscaParamIntBanco('CODMULTA','N');
         VDIASDESCONTO         := IntBancoManager.BuscaParamIntBanco('DIASDESCONTO','N');
         VDIASMULTA            := IntBancoManager.buscaParamIntBanco('DIASMULTA','N');
         VDIASBAIXADEVOLUCAO   := IntBancoManager.buscaParamIntBanco('DIASBAIXADEVOLUCAO','N');
         VVALORDESCONTO        := IntBancoManager.buscaParamIntBanco('VALORDESCONTO','N');
         VPERCENTUALIOF        := IntBancoManager.buscaParamIntBanco('PERCENTUALIOF','N');
         VPERCENTUALABATIMENTO := IntBancoManager.buscaParamIntBanco('PERCENTUALABATIMENTO','N');
         VVALORMULTA           := IntBancoManager.buscaParamIntBanco('VALORMULTA','N');
         VBAIXADEVOLUCAO       := IntBancoManager.buscaParamIntBanco('BAIXADEVOLUCAO','N');
         VPROTESTO             := IntBancoManager.buscaParamIntBanco('PROTESTO','N');
         VDIASJUROS            := IntBancoManager.buscaParamIntBanco('DIASJUROS','N') ;
         VCOBRANCA             := IntBancoManager.buscaParamIntBanco('COBRANCA','N');
         VCADASTRAMENTO        := IntBancoManager.buscaParamIntBanco('CADASTRAMENTO','N');
         VDOCUMENTO            := IntBancoManager.buscaParamIntBanco('DOCUMENTO','N');
         VEMISSAOBLOQUETO      := IntBancoManager.buscaParamIntBanco('EMISSAOBLOQUETO','N');
         VDISTRIBUICAOBLOQUETO := IntBancoManager.buscaParamIntBanco('DISTRIBUICAOBLOQUETO','N');
         VESPECIETITULO        := IntBancoManager.buscaParamIntBanco('ESPECIETITULO','N');
         VACEITE               := IntBancoManager.buscaParamIntBanco('ACEITE','S');
         VCODJUROS             := IntBancoManager.buscaParamIntBanco('CODJUROS','N');
         VINFORMACAO           := IntBancoManager.buscaParamIntBanco('INFORMACAO','S');

         IF TRIM(VVALORDESCONTO)='' THEN  VVALORDESCONTO:='0';
         IF TRIM(VDIASDESCONTO)='' THEN  VDIASDESCONTO:='0';
         IF TRIM(VDIASMULTA)='' THEN  VDIASMULTA:='0';
         IF TRIM(VDIASBAIXADEVOLUCAO)='' THEN  VDIASBAIXADEVOLUCAO:='0';
         IF TRIM(VPERCENTUALIOF)='' THEN  VPERCENTUALIOF:='0';
         IF TRIM(VPERCENTUALABATIMENTO)='' THEN  VPERCENTUALABATIMENTO:='0';
         IF TRIM(VVALORMULTA)='' THEN  VVALORMULTA:='0';

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
         END;
         // fim - andre tavares - 18213 - 06/12/2004

        HeaderArquivo;
        HeaderLoteCobr;

        IntBancoManager.CdsTexto.First;
        While Not IntBancoManager.CdsTexto.Eof Do
        Begin
           If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
             _TipoInsc := '1'
           Else
             _TipoInsc := '2';

           if _NossoNumero <> 0 then
             _NossoNumero := _NossoNumero + 1;

           DetalheP;
           DetalheQ;

           // inicio - andre tavares - 18213 - 06/12/2004
           sMensagens := TStringList.Create;
           GeraMensagens(sMensagens, 40);
           DetalheR;
           DetalheS;
           sMensagens.Free;
           // fim - andre tavares - 18213 - 06/12/2004

           if not IntBancoManager.AtualizaDoc('1', 'S', FloatToStr(_NossoNumero),
                  DateToStr(Date),
                  IntBancoManager.CodArquivoRemessa,
                  IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,
                  IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
             raise Exception.Create(IntBancoManager.MessageInfo);

           IntBancoManager.CdsTexto.Next;
        End;

        TrailerLoteCobr;
        TrailerArquivo;

        CloseFile(ArquivoRemessa);

        IntBancoManager.UltNossoNumero      := FloatToStr(_NossoNumero);
        IntBancoManager.UltCodArquivoGerado := IntBancoManager.CodArquivoRemessa;
        IntBancoManager.MostraArquivo;
      Except
        On E:Exception Do
        Begin
          MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + e.Message,'Atenção');
          CloseFile(ArquivoRemessa);
          Abort;
        End;
      End;
  End
  Else
  Begin
    frmParamCnabBbMT.Free;
    Raise Exception.Create('O arquivo de remessa para o Banco do Brasil não foi gerado');
  End;
End;

procedure TCnabBB.HeaderArquivo;
var sConvenio : String;
begin
   sConvenio := spc(20);
   sConvenio := GetNumConvenio;
   WriteLn(ArquivoRemessa,Concat('001', //Código do Banco
                                 '0000', //Lote de serviço
                                 '0', //Indicação do Header de arquivo
                                 Spc(9), //Brancos
                                 _CodInscEmpresa, //Tipo de inscrição da empresa
                                 ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14),//numero de inscricao
                                 sConvenio,
                                 ZD(Copy(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,1,6),6), // Agencia Cedente
                                 ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,13),//Conta Cedente
                                 ' ',
                                 AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30),//Nome do Cedente
                                 AE('BANCO DO BRASIL',30),//Nome do Banco
                                 Spc(10), //Branco
                                 '1', //Código da remessa
                                 RemoveBarras2(DateToStr(Date)), //Data da geração do arquivo
                                 RemovePontos(TimeToStr(Time)), //Hota da geração do arquivo
                                 ZD(IntBancoManager.CodArquivoRemessa,6), //Sequencia do Movimento
                                 '030', //Versão do layoute do arquivo
                                 '00000',//Densidade da gravação do arquivo
                                 Spc(20), //Brancos
                                 Spc(20), //Uso da Empresa
                                 Spc(11), //Brancos
                                 'CSP', //Identificação da cobrança
                                 '000', //Numerico
                                 '  ', //Tipo de Serviço
                                 Spc(10))); //Código das ocorrências
end;

procedure TCnabBB.TrailerArquivo;
begin
    WriteLn(ArquivoRemessa,Concat('001', //Código do Banco na
                                  '9999', //Lote de serviço
                                  '9', //Indicação do Header de arquivo
                                  Spc(9), //Brancos
                                  Zd(IntToStr(_iNumLote),6), //Quantidade de Lotes
                                  Zd(IntToStr( 4 + _iNumSeq ),6), //Total de registros
                                  Zd('0',6), //Qtde de contas para conciliação
                                  Spc(205))); //Brancos
end;

procedure TCnabBB.HeaderLoteCobr;
Var
   sConvenio : String;
begin
    Inc(_iNumLote); // Só incrementa aqui...
    sConvenio := spc(20);
    sConvenio := GetNumConvenio;
    WriteLn(ArquivoRemessa,Concat('001', //Código do Banco
                                   zd(IntToStr(_iNumLote),4), //Número do lote de serviço
                                   '1', //Indicação do Trailer de lote
                                   'R', //Tipo de Operação3u/
                                   '01', //Tipo de Serviço
                                   '00', //Forma de Lançamento
                                   '020', //Nº da versão do layout
                                   spc(1), //Brancos
                                   _CodInscEmpresa, //Tipo de inscrição da empresa
                                   ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,15),//numero de inscricao
                                   sConvenio,
                                   ZD(Copy(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,1,6),6), //Agência//Agencia Cedente
                                   ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,13),//Conta Cedente
                                   spc(1),
                                   AE(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30),//Nome do Cedente
                                   Ae(fMensagensCnab[0],40),
                                   Ae(fMensagensCnab[1],40),
                                   ZD(IntBancoManager.CodArquivoRemessa,8), //Sequencia do Movimento
                                   RemoveBarras2(DateToStr(Date)), //Data da geração do arquivo
                                   ZD('0',8), //Data da Geração do Crédito em conta
                                   Spc(33))); //Brnacos
    Inc(_iNumRegLote);
end;

procedure TCnabBB.TrailerLoteCobr;
begin

//    inc(_iNumRegLote); andre tavares - pendência 18213
    WriteLn(ArquivoRemessa,Concat('001', //Código do Banco na
                                  Zd(IntToStr(_iNumLote),4), //Número do lote de serviço
                                  '5', //Indicação do Trailer de lote
                                  Spc(9), //Brancos
                                  Zd(IntToStr(_iNumRegLote),6), //Número de registros do lote (inclusive header e trailler)
                                  Zd('0',92), //Zeros, uso no retorno
                                  Spc(8), //Número do aviso do lançamento
                                  Spc(117))); //Brancos

end;

Procedure TCnabBB.DetalheP;
var sCodDesconto, sDataDesconto, sValorDesconto : String;
Begin
   if IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat = 0 then
   begin
     sCodDesconto   := '0';
     sDataDesconto  := ZD('0',8);
     sValorDesconto := ZD('0',15);
   end
   else
   begin
     sCodDesconto   := '1';
     sDataDesconto  := RemoveBarras2(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString);
     sValorDesconto := ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15);
   end;

   fNumDiasProtesto := IntBancoManager.BuscaParamIntBanco('NUMDIASPROTESTO','N'); // andre tavares - pendencia 18213
   WriteLn(ArquivoRemessa,Concat('001', //Código do Banco
                                 Zd(IntToStr(_iNumLote),4), //Número do lote de serviço
                                 '3', //Indicação do Trailer de lote
                                 Zd(IntToStr(_iNumSeq),5), //Número de registro dos lotes
                                 'P', //Código do segmento
                                 spc(1), //Brancos
                                 '01', //Código do movimento - 01 = Entrada de Titulos
                                 ZD(Copy(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString,1,6),6), //Agência//Agencia Cedente
                                 ZD(IntBancoManager.CdsTexto.FieldByName('NUMCONTA').AsString,13),//Conta Cedente
                                 spc(1),
                                 ZD(FloatToStr(_NossoNumero),20),//NossoNúmero + DV // andre tavares - pendencia 18213 - 08/12/2004
//                                 ZD('0',20),//NossoNúmero zerado será informado pelo Banco
                                 fCarteira, //Código da carteira
                                 fFormaCadTit, //Forma de cadastramento do título no banco
                                 fTipodeDocumento, //Tipo de documento
                                 fIdentEmissao, //Identifica emissão do bloqueto
                                 fIdentDistrib, //Identifica distribuição do bloqueto
                                 AE(IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,15), //ident titulo empresa
                                 RemoveBarras2(IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString), //data venciento
                                 ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),15), //Valor
                                 '00000',//Agência encerregada da cobrança
                                 spc(1), //Dígito da Agência encarregada da cobrança
                                 fEspecieTitulo, //Espécie do título
                                 fAceite, //Aceite/não aceiet
                                 RemoveBarras2(IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsString), //data de emissão
                                 fCodJuros, //Código do juros de mora
                                 RemoveBarras2(IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString), //data p/JUROS
                                 ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15), //valor do Juros/Dia
                                 sCodDesconto, //Código do desconto - Variável local
                                 sDataDesconto, //Data limite desconto
                                 sValorDesconto, //valor do desconto
                                 ZD('0',15), //valor do IOF
                                 ZD('0',15), //valor abatimento
                                 AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), // Identificação do Titulo no sistema do Cliente(CAMPO LIVRE)
                                 fCodProtesto, //Código para protesto
                                 zd(fNumDiasProtesto, 2), //Número de dias para protesto
                                 fCodDevolve, //Código para devolução
                                 fNumDiasBaixa, //Número de dias para baixa
                                 '09', //Código da moeda
                                 ZD('0',10), //Número do contrato
                                 spc(1)));

   Inc(_iNumSeq);
   Inc(_iNumRegLote);
End;

procedure TCnabBB.DetalheQ;
begin
  WriteLn(ArquivoRemessa,Concat('001', //Código do Banco
                                 Zd(IntToStr(_iNumLote),4), //Número do lote de serviço
                                 '3', //Indicação do Trailer de lote
                                 Zd(IntToStr(_iNumSeq),5), //Número de registro dos lotes
                                 'Q', //Código do segmento
                                 spc(1), //Brancos
                                 '01', //Código do movimento  - Entrada de Titulos
                                 _TipoInsc, //Cod Inscrição do Sacado
                                 ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //numero de inscricao
                                 AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40),
                                 AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                         IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                         IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40),
                                 AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,15),
                                 ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                                 AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                                 AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),
                                 '0',//Tipo de inscrção avalista
                                 Zd('0',15),//Num Documento
                                 Spc(40),//Nome do sacador avalista
                                 '000', //Código do banco correspondente
                                 Spc(20),//Número do banco correspondente
                                 Spc(8)));

  Inc(_iNumSeq);
  Inc(_iNumRegLote);
end;

// início - André Tavares - pendência 18213 - 06/12/2004
procedure TCnabBB.DetalheR;
var x  : integer;
begin

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
  WriteLn(ArquivoRemessa,
     Concat('001', //Código do banco
            ZD(INTTOSTR(_iNumLote),4), //LOTE DE SERVIÇO
            '3',// REGISTRO DETALHE
            ZD(INTTOSTR(_iNumSeq),5),//SEQ REGISTRO
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
  Inc(_iNumSeq);
  Inc(_iNumRegLote);
end;

procedure TCnabBB.DetalheS;
var x  : integer;
begin

  mensagens  := '';
  for x := 2 to 6 do
  begin
    try
      Mensagens := Mensagens + sMensagens.Strings[x]
    except
      Mensagens := Mensagens + spc(40)
    end;
  end;

  // SEGMENTO S
  WriteLn(ArquivoRemessa,
     Concat('001', //Código do banco
            ZD(INTTOSTR(_iNumLote),4), //LOTE DE SERVIÇO
            '3',// REGISTRO DETALHE
            ZD(INTTOSTR(_iNumSeq),5),//SEQ REGISTRO
            'S',//segmento
            Spc(1),//cnab
            '01', // movimento
            '3',//ID IMPRESSAO
            Mensagens,
            Spc(22)
            ));

  Inc(_iNumSeq);
  Inc(_iNumRegLote);
end;


procedure TCnabBB.GeraMensagens(var sAux : TStringList; TamanhoMensagem : Integer);
var x : Integer;
begin
  // primeiro verificar se existe na paramintbanco
  if IntBancoManager.MontaSqlTestaMensagem(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString, false) Then
  begin
    if (trim(VMENSAGEM3) <> '') then
      sAux.ADD(AE(VMENSAGEM3, TamanhoMensagem));
    if (trim(VMENSAGEM4) <> '') then
      sAux.ADD(AE(VMENSAGEM4, TamanhoMensagem));

    for x := 0 to 9 do
    begin
      sAux.Append(AE(IntBancoManager.CdsMensagens.Fields[x].AsString, TamanhoMensagem));
    end;


  end;
end;


// fim - André Tavares - pendência 18213 - 06/12/2004

end.
