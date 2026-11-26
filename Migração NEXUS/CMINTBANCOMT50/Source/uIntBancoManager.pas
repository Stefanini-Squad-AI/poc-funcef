{*******************************************************}
{                                                       }
{ CM SoluÁıes Inform·tica  - CMIntBanco50MT             }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Classe com mÈtodos para atualizaÁ„o dos regostros   }
{   enviados nos arquivos de intibanco e persistÍncia   }
{   de atributos dos mesmos entre as units e forms de   }
{   interaÁ„o com o usu·rio                             }
{                                                       }
{ Antonio Marcos 10.09.2007 p- 25756                    }
{ Analista Respons·vel: Fabio Barros / Gustavo Viegas   }
{ Atualizado Em: 30/12/2002                             }
{ AndrÈ Tavares 19/09/2003 - pendÍncia 15058            }
{ AndrÈ Tavares 29/09/2003 - pendÍncia 15099            }
{*******************************************************}
//***************************************************************************************
//Rotina             : Impersonate 
//N. SIG..........   : 63651
//Data da AlteraÁ„o: : 25/102019
//AlteraÁ„o Form:    : uIntBancoManager
//Respons·vel:       : C·ssio Florencio Rovaroto
//DescriÁ„o.......   : Inclus„o de procedimento para leitura e gravaÁ„o de arquivos banc·rios SIACC
//***************************************************************************************

unit uIntBancoManager;

interface

uses Dialogs, SysUtils, graphics, forms, wintypes, db, WinProcs, Classes,
     uSistema, Controls, uCMFileUtils, uCMClientDataSet, uCmControlObject,
     DIntBancoMT, uDbParamIntBanco, uDbIntbancoxportform, DDadosBancariosMT,
     uctrlParamIntegra, DbClient, Windows, UCripto;

//C·ssio Rovaroto - SIG n∫ 63651 - InÌcio
// Chaves de encriptaÁ„o
Const StKey = 7848567;
Const MtKey = 1741378;
Const AdKey = 6574985;

const fUser = '±'#5'≠ç'#$D'TZ!,|'#$1F'jº'#$15'rÙVÅ‡9'; //Login de acesso ao servidor, criptografado.
const fPw   = '„që∫%⁄ØÙ'; //Senha do login de acesso ao servidor, criptografado.
//C·ssio Rovaroto - SIG n∫ 63651 - Fim

Type
   TIntBancoManager = Class(TCmControlObject)
   protected
    Procedure DoChangeDataBase; override;
   private
    _DbParamIntBanco: TDbParamIntBanco;
    _DbIntbancoxportform : TDbIntbancoxportform;

    FbAtualizadoc: Boolean;
    FbArquivoCriado: Boolean;
    FbExibeArquivoGerado: Boolean;
    FGeraNossoNumero: Boolean;
    FCodigoPortadorForma: LongInt;
    FSNomeArquivo: String;
    FNomeArquivoIntBanco: String;
    FDataPagamento: String;
    FNumeEmpresaBanco: String;
    FNossoNumero: String;
    FCodArquivoRemessa: String;
    FUltNossoNumero: String;
    FValorJuros: String;
    FsNossoNumero: String;
    FUltCodArquivoGerado: String;
    FDiasProtesto: String;
    FsCodOcorrencia: String;
    FNomeEmpresa: String;
    FNomeArquivo: String;
    FCdsTexto: TCMClientDataSet;
    FCdsMensagens: TCMClientDataSet;
    FCdsEmpresa: TCMClientDataSet;
    FArquivoTexto: TextFile;
    FArquivoLog: TextFile;
    FDtmIntBanco: TDtmIntBancoMT;
    FCdsAux: TCMClientDataSet;
    FIdentificaOrigem: String;
    FNaoGerarArquivo: Boolean;
    FMensagem1: String;
    FMensagem3: String;
    FMensagem2: String;
    FMensagem6: String;
    FMensagem7: String;
    FMensagem4: String;
    FMensagem8: String;
    FMensagem5: String;
    FDtmDadosBancarios: TDtmDadosBancariosMT;
    FiFloatExternoAlt: integer;
    FiFloatExterno: integer;
    FbUsaDataIntBanco: boolean;
    procedure SetbArquivoCriado(const Value: Boolean);
    procedure SetbAtualizadoc(const Value: Boolean);
    procedure SetbExibeArquivoGerado(const Value: Boolean);
    procedure SetCdsEmpresa(const Value: TCMClientDataSet);
    procedure SetCdsMensagens(const Value: TCMClientDataSet);
    procedure SetCdsTexto(const Value: TCMClientDataSet);
    procedure SetCodArquivoRemessa(const Value: String);
    procedure SetCodigoPortadorForma(const Value: LongInt);
    procedure SetDataPagamento(const Value: String);
    procedure SetDiasProtesto(const Value: String);
    procedure SetGeraNossoNumero(const Value: Boolean);
    procedure SetNomeArquivo(const Value: String);
    procedure SetNomeArquivoIntBanco(const Value: String);
    procedure SetNomeEmpresa(const Value: String);
    procedure SetNossoNumero(const Value: String);
    procedure SetNumeEmpresaBanco(const Value: String);
    procedure SetsCodOcorrencia(const Value: String);
    procedure SetSNomeArquivo(const Value: String);
    procedure SetsNossoNumero(const Value: String);
    procedure SetUltCodArquivoGerado(const Value: String);
    procedure SetUltNossoNumero(const Value: String);
    procedure SetValorJuros(const Value: String);
    procedure SetDtmIntBanco(const Value: TDtmIntBancoMT);
    procedure SetCdsAux(const Value: TCMClientDataSet);
    procedure SetIdentificaOrigem(const Value: String);
    procedure SetMensagem1(const Value: String);
    procedure SetMensagem2(const Value: String);
    procedure SetMensagem3(const Value: String);
    procedure SetNaoGerarArquivo(const Value: Boolean);
    procedure SetMensagem4(const Value: String);
    procedure SetMensagem5(const Value: String);
    procedure SetMensagem6(const Value: String);
    procedure SetMensagem7(const Value: String);
    procedure SetMensagem8(const Value: String);
    procedure SetDtmDadosBancarios(const Value: TDtmDadosBancariosMT);
    procedure SetiFloatExterno(const Value: integer);
    procedure SetiFloatExternoAlt(const Value: integer);
    procedure SetbUsaDataIntBanco(const Value: boolean);

   public

    dRestoreDtPagamento: TDateTime; //andrÈ tavares - pendÍncia 21782 - 30/03/2007 - para restaurar a datapagamentoi a cada registro novo
    {Construtor da classe}
    Constructor Create; Override;
    {Destrutor da classe}
    Destructor  Destroy; Override;

    //andre tavares - pendÍncia 21789 - 20/03/2006
    function ValorBrutoDoc(valorLiq, valorDesc, ValorJuros: Extended): Extended;

    (** MÈtodos para atualizaÁ„o do Banco da dados **)
    {Atualiza o n˙mero da remessa no portador forma}
    Procedure Atualizaportforma( sControleRemessa , portforma :String);
    {Atualiza dados do documento emitido em arquivos do contas a receber}
    function AtualizaDoc(sStatus,           sEmisBloq,
                          sNossoNumero,      sData,
                          sControleRemessa,  sCodDocumento, sIndicaGrupo:String): Boolean;
    {Grava os par‚metros do arquivo de remessa caso existam}
    function GravaParamIntBanco(sNomeParam, sValorParam: Array of String): Boolean;

    (** MÈtodos para seleÁ„o de registros do Banco da dados **)

    {Monta consulta para verificar par‚metros do documento}
    Function  MontaSqlTestaMensagem(sIndicaGrupo : String; bverso: Boolean = false):Boolean;
    {Busca par‚metros caso existam para emiss„o do arquivo de remessa}
    Function  BuscaParamIntBanco(sNomeParam:String;cTipoDeDado:Char):String;

    procedure MostraArquivo;

    {calcula a data do pagamento com float especificado no par‚metro} //andrÈ tavares - pendÍncia 21782 - 22/03/2007
    function CalcDataComFloatPag(codPortForma:integer; dData: TDateTime; ifloat: integer; bUsaFloatArqBanc: Boolean;  bUsaDataCredForn: Boolean): TDateTime;

    function getCPFCNPJ(idforcli: integer): string;
    //C·ssio Rovaroto - SIG n∫ 63651 - InÌcio
    function Impersonate: Boolean;
    function Encrypt(Const InString: String; StartKey, MultKey, AddKey: Integer): String;
    function Decrypt(Const InString: String; StartKey, MultKey, AddKey: Integer): String;
    //C·ssio Rovaroto - SIG n∫ 63651 - Fim

    

    (** ClientDataSet¥s para manipulaÁ„o dos registros a serem processados **)

    {Client DataSet com os dados referentes aos registros para geraÁ„o do arquivo}
    property CdsTexto: TCMClientDataSet read FCdsTexto write SetCdsTexto;
    {Client DataSet da empresa que est· enviando o arquivo}
    property CdsEmpresa: TCMClientDataSet read FCdsEmpresa write SetCdsEmpresa;
    {Client DataSet para seleÁ„o das mensagens no banco}
    property CdsMensagens: TCMClientDataSet read FCdsMensagens write SetCdsMensagens;
    property CdsAux: TCMClientDataSet read FCdsAux write SetCdsAux;

    (** Propriedades Para PersistÍncia da Classe **)

    {Informa se o arquivo foi criado}
    property bArquivoCriado: Boolean read FbArquivoCriado write SetbArquivoCriado;
    {Indica se o nosso n˙mero sera gerado novamente}
    property GeraNossoNumero: Boolean read FGeraNossoNumero write SetGeraNossoNumero;
    {Controla a atualizaÁ„o dos dados da remessa do documento no banco}
    property bAtualizadoc: Boolean read FbAtualizadoc write SetbAtualizadoc;
    {Permite visualizar o arquivo apÛs a geraÁ„o do mesmo}
    property bExibeArquivoGerado: Boolean read FbExibeArquivoGerado write SetbExibeArquivoGerado;
    {⁄ltimo nosso n˙mero gerado}
    property UltNossoNumero: String read FUltNossoNumero write SetUltNossoNumero;
    {⁄ltimo Controle de remessa gerado}
    property UltCodArquivoGerado: String read FUltCodArquivoGerado write SetUltCodArquivoGerado;
    {Nome da empresa propriet·ria a gerar o arquivo}
    property NomeEmpresa: String read FNomeEmpresa write SetNomeEmpresa;
    {nome da empresa no banco}
    property NumeEmpresaBanco: String read FNumeEmpresaBanco write SetNumeEmpresaBanco;
    {nosso n˙mero a ser gravado no arquivo}
    property NossoNumero: String read FNossoNumero write SetNossoNumero;
    {dias para protesto do tÌtulo caso seja pago apÛs o vencimento}
    property DiasProtesto: String read FDiasProtesto write SetDiasProtesto;
    {valor do juros a ser cobrado caso seja pago apÛs o vencimento}
    property ValorJuros: String read FValorJuros write SetValorJuros;
    {N˙mero de Controle da remessa gerada}
    property CodArquivoRemessa: String read FCodArquivoRemessa write SetCodArquivoRemessa;
    {Nome do arquivo aser gerado}
    property SNomeArquivo: String read FSNomeArquivo write SetSNomeArquivo;
    {CÛdigo da ocorrÍncia para a geraÁ„o do arquivo}
    property sCodOcorrencia: String read FsCodOcorrencia write SetsCodOcorrencia;
    {Nosso n˙mero a ser gravado nos arquivos de alteraÁ„o de remessa}
    property sNossoNumero: String read FsNossoNumero write SetsNossoNumero;
    {Nome do arquivo a ser gerado para alteraÁ„o de remessa}
    property NomeArquivo: String read FNomeArquivo write SetNomeArquivo;
    {Nome do arquivo gerado quando o mesmo È renomeado pelo sistema}
    property NomeArquivoIntBanco: String read FNomeArquivoIntBanco write SetNomeArquivoIntBanco;
    {Data de desconto do valor pago}
    property DataPagamento: String read FDataPagamento write SetDataPagamento;
    {Arquivo texto a ser gerado}
    property ArquivoTexto: TextFile read FArquivoTexto write FArquivoTexto;
    {Arquivo com o log do processo geraÁ„o do arquivo}
    property ArquivoLog: TextFile read FArquivoLog write FArquivoLog;
    {cÛdigo do portador forma a ser gerado}
    property CodigoPortadorForma : LongInt read FCodigoPortadorForma write SetCodigoPortadorForma;
    {Identifica a origem do arquivo a ser processado }
    property IdentificaOrigem: String read FIdentificaOrigem write SetIdentificaOrigem;

    property bUsaDataIntBanco: boolean read FbUsaDataIntBanco write SetbUsaDataIntBanco;

    property Mensagem1: String read FMensagem1 write SetMensagem1;
    property Mensagem2: String read FMensagem2 write SetMensagem2;
    property Mensagem3: String read FMensagem3 write SetMensagem3;
    property Mensagem4: String read FMensagem4 write SetMensagem4;
    property Mensagem5: String read FMensagem5 write SetMensagem5;
    property Mensagem6: String read FMensagem6 write SetMensagem6;
    property Mensagem7: String read FMensagem7 write SetMensagem7;
    property Mensagem8: String read FMensagem8 write SetMensagem8;
    property NaoGerarArquivo: Boolean read FNaoGerarArquivo write SetNaoGerarArquivo;

    property DtmIntBanco: TDtmIntBancoMT read FDtmIntBanco write SetDtmIntBanco;
    property DtmDadosBancarios: TDtmDadosBancariosMT read FDtmDadosBancarios write SetDtmDadosBancarios;

    //inÌcio - andrÈ tavares - pendÍncia 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepıem os floats do portadorforma.
    property iFloatExterno: integer read FiFloatExterno write SetiFloatExterno; //ex. Doc
    property iFloatExternoAlt: integer read FiFloatExternoAlt write SetiFloatExternoAlt; //ex. Ted
    //fim - andrÈ tavares - pendÍncia 25172 - 29/05/2007
end;

Var
  IntBancoManager: TIntBancoManager;

implementation

Constructor TIntBancoManager.Create;
Begin
  Inherited;
  fbUsaDataIntBanco := true;
  FCdsTexto := TCMClientDataSet.Create(nil);
  FCdsMensagens := TCMClientDataSet.Create(nil);
  FCdsEmpresa := TCMClientDataSet.Create(nil);
  FCdsAux := TCMClientDataSet.Create(nil);
  FDtmIntBanco := TDtmIntBancoMT.Create(nil);
  fDtmDadosBancarios := TDtmDadosBancariosMT.Create(nil);

  FIdentificaOrigem := ' ';
  FMensagem1 := '';
  FMensagem2 := '';
  FMensagem3 := '';
  FMensagem4 := '';
  FMensagem5 := '';
  FMensagem6 := '';
  FMensagem7 := '';
  FMensagem8 := '';

  FNaoGerarArquivo := False;
  bAtualizadoc := True;

  _DbParamIntBanco := TDbParamIntBanco.Create(Self);
  _DbIntbancoxportform := TDbIntbancoxportform.Create(Self);

  FbExibeArquivoGerado := false; // andre tavares - 21/12/2004 - pendencia 17884

  FiFloatExterno := 0;
  FiFloatExternoAlt := 0;
  dRestoreDtPagamento := 0;
End;

Destructor TIntBancoManager.Destroy;
Begin
  FCdsTexto.Free;
  FCdsMensagens.Free;
  FCdsEmpresa.Free;
  FCdsAux.Free;
  FDtmIntBanco.Free;
  fDtmDadosBancarios.Free;

  _DbParamIntBanco.Free;
  _DbIntbancoxportform.Free;
  Inherited;
End;


Procedure TIntBancoManager.Atualizaportforma( sControleRemessa,portforma :String);
begin
   if not ExecSql('UPDATE PORTADORFORMA SET CONTROLEREMESSA = ' + sControleRemessa +
                  ' WHERE CODPORTFORMA = ' + portforma  ) then
      raise Exception.Create(MessageInfo);
end;

function TIntBancoManager.AtualizaDoc(sStatus,sEmisBloq,sNossoNumero, sData,
sControleRemessa,sCodDocumento, sIndicaGrupo:String): Boolean;
Var
   sSQL: String;
Begin
   Result := True;
   If bAtualizadoc Then
   Begin
     If sIndicaGrupo <> 'S' Then
        sSQL :=
        ' Update Documento Set '+
        ' Status = ''' + sStatus + ''', '+
        ' EmisBloq = ''' + sEmisBloq + ''', '+
        ' NossoNumero = ''' + sNossoNumero + ''', '+
        ' ControleRemessa = ' + sControleRemessa + ', '+
        ' DataRemessa = To_Date(''' + sData + ''',''DD/MM/YYYY'') '+
        ' Where CodDocumento = ' + sCodDocumento +
        ' AND RECPAG = '+ quotedstr(ParamIntegra.RecPag) //andrÈ tavares - penÍncia 22819 - 28/08/2006
     Else
        sSQL :=
        ' Update Documento Set '+
        ' Status = ''' + sStatus + ''', '+
        ' EmisBloq = ''' + sEmisBloq + ''', '+
        ' NossoNumero = ''' + sNossoNumero + ''', '+
        ' ControleRemessa = ' + sControleRemessa + ', '+
        ' DataRemessa = To_Date(''' + sData + ''',''DD/MM/YYYY'') '+
        ' Where CODGRUPOCNAB = ' + sCodDocumento +
        ' AND RECPAG = '+ quotedstr(ParamIntegra.RecPag); //andrÈ tavares - penÍncia 22819 - 28/08/2006

     result := ExecSQL(sSQL);
   End;
end;


Function TIntBancoManager.MontaSqlTestaMensagem(sIndicaGrupo : String; bverso: Boolean = false):Boolean;
Begin
//inÌcio - AndrÈ Tavares - pendÍncia 17041 - 21/06/2004
  if bVerso then
  begin
    If sIndicaGrupo = 'N' Then
      CdsMensagens.Data := GetDataPacket('SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9, MENSAGEM10, '+
      ' MENSAGEM11,MENSAGEM12,MENSAGEM13,MENSAGEM14,MENSAGEM15,MENSAGEM16,MENSAGEM17,MENSAGEM18,MENSAGEM19, MENSAGEM20 '+
      ' FROM MSGCNABVERSO WHERE CODDOCUMENTO = ' + fCdsTexto.FieldByName('CODDOCUMENTO').AsString)
    Else
      CdsMensagens.Data := GetDataPacket('SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9, MENSAGEM10, '+
      ' MENSAGEM11,MENSAGEM12,MENSAGEM13,MENSAGEM14,MENSAGEM15,MENSAGEM16,MENSAGEM17,MENSAGEM18,MENSAGEM19, MENSAGEM20 '+
      ' FROM MSGCNABVERSO WHERE CODGRUPOCNAB = ' + fCdsTexto.FieldByName('CODDOCUMENTO').AsString);
  end
  else
  begin
    If sIndicaGrupo = 'N' Then
      CdsMensagens.Data := GetDataPacket('SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9, MENSAGEM10 FROM MENSAGENSCNAB WHERE CODDOCUMENTO = ' + fCdsTexto.FieldByName('CODDOCUMENTO').AsString)
    Else
      CdsMensagens.Data := GetDataPacket('SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9, MENSAGEM10 FROM MENSAGENSCNAB WHERE CODGRUPOCNAB = ' + fCdsTexto.FieldByName('CODDOCUMENTO').AsString);
  end;
{
  If sIndicaGrupo = 'N' Then
     CdsMensagens.Data := GetDataPacket('SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9 FROM MENSAGENSCNAB WHERE CODDOCUMENTO = ' + fCdsTexto.FieldByName('CODDOCUMENTO').AsString)
  Else
     CdsMensagens.Data := GetDataPacket('SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9 FROM MENSAGENSCNAB WHERE CODGRUPOCNAB = ' + fCdsTexto.FieldByName('CODDOCUMENTO').AsString);
}
//fim - AndrÈ Tavares - pendÍncia 17041 - 21/06/2004

  Result := Not CdsMensagens.isEmpty;
End;

Function  TIntBancoManager.BuscaParamIntBanco(sNomeParam:String;cTipoDeDado:Char):String;
Var
   sResult: String;
Begin
   With fDtmIntBanco.CdsParamIntBanco Do
   Begin
      If Locate('DESCPARAMINTBANCO',sNomeParam,[]) Then
         sResult := FieldByName('VALPARAMINTBANCO').AsString
      Else
         sResult := '';
   end;

   Case cTipoDeDado of
     'S': If sResult = '' Then sResult := '';
     'N': If sResult = '' Then sResult := '0';
     'D': If sResult = '' Then sResult := DateToStr(Date);
   End;

   Result := sResult;
End;

function  TIntBancoManager.GravaParamIntBanco(sNomeParam, sValorParam: Array of String): Boolean;
Var
   iNumParams, x, iNewIdPartamIndBanco: Integer;
Begin
   iNumParams := High(sNomeParam);
   For X:=0 To iNumParams Do
       With fDtmIntBanco, CdsParamIntBanco Do
       Begin
          If not Locate('DESCPARAMINTBANCO',sNomeParam[x],[]) Then
          begin
             Append;
             FieldByName('IDPARAMINTBANCO').AsInteger  := GetSequence('PARAMINTBANCO');
             FieldByName('DESCPARAMINTBANCO').AsString := sNomeParam[x];
          end
          else
          begin
             If FieldByName('CODPORTFORMA').IsNull
// inÌcio - AndrÈ Tavares 29/09/2003 - pendÍncia 15099
               or (FieldByName('CODPORTFORMA').asInteger = 0)
// fim    - AndrÈ Tavares 29/09/2003 - pendÍncia 15099
             Then Begin
                Append;
                FieldByName('IDPARAMINTBANCO').AsInteger  := GetSequence('PARAMINTBANCO');
                FieldByName('DESCPARAMINTBANCO').AsString := sNomeParam[x];
             End
             Else
                Edit;
          end;

          FieldByName('VALPARAMINTBANCO').AsString := sValorParam[x];
        //  FieldByName('IDPARAMINTBANCO').AsInteger := iNewIdPartamIndBanco;
          //FieldByName('CODPORTFORMA').AsInteger := SQLParamIntBanco.ParamByName('CODPORTFORMA').AsInteger;
          fDtmIntBanco.CdsParamIntBanco.FieldByName('CODPORTFORMA').AsInteger := SQLParamIntBanco.ParamByName('CODPORTFORMA').AsInteger;
          FieldByName('RECPAG').AsString := SQLParamIntBanco.ParamByName('RECPAG').AsString;
          FieldByName('IDMODELOSCNAB').AsInteger := SQLParamIntBanco.ParamByName('IDMODELOSCNAB').AsInteger;
          Post;
       end;
   Result := ApplyCds(fDtmIntBanco.CdsParamIntBanco,  _DbParamIntBanco, [], []);
// inÌcio - AndrÈ Tavares 29/09/2003 - pendÍncia 15099
   if result then
   begin
      Result := ApplyCds( fDtmIntBanco.CdsParamIntBanco,
                          _DbIntbancoxportform, [], []);
      if not result then MessageInfo := _DbIntbancoxportform.MessageInfo;
   end;

// fim - AndrÈ Tavares 29/09/2003 - pendÍncia 15099

{// inÌcio - AndrÈ Tavares 19/09/2003 - pendÍncia 15058
   if result then
   begin
      Result := ApplyCds( fDtmIntBanco.CdsParamIntBanco,
                          _DbIntbancoxportform, [], []);
                          //[_DbParamIntBanco.IDPARAMINTBANCO],
                          //[_DbIntbancoxportform.IDPARAMINTBANCO] );
      if not result then MessageInfo := _DbIntbancoxportform.MessageInfo;
   end
// fim - AndrÈ Tavares 19/09/2003 - pendÍncia 15058
}
// inÌcio - AndrÈ Tavares 19/09/2003 - pendÍncia 15058
   if not result then
     MessageInfo := _DbIntbancoxportform.MessageInfo
// fim - AndrÈ Tavares 19/09/2003 - pendÍncia 15058
   else
     MessageInfo := _DbParamIntBanco.MessageInfo;

   fDtmIntBanco.CdsParamIntBanco.Close;
End;

procedure TIntBancoManager.SetbArquivoCriado(const Value: Boolean);
begin
  FbArquivoCriado := Value;
end;

procedure TIntBancoManager.SetbAtualizadoc(const Value: Boolean);
begin
  FbAtualizadoc := Value;
end;

procedure TIntBancoManager.SetbExibeArquivoGerado(const Value: Boolean);
begin
  FbExibeArquivoGerado := Value;
end;

procedure TIntBancoManager.SetCdsEmpresa(const Value: TCMClientDataSet);
begin
  FCdsEmpresa := Value;
end;

procedure TIntBancoManager.SetCdsMensagens(const Value: TCMClientDataSet);
begin
  FCdsMensagens := Value;
end;

procedure TIntBancoManager.SetCdsTexto(const Value: TCMClientDataSet);
begin
  FCdsTexto := Value;
end;

procedure TIntBancoManager.SetCodArquivoRemessa(const Value: String);
begin
  FCodArquivoRemessa := Value;
end;

procedure TIntBancoManager.SetCodigoPortadorForma(const Value: LongInt);
begin
  FCodigoPortadorForma := Value;
end;

procedure TIntBancoManager.SetDataPagamento(const Value: String);
begin
  FDataPagamento := Value;
end;

procedure TIntBancoManager.SetDiasProtesto(const Value: String);
begin
  FDiasProtesto := Value;
end;

procedure TIntBancoManager.SetGeraNossoNumero(const Value: Boolean);
begin
  FGeraNossoNumero := Value;
end;

procedure TIntBancoManager.SetNomeArquivo(const Value: String);
begin
  FNomeArquivo := Value;
end;

procedure TIntBancoManager.SetNomeArquivoIntBanco(const Value: String);
begin
  FNomeArquivoIntBanco := Value;
end;

procedure TIntBancoManager.SetNomeEmpresa(const Value: String);
begin
  FNomeEmpresa := Value;
end;

procedure TIntBancoManager.SetNossoNumero(const Value: String);
begin
  FNossoNumero := Value;
end;

procedure TIntBancoManager.SetNumeEmpresaBanco(const Value: String);
begin
  FNumeEmpresaBanco := Value;
end;

procedure TIntBancoManager.SetsCodOcorrencia(const Value: String);
begin
  FsCodOcorrencia := Value;
end;

procedure TIntBancoManager.SetSNomeArquivo(const Value: String);
begin
  FSNomeArquivo := Value;
end;

procedure TIntBancoManager.SetsNossoNumero(const Value: String);
begin
  FsNossoNumero := Value;
end;

procedure TIntBancoManager.SetUltCodArquivoGerado(const Value: String);
begin
  FUltCodArquivoGerado := Value;
end;

procedure TIntBancoManager.SetUltNossoNumero(const Value: String);
begin
  FUltNossoNumero := Value;
end;

procedure TIntBancoManager.SetValorJuros(const Value: String);
begin
  FValorJuros := Value;
end;

procedure TIntBancoManager.MostraArquivo;
begin
  if bExibeArquivoGerado then
  //VisualizaArquivo(sNomeArquivo, 'Remessa n∫ ' + fCodArquivoRemessa);
    //andrÈ tavares - pendÍncia 28251 - 23/06/2008
  If Application.MessageBox(Pchar('Deseja visualizar o arquivo ' + (#13+#10) + sNomeArquivo + '?'),'AtenÁ„o',Mb_IconQuestion + Mb_YesNo) = Id_Yes Then
    ShellExecuteFile(sNomeArquivo,'','',SW_SHOW);
end;

procedure TIntBancoManager.SetDtmIntBanco(const Value: TDtmIntBancoMT);
begin
  FDtmIntBanco := Value;
end;

procedure TIntBancoManager.SetCdsAux(const Value: TCMClientDataSet);
begin
  FCdsAux := Value;
end;

procedure TIntBancoManager.SetIdentificaOrigem(const Value: String);
begin
  FIdentificaOrigem := Value;
end;

procedure TIntBancoManager.SetMensagem1(const Value: String);
begin
  FMensagem1 := Value;
end;

procedure TIntBancoManager.SetMensagem2(const Value: String);
begin
  FMensagem2 := Value;
end;

procedure TIntBancoManager.SetMensagem3(const Value: String);
begin
  FMensagem3 := Value;
end;

procedure TIntBancoManager.SetNaoGerarArquivo(const Value: Boolean);
begin
  FNaoGerarArquivo := Value;
end;

procedure TIntBancoManager.SetMensagem4(const Value: String);
begin
  FMensagem4 := Value;
end;

procedure TIntBancoManager.SetMensagem5(const Value: String);
begin
  FMensagem5 := Value;
end;

procedure TIntBancoManager.SetMensagem6(const Value: String);
begin
  FMensagem6 := Value;
end;

procedure TIntBancoManager.SetMensagem7(const Value: String);
begin
  FMensagem7 := Value;
end;

procedure TIntBancoManager.SetMensagem8(const Value: String);
begin
  FMensagem8 := Value;
end;

procedure TIntBancoManager.SetDtmDadosBancarios(
  const Value: TDtmDadosBancariosMT);
begin
  FDtmDadosBancarios := Value;
end;

procedure TIntBancoManager.DoChangeDataBase;
begin
  inherited;
  _DbParamIntBanco.DataBaseName := DataBaseName;
  _DbIntbancoxportform.DataBaseName := DataBaseName;
end;

//inÌcio andre tavares - pendÍncia 21789 - 20/03/2006
function TIntBancoManager.ValorBrutoDoc(valorLiq, valorDesc, ValorJuros: Extended): Extended;
begin
  result := valorLiq + valorDesc - ValorJuros;
end;
//fim andre tavares - pendÍncia 21789 - 20/03/2006



(* este cÛdigo ser· refeito abaixo
{calcula a data do pagamento com float especificado no par‚metro} //andrÈ tavares - pendÍncia 21782 - 22/03/2007
//GERMANO
function TIntBancoManager.CalcDataComFloatPag(codPortForma:integer; dData: TDateTime; ifloat: integer; bUsaFloatArqBanc: Boolean;  bUsaDataCredForn: Boolean): TDateTime;
var
   floatDias: integer;
   cdsIdEmpresa: TCMClientDataSet;
   idEmpresa:integer;
begin

  {       dDtProgramada := dptDtProgramada.date;
        For ContDias:=1 to qryProcesso.fieldbyname('DFLOATPROG').AsInteger do
        Begin
          While True do
          Begin
            dDtProgramada := dDtProgramada - 1;
            If DiasUteis.DiaUtil(dDtProgramada, -1, -1, '', True, True, False) Then Break;
          End;
        End;
        // ClaudioR - 12/04/2007 - 21964 - Fim
}

  //pendÍncia 27109 - Germano Souza - 18/11/2007
  cdsIdEmpresa:= TCMClientDataSet.Create(nil);
  cdsIdEmpresa.data:= GetDataPacket('SELECT B.IDAGENCIA '+
                                    '  FROM PORTADORFORMA A, PORTADORCONTA B ' +
                                    '  WHERE A.codportador = B.codportador ' +
                                    '    AND A.CODPORTFORMA  = '+inttostr(codPortForma));
  cdsIdEmpresa.Open;
  idEmpresa:= cdsIdEmpresa.fieldByName('IDAGENCIA').asInteger;
  //fim pendÍncia 27109

  if bUsaFloatArqBanc then
  begin
    if bUsaDataCredForn then //se usa data para crÈdito na conta do fornecedor
    begin
      if trunc(dData) > Date then
      begin
        {amf 10.09.2007 25756
        dData := dData - iFloat;
        while not DiasUteis.DiaUtil(Sistema.IdEmpresa, dData, True, False, False) do
          dData := dData - 1;
        }

        //amf 10.09.2007 25756 - a data com float correta deve ser calculada desta forma, cada data (˙til) atÈ atender o float
        for floatDias := 1 to ifloat do
        begin
          while (true) do
          begin
             dData := dData - 1;
             //pendÍncia 27109
             if DiasUteis.DiaUtil(idEmpresa, dData, True, True,false)
             //if DiasUteis.DiaUtil(dData, -1, -1, '', True, True, False)
                then Break;

          end;
        end;
      end;
    end
    else //sen„o usa data para dÈbito na conta da fundaÁ„o
    begin
{amf 10.09.2007      dData := dData + iFloat;
      while not DiasUteis.DiaUtil(Sistema.IdEmpresa, dData, True, False, False) do
        dData := dData + 1;
}

        //amf 10.09.2007 25756 - a data com float correta deve ser calculada desta forma, cada data (˙til) atÈ atender o float
        for floatDias := 1 to ifloat do
        begin
          while (true) do
          begin
             dData := dData - 1;
             //pendÍncia 27109
             if DiasUteis.DiaUtil(idEmpresa, dData, True, True,false)
             //if DiasUteis.DiaUtil(dData, -1, -1, '', True, True, False)
                then Break;

          end;
        end;
    end;
  end
  else //exemplo CBS que credita na conta do fornecedor exatamente na data do vencimento do documento
  begin
    if trunc(dData) > Date then //se data de programaÁ„o do doc for > data corrente, ent„o aplica o float
    begin
{      dData := dData - iFloat;
      while not DiasUteis.DiaUtil(Sistema.IdEmpresa, dData, True, False, False) do
        dData := dData - 1;
}
        //amf 10.09.2007 25756 - a data com float correta deve ser calculada desta forma, cada data (˙til) atÈ atender o float
        for floatDias := 1 to ifloat do
        begin
          while (true) do
          begin
             dData := dData - 1;
             //pendÍncia 27109
             if DiasUteis.DiaUtil(idEmpresa, dData, True, True,false)
             //if DiasUteis.DiaUtil(dData, -1, -1, '', True, True, False)
                then Break;

          end;
        end;
    end;
  end;
  fDataPagamento := formatDateTime('DD/MM/YYYY', dData);

  //pendÍncia 27109
  cdsIdEmpresa.close;
  cdsIdEmpresa.free;

  result := dData;
end;
*)

//pendÍncias 26895 e 26929 09/01/2008 
function TIntBancoManager.CalcDataComFloatPag(codPortForma:integer; dData: TDateTime; ifloat: integer; bUsaFloatArqBanc: Boolean;  bUsaDataCredForn: Boolean): TDateTime;
var
   floatDias    : integer;
   cdsIdEmpresa : TCMClientDataSet;
   idEmpresa, i : integer;
begin

  cdsIdEmpresa      := TCMClientDataSet.Create(nil);
  
  try
    cdsIdEmpresa.data := GetDataPacket(' SELECT B.IDAGENCIA '+
                                      ' FROM PORTADORFORMA A, PORTADORCONTA B ' +
                                      ' WHERE A.CODPORTADOR   = B.CODPORTADOR ' +
                                      '   AND A.CODPORTFORMA  = '+inttostr(codPortForma));
    cdsIdEmpresa.Open;

    //pega o idpessoa da agÍncia para verificar se a data È feriado local (cidade da agÍncia banc·ria)
    idEmpresa := cdsIdEmpresa.fieldByName('IDAGENCIA').asInteger;

    if bUsaFloatArqBanc then
    begin
      if bUsaDataCredForn then //se usa data para crÈdito na conta do fornecedor
      begin
        if trunc(dData) > trunc(Date) then
        begin

          for i := 1 to iFloat do
          begin
            dData := dData - 1;
            while (not DiasUteis.DiaUtil(idEmpresa, dData, True, False, False)) do
              dData := dData - 1;
          end;

        end;
      end
      else //sen„o usa data para dÈbito na conta da fundaÁ„o
      begin

        for i := 1 to iFloat do
        begin
          dData := dData + 1;
          while (not DiasUteis.DiaUtil(idEmpresa, dData, True, False, False)) do
            dData := dData + 1;
        end;

      end;
    end;
    fDataPagamento := formatDateTime('DD/MM/YYYY', dData);

  finally
    cdsIdEmpresa.close;
    cdsIdEmpresa.free;
  end;

  result := dData;
end;




procedure TIntBancoManager.SetiFloatExterno(const Value: integer);
begin
  FiFloatExterno := Value;
end;

procedure TIntBancoManager.SetiFloatExternoAlt(const Value: integer);
begin
  FiFloatExternoAlt := Value;
end;

function TIntBancoManager.getCPFCNPJ(idforcli: integer): string;
var
  _cds: TClientDataSet;
  _sql: string;
begin
   try

     _sql := 'SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = ' + IntToStr(idforcli) ;

     _cds := TClientDataSet.Create(nil);
     _cds.data := GetDataPacket(_sql);
     Result := _cds.FieldByName('NUMDOCUMENTO').AsString;
   finally
     freeAndNil(_cds);
   end;
end;

procedure TIntBancoManager.SetbUsaDataIntBanco(const Value: boolean);
begin
  FbUsaDataIntBanco := Value;
end;

function TIntBancoManager.Impersonate: Boolean;
var
  LogonType: Integer;
  LogonProvider: Integer;
  TokenHandle: THandle;
  sAdminUser: string;
  sAdminDomain: string;
  sAdminPassword: string;
  usuario, senha: string;
begin
  LogonType := LOGON32_LOGON_INTERACTIVE;
  LogonProvider := LOGON32_PROVIDER_DEFAULT;
  sAdminUser := fUser;
  sAdminDomain := '';
  sAdminPassword := fPw;

  Result := LogonUser(PChar(Decrypt(fUser, StKey, MtKey, AdKey)), nil, PChar(Decrypt(fPw, StKey, MtKey, AdKey)),
                      LogonType, LogonProvider, TokenHandle);

  if Result then
    Result := ImpersonateLoggedOnUser(TokenHandle);
end;

function TIntBancoManager.Decrypt(const InString: String; StartKey,
  MultKey, AddKey: Integer): String;
var I: Byte;
begin
  Result := '';
  for I := 1 To Length(InString) Do
  begin
    Result := Result + Char(Byte(InString[I]) Xor (StartKey Shr 8));
    StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey;
  end;
end;

function TIntBancoManager.Encrypt(const InString: String; StartKey,
  MultKey, AddKey: Integer): String;
var I: Byte;
begin
  Result := '';
  for I := 1 To Length(InString) Do
  begin
    Result := Result + Char(Byte(InString[I]) Xor (StartKey Shr 8));
    StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
  end;
end;

end.
