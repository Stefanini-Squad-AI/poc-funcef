unit fInterfaceEnvio;

// Alterações:
//--------------------------------------------------------------------------------------------------
{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  27/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
// Autor(a)    : Paulo Ramos
// Data        : 17/10/2007
// Pendencia   : 26396
// Rotina      : Várias
// Alteração   : Permitir o envio de rubricas informativas referentes a saldo de empréstimo.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 12/12/2006
// Pendencia   : 22829
// Rotina      : - (clbOpcoes)
// Alteração   : Label alterado de "Contriubuições de Empréstimo" para "Prestações de Empréstimo"
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/08/2006
// Pendencia   : 22064
// Rotina      : FormShow
// Alteração   : Alterar o diretório inicial quando já estiver parametrizado
//               uma pasta default.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/06/2006
// Pendencia   : 22064
// Rotina      : spSelecionarArquivoClick, FormShow e odTxtCanClose
// Alteração   : Criação de rotina para aceitar apenas a pasta parametrizada nos parametros do sistema.
//----------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Rotina      : PreencherDetalhe
// Data        : 16/02/2006
// Pendencia   : 22179
// Alteração   : Considerar o campo FLGVALOR para complementar com zeros ou não.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 16/02/2006
// Pendencia   : 21240 (reabertura)
// Alteração   : acerto no group by, acrescentando DATAINICIO na opção de inscritos (APÓS UNION)
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 01/02/2006
// Pendencia   : 21240
// Alteração   : acerto no group by, acrescentando DATAINICIO
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 24/01/2006
// Pendencia   : 21240
// Alteração   : inclusão do campo TMPDESC.DATAINICIO, Data original de concessão do empréstimo
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 09/05/2005
// Pendencia   :
// Alteração   : modifiquei o teste para saber se é de tipo numérico para casos em que o campo no cliente
//               esteja graavdo com confugurações anteriores
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 02/05/2005
// Pendencia   : 19155
// Alteração   : Copiar o campo valor (idcampo 8) a partir do segundo dígito. 
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 20/04/2005
// Pendencia   : 19051
// Alteração   : Filtrar na query principal somente os registros com o sitenvio
//               diferente de 9, ou seja, já recebido.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 22/03/2005
// Pendencia   : 17858
// Alteração   : Separando a rotina de inscritos e desligados.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 17/03/2005
// Pendencia   : 18701
// Alteração   : Criação da função COMPLETANUM para que, quando o campo for
//               numérico e assinalado o FLGCOMPBRANCOS, seja completado com
//               brancos à esquerda.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 29/07/2004
// Alteração   : correção de erro que empedia a colocação de campos tipo "vazio" no footer
//------------------------------------------------------------------------------
// Autor(a)    : Flavio Dias
// Data        : 17/05/2004
// Pendência   : 16787
// Alteração   : Utilização do formato especificado
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/09/2003
// Pendência   : 14841
// Alteração   : Criando um parâmetro para agrupar na maior Parcela de
//               empréstimo - fazendo uma substituição pelo componente na tela.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 11/09/2003
// Pendência   : 14841  (REFAZENDO)
// Alteração   : Agrupando na maior Parcela de empréstimo (componente na tela)
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 02.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 13/11/2002
//  Rotina     : Preparar Opcoes
//  Descrição  : Alteração na rotina para agrupar descontos de emprestimo
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 13/11/2002
//  Rotina     : PreencherDetalhe
//  Descrição  : Alteração na rotina para colocar ponto separador opcional.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 30/10/2002
//  Rotina     : PreencherDetalhe
//  Descrição  : Alteração na rotina para não truncar registros inteiros.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 24/10/2002
//  Descrição  : Pendencia 10041 (erro na geração do arquivo de envio)
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 16.09.2002
//  Descrição  : alteração no campo =8, atender formatos de número sem separador decimal
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 30.08.2002
//  Descrição  : alteração dos parâmetros da função FloatToStrF
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 29.08.2002
//  Descrição  : alteração no envio para tratar assistencial
//               incluí tratamentos sobre FLGTIPODESC
//------------------------------------------------------------------------------
//  Autor      : Carlos Gleyber Macedo de Mesquita
//  Data       : 11.06.2002
//  Descrição  : Inclusão de dois novos campos para envio (FCRT) :
//               ID 26 - PARCELA     - Nr. da Parcela
//               ID 28 - NUMPARCELAS - Total de Parcelas
//------------------------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,  Controls, Forms, Dialogs,
  FOkCancelar, Buttons, StdCtrls, checklst,  wwdblook,  IvDictio,   IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, TB97,    Db,   DBTables,
  Wwquery, MontaSelect, Mask, wwdbedit, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls,UFuncoesUteis, Wwdbgrd2, CMDBLookupCombo, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmInterfaceEnvio = class(TfrmOkCancelar)
    edTxt                  : TEdit;
    odTxt                  : TOpenDialog;
    Label1                 : TLabel;
    Label2                 : TLabel;
    qryIds                 : TwwQuery;
    Label5                 : TLabel;
    dsPatro                : TwwDataSource;
    dsPlanos               : TwwDataSource;
    pnlGeral               : TPanel;
    dsContrib              : TwwDataSource;
    deDataRef              : TCMDateTimePicker;
    deDataCob              : TCMDateTimePicker;
    qryHeader              : TwwQuery;
    qryFooter              : TwwQuery;
    clbOpcoes              : TCheckListBox;
    tbsPlanos              : TTabSheet;
    clbPlanos              : TCheckListBox;
    qryOpcoes              : TwwQuery;
    lblDataRef             : TLabel;
    scrlOpcoes             : TScrollBox;
    tbsContrib             : TTabSheet;
    scrlPlanos             : TScrollBox;
    qryDetalhes            : TwwQuery;
    pgctrlPlanos           : TPageControl;
    dbGrdContrib           : TwwDBGrid2;
    scrllContrib           : TScrollBox;
    pgctrlContrib          : TPageControl;
    lblDataCobranca        : TLabel;
    qrySaldoReserva        : TwwQuery;
    pgctrlInterface        : TPageControl;
    SplitterContrib        : TSplitter;
    spSelecionarArquivo    : TSpeedButton;
    tbsContribuicoesPlano  : TTabSheet;
    dblookupPatrocinadora  : TCMDBLookupCombo;
    scrllContribuicoesPlano: TScrollBox;

    qryPlanos            : TwwQuery;
     qryPlanosNOME       : TStringField;
     qryPlanosIDPESSJUR  : TFloatField;
     qryPlanosIDPLANOPREV: TFloatField;

    qryPatro             : TwwQuery;
     qryPatroNOME        : TStringField;
     qryPatroIDPESSOA    : TFloatField;
     
    qryContrib               : TwwQuery;
     qryContribNOME          : TStringField;
     qryContribNOMEBASE      : TStringField;
     qryContribVALORBASE     : TFloatField;
     qryContribIDCONTRIBUICAO: TFloatField;
    qryContribFLGTPVLR: TStringField;
    qryOpcoesIDPLANOPREV: TFloatField;
    qryOpcoesMATRICULA: TStringField;
    qryOpcoesINSCRICAONUMERO: TFloatField;
    qryOpcoesVALORBASE1: TFloatField;
    qryOpcoesVALORBASE2: TFloatField;
    qryOpcoesVALORBASE3: TFloatField;
    qryOpcoesFLGDESCONTO: TFloatField;
    qryOpcoesCODPROVDESC: TStringField;
    qryOpcoesFLGINTEVENTO: TStringField;
    qryOpcoesIDPESSOA: TFloatField;
    qryOpcoesSEQPROPOSTA: TFloatField;
    qryOpcoesIDDESCONTO: TFloatField;
    qryOpcoesMESREFERENCIA: TStringField;
    qryOpcoesVALOR: TFloatField;
    qryOpcoesFLGTIPODESC: TStringField;
    qryOpcoesPARCELA: TFloatField;
    qryOpcoesNUMPARCELAS: TFloatField;
    qryOpcoesVALORINFO: TFloatField;
    Label4: TLabel;
    CMDBLookupCombo1: TCMDBLookupCombo;
    QryLayout: TwwQuery;
    DsLayout: TwwDataSource;
    Splitter1: TSplitter;
    qryOpcoesDATAINICIO: TDateTimeField;

    procedure spSelecionarArquivoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure clbPlanosClick(Sender: TObject);
    procedure clbPlanosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure dblookupPatrocinadoraChange(Sender: TObject);
    procedure dblookupPatrocinadoraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure odTxtCanClose(Sender: TObject; var CanClose: Boolean);
  private
    Linha       : string;
    DataRef     : string[7]; //Data Referência para Cobrança;
    Arquivo     : TextFile;
    TotalReg    : Integer;
    PosicaoPlano: Integer;
    function  PreencherDetalhe: Boolean;
    function  BuscaDataInscricao: string;
    function  BuscaDataNasc: string;
    function  VerificaOpcoesEnvio: Boolean;
    procedure AtualizarDados;
    procedure SetaPlano;
    function  CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
    function  CompletaNum(psConteudo : String) : String; 
  public
    {-----}
  end;

var
  frmInterfaceEnvio: TfrmInterfaceEnvio;
  strPlanosSel : String;

implementation

uses uDataBase, uSistema, uMensErro,
     fAguardeEnvioRec, uSincronismo, UCCP, UAdmPrev;

{$R *.DFM}

procedure TfrmInterfaceEnvio.AtualizarDados; //Procedure responsável por abrir as Queries de
var                                          //Patrocinadoras, Planos da Patroc. e Contribuições do Plano;
 lIdPessoa: LongInt;
begin
  if qryPatro.Active then
   lIdPessoa := qryPatro.FieldByName('IDPESSOA').AsInteger
  else
   lIdPessoa := -1; 

  //Atenção!!! A Seqüência de abertura das Queries deve ser mantida;

  //Fechando as Queries;
  qryContrib.Close;
  qryPlanos.Close;
  qryPatro.Close;

  {-----}

  //Abrindo as Queries;
  with qryPatro do
  begin
    ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
    Open;

    if lIdPessoa <> -1 then
     Locate('IDPESSOA', lIdPessoa, [loCaseInsensitive]);
  end;
  qryPlanos.Open;

  //Atualizando o CheckListBox de Planos;
  with clbPlanos do
  begin
    Items.Clear;

    while not qryPlanos.EOF do
    begin
      Items.Add(qryPlanos.FieldByName('NOME').AsString);
      Checked[Items.Count - 1] := True; //Marcando o Item que foi adicionado;
      qryPlanos.Next;
    end;

    qryPlanos.First;

    ItemIndex    := 0;
    PosicaoPlano := 0;
  end;

  //Abrindo a Query de Contribuições;

  qryContrib.Open;
end;

function TfrmInterfaceEnvio.VerificaOpcoesEnvio: Boolean;
var
 Qry: TwwQuery;
 cTipoEnvPrev: Char;
begin
  Result := True; //Inicializando "Result";

  Qry := TwwQuery.Create(Self);
  with Qry do
   DataBaseName := qryPatro.DatabaseName;

  {-----}

  if clbOpcoes.Checked[0] then
  begin
    if VerificaFechamento(qryPatro.FieldByName('IDPESSOA').AsInteger, 32, DataRef, 'B', cTipoEnvPrev) then
    begin
      if MsgDlg('Atenção! O Fechamento de "Benefícios - Auxílio Doença" já foi realizado para a competência "' + DataRef + '". Deseja reabrir o mês para esta Opção?',
               'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       ExcluiSincronismo(Qry, DataRef, qryPatro.FieldByName('IDPESSOA').AsInteger, 32, 'B', ' ')
      else
       Result := False;
    end;
  end;

  if clbOpcoes.Checked[1] then
  begin
    if VerificaFechamento(qryPatro.FieldByName('IDPESSOA').AsInteger, 32, DataRef, 'A', cTipoEnvPrev) then
    begin
      if MsgDlg('Atenção! O Fechamento de "Contribuições Assistenciais" já foi realizado para a competência "' + DataRef + '". Deseja reabrir o mês para esta Opção?',
               'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       ExcluiSincronismo(Qry, DataRef, qryPatro.FieldByName('IDPESSOA').AsInteger, 32, 'A', ' ')
      else
       Result := False;
    end;
  end;

  if clbOpcoes.Checked[2] then
  begin
    if VerificaFechamento(qryPatro.FieldByName('IDPESSOA').AsInteger, 32, DataRef, 'E', cTipoEnvPrev) then
    begin
      if MsgDlg('Atenção! O Fechamento de "Contribuições de Empréstimo" já foi realizado para a competência "' + DataRef + '". Deseja reabrir o mês para esta Opção?',
                'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       ExcluiSincronismo(Qry, DataRef, qryPatro.FieldByName('IDPESSOA').AsInteger, 32, 'E', ' ')
      else
       Result := False;
    end;
  end;

  if clbOpcoes.Checked[3] then
  begin
    if VerificaFechamento(qryPatro.FieldByName('IDPESSOA').AsInteger, 32, DataRef, 'P', cTipoEnvPrev) then
     if cTipoEnvPrev in ['N', 'A'] then
     begin
       if MsgDlg('Atenção! O Fechamento de "Inscritos e Desligados" já foi realizado para a competência "' + DataRef + '". Deseja reabrir o mês para esta Opção?',
                 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        ExcluiSincronismo(Qry, DataRef, qryPatro.FieldByName('IDPESSOA').AsInteger, 32, 'P', cTipoEnvPrev)
       else
        Result := False;
     end;
  end;

  if clbOpcoes.Checked[4] then
  begin
    if VerificaFechamento(qryPatro.FieldByName('IDPESSOA').AsInteger, 32, DataRef, 'P', cTipoEnvPrev) then
     if cTipoEnvPrev in ['V', 'A'] then
     begin
       if MsgDlg('Atenção! O Fechamento de "Taxas ou Valores das Contribuições Mensais" já foi realizado para a competência "' + DataRef + '". Deseja reabrir o mês para esta Opção?',
                 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        ExcluiSincronismo(Qry, DataRef, qryPatro.FieldByName('IDPESSOA').AsInteger, 32, 'P', cTipoEnvPrev)
       else
        Result := False;
     end;
  end;

  {-----}

  with Qry do
  begin
    Close;
    Free;
  end;
end;

function TfrmInterfaceEnvio.BuscaDataInscricao: string;
begin
  Result := '';

  with TwwQuery.Create(Self) do
  begin
    DataBaseName := qryPatro.DataBaseName;

    SQL.Add('SELECT INSCRICAODATA');
    SQL.Add('FROM PARTPREVPLAN');
    SQL.Add('WHERE IDPESSJUR   = ' + qryPatro.FieldByName('IDPESSOA').AsString);
    SQL.Add('AND   IDPLANOPREV = ' + qryPlanos.FieldByName('IDPLANOPREV').AsString);
    SQL.Add('AND   IDPESSOA    = ' + qryOpcoes.FieldByName('IDPESSOA').AsString);
    SQL.Add('AND   SEQPROPOSTA = ' + qryOpcoes.FieldByName('SEQPROPOSTA').AsString);

    Open;

    if not IsEmpty then
     Result := FieldByName('INSCRICAODATA').AsString;

    Close;
    Free;
  end;
end;

function TfrmInterfaceEnvio.BuscaDataNasc: string;
begin
  Result := '';

  with TwwQuery.Create(Self) do
  begin
    DataBaseName := qryPatro.DataBaseName;

    SQL.Add('SELECT DATANASC');
    SQL.Add('FROM   PESSOAFISICA');
    SQL.Add('WHERE  IDPESSOA = ' + qryOpcoes.FieldByName('IDPESSOA').AsString);

    Open;

    if not IsEmpty then
     Result := FieldByName('DATANASC').AsString;

    Close;
    Free;
  end;
end;

procedure TfrmInterfaceEnvio.SetaPlano;
begin
  if qryPlanos.Active then
   if not qryPlanos.IsEmpty then
   begin
     qryPlanos.MoveBy(clbPlanos.ItemIndex - PosicaoPlano);
     PosicaoPlano := clbPlanos.ItemIndex;
   end;
end;

procedure TfrmInterfaceEnvio.spSelecionarArquivoClick(Sender: TObject);
begin
  inherited;
  If Not odTxt.Execute
   Then Exit;

  If CriticaPath(odTxt.FileName)
   Then Begin
     MsgDlg('O local do arquivo escolhido possui caracteres inválidos.'+#13+
            'Por favor, mude a localização do arquivo para outra pasta.','Aviso',mtWarning,[mbOk],0);
     Exit;
   End;

  edTxt.Text := odTxt.FileName;
end;

procedure TfrmInterfaceEnvio.bbtnConfirmarClick(Sender: TObject);

 procedure HabilitarBotoes(const bHabilitar: Boolean); //Procedure utilizada para Controlar os Botões de "OK" e "Sair";
 begin
   bbtnConfirmar.Enabled := bHabilitar;
   bbtnSair.Enabled      := bHabilitar;
 end;

 function PrepararOpcoes: Boolean; //Atenção!!! A qryOpcoes está ligada à qryPlanos porque o filtro na TMPDESC deve ser por Patrocinadora e Plano;
 var
  i: Integer;

  sFlgTipoDesc,
  sFlgAtrsDevol,
  sFlgIntEvento: string;
 begin
   Result := True; //Inicializando "Result";

   sFlgTipoDesc  := '';     //Inicializando as variáveis;
   sFlgAtrsDevol := 'NULL'; //-----//
   sFlgIntEvento := '';     //-----//

   with qryOpcoes do
   begin
     if Active then
      Close;
     SQL.Clear;
   end;

   for i := 0 to clbOpcoes.Items.Count - 1 do
       if clbOpcoes.Checked[i]
       then begin //Atenção! A Opção "Inscritos e Desligados" não entra no CASE;
          case i of
               0: //Benefícios;
                if sFlgTipoDesc = '' then
                 sFlgTipoDesc := '''B'''
                else
                 sFlgTipoDesc := sFlgTipoDesc + ', ''B''';

               1: //Contribuições Assistenciais;
                if sFlgTipoDesc = '' then
                 sFlgTipoDesc := '''A'''
                else
                 sFlgTipoDesc := sFlgTipoDesc + ', ''A''';

               2: //Contribuições de Empréstimo;
                if sFlgTipoDesc = '' then
                 sFlgTipoDesc := '''E'''
                else
                 sFlgTipoDesc := sFlgTipoDesc  + ', ''E''';

               4: //Taxas ou Valores das Contribuições Mensais;
                begin
                   if sFlgTipoDesc = ''
                   then sFlgTipoDesc := '''P'''
                   else sFlgTipoDesc := sFlgTipoDesc  + ', ''P''';
                   sFlgAtrsDevol := '''N'',''A'', ''D''';
                end;
          end; // case
       end; // if

   {-----}

   if (sFlgTipoDesc = '')        and
      (not clbOpcoes.Checked[3]) then //Se "sFlgTipoDesc" estiver vazio e "Inscritos e Desligados" não estiver marcado, então nenhuma Opção de Envio foi especificada;
   begin
     MsgDlg('Atenção! Nenhuma Opção de Envio foi especificada.', 'Erro', mtError, [mbOK], 0);
     Result := False;
     Exit;
   end;

   {-----}

   with qryOpcoes.SQL do //Construindo o SQL;
   begin
     Add('SELECT IDPLANOPREV,         MATRICULA, ');
     Add('       INSCRICAONUMERO,              ');
     Add('       NVL(VALORBASE1,0) AS VALORBASE1,  NVL(VALORBASE2,0) AS VALORBASE2, NVL(VALORBASE3, 0) AS VALORBASE3, ');
     Add('       FLGDESCONTO,          ');
     Add('       CODPROVDESC,         FLGINTEVENTO, ');
     Add('       IDPESSOA,            SEQPROPOSTA, ');
     Add('       MAX(IDDESCONTO) AS IDDESCONTO,   MAX(MESREFERENCIA) AS MESREFERENCIA, SUM(VALOR) AS VALOR ');

     If Not prmbAgrupaMaiorParcela
      Then Add(', FLGTIPODESC,  PARCELA,  NUMPARCELAS  ,VALORINFO ')
      Else Add(', FLGTIPODESC,  MAX(PARCELA) AS PARCELA,  MAX(NUMPARCELAS) AS NUMPARCELAS, MAX(VALORINFO) AS VALORINFO ');

     Add(', DATAINICIO');

     Add('FROM   TMPDESC');
     Add('WHERE  FLGDESCFOLHA = ''P'''); //Só Previdenciário;

     Add(' AND NVL(SITENVIO, ''0'') <> 9 '); 

     //Filtrando pelo Mês de Cobrança;
     Add('AND MESCOBRANCA = ''' + DataRef + '''');

     if Trim(sFlgTipoDesc) <> ''  then
        Add('AND FLGTIPODESC IN (' + sFlgTipoDesc + ')');

     If (clbOpcoes.Checked[3]) And (Not clbOpcoes.Checked[5])
      Then Begin
         Add('AND IDPESSOA = (SELECT PP.IDPESSOA');
         Add('                FROM PARTPREVPLAN PP');
         Add('                WHERE PP.IDPESSOA = TMPDESC.IDPESSOA');
         Add('                  AND PP.FLGDESATIVADO = 0');
         Add('                  AND PP.DATACANCELAMENTO IS NULL)');
      End;

     if sFlgAtrsDevol <> 'NULL' then
     begin
        Add('AND FLGATRASODEVOL IN (' + sFlgAtrsDevol + ')');
     end
     else
     begin
        Add(' AND ((FLGTIPODESC <> ''P'') OR (EXISTS (SELECT 1 FROM CONTPLANPATRO  '+
            '                                         WHERE IDPLANOPREV = TMPDESC.IDPLANOPREV  '+
            '                                         AND IDCONTRIBUICAO = TMPDESC.IDDESCONTO  '+
            '                                         AND IDPESSJUR = TMPDESC.IDPESSJUR        '+
            '                                         AND FLGTPVLR IN (''V'',''B'') )))');
     end;


     Add('AND IDPESSJUR   = :IDPESSJUR');   //Parâmetros para filtragem por Patrocinadora e Plano;
     Add('AND IDPLANOPREV = :IDPLANOPREV'); //-----//


     //AGRUPAR POR RUBRICAS
     Add('GROUP BY IDPLANOPREV,      MATRICULA, ');
     Add('         INSCRICAONUMERO,  NVL(VALORBASE1,0),   NVL(VALORBASE2,0),   NVL(VALORBASE3,0), ');
     Add('         FLGDESCONTO,      CODPROVDESC, FLGINTEVENTO,                                   ');
     Add('         IDPESSOA,         SEQPROPOSTA                                                  ');
     If Not prmbAgrupaMaiorParcela
      Then Add(', FLGTIPODESC,  PARCELA,  NUMPARCELAS, VALORINFO ')
      Else Add(', FLGTIPODESC,  MAX(PARCELA) AS PARCELA,  MAX(NUMPARCELAS) AS NUMPARCELAS, MAX(VALORINFO) AS VALORINFO '); //CPREV-26396-17/10/2007

     Add(', DATAINICIO ');

     if clbOpcoes.Checked[3] then //Se a Opção "Inscritos e Desligados" estiver marcada;
     begin
       Add('UNION ALL');

       Add('SELECT IDPLANOPREV,             MATRICULA, ');
       Add('       INSCRICAONUMERO,              ');
       Add('       NVL(VALORBASE1,0) AS VALORBASE1, NVL(VALORBASE2,0) AS VALORBASE2, NVL(VALORBASE3,0) AS VALORBASE3, ');
       Add('       FLGDESCONTO,          ');
       Add('       CODPROVDESC,          FLGINTEVENTO, ');
       Add('       IDPESSOA,            SEQPROPOSTA, ');
       Add('       MAX(IDDESCONTO) AS IDDESCONTO, MAX(MESREFERENCIA) AS MESREFERENCIA, SUM(VALOR) AS VALOR  ');

       If Not prmbAgrupaMaiorParcela
        Then Add(', FLGTIPODESC,  PARCELA,  NUMPARCELAS  ,VALORINFO ')
        Else Add(', FLGTIPODESC,  MAX(PARCELA) AS PARCELA,  MAX(NUMPARCELAS) AS NUMPARCELAS, MAX(VALORINFO) AS VALORINFO ');

       Add(', DATAINICIO ');

       Add('FROM   TMPDESC');
       Add('WHERE  FLGDESCFOLHA = ''P''');

       Add(' AND NVL(SITENVIO, ''0'') <> 9 '); 

       Add('AND MESCOBRANCA = ''' + DataRef + '''');
       Add('AND FLGTIPODESC = ''P''');

       Add('AND FLGINTEVENTO IN (''IP'', ''RM'', ''DC'', ''RA'', ''DM'', ''DS'', ''DA'')');

       Add('AND IDPESSJUR   = :IDPESSJUR');
       Add('AND IDPLANOPREV = :IDPLANOPREV');
       Add('AND IDMODULO <> 32 '); 
       Add(' AND ((FLGTIPODESC <> ''P'') OR (EXISTS ( SELECT 1 FROM CONTPLANPATRO  '+
           '                                          WHERE IDPLANOPREV = TMPDESC.IDPLANOPREV  '+
           '                                          AND IDCONTRIBUICAO = TMPDESC.IDDESCONTO  '+
           '                                          AND IDPESSJUR = TMPDESC.IDPESSJUR        '+
           '                                          AND FLGTPVLR IN (''V'',''B'') )))');

       //AGRUPAR POR RUBRICAS
       Add('GROUP BY IDPLANOPREV,             MATRICULA, ');
       Add('       INSCRICAONUMERO,              ');
       Add('       NVL(VALORBASE1,0), NVL(VALORBASE2,0), NVL(VALORBASE3,0), ');
       Add('       FLGDESCONTO,          ');
       Add('       CODPROVDESC,          FLGINTEVENTO, ');
       Add('       IDPESSOA,            SEQPROPOSTA    ');

       If Not prmbAgrupaMaiorParcela
        Then Add(', FLGTIPODESC,  PARCELA,  NUMPARCELAS  ,VALORINFO ')
        Else Add(', FLGTIPODESC ');

       Add(', DATAINICIO ');
     end;
     Add('ORDER BY MATRICULA, CODPROVDESC '); //CPREV-26936-17/10/2007
   end;

   with qryOpcoes.Params do //Construindo a Lista de Parâmetros;
   begin
     Clear; //Limpando a lista de Parâmetros existente na Query;

     {-----}

     CreateParam(ftFloat, 'IDPESSJUR', ptInput);   //Criando os novos Parâmetros;
     CreateParam(ftFloat, 'IDPLANOPREV', ptInput); //-----//

     if clbOpcoes.Checked[3] then //Se a Opção "Inscritos e Desligados" estiver marcada;
     begin
       CreateParam(ftFloat, 'IDPESSJUR', ptInput);   //Criar 2 vezes pois os mesmos aparecem também depois do "UNION ALL";
       CreateParam(ftFloat, 'IDPLANOPREV', ptInput); //-----//
     end;
   end;

   try
    qryOpcoes.Prepare;
    except on Error: Exception do
    begin
      MsgDlg('Atenção! Não foi possível preparar os dados de acordo com as Opções de Envio devido ao erro: ' + Error.Message,
             'Erro', mtError, [mbOK], 0);
      Result := False;
    end;
   end;
 end;

var
 i  : Integer;
 Qry: TwwQuery;
 Cmd: array[0..254] of Char;

 bAchou: Boolean;
 Data13: string[7];

 cOperacao,
 cTipoEnvPrev: Char;

 sConteudo: string;
begin
  inherited;

  if Trim(dblookupPatrocinadora.Text) = '' then
  begin
    MsgDlg('Atenção! Nenhuma Patrocinadora foi especificada.', 'Erro', mtError, [mbOK], 0);
    dblookupPatrocinadora.SetFocus;
    Exit;
  end;

  if Trim(deDataRef.Text) = '' then
  begin
    MsgDlg('Atenção! A Data de Referência deve ser especificada.', 'Erro', mtError, [mbOK], 0);
    deDataRef.SetFocus;
    Exit;
  end;

  if Trim(deDataCob.Text) = '' then
  begin
    MsgDlg('Atenção! A Data de Cobrança deve ser especificada.', 'Erro', mtError, [mbOK], 0);
    deDataCob.SetFocus;
    Exit;
  end;

  if Trim(edTxt.Text) = '' then
  begin
    MsgDlg('Atenção! O Arquivo Destino deve ser especificado.', 'Erro', mtError, [mbOK], 0);
    edTxt.SetFocus;
    Exit;
  end;

  {-----}

  HabilitarBotoes(False);

  {-----}

  Screen.Cursor := crHourGlass;

  //Criando o Arquivo texto;
  AssignFile(Arquivo, edTxt.Text);
  Rewrite(Arquivo);

  DataRef := Copy(deDataCob.Text, 7, 4) + '/' + Copy(deDataCob.Text, 4, 2);

  //Carregando a data de abono quando for o mês 12 senão é igual ao mês de referência;
  if Copy(deDataCob.Text, 4, 2) = '12' then
   Data13 := Copy(deDataCob.Text, 7, 4) + '/13'
  else
   Data13 := DataRef;

  if not VerificaOpcoesEnvio then
  begin
    Screen.Cursor := crDefault;
    Application.ProcessMessages;
    HabilitarBotoes(True);
    CloseFile(Arquivo);
    Exit;
  end;

  {-----}

  //Verificando se algum Plano foi selecionado;
  strPlanosSel := '';

  TotalReg := 0;

  bAchou := False;

  for i := 0 to clbPlanos.Items.Count - 1 do
  if clbPlanos.Checked[i] then
  begin
    bAchou := True;
  end;

  if not bAchou then
  begin
    MsgDlg('Atenção! Nenhum Plano foi selecionado.', 'Erro', mtError, [mbOK], 0);
    Screen.Cursor := crDefault;
    Application.ProcessMessages;

    HabilitarBotoes(True);
    pgctrlInterface.ActivePage := tbsContrib;
    CloseFile(Arquivo);
    Exit;
  end;


  {-----}

  frmAguardeEnvioRec.Mostra('Iniciando o Processo...');

  {-----}

  //Preparando a "qryOpcoes";
  if not PrepararOpcoes then
  begin
    Screen.Cursor := crDefault;
    Application.ProcessMessages;
    HabilitarBotoes(True);
    CloseFile(Arquivo);
    Exit;
  end;

  //Passando parâmetros e abrindo as Queries de dados a serem exportados;
  frmAguardeEnvioRec.lblMensagem.Caption := 'Abrindo tabelas para envio...';
  Application.ProcessMessages;

  //Passagem dos parâmetros para as Queries de leitura para gravação em TXT;
  with qryOpcoes do
   try
    ParamByName('IDPESSJUR').AsInteger   := qryPatro.FieldByName('IDPESSOA').AsInteger;
    ParamByName('IDPLANOPREV').AsInteger := qryPlanos.FieldByName('IDPLANOPREV').AsInteger;

    Open;
    except on Error: Exception do
    begin
      Screen.Cursor := crDefault;
      MsgDlg('Atenção! Não foi possível concluir a busca dos dados de acordo com as Opções de Envio devido ao erro: ' + Error.Message,
             'Erro', mtError, [mbOK], 0);
      frmAguardeEnvioRec.Apaga;
      HabilitarBotoes(True);
      CloseFile(Arquivo);
      Exit;
    end;
   end;

  with qrySaldoReserva do
  begin
    if not Active then
     try
      qrySaldoReserva.Open;
      except on Error: Exception do
      begin
        Screen.Cursor := crDefault;
        MsgDlg('Atenção! Não foi possível concluir a busca dos Saldos de Reserva devido ao erro: ' + Error.Message,
               'Erro', mtError, [mbOK], 0);
        frmAguardeEnvioRec.Apaga;
        HabilitarBotoes(True);
        CloseFile(Arquivo);
        Exit;
      end;
     end;
  end;

  //Gravando Cabeçalho se houver no TXT;
  with frmAguardeEnvioRec do
  begin
    Pos := 0;
    lblMensagem.Caption := 'Preparando Header do arquivo texto...';
    with Animate1 do
    begin
      CommonAVI := aviFindFile;
      Center    := False;
      Active    := True;
    end;
  end;
  Application.ProcessMessages;

  Linha := '';

  with qryHeader do
  begin
    Open;
    First;

    with frmAguardeEnvioRec do
     Max := RecordCount;

    while not EOF do
    begin
      //A condição feita a seguir serve para verificar se o campo do Header é um campo válido.
      //Essa verificação é necessária e deve ser feita da forma abaixo descrita;

      if (FieldByName('IDCAMPO').AsInteger <> 1)  and  //Identificador do Registro;
         (FieldByName('IDCAMPO').AsInteger <> 2)  and  //Preenchendo;
         (FieldByName('IDCAMPO').AsInteger <> 14) and  //Data da Emissão da Interface;
         (FieldByName('IDCAMPO').AsInteger <> 15) and  //Data de Referência;
         (FieldByName('IDCAMPO').AsInteger <> 16) then //Código do arquivo;
      begin
        MsgDlg('Atenção! A configuração do Header da Interface de Envio está errada, verifique o Tipo da Ordem ' + FieldByname('ORDEM').AsString,
               'Erro', mtError, [mbOK], 0);
        frmAguardeEnvioRec.Apaga;
        Application.ProcessMessages;
        Screen.Cursor := crDefault;
        HabilitarBotoes(True);
        CloseFile(Arquivo);
        Exit;
      end;

      {-----}

      if FieldByName('IDCAMPO').AsInteger = 1 then //Identificador do Registro;
       sConteudo := FieldByName('IDENTIFICADOR').AsString;

      if FieldByName('IDCAMPO').AsInteger = 2 then //Preenchendo;
      begin
        if (Trim(FieldByName('TIPO').AsString) = 'Constante') or
           (Trim(FieldByName('TIPO').AsString) = 'zerados')   or
           (Trim(FieldByName('TIPO').AsString) = 'noves')     or
           (Trim(FieldByName('TIPO').AsString) = 'vazios')    then
         sConteudo := FieldByName('CONTEUDO').AsString
        else
        begin
          MsgDlg('Atenção! A configuração do Header da Interface de Envio está errada, verifique o Tipo da Ordem ' + FieldByname('ORDEM').AsString,
                 'Erro', mtError, [mbOK], 0);
          frmAguardeEnvioRec.Apaga;
          Application.ProcessMessages;
          Screen.Cursor := crDefault;
          HabilitarBotoes(True);
          CloseFile(Arquivo);
          Exit;
        end;
      end;

      if FieldByName('IDCAMPO').AsInteger = 14 then //Data da Emissão da Interface;
       sConteudo := FormatDateTime(FieldByName('FORMATO').AsString,Date);


      if FieldByName('IDCAMPO').AsInteger = 15 then //Data de Referência;
       sConteudo := FormatDateTime(FieldByName('FORMATO').AsString, StrToDateTime(deDataRef.Text));

      if FieldByName('IDCAMPO').AsInteger = 16 then //Código do arquivo;
       sConteudo := FieldByName('CONTEUDO').AsString;

      Linha     := Linha + sConteudo;
      sConteudo := '';

      Next;
      frmAguardeEnvioRec.Pos := frmAguardeEnvioRec.Pos + 1;
    end;

    Close;
  end;

  //Gravando o Header do arquivo Texto;
  if Linha <> '' then
     Writeln(Arquivo, Linha);
  Linha := '';

  //Gravando os Detalhes;

  with qryPlanos do
  begin
    First;

    for i := 0 to RecordCount - 1 do
    begin
      if clbPlanos.Checked[i] then
      begin
       //Passagem dos parâmetros para as Queries de leitura para gravação em TXT;
       with qryOpcoes do
        try
         close;

         ParamByName('IDPESSJUR').AsInteger   := qryPatro.FieldByName('IDPESSOA').AsInteger;
         ParamByName('IDPLANOPREV').AsInteger := qryPlanos.FieldByName('IDPLANOPREV').AsInteger;

         Open;
         except on Error: Exception do
         begin
           Screen.Cursor := crDefault;
           MsgDlg('Atenção! Não foi possível concluir a busca dos dados de acordo com as Opções de Envio devido ao erro: ' + Error.Message,
                  'Erro', mtError, [mbOK], 0);
           frmAguardeEnvioRec.Apaga;
           HabilitarBotoes(True);
           CloseFile(Arquivo);
           Exit;
         end;
        end;

        if not PreencherDetalhe then //O Plano que estiver marcado para Envio terá o equivalente a um "Detalhe";
        begin
          Screen.Cursor := crDefault;
          frmAguardeEnvioRec.Apaga;
          HabilitarBotoes(True);
          CloseFile(Arquivo);
          Exit;
        end;
      end;

      Next;
    end;
  end;

  //Gravando o Footer do arquivo;
  with frmAguardeEnvioRec do
  begin
    Pos := 0;
    lblMensagem.Caption := 'Preparando Footer do arquivo texto...';
    with Animate1 do
    begin
      CommonAVI := aviFindFile;
      Center    := False;
      Active    := True;
    end;
  end;
  Application.ProcessMessages;

  Linha := '';

  with qryFooter do
  begin
    Open;
    First;

    with frmAguardeEnvioRec do
     Max := RecordCount;

    while not EOF do
    begin
      if FieldByName('IDCAMPO').AsInteger = 1 then //Identificador do Registro;
       sConteudo := FieldByName('IDENTIFICADOR').AsString;

      if FieldByName('IDCAMPO').AsInteger = 2 then //Preenchendo;
      begin
        if (Trim(FieldByname('TIPO').AsString) = 'Constante') or
           (Trim(FieldByname('TIPO').AsString) = 'zerados')   or
           (Trim(FieldByname('TIPO').AsString) = 'noves')     or
           (Trim(FieldByname('TIPO').AsString) = 'vazios')    then
         sConteudo := FieldByName('CONTEUDO').AsString
        else
        begin
          MsgDlg('Atenção! A configuração do Footer da Interface de Envio está errada, verifique o Tipo da Ordem ' + FieldByname('ORDEM').AsString,
                 'Erro', mtError, [mbOK], 0);
          frmAguardeEnvioRec.Apaga;
          Application.ProcessMessages;
          Screen.Cursor := crDefault;
          HabilitarBotoes(True);
          CloseFile(Arquivo);
          Exit;
        end;
      end;

      //A condição feita a seguir serve para verificar se o campo do Footer é um campo válido.
      //Essa verificação é necessária e deve ser feita da forma abaixo descrita;

      { . Matrícula;
        . Inscrição;
        . Código da Rubrica;
        . Aviso de Exclusão de desconto de Contribuição;
        . Valores a serem creditados ou debitados;
        . Desconto ou Provento;
        . Tipo de Ação;
        . Número seqüencial por identificador;
        . Número seqüencial total; }

      case FieldByName('IDCAMPO').AsInteger of
       3, 4, 7,  8, 9,
       11, 12, 13, 17, 40:
       begin
         MsgDlg('Atenção! A configuração do Footer da Interface de Envio está errada, verifique o Tipo da Ordem ' + FieldByname('ORDEM').AsString,
                'Erro', mtError, [mbOK], 0);
         frmAguardeEnvioRec.Apaga;
         Application.ProcessMessages;
         Screen.Cursor := crDefault;
         HabilitarBotoes(True);
         CloseFile(Arquivo);
         Exit;
       end;
      end;

      {-----}

      if FieldByName('IDCAMPO').AsInteger = 10 then //Total de Registros;
       sConteudo := ColocaZeros(IntToStr(TotalReg), StrToInt(FieldByName('TAMANHO').AsString));

      if FieldByName('IDCAMPO').AsInteger = 14 then //Data da Emissão da Interface;
       sConteudo := FormatDateTime(FieldByName('FORMATO').AsString, Date);


      if FieldByName('IDCAMPO').AsInteger = 15 then //Data de Referência;
       sConteudo := FormatDateTime(FieldByName('FORMATO').AsString, StrToDateTime(deDataRef.Text));

      if FieldByName('IDCAMPO').AsInteger = 16 then //Código do arquivo;
       sConteudo := FieldByname('CONTEUDO').AsString;

      Linha     := Linha + sConteudo; 

      sConteudo := '';

      Next;
      frmAguardeEnvioRec.Pos := frmAguardeEnvioRec.Pos + 1;
    end;

    Close;
  end;

  //Gravando o Footer do Arquivo texto;
  if Linha <> '' then
     Writeln(Arquivo, Linha);

  //Fechando as Queries que não serão mais utilizadas;
  qryIds.Close;
  qryOpcoes.Close;
  qryDetalhes.Close;

  with frmAguardeEnvioRec do
  begin
    Pos := 0;
    lblMensagem.Caption := 'Gerando o arquivo texto...';
    with Animate1 do
    begin
      CommonAVI := aviFindComputer;
      Center    := False;
      Active    := True;
    end;
  end;
  Application.ProcessMessages;

  //Exportanto o memo para o Arquivo especificado;
  try
     CloseFile(Arquivo);
  except
     on Error: Exception do
     begin
        Screen.Cursor := crDefault;
        MsgDlg('Atenção! Não foi possível exportar os dados devido ao erro: ' + Error.Message,
               'Erro', mtError, [mbOK], 0);
        frmAguardeEnvioRec.Apaga;
        HabilitarBotoes(True);
        CloseFile(Arquivo);
        Exit;
     end;
  end;

  //Fechando o "Form Aguarde" e habilitando novamente os botões;
  frmAguardeEnvioRec.Apaga;
  HabilitarBotoes(True);

  Application.ProcessMessages;
  //Atualizando a tabela "CTRLINTERFACE";

  //Controle de Interface;
  if not AtualizaCtrlInterfaceCCP(1, FormatDateTime('dd/mm/yyyy', Date), DataRef) then 
  begin
    MsgDlg('Atenção! Um Erro ocorreu ao atualizar a tabela de Controle de Interface. O processo foi interrompido.',
           'Erro', mtError, [mbOK], 0);
    Application.ProcessMessages;
    HabilitarBotoes(True);
    CloseFile(Arquivo);
    Exit;
  end;

  //Verificando o Fechamento do Mês;

  if MsgDlg('Arquivo de Envio gerado com sucesso. Deseja efetuar o Fechamento do mês para as Opções de Envio selecionadas?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    cOperacao    := ' '; //Inicializando as Variáveis;
    cTipoEnvPrev := ' '; //-----//

    Qry := TwwQuery.Create(Self);
    with Qry do
     DataBaseName := qryPatro.DatabaseName;

    for i := 0 to 2 do //Apenas os 3 primeiros itens;
     if clbOpcoes.Checked[i] then
     begin
       case i of
       0: //Benefício;
        begin
          cOperacao    := 'B';
          cTipoEnvPrev := ' ';
        end;

       1: //Contribuições Assistenciais;
        begin
          cOperacao    := 'A';
          cTipoEnvPrev := ' ';
        end;

       2: //Contribuições de Empréstimo;
        begin
          cOperacao    := 'E';
          cTipoEnvPrev := ' ';
        end;
       end;

       //O Fechamento é feito por Opção de Envio e não por Patrocinadora;
       if not FechaMesSistema(Qry, DataRef, FormatDateTime('dd/mm/yyyy', Date), qryPatro.FieldByName('IDPESSOA').AsInteger,
                              32 {Módulo CCP}, cOperacao, cTipoEnvPrev) then
        MsgDlg('Atenção! Um Erro ocorreu ao efetuar o Fechamento do mês. O processo foi interrompido.',
               'Erro', mtError, [mbOk], 0);
     end;

    //Tratamento para "Inscritos e Desligados" e "Taxas os Valores das Contribuições Mensais";
    if (clbOpcoes.Checked[3]) and
       (clbOpcoes.Checked[4]) then
    begin
      cOperacao    := 'P';
      cTipoEnvPrev := 'A'; //Ambos;
    end
    else
    if (clbOpcoes.Checked[3]) then
    begin
      cOperacao    := 'P';
      cTipoEnvPrev := 'N';
    end
    else
    if (clbOpcoes.Checked[4]) then
    begin
      cOperacao    := 'P';
      cTipoEnvPrev := 'V';
    end
    else
    begin
      cOperacao    := ' ';
      cTipoEnvPrev := ' ';
    end;

    if (cOperacao    <> ' ') and
       (cTipoEnvPrev <> ' ') then
     if not FechaMesSistema(Qry, DataRef, FormatDateTime('dd/mm/yyyy', Date), qryPatro.FieldByName('IDPESSOA').AsInteger, 
                            32 {Módulo CCP}, cOperacao, cTipoEnvPrev) then
      MsgDlg('Atenção! Um Erro ocorreu ao efetuar o Fechamento do mês. O processo foi interrompido.',
             'Erro', mtError, [mbOk], 0);

    with Qry do
    begin
      Close;
      Free;
    end;
  end;

  {-----}

  //Exibindo o Arquivo texto;
  StrPCopy(Cmd, 'notepad.exe ' + edTxt.Text);
  WinExec(Cmd, sw_ShowNormal);
  HabilitarBotoes(False);
  bbtnSair.Enabled      := True; 

  {-----}

  Screen.Cursor := crDefault;
end;

function TfrmInterfaceEnvio.PreencherDetalhe: Boolean;

 //Função responsável por buscar o "ValorBase" correto na TMPDESC;
 function BuscaValorContribuicao(const lIdPessJur, lIdPlanoPrev,
                                       lIdDesconto, lIdPessoa: LongInt;
                                 const MesCobranca: string;
                                 const bValorBase: Char): Extended;
 begin
   Result := 0; //Inicializando "Result";

   with TwwQuery.Create(Self) do
   begin
     DataBaseName := qryPatro.DatabaseName;

     SQL.Add('SELECT VALORBASE1, VALORBASE2, VALORBASE3, VALOR');
     SQL.Add('FROM   TMPDESC');
     SQL.Add('WHERE  IDPESSJUR   = '   +  IntToStr(lIdPessJur));
     SQL.Add('AND    IDPLANOPREV = '   +  IntToStr(lIdPlanoPrev));
     SQL.Add('AND    IDDESCONTO  = '   +  IntToStr(lIdDesconto));
     SQL.Add('AND    IDPESSOA    = '   +  IntToStr(lIdPessoa));
     SQL.Add('AND    MESCOBRANCA = ''' +  MesCobranca + '''');

     Open;

     if not IsEmpty then
      case bValorBase of
      ' ': //Neste caso, o esperado é valor e não "ValorBase";
       Result := FieldByName('VALOR').AsFloat;
      '1':
       Result := FieldByName('VALORBASE1').AsFloat;
      '2':
       Result := FieldByName('VALORBASE2').AsFloat;
      '3':
       Result := FieldByName('VALORBASE3').AsFloat;
      end;

     Close;
     Free;
   end;
 end;

var
 sConteudo, sMesAux    : string;
 rValor : real;
 cValorBase   : Char;
 fValorContrib: Extended;
 C1, C2: LongInt;
 bZerado : boolean;
 i       : word;   
 iTam, iTamMat, iTamFormato,              
 iFlgValor,                               
 iTamPar                       : Integer; 
begin
  Result := True;   //Inicializando o "Result";
  C1 := 48;
  C2 := 57;
  with qryIds do
  begin
    Open;
    First;

    with qryDetalhes do //Query de Detalhes;
    begin
      Close;
      ParamByName('IDLAYOUTENVIO').AsInteger := QryLayout.FieldByName('IDLAYOUTENVIO').AsInteger;
    end;

    with frmAguardeEnvioRec do
    begin
      Pos := 0;
      Max := qryOpcoes.RecordCount;
      lblMensagem.Caption := 'Iniciando o Plano "' + qryPlanos.FieldByName('IDPLANOPREV').AsString + '"...';
      with Animate1 do
      begin
        CommonAVI := aviCopyFiles;
        Center    := True;
        Active    := True;
      end;
    end;
    Application.ProcessMessages;

    while not EOF do
    begin
      with frmAguardeEnvioRec do
      begin
        Pos := 0;
        lblMensagem.Caption := 'Identificador ' + FieldByName('IDENTIFICADOR').AsString + ' do Plano "' + qryPlanos.FieldbyName('NOME').AsString + '"...';
      end;

      Application.ProcessMessages;

      with qryDetalhes do //Query de Detalhes com o próximo "IDENTIFICADOR";
      begin
        Close;
        ParamByName('IDENTIFICADOR').AsString := qryIds.FieldByName('IDENTIFICADOR').AsString;
        Open;
      end;

      qryDetalhes.First;

      if (not qryOpcoes.IsEmpty)   and
         (not qryDetalhes.IsEmpty) then
      begin
        qryOpcoes.First;

        while not qryOpcoes.EOF do
        begin
          qryDetalhes.First;
          bZerado := false;

          while not qryDetalhes.EOF do //Montando a linha do texto com o dado da Query;
          begin
            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 1 then //Identificador do Registro;
             sConteudo := CompletaNum(qryDetalhes.FieldByName('IDENTIFICADOR').AsString); 

            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 2 then //Preenchendo;
            begin
              if (Trim(qryDetalhes.FieldByName('TIPO').AsString) = 'Constante') or
                 (Trim(qryDetalhes.FieldByName('TIPO').AsString) = 'zerados')   or
                 (Trim(qryDetalhes.FieldByName('TIPO').AsString) = 'noves')     or
                 (Trim(qryDetalhes.FieldByName('TIPO').AsString) = 'vazios')    then
               sConteudo := qryDetalhes.FieldByName('CONTEUDO').AsString
              else
              begin
                MsgDlg('Atenção! A configuração do Detalhe da Interface de Envio está errada, verifique o Tipo da Ordem ' + qryDetalhes.FieldByName('ORDEM').AsString,
                       'Erro', mtError, [mbOK], 0);
                Result := False;
                Exit;
              end;
            end;

            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 18 then //Inclusão ou Exclusão;
             sConteudo := CompletaNum(qryOpcoes.FieldByName('FLGINTEVENTO').AsString); 
            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 3 then  //Matrícula;
             If Trim(qryDetalhes.FieldByName('FORMATO').AsString) = ''
              Then
                sConteudo := CompletaNum(qryOpcoes.FieldByName('MATRICULA').AsString)  

              Else
                Begin
                  iTam    := 1;
                  iTamMat := 1;
                  sConteudo := '';
                  iTamFormato := Length(qryDetalhes.FieldByName('FORMATO').AsString);
                  if iTamFormato < QryDetalhes.FieldByName('TAMANHO').AsInteger Then
                     iTamFormato := QryDetalhes.FieldByName('TAMANHO').AsInteger;
                  for iTam := 1 to iTamFormato Do Begin
                     if copy(qryDetalhes.FieldByName('FORMATO').AsString,iTam,1) <> '9' Then Begin
                        if copy(qryDetalhes.FieldByName('FORMATO').AsString,iTam,1) = 'X' Then Begin
                             sConteudo := sConteudo + copy(qryOpcoes.FieldByName('MATRICULA').AsString,iTamMat,1);
                             inc(iTamMat);
                        end
                        else if copy(qryDetalhes.FieldByName('FORMATO').AsString,iTam,1) = '0' Then Begin
                             inc(iTamMat);
                        end
                        else Begin
                             sConteudo := sConteudo + copy(qryDetalhes.FieldByName('FORMATO').AsString,iTam,1);
                        end;
                     end
                     else if copy(qryDetalhes.FieldByName('FORMATO').AsString,iTam,1) = '9' Then Begin
                             While (Ord(qryOpcoes.FieldByName('MATRICULA').AsString[iTamMat]) < C1) and
                                   (Ord(qryOpcoes.FieldByName('MATRICULA').AsString[iTamMat]) > C2)
                             Do Begin            // enquanto for <> 0 a 9
                                inc(iTamMat);
                             end;
                             sConteudo := sConteudo + copy(qryOpcoes.FieldByName('MATRICULA').AsString,iTamMat,1);
                             inc(iTamMat);
                     end;
                  end;
                  {--------------------}
                  sConteudo := CompletaNum(sConteudo);
                End;
             //
            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 4 then //Inscrição;
             sConteudo := CompletaNum(qryOpcoes.FieldByName('INSCRICAONUMERO').AsString); 

            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 7 then //Aviso de Exclusão de desconto de Contribuição;
            begin
              MsgDlg('Atenção! A configuração do Detalhe da Interface de Envio está errada, verifique o Tipo da Ordem ' + qryDetalhes.FieldByName('ORDEM').AsString,
                     'Erro', mtError, [mbOK], 0);
              Result := False;
              Exit;
            end;

            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 24 then //Identificador do Plano;
             sConteudo := CompletaNum(qryOpcoes.FieldByName('IDPLANOPREV').AsString);

            if (qryDetalhes.FieldByName('IDCAMPO').AsInteger = 8) or //Valores a serem creditados ou debitados
               (qryDetalhes.FieldByName('IDCAMPO').AsInteger = 41) or //CPREV-26396-17/10/2007-Saldo de Empréstimo
               (qryDetalhes.FieldByName('IDCAMPO').AsInteger = 42) then //CPREV-26396-17/10/2007-Proventos, Descontos ou Informativo
            begin
              //CPREV-26396-17/10/2007-INICIO
              try
                if (qryDetalhes.FieldByName('IDCAMPO').AsInteger = 8) then
                  rValor := qryOpcoes.FieldByName('VALOR').AsFloat;
                if (qryDetalhes.FieldByName('IDCAMPO').AsInteger = 41) then
                begin
                  if (qryOpcoes.FieldByName('FLGDESCONTO').AsInteger = 2) and
                     (qryOpcoes.FieldByName('FLGTIPODESC').AsString = 'E') then
                    rValor := qryOpcoes.FieldByName('VALORINFO').AsFloat
                  else
                    rValor := 0;
                end;
                if (qryDetalhes.FieldByName('IDCAMPO').AsInteger = 42) then
                begin
                  if (qryOpcoes.FieldByName('FLGDESCONTO').AsInteger = 2) then
                  begin
                    if qryOpcoes.FieldByName('VALORINFO').AsFloat > 0 then
                      rValor := qryOpcoes.FieldByName('VALORINFO').AsFloat
                    else
                      if qryOpcoes.FieldByName('VALOR').AsFloat > 0 then
                        rValor := qryOpcoes.FieldByName('VALOR').AsFloat
                      else
                        rValor := 0;
                  end
                  else
                    rValor := qryOpcoes.FieldByName('VALOR').AsFloat;
                end;
              except
                rValor := 0;
              end;
              //CPREV-26396-17/10/2007-FIM
              //Obs.: No código abaixo passou a usar rValor ao invés de qryOpcoes.FieldByName('VALOR').AsFloat

              if qryDetalhes.FieldByName('FLGSEPARADOR').AsInteger <> 1 then
                sConteudo := CompletaNum(TiraCaracter(FloatToStrF(rValor,ffFixed,15,2),','))  
              else
              begin
                sConteudo := CompletaNum(TiraCaracter(FloatToStrF(rValor,ffFixed,15,2),',')); 
                sConteudo := Copy(sConteudo,2, Length(sConteudo)-3 )+'.'+Copy(sConteudo, Length(sConteudo)-1 ,2); 
              end;

              bZerado := (rValor = 0.00);
            end;

            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 10 then //Total de Registros;
             sConteudo := CompletaNum(IntToStr(TotalReg));

            if (qryDetalhes.FieldByName('IDCAMPO').AsInteger = 11) or   //Tipo de Ação;
               (qryDetalhes.FieldByName('IDCAMPO').AsInteger = 12) then //Número sequêncial por identificador;
            begin
              MsgDlg('Atenção! A configuração do Detalhe da Interface de Envio está errada, verifique o Tipo da Ordem ' + qryDetalhes.FieldByName('ORDEM').AsString,
                     'Erro', mtError, [mbOK], 0);
              Result := False;
              Exit;
            end;

            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 13 then //Número sequêncial total;
             sConteudo := CompletaNum(IntToStr(TotalReg)); 

            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 14 then //Data da Emissão da Interface;
             sConteudo := FormatDateTime(QryDetalhes.FieldByName('FORMATO').AsString, Date);


            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 40 then //Data original da concessão do empréstimo
             sConteudo := FormatDateTime(QryDetalhes.FieldByName('FORMATO').AsString,
                                         qryOpcoes.FieldByname('DATAINICIO').AsDateTime);

            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 15 then //Data de Referência;
            begin

             //inicio - tratamento mês 13
             if Copy(qryOpcoes.FieldByName('MESREFERENCIA').AsString,6,2)  = '13' then
                sMesAux := '12'
             else sMesAux := Copy(qryOpcoes.FieldByName('MESREFERENCIA').AsString,6,2);

             sConteudo := FormatDateTime(QryDetalhes.FieldByName('FORMATO').AsString,
                          StrToDate('01/' + sMesAux + '/' +
                          Copy(qryOpcoes.FieldByName('MESREFERENCIA').AsString, 1, 4)));

             if Copy(qryOpcoes.FieldByName('MESREFERENCIA').AsString,6,2)  = '13' then
             begin
                sConteudo := copy(sconteudo,1,pos('M',uppercase(QryDetalhes.FieldByName('FORMATO').AsString)) -1) +
                             '13'+
                             copy(sconteudo,pos('M',uppercase(QryDetalhes.FieldByName('FORMATO').AsString)) +2,length(sConteudo) );
             end;
            end;

            //Atendendo ao empréstimo.

            //CPREV-26396-17/10/2007-INICIO
            if ((qryDetalhes.FieldByName('IDCAMPO').AsInteger = 26) or
                (qryDetalhes.FieldByName('IDCAMPO').AsInteger = 27) or
                (qryDetalhes.FieldByName('IDCAMPO').AsInteger = 28)) then
            begin
              if ((qryOpcoes.FieldByName('FLGDESCONTO').AsInteger = 0) or
                  (qryOpcoes.FieldByName('FLGDESCONTO').AsInteger = 1)) and
                 (qryOpcoes.FieldByName('FLGTIPODESC').AsString = 'E') then
              begin
                if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 26 then //Parcela
                  sConteudo := CompletaNum(qryOpcoes.FieldByName('PARCELA').AsString); 

                if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 27 then //Total de Parcelas
                  sConteudo := CompletaNum(qryOpcoes.FieldByName('NUMPARCELAS').AsString); 

                if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 28 then //N. de Parcelas Restantes
                  sConteudo := CompletaNum(qryOpcoes.FieldByName('VALORINFO').AsString); 
              end
              else
                sConteudo := CompletaNum('0');
            end;
            //CPREV-26396-17/10/2007-FIM

            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 16 then //Código do arquivo;
             sConteudo := CompletaNum(QryDetalhes.FieldByName('CONTEUDO').AsString); 

            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 17 then //Código da Rubrica;
            //CPREV-26936-21/09/2007-INICIO
            begin
              if pos('NUM', uppercase(Trim(qryDetalhes.FieldByName('TIPO').AsString))) > 0 then
                sConteudo := CompletaNum(qryOpcoes.FieldByName('CODPROVDESC').AsString)
              else
                sConteudo := CompletaString(
                  qryOpcoes.FieldByName('CODPROVDESC').AsString,
                  ' ',
                  QryDetalhes.FieldByName('TAMANHO').AsInteger,
                  True);
            end;
            //CPREV-26936-21/09/2007-FIM

            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 23 then //Idade do participante na Inscrição;
            begin
              with TwwQuery.Create(Self) do //Calculando a idade do Participante no momento da Inscrição;
              begin
                DataBaseName := qryPatro.DataBaseName;

                SQL.Add('SELECT TRUNC(MONTHS_BETWEEN(TO_DATE(''' + BuscaDataInscricao + ''', ''dd/mm/yyyy''), TO_DATE(''' + BuscaDataNasc + ''', ''dd/mm/yyyy'')), 0) AS DIF');
                SQL.Add('FROM DUAL');

                try
                 Open;
                 except on Error: Exception do
                 begin
                   MsgDlg('Atenção! Não foi possível verificar a idade do Participante devido ao erro: ' + Error.Message,
                          'Erro', mtError, [mbOK], 0);
                   Result := False;
                   Exit;
                 end;
                end;

                sConteudo := ColocaZeros(IntToStr(Trunc(FieldByName('DIF').AsInteger/12)), 2);

                {-----}

                Close;
                Free;
              end;
            end;

            fValorContrib := 0;

            //Buscando o Valor/Base da Contribuição;
            if qryDetalhes.FieldByName('IDCAMPO').AsInteger = 25 then
            begin
              qryContrib.Locate('IDCONTRIBUICAO', qryOpcoes.FieldByName('IDDESCONTO').AsInteger,
                                [loCaseInsensitive]);

              if (qryContrib.FieldByName('FLGTPVLR').AsString = 'V') or
                 (trim(qryContrib.FieldByName('VALORBASE').AsString) = '') then //Se for "Valor", não necessita de Valor Base (Taxa);
               cValorBase := ' '
              else
               cValorBase := qryContrib.FieldByName('VALORBASE').AsString[1];

              //se for atraso / devolução enviar como valor
              //mesmo sendo uma contribuição marcada para não enviar
              if qryContrib.FieldByName('FLGTPVLR').AsString = 'N'  then
                 cValorBase := ' ';

              //para o assistencial sempre enviar o valor
              if uppercase(qryOpcoes.FieldByName('FLGTIPODESC').AsString) = 'A'  then
                 cValorBase := ' ';

              case cValorBase of
              ' ': //Neste caso, o esperado é valor e não "ValorBase";
               fValorContrib := qryOpcoes.FieldByName('VALOR').AsFloat;
              '1':
               fValorContrib := qryOpcoes.FieldByName('VALORBASE1').AsFloat;
              '2':
               fValorContrib := qryOpcoes.FieldByName('VALORBASE2').AsFloat;
              '3':
               fValorContrib := qryOpcoes.FieldByName('VALORBASE3').AsFloat;
              end;

              i := Pos('.',qryDetalhes.FieldByName('FORMATO').AsString );
              if i <= 0
              then i := Pos(',',qryDetalhes.FieldByName('FORMATO').AsString );

              If qryDetalhes.FieldByName('FLGVALOR').AsInteger = 0
               Then iFlgValor := 0
               Else iFlgValor := 2;

              iTamPar := Length(Copy( qryDetalhes.FieldByName('FORMATO').AsString, i+1, Length(qryDetalhes.FieldByName('FORMATO').AsString) ));

              If iTamPar = 0
               Then iTamPar := Length(FloatToStr(fValorContrib));

              sConteudo := CompletaNum((TiraCaracter( 
                                                 FloatToStrF(fValorContrib,ffNumber, 
                                                             iTamPar,    
                                                             iFlgValor), 
                                                 DecimalSeparator) ));

              bZerado := (fValorContrib = 0.00);
            end;

            {-----}

            Linha     := Linha + sConteudo; 
            sConteudo := '';

            qryDetalhes.Next;
          end;


          //if not bZerado then begin //CPREV-26396-21/09/2007
             Inc(TotalReg);
             Writeln(Arquivo, Linha);
          //end; //CPREV-26396-21/09/2007

          Linha := '';

          qryOpcoes.Next;
          frmAguardeEnvioRec.Pos := frmAguardeEnvioRec.Pos + 1;
        end;
      end;

      Next;
    end;
  end;
end;

procedure TfrmInterfaceEnvio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechando as Queries;

  if qryHeader.Active then
   qryHeader.Close;

  if qryDetalhes.Active then
   qryDetalhes.Close;

  if qryFooter.Active then
   qryFooter.Close;

  if qryIds.Active then
   qryIds.Close;

  if qryOpcoes.Active then
   qryOpcoes.Close;

  if qrySaldoReserva.Active then
   qrySaldoReserva.Close;

  {-----}

  qryContrib.Close;
  qryPlanos.Close;
  qryPatro.Close;
  QryLayout.Close;  
  inherited;
end;

procedure TfrmInterfaceEnvio.clbPlanosClick(Sender: TObject);
begin
  inherited;
  SetaPlano;
end;

procedure TfrmInterfaceEnvio.clbPlanosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key in [VK_UP, VK_DOWN] then
   SetaPlano;
end;

procedure TfrmInterfaceEnvio.FormCreate(Sender: TObject);
var
 i: Integer;
begin
  inherited;
  odTxt.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Henrique Massão
  EdTxt.text:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Marcando todas as Opções de Envio;
  for i := 0 to clbOpcoes.Items.Count - 1 do
   clbOpcoes.Checked[i] := True;
end;

procedure TfrmInterfaceEnvio.dblookupPatrocinadoraChange(Sender: TObject);
begin
  inherited;

  {-----}

  if qryPlanos.Active then
   with clbPlanos do //Atualizando o CheckListBox de Planos;
   begin
     Items.Clear;

     qryPlanos.First;

     while not qryPlanos.EOF do
     begin
       Items.Add(qryPlanos.FieldByName('NOME').AsString);
       qryPlanos.Next;
     end;

     qryPlanos.First;

     ItemIndex    := 0;
     PosicaoPlano := 0;
   end;

   bbtnConfirmar.Enabled := True;
   bbtnSair.Enabled      := True;

end;

procedure TfrmInterfaceEnvio.dblookupPatrocinadoraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dblookupPatrocinadoraChange(Sender);
end;

procedure TfrmInterfaceEnvio.FormShow(Sender: TObject);
begin
  inherited;
  AtualizarDados;

  {-----}

  with qryPatro do // Selecionando automaticamente a Primeira Patrocinadora da Lista; //
  begin
    if RecordCount > 0 then
     dblookupPatrocinadora.Text := FieldByName('NOME').AsString;
  end;
  QryLayout.Open;

  If Trim(prmPathAutorEnv) <> ''
   Then Begin
     odTxt.InitialDir := prmPathAutorEnv;
     edTxt.Text       := prmPathAutorEnv+'\Envio.Txt';
   End
   Else Begin
     //Henrique Massão
     //odTxt.InitialDir := 'C:\';
     odTxt.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
     //Henrique Massão
     //edTxt.Text       := 'C:\Envio.Txt';
     edTxt.Text       := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\Envio.Txt';

   End;
end;

function TfrmInterfaceEnvio.CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
var sResult : String;
    i ,iDif : Integer;
begin

   if  Length(trim(sEnt)) > nTam then
       sResult := copy(trim(sEnt),1,nTam)
   else
   begin
       iDif := abs(Length(trim(sEnt)) - nTam);
       sResult := trim(sEnt);

       if bDireita   then
       begin
          for i := 1 to iDif do
          sResult := sResult + sComp;
       end
       else
       begin
          for i := 1 to iDif do
          sResult := sComp + sResult;
       end;
   end;

   Result := sResult;

end;

function TfrmInterfaceEnvio.CompletaNum(psConteudo : String): String;
Var
 iDif   : Integer;
 sTexto : String;
begin
 sTexto := psConteudo;

 If pos('NUM', uppercase(Trim(qryDetalhes.FieldByName('TIPO').AsString))) > 0
  Then
   If qryDetalhes.FieldByName('FLGCOMPBRANCOS').AsInteger = 1
    Then Begin
      iDif := qryDetalhes.FieldByName('TAMANHO').AsInteger - Length(Trim(psConteudo));
      sTexto := '';
      While iDif > 0 do
       Begin
         sTexto := sTexto + ' ';
         Dec(iDif);
       End;
       sTexto := sTexto + Trim(psConteudo);
    End
    Else sTexto := ColocaZeros(psConteudo, qryDetalhes.FieldByName('TAMANHO').AsInteger);
  Result := sTexto;
end;

procedure TfrmInterfaceEnvio.odTxtCanClose(Sender: TObject;
  var CanClose: Boolean);
Var
 sPath : String;
begin
  inherited;
  If odTxt.InitialDir = odTxt.FileName
   Then sPath := prmPathAutorEnv
   Else sPath := Copy(ExtractFilePath(odTxt.FileName),1, Length(ExtractFilePath(odTxt.FileName))-1) ;

  CanClose := True;

  If (Trim(prmPathAutorEnv) <> '') And (sPath <> prmPathAutorEnv )
   Then Begin
     MsgDlg('O local do arquivo escolhido não é autorizado.'+#13+
            'Escolha arquivos somente do endereço: '+prmPathAutorEnv+'.','Aviso',mtWarning,[mbOk],0);
     CanClose := False;
   End;
end;

end.


