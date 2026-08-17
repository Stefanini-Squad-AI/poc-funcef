// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
// Autor(a)    : Claudio Faria
// Data        : 31/05/2008
// Rotina      : Qry
// Pendência   : 21964 (ReAbertura)
// Descricao   : Criado um float alternativo para a geração do arquivo eletrônico.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 13/11/2006
// Rotina      : Qry
// Pendência   : 21964
// Descricao   : Criar dois parametros de Float e float alternativo para data programada.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Várias
//  Data       : 06/03/2006
//  Pendencia  : 21346
//  Alteração  : Criar tipo de conta OP, para a qual não é obrigatório
//               informar a conta corrente. Definir portador específico.
//------------------------------------------------------------------------------
unit fCadBancoPortadorCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  wwdblook{$IFNDEF VER0505}, uCMTypes, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  Wwdbspin {$ENDIF}, UMensErro, UDatabase, uAdmPrevFB;

type
  TfrmCadBancoPortadorCS = class(TFrmCadastroGridCS)
    dblcBanco: TwwDBLookupCombo;
    lblBanco: TLabel;
    qryBanco: TwwQuery;
    qryIDBANCOPORTFORMA: TFloatField;
    qryIDBANCO: TFloatField;
    qryCODPORTFORMA: TFloatField;
    qryDFLOATPAGTO: TFloatField;
    qryCOLVALOR: TFloatField;
    qryTAMVALOR: TFloatField;
    qryPREFIXOARQ: TStringField;
    qryTIPOFOLHA: TStringField;
    qryNOMEFOLHA: TStringField;
    qrySITUACAO: TStringField;
    qryNOMESITUACAO: TStringField;
    qryTIPOCONTA: TStringField;
    qryNOMECONTA: TStringField;
    qryNUMBANCO: TStringField;
    qryNOME: TStringField;
    qryDESCRICAO: TStringField;
    lblPortadorForma: TLabel;
    dblcPortador: TwwDBLookupCombo;
    qryPortadorForma: TwwQuery;
    dbcboxTipoFolha: TwwDBComboBox;
    dbcboxTipoConta: TwwDBComboBox;
    dbcboxSituacao: TwwDBComboBox;
    lblTipoFolha: TLabel;
    lblTipoConta: TLabel;
    lblSituacao: TLabel;
    gboxArqElet: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    lblDiasArquivo: TLabel;
    dbspinDias: TwwDBSpinEdit;
    dbspinCol: TwwDBSpinEdit;
    dbspinTam: TwwDBSpinEdit;
    dbePrefixo: TwwDBEdit;
    qryAux: TwwQuery;
    qryIDMODULO: TFloatField;
    qryIDFUNDACAO: TFloatField;
    Label2: TLabel;
    dblcFavorecido: TwwDBLookupCombo;
    qryIDFAVORECIDO: TFloatField;
    qryFavorecido: TwwQuery;
    dbspinProgramada: TwwDBSpinEdit;
    dbspinAlternativa: TwwDBSpinEdit;
    Label3: TLabel;
    Label7: TLabel;
    qryDFLOATPROG: TFloatField;
    qryDFLOATPROGALTER: TFloatField;
    Bevel2: TBevel;
    Bevel3: TBevel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    Label8: TLabel;
    qryDFLOATPAGTOALTER: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure ControlExit(Sender: TObject);
  private
    FIdBanco: integer;
    FSituacao: string;
    FTpConta: string;
    FTpFolha: string;
    { Private declarations }
    function PegaCodigo: longint;
    function ValidaCampos: boolean;
    function ValidaExclusao: boolean;
    procedure SetIdBanco(const Value: integer);
    procedure SetSituacao(const Value: string);
    procedure SetTpConta(const Value: string);
    procedure SetTpFolha(const Value: string);
    procedure HabilitaControles;
  public
    { Public declarations }
    property IdBanco: integer read FIdBanco write SetIdBanco;
    property TpFolha: string read FTpFolha write SetTpFolha;
    property TpConta: string read FTpConta write SetTpConta;
    property Situacao: string read FSituacao write SetSituacao;
  end;

var
  frmCadBancoPortadorCS: TfrmCadBancoPortadorCS;

implementation

{$R *.DFM}

procedure TfrmCadBancoPortadorCS.HabilitaControles;
begin
end;

procedure TfrmCadBancoPortadorCS.ControlExit(Sender: TObject);
begin
  HabilitaControles;
end;

procedure TfrmCadBancoPortadorCS.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qryIDBANCO.isnull then
    IdBanco:=-1
  else
    IdBanco:=qryIDBANCO.asinteger;
  TpFolha:=qryTIPOFOLHA.asstring;
  TpConta:=qryTIPOCONTA.asstring;
  Situacao:=qrySITUACAO.asstring;
end;

procedure TfrmCadBancoPortadorCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if qryIDBANCO.isnull then
    qryIDBANCO.asinteger:=-1;
  HabilitaControles;
end;

procedure TfrmCadBancoPortadorCS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dblcBanco.enabled:=true;
  dbcboxTipoFolha.enabled:=true;
  dbcboxTipoConta.enabled:=true;
  dbcboxSituacao.enabled:=true;
  qryDFLOATPAGTO.asinteger:=0;
  qryCOLVALOR.asinteger:=0;
  qryTAMVALOR.asinteger:=0;
  qryTIPOFOLHA.asstring:='D';
  qrySITUACAO.asstring:='D';
  qryIDBANCO.asinteger:=-1;
  qryTIPOCONTA.asstring:='D';
end;

function TfrmCadBancoPortadorCS.PegaCodigo: longint;
begin
  result:=LeUltRegistro(nil,'BANCOPORTFORMA');
end;

function TfrmCadBancoPortadorCS.ValidaCampos: boolean;
 var ssql: string;

 //verifica se existe banco, tipo folha, tipo conta e situacao
 function ExisteRegistro: boolean;
 begin
   ssql:='SELECT 1 '+
         'FROM BANCOPORTFORMA ';
   if qryIDBANCO.asinteger = -1 then
     ssql:=ssql+'WHERE IDBANCO IS NULL '
   else
     ssql:=ssql+'WHERE IDBANCO = '+inttostr(qryIDBANCO.asinteger)+' ';
   ssql:=ssql+
         'AND IDMODULO = 18 '+
         'AND IDFUNDACAO = '+inttostr(iidfundacao)+' '+
         'AND TIPOFOLHA = '+QuotedStr(qryTIPOFOLHA.asstring)+' '+
         'AND TIPOCONTA = '+QuotedStr(qryTIPOCONTA.asstring)+' '+
         'AND SITUACAO = '+QuotedStr(qrySITUACAO.asstring)+' ';
   result:=FazQuery(qryAux, ssql);
   if result then
   begin
     if CmeCadastro.Operacao = opAlterar then
       MsgDlg('Este registro já existe, portanto a alteração não pode ser realizada.',
              'Atenção', mtError,[mbOk,mbHelp], 0)
     else
       MsgDlg('Este registro já existe, portanto a inclusão não pode ser realizada.',
              'Atenção', mtError,[mbOk,mbHelp], 0);
   end
 end;

 //verifica se existe padrao geral
 function ExistePadraoGeral: boolean;
 begin
   ssql:='SELECT 1 '+
         'FROM BANCOPORTFORMA '+
         'WHERE IDBANCO IS NULL '+
         'AND IDMODULO = 18 '+
         'AND IDFUNDACAO = '+inttostr(iidfundacao)+' '+
         'AND TIPOFOLHA = ''D'' '+
         'AND TIPOCONTA = ''D'' '+
         'AND SITUACAO = ''D'' ';
   result:=FazQuery(qryAux, ssql);
   if not result then
   begin
     MsgDlg('É obrigatório se selecionar inicialmente a Contas/Caixas x Forma de Pagamento para conjunto '+
            'Padrão de Banco, Tipo Conta, Tipo Folha e Situação.','Atenção', mtError,
            [mbOk,mbHelp], 0);
     exit;
   end;
 end;

begin
  result:=false;
  if (qryIDBANCO.isnull) then
  begin
    MsgDlg('Deve-se informar o Banco.','Atenção',mtError,[mbOk,mbHelp], 0);
    dblcBanco.setfocus;
    exit;
  end;
  if (qryCODPORTFORMA.isnull) then
  begin
    MsgDlg('Deve-se informar a Contas/Caixas x Forma de Pagamento.','Atenção',mtError,[mbOk,mbHelp], 0);
    dblcPortador.setfocus;
    exit;
  end;
  if (qryTIPOFOLHA.isnull) then
  begin
    MsgDlg('Deve-se informar o Tipo de Folha.','Atenção',mtError,[mbOk,mbHelp], 0);
    dbcboxTipoFolha.setfocus;
    exit;
  end;
  if (qryTIPOCONTA.isnull) then
  begin
    MsgDlg('Deve-se informar o Tipo de Conta.','Atenção',mtError,[mbOk,mbHelp], 0);
    dbcboxTipoConta.setfocus;
    exit;
  end;
  if (qrySITUACAO.isnull) then
  begin
    MsgDlg('Deve-se informar a Situação.','Atenção',mtError,[mbOk,mbHelp], 0);
    dbcboxSituacao.setfocus;
    exit;
  end;
  if (CmeCadastro.Operacao = opInserir) or
     (IdBanco <> qryIDBANCO.asinteger) or
     (TpFolha <> qryTIPOFOLHA.asstring) or
     (TpConta <> qryTIPOCONTA.asstring) or
     (Situacao <> qrySITUACAO.asstring) then
  begin
    if ExisteRegistro then
    begin
      bbtnCancelar.setfocus;
      exit;
    end;
  end;
  if (qryIDBANCO.asinteger <> -1) or
     (qryTIPOFOLHA.asstring <> 'D') or
     (qryTIPOCONTA.asstring <> 'D') or
     (qrySITUACAO.asstring <> 'D') then
  begin
    if not ExistePadraoGeral then
    begin
      bbtnCancelar.setfocus;
      exit;
    end;
  end;
  if qryCOLVALOR.asinteger = 0 then
    MsgDlg('Se Coluna não é informada o Valor a Pagar não poderá ser determinado no '+
           'Relatório de Arquivo Eletrônico.', 'Atenção',
           mtError,[mbOk,mbHelp], 0);
  if qryTAMVALOR.asinteger = 0 then
    MsgDlg('Se Tamanho não é informado o Valor a Pagar não poderá ser determinado no '+
           'Relatório de Arquivo Eletrônico.', 'Atenção',
           mtError,[mbOk,mbHelp], 0);
  if qryPREFIXOARQ.asstring = '' then
    MsgDlg('Se Prefixo do Arquivo não é informado o Arquivo Eletrônico não poderá ser determinado no '+
           'Relatório de Arquivo Eletrônico.', 'Atenção',
           mtError,[mbOk,mbHelp], 0);
  result:=true;
end;

procedure TfrmCadBancoPortadorCS.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  if ValidaCampos then
  begin
    Accept:=true;
    if CmeCadastro.Operacao = opInserir then
    begin
      qryIDBANCOPORTFORMA.asinteger:=PegaCodigo;
      IdBanco:=qryIDBANCO.asinteger;
      TpFolha:=qryTIPOFOLHA.asstring;
      TpConta:=qryTIPOCONTA.asstring;
      Situacao:=qrySITUACAO.asstring;
    end;
    qryNOMEFOLHA.asstring:=dbcboxTipoFolha.text;
    qryNOMESITUACAO.asstring:=dbcboxSituacao.text;
    qryNOMECONTA.asstring:=dbcboxTipoConta.text;
    qryNUMBANCO.asstring:=qryBanco.fieldbyname('NUMBANCO').asstring;
    qryNOME.asstring:=dblcBanco.text;
    qryDESCRICAO.asstring:=dblcPortador.text;
    if qryIDBANCO.asinteger = -1 then
      qryIDBANCO.clear;
    qryIDFUNDACAO.asfloat:=iidfundacao;
  end
  else
  begin
    Accept:=false;
    exit;
  end;
  inherited;
end;

procedure TfrmCadBancoPortadorCS.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert:=false;
end;

function TfrmCadBancoPortadorCS.ValidaExclusao: boolean;
begin
  result:=not((qryIDBANCO.isnull) and
              (qryTIPOFOLHA.asstring = 'D') and
              (qryTIPOCONTA.asstring = 'D') and
              (qrySITUACAO.asstring = 'D'));
  if not result then
    MsgDlg('O registro com parâmetros Padrão não pode ser excluído.',
           'Atenção', mtError,[mbOk,mbHelp], 0);
end;

procedure TfrmCadBancoPortadorCS.sbtnApagarClick(Sender: TObject);
begin
  if not ValidaExclusao then
  begin
    CmeCadastro.Operacao:=opIdle;
    CmeCadastro.AtualizaBotoes(Self);
    exit;
  end;
  inherited;
end;

procedure TfrmCadBancoPortadorCS.SetIdBanco(const Value: integer);
begin
  FIdBanco := Value;
end;

procedure TfrmCadBancoPortadorCS.SetSituacao(const Value: string);
begin
  FSituacao := Value;
end;

procedure TfrmCadBancoPortadorCS.SetTpConta(const Value: string);
begin
  FTpConta := Value;
end;

procedure TfrmCadBancoPortadorCS.SetTpFolha(const Value: string);
begin
  FTpFolha := Value;
end;

procedure TfrmCadBancoPortadorCS.FormCreate(Sender: TObject);
begin
  inherited;
  dbcboxTipoFolha.items.clear;
  dbcboxTipoFolha.items.add('EXTRA'#9'2');
  dbcboxTipoFolha.items.add('PROVISÓRIO'#9'V');
  dbcboxTipoFolha.items.add('RESERVA'#9'R');
  dbcboxTipoFolha.items.add('PADRÃO'#9'D');
  dbcboxTipoConta.items.clear;
  dbcboxTipoConta.items.add('CONTA CORRENTE'#9'1');
  dbcboxTipoConta.items.add('OP/RECIBO'#9'4');
  dbcboxTipoConta.items.add('PADRÃO'#9'D');
  dbcboxSituacao.items.clear;
  dbcboxSituacao.items.add('CONSIGNATÁRIO/FAVORECIDO'#9'3');
  dbcboxSituacao.items.add('PADRÃO'#9'D');
end;

procedure TfrmCadBancoPortadorCS.FormShow(Sender: TObject);
 var ssql: string;
begin
  inherited;
  dbGrd.bringtofront;
  qryBanco.open;
  ssql:='SELECT CODPORTFORMA, DESCRICAO '+
        'FROM PORTADORFORMA '+
        'WHERE RECPAG = ''P'' '+
        'AND IDPESSOA = '+inttostr(iidfundacao)+' '+
        'ORDER BY DESCRICAO';
  qryPortadorForma.sql.clear;
  qryPortadorForma.sql.add(ssql);
  qryPortadorForma.open;

  ssql:=
  'SELECT BP.IDBANCOPORTFORMA, '+
         'BP.IDBANCO, '+
         'BP.CODPORTFORMA, '+
         'BP.DFLOATPAGTO, '+
         'BP.DFLOATPAGTOALTER, '+
         'BP.COLVALOR, '+
         'BP.TAMVALOR, '+
         'BP.PREFIXOARQ, '+
         'BP.TIPOFOLHA, '+
         'DECODE(BP.TIPOFOLHA,''D'',''PADRÃO'', '+
                             '''2'',''EXTRA'', '+
                             '''R'',''RESERVA'', '+
                             '''V'',''PROVISÓRIO'') AS NOMEFOLHA, '+
         'BP.SITUACAO, '+
         'DECODE(BP.SITUACAO,''D'',''PADRÃO'', '+
                            '''3'',''CONSIGNATÁRIO/FAVORECIDO'') AS NOMESITUACAO, '+
         'BP.TIPOCONTA, '+
         'DECODE(BP.TIPOCONTA,''D'',''PADRÃO'', '+
                             '''1'',''CONTA CORRENTE'', '+
                             '''4'',''OP/RECIBO'''+
                             ') AS NOMECONTA, '+
         'B.NUMBANCO, '+
         'NVL(PB.NOME,''PADRÃO'') AS NOME, '+
         'PF.DESCRICAO, '+
         'BP.IDFAVORECIDO, '+ 
         'BP.IDMODULO, '+
         'BP.IDFUNDACAO, '+
         'BP.DFLOATPROG, ' +
         'BP.DFLOATPROGALTER ' +
  'FROM BANCOPORTFORMA BP, BANCO B, PESSOA PB, PORTADORFORMA PF '+
  'WHERE BP.IDBANCO = B.IDPESSOA(+) '+
  'AND BP.IDMODULO = 18 '+
  'AND B.IDPESSOA = PB.IDPESSOA(+) '+
  'AND PF.CODPORTFORMA = BP.CODPORTFORMA '+
  'AND BP.IDFUNDACAO = '+inttostr(iidfundacao)+' '+
  'ORDER BY B.NUMBANCO, NOMEFOLHA, NOMECONTA, NOMESITUACAO ';
  qry.sql.clear;
  qry.sql.add(ssql);
  qry.open;
end;

end.
{==============================================================================|
| UNIT: FCADBANCOPORTADORCS                                                    |
| DESCRIÇÃO FUNCIONAL:                                                         |
| - NOVO CADASTRO CS PARA REGISTRO DA TABELA BANCOPORTFORMA.                   |
| - ABERTURA DE OPÇÕES POR:                                                    |
|   * TIPO DE FOLHA                                                            |
|   * SITUAÇÃO DO RECEBEDOR OU PAGAMENTO                                       |
|   * TIPO DA CONTA BANCÁRIA                                                   |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09.05.2003 A 09.05.2003                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| CRIAÇÃO DO NOVO FORM.                                                        |
|                                                                              |
|------------------------------------------------------------------------------|                                                                                   |
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/06/2003 A 06/06/2003                         |
| PENDÊNCIA: 14189                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05e                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| COLOCAR FILTRO DO CAMPO IDMODULO DA FOLHA NAS CONSULTAS DA BANCOPORTORMA.    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/07/2003 A 09/07/2003                         |
| PENDÊNCIA: 14473                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO PARA MULTIFUNDACAO                                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/09/2003 A 08/09/2003                         |
| PENDÊNCIA: 14992                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.02A                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CRIAR CAMPO IDFAVORECIDO NA TABELA BANCOPORTFORMA, QUE SERÁ UTILIZADO NA   |
| EFETIVAÇÃO DA FOLHA NA GERAÇÃO DO DOCUMENTO DE ARQUIVO ELETRÔNICO.           |
|                                                                              |
|------------------------------------------------------------------------------}
