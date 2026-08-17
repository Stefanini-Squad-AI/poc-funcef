// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
{ --------------------------------------------------------------------------------------------------
Rotina......: Criação da funcionalidade
Nº SOL......: 152930
Nº KINTANA..: 1146562
Data........: 11/06/2012
Responsável.: Edilaine Ferraresi
Descrição...: Implementação da Integração Contribuição Previdenciaria
---------------------------------------------------------------------------------------------------}

unit uCtrlIntegraContribPrev;

interface

uses SysUtils, uCmDbObject, uCmControlObject, Controls, IvDictio, Classes,
     uCMClientDataSet, uCtrlCustomRH, uCtrlProvDesc, uCtrlGlobalRH, JCLSysUtils,
     uCtrlGeraFolPagNormal, JclStrings;

type
   TRecData = record
     dia : word;
     mes : word;
     ano : word;
     sMes : string;
   end;

   TCtrlIntegraContribPrev = class(TCtrlCustomRH)

   protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;

   private
    FCds: TCMClientDataSet;
    ArqLog : TextFile;
    _sql   : TStringList;

    // Ctrls
    CtrlProvDesc          : TCtrlProvDesc;
    CtrlGlobalRH          : TCtrlGlobalRH;
    CtrlGeraFolPagNormal  : TCtrlGeraFolPagNormal;

   public
    constructor Create;  override;
    destructor  Destroy; override;

    property Cds: TCMClientDataSet read FCds write FCds;
    function GetMesAtual : integer;
    function GetAnoAtual : string;
    function GetPeriodoAtual : TRecData;
    function GetMotivoPadrao : integer;

    function ListaMotivos(ListaGrupoMotivo: string = '';
                          ListaFlgTipo: string = '';
                          ListaIdMotivo : string = ''): OleVariant;

    Function ListaPessoaEstab(IdEmpresa: integer): string;
    function ListaRubricas : OleVariant;
    function ListaFuncionario(ListaTipoContr: string;
                              bRetiraLicSemVencto : Boolean = false;
                              pPeriodo : String = '';
                              ListaSitFunc : string = '') : OleVariant;

    function ListaPessoasIntegracao(sMesAno, sListaMotivo, sListaRubrica, sListaPessoas : string) : String;                         

    function GeraLogIntegracao(sNomeLog : string;
                               sMesAno : string;
                               DtPagto : TDate;
                               sIdMotivo : string;
                               sMotivoFolha : TStringList;
                               sListaPessoas : string;
                               sListaRubrica : string) : boolean;

end;



implementation

uses  uSistema, uCtrlUsoGeralRH, uCtrlFuncoesRH, uCtrlPadroes;

{ TCtrlIntegraContribPrev }

constructor TCtrlIntegraContribPrev.Create;
begin
  inherited;
  // criando cds
  if FCds = nil then
     FCds := TCMClientDataSet.Create(nil);

  _sql  := TStringList.create;

  // criando ctrl's
  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlGeraFolPagNormal := TCtrlGeraFolPagNormal.Create(CtrlUsoGeralRH.UsuXFilial,
                                                       CtrlUsoGeralRH.UsuXCCusto,
                                                       CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlGeraFolPagNormal.InitializeAs(Padroes);

end;

destructor TCtrlIntegraContribPrev.Destroy;
begin
  FreeAndNil(CtrlGlobalRH );
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlGeraFolPagNormal);
  FreeAndNil( _sql );
  FCds.Free;
  inherited;
end;

procedure TCtrlIntegraContribPrev.DoChangeDataBase;
begin
  inherited;
  //FDb.DataBaseName := DataBaseName;
end;

function TCtrlIntegraContribPrev.GetAnoAtual: string;
begin
  result := IntToStr(FU.ExtraiAno(CtrlGlobalRH.GetNormalIni));
end;

function TCtrlIntegraContribPrev.GetMesAtual: integer;
begin
  result := FU.ExtraiMes(CtrlGlobalRH.GetNormalIni)-1;
end;

function TCtrlIntegraContribPrev.ListaFuncionario(ListaTipoContr: string; bRetiraLicSemVencto: Boolean;
  pPeriodo: String; ListaSitFunc : string): OleVariant;
var
  sEstab : string;
begin
  sEstab := ListaPessoaEstab(sistema.IdEmpresa);

  _sql.Clear;
  _sql.Add('SELECT F.IDPESSOA, F.MATRICULA, PF.NOME');
  _sql.Add('  FROM PESSOA PF, FUNCIONARIO F, SITFUNC ST');
  _sql.Add(' WHERE (F.IDEMPRESA  = ' +IntToStr(Sistema.IdEmpresa)+ ')');
  _sql.Add('   AND (F.IDESTAB    = ' +sEstab+ ') ');

  if ListaSitFunc <> '' then
     _sql.Add('   AND (ST.TIPOSIT  IN ('+QuotedListaString(ListaSitFunc, ',')+'))');

  if ListaTipoContr <> '' then
     _sql.Add('   AND (F.TIPOCONTRATO  IN ( '+QuotedListaString(ListaTipoContr, ',')+ '))');

  _sql.Add('   AND (ST.IDSITFUNC  = F.IDSITFUNC) ');
  _sql.Add('   AND (F.IDPESSOA    = PF.IDPESSOA) ');
  _sql.Add(' ORDER BY UPPER(NOME)');

  Result := GetDataPacket( _sql.getText);

end;

function TCtrlIntegraContribPrev.ListaMotivos(ListaGrupoMotivo,
  ListaFlgTipo, ListaIdMotivo: string): OleVariant;
var
  sParam, sSQL : string;
begin
  sParam := '';
  if (ListaGrupoMotivo <> '') then
  begin
    sParam := 'WHERE' +CR_LF+ '  (GRUPOMOTIVO ';
    if (Pos(',', ListaGrupoMotivo) > 0) then
      sParam := sParam + 'IN (' + QuotedListaString(ListaGrupoMotivo, ',') + '))'
    else
      sParam := sParam + '= ' + QuotedListaString(ListaGrupoMotivo, ',') + ')';
  end;

  if (ListaFlgTipo <> '') then
  begin
    if (sParam = '') then
      sParam := 'WHERE' +CR_LF+ '  (FLGTIPO '
    else
      sParam := sParam + ' AND (FLGTIPO ';
    if (Pos(',', ListaFlgTipo) > 0) then
      sParam := sParam + 'IN (' + QuotedListaString(ListaFlgTipo, ',') + '))'
    else
      sParam := sParam + '= ' + QuotedListaString(ListaFlgTipo, ',') + ')';
  end;

  if (ListaIdMotivo <> '') then
  begin
    if (sParam = '') then
      sParam := 'WHERE' +CR_LF+ '  (IDMOTIVO '
    else
      sParam := sParam + ' AND (IDMOTIVO ';
    if (Pos(',', ListaIdMotivo) > 0) then
      sParam := sParam + 'IN (' + ListaIdMotivo + '))'
    else
      sParam := sParam + '= ' + ListaIdMotivo + ')';
  end;

  sSQL := 'SELECT IDMOTIVO, DESCRICAO'+CR_LF+
          '  FROM MOTIVO'+CR_LF+
          sParam+CR_LF+
          ' ORDER BY DESCRICAO';

  Result := GetDataPacket( sSQL );
end;

function TCtrlIntegraContribPrev.ListaRubricas : OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT *  ' + CR_LF +
          '  FROM (SELECT *  ' + CR_LF +
          '          FROM ((SELECT VAL.VALOR AS MOTIVO, VAL.NUMLINHA AS L1, VAL.CODTABELA ' + CR_LF +
          '                   FROM VALTABGENER VAL ' + CR_LF +
          '                  WHERE VAL.CODTABELA = ''RUBRICACONTRIB'' ' + CR_LF +
          '                    AND VAL.CODCAMPO = ''MOTIVO'' ' + CR_LF +
          '                ) MT), ' + CR_LF +
          '                (SELECT VAL.VALOR AS RUBRICA, VAL.NUMLINHA AS L2 ' + CR_LF +
          '                   FROM VALTABGENER VAL ' + CR_LF +
          '                  WHERE VAL.CODTABELA = ''RUBRICACONTRIB'' ' + CR_LF +
          '                    AND VAL.CODCAMPO = ''IDRUBRICA'' ' + CR_LF +
          '                ) RB ' + CR_LF +
          '         WHERE MT.L1 = RB.L2 ' + CR_LF +
          '       ) M, ' + CR_LF +
          '       (SELECT RP.IDRUBRICA, RP.CODPROVDESC, RP.DESCRPROVDESC, PD.IDPROVENTO, PD.FLGDESCONTO, PD.CODRUBCLT, ' + CR_LF +
          '               PD.DESCRICAO, PD.FLGTPRUBRICA, PD.IDREGRA, PD.FLGBENEFICIOS ' + CR_LF +
          '          FROM RUBRICAXPESS RP, PROVDESC PD ' + CR_LF +
          '         WHERE (PD.IDPROVENTO = RP.IDRUBRICA) ' + CR_LF +
          '           AND (PD.FLGTPRUBRICA LIKE ''%F%'') ' + CR_LF +
          '           AND (RP.IDPESSOA  = ' + IntToStr(Sistema.idEmpresa)+') ' + CR_LF +
          '         ORDER BY RP.DESCRPROVDESC ' + CR_LF +
          '       ) R ' + CR_LF +
          ' WHERE M.RUBRICA = R.IDRUBRICA ';

  Result := GetDataPacket( sSQL );
end;

Function TCtrlIntegraContribPrev.ListaPessoaEstab(IdEmpresa: integer): String;
Begin
  FCds.data := GetDataPacket('SELECT PJ.IDPESSOA, PJ.NOME ' + CR_LF +
                             '  FROM PESSOA PJ, FILIALPESSOA FP ' + CR_LF +
                             ' WHERE (PJ.IDGRUPO = ' + IntToStr(IdEmpresa)+') ' + CR_LF +
                             '   AND (FP.IDFILIALPESSOA = PJ.IDPESSOA) ');
  if FCds.IsEmpty then
     Result := '-1'
  else
     Result := FCds.Fields[0].AsString;
End;


procedure TCtrlIntegraContribPrev.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;


function TCtrlIntegraContribPrev.GetPeriodoAtual: TRecData;
begin
  //result.Ano  := FU.ExtraiAno(CtrlGlobalRH.GetNormalIni);
  //result.mes  := FU.ExtraiMes(CtrlGlobalRH.GetNormalIni);
  result.Ano  := FU.ExtraiAno( Date );
  result.mes  := FU.ExtraiMes( Date );
  result.sMes := MesLongo[result.Mes];
end;

function TCtrlIntegraContribPrev.GeraLogIntegracao(
  sNomeLog: string; sMesAno : string; DtPagto : TDate; sIdMotivo : string; sMotivoFolha : TStringList;
  sListaPessoas : string; sListaRubrica : string): boolean;

  procedure AdicionaQuebraDataPagto(var lstTexto : TStringList; strPagto, strMotivo : string; bLinha : boolean);
  var  i : byte;
  begin
    if bLinha then
       lstTexto.Add(Replicate('=',153));
    lstTexto.Add('');
    lstTexto.Add('Data de Pagamento: ' + strPagto);
    lstTexto.Add('Tipo (Motivo) de Folha: ' + strMotivo );
    lstTexto.Add('');

    lstTexto.Add('Matrícula      Nome Empregado                                    Código Rubrica      Descrição Rubrica                                           Valor');
  end;

  procedure AdicionaQuebraMotivo(var lstTexto : TStringList; strMotivo : string);
  begin
    lstTexto.Add(Replicate('-',53));
    lstTexto.Add('Tipo (Motivo) de Folha: ' + strMotivo );
    lstTexto.Add('');

    lstTexto.Add('Matrícula      Nome Empregado                                    Código Rubrica      Descrição Rubrica                                           Valor');
  end;

var
  sLinha   : string;
  lstTexto : TStringList;
  sMotivo  : string;
  sDtPagto : string;
begin
  try
     _sql.clear;
     _sql.Add('SELECT DISTINCT HR.MES, HR.IDMOTIVO, HR.IDPESSOA, ');
     _sql.Add('       F.MATRICULA, P.NOME, HR.IDRUBRICA, HP.DESCRPROVDESC AS DESCRICAO, ');
     _sql.Add('       HR.VALORPROVENTO AS VALOR, ');
     _sql.Add('       HC.DATAPREVISAORECE AS DATAPAGAMENTO, ');
     _sql.Add('       M.DESCRICAO AS MOTIVOFOLHA ');

     _sql.Add('  FROM HISTRUBSAL HR,     ');

     _sql.Add('       (SELECT H.IDPESSOA, H.DATAPREVISAORECE, H.IDRUBRICA ');
     _sql.Add('            FROM HSTCONTRIBPREV H ');
     _sql.Add('           WHERE TRUNC(h.dtintegracao) = TO_DATE('+Quotedstr(FormatDateTime('dd/mm/yyyy', date))+', ''DD/MM/YYYY'')' );
     _sql.Add('             AND H.MESCOBRANCA = '+Quotedstr(sMesAno) );
     _sql.Add('             AND NVL(H.USERINTEGRACAO, -1) = '+IntToStr(Sistema.IdUsuario) );
     _sql.Add('         ) HC, ');

     _sql.Add('       MOTIVO M,   ');
     _sql.Add('       RUBRICAXPESS HP,   ');
     _sql.Add('       FUNCIONARIO F,     ');
     _sql.Add('       PESSOA P           ');
     _sql.Add(' WHERE F.IDPESSOA   = P.IDPESSOA   ');
     _sql.Add('   AND HC.IDRUBRICA = HP.IDRUBRICA ');
     _sql.Add('   AND HP.IDRUBRICA = HR.IDRUBRICA ');
     _sql.Add('   AND HC.IDPESSOA  = P.IDPESSOA   ');
     _sql.Add('   AND P.IDPESSOA   = HR.IDPESSOA  ');
     _sql.Add('   AND HR.IDPESSOA IN (SELECT DISTINCT HC.IDPESSOA FROM HSTCONTRIBPREV HC ');
     _sql.Add('                        WHERE TRUNC(hc.dtintegracao) = TO_DATE('+Quotedstr(FormatDateTime('dd/mm/yyyy', date))+', ''DD/MM/YYYY'')' );
     _sql.Add('                          AND NVL(HC.USERINTEGRACAO, -1) = '+IntToStr(Sistema.IdUsuario) );
     _sql.Add('                          AND HC.MESCOBRANCA = '+Quotedstr(sMesAno) );

     _sql.Add('                        ) ');
     _sql.Add('   AND NVL(HR.FLGINTEGRADO, ''N'') = ''S'' ');
     _sql.Add('   AND M.IDMOTIVO = HR.IDMOTIVO ');
//     _sql.Add('   AND HR.IDMOTIVO IN ('+sIdMotivo+')' );
     _sql.Add('   AND HR.IDMODULO = 21 ');
     _sql.Add('   AND HR.MESCOBRANCA = '+Quotedstr(sMesAno) );
     _sql.Add(' ORDER BY HC.DATAPREVISAORECE, HR.IDMOTIVO, F.MATRICULA ');

     FCds.data := GetDataPacket( _sql.GetText );

     if not FCds.IsEmpty then
     begin
       try
         // Prepara gravação do arquivo de log
         lstTexto := TStringList.create;

         sMotivo  := FCds.FieldbyName('MOTIVOFOLHA').AsString;
         sDtPagto := FCds.FieldbyName('DATAPAGAMENTO').AsString;

         lstTexto.Add('Nome Arquivo: ' + sNomeLog);
         lstTexto.Add('Mês e ano de Referência: '+sMesAno);
         AdicionaQuebraDataPagto(lstTexto, sDtPagto, sMotivo, false);


         while not FCds.Eof do
         begin
           if (sDtPagto <> FCds.FieldbyName('DATAPAGAMENTO').AsString) then
           begin
             sDtPagto := FCds.FieldbyName('DATAPAGAMENTO').AsString;
             sMotivo  := FCds.FieldbyName('MOTIVOFOLHA').AsString;
             AdicionaQuebraDataPagto(lstTexto, sDtPagto, sMotivo, true);
           end
           else if (sMotivo <> FCds.FieldbyName('MOTIVOFOLHA').AsString) then
           begin
             sMotivo  := FCds.FieldbyName('MOTIVOFOLHA').AsString;
             AdicionaQuebraMotivo(lstTexto, sMotivo);
           end;

           sLinha := StrPadRight(FCds.FieldbyName('MATRICULA').AsString,  15, ' ')+
                     StrPadRight(Trim(FCds.FieldbyName('NOME').AsString), 50, ' ')+
                     StrPadRight(FCds.FieldbyName('IDRUBRICA').AsString , 20, ' ')+
                     StrPadRight(Trim(FCds.FieldbyName('DESCRICAO').AsString), 60, ' ')+
                     FormatFloat('#,##0.00;(#,##0.00)', FCds.FieldbyName('VALOR').AsCurrency);

           lstTexto.Add(sLinha);

           FCds.next;
         end;

         lstTexto.SaveToFile(sNomeLog);
         Result := true;

       finally
         lstTexto.free;
       end;
     end
     else
     begin
       Result := false;
       MessageInfo := 'Não há dados para integração.';
     end;
  except
     On E:Exception Do
      Begin
         Result := False;
         MessageInfo := E.Message;
      End;
  end;
end;


function TCtrlIntegraContribPrev.GetMotivoPadrao: integer;
begin
  Fcds.data := CtrlGlobalRH.GetParamRH('IDMOTIVO');
  result := FCds.FieldByName('IDMOTIVO').asInteger;
end;

function TCtrlIntegraContribPrev.ListaPessoasIntegracao(sMesAno, sListaMotivo,
  sListaRubrica, sListaPessoas: string): String;
var
   sLista : string;
begin
  _sql.clear;
  _sql.Add('SELECT DISTINCT HR.IDPESSOA');
  _sql.Add('  FROM HISTRUBSAL HR');
  _sql.Add(' WHERE HR.MES = '+Quotedstr(sMesAno) );
  _sql.Add('   AND HR.IDMODULO = '+IntToStr(Sistema.IdModulo) );
  _sql.Add('   AND HR.IDMOTIVO IN ('+sListaMotivo+')' );
  _sql.Add('   AND HR.IDRUBRICA IN ('+ sListaRubrica  +') ');
  _sql.Add('   AND HR.IDPESSOA IN ('+ sListaPessoas + ') ');
  _sql.Add('   AND NVL(HR.FLGINTEGRADO, ''N'') = ''N'' ');

  sLista := '';
  FCds.data := GetDataPacket( _sql.GetText );
  while not FCds.eof do
  begin
    sLista := sLista + FCds.Fields[0].AsString;
    FCds.next;
    if not FCds.eof then
       sLista := sLista + ', ';
  end;

  Result := sLista;

end;

end.


