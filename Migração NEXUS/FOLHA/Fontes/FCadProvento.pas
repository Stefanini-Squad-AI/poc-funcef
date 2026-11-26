// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{***************************************************************************************
--------------------------------------------------------------------------------
Pendência   : SIG136844
Data        : 22/06/2023
Responsável : Andre Imakawa
Descrição   : Refazer SIG 99651
--------------------------------------------------------------------------------
Pendência   : SIG99651
Data        : 10/05/2023
Responsável : Andre Imakawa
Descrição   : Desfazer SIG 99651
--------------------------------------------------------------------------------
Pendência   : SIG53825
Data        : 27/02/2019
Responsável : Edilaine
Descrição   : Criação de parâmetro nas rubricas salariais para não efetuar o
              pagamento de pensões alimentícias aos favorecidos pela Folha quando
              estas são pagas pelo INSS mas o favorecido deve sair na DIRF 
--------------------------------------------------------------------------------
Pendência   : SIG58950.59454
Data        : 01/12/2017
Responsável : Osni Cavalcante
Descrição   : Criação de parâmetro nas rubricas salariais para tratar a
              incidência das contribuições do equacionamento na base de cálculo
              das pensões alimentícias
--------------------------------------------------------------------------------
Pendência   : SIG 29310
Responsável : Andre Imakawa
Data        : 19/09/2016
Descrição   : Ao desmarcar os combos chkBenef e chkContrib não está gravando Null
            na base.
Rotina      : btnConfirmarClick
--------------------------------------------------------------------------------
Pendência   : SIG 22246
Responsável : Darivaldo Alencar
Data        : 04/08/2016
Descrição   : adicionado Combo: Mapa da Folha
Rotina      :
--------------------------------------------------------------------------------
//Nº SIG.....: 27129
//Data ......: 11/08/2016
//Alteração..: Não habilitar os campos chkGeral e chkAssistencial
//Responsável: André Imakawa
//Descrição..: Solicito alterar a tela de rubricas salariais da folha de benefícios
//             para que seja desabilitada a informação de categoria de rubrica
//             "Geral" e "assistencial".
//--------------------------------------------------------------------------------
//Nº SIG: 23410
//Data ......: 17/06/2016
//Alteração..: Comentar a atribuição de 0 para as flags na operação confirmar.
//Responsável: Felipe A. Santos
//Descrição: Comentar a atribuição de 0 para as flags na operação confirmar.
//--------------------------------------------------------------------------------
//Nº SOL.....: 270913
//PPM........: 1348256
//Data ......: 29/03/2016
//Alteração..: dbchkCompoeDIRFResg estava utilizando o datafield do campo
//             DBCheckBox4. Alterado a função insereComposicaoDIRFResgate para
//             ComposicaoDIRFResgate para incluir e excluir o idmotivo = 3106
//             updRubxEvento - no DeleteSQL foi inserido o IDMotivo = 1
//             da tabela RUBXEVENTO.
//Responsável: André Imakawa
//Descrição:  Erro no cadastro de rubricas salariais referente aos parâmetros
//            "Salário de participação atuarial" e "Compõe DIRF de resgate".
//--------------------------------------------------------------------------------
{***************************************************************************************
//Nº SOL.....: 2425739 / 16949
//PPM........: 979572
//Data ......: 03/09/2015
//Alteração..: inclusão da FLAG "Compõe DIRF de Resgate"
//             (bbtnConfirmarClick, Function insereComposicaoDIRFResgate )
//Responsável: Robson Andrade
//Descrição:  Ao marcar a "Compõe DIRF de Resgate" alterar FLAG no banco
//--------------------------------------------------------------------------------
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração  : qry (inclusao view), upd (dfm)  (remoção dos flags)
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba "Incidência de
            Eventos" do cadastro de rubricas salariais
****************************************************************************************}
//--------------------------------------------------------------------------------
//Pendência   : SOL 151061 - KINTANA 1105188
//Responsável : MARCIO MORAIS
//Data        : 01/03/2013
//Descrição   : Correções de Calculo do IR Regressivo
//--------------------------------------------------------------------------------
//Pendência   : SOL 164620/11384 KINTANA 1816211
//Responsável : William Santana
//Data        : 20/03/2014
//Descrição   : Contabilização da Folha de Benefícios
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748/14312 KINTANA 1988667
//Responsável : FELIPE AZEVEDO DOS SANTOS
//Data        : 09/05/2013
//Descrição   : acerto nas 3 flgs criadas pelo MARCIO DENILSON.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 27/03/2012
//Descrição   : Mostar o componente chkExcessoDebito(Excesso de Débito)
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 26/01/2012
//Descrição   : Novo merge com código da versão de produção da fábrica
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 23/10/2012
//Descrição   : Inclusão do campo "Excesso de Débito"
//--------------------------------------------------------------------------------
//Data        : 13/06/2011
//Descrição   : Inclusão das opções "Encerramento proporcional no mês de falecimento" e
//              "Ação Judicial" utilizadas na rotina de Encerramento por falecimento
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 25/01/2011
//Descrição   : Inclusão da opção "Encerramento de Benefício" utilizada na rotina de
//              Encerramento por falecimento
//--------------------------------------------------------------------------------
//Pendência   : SOL 227249 KINTANA 2061286
//Responsável : Fernando Xavier
//Data        : 12/03/2014
//Descrição   : Erro ao excluir uma rubrica salarial.
//              Ao inserir uma nova rubrica o flag bitributação e o flag divida de
//              beneficio vem default em branco e o sistem não permite a criação
//              da rubrica pois não foi inserido a informação.
//--------------------------------------------------------------------------------
//Pendência   : SOL 174933 KINTANA 1733374
//Responsável : Douglas Siqueira
//Data        : 10/01/2014
//Descrição   : Controle de Saldo devedor.
//--------------------------------------------------------------------------------

//Pendência   : SOL 205322 KINTANA 1996527
//Responsável : Douglas.Siqueira
//Data        : 17/06/2013
//Descrição   : Gravar o campo Bitributacao
//--------------------------------------------------------------------------------

//Pendência   : SOL 179587 KINTANA 1659235
//Responsável : Douglas.Siqueira
//Data        : 03/07/2012
//Descrição   : Gravar o campo IR informativo no arquivo do contracheque
//--------------------------------------------------------------------------------

//Pendência   : SOL 136386/4901 KINTANA 1278330
//Responsável : Marcos Merola
//Data        : 14/09/2011
// Dfm        : FrmCadProvento
//Descrição   : Adicionado  a opção Rúbricas de Benefícios e Rúbricas de Contribuição
//--------------------------------------------------------------------------------
//Pendência   : SOL 157304 KINTANA 1252402
//Responsável : Fanuel Junior
//Data        : 26/07/2011
//Descrição   : Adequação da tela de Rubricas Salariais
//--------------------------------------------------------------------------------
//Pendência   : SOL 132994 KINTANA 773757
//Responsável : BRUNO AZEVEDO
//Data        : 06/04/2010
//Descrição   : Adicionado o campo flgmargem na tela.
//--------------------------------------------------------------------------------
// Autor(a)  : Henrique Massão
// Rotina    : bbtnConfirmarClick
// Data      : 22/01/2009
// Pendencia : SOL 106323 KINTANA 476859
// Descricao : Foi alterado a sistemática de cadastro de rubricas na
//             folha de benefícios não sendo mais necessário cadastrar os campos
//             "grupo da rubrica" e "linha do informe de rendimentos".
//------------------------------------------------------------------------------
// Autor(a)  : Renato Visoni
// Rotina    : bbtnConfirmarClick
// Data      : 24/06/2009
// Pendencia : SOL 121147 Kintana 579516
// Descricao : O sistema estava salvando sempre o flgInss = 0, agora se o fonte
// pagadora for igual a INSS o sistema vai salvar Flginss = 1.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : bbtnConfirmarClick
// Data      : 19/09/2007
// Pendencia : 22800
// Descricao : Criticar  a naureza de rendimento quando o informe estiver preenchido
//             e vice-versa
//------------------------------------------------------------------------------
// Autor(a)  : Bruno Bastos
// Rotina    : CmeCadastroBeforeConfirma
// Data      : 19/07/2007
// Pendencia : 25855
// Descricao : Só verificar a descrição da rubrica ao fazer uma inserção.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : CmeCadastroInsert
// Data      : 16/01/2007
// Pendencia : 21806
// Descricao : Atribuir codfontepagadora = 1 (fundação) para as novas rubricas.
//   Validar descrição de rubrica já existente.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Interface
// Data      : 11/05/2006
// Pendencia : 21978
// Descricao : Alteração da propriedade do componente dblkGrupoRubrica para
//   limpar o campo de Grupo de Rubrica.
//------------------------------------------------------------------------------
unit FCadProvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, wwdblook, Wwdotdot,
  Wwdbcomb, Mask, wwdbedit, CmEventosCadastro, uobjfolha, ImgList
  {$IFNDEF VERSAO0505}, uCMTypes, ComCtrls, fcLabel {$ENDIF};

type
  TFrmCadProvento = class(TFrmCadastroGridCS)
    Label2: TLabel;
    dbedDescricao: TwwDBEdit;
    qryRegra: TwwQuery;
    qryInformerendimento: TwwQuery;
    qryIRRFDARF: TwwQuery;
    grpTipoRubrica: TGroupBox;
    chkGeral: TCheckBox;
    chkAssistencial: TCheckBox;
    chkEmprestimo: TCheckBox;
    chkPatrocinadora: TCheckBox;
    chkFolhaBeneficio: TCheckBox;
    chkFolhaPagaFunda: TCheckBox;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    dbedDescPer: TwwDBEdit;
    Label4: TLabel;
    dbecodexterno: TDBEdit;
    qryFontepagadora: TwwQuery;
    qryGrupoRubrica: TwwQuery;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Bevel1: TBevel;
    qryEstruturadeCalculo: TwwQuery;
    pgcOpcoes: TPageControl;
    tbsGrupoRubrica: TTabSheet;
    pnlGrupoRubrica: TPanel;
    Label5: TLabel;
    dblkcmbflgAtrasoDevol: TwwDBComboBox;
    tbsTipoRubrica: TTabSheet;
    pnlTipoRubrica: TPanel;
    grpTipo: TGroupBox;
    chkVisivel: TCheckBox;
    rbNormal: TRadioButton;
    rbEspecial: TRadioButton;
    dbrgrpDesconto: TDBRadioGroup;
    pnlPrioridadeDesconto: TPanel;
    Label1: TLabel;
    dbedNumPrioridade: TDBEdit;
    rdgBcalc: TRadioGroup;
    GroupBox2: TGroupBox;
    dblkFontePagadora: TwwDBLookupCombo;
    tbsPrazo: TTabSheet;
    pnlPagina3: TPanel;
    LblEstadoRub: TLabel;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    dbcAceita: TDBCheckBox;
    dbckFLGDESCPENSAO: TDBCheckBox;
    dbchkObrigaFavorecido: TDBCheckBox;
    dbckIRRF: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DbCboEstadoRub: TwwDBComboBox;
    gbxPrazo: TDBRadioGroup;
    Pagina4: TTabSheet;
    pnlEstruturadeCalculo: TPanel;
    dbgEstruturadeCalculo: TwwDBGrid;
    dbcIRACJUD: TDBCheckBox;
    dsEstruturaCalculo: TwwDataSource;
    dbcboxFlgAgrupa: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    dbchkCompoeSalBenef: TDBCheckBox;
    dbchkCompoeSalPart: TDBCheckBox;
    dbcboxRubLegal: TDBCheckBox;
    qryAux: TwwQuery;
    dbcboxMargem: TDBCheckBox;
    dbchkRRA: TDBCheckBox;
    dbchkVisualConv: TDBCheckBox;
    grbExibeHist: TGroupBox;
    chkBenef: TCheckBox;
    chkContrib: TCheckBox;
    chkIrrfinf: TCheckBox;
    dbchkBitri: TDBCheckBox;
    dbchkDivBen: TDBCheckBox;///douglas.siqueira SOL205322
	chkEncerramento: TDBCheckBox;
    chkEncerramentoProporcialMesMorte: TDBCheckBox;
    chkAcao: TDBCheckBox;
    chkCorrrecaoMonetaria: TDBCheckBox;
    grpcontab: TGroupBox;
    dbchkFlgContAbono: TDBCheckBox;
    dbchkFlgContabBenef: TDBCheckBox;
    grp2: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    wwDBLookupCombo2REG: TwwDBLookupCombo;
    dblkcmbIdInfomeREG: TwwDBLookupCombo;
    dblkGrupoRubricaREG: TwwDBLookupCombo;
    grp1: TGroupBox;
    LblGrupoRubrica: TLabel;
    dblkGrupoRubrica: TwwDBLookupCombo;
    Label6: TLabel;
    dblkcmbIdInfome: TwwDBLookupCombo;
    Label7: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    updRubxEvento: TUpdateSQL;
    qryRubxEvento: TwwQuery;
    chkExcessoDebito: TDBCheckBox;
    dbchkCompoeDIRFResg: TDBCheckBox;
	gbxColunaMapa: TGroupBox;
    qryMapa: TwwQuery;
    dsMapa: TwwDataSource;
    dblkColunaMapa: TDBLookupComboBox;
    dbchkExcluiContribPA: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    tbsReinf: TTabSheet;
    pnlReinf: TPanel;
    grpExteriorReinf: TGroupBox;
    grpProgressivoReinf: TGroupBox;
    grpRegressivoReinf: TGroupBox;
    lblProgbd: TLabel;
    lblRegbd: TLabel;
    lblRegcd: TLabel;
    lblprogcd: TLabel;
    dblkProgBDReinf: TwwDBLookupCombo;
    dblkProgCDReinf: TwwDBLookupCombo;
    dblkRegrBDReinf: TwwDBLookupCombo;
    dblkRegrCDReinf: TwwDBLookupCombo;
    dblkExteriorReinf: TwwDBLookupCombo;
    qryNaturezaReinf: TwwQuery;
    procedure grpTipoExit(Sender: TObject);
    procedure rbEspecialClick(Sender: TObject);
    procedure rbNormalClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbrgrpDescontoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbrgrpDescontoChange(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dbedDescricaoExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure chkBenefClick(Sender: TObject);
    procedure chkContribClick(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);  //Felipe A. Santos SOL 136748/14312 KINTANA 1988667
    procedure dbchkFlgContabRubricaClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);//William Santana SOL 164620/11384 KIN 1816211
  private
    { Private declarations }
    guardatiporubr : string;
	procedure AtivaDesativaCombos;//Darivaldo Alencar SIG 22246
    Function iif(bCondicao : Boolean; vSeVerdadeiro, vSeFalso : Variant): Variant; //Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure guardatiporubrica;
    procedure PegaTipoRubrica;
    procedure Limpa_Chek_Box_TpRubrica;
    procedure SetaFlgEspecial;
    procedure AbreQryEstruturaCalculo;
    Function ComposicaoDIRFResgate(iIdProvento: Integer; sTipo: String): Boolean;



  public
    { Public declarations }

  end;

var
  FrmCadProvento: TFrmCadProvento;

implementation

Uses Umenserro, UDatabase, FTelaAut, USistema, uAdmPrevFB, uFolhaBenef, dBaseDados;

{$R *.DFM}

procedure TFrmCadProvento.FormCreate(Sender: TObject);
var ssql: string;
begin
  inherited;
  
  //Início - William Santana - SOL 164620.11384 KIN 1816211
  //Isso é para forcar multiplas linhas no checkbox :)
  SetWindowLong(dbchkFlgContAbono.Handle, GWL_STYLE,  GetWindowLong(dbchkFlgContAbono.Handle, GWL_STYLE) OR  BS_MULTILINE);
  dbchkFlgContAbono.caption := 'Contabiliza em conta especifica em caso de '+ #10 +'referência de abono ';
  //Término - William Santana - SOL 164620.11384 KIN 1816211

  //-- Marcos Merola SOL 136136386/4901 Kintana 1278330 - Inicio
  grbExibeHist.Enabled := False;
  chkContrib.Checked := False;
  chkIrrfinf.Checked := False;///douglas.siqueira
  chkBenef.Checked := False;
  //-- Marcos Merola SOL 136136386/4901 Kintana 1278330 - Fim


  //-- Marcio Morais SOL 151061 - Inicio
//  chkCorrrecaoMonetaria.Checked := False;
  //-- Marcio Morais SOL 151061 - Fim

  pnlFundo.Enabled := True;
  grpTipo.Enabled  := False;

  If prmflgverrubfolben = 1 then
  begin
    MontaSelect.Filtro.Add('FLGTPRUBRICA LIKE ''%B%''');
  end;

  ssql:='SELECT IDGRUPORUBRICA, DESCRICAO '+
        'FROM GRUPORUBRICA '+
        'ORDER BY DESCRICAO ';

  qryGrupoRubrica.close;
  qryGrupoRubrica.sql.clear;
  qryGrupoRubrica.sql.add(ssql);
  qryGrupoRubrica.Open;
  
  //Darivaldo Alencar SIG 22246 -inicio
  qryMapa.close;
  qryMapa.Open;
  AtivaDesativaCombos;
  //Darivaldo Alencar SIG 22246 -fim
end;

procedure TFrmCadProvento.FormShow(Sender: TObject);
begin
  inherited;
   // Andre Imakawa - SIG 27129 - Inicio
  If Sistema.IDModulo = 18 Then
  Begin
     chkGeral.Enabled := False;
     chkAssistencial.Enabled := False;
  End;
  // Andre Imakawa - SIG 27129 - Fim

  pnlFundo.Enabled := True;
  grpTipo.Enabled  := False;

  rdgBCalc.Visible := false;
  gbxPrazo.visible := ( prmFLGUSAPRAZORUB = 1 );
  If SistemaFolha.FLGESTADORUB = 0 Then
  Begin
    LblEstadoRub.Enabled   := False;
    DbCboEstadoRub.Enabled := False;
  end;
  pgcOpcoes.activepage:=tbsTipoRubrica;

  // FELIPE A. SANTOS SOL 136748/14312 KINTANA 1988667
  chkEncerramento.Checked := False;
  chkEncerramentoProporcialMesMorte.Checked := False;
  chkAcao.Checked := False;
  // FELIPE A. SANTOS SOL 136748/14312 KINTANA 1988667 FIM
end;

procedure TFrmCadProvento.Limpa_Chek_Box_TpRubrica;
Begin
  chkGeral.checked:=false;
  chkAssistencial.checked:=false;
  chkEmprestimo.checked:=false;
  chkPatrocinadora.checked:=false;
  chkFolhaBeneficio.checked:=false;
  chkFolhaPagaFunda.checked:=false;
end;

{Robson.Andrade - SOL242573 / 16949 PPM 979572 }
Function TFrmCadProvento.ComposicaoDIRFResgate(iIdProvento: Integer; sTipo: String): Boolean;
var
   objQry : TwwQuery;
   objQr2 : TwwQuery;
   bResult: Boolean;
   dtData : TDateTime;
begin
  bResult := true;
  dtData := Date;
  try
    objQry := TwwQuery.Create(Self);
    objQry.DatabaseName := 'BaseDados';
    objQry.SQL.Text := 'SELECT IDPROVENTO FROM RUBXEVENTO '                 +
                       'WHERE '                                             +
                       ' IDPROVENTO = '+ IntToStr(iIdProvento)              +
                       ' AND '                                              +
                       'IDMOTIVO = 3106';
    objQry.open;
    // André Imakawa -  SOL 270913 - PPM 1348256 - Inicio
    if (sTipo = 'I') and objQry.IsEmpty then
      begin
         objQry.Close;
         objQry.SQL.Clear;
         objQry.SQL.Text := 'INSERT INTO RUBXEVENTO '                           +
                            '(IDPROVENTO, IDMOTIVO) '                           +
                            ' VALUES ( '                                        +
                                        IntToStr(iIdProvento)                   +
                                       ',3106'                                  +
                                    ')';
         try
            objQry.ExecSQL;
         except
            bResult := false;
         end;

      end
    else if (sTipo = 'E') and (objQry.RecordCount > 0) then
      begin
         objQry.Close;
         objQry.SQL.Clear;
         objQry.SQL.Text := 'DELETE FROM RUBXEVENTO '                           +
                            ' WHERE ( IDPROVENTO = ' + IntToStr(iIdProvento)    +
                            ' AND  IDMOTIVO = 3106 )';

         try
            objQry.ExecSQL;
         except
            bResult := false;
         end;
       end
    else
      bResult := True;

      // André Imakawa -  SOL 270913 - PPM 1348256 - Fim
  finally
    FreeAndNil(objQry);
  end;
  Result := bResult;
end;


procedure TFrmCadProvento.SetaFlgEspecial;
 var liflgespecial : integer;
begin
  liflgespecial:=0;
  if rbEspecial.Checked then
  begin
    if chkVisivel.Checked then
      liflgespecial:=1
    else
      liflgespecial:=2;
  end;
  If qry.State in [dsInsert, dsEdit] Then
    qry.FieldByName('FLGESPECIAL').AsInteger:=liflgespecial;
end;

procedure TFrmCadProvento.grpTipoExit(Sender: TObject);
begin
  inherited;
  SetaFlgEspecial;
end;

procedure TFrmCadProvento.rbEspecialClick(Sender: TObject);
begin
  inherited;
  chkVisivel.Visible:=not rbNormal.Checked;
end;

procedure TFrmCadProvento.rbNormalClick(Sender: TObject);
begin
  inherited;
  chkVisivel.Visible:= not rbNormal.Checked;  
end;

procedure TFrmCadProvento.sbtnApagarClick(Sender: TObject);
begin
  if qry.FieldbyName('flgInterno').AsInteger = 1 then
  begin
    MsgDlg('Esta rubrica não pode ser excluída.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  inherited;
  // André Imakawa -  SOL 270913 - PPM 1348256 - Inicio
  if CmeCadastro.Operacao =  opVazio then
  Begin
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    if ComposicaoDIRFResgate(qry.FieldByName('IDPROVENTO').AsInteger, 'E') then
      dtmBaseDados.dbBaseDados.Commit
    else
      dtmBaseDados.dbBaseDados.Rollback
  end;
  // André Imakawa -  SOL 270913 - PPM 1348256 - Fim
  AtivaDesativaCombos;//Darivaldo Alencar SIG 22246
end;

procedure TFrmCadProvento.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if qry.FieldByName('FLGDESCPENSAO').AsString = '' then
     qry.FieldByName('FLGDESCPENSAO').AsInteger := 0;
  if qry.FieldByName('FLGCOMPOEREMTOTAL').AsString = '' then
     qry.FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;

  if Qry.FieldbyName('FLGSALPARTRETRO').AsString = '' then
     Qry.FieldbyName('FLGSALPARTRETRO').AsInteger := 0;
  if Qry.FieldbyName('FLGSALBENEFRETRO').AsString = '' then
     Qry.FieldbyName('FLGSALBENEFRETRO').AsInteger := 0;
  if Qry.FieldbyName('FLGSALPARTATUARIA').AsString = '' then
     Qry.FieldbyName('FLGSALPARTATUARIA').AsInteger := 0;

  // Marcos Merola 16/09 SOL 136386/4901 KINTANA 1278330 - Inicio
  grbExibeHist.Enabled := True;
  chkBenef.Checked   := (Qry.FieldbyName('FLGEXIBEHIST').AsString = 'B');
  chkContrib.Checked := (Qry.FieldbyName('FLGEXIBEHIST').AsString = 'C');
  chkIrrfinf.Checked := (Qry.FieldbyName('FLGIRRFINFORMATIVO').AsString = '1');///douglas.siqueira
  //-- Marcos Merola SOL 136136386/4901 Kintana 1278330 - Fim

  //-- Marcio Morais SOL 151061 - Inicio
//  chkCorrrecaoMonetaria.Checked := (Qry.FieldbyName('FLGCORRECAOMONETARIA').AsString = '1');
  //-- Marcio Morais SOL 151061 - Fim

  rdgBCalc.Enabled := True;
  grpTipo.Enabled  := True;   
  AtivaDesativaCombos;//Darivaldo Alencar SIG 22246
end;

procedure TFrmCadProvento.dbrgrpDescontoClick(Sender: TObject);
begin
  inherited;
  if dbrgrpDesconto.ItemIndex = 0 then
  begin // Provento
    dbedNumPrioridade.Text := '';
    pnlPrioridadeDesconto.Visible := False;
    dbckIRRF.Visible := True; // nao é desconto -> tem IRRF
  end
  else
  begin
    if dbrgrpDesconto.ItemIndex = 1 then // Desconto
    begin
      pnlPrioridadeDesconto.Visible := True;
      dbckIRRF.Checked := False;
      dbckIRRF.Visible := True; // é desconto -> tem IRRF (alterado por Pierre em 13/03)
      rdgBCalc.Visible := true; 
    end;
  end;
end;

procedure TFrmCadProvento.dbrgrpDescontoChange(Sender: TObject);
begin
  inherited;
  If dbrgrpDesconto.itemindex = 1 then
  begin  
    rdgBCalc.Visible  := true;
    rdgBCalc.Enabled  := true;
  end
  else
  begin
    rdgBCalc.Visible := false;
    rdgBCalc.Enabled := false;
  end;
  rdgBCalc.ItemIndex := -1;
end;

// Guarda os tipos de Rubricas selecionados pelo usuário
procedure TFrmCadProvento.guardatiporubrica;
begin
  guardatiporubr:= '';
  if chkGeral.Checked=true then
    guardatiporubr:= guardatiporubr + 'G';
  if chkAssistencial.Checked=true then
    guardatiporubr:= guardatiporubr + 'A';
  if chkEmprestimo.Checked=true then
    guardatiporubr:= guardatiporubr + 'E';
  if chkPatrocinadora.Checked=true then
    guardatiporubr:= guardatiporubr + 'P';
  if chkFolhaBeneficio.Checked=true then
    guardatiporubr:= guardatiporubr + 'B';
  if chkFolhaPagaFunda.Checked=true then
    guardatiporubr:= guardatiporubr + 'F';
end;

procedure TFrmCadProvento.bbtnConfirmarClick(Sender: TObject);
begin
  grpTipo.Enabled := True;
  guardatiporubrica;
  // Testar campos obrigatorios
  if Trim(dbedDescricao.Text) = '' then
  begin
    MsgDlg('Nome da Rubrica não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  if dbrgrpDesconto.ItemIndex < 0 then
  begin
    MsgDlg('Finalidade da Rubrica não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;
    // Henrique Massão 22/01/2009 - SOL 106323 - KTN 476859
  //If (dblkcmbflgAtrasoDevol.Text <> '') And (dblkcmbIdInfome.Text = '') Then
  //Begin
    //MsgDlg('Foi identificado o preenchimento a Natureza de Rubrica ' + #13 +
           //'com isso deve ser informado a Linha do Informe de Rendimento.','Erro',mtError,[mbOk,mbHelp],0);
    //If dblkcmbIdInfome.CanFocus Then dblkcmbIdInfome.SetFocus;
    //Exit;
  //End;

  If (dblkcmbIdInfome.Text <> '') And (dblkcmbflgAtrasoDevol.Text = '') Then
  Begin
    MsgDlg('Foi identificado o preenchimento a Linha do Informe de Rendimento ' + #13 +
           'com isso deve ser informado a Natureza da Rubrica.','Erro',mtError,[mbOk,mbHelp],0);
    If dblkcmbflgAtrasoDevol.CanFocus Then dblkcmbflgAtrasoDevol.SetFocus;
    Exit;
  End;

  SetaFlgEspecial;

  If dbrgrpdesconto.ItemIndex = 1 then
    Case rdgBCalc.ItemIndex of
      0: qry.FieldByname('TIPOBASEDESCONTO').asInteger := 1;
      1: qry.FieldByname('TIPOBASEDESCONTO').asInteger := 2;
      2: qry.FieldByname('TIPOBASEDESCONTO').asInteger := 3;
      3: qry.FieldByname('TIPOBASEDESCONTO').asInteger := 4;
      4: qry.FieldByname('TIPOBASEDESCONTO').asInteger := 5;
    end
  else
    qry.FieldByname('TIPOBASEDESCONTO').asInteger := 0;
  rdgBCalc.Enabled := false;

  //Renato Visoni SOL 121147 Kintana 579516
  if dblkFontePagadora.LookupValue = '2' then begin
    qry.FieldByName('FLGINSS').AsInteger := 1 ;
  end else begin
    qry.FieldByName('FLGINSS').AsInteger := 0 ;
  end;
  //Renato Visoni SOL 121147 Kintana 579516

  qry.fieldbyname('FLGTPRUBRICA').asstring:= guardatiporubr;

  //--Marcos Merola SOL  136386/4901 Kintana 1278330 14/09 - Ini
  grbExibeHist.Enabled := False;
  if chkBenef.Checked then
    qry.fieldbyname('FLGEXIBEHIST').asstring:= 'B';
  if chkContrib.Checked then
    qry.fieldbyname('FLGEXIBEHIST').asstring:= 'C';
  // Andre Imakawa - SIG 29310 - Inicio
  if not(chkBenef.Checked) and not(chkContrib.Checked) then
    qry.fieldbyname('FLGEXIBEHIST').asstring:= '';
  // Andre Imakawa - SIG 29310 - Fim

  if chkIrrfinf.Checked then///douglas.siqueira
     qry.fieldbyname('FLGIRRFINFORMATIVO').asstring:= '1'
  else
     qry.fieldbyname('FLGIRRFINFORMATIVO').asstring:= '0';

      // Felipe A. Santos - SIG23410 - início
     {
  qry.fieldbyname('FLGBITRIBUTACAO').asstring:= '0';   //Robson.Andrade - SOL242573 / 16949 PPM 979572
  qry.fieldbyname('FLGDIVIDABENEFICIO').asstring:= '0';//Robson.Andrade - SOL242573 / 16949 PPM 979572
      }
   // Felipe A. Santos - SIG23410 - fim


 //FLGBITRIBUTACAO,


  //-- Marcos Merola SOL 136136386/4901 Kintana 1278330 - Fim


  //-- Marcio Morais SOL 151061 - Inicio
(*
  if chkCorrrecaoMonetaria.Checked then///douglas.siqueira
     qry.fieldbyname('FLGCORRECAOMONETARIA').asstring:= '1'
  else
     qry.fieldbyname('FLGCORRECAOMONETARIA').asstring:= '0';
*)     
  //-- Marcio Morais SOL 151061 - Fim

  if ((chkGeral.checked = false) and
     (chkPatrocinadora.checked = false) and
     (chkFolhaPagaFunda.checked = false) and
     (chkEmprestimo.checked = false) and
     (chkAssistencial.checked = false) and
     (chkFolhaBeneficio.checked = false)) then
  begin
    MsgDlg('Categoria da Rubrica não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Cadastro de Rubricas Salariais.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    //dtmBaseDados.dbBaseDados.Commit;//Robson.Andrade - SOL242573 / 16949 PPM 979572
    begin//Inicio -- Robson.Andrade - SOL242573 / 16949 PPM 979572
      // André Imakawa -  SOL 270913 - PPM 1348256 - Inicio
      if dbchkCompoeDIRFResg.Checked then
        begin
          if ComposicaoDIRFResgate(qry.FieldByName('IDPROVENTO').AsInteger, 'I') then
            dtmBaseDados.dbBaseDados.Commit
          else
          begin
             dtmBaseDados.dbBaseDados.Rollback;
             Raise Exception.Create('Não foi possível compor DIRF de Resgate.');
          end;
        end
      else if not dbchkCompoeDIRFResg.Checked then
        begin
          if ComposicaoDIRFResgate(qry.FieldByName('IDPROVENTO').AsInteger, 'E') then
            dtmBaseDados.dbBaseDados.Commit
          else
          begin
             dtmBaseDados.dbBaseDados.Rollback;
             Raise Exception.Create('Não foi possível compor DIRF de Resgate.');
          end;
        end
      else dtmBaseDados.dbBaseDados.Rollback;
      // André Imakawa -  SOL 270913 - PPM 1348256 - Fim
    end;//Fim -- Robson.Andrade - SOL242573 / 16949 PPM 979572

  inherited;
  AtivaDesativaCombos;//Darivaldo Alencar SIG 22246
  sbtnAlterar.Enabled := False; // Felipe A. Santos SOL 136748/14312 KINTANA 1988667
  sbtnApagar.Enabled := False; // Felipe A. Santos SOL 136748/14312 KINTANA 1988667  
end;

procedure TFrmCadProvento.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  grpTipo.Enabled := True; 
  rdgBCalc.Enabled := false;

  //Desmarca campos obrigatórios - Robson.Andrade - SOL242573 / 16949 PPM 979572
    rbNormal.Checked         := False;

  // Marcos Merola 16/09 SOL 136386/4901 KINTANA 1278330 - Inicio
  grbExibeHist.Enabled := False;
  chkBenef.Checked   := (Qry.FieldbyName('FLGEXIBEHIST').AsString = 'B');
  chkContrib.Checked := (Qry.FieldbyName('FLGEXIBEHIST').AsString = 'C');
  //-- Marcos Merola SOL 136136386/4901 Kintana 1278330 - Fim

  chkIrrfinf.Checked := (Qry.FieldbyName('FLGIRRFINFORMATIVO').AsString = '1');///douglas.siqueira

  //-- Marcio Morais SOL 151061 - Inicio
//  chkCorrrecaoMonetaria.Checked := (Qry.FieldbyName('FLGCORRECAOMONETARIA').AsString = '1');
  //-- Marcio Morais SOL 151061 - Fim
  AtivaDesativaCombos;//Darivaldo Alencar SIG 22246
  sbtnAlterar.Enabled := False; // Felipe A. Santos SOL 136748/14312 KINTANA 1988667
  sbtnApagar.Enabled := False; // Felipe A. Santos SOL 136748/14312 KINTANA 1988667

end;

// Função para pegar o Tipo de Rubrica no retorno da busca
procedure  TFrmCadProvento.PegaTipoRubrica;
 var i :  integer;
begin
  for i:= 1 to Length(qry.fieldbyname('FLGTPRUBRICA').asstring) do
  begin
    Case  qry.fieldbyname('FLGTPRUBRICA').asstring[i] of
      'G': chkGeral.Checked:=true;
      'A': chkAssistencial.Checked:=true;
      'E': chkEmprestimo.Checked:=true;
      'P': chkPatrocinadora.Checked:=true;
      'B': chkFolhaBeneficio.Checked:=true;
      'F': chkFolhaPagaFunda.checked:=true;
    end;
  end;
end;

procedure TFrmCadProvento.AbreQryEstruturaCalculo;
var ssql: string;
begin
  ssql:='SELECT EC.IDRUBRICAEXIBICAO, EXR.IDRUBRICA, EC.DESCRICAO '+
        'FROM ESTRUTURACALCULO EC, ESTRUTURAXRUBRICA EXR '+
        'WHERE EXR.IDESTRUTURA = EC.IDESTRUTURA '+
        'AND EXR.IDRUBRICA = '+inttostr(qry.FieldByName('IDPROVENTO').AsInteger)+' '+
        'ORDER BY EC.DESCRICAO';
  qryEstruturadeCalculo.Close;
  qryEstruturadeCalculo.sql.clear;
  qryEstruturadeCalculo.sql.add(ssql);
  qryEstruturadeCalculo.Open;
end;

Procedure TFrmCadProvento.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  if MontaSelect.RetornouValor then
  begin
    qry.Close;
    qry.ParamByName('IDPROVENTO').AsString:=MontaSelect.ValoresChave[0];
    qry.Open;

    // inicio - edilaine - SOL 191668 / KTN 1820235
    qryRubxEvento.Close;
    qryRubxEvento.ParamByName('IDPROVENTO').AsString := MontaSelect.ValoresChave[0];
    qryRubxEvento.Open;
    // fim - edilaine - SOL 191668 / KTN 1820235

    grpTipo.Enabled := False;
    // Limpa os campos check-box dos tipos de rubricas
    Limpa_Chek_Box_TpRubrica;

    If ((qry.FieldByName('FLGDESCONTO').AsInteger = 0) or
       (qry.FieldByName('FLGDESCONTO').AsInteger = 2)) then
      rdgbCalc.Visible := false
    else
    begin
      rdgbCalc.Visible := true;
      Case qry.FieldByname('TIPOBASEDESCONTO').asInteger of
        1: rdgBCalc.ItemIndex := 0;
        2: rdgBCalc.ItemIndex := 1;
        3: rdgBCalc.ItemIndex := 2;
        4: rdgBCalc.ItemIndex := 3;
        5: rdgBCalc.ItemIndex := 4;
      else
        rdgBCalc.ItemIndex := -1;
      end;
      rdgbCalc.Enabled := false;
    end;

    rbNormal.Checked   := (qry.FieldByName('FLGESPECIAL').AsInteger=0);
    rbEspecial.Checked := (qry.FieldByName('FLGESPECIAL').AsInteger<>0);
    chkVisivel.Visible := (qry.FieldByName('FLGESPECIAL').AsInteger<>0);
    chkVisivel.Checked := (qry.FieldByName('FLGESPECIAL').AsInteger=1);

    // Marcos Merola 16/09 SOL 136386/4901 KINTANA 1278330 - Inicio
    grbExibeHist.Enabled := False;
    chkBenef.Checked   := (Qry.FieldbyName('FLGEXIBEHIST').AsString = 'B');
    chkContrib.Checked := (Qry.FieldbyName('FLGEXIBEHIST').AsString = 'C');
    //-- Marcos Merola SOL 136136386/4901 Kintana 1278330 - Fim
    chkIrrfinf.Checked := (Qry.FieldbyName('FLGIRRFINFORMATIVO').AsString = '1');///douglas.siqueira    

    //-- Marcio Morais SOL 151061 - Inicio
//    chkCorrrecaoMonetaria.Checked := (Qry.FieldbyName('FLGCORRECAOMONETARIA').AsString = '1');
    //-- Marcio Morais SOL 151061 - Fim

    AbreQryEstruturaCalculo;

    //  Chamando a função que retorna os tipos de rubrica marcadas 
    PegaTipoRubrica;
    pgcOpcoes.activepage:=tbsTipoRubrica;
  end;
End;

procedure TFrmCadProvento.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  pgcOpcoes.activepage:=tbsTipoRubrica;
  Limpa_Chek_Box_TpRubrica;
  chkFolhaBeneficio.checked:=true;
  qry.FieldByName('FLGCOMPOESALPART').AsInteger := 0 ;
  qry.FieldByName('FLGCOMPOESALBENEF').AsInteger := 0 ;
  qry.FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0 ;
  qry.FieldbyName('FLGSALPARTRETRO').AsInteger := 0;
  qry.FieldbyName('FLGSALBENEFRETRO').AsInteger := 0;
  qry.FieldbyName('FLGSALPARTATUARIA').AsInteger := 0;
  qry.FieldByName('DESCPARCIAL').AsInteger:=0;
  qry.FieldByName('FLGDESCPENSAO').AsInteger := 0 ;
  qry.FieldByName('FLGOBRIGAFAVOREC').AsInteger := 0 ;
  qry.FieldByName('FLGNAOPAGAFAVOREC').AsInteger := 0 ;     //edilaine - SIG53825
  qry.FieldByName('FLGIRRF').AsInteger := 0 ;
  qry.FieldByName('FLGIRRFACJUD').AsInteger := 0 ;
  qry.FieldByName('FLGSALFAMILIA').AsInteger:=0;
  qry.FieldByName('PRAZO').AsInteger:=0;
  qry.FieldByName('IDModulo').AsInteger := Sistema.IDModulo;
  qry.FieldByName('FLGINSS').AsInteger := 0 ;
  qry.FieldByName('FLGFGTS').AsInteger := 0 ;
  qry.FieldByName('FLGCONSOLIDA').AsInteger := 0 ;
  qry.FieldByName('FLGCONSTAFOLHA').AsInteger := 0 ;
  qry.FieldByName('FLGAGRUPA').AsInteger:=0; 
  //BRUNO AZEVEDO SOL 132994 KINTANA 773757
  qry.FieldByName('FLGMARGEM').AsInteger:=0;
  rdgBCalc.ItemIndex:=-1;
  rdgBCalc.Visible:=false;
  grpTipo.Enabled:=True; 
  qry.FieldByName('IDPROVENTO').AsInteger:=LeUltRegistro(nil,'PROVDESC');
  qry.FieldByName('CODPROVDESC').asstring:=
    inttostr(qry.FieldByName('IDPROVENTO').AsInteger);

  qry.FieldByName('CODFONTEPAGADORA').AsInteger := 1;

  //Início - William Santana - SOL 164620.11384 KIN 1816211
  qry.FieldByName('FLGCONTBENEFICIO').AsInteger := 0;
  qry.FieldByName('FLGCONTABONO').AsInteger     := 0;
  qry.FieldByName('FLGEXCLUICONTRIBPA').AsInteger     := 0;  //Osni Cavalcante - SIG 58950.59454
  qry.FieldByName('FLGCORRECAOMONETARIA').AsInteger     := 0;
  //Término - William Santana - SOL 164620.11384 KIN 1816211

//  Qry.FieldbyName('FLGSALPARTATUARIA').AsString := 'N';
  Qry.FieldbyName('FLGSALPARTATUARIA').AsInteger := 0;

  // inicio - edilaine - SOL 191668 / KTN 1820235
  qryRubxEvento.Close;
  qryRubxEvento.ParamByName('IDPROVENTO').AsInteger := -1;
  qryRubxEvento.Open;
  // fim - edilaine - SOL 191668 / KTN 1820235

  Qry.FieldbyName('FLGCORRECAOMONETARIA').AsInteger := 0;  // edilaine - SOL 151061 / KTN 1105188

  // Marcos Merola 16/09 SOL 136386/4901 KINTANA 1278330 - Inicio
  grbExibeHist.Enabled := True;
  chkBenef.Checked   := False;
  chkContrib.Checked := False;
  //-- Marcos Merola SOL 136136386/4901 Kintana 1278330 - Fim
  chkIrrfinf.Checked := False;////douglas.siqueira

  //-- Marcio Morais SOL 151061 - Inicio
//  chkCorrrecaoMonetaria.Checked := False;
  //-- Marcio Morais SOL 151061 - Fim

  AbreQryEstruturaCalculo;
end;

procedure TFrmCadProvento.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  case CmeCadastro.Operacao of
  opVazio, opIdle, opProcurar, opApagar :
    begin
      pnlControles.enabled:=false;
    end;
  opInserir, opAlterar :
    begin
      pnlControles.enabled:=true;
      try
        dbedDescricao.setfocus;
      except
      end;
    end;
  end;
  dbGrd.Visible:=false;

  If qry.State in [dsBrowse] Then
  Begin
    pnlFundo.Enabled := True;
    grpTipo.Enabled  := False;
  End;
end;

procedure TFrmCadProvento.CmeCadastroConfirma(Sender: TObject);
begin
  if qry.FieldByName('CODPROVDESC').isnull or
     (trim(qry.FieldByName('CODPROVDESC').asstring) = '') then
    qry.FieldByName('CODPROVDESC').asstring:=
      inttostr(qry.FieldByName('IDPROVENTO').AsInteger);
  inherited;

  AplicaAlteracoes([qryRubxEvento]);   // edilaine - SOL 191668 / KTN 1820235

end;

procedure TFrmCadProvento.dbedDescricaoExit(Sender: TObject);
begin
  inherited;
  if qry.FieldByName('DESCRPROVDESC').isnull or
     (trim(qry.FieldByName('DESCRPROVDESC').asstring) = '') then
    qry.FieldByName('DESCRPROVDESC').asstring:=qry.FieldByName('DESCRICAO').asstring;
end;

//Darivaldo Alencar SIG 22246-inicio
procedure TFrmCadProvento.AtivaDesativaCombos;
begin
  if qry.State in [dsInsert, dsEdit] then
     begin
       dblkColunaMapa.enabled   := true;
       dblkFontePagadora.enabled:= true;
     end
  else
    begin
       dblkColunaMapa.enabled   := false;
       dblkFontePagadora.enabled:= false;
    end
end;
//Darivaldo Alencar SIG 22246-fim

procedure TFrmCadProvento.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  //NÃO REPETIR O INSERT AUTOMATICAMENTE APENAS PELO CLIQUE NO BOTÃO
  CmeCadastro.RepetirInsert:=False;
  //atribui valores de campo obrigatório  - Robson.Andrade - SOL242573 / 16949 PPM 979572
  rbNormal.Checked         := True;
  dbrgrpDesconto.ItemIndex := 0;
  AtivaDesativaCombos;//Darivaldo Alencar SIG 22246
end;

//  A MENSAGEM DO PADRÃO DE CHAVE JÁ EXISTE AO CONFIRMA NÃO EXPLICITAVA O MOTIVO.
//  EXISTE O ÍNDICE ÚNICO XAK1PROVDESC NO CAMPO DESCRIÇÃO.
procedure TFrmCadProvento.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  Accept:=true;

  if ds.State = dsInsert then
  begin
    if FazQuery(qryAux,
         'SELECT IDPROVENTO FROM PROVDESC WHERE DESCRICAO = '+
         quotedstr(dbedDescricao.text)) then
    begin
      MsgDlg('Esta descrição já existe em outra rubrica. Favor alterá-la.',
        'Erro',mtError,[mbOk,mbHelp],0);
      dbedDescricao.setfocus;
      Accept:=false;
    end;
  end
  //inicio - edilaine - SOL 191668 / KTN 1820235
  else if ds.State = dsEdit then
  begin
    { se incidia na Sal. Familia e desmarcou, tem que apagar da ruxevento}
    // André Imakawa -  SOL 270913 - PPM 1348256 - Inicio
    if (qry.FieldByName('FLGSALFAMILIA').OldValue = 1) and (qry.FieldByName('FLGSALFAMILIA').AsInteger = 0) then
       qryRubxEvento.Delete
    else
    if (qry.FieldByName('FLGSALFAMILIA').OldValue = 0) and (qry.FieldByName('FLGSALFAMILIA').AsInteger = 1) then
    begin
       qryRubxEvento.Insert;
       qryRubxEvento.FieldByName('IDPROVENTO').AsInteger := qry.FieldByName('IDPROVENTO').AsInteger;
       qryRubxEvento.FieldByName('IDMOTIVO').AsInteger   := 1;
       qryRubxEvento.post;
    end;
    // André Imakawa -  SOL 270913 - PPM 1348256 - Fim
  end;


  if ((ds.State in [dsInsert]) and (qry.FieldByName('FLGSALFAMILIA').AsInteger = 1))// or
  //   ((ds.State in [dsEdit]) and(qry.FieldByName('FLGSALFAMILIA').OldValue = 0) and (qry.FieldByName('FLGSALFAMILIA').AsInteger = 1))  // André Imakawa -  SOL 270913 - PPM 1348256
  then
  begin
   { se incide na Sal. Familia tem que inserir na ruxevento}
   qryRubxEvento.Insert;
   qryRubxEvento.FieldByName('IDPROVENTO').AsInteger := qry.FieldByName('IDPROVENTO').AsInteger;
   qryRubxEvento.FieldByName('IDMOTIVO').AsInteger   := 1;
   qryRubxEvento.post;
  end;
  //fim - edilaine - SOL 191668 / KTN 1820235

  inherited;
end;

procedure TFrmCadProvento.chkBenefClick(Sender: TObject);
begin
  inherited;
  //--Marcos SOL  136386/4901  Kintana 1278330 14/09
  if (qry.State in [dsEdit, dsInsert]) and (chkBenef.Checked) then
    chkContrib.Checked := not(chkBenef.Checked);
end;

procedure TFrmCadProvento.chkContribClick(Sender: TObject);
begin
  inherited;
  //--Marcos SOL  136386/4901 Kintana 1278330 14/09
  if (qry.State in [dsEdit, dsInsert]) and (chkContrib.Checked) then
    chkBenef.Checked := not(chkContrib.Checked);
end;

// Felipe A. Santos SOL 136748/14312 KINTANA 1988667
procedure TFrmCadProvento.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('FLGENCERRAMENTO').AsInteger := 0;
  qry.FieldByName('FLGPROPORCIONAL').AsInteger := 0;
  qry.FieldByName('FLGACAOJUDICIAL').AsInteger := 0;
end;
// Felipe A. Santos SOL 136748/14312 KINTANA 1988667 FIM

//Início - William Santana - SOL 164620.11384 KIN 1816211
procedure TFrmCadProvento.dbchkFlgContabRubricaClick(Sender: TObject);
 var
   fcb, fca, cm : integer;
begin
  inherited;

    if dbchkFlgContabBenef.checked   then fcb := 1 else fcb := 0;
    if dbchkFlgContAbono.checked     then fca := 1 else fca := 0;
    if chkCorrrecaoMonetaria.checked then cm  := 2 else cm  := 0;
                                   
  if (( fcb + fca + cm ) > 2) then
  begin
   MsgDlg('Uma rubrica não pode possuir mais de uma marcação. Verifique as parametrizações referentes à contabilização e correção monetária.'
   ,'Aviso',mtWarning,[mbOk],0);
   TDBCheckBox(Sender).checked := false;
  end;

end;
//Término - William Santana - SOL 164620.11384 KIN 1816211

procedure TFrmCadProvento.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
end;

//Robson.Andrade - SOL242573 / 16949 PPM 979572
function TFrmCadProvento.iif(bCondicao: Boolean; vSeVerdadeiro,
  vSeFalso: Variant): Variant;
begin
  if bCondicao then
    Result := vSeVerdadeiro
  else
    Result := vSeFalso;
end;


end.
{------------------------------------------------------------------------------|
| UNIT: FCADPROVENTO                                                           |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   CADASTRO DE RUBRICAS QUE SERÃO UTILIZADAS NA FOLHA DE BENEFÍCIOS           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 01/02/2002 A 01/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12b                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTEREI O VALOR DA PROPRIEDADE ALLOWCLEARKEY DE FALSE PARA TRUE NOS        |
|   SEGUINTES CONTROLES : dblkcmbflgAtrasoDevol, wwDBLookupCombo1 e            |
|   wwDBLookupCombo2.                                                          |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/02/2002 A 18/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12c                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|     INCLUSÃO DA INFORMAÇÃO REFERENTE A FONTE PAGADORA DA RUBRICA             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/02/2002 A 19/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12c                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|     ALTERACAO DO CAMPO NUMPRIORIDADE PARA NUMPRIORIDADEFB                    |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 01/03/2002 A 01/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|     RETIREI O CAMPO IDPROVENTO, PK NA TABELA PROVDESC DO UPDSQL .            |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/04/2002 A 18/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12K                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|     TORNEI OBRIGATORIO O PREENCHIMENTO DA CATEGORIA DA RUBRICA               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/07/2002 A 31/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13K                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|     - Incluí o flag para Salario Familia                                     |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/09/2002 A 09/09/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.14b                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Remodelação da tela.                                                     |
|   - Colocação de um Grid para mostrar Estruturas de Cálculos associados      |
|   aquela rubrica.                                                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/09/2002 A 17/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|    - Possibilitar mudar de guia mesmo que não tenha sido pedido para alterar |
|    ou inserir, mas somente mudar de guia.                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/07/2003 A 14/07/2003                         |
| PENDÊNCIA: 14534                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/07/2003 A 30/07/2003                         |
| PENDÊNCIA: 14747                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00b                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Apresentava erro na abertura da consulta de grupo de rubricas e estrutura  |
| de cálculo. Faltou sql.clear nos objetos query.                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/05/2004 A 03/05/2004                         |
| PENDÊNCIA: 16679                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.11e                                              |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO NO CADASTRO DO FLGAGRUPA PARA PERMITIR O AGRUPAMENTO DOS VALORES  |
| POR RUBRICA NO CONTRACHEQUE. QUERY PRINCIPAL ALTERADA.                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/08/2004 A 31/08/2004                         |
| PENDÊNCIA: 17520                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13a                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - LISTA DE VALORES DO PRAZO: ALTERAR DE INDETERMINADO PARA PERMANENTE.       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/12/2004 A 09/12/2004                         |
| PENDÊNCIA: 18237                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.15D                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CRIAR CAMPO NOVO NA PROVDESC PARA INDICAR QUE UM RUBRICA É LEGAL.          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------}

