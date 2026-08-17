unit DPrincipal;

interface

uses
  SysUtils, HTTPApp, ADODB, Db, Jpeg, extctrls, graphics, JCLStrings, uConstPaginasCampos,
  uCmFileUtils, DModAutoAtendimento, Classes, uCtrlPadroes, uCmTypes, uVersoes, JCLSysUtils,
  uCtrlFuncoesAA, uWebEmpSimulacaoInscricao, uCtrlAutoEmprestimo,
  uCMClientDataSet, DBClient;

type
  TwmdlAutoAtendimento = class(TWebModule)
    pgpResposta: TPageProducer;
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
    procedure pgpRespostaHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure wmdlAutoAtendimentoConectaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoTestaAplicacaoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoSobreAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoElegivelAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoSimulacaoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConcessaoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoAssinaContratoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoValidacaoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoRemoveAssinaturaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private

  public

  end;

var
  wmdlAutoAtendimento: TwmdlAutoAtendimento;
  CtrlAutoEmprestimo : TCtrlAutoEmprestimo;

implementation

{$R *.DFM}


procedure TwmdlAutoAtendimento.WebModuleCreate(Sender: TObject);
begin
  inherited;

  try

    //Inicializa o Data Modulo
    dtmModAutoAtendimento := TdtmModAutoAtendimento.Create( nil );

    ctrlAutoEmprestimo := TCtrlAutoEmprestimo.Create;

    //Inicializa o Auto-Atendimento.
    Inicializa;

  except
    On E : Exception do
    begin
      CMDebugToFile( 'Erro ao inicializar aplicação: ' + E.Message, 'C:\AAErro.txt' );
    end;
  end;
end; {WebModuleCreate}



procedure TwmdlAutoAtendimento.WebModuleDestroy(Sender: TObject);
begin
  dtmModAutoAtendimento.Free;
  ctrlAutoEmprestimo.Free;
  inherited;
end; {WebModuleDestroy}



procedure TwmdlAutoAtendimento.pgpRespostaHTMLTag(Sender: TObject;
  Tag: TTag; const TagString: String; TagParams: TStrings;
  var ReplaceText: String);
begin
  //Hidden Fields
  if TagString = 'hiddenfields'    then ReplaceText := HiddenFields;

  //Título da página
  if TagString = 'titulo'          then ReplaceText := sTitulo;

  //E-mail de contato
  if TagString = 'email'           then ReplaceText := sEMail;

  //IdPessoa
  if TagString = 'idpessoa'        then ReplaceText := IntToStr( iIdPessoa );

  //LoginPessoal
  if TagString = 'loginpessoal'    then ReplaceText := sLoginPessoal;

  //Nome completo do usuário conectado
  if TagString = 'nomeusuario'     then ReplaceText := sNomeUsuario;

  //Tipo de usuário
  if TagString = 'tipousuario'     then ReplaceText := sTipoUsuario;

  //Data e hora correntes
  if TagString = 'datahora'        then ReplaceText := FormatDateTime(
   'dd/MM/yyyy hh:nn', Now );

  //Sigla da Fundação
  if TagString = 'fundacao'        then ReplaceText := sFundacao;

  //Primeiro nome do usuário
  if TagString = 'prenome'         then ReplaceText := StrToName( Copy (
   sNomeUsuario, 1, Pos( ' ', sNomeUsuario ) - 1 ) );

  //JavaScript do menu dinâmico
  if TagString = 'javamenu'        then ReplaceText := sJavaMenu;

  //JavaScript do menu dinâmico
  if TagString = 'javalayers'      then ReplaceText := sJavaLayers;

  //JavaScript dos links dinâmicos
  if TagString = 'linkmenu'        then ReplaceText := sLinkMenu;

  //Menu dinâmico
  if TagString = 'menu'            then ReplaceText := sMenu;

  //Reservada para inclusão de código JavaScript específico para cada página
  if TagString = 'javascript'      then ReplaceText := sJavaScript;

  //Sessão
  if TagString = 'sessao'          then ReplaceText := sIdSessao;

  //Nome do arquivo da aplicação
  if TagString = 'nomearqapl'      then ReplaceText := sNomeArqApl;

  //Matrícula do participante
  if TagString = 'matricula'       then ReplaceText := sMatricula;

  //Matrícula do participante
  if TagString = 'inscricaonumero' then ReplaceText := sInscricaoNumero;

  //Quantidade de acessos
  if TagString = 'qtdeacessos'     then ReplaceText := IntToStr( iQtdeAcessos );

  //SeqAcesso
  if TagString = 'seqacesso'        then ReplaceText := IntToStr( iSeqAcesso );


end; {pgpRespostaHTMLTag}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConectaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sMatriculaAux, sLoginAux, sSenhaAux : string;
  iIdTipoContrato : Integer;
begin
  try
    sLoginAux       := trim( Request.ContentFields.Values['vLoginMaster'] );
    sSenhaAux       := trim( Request.ContentFields.Values['vSenha'] );
    sMatriculaAux   := trim( Request.ContentFields.Values['vMatricula'] );
    iIdTipoContrato := StrToInt(trim( Request.ContentFields.Values['vIdTipoContrEmptmo'] ));

    if not CtrlAutoEmprestimo.Conecta( sLoginAux, sSenhaAux ) then
       raise Exception.Create( CtrlAutoEmprestimo.sMsgErroAE );

    pgpResposta.HTMLDoc.Text := LeHTML( 'AEConecta.htm' );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;
end; {wmdlAutoAtendimentoConectaAction}



procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoElegivelAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sMatriculaAux, sLoginAux, sSenhaAux : string;
  iIdTipoContrato : Integer;
  vResult, vSimula, vContrAnteriores : OLEVariant;
  cdsResult : TCMClientDataSet;
begin
   try
      try
         cdsResult := TCMClientDataSet.Create( nil );

         sLoginAux       := trim( Request.ContentFields.Values['vLoginMaster'] );
         sSenhaAux       := trim( Request.ContentFields.Values['vSenha'] );
         sMatriculaAux   := trim( Request.ContentFields.Values['vMatricula'] );
         iIdTipoContrato := StrToInt(trim( Request.ContentFields.Values['vIdTipoContrEmptmo'] ));

         sNomeArqLog := sLogDir + 'AutoEmprestimo - Elegibilidade - ' + sMatriculaAux + '.log' ;

         if bGeraLogProcesso then CMDebugToFile( 'Inicio da Função ELEGIBILIDADE.. ', sNomeArqLog );

         // Verifica Elegibilidade
         if not CtrlAutoEmprestimo.Elegivel(sLoginAux, sSenhaAux, sMatriculaAux, iIdTipoContrato, '', vResult, vContrAnteriores ) then
            raise Exception.Create( CtrlAutoEmprestimo.sMsgErroAE );

         if bGeraLogProcesso then CMDebugToFile( 'Início da Função SIMULACAO.. ', sNomeArqLog );

         // Efetua simulação pelo prazo e valor máximo
         cdsResult.Data := vResult;
         if not CtrlAutoEmprestimo.Simulacao(cdsResult.FieldByName('par_fVlrMaxPermit').AsFloat,
                                             cdsResult.FieldByName('par_iMaxParcelas').AsString,
                                             vResult, vSimula ) then
            raise Exception.Create( CtrlAutoEmprestimo.sMsgErroAE );

         if bGeraLogProcesso then CMDebugToFile( 'Inicio da montagem do XML de retorno ELEGIBILIDADE.. ', sNomeArqLog );

         pgpResposta.HTMLDoc.Text := CtrlAutoEmprestimo.MontaResultElegibilidade( vResult, vSimula, vContrAnteriores );

         if bGeraLogProcesso then CMDebugToFile( 'Término da Função ELEGIBILIDADE.. ', sNomeArqLog );

      except
         On E : Exception do
         begin
           pgpResposta.HTMLDoc.Text := TrataWebExcecoesAE( E, 'frmOutElegivel', Request );
         end;
      end;

      Response.Content := pgpResposta.Content;

      CtrlAutoEmprestimo.RemoveTempFile(vResult);
      DestroiSessao( sIdSessao );
   finally
      cdsResult.Free;
   end;

end; {wmdlAutoAtendimentoElegivelAction}




procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoSimulacaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sMatriculaAux, sLoginAux, sSenhaAux, sPrazos, sContrAQuitar : string;
  iIdTipoContrato   : Integer;
  fVlrSolicitado : Currency;
  vResult, vSimula, vContrAnteriores  : OLEVariant;
begin
   try

      sLoginAux         := trim( Request.ContentFields.Values['vLoginMaster'] );
      sSenhaAux         := trim( Request.ContentFields.Values['vSenha'] );
      sMatriculaAux     := trim( Request.ContentFields.Values['vMatricula'] );
      iIdTipoContrato   := StrToInt(trim( Request.ContentFields.Values['vIdTipoContrEmptmo'] ));
      fVlrSolicitado    := StrToCurr( StrSubst( Request.ContentFields.Values['vVlrSolicitado'], '.', '' ) );
      sPrazos           := trim( Request.ContentFields.Values['vPrazos'] );
      sContrAQuitar     := trim( Request.ContentFields.Values['vIdContrAQuitar'] );

      sNomeArqLog := sLogDir + 'AutoEmprestimo - Simulacao - ' + sMatriculaAux + '.log' ;      

      // Verifica Elegibilidade
      if bGeraLogProcesso then CMDebugToFile( 'Inicio da Verifica ELEGIBILIDADE.. ', sNomeArqLog );
      if not CtrlAutoEmprestimo.Elegivel(sLoginAux, sSenhaAux, sMatriculaAux, iIdTipoContrato, sContrAQuitar, vResult, vContrAnteriores) then
         raise Exception.Create( CtrlAutoEmprestimo.sMsgErroAE );


      // Efetua a Simulação para todos os prazos possíveis
      if bGeraLogProcesso then CMDebugToFile( 'Inicio da SIMULACAO.. ', sNomeArqLog );
      if not CtrlAutoEmprestimo.Simulacao(fVlrSolicitado, sPrazos, vResult, vSimula ) then
         raise Exception.Create( CtrlAutoEmprestimo.sMsgErroAE );

      if bGeraLogProcesso then CMDebugToFile( 'Inicio da montagem do XML de retorno SIMULACAO.. ', sNomeArqLog );
      pgpResposta.HTMLDoc.Text := CtrlAutoEmprestimo.MontaResultSimulacao( fVlrSolicitado, sPrazos, sContrAQuitar, vResult, vSimula );

      if bGeraLogProcesso then CMDebugToFile( 'Término da Função SIMULACAO.. ', sNomeArqLog );

   except
      On E : Exception do
      begin
        pgpResposta.HTMLDoc.Text := TrataWebExcecoesAE( E, 'frmOutSimulacao', Request );
      end;
   end;

   Response.Content := pgpResposta.Content;

   CtrlAutoEmprestimo.RemoveTempFile(vResult);
   DestroiSessao( sIdSessao );
end;



procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConcessaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sMatriculaAux, sLoginAux, sSenhaAux : string;
  iIdTipoContrato : Integer;
  fVlrSolicitado : Currency;
  iPrazo, iIdFornecedor, iCodAutoEmp : Extended;
  sContrAQuitar : string;
  sBanco, sAgencia, sContaCorrente : string;
  vResult : OLEVariant;
begin
   try

      sLoginAux         := trim( Request.ContentFields.Values['vLoginMaster'] );
      sSenhaAux         := trim( Request.ContentFields.Values['vSenha'] );
      sMatriculaAux     := trim( Request.ContentFields.Values['vMatricula'] );
      iIdTipoContrato   := StrToInt(trim( Request.ContentFields.Values['vIdTipoContrEmptmo'] ));
      fVlrSolicitado    := StrToCurr( StrSubst( Request.ContentFields.Values['vVlrSolicitado'], '.', '' ) );
      iPrazo            := StrToInt(trim( Request.ContentFields.Values['vPrazo'] ));
      sContrAQuitar     := trim( Request.ContentFields.Values['vIdContrAQuitar'] );
      iIdFornecedor     := StrToInt(trim( Request.ContentFields.Values['vIdFornecedor'] ));
      iCodAutoEmp       := StrToInt(trim( Request.ContentFields.Values['vCodAutoEmprestimo'] ));
      sBanco            := trim( Request.ContentFields.Values['vBancoPag'] );
      sAgencia          := trim( Request.ContentFields.Values['vAgenciaPag'] );
      sContaCorrente    := trim( Request.ContentFields.Values['vContaPag'] );


      sNomeArqLog := sLogDir + 'AutoEmprestimo - Concessao - ' + sMatriculaAux + '.log' ;

      // Efetua a Simulação para todos os prazos possíveis
      if not CtrlAutoEmprestimo.Concessao(sLoginAux, sSenhaAux, sMatriculaAux,
                                          iIdTipoContrato, fVlrSolicitado, iPrazo,
                                          iIdFornecedor, iCodAutoEmp,
                                          sBanco, sAgencia, sContaCorrente, sContrAQuitar,
                                          vResult ) then
         raise Exception.Create( CtrlAutoEmprestimo.sMsgErroAE );


      pgpResposta.HTMLDoc.Text := CtrlAutoEmprestimo.MontaResultConcessao( vResult, sContrAQuitar );

   except
      On E : Exception do
      begin
        pgpResposta.HTMLDoc.Text := TrataWebExcecoesAE( E, 'frmOutConcessao', Request );
      end;
   end;

   Response.Content := pgpResposta.Content;

   CtrlAutoEmprestimo.RemoveTempFile(vResult);
   DestroiSessao( sIdSessao );
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoAssinaContratoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sMatriculaAux, sLoginAux, sSenhaAux : string;
  iIdContratoPadrao : Integer;
  dDataAssinatura   : TDateTime;
  sNumContrato      : string;
begin
   try

      sLoginAux         := trim( Request.ContentFields.Values['vLoginMaster'] );
      sSenhaAux         := trim( Request.ContentFields.Values['vSenha'] );
      sMatriculaAux     := trim( Request.ContentFields.Values['vMatricula'] );
      iIdContratoPadrao := StrToInt(trim( Request.ContentFields.Values['vIdContratoPadrao'] ));
      sNumContrato      := trim( Request.ContentFields.Values['vNumContrato'] );
      dDataAssinatura   := StrToDate(trim( Request.ContentFields.Values['vDataAssinatura'] ));

      sNomeArqLog := sLogDir + 'AutoEmprestimo - Assinatura - ' + sMatriculaAux + '.log' ;

      // Registra assinatura de contrato padrão
      if not CtrlAutoEmprestimo.AssinaContr(sLoginAux, sSenhaAux, sMatriculaAux,
                                            iIdContratoPadrao, sNumContrato, dDataAssinatura ) then
         raise Exception.Create( CtrlAutoEmprestimo.sMsgErroAE );


      pgpResposta.HTMLDoc.Text := CtrlAutoEmprestimo.MontaResultAssinatura( Request );

   except
      On E : Exception do
      begin
        pgpResposta.HTMLDoc.Text := TrataWebExcecoesAE( E, 'frmOutAssinaContrato', Request );
      end;
   end;

   Response.Content := pgpResposta.Content;

   DestroiSessao( sIdSessao );
end;



procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoValidacaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sLoginAux, sSenhaAux : string;
  fCodAutoEmp, fIdContratoEmptmo : Extended;
begin
   try

      sLoginAux   := trim( Request.ContentFields.Values['vLoginMaster'] );
      sSenhaAux   := trim( Request.ContentFields.Values['vSenha'] );
      fCodAutoEmp := StrToFloat(trim( Request.ContentFields.Values['vCodAutoEmprestimo'] ));

      sNomeArqLog := sLogDir + 'AutoEmprestimo - Validacao - ' + sLoginAux + '.log' ;

      // Verifica registro de contrato
      fIdContratoEmptmo := CtrlAutoEmprestimo.ChecaAutoEmp(sLoginAux, sSenhaAux, fCodAutoEmp );

      pgpResposta.HTMLDoc.Text := CtrlAutoEmprestimo.MontaResultChecaAutoEmp( Request, fIdContratoEmptmo );

   except
      On E : Exception do
      begin
        pgpResposta.HTMLDoc.Text := TrataWebExcecoesAE( E, 'frmOutValidacao', Request );
      end;
   end;

   Response.Content := pgpResposta.Content;

   DestroiSessao( sIdSessao );
end;




procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoTestaAplicacaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  Response.Content := FormatDateTime( 'dd/mm/yy hh:nn:ss', Now ) +
   '<BR><H2>A aplicação está sendo executada pelo servidor web.</H2>' ;
end; {wmdlAutoAtendimentoTestaAplicacaoAction}



procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoSobreAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  i, iNumOcorr : integer;
  sConexao, sAux,
  sVersao       : String;
begin

  sNomeArqLog := sLogDir + 'AutoEmprestimo - Sobre.log' ;

  if cntConexao = cntADO then
    sConexao := 'ADO'
  else
    sConexao := 'BDE';

  with dtmModAutoAtendimento do
  begin
    cdsBpl.Close;
    cdsBpl.CreateDataset;

    CMResourceManager.ExeName := sPath + sNomeArqApl;
    CMResourceManager.ObterVersao;
    sVersao := CMResourceManager.Versao;

    iNumOcorr := CMResourceManager.RetornaBplsAssociadas;

    for i:= 0 to iNumOcorr-1 do begin
      cdsBpl.Insert;
      cdsBpl.FieldByName('BPL').AsString       := CMResourceManager.BplsAssociadas(i).BPL;
      cdsBpl.FieldByName('CAMINHO').AsString   := CMResourceManager.BplsAssociadas(i).Caminho;
      cdsBpl.FieldByName('DATA').AsDateTime    := CMResourceManager.BplsAssociadas(i).Data;
      cdsBpl.FieldByName('DESCRICAO').AsString := CMResourceManager.BplsAssociadas(i).Descricao;
      cdsBpl.FieldByName('VERSAO').AsString    := CMResourceManager.BplsAssociadas(i).Versao;
      cdsBpl.Post;
    end;
    cdsBpl.First;


    sAux :=
     '<html>                                                                      ' + CR +
     '  <head> <title>Auto-Empréstimo [Sobre...] </title> </head>                 ' + CR +
     '  </body>                                                                   ' + CR +
     '    <font face="Arial" size="20" color="darkred"> <b> <i>                   ' + CR +
     '      Auto-Empréstimo                                                       ' + CR +
     '    </font> </i> </b>                                                       ' + CR +
     '    <hr>                                                                    ' + CR +
     '    <font face="Verdana" size="2" color="black">                            ' + CR +
     '      <b>                                                                   ' + CR +
     '        Versão&nbsp;&nbsp;' + sVersao                                         + CR +
     '      </b>                                                                  ' + CR +
     '      <br><br><br>                                                          ' + CR +
     '      Direitos reservados a:                                                ' + CR +
     '      <br>                                                                  ' + CR +
     '      <b>CM Soluções Informática Ltda.</b>                                  ' + CR +
     '      <br>                                                                  ' + CR +
     '      Rua Victor Civita, 66 - Bl.2 - Ljs. 115 e 116 - Barra da Tijuca - Rio de Janeiro                        ' + CR +
     '      <br>                                                                  ' + CR +
     '      Telefone: (021) 3575-9100                                             ' + CR +
     '      <br>                                                                  ' + CR +
     '      <a href="http://www.cmsolucoes.com.br">www.cmsolucoes.com.br</a>      ' + CR +
     '      <br><br><br>                                                          ' + CR +
     '      Base: ' + sBase                                                         + CR +
     '      <br>                                                                  ' + CR +
     '      Id. da Interface: ' + IntToStr( iIdWebInterface )                       + CR +
     '      <br>                                                                  ' + CR +
     '      Tecnologia de acesso: ' + sConexao                                      + CR +
     '      <br>                                                                  ' + CR +
     '      Hora Atual: '+ FormatDateTime( 'dd/mm/yyyy hh:nn:ss', Now )             + CR +
     '      <br><br><br>                                                          ' + CR +
     '      Bilbliotecas:                                                         ' + CR +
     '      <table border="0" width="750" cellspacing="0" cellpadding="0" >       ' + CR +
     '        <tr>                                                                ' + CR +
     '          <td width="3"> </td>                                              ' + CR +
     '          <td width="210" bgcolor="silver"                                  ' + CR +
     '              style="border-right-style: solid; border-right-color: white"> ' + CR +
     '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
     '              BPL                                                           ' + CR +
     '            </font>                                                         ' + CR +
     '          </td>                                                             ' + CR +
     '          <td width="75" bgcolor="silver"                                   ' + CR +
     '              style="border-right-style: solid; border-right-color: white"> ' + CR +
     '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
     '              Versão                                                        ' + CR +
     '            </font>                                                         ' + CR +
     '          </td>                                                             ' + CR +
     '          <td width="82" bgcolor="silver"                                   ' + CR +
     '              style="border-right-style: solid; border-right-color: white"> ' + CR +
     '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
     '              Modificado                                                    ' + CR +
     '            </font>                                                         ' + CR +
     '          </td>                                                             ' + CR +
     '          <td width="190" bgcolor="silver"                                  ' + CR +
     '              style="border-right-style: solid; border-right-color: white"> ' + CR +
     '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
     '              Pasta                                                         ' + CR +
     '            </font>                                                         ' + CR +
     '          </td>                                                             ' + CR +
     '          <td width="190" bgcolor="silver"                                  ' + CR +
     '              style="border-right-style: solid; border-right-color: white"> ' + CR +
     '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
     '              Descrição                                                     ' + CR +
     '            </font>                                                         ' + CR +
     '          </td>                                                             ' + CR +
     '        </tr>                                                               ' + CR ;

    while not cdsBpl.Eof do
    begin
      sAux := sAux +
        '        <tr>                                                            ' + CR +
        '          <td> </td>                                                    ' + CR +
        '          <td>                                                          ' + CR +
        '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
        cdsBpl.FieldByName('BPL').AsString                                         + CR +
        '            </font>                                                     ' + CR +
        '          </td>                                                         ' + CR +
        '          <td>                                                          ' + CR +
        '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
        cdsBpl.FieldByName('VERSAO').AsString                                      + CR +
        '            </font>                                                     ' + CR +
        '          </td>                                                         ' + CR +
        '          <td>                                                          ' + CR +
        '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
        FormatDateTime( 'dd/mm/yyyy', cdsBpl.FieldByName('DATA').AsDateTime )      + CR +
        '            </font>                                                     ' + CR +
        '          </td>                                                         ' + CR +
        '          <td>                                                          ' + CR +
        '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
        Copy( cdsBpl.FieldByName('CAMINHO').AsString, 1, 22 ) + '...'                 + CR +
        '            </font>                                                     ' + CR +
        '          </td>                                                         ' + CR +
        '          <td>                                                          ' + CR +
        '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
        Copy( cdsBpl.FieldByName('DESCRICAO').AsString, 1, 22 ) + '...'               + CR +
        '            </font>                                                     ' + CR +
        '          </td>                                                         ' + CR +
        '        </tr>                                                           ' + CR ;
      cdsBpl.Next;
    end;

    sAux := sAux +
     '      </table border="0" width="100%" cellspacing="0" cellpadding="0" >     ' + CR +
     '    </font>                                                                 ' + CR +
     '  </body>                                                                   ' + CR +
     '</html>                                                                     ' ;

  end;

  Response.Content := sAux;
end; {wmdlAutoAtendimentoSobreAction}


//Pendência 27300 - 28/01/2008
procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoRemoveAssinaturaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sMatriculaAux, sLoginAux, sSenhaAux : string;
  sNumContrato      : string;
begin
   try

      sLoginAux         := trim( Request.ContentFields.Values['vLoginMaster'] );
      sSenhaAux         := trim( Request.ContentFields.Values['vSenha'] );
      sMatriculaAux     := trim( Request.ContentFields.Values['vMatricula'] );
      sNumContrato      := trim( Request.ContentFields.Values['vNumContrato'] );

      sNomeArqLog := sLogDir + 'AutoEmprestimo - Remove Assinatura - ' + sMatriculaAux + '.log' ;

      // Registra assinatura de contrato padrão
      if not CtrlAutoEmprestimo.RemoveAssinat(sLoginAux, sSenhaAux, sMatriculaAux, sNumContrato ) then
         raise Exception.Create( CtrlAutoEmprestimo.sMsgErroAE );

      pgpResposta.HTMLDoc.Text := CtrlAutoEmprestimo.MontaResultRemoveAssinat( Request );

   except
      On E : Exception do
      begin
        pgpResposta.HTMLDoc.Text := TrataWebExcecoesAE( E, 'frmOutRemoveAssinat', Request );
      end;
   end;

   Response.Content := pgpResposta.Content;

   DestroiSessao( sIdSessao );
end;
//Pendência 27300 - 28/01/2008


end.
