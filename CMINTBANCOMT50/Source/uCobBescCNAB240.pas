{---------------------------------------------------------------------------------------------------
Autor    : Antonio Marcos Fernandes de Souza (amf)
Data     : 08.06.2007
Descrição: Implementação do arquivo de cobrança eletrônica BESC (Banco Estadual de Santa Catarina)
---------------------------------------------------------------------------------------------------}

unit uCobBescCNAB240;

interface

Uses Forms, Classes, SysUtils, Dialogs, Graphics, Controls,
     Windows;

Type
   TMensagensCnab = array [0..8] of string;

Type
   TCobBESCCnab240 = Class
   private
    sNumEmpresaBanco : string;
    iSeqArquivo : integer;

    //Arquivo de remessa a ser gerado
    ArquivoRemessa :TextFile;

    //Contador sequencial de registros do arquivo
    _iNumSeq: Integer;

    //Contador de registros de detalhe
    iNumRegDet: integer;

    //Tipo de inscrição da empresa na ficha de compensação
    _TipoInsc:String;

    //Código de inscrição da empresa
    _CodInscEmpresa :String;

    //Nosso número do documento gerado
    _NossoNumero :Real;

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

    fMensagensCnab :TMensagensCnab;
    fDataCredito,       fCarteira,        fCodDevolve,        fTipoImpressao,     fNumLInhaImpressao,
    fFormaCadTit,       fTipodeDocumento, fIdentEmissao,      fIdentDistrib,      fEspecieTitulo,
    fAceite,            fCodJuros,        fCodDesconto,       fCodProtesto,       fNumDiasProtesto,
    fNumDiasBaixa,      fNumContrato,     fCodDesconto2,      fDataDesconto2,     fValorDesconto2,
    fCodDesconto3,      fDataDesconto3,   fValorDesconto3,    fCodMulta,          fDataMulta,
    fMensagemImpressao, fValorMulta,      fTipocaracter,      fNumConvenio,       fCarteiraConvenio,
    fVariacaoConvenio, fTipoCobranca :String;


    procedure GeraMensagens(var sAux : TStringList; TamanhoMensagem : Integer);

    //Buscao o número do convênio da empresa no banco
    Function  GetNumConvenio :String;
    //Gera o header principal do arquivo
    procedure HeaderArquivo; //ok

    //gera detalhe da remessa (envio)
    procedure DetalheDoArquivo;

    //gera o trailer principal do arquivo
    procedure TrailerArquivo; //ok
    
   public

    function GetNomeArq: string;

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
  CobBESCCnab240: TCobBESCCnab240;


implementation

Uses fParamBescCnab240, uString, uIntBancoManager, uCMDialogs, uContaBancariaMT, usistema;

Function TCobBESCCnab240.GetNumConvenio: String;
Begin
   Result := ZD(fNumConvenio, 15);
End;

procedure TcobBescCnab240.MontaArquivo;
begin
  With IntBancoManager Do
  Begin

//    Application.CreateForm(TfrmParamBescCnab240MT, frmParamBESCCnab240MT);
//    If (frmParamBescCnab240MT.ShowModal = MrOk) Then
//    Begin
//      frmParamBESCCnab240MT.Free;

      _iNumSeq     := 1; // Usado nos detalhes
      iNumRegDet   := 0; // Incrementado em todos os segmentos do lote inclusive header e trailler
      _TipoInsc    := '2';
      _NossoNumero := StrToFloat(NossoNumero);

      Try
         If CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
            _CodInscEmpresa := '2'
         Else
            _CodInscEmpresa := '1';

         AssignFile(ArquivoRemessa,sNomeArquivo);
         ReWrite(ArquivoRemessa);

{         with IntBancoManager.DtmIntBanco.SQLParamIntBanco do
         begin
           Prepare;
           ParamByName('RECPAG').asstring := 'R';
           ParamByName('IDMODELOSCNAB').AsInteger := 55;
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
}

         HeaderArquivo;

         CdsTexto.First;
         While Not CdsTexto.Eof Do
         Begin
           If CdsTexto.FieldByName('TIPO').AsString = 'F' Then
               _TipoInsc := '1'
           Else
             _TipoInsc := '2';
           _NossoNumero := _NossoNumero + 1;

           DetalheDoArquivo;

           sMensagens := TStringList.Create;
           GeraMensagens(sMensagens, 40);

           sMensagens.Free;

           if not IntBancoManager.AtualizaDoc('1','S',FloatToStr(_NossoNumero),DateToStr(Date),CodArquivoRemessa,CdsTexto.FieldByName('CodDocumento').AsString,CdsTexto.FieldByName('FLGGRUPO').AsString) then
              raise Exception.Create(IntBancoManager.MessageInfo);

           CdsTexto.Next;
        End;

          TrailerArquivo;

          UltCodArquivoGerado := intToStr(iSeqArquivo);

         if not IntBancoManager.ExecSQL(' UPDATE SEQREMESSA SET CONTROLEREMESSA = '+ intToStr(iSeqArquivo)+
                                  ' WHERE NUMEMPRESABANCO = '+ quotedStr(sNumEmpresaBanco)) then
           raise Exception.Create(IntBancoManager.MessageInfo);

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
//    End
//    Else
//    Begin
//      frmParamBESCCnab240MT.Free;
//      Raise Exception.Create('O arquivo de remessa para o Banco do Brasil não foi gerado');
//    End;
  End;

End;

procedure TcobBescCnab240.HeaderArquivo;
var sConvenio : String;
begin
 {Nº  Campo    Nome  do  Campo    Formato      Início     Fim     Observações
------------------------------------------------------------------------------------------------------
   01       Código  Registro       9(001)       001       001     =  0
   02       Código  Arquivo        9(001)       002       002     =  1
   03       Literal   Arquivo      X(007)       003       009     =  Remessa
   04       Literal    Serviço     X(015)       010       024     =  Cobrança  Direta
   05       Código  Convênio       9(005)       025       029
   06       Agência  Cedente       9(003)       030       032
   07       Conta do Cedente       9(007)       033       039     Nota  A
   08       Nome  Empresa          X(040)       040       079
   09       Código  Carteira       9(002)       080       081     Opções: 06 ou 25
   10       Código  Banco          9(003)       082       084     =  027
   11       Nome  do  Banco        X(015)       085       099     =  BESC  S/A
   12       Data  Remessa          9(006)       100       105     =  DDMMAA
   13       Quantidade  Lâminas    9(008)       106       113     Nota  B
   14       Tipo  de  Bloquete     9(002)       114       115     Nota  C
   15       Arquivos  p/ Teste     9(001)       116       116     Nota  D
   16       Emite protocolo        X(001)       117       117     Protocolo 0=NAO
   17       Filler                 X(273)       118       390
   18       Nº Seq. Arquivo        9(004)       391       394     Nota E
   19       Nº Seq. Registro       9(006)       395       400     = 0000001
}

 with IntBancoManager do
 begin
   sConvenio := spc(5);
   sConvenio := GetNumConvenio;

   WriteLn(ArquivoRemessa,Concat('0',
                                 '1',
                                 'Remessa',
                                 'Cobranca Direta',
                                 ZD(sConvenio, 5), //Numero do Convênio
                                 ZD(Copy(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,1,3),3), // Agencia Cedente
                                 ZD(GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,7,True,True), 7),//Número CC + DV
                                 AE(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,40),//Nome do Cedente
                                 '25', // carteira do cedente
                                 '027', //Código do Banco
                                 AE('BESC S/A',15),//Nome do Banco
                                 formatDateTime('DDMMYY', Date), //data da remessa
                                 ZD('1', 8),  // quantidade de lâminas,
                                 '10', //tipo de bloquete,
                                 '1', //arquivo p/ teste,
                                 '1', //emite protocolo (default)
                                 spc(273),
                                 ZD(CodArquivoRemessa,4), //Sequencia do Movimento
                                 '000001'
                                 ));
 end;
end;

procedure TcobBescCnab240.TrailerArquivo;
begin
  with IntBancoManager do
  begin
    WriteLn(ArquivoRemessa,Concat('9',                         // código do registro - fixo = 9
                                  spc(387),                    // filler
                                  ZD(IntToStr(iNumRegDet), 6), // total de registros de detalhe
                                  Zd(IntToStr(_iNumSeq ), 6)  //Total de registros
                                  )
            );
  end;
end;

function TcobBescCnab240.GetNomeArq: string;
begin
  IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Sql.Text :=
  ' SELECT  '+
  '   nvl(S.CONTROLEREMESSA, 0) AS CONTROLEREMESSA, P.NUMEMPRESABANCO '+
  ' FROM PORTADORFORMA P, SEQREMESSA S WHERE CODPORTFORMA = '+ IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').AsString +
  ' AND IDPESSOA = ' + inttostr(sistema.idempresa) +
  ' AND P.NUMEMPRESABANCO = S.NUMEMPRESABANCO ';
  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Open;
  sNumEmpresaBanco := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('NUMEMPRESABANCO').asString;
  iSeqArquivo := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('CONTROLEREMESSA').asInteger + 1;

  result := 'BESCCOB' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iSeqArquivo), 2) + '.DAT';
end;

procedure TcobBescCnab240.GeraMensagens(var sAux : TStringList; TamanhoMensagem : Integer);
var x : Integer;
begin
  // primeiro verificar se existe na paramintbanco
  IntBancoManager.MontaSqlTestaMensagem(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString, false);
  if (trim(VMENSAGEM3) <> '') then
    sAux.ADD(AE(VMENSAGEM3, TamanhoMensagem));
  if (trim(VMENSAGEM4) <> '') then
    sAux.ADD(AE(VMENSAGEM4, TamanhoMensagem));

  for x := 0 to 9 do
    sAux.Append(AE(IntBancoManager.CdsMensagens.Fields[x].AsString, TamanhoMensagem));

end;

procedure TCobBESCCnab240.DetalheDoArquivo;
begin
{Nº Campo     Nome do  Campo     Formato     Início      Fim    Observações
--------------------------------------------------------------------------------------------------------
01       Código  Registro      9(001)        001         001     = 1
02       Filler                9(005)        002         006
03       Nosso  Número         9(013)        007         019     identifica  o sacado
04       Parcela               9(003)        020         022
05       Plano                 9(003)        023         025     = Total  de  Parcelas
06       Código  Moeda         9(001)        026         026     Nota  F
07       Valor do Documento    9(11)V99      027         039
08       Número do Docto       9(013 )       040         052     Nº  documento
09       Data  Vencimento      9(006)        053         058     = DDMMAA
10       Instrução 1           X(040)        059         098
11       Instrução 2           X(040)        099         138
12       Instrução 3           X(040)        139         178
13       Instrução 4           X(040)        179         218
14       Data Emissão Tít.     9(006)        219         224     =  DDMMAA       *
15       CPF/CNPJ              X(017)        225         241     do  sacado      *
16       Espécie  do Tít.      X(005)        242         246                     *
17       Aceite                X(001)        247         247                     *
18       Nome  do  Sacado      X(040)        248         287
19       Endereço do Sacado    X(040)        288         327
20       Bairro  do  Sacado    X(020)        328         347
21       CEP do Sacado         X(008)        348         355
22       Cidade  do Sacado     X(030)        356         385
23       Estado  do Sacado     X(002)        386         387
24       Filler                X(007)        388         394
25       Nº Seq. Registro      9(006)        395         400
}

  WriteLn(ArquivoRemessa,
     Concat('1',                              // código do registro
            '00000',                          // filler
            ZD(FloatToStr(_NossoNumero), 13), // nosso número (???)
            ZD('1', 3),                       // parcela,             ** não tenho certeza sobre esta informação
            ZD('1', 3),                       // total de parcelas    ** não tenho certeza sobre esta informação
            '9',                              // código da moeda
            ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), //Valor
            AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,13), //número do documento
            FormatDateTime('DDMMYY', IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsDateTime), //data de vencimento do documento
            spc(40),                         //Instrução 01
            spc(40),                         //Instrução 02
            spc(40),                         //Instrução 03
            spc(40),                         //Instrução 04
            FormatDateTime('DDMMYY', IntBancoManager.CdsTexto.FieldByName('DATAEMISSAO').AsDateTime), //data de emissão do título
            //amf 11.06.2007
            ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,17), //numero de inscricao
            spc(5),                          // espécie do título
            spc(1),                          // aceite
            AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40),
            AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                    IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                    IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40),
            AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString, 20),
            ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString, 8),
            AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString, 30),
            AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString, 2),
            spc(7),                        //filler
            ZD(IntToStr(_iNumSeq), 6)      //SEQ REGISTRO
            ));
  Inc(_iNumSeq);
end;

end.
