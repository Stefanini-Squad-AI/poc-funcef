{ Alterações                                                                   }
{*******************************************************************************
Analista.: Marcio Sanches Spinosa
Pendencia: SOL 182778 Kintana: 1710005
Rotina...: uCtrlGeraDprev
Descrição: Novos Ajustes na geração do Arquivo DPrev para assistidos pensionistas
*******************************************************************************
*******************************************************************************
Analista.: Claudio Faria
Pendencia: 25977
Rotina...: uCtrlGeraDprev
Descrição: Novos Ajustes na geração do Arquivo DPrev
*******************************************************************************
*******************************************************************************
Analista.: Claudio Faria
Pendencia: 23297 - 10/10/2006
Rotina...: uCtrlGeraDprev
Descrição: Criação da tela de exportação do arquivo DPrev
*******************************************************************************}

unit uCtrlGeraDprev;

interface

Uses uCmControlObject, DbClient, Sysutils, Classes, Dialogs, Controls, uSistema, uMensErro;

  Type
    TCtrlGeraDprev = Class(TCmControlObject)

  protected
    function ListaFundacao: OleVariant;
    function ListaPlanos: OleVariant;
    function ListaParticipantes(DtInicial, DtFinal:String): OleVariant;
    function ListaParticipantes2(Const DtInicial, DtFinal:String): OleVariant;
    function ListaPessoaFisisca(IdPessoa: String): OleVariant;
    function ListaBeneficioResgatado(IdPessoa, IdPessJur, IDPlanoPrev : String): OleVariant;

    function VerificaTipoGrau(sIdPessoa, sIdPlanoPrev: String):Integer;

    function GeraHeader:String;
    function GeraDadosIniciais(sAnoCalendario, sTipoDeclaracao,
                               sUltReciboRatificada, sPeriodoInicial,
                               sPeriodoFinal, sSitEspecial,
                               sDtSitEspecial:String): String;

    function GeraDadosCadastrais(sNomeEmpresarial, sNaurezaJuridica,
                                 sAtividadeEconomica, sTipoLogradouro,
                                 sLogradouro, sNumero, sComplemento,
                                 sBairro, sUF, sMunicipio, sCEP,
                                 sDDDTelefone, sTelefone, sDDDFax,
                                 sFAX, sCxPostal, sUFCxPostal,
                                 sCEPCxPostal, sEMail:String): String;

    function GeraDadosResponsavelxRepresentante(sNomeRepresentante, sCPFRepresentante,
                                                sDDDRepresentante, sTelefoneRepresentante,
                                                sRamalRepresentante, sDDDFAXRepresentante,
                                                sFAXRepresentante, sEMailRepresentante,
                                                sNomeResponsavel, sCPFResponsavel,
                                                sCRCResponsavel, sCRCUFResponsavel,
                                                sDDDResponsavel, sTelefoneResponsavel,
                                                sRamalResponsavel, sDDDFAXResponsavel,
                                                sFAXResponsavel, sEMailResponsavel:String): String;

    function GeraPlanos(sTipoPlano, sDtCriacaoPlano, sCodigoPlano:String):String;
    function GeraParticipantes(sTipoPlano, sCodigoPlano, sCPF,
                               sDtOcorrencia, sPortabilidade,
                               sCodigoOcorrencia, sIdPessoa,
                               sIdPlanoPrev,
                               sFlgInterno:String):String;

    function CriaArquivo(Arquivo:String):Boolean;
    function GravaLinha(Arquivo, Linha: String):Boolean;

    function Completa(sNome: String; iTam : integer):String;
    function CompletaZero(sNome: String; iTam : integer):String;
    function ParaNumerico(sValue:String):String;
  private
    cdsFundacao           : TClientDataSet;
    cdsPlanos             : TClientDataSet;
    cdsParticipantes      : TClientDataSet;
    cdsResponsavel        : TClientDataSet;
    cdsRepresentante      : TClientDataSet;
    cdsBeneficioResgatado : TClientDataSet;
    cdsAux                : TClientDataSet;

    procedure DoChangeDataBase; Override;
    function GeraParticipantes2: String;
    procedure GravarParticipantes(Const pArquivo : String);

  public
    Constructor Create; Override;
    Destructor  Destroy; Override;

    function ListaSitPlanoPrev:OleVariant;

    function ListaSitPart:OleVariant;

    function Exporta(Arquivo, idResponsavel, idRepresentante,
                     sAnoCalendario, sTipoDeclaracao,
                     sUltReciboRatificada, sPeriodoInicial,
                     sPeriodoFinal, sSitEspecial, sIDSitPart,  
                     sNaturezaJuridica, sCNAE,
                     sDtSitEspecial:String):Boolean;
  End;

implementation

Var ArqImporta : TextFile;

const
  sTerminador = ''; 

{ TCtrlGeraDprev }

constructor TCtrlGeraDprev.Create;
begin
  inherited;

  cdsFundacao           := TClientDataSet.Create(nil);
  cdsPlanos             := TClientDataSet.Create(nil);
  cdsParticipantes      := TClientDataSet.Create(nil);

  cdsResponsavel        := TClientDataSet.Create(nil);
  cdsRepresentante      := TClientDataSet.Create(nil);

  cdsBeneficioResgatado := TClientDataSet.Create(nil);

  cdsAux                := TClientDataSet.Create(nil); 
end;

destructor TCtrlGeraDprev.Destroy;
begin
  inherited;

  cdsFundacao.Free;
  cdsPlanos.Free;
  cdsParticipantes.free;

  cdsResponsavel.Free;
  cdsRepresentante.Free;

  cdsBeneficioResgatado.Free;

  cdsAux.Free; 
end;

procedure TCtrlGeraDprev.DoChangeDataBase;
begin
  inherited;
end;

{-----------------------------------------------------------}
{ Funções auxiliares para a execução da exportação - Ínicio }

function TCtrlGeraDprev.Completa(sNome: String; iTam: integer): String;
var
  i, k : integer;
  Espacos : string;
begin
   sNome   := trim(sNome);
   i       := length(sNome);
   Espacos := '';
   for k := 1 to (iTam - i) do
      Espacos := Espacos + ' ';

   Result := sNome + Espacos;
end;

function TCtrlGeraDprev.CompletaZero(sNome: String; iTam: integer): String;
var i, k : integer;
begin
  sNome  := trim(sNome);
  i      := length(sNome);
  Result := '';
  for k := 1 to (iTam - i) do
     Result := Result + '0';
  Result := Result + sNome;
end;

function TCtrlGeraDprev.CriaArquivo(Arquivo: String): Boolean;
begin
   Result := False;

   If FileExists(Arquivo) Then
     If MsgDlg('O arquivo ' + ExtractFileName(Arquivo) + ' já existe, ' + #13 +
               'deseja substituir esse arquivo?', 'IRRF', mtWarning, [mbYes, mbNo], 0) = mrYes then
       DeleteFile(Arquivo)
     Else
       Exit;  

   Try
     AssignFile(ArqImporta, Arquivo);
     Rewrite(ArqImporta);
     CloseFile(ArqImporta);

     Result := True;
   Except
     Result := False;
   End;
end;

function TCtrlGeraDprev.GravaLinha(Arquivo, Linha: String): Boolean;
begin
   Result := True;
   If Linha = '' Then Exit;

   AssignFile(ArqImporta, Arquivo);
   Append(ArqImporta);

   Write(ArqImporta, Linha);
   WriteLn(ArqImporta);

   CloseFile(ArqImporta);
end;

function TCtrlGeraDprev.ParaNumerico(sValue:String):String;
Var sFiltro:String;
    iCount:Integer;
Begin
   sFiltro := ' ()-.';

   For iCount := 1 to Length(sFiltro) do
     sValue := StringReplace( sValue, sFiltro[icount], '', [rfReplaceAll]);

   Try
     StrToInt64(sValue);
     Result := sValue;
   Except
     Result := '';
  end;
end;

{ Funções auxiliares para a execução da exportação - Fim }
{--------------------------------------------------------}

{---------------------------------------------------}
{ Query para retorna dados para exportação - Ínicio }

function TCtrlGeraDprev.ListaFundacao: OleVariant;
Var sSQL:String;
begin
  sSQL := ' SELECT P.RAZAOSOCIAL, P.NUMDOCUMENTO, P.EMAIL, F.CODFUNDSPC,          ' +
          '        E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP,        ' +
          ' 	   C.NOME AS MUNICIPIO, C.UF,                                     ' +
          ' 	   TD.DDD, TD.NUMERO AS NUMEROTEL, TF.DDD AS DDDFAX,              ' +
          '        TF.NUMERO AS NUMEROFAX                                         ' +
          ' FROM FUNDACAO   F,                                                    ' +
          '      PESSOA     P,                                                    ' +
          ' 	 ENDPESS    E,                                                    ' +
          ' 	 CIDADES    C,                                                    ' +
          ' 	 ( SELECT IDENDERECO, NUMERO,DDD                                  ' +
          ' 	  FROM TELENDPESS WHERE TIPO Like ''%C%'' ) TD,                   ' +
          ' 	 ( SELECT IDENDERECO, NUMERO,DDD                                  ' +
          ' 	  FROM TELENDPESS WHERE TIPO Like ''%F%'' ) TF                    ' +
          ' WHERE ( F.IDPESSOA       = P.IDPESSOA )                               ' +
          '   AND ( P.IDPESSOA       = E.IDPESSOA )                               ' +
          '   AND ( P.IDENDCOMERCIAL = E.IDENDERECO )                             ' +
          '   AND ( E.IDCIDADES      = C.IDCIDADES )                              ' +
          '   AND ( E.IDENDERECO     = TD.IDENDERECO(+) )                         ' +
          '   AND ( E.IDENDERECO     = TF.IDENDERECO(+) )                         ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlGeraDprev.ListaPessoaFisisca(IdPessoa: String): OleVariant;
Var
  Ssql : string;
begin
  Ssql := ' SELECT P.RAZAOSOCIAL, P.NUMDOCUMENTO,                                                ' +
          '        EN.LOGRADOURO AS ENDEREO,  P.TIPO, P.EMAIL,                                   ' +
          '        EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO, EN.CEP,                               ' +
          '        REPLACE(REPLACE(REPLACE(TF.NUMERO, ''-''), ''(''), '')'') AS FAX,             ' +
          '        REPLACE(REPLACE(REPLACE(TD.NUMERO, ''-''), ''(''), '')'') AS TELEFONE, TD.DDD ' +
          ' FROM  PESSOA   P,                                                                    ' +
          '       ENDPESS EN,                                                                    ' +
          '       CIDADES  C,                                                                    ' +
          '       ESTADO  ES,                                                                    ' +
          '       ( SELECT IDENDERECO, NUMERO, DDD FROM TELENDPESS WHERE TIPO LIKE ''%P%'' ) TD, ' +
          '       ( SELECT IDENDERECO, NUMERO, DDD FROM TELENDPESS WHERE TIPO LIKE ''%F%'' ) TF  ' +
          ' WHERE ( P.IDPESSOA       = ' + IdPessoa + ' )                                        ' +
          '   AND ( EN.IDENDERECO(+) = P.IDENDRESIDENCIAL )                                      ' +
          '   AND ( EN.IDCIDADES     = C.IDCIDADES(+) )                                          ' +
          '   AND ( ES.IDESTADO(+)   = C.IDESTADO )                                              ' +
          '   AND ( EN.IDPESSOA(+)   = P.IDPESSOA )                                              ' +
          '   AND ( EN.IDENDERECO    = TD.IDENDERECO(+) )                                        ' +
          '   AND ( EN.IDENDERECO    = TF.IDENDERECO(+) )                                        ';
          
  Result := GetDataPacket(Ssql);
End;

function TCtrlGeraDprev.ListaPlanos: OleVariant;
Var sSQL:String;
begin
  sSQL := 'SELECT DISTINCT PL.CODIGOSPC, DATACRIACAO ' +  
          'FROM PARTPREVPLAN PP,                     ' +
          '     PLANPREV     PL                      ' +
          'WHERE PP.IDPLANOPREV = PL.IDPLANOPREV     ' +
          '  AND TIPOOPCAOIR = 2                     ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlGeraDprev.ListaParticipantes(DtInicial, DtFinal:String): OleVariant;
Var sSQL:String;
begin
  sSQL := ' SELECT DISTINCT                                                            ' +
          '        P.NUMDOCUMENTO,                                                     ' +
          '        PP.DATACANCELAMENTO,                                                ' +
          '        PP.INSCRICAODATA,                                                   ' +
          '        PP.IDPESSOA,                                                        ' +
          '        PP.INSCRICAODATA,                                                   ' +
          '        BF.DATAINICIO,                                                      ' +
          '        PL.CODIGOSPC,                                                       ' +
          '        PL.IDPLANOPREV,                                                     ' +
          '        PP.IDSITPLANOPREV,                                                  ' +
          '        PP.IDSITPART,                                                       ' +
          '        SP.FLGINTERNO                                                       ' +
          ' FROM PARTPREVPLAN PP,                                                      ' +
          '      PESSOA       P,                                                       ' +
          '      PLANPREV     PL,                                                      ' +
          '      SITPART      SP,                                                      ' +
          '      ( SELECT IDPLANOPREV, IDPESSJUR, IDPESSOA, DATAINICIO                 ' +
          '        FROM BENEFBFCIARIO                                                  ' +
          '        WHERE ( (DATAFINAL IS NULL) OR (DATAFINAL > SYSDATE) )              ' +
          '        AND ( IDSITBENEFICIO IN (1, 2) ) ) BF                               ' +
          ' WHERE ( P.IDPESSOA        = PP.IDPESSOA )                                  ' +
          '   AND ( PP.IDPLANOPREV    = PL.IDPLANOPREV )                               ' +
          '   AND ( SP.IDSITPART      = PP.IDSITPART )                                 ' +
          '   AND ( PP.TIPOOPCAOIR    = 2 )                                            ' +
          '   AND ( PP.IDPESSOA       = BF.IDPESSOA(+) )                               ' +
          '   AND ( PP.IDPESSJUR      = BF.IDPESSJUR(+) )                              ' +
          '   AND ( PP.IDPLANOPREV    = BF.IDPLANOPREV(+) )                            ' +
          '   AND ( PP.FLGDESATIVADO  = 0 )                                            ' +
          '   AND ( P.IDPESSOA NOT IN ( SELECT BB.IDPESSOA                             ' +
          '                             FROM BENEFICIO B,                              ' +
          '                                  BENEFBFCIARIO BB                          ' +
          '                             WHERE (B.IDBENEFICIO     = BB.IDBENEFICIO )    ' +
          '                               AND (B.FLGRESGATE      = 1 )                 ' +
          '                               AND (BB.IDSITBENEFICIO = 3 )                 ' +
          '                               AND (BB.IDPLANOPREV    = PP.IDPESSOA)        ' +
          '                               AND (BB.IDTITULAR      = PP.IDPESSJUR)       ' +
          '                               AND (BB.IDPESSJUR      = PP.IDPLANOPREV) ) ) ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlGeraDprev.ListaBeneficioResgatado(IdPessoa, IdPessJur,
  IDPlanoPrev: String): OleVariant;
Var sSQL : String;
begin
  sSQL := ' SELECT 1                                        ' +
          ' FROM BENEFICIO B,                               ' +
          '      BENEFBFCIARIO BF                           ' +
          ' WHERE (B.IDBENEFICIO     = BF.IDBENEFICIO )     ' +
          '   AND (B.FLGRESGATE      = 1 )                  ' +
          '   AND (BF.IDSITBENEFICIO = 3 )                  ' +
          '   AND (IDPLANOPREV       = ' + IdPessoa    + ') ' +
          '   AND (IDTITULAR         = ' + IdPessJur   + ') ' +
          '   AND (IDPESSJUR         = ' + IDPlanoPrev + ') ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlGeraDprev.VerificaTipoGrau(sIdPessoa, sIdPlanoPrev: String): Integer;
Var sSQL : String;
begin
  Result := 0;

  sSQL := 'SELECT P.NUMEROPROCESSO                                                      ' +
          'FROM PROCESSOBENEF P,                                                        ' +
          '     BENEFBFCIARIO BB,                                                       ' +
          '     EVENTOGERADOR E,                                                        ' +
          '     BENEFICIO     B                                                         ' +
          'WHERE (BB.IDPESSOA       = ' + sIdPessoa    + ' )                            ' +
          '  AND (BB.IDPLANOPREV    = ' + sIdPlanoPrev + ' )                            ' +
          '  AND (P.NUMEROPROCESSO  = BB.NUMEROPROCESSO)                                ' +
          '  AND (BB.IDBENEFICIO    = B.IDBENEFICIO)                                    ' +
          '  AND (B.FLGRESGATE      = 1)                                                ' +
          '  AND (BB.IDSITBENEFICIO = 3)                                                ' +
          '  AND (E.IDEVENTOGERADOR = P.IDEVENTOGERADOR)                                ' +
          '  AND (E.FLGINTERNO      IN (''DC'', ''DS'', ''CP'', ''CI'', ''CD'', ''DE''))';

  cdsAux.Data := GetDataPacket(sSQL);

  If Not cdsAux.IsEmpty Then
  Begin
    sSQL := 'SELECT RES.IDTIPORESERVA, RES.VALORRESERVA   ' +
            'FROM RESERVAPART   RES,                      ' +
            '     RESERVAXPLANO RXP                       ' +
            'WHERE RES.IDTIPORESERVA = RXP.IDTIPORESERVA  ' +
            '  AND RES.IDPLANOPREV   = RXP.IDPLANOPREV    ' +
            '  AND RXP.FLGCONTROLE   = 0                  ' +
            '  AND RES.VALORRESERVA  > 0                  ' +
            '  AND RES.IDPLANOPREV   = ' + sIdPlanoPrev +
            '  AND RES.IDPESSOA      = ' + sIdPessoa    + '  ';

    cdsAux.Data := GetDataPacket(sSQL);

    If Not cdsAux.IsEmpty Then
      Result := 1
    Else
      Result := 2
  End;
end;

function TCtrlGeraDprev.ListaSitPlanoPrev: OleVariant;
Var sSQL : String;
begin
  sSQL := ' SELECT IDSITPLANOPREV, DESCRICAO FROM SITPLANOPREV ';
          
  Result := GetDataPacket(sSQL);
end;

function TCtrlGeraDprev.ListaSitPart: OleVariant;
Var sSQL : String;
begin
  sSQL := ' SELECT IDSITPART, DESCRICAO FROM SITPART ';

  Result := GetDataPacket(sSQL);
end;

{ Query para retorna dados para exportação - Fim    }
{---------------------------------------------------}

{-----------------------------------------------------}
{ Geração do Layout do arquivo de exportação - Ínicio }

function TCtrlGeraDprev.GeraHeader: String;
Var sLinha:String;
begin
  { Gerando Linhas }
  sLinha := 'DPREV';                    // Constante 'DPREV'
  sLinha := sLinha + Completa('', 369); // Completa com brancos
  sLinha := sLinha + sTerminador;       // Terminador

  Result := sLinha;
end;

function TCtrlGeraDprev.GeraDadosIniciais(sAnoCalendario, sTipoDeclaracao,
                                          sUltReciboRatificada, sPeriodoInicial,
                                          sPeriodoFinal, sSitEspecial,
                                          sDtSitEspecial:String):String;
Var sLinha, sCNPJ : String;
begin
  { Inicializando variáveis }
  sCNPJ := Sistema.NumDocEmpresa;

  { Preparando informações }

  If ( sSitEspecial = '00' ) Then
    sDtSitEspecial := CompletaZero( '', 8 );

  sPeriodoInicial := StringReplace( sPeriodoInicial, '/', '', [rfReplaceAll] );
  sPeriodoFinal   := StringReplace( sPeriodoFinal  , '/', '', [rfReplaceAll] );

  { Gerando Linhas }

  sLinha := 'F1';                                            // Constante 'F1'
  sLinha := sLinha + sCNPJ;                                  // CNPJ Declarante
  sLinha := sLinha + sAnoCalendario;                         // Ano-Calendário
  sLinha := sLinha + sTipoDeclaracao;                        // Tipo de Declaração
  sLinha := sLinha + sSitEspecial;                           // Situação Especial
  sLinha := sLinha + sDtSitEspecial;                         // Data Evento Situação Especial
  sLinha := sLinha + CompletaZero(sUltReciboRatificada, 10); // Nº recibo da ùlt declaração
  sLinha := sLinha + sPeriodoInicial;                        // Data periodo inicial
  sLinha := sLinha + sPeriodoFinal;                          // Data periodo final
  sLinha := sLinha + Completa('', 10);                       // Completa com brancos
  sLinha := sLinha + sTerminador;                            // Terminador

  Result := sLinha;
end;

function TCtrlGeraDprev.GeraDadosCadastrais(sNomeEmpresarial, sNaurezaJuridica,
                                            sAtividadeEconomica, sTipoLogradouro,
                                            sLogradouro, sNumero, sComplemento,
                                            sBairro, sUF, sMunicipio, sCEP,
                                            sDDDTelefone, sTelefone, sDDDFax,
                                            sFAX, sCxPostal, sUFCxPostal,
                                            sCEPCxPostal, sEMail:String): String;
Var sLinha:String;
begin
  Case Sistema.TipoCliente of
     19991: sMunicipio := '9701'; //Brasília
     20011: sMunicipio := '9701'; //Brasília
     19981: sMunicipio := '5925'; //Volta Redonda
     19971: sMunicipio := '6001'; //Rio de Janeiro
  End;

  { Gerando Linhas }
  sLinha := 'F2';                                             // Constante 'F2'
  sLinha := sLinha + completa(sNomeEmpresarial, 150);         // Nome Empresarial
  sLinha := sLinha + CompletaZero(sNaurezaJuridica, 4);       // Natureza Juridica
  sLinha := sLinha + CompletaZero(sAtividadeEconomica, 7);    // AtividadeEconomica
  sLinha := sLinha + Completa(sTipoLogradouro, 20);           // Tipo Logradouro
  sLinha := sLinha + Completa(sLogradouro, 150);              // Logradouro
  sLinha := sLinha + Completa(sNumero, 6);                    // Número
  sLinha := sLinha + Completa(sComplemento, 50);              // Complemento
  sLinha := sLinha + Completa(sBairro, 50);                   // Bairro
  sLinha := sLinha + Completa(sUF, 2);                        // UF
  sLinha := sLinha + Completa(sMunicipio, 50);                // Municícpio
  sLinha := sLinha + CompletaZero(sCEP, 8);                   // CEP
  sLinha := sLinha + Completa(ParaNumerico(sDDDTelefone), 4); // DDD do Telefone
  sLinha := sLinha + Completa(ParaNumerico(sTelefone), 8);    // Telefone
  sLinha := sLinha + Completa(ParaNumerico(sDDDFax), 4);      // DDD do FAX
  sLinha := sLinha + Completa(ParaNumerico(sFAX), 8);         // FAX
  sLinha := sLinha + Completa(sCxPostal, 6);                  // Caixa Postal
  sLinha := sLinha + Completa(sUFCxPostal, 2);                // UF da Caixa Postal
  sLinha := sLinha + Completa(sCEPCxPostal, 8);               // CEP da Caixa Postal
  sLinha := sLinha + Completa(sEMail, 115);                   // Correio Eletrônico
  sLinha := sLinha + Completa('', 10);                        // Reservado (Brancos)
  sLinha := sLinha + sTerminador;                             // Terminador

  Result := sLinha;
end;

function TCtrlGeraDprev.GeraDadosResponsavelxRepresentante(sNomeRepresentante, sCPFRepresentante,
                                                           sDDDRepresentante, sTelefoneRepresentante,
                                                           sRamalRepresentante, sDDDFAXRepresentante,
                                                           sFAXRepresentante, sEMailRepresentante,
                                                           sNomeResponsavel, sCPFResponsavel,
                                                           sCRCResponsavel, sCRCUFResponsavel,
                                                           sDDDResponsavel, sTelefoneResponsavel,
                                                           sRamalResponsavel, sDDDFAXResponsavel,
                                                           sFAXResponsavel, sEMailResponsavel:String): String;
Var sLinha:String;
begin

  { Gerando Linhas }
  sLinha := 'F3';
  sLinha := sLinha + Completa(sNomeRepresentante, 60);                  // Nome do Representante
  sLinha := sLinha + Completa(sCPFRepresentante, 11);                   // CPF do Representante
  sLinha := sLinha + Completa(ParaNumerico(sDDDRepresentante), 4);      // DDD do Representante
  sLinha := sLinha + Completa(ParaNumerico(sTelefoneRepresentante), 8); // Telefone do Representante
  sLinha := sLinha + Completa(ParaNumerico(sRamalRepresentante), 5);    // Ramal do Representante
  sLinha := sLinha + Completa(ParaNumerico(sDDDFAXRepresentante), 4);   // DDD FAX do Representante
  sLinha := sLinha + Completa(ParaNumerico(sFAXRepresentante), 8);      // FAX do Representante
  sLinha := sLinha + Completa(sEMailRepresentante, 40);                 // Correio Eletrônico Representante
  sLinha := sLinha + Completa(sNomeResponsavel, 60);                    // Nome do Responsável
  sLinha := sLinha + Completa(sCPFResponsavel, 11);                     // CPF do Responsável
  sLinha := sLinha + Completa(sCRCResponsavel, 15);                     // CRC do Responsável
  sLinha := sLinha + Completa(sCRCUFResponsavel, 2);                    // UF do CRC do Responsável
  sLinha := sLinha + Completa(ParaNumerico(sDDDResponsavel), 4);        // DDD do Responsável
  sLinha := sLinha + Completa(ParaNumerico(sTelefoneResponsavel), 8);   // Telefone do Responsável
  sLinha := sLinha + Completa(ParaNumerico(sRamalResponsavel), 5);      // Ramal do Responsável
  sLinha := sLinha + Completa(ParaNumerico(sDDDFAXResponsavel), 4);     // DDD FAX do Responsável
  sLinha := sLinha + Completa(ParaNumerico(sFAXResponsavel), 8);        // FAX do Responsável
  sLinha := sLinha + Completa(sEMailResponsavel, 40);                   // Correio Eletrônico do Responsável
  sLinha := sLinha + Completa('', 10);                                  // Reservado (Brancos)
  sLinha := sLinha + sTerminador;                                       // Terminador

  Result := sLinha
end;

function TCtrlGeraDprev.GeraPlanos(sTipoPlano, sDtCriacaoPlano, sCodigoPlano:String): String;
Var sLinha :String;
begin
  { Preparando informações }
  sDtCriacaoPlano := StringReplace( sDtCriacaoPlano, '/', '', [rfReplaceAll] );
  sCodigoPlano    := StringReplace( sCodigoPlano,    '-', '', [rfReplaceAll] );

  { Gerando Linhas }
  sLinha := 'F4';
  sLinha := sLinha + CompletaZero(sTipoPlano, 1);  // Tipo de Plano
  sLinha := sLinha + Completa(sDtCriacaoPlano, 8); // Data da Criação do Plano
  sLinha := sLinha + Completa(sCodigoPlano, 17);   // Código do Plano
  sLinha := sLinha + Completa('', 10);             // Reservado (Brancos)
  sLinha := sLinha + sTerminador;                  // Terminador

  Result := sLinha;
end;


function TCtrlGeraDprev.GeraParticipantes(sTipoPlano, sCodigoPlano, sCPF,
                                          sDtOcorrencia, sPortabilidade,
                                          sCodigoOcorrencia, sIdPessoa,
                                          sIdPlanoPrev,
                                          sFlgInterno:String): String;
Var sLinha, sEvento, sGrau, sOcorrencia:String;
begin
  sLinha := '';
  {-----------------------------------------------------------------------------}
  { Obs.:                                                                       }
  {   Deverá ser criada uma pendência para tratar os itens Portabilidade e Grau }
  {-----------------------------------------------------------------------------}

  { Preparando informações }

  If ( StrToDate(sDtOcorrencia) <= StrToDate('31/12/2004') ) AND
     ( ( sFlgInterno = 'CA' ) or ( sFlgInterno = 'AS') ) Then
  Begin
     sLinha := '';
     Exit;
  End;

  { -- Eventos -- }
  sEvento := '0';

  If sFlgInterno = 'CA' Then sEvento := '1';

  If sFlgInterno = 'AS' Then sEvento := '2';

  If ( StrToDate(sDtOcorrencia) <= StrToDate('31/12/2004') ) AND
     ( sFlgInterno <> 'CA' ) AND ( sFlgInterno <> 'AS' ) Then
  Begin
     sEvento := '3';
     sDtOcorrencia := '01/01/2005';
  End;

  { -- Portabilidade -- }

  If sPortabilidade = '' Then sPortabilidade := '2';

  If ( sEvento = '2' ) OR ( sEvento = '3' ) Then sPortabilidade := '0';

  sOcorrencia := sEvento + sPortabilidade + '0';

  If (sCodigoOcorrencia = '') and (sPortabilidade = '1') Then sCodigoOcorrencia := CompletaZero(sCodigoOcorrencia, 17);

  { -- Grau -- }

  If ( sEvento = '0' ) OR
     ( sEvento = '2' ) OR
     ( sEvento = '3' ) Then
    sGrau := '0'
  Else
  Begin
    sGrau := IntToStr(VerificaTipoGrau(sIDPessoa, sIDPlanoPrev));

    If sGrau = '0' Then Exit;
  End;

  sOcorrencia := sEvento + sPortabilidade + sGrau;

  { -- Ocorrencia -- }

  sDtOcorrencia := StringReplace( sDtOcorrencia, '/', '', [rfReplaceAll] );

  { Gerando Linhas }
  sLinha := 'F5';
  sLinha := sLinha + Completa(sTipoPlano, 1);         // Tipo de Plano
  sLinha := sLinha + Completa(sCodigoPlano, 17);      // Código do Plano
  sLinha := sLinha + Completa(sCPF, 11);              // CPF do Participante
  sLinha := sLinha + CompletaZero(sOcorrencia, 3);    // Ocorrência
  sLinha := sLinha + CompletaZero(sDtOcorrencia, 8);  // Data da Ocorrência
  sLinha := sLinha + Completa(sCodigoOcorrencia, 17); // Código do Plano no caso de
                                                      // ingresso ou saída com portabilidade
  sLinha := sLinha + Completa('', 10);                // Reservado (Brancos)
  sLinha := sLinha + sTerminador;                     // Terminador

  Result := sLinha;
end;

{ Geração do Layout do arquivo de exportação - Fim }
{--------------------------------------------------}


function TCtrlGeraDprev.Exporta(Arquivo, idResponsavel, idRepresentante,
                                sAnoCalendario, sTipoDeclaracao,
                                sUltReciboRatificada, sPeriodoInicial,
                                sPeriodoFinal, sSitEspecial, sIDSitPart,
                                sNaturezaJuridica, sCNAE,
                                sDtSitEspecial:String): Boolean;
Var Ano:Integer;
    sData, sPortabilidade:String;
begin
   If CriaArquivo( Arquivo ) Then
   Begin
      cdsFundacao.Data      := ListaFundacao;
      cdsPlanos.Data        := ListaPlanos;
      // cdsParticipantes.Data := ListaParticipantes(sPeriodoInicial, sPeriodoFinal);
      cdsParticipantes.Data := ListaParticipantes2(sPeriodoInicial,sPeriodoFinal);

      cdsRepresentante.Data := ListaPessoaFisisca(idRepresentante);
      cdsResponsavel.Data   := ListaPessoaFisisca(idResponsavel);

      GravaLinha( Arquivo, GeraHeader );

      GravaLinha( Arquivo, GeraDadosIniciais( sAnoCalendario, sTipoDeclaracao,
                                              sUltReciboRatificada, sPeriodoInicial,
                                              sPeriodoFinal, sSitEspecial,
                                              sDtSitEspecial ) );

      GravaLinha( Arquivo, GeraDadosCadastrais( cdsFundacao.FieldByName('RAZAOSOCIAL').AsString,
                                                sNaturezaJuridica, sCNAE, 'Outros',
                                                cdsFundacao.FieldByName('LOGRADOURO').AsString,
                                                cdsFundacao.FieldByName('NUMERO').AsString,
                                                cdsFundacao.FieldByName('COMPLEMENTO').AsString,
                                                cdsFundacao.FieldByName('BAIRRO').AsString,
                                                cdsFundacao.FieldByName('UF').AsString,
                                                cdsFundacao.FieldByName('MUNICIPIO').AsString,
                                                cdsFundacao.FieldByName('CEP').AsString,
                                                cdsFundacao.FieldByName('DDD').AsString,
                                                cdsFundacao.FieldByName('NUMEROTEL').AsString,
                                                cdsFundacao.FieldByName('DDDFAX').AsString,
                                                cdsFundacao.FieldByName('NUMEROFAX').AsString,
                                                '', '', '',
                                                cdsFundacao.FieldByName('EMAIL').AsString ) );

      GravaLinha( Arquivo, GeraDadosResponsavelxRepresentante( cdsRepresentante.FieldByName('RAZAOSOCIAL').AsString,
                                                               cdsRepresentante.FieldByName('NUMDOCUMENTO').AsString,
                                                               cdsRepresentante.FieldByName('DDD').AsString,
                                                               cdsRepresentante.FieldByName('TELEFONE').AsString,
                                                               '',
                                                               cdsRepresentante.FieldByName('DDD').AsString,
                                                               cdsRepresentante.FieldByName('FAX').AsString,
                                                               cdsRepresentante.FieldByName('EMAIL').AsString,
                                                               cdsResponsavel.FieldByName('RAZAOSOCIAL').AsString,
                                                               cdsResponsavel.FieldByName('NUMDOCUMENTO').AsString,
                                                               '', '',
                                                               cdsResponsavel.FieldByName('DDD').AsString,
                                                               cdsResponsavel.FieldByName('TELEFONE').AsString,
                                                               '',
                                                               cdsResponsavel.FieldByName('DDD').AsString,
                                                               cdsResponsavel.FieldByName('FAX').AsString,
                                                               cdsResponsavel.FieldByName('EMAIL').AsString ) );

      cdsPlanos.First;
      While not cdsPlanos.EOF do
      Begin
         GravaLinha( Arquivo, GeraPlanos( '2',
                                          cdsPlanos.FieldByName('DATACRIACAO').AsString,
                                          cdsPlanos.FieldByName('CODIGOSPC').AsString ) );

         cdsPlanos.Next;
      End;

      GravarParticipantes( Arquivo );

      {*
      cdsParticipantes.First;
      While not cdsParticipantes.EOF do
      Begin
         sPortabilidade := '2';

        // Ativo
        If sAnoCalendario = '2005' Then
        Begin
            If Copy(cdsParticipantes.FieldByName('INSCRICAODATA').AsString, 7, 4) <= sAnoCalendario Then
               GravaLinha( Arquivo, GeraParticipantes( '2',
                                                       cdsParticipantes.FieldByName('CODIGOSPC').AsString,
                                                       cdsParticipantes.FieldByName('NUMDOCUMENTO').AsString,
                                                       cdsParticipantes.FieldByName('INSCRICAODATA').AsString,
                                                       sPortabilidade, '',
                                                       cdsParticipantes.FieldByName('IDPessoa').AsString,
                                                       cdsParticipantes.FieldByName('IDPlanoPrev').AsString,
                                                       'AT' ) )
        End
        Else
        Begin
            If Copy(cdsParticipantes.FieldByName('INSCRICAODATA').AsString, 7, 4) = sAnoCalendario Then
               GravaLinha( Arquivo, GeraParticipantes( '2',
                                                       cdsParticipantes.FieldByName('CODIGOSPC').AsString,
                                                       cdsParticipantes.FieldByName('NUMDOCUMENTO').AsString,
                                                       cdsParticipantes.FieldByName('INSCRICAODATA').AsString,
                                                       sPortabilidade, '',
                                                       cdsParticipantes.FieldByName('IDPessoa').AsString,
                                                       cdsParticipantes.FieldByName('IDPlanoPrev').AsString,
                                                       'AT' ) )
        End;

         // Assistido
         If Copy(cdsParticipantes.FieldByName('DATAINICIO').AsString, 7, 4) = sAnoCalendario Then
            GravaLinha( Arquivo, GeraParticipantes( '2',
                                                    cdsParticipantes.FieldByName('CODIGOSPC').AsString,
                                                    cdsParticipantes.FieldByName('NUMDOCUMENTO').AsString,
                                                    cdsParticipantes.FieldByName('DATAINICIO').AsString,
                                                    sPortabilidade, '',
                                                  cdsParticipantes.FieldByName('IDPessoa').AsString,
                                                  cdsParticipantes.FieldByName('IDPlanoPrev').AsString,
                                                    'AS' ) );

         // Cancelado
        If cdsParticipantes.FieldByName('IDSITPART').AsString = sIDSitPart Then
            sPortabilidade := '1';

         If Copy(cdsParticipantes.FieldByName('DATACANCELAMENTO').AsString, 7, 4) = sAnoCalendario Then
            GravaLinha( Arquivo, GeraParticipantes( '2',
                                                    cdsParticipantes.FieldByName('CODIGOSPC').AsString,
                                                    cdsParticipantes.FieldByName('NUMDOCUMENTO').AsString,
                                                    cdsParticipantes.FieldByName('DATACANCELAMENTO').AsString,
                                                    sPortabilidade, '',
                                                    cdsParticipantes.FieldByName('IDPessoa').AsString,
                                                    cdsParticipantes.FieldByName('IDPlanoPrev').AsString,
                                                    'CA' ) );

         cdsParticipantes.Next;
      End;
      *}

   End;
end;

procedure TCtrlGeraDprev.GravarParticipantes( Const pArquivo : String );
begin
  cdsParticipantes.First;
  While not cdsParticipantes.EOF do
  Begin
    GravaLinha( pArquivo, GeraParticipantes2() );
    cdsParticipantes.Next;
  end;
end;

function TCtrlGeraDprev.GeraParticipantes2(): String;
begin
  Result := cdsParticipantes.FieldByName('TEXTO').asString + sTerminador;
end;


function TCtrlGeraDprev.ListaParticipantes2(const DtInicial, DtFinal: String): OleVariant;
var sSql : TStringList;
begin
  sSql := TStringList.Create;

  sSql.Text :=  '/* INGRESSOS e SALDADOS – As datas abaixo deverão ser preenchidas pelo usuário no momento da geração do arquivo */' + #13#10 +
                'SELECT DISTINCT RPAD(''F52'' || RPAD(pl.codigospc, 17, '' '') ||' + #13#10 +
                '                     LPAD(p.numdocumento, 11, ''0'') || ''020'' ||' + #13#10 +
                '                     TO_CHAR(geral.dataregistro, ''DDMMYYYY''),' + #13#10 +
                '                     69,' + #13#10 +
                '                     '' '') texto' + #13#10 +
                '  FROM pessoa p,' + #13#10 +
                '       elegpatro e,' + #13#10 +
                '       partprevplan pp,' + #13#10 +
                '       planprev pl,' + #13#10 +
                '       (SELECT DISTINCT e.matricula,' + #13#10 +
                '                        e.idpessjur,' + #13#10 +
                '                        p.nome,' + #13#10 +
                '                        p.numdocumento cpf,' + #13#10 +
                '                        DECODE(PP.idplanoprev, 66, ''REB'', ''NOVOPLANO'') plano,' + #13#10 +
                '                        PP.DATAOPCAOIR dataregistro,' + #13#10 +
                '                        pp.idplanoprev' + #13#10 +
                '          FROM elegpatro e,' + #13#10 +
                '               pessoa p,' + #13#10 +
                '               partprevplan pp,' + #13#10 +
                '               (SELECT P.NUMDOCUMENTO CPF,' + #13#10 +
                '                       MIN(PP.DATAOPCAOIR) INSCRICAODATA,' + #13#10 +
                '                       IDPLANOPREV' + #13#10 +
                '                  FROM PESSOA P, PARTPREVPLAN PP' + #13#10 +
                '                 WHERE P.IDPESSOA = PP.IDPESSOA' + #13#10 +
                '                   AND PP.TIPOOPCAOIR = 2' + #13#10 +
                '                   AND PP.DATAOPCAOIR BETWEEN' + #13#10 +
                '                       TO_DATE('+QuotedStr(dtInicial)+', ''dd/mm/yyyy'') AND' + #13#10 +
                '                       TO_DATE('+QuotedStr(dtFinal)+  ', ''dd/mm/yyyy'')' + #13#10 +
                '                  /* AND NOT EXISTS (SELECT 1' + #13#10 +
                '                          FROM PARTPREVPLAN PL' + #13#10 +
                '                         WHERE PL.IDPESSOA = PP.IDPESSOA' + #13#10 +
                '                           AND PL.IDPESSJUR = PP.IDPESSJUR' + #13#10 +
                '                           AND PL.IDSITPLANOPREV = 25) */' + #13#10 +
                '                 GROUP BY NUMDOCUMENTO, IDPLANOPREV) U' + #13#10 +
                '         WHERE p.idpessoa = e.idpessoa' + #13#10 +
                '           AND e.idpessoa = pp.idpessoa' + #13#10 +
                '           AND e.idpessjur = pp.idpessjur' + #13#10 +
                '           AND pp.tipoopcaoir = 2' + #13#10 +
                '           AND PP.IDPESSOA NOT IN (1152759)' + #13#10 +
                '           AND P.NUMDOCUMENTO = U.CPF' + #13#10 +
                '           AND PP.IDPLANOPREV = U.IDPLANOPREV' + #13#10 +
                '           AND PP.DATAOPCAOIR = U.INSCRICAODATA' + #13#10 +
                '        UNION' + #13#10 +
                '        SELECT --p.idpessoa,' + #13#10 +
                '         e.matricula,' + #13#10 +
                '         e.idpessjur,' + #13#10 +
                '         p.nome,' + #13#10 +
                '         p.numdocumento cpf,' + #13#10 +
                '         ''SALDADO'' plano,' + #13#10 +
                '         PP.DATAOPCAOIR DATAREGISTRO,' + #13#10 +
                '         pp.idplanoprev' + #13#10 +
                '          FROM elegpatro e, pessoa p, partprevplan pp' + #13#10 +
                '         WHERE p.idpessoa = e.idpessoa' + #13#10 +
                '           AND e.idpessoa = pp.idpessoa' + #13#10 +
                '           AND e.idpessjur = pp.idpessjur' + #13#10 +
                '           AND PP.IDPLANOPREV = 74' + #13#10 +
                '           AND PP.TIPOOPCAOIR = 2' + #13#10 +
                '           AND PP.DATAOPCAOIR BETWEEN TO_DATE('+QuotedStr(dtInicial)+', ''DD/MM/RRRR'') AND TO_DATE('+QuotedStr(dtFinal)+', ''DD/MM/RRRR'')' + #13#10 +
                '           AND EXISTS (SELECT 1' + #13#10 +
                '                  FROM eventosprev ev' + #13#10 +
                '                 WHERE ev.idpessoa = pp.idpessoa' + #13#10 +
                '                   AND ev.idpessjur = pp.idpessjur' + #13#10 +
                '                   AND ev.ideventogerador = 338)) geral' + #13#10 +
                ' WHERE p.idpessoa = e.idpessoa' + #13#10 +
                '   and e.idpessoa = pp.idpessoa' + #13#10 +
                '   and e.idpessjur = pp.idpessjur' + #13#10 +
                '   and pp.idplanoprev = pl.idplanoprev(+)' + #13#10 +
                '   and E.MATRICULA = geral.MATRICULA' + #13#10 +
                '   and pp.idpessjur = geral.idpessjur' + #13#10 +
                '   and pp.idplanoprev = geral.idplanoprev' + #13#10 +
                '   and pp.tipoopcaoir = 2'+
                'UNION' + #13#10 +
                '/* ASSISTIDOS – As datas abaixo deverão ser preenchidas pelo usuário no momento da geração do arquivo */' + #13#10 +
                'SELECT DISTINCT RPAD(''F52'' || RPAD(pl.codigospc, 17, '' '') ||' + #13#10 +
                '                     LPAD(pe.numdocumento, 11, ''0'') || ''200'' ||' + #13#10 +
                '                     TO_CHAR(bf.datainiciofund, ''DDMMYYYY''),' + #13#10 +
                '                     69,' + #13#10 +
                '                     '' '') texto' + #13#10 +
                '  FROM pessoa        pe,' + #13#10 +
                '       depentit      dp,' + #13#10 +
                '       benefbfciario bf,' + #13#10 +
                '       partprevplan  pa,' + #13#10 +
                '       planprev      pl' + #13#10 +
                ' WHERE pe.idpessoa = dp.idpessoa' + #13#10 +
                '   AND dp.idpessoa = bf.idpessoa' + #13#10 +
                '   AND dp.idtitular = bf.idtitular' + #13#10 +
                '   AND pl.idplanoprev = pa.idplanoprev' + #13#10 +
                '   AND pe.idpessoa = pa.idpessoa' + #13#10 +
                '   AND bf.idpessjur = pa.idpessjur' + #13#10 +
                '   AND bf.idplanoprev = pa.idplanoprev' + #13#10 +
                '   AND bf.idtppagtobenefic = 1' + #13#10 +
                '   AND bf.fontepagadora = 1' + #13#10 +
                '   AND pa.idplanoprev <> 2' + #13#10 +
                '   AND pa.tipoopcaoir = 2' + #13#10 +
                '   AND bf.datainiciofund BETWEEN TO_DATE('+QuotedStr(dtInicial)+', ''dd/mm/yyyy'') AND TO_DATE('+QuotedStr(dtFinal)+', ''dd/mm/yyyy'')' + #13#10 +
                'Union' + #13#10 +
                //Marcio Sanches Spinosa SOL 182778 Kintana 1710005 - Inicio
                ' /*ASSISTIDOS - PENSIONISTAS As datas abaixo deverão ser preenchidas pelo usuário no momento da geração do arquivo */ ' + #13#10 +
                '   SELECT DISTINCT ' + #13#10 +
                ' RPAD (''F52'' || RPAD (pl.codigospc, 17, '' '') '  + #13#10 +
                ' || LPAD (p.numdocumento, 11, ''0'') || ''200'' || TO_CHAR (bf.datainiciofund, ''DDMMYYYY''), ' + #13#10 +
                ' 69, '' '')texto '  + #13#10 +
                ' FROM   PESSOA P, DEPENTIT D, BENEFBFCIARIO BF, PLANPREV PL ' + #13#10 +
                ' WHERE  P.IDPESSOA = D.IDPESSOA ' + #13#10 +
                ' AND    D.IDPESSOA = BF.IDPESSOA ' + #13#10 +
                ' AND    D.IDTITULAR = BF.IDTITULAR ' + #13#10 +
                ' AND    BF.IDPESSOA <> BF.IDTITULAR -- PENSIONISTAS ' + #13#10 +
                ' AND    BF.IDPLANPREVCONTAB IN (66,74) ' + #13#10 +
                ' AND    BF.IDPLANPREVCONTAB = PL.IDPLANOPREV ' + #13#10 +
                ' AND    BF.FONTEPAGADORA = 1 ' + #13#10 +
                ' AND    BF.IDSITBENEFICIO = 1 ' + #13#10 +
                ' AND    BF.IDTPPAGTOBENEFIC = 1 ' + #13#10 +
                ' AND    BF.DATAINICIOFUND BETWEEN TO_DATE ('+QuotedStr(dtInicial)+', ''dd/mm/yyyy'') ' + #13#10 +
                ' AND  TO_DATE ('+QuotedStr(dtFinal)+', ''dd/mm/yyyy'') ' + #13#10 +
                ' AND    BF.IDTITULAR IN (SELECT P.IDPESSOA ' + #13#10 +
                ' FROM   PARTPREVPLAN P '  + #13#10 +
                '        WHERE  TIPOOPCAOIR = 2 ' + #13#10 +
                '       AND    NOT EXISTS (SELECT 1 FROM BENEFBFCIARIO B WHERE B.IDPESSOA = P.IDPESSOA ' + #13#10 +
                '       AND B.IDPESSJUR = P.IDPESSJUR)) ' + #13#10 +
                'Union' + #13#10 +
                //Marcio Sanches Spinosa SOL 182778 Kintana 1710005 - Fim

                '/* PORTABILIDADE DE SAÍDA E RESGATES – As datas abaixo deverão ser preenchidas pelo usuário no momento da geração do arquivo */' + #13#10 +
                'SELECT DISTINCT RPAD(''F52'' || RPAD(geral.codigospc, 17, '' '') ||' + #13#10 +
                '                     LPAD(geral.numdocumento, 11, ''0'') ||' + #13#10 +
                '                     (DECODE(geral.tipo,' + #13#10 +
                '                             ''RESGATES'',' + #13#10 +
                '                             ''12'',' + #13#10 +
                '                             ''PORTABILIDADE SAÍDA'',' + #13#10 +
                '                             ''11'',' + #13#10 +
                '                             ''01'') || ''2'' ||' + #13#10 +
                '                     TO_CHAR(geral.inscricaodata, ''DDMMYYYY'')),' + #13#10 +
                '                     69,' + #13#10 +
                '                     '' '') texto' + #13#10 +
                '  FROM (SELECT DISTINCT d.matricula,' + #13#10 +
                '                        p.numdocumento,' + #13#10 +
                '                        p.idpessoa,' + #13#10 +
                '                        p.nome,' + #13#10 +
                '                        pp.idplanoprev,' + #13#10 +
                '                        EXTRACT(YEAR FROM pl.datacriacao) ano,' + #13#10 +
                '                        EVENTO.DATAEVENTO INSCRICAODATA,' + #13#10 +
                '                        pl.idplanoprev idplano,' + #13#10 +
                '                        pl.codigospc,' + #13#10 +
                '                        ''PORTABILIDADE SAÍDA'' AS tipo' + #13#10 +
                '          FROM benefbfciario bf,' + #13#10 +
                '               beneficio b,' + #13#10 +
                '               depentit d,' + #13#10 +
                '               pessoa p,' + #13#10 +
                '               partprevplan pp,' + #13#10 +
                '               planprev pl,' + #13#10 +
                '               (select EPrev.idpessoa,' + #13#10 +
                '                       EPrev.idplanoprev,' + #13#10 +
                '                       EPrev.idpessjur,' + #13#10 +
                '                       EPrev.dataevento,' + #13#10 +
                '                       EPrev.ideventogerador' + #13#10 +
                '                  from EventosPrev EPrev' + #13#10 +
                '                 where EPrev.ideventogerador = 334' + #13#10 +
                '                   and eprev.dataevento BETWEEN' + #13#10 +
                '                       TO_DATE('+QuotedStr(dtInicial)+', ''dd/mm/yyyy'') AND' + #13#10 +
                '                       TO_DATE('+QuotedStr(dtFinal)+', ''dd/mm/yyyy'')) Evento' + #13#10 +
                '         WHERE p.idpessoa = d.idpessoa' + #13#10 +
                '           and d.idpessoa = bf.idpessoa' + #13#10 +
                '           and d.idtitular = bf.idtitular' + #13#10 +
                '           and bf.idbeneficio = b.idbeneficio' + #13#10 +
                '           and bf.idpessoa = pp.idpessoa' + #13#10 +
                '           and bf.idpessjur = pp.idpessjur' + #13#10 +
                '           and pp.idplanoprev = pl.idplanoprev(+)' + #13#10 +
                '           AND bf.datafinal BETWEEN TO_DATE('+QuotedStr(dtInicial)+', ''dd/mm/yyyy'') AND TO_DATE('+QuotedStr(dtFinal)+', ''dd/mm/yyyy'')' + #13#10 +
                '           AND b.ideventogerador IN (334)' + #13#10 +
                '           AND pp.tipoopcaoir = 2' + #13#10 +
                '           AND Pp.IDPESSOA = EVENTO.IDPESSOA(+)' + #13#10 +
                '           AND Pp.IDPESSJUR = EVENTO.IDPESSJUR(+)' + #13#10 +
                '           AND Pp.IDPLANOPREV = EVENTO.IDPLANOPREV(+) ' + #13#10 +
                '        UNION' + #13#10 +
                '        SELECT DISTINCT c.matricula,' + #13#10 +
                '                        d.numdocumento,' + #13#10 +
                '                        a.idpessoa,' + #13#10 +
                '                        d.nome,' + #13#10 +
                '                        a.idplanoprev,' + #13#10 +
                '                        EXTRACT(YEAR FROM pl.datacriacao) ano,' + #13#10 +
                '                        Evento.DataEvento INSCRICAODATA,' + #13#10 +
                '                        pl.idplanoprev idplano,' + #13#10 +
                '                        pl.codigospc,' + #13#10 +
                '                        ''RESGATES'' AS tipo' + #13#10 +
                '          FROM benefbfciario a,' + #13#10 +
                '               beneficio b,' + #13#10 +
                '               depentit c,' + #13#10 +
                '               pessoa d,' + #13#10 +
                '               partprevplan p,' + #13#10 +
                '               planprev pl,' + #13#10 +
                '               (select EPrev.idpessoa,' + #13#10 +
                '                       EPrev.idplanoprev,' + #13#10 +
                '                       EPrev.idpessjur,' + #13#10 +
                '                       EPrev.dataevento,' + #13#10 +
                '                       EPrev.ideventogerador' + #13#10 +
                '                  from EventosPrev EPrev' + #13#10 +
                '                 where EPrev.ideventogerador IN (15, 336/*, 345*/)' + #13#10 +
                '                   and eprev.dataevento BETWEEN' + #13#10 +
                '                       TO_DATE('+QuotedStr(dtInicial)+', ''dd/mm/yyyy'') AND' + #13#10 +
                '                       TO_DATE('+QuotedStr(dtFinal)+', ''dd/mm/yyyy'')) Evento' + #13#10 +
                '         WHERE a.idbeneficio = b.idbeneficio' + #13#10 +
                '           AND a.idpessoa = c.idpessoa' + #13#10 +
                '           AND a.idtitular = c.idtitular' + #13#10 +
                '           AND a.idpessoa = d.idpessoa' + #13#10 +
                '           AND A.idpessoa = p.idpessoa' + #13#10 +
                '           AND a.idpessjur = p.idpessjur' + #13#10 +
                '           and a.idplanoprev = p.idplanoprev' + #13#10 +
                '           AND pl.idplanoprev = p.idplanoprev' + #13#10 +
                '           AND a.datainiciofund BETWEEN TO_DATE('+QuotedStr(dtInicial)+', ''dd/mm/yyyy'') AND TO_DATE('+QuotedStr(dtFinal)+', ''dd/mm/yyyy'')' + #13#10 +
                '           AND b.ideventogerador IN (15, 336/*, 345*/)' + #13#10 +
                '           AND p.tipoopcaoir = 2' + #13#10 +
                '           AND p.IdPlanoPrev not in (19, 79)' + #13#10 +
                '           AND p.IdPessoa = Evento.idPessoa(+)' + #13#10 +
                '           AND p.IdPessJur = Evento.idPessJur(+)' + #13#10 +
                '           AND P.IDPLANOPREV = EVENTO.IDPLANOPREV(+)) geral ' + #13#10 +
                ' UNION '+ #13#10 +
                //Marcio Sanches Spinosa SOL 182778 Kintana 1710005 - Inicio
                ' /*ASSISTIDOS - PENSIONISTAS As datas abaixo deverão ser preenchidas pelo usuário no momento da geração do arquivo */ '+ #13#10 +
                ' SELECT DISTINCT '+ #13#10 +
                ' RPAD (''F52'' || RPAD (pl.codigospc, 17, '' '') '+ #13#10 +
                ' || LPAD (p.numdocumento, 11, ''0'') || ''200'' '+ #13#10 +
                ' || TO_CHAR (bf.datainiciofund, ''DDMMYYYY''), '+ #13#10 +
                ' 69, '' '')texto '+ #13#10 +
                ' FROM   PESSOA P, DEPENTIT D, BENEFBFCIARIO BF, PLANPREV PL '+ #13#10 +
                ' WHERE  P.IDPESSOA = D.IDPESSOA '+ #13#10 +
                ' AND    D.IDPESSOA = BF.IDPESSOA '+ #13#10 +
                ' AND    D.IDTITULAR = BF.IDTITULAR '+ #13#10 +
                ' AND    BF.IDPESSOA <> BF.IDTITULAR -- PENSIONISTAS '+ #13#10 +
                ' AND    BF.IDPLANPREVCONTAB IN (66,74) '+ #13#10 +
                ' AND    BF.IDPLANPREVCONTAB = PL.IDPLANOPREV '+ #13#10 +
                ' AND    BF.FONTEPAGADORA = 1 '+ #13#10 +
                ' AND    BF.DATAINICIOFUND BETWEEN TO_DATE ('+QuotedStr(dtInicial)+', ''dd/mm/yyyy'') ' + #13#10 +
                ' AND  TO_DATE ('+QuotedStr(dtFinal)+', ''dd/mm/yyyy'') '+ #13#10 +
                ' AND    BF.IDTITULAR IN (SELECT P.IDPESSOA '+ #13#10 +
                ' FROM   PARTPREVPLAN P '+ #13#10 +
                ' WHERE  TIPOOPCAOIR = 2 '+ #13#10 +
                ' AND    NOT EXISTS (SELECT 1 FROM BENEFBFCIARIO B WHERE B.IDPESSOA = P.IDPESSOA '+ #13#10 +
                ' AND B.IDPESSJUR = P.IDPESSJUR ' + #13#10 +
                ' AND B.FONTEPAGADORA = 1 '+ #13#10 +
                ' AND B.IDTPPAGTOBENEFIC = 1)) '+ #13#10 +
                ' AND    EXISTS (SELECT 1 FROM EVENTOSPREV EV '+ #13#10 +
                ' WHERE EV.IDPESSOA = BF.IDTITULAR '+ #13#10 +
                ' AND EV.IDEVENTOGERADOR IN (15,336,/*345,*/346) '+ #13#10 +
                ' AND EV.dataevento BETWEEN TO_DATE ('+QuotedStr(dtInicial)+',''dd/mm/yyyy'') ' + #13#10 +
                ' AND  TO_DATE ('+QuotedStr(dtFinal)+',''dd/mm/yyyy'')) ';

                //Marcio Sanches Spinosa SOL 182778 Kintana 1710005 - Fim
  sSql.SaveToFile('c:\planus\temp\GeracaoBeneficiariosDPREV.sql');
  Result := GetDataPacket(sSql.text);
  FreeAndNil(sSql);
end;


end.
