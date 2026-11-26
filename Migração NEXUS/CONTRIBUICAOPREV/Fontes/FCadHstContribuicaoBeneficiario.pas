// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//---------------------------------------------------------------------------------------------------
//Nº SIG.....: 104014
//Data.......: 24/12/2021
//Responsável: edilaine
//Descrição..: calcular data prevista a partir do mes/ano cobrança
//---------------------------------------------------------------------------------------------------
//Nº SIG.....: 101987
//Data.......: 09/09/2020
//Responsável: Ewerton Beltramini (Ejrb)
//Descrição..: Correção no sql de uma consulta.
//---------------------------------------------------------------------------------------------------
//Nº SIG.....: 61677
//Data.......: 27/07/2020
//Responsável: Ewerton Beltramini (Ejrb)
//Descrição..: Inclusão de novos campos: Salario de contribuição e Percentual de Contribuição.
//---------------------------------------------------------------------------------------------------
//Pendência   : SIG 99100
//Responsável : Rafael Vasconcelos
//Data        : 19/03/2020
//Descrição   : Igualar a lista dos lotes com o da funcionlidade de Entrada Manual de Contribuição
//--------------------------------------------------------------------------------------------------
//Pendência   : SIG 90704
//Responsável : Darivaldo Alencar
//Data        : 22/08/2019
//Descrição   : Gravar campo IDPLANPREVCONTAB na tabela HSTCONTRIBPREV (+.DFM qry,qryDet)
//--------------------------------------------------------------------------------------------------
//Pendência   : SIG 46976
//Responsável : Andre Imakawa
//Data        : 25/05/2017
//Descrição   : Com a entrada do SIG 46066 o sistema passou a gravar o IDTITULAR incorreto na
//              passando idtitular que retorna do montaselect
//--------------------------------------------------------------------------------------------------
//Pendência   : SIG 23387
//Responsável : Peterson Victor
//Data        : 17/04/2017
//Descrição   : Incluido a forma de cobrança Desconto na Folha Patro
//              Alteração do dfm 
//---------------------------------------------------------------------------------------------------
//Pendência   : SIG 42702
//Responsável : Marcelo Cardoso Santos Filho
//Data        : 28/03/2017
//Descrição   : Foi necessario incluir o DISTINCT na qry para que o resultado não seja
//              duplicado devido ao relacionamento com a estrutura "BFCIARIOTITPLAN"
//---------------------------------------------------------------------------------------------------
//Pendência   : SOL 263499 - PPM 1124000
//Responsável : Wiliam Moreira da Silva
//Data        : 26/10/2015
//Descrição   : Erro ao excluir ou modificar alguma contribuição que já tenha sido lançada na folha de benefício
//--------------------------------------------------------------------------------
// Autor(a)  : Felipe A. Santos
// Data      : 06/02/2013
// Pendencia : SOL 200287 KINTANA 1929908
// Alteração : Alteração no combo de lotes, pois não estava trazendo os lotes de
//             Preparo
//--------------------------------------------------------------------------------
// Autor(a)  : Fernando Xavier
// Data      : 28/02/2012
// Pendencia : SOL 175146 KINTANA 1594215
// Alteração : alterado a combo de lotes para que funcione da mesma forma que
//             a funcionalidade "Beneficioprev/Manutenção/Cálculo Retroativo".
//--------------------------------------------------------------------------------
// Autor(a)  : Eraldo Silva
// Data      : 25/08/2011
// Pendencia : 162419 KINTANA 1381541
// Alteração : Ajuste na descrição dos alteradores
//--------------------------------------------------------------------------------
// Autor(a)  : Fernando Xavier
// Data      : 14/04/2011
// Pendencia : 141073/3661  KINTANA 1128912
// Alteração : Ajuste no controle de transações no Banco de Dados
//--------------------------------------------------------------------------------
//Pendência   : SOL 150473/3481 KINTANA 1092606
//Responsável : BRUNO AZEVEDO
//Data        : 10/01/2011
//Descrição   : Correção na exclusão das contribuições sem alteradores.
//--------------------------------------------------------------------------------
//Pendência   : SOL 141073 Kintana 141073
//Responsável : BRUNO AZEVEDO
//Data        : 20/09/2010
//Descrição   : Correção no controle de transação das funcionalidades:
//              "Contribuições por Núcleo Familiar";
//              "Entrada Manual de Contribuições por Núcleo Familiar";
//              "Consulta Geral de Pessoa".
//--------------------------------------------------------------------------------
//Pendência   : SOL 148115 KINTANA 1033744
//Responsável : Fernando Xavier
//Data        : 25/11/2010
//Descrição   : Erro na visualizações de contribuições para aposentados e
//              pensionistas ao mesmo tempo. Add filtro por idtitular
//--------------------------------------------------------------------------------
//Pendência   : SOL 123570 KINTANA 628853
//Responsável : BRUNO AZEVEDO
//Data        : 30/09/2010
//Descrição   : Criação de aba de alteradores.
//--------------------------------------------------------------------------------
//Pendência   : SOL 134803 KINTANA 798368
//Responsável : BRUNO AZEVEDO
//Data        : 03/05/2010
//Descrição   : Carregar os dados com o IDPESSOA e nao com o IDRESPNUCLEO.
//--------------------------------------------------------------------------------
// Autor(a)    : Henrique Massão
// Data        : 29/05/2009
// Rotina      : RetornaIdTitular
// Pendência   : SOL 108902  KINTANA 493923
// Descricao   : O campo IDTITULAR está sendo inserido na tabela HSTCONTRIBPREV.
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Pendência   : 16612
// Data        : 16.04.2004
// Alteração   : Alteração no filtro pois estava duplicando linhas para
//               participantes que tinham migrado de plano
//------------------------------------------------------------------------------
// Autor(a)    : Ricardo Vigorito
// Pendência   : 16095
// Data        : 29.03.2004
// Alteração   : O programa passou a gravar todas as movimentações no arquivo
//  de log.
//------------------------------------------------------------------------------

// Autor(a)    : Ricardo Vigorito
// Pendência   : 16247
// Data        : 29.03.2004
// Alteração   : Gravar , com último preparo, a maior data de cobrança
//------------------------------------------------------------------------------
// Rotina      : grpMesAnoRefExit
// Autor(a)    : Camille
// Data        : 25.03.2004
// Alteração   : Chamar regra de 13o se o mes de referencia for 13
//------------------------------------------------------------------------------
// Rotina      : qry e montaselect
// Autor(a)    : Camille
// Data        : 23.03.2004
// Alteração   : Acerto para tratar responsavel do nucleo familiar
//------------------------------------------------------------------------------
// Rotina      : sbtnExcluiDetClick(
// Autor(a)    : Augusto
// Data        : 08/03/2004
// Alteração   : Excluir HSTATRASOCONTRIB  
//------------------------------------------------------------------------------
// Rotina      : grpMesAnoRefExit
// Autor(a)    : Gleyber
// Data        : 05/12/2003
// Pendencia   : 14864
// Alteração   : Tratamento para valores negativos
//------------------------------------------------------------------------------
// Rotina      : qryDetBeforePost
// Autor(a)    : Augusto
// Data        : 19/08/2003
// Pendencia   : 14873
// Alteração   : Alteração nos controles dos campo FLGDESCFOLHA - FOLHAORIGEM
//------------------------------------------------------------------------------
// Rotina      : Confirmação do Detalhe
// Autor(a)    : Augusto
// Data        : 06/01/2003
// Alteração   : Novo valor (Folha Benficios - B) para o campo FolhaOrigem
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/09/2002
// Alteração   : tratamento para inserir e alterar o FOLHAORIGEM
//------------------------------------------------------------------------------
// Rotina      : alteração e deleção
// Autor(a)    : Leo
// Data        : 30/08/2002
// Alteração   : crítica para não deixar alterar ou excluír contribuições já enviadas para
//               o contas a receber
//------------------------------------------------------------------------------
// Rotina      : dbdtRecebimentoExit   e   dbedRecebidoExit
// Autor(a)    : Leo
// Data        : 27/08/2002
// Alteração   : tratamento para facilitar a marcação do sitrecebimento em casos de
//               "Recebidas SEM Divergências" e "Recebida COM Divergência"
//------------------------------------------------------------------------------

unit FCadHstContribuicaoBeneficiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  Mask, wwdbedit, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
  ImgList, wwdblook, TEdNum, uCMTypes;

type
  TfrmCadHstContribuicaoBeneficiario = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    grpMesAnoRef: TGroupBox;
    Label10: TLabel;
    edAnoRef: TEdit;
    edMesRef: TEdit;
    grpMesCobranca: TGroupBox;
    Label11: TLabel;
    edAnoCob: TEdit;
    edMesCob: TEdit;
    Label12: TLabel;
    dbedEsperado: TwwDBEdit;
    dbrgrpForma: TDBRadioGroup;
    Label13: TLabel;
    dbedRecebido: TwwDBEdit;
    dbdtPrevisao: TCMDateTimePicker;
    dbdtRecebimento: TCMDateTimePicker;
    Label14: TLabel;
    Label15: TLabel;
    dbrgrpSitRecebimento: TDBRadioGroup;
    qryHistContribPrev: TwwQuery;
    qryUpdateHistContribPrev: TwwQuery;
    rdgrpatrasodevol: TDBRadioGroup;
    memobs: TMemo;
    qryMAIORMES: TwwQuery;
    UPDMAIORMES: TwwQuery;
    qryMotivo: TwwQuery;
    DBLKPCMBMOTIVO: TwwDBLookupCombo;
    qryDetNUMRECEBIMENTO: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryDetMESREFERENCIA: TStringField;
    qryDetMESCOBRANCA: TStringField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDCONTRIBUICAO: TFloatField;
    qryDetSEQPROPOSTA: TFloatField;
    qryDetFLGDEVOLUCAO: TFloatField;
    qryDetFLGDIVERGENTE: TFloatField;
    qryDetFLGCONCESSAO: TFloatField;
    qryDetFLGEVENTO: TFloatField;
    qryDetFLGCALCRESERVA: TFloatField;
    qryDetFLGDESCFOLHA: TFloatField;
    qryDetFLGSITFUNDACAO: TStringField;
    qryDetFLGAPORTE: TFloatField;
    qryDetVALORESPERADO: TFloatField;
    qryDetVALORRECEBIDO: TFloatField;
    qryDetVALORCALCULADO: TFloatField;
    qryDetDATAPREVISAORECE: TDateTimeField;
    qryDetDATARECEBIMENTO: TDateTimeField;
    qryDetDATAINICIO: TDateTimeField;
    qryDetDATAFINAL: TDateTimeField;
    qryDetIDREGRACALCULO: TFloatField;
    qryDetSITRECEBIMENTO: TStringField;
    qryDetTIPO: TStringField;
    qryDetVALOROP1: TFloatField;
    qryDetVALOROP2: TFloatField;
    qryDetVALOROP3: TFloatField;
    qryDetVALORPARARESERVA: TFloatField;
    qryDetDESCRICAO: TStringField;
    qryDetFLGMANUAL: TFloatField;
    qryDetCODDOCUMENTOPREV: TFloatField;
    qryDetFOLHAORIGEM: TStringField;
    Label16: TLabel;
    qryLote: TwwQuery;
    Label17: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    qryDetIDLOTE: TFloatField;
    Label18: TLabel;
    DBText10: TDBText;
    Label19: TLabel;
    DBText11: TDBText;
    qryDetIDTITULAR: TFloatField;
    tbsAlteradores: TTabSheet;
    dbgrdAlteradores: TwwDBGrid;
    dsAlteradores: TwwDataSource;
    qryAlteradores: TwwQuery;
    pnlAlteradores: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    dblkpcmbTipoAlterador: TwwDBLookupCombo;
    edValorAlterador: TEditNum;
    rgrpTipoAlterador: TRadioGroup;
    qryTipoAlterador: TwwQuery;
    updAlterador: TUpdateSQL;
    DBLKPCMBFORMAPAGTO: TwwDBLookupCombo;
    qryFormaPagto: TwwQuery;
    qryFormaPagtoCODPORTFORMA: TFloatField;
    qryFormaPagtoDESCRICAO: TStringField;
    qryDetCODPORTFORMA: TFloatField;
    dbedCodDocPrev: TwwDBEdit;
    ToolbarButton971: TToolbarButton97;
    MontaSelectDOC: TMontaSelect;
    lblFormaPagto: TLabel;
    lblCodDocPrev: TLabel;
    qryDetIDPLANPREVCONTAB: TFloatField;
    Label24: TLabel;
    dbeSalContrib: TwwDBEdit;
    Label25: TLabel;
    dbePercContrib: TwwDBEdit;
    qryDetSALCONTRIB: TFloatField;
    QryDetAux: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField3: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    StringField4: TStringField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    FloatField19: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    StringField7: TStringField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dbedEsperadoExit(Sender: TObject);
    procedure dbdtPrevisaoExit(Sender: TObject);
    procedure grpMesAnoRefExit(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure edMesRefExit(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbedRecebidoExit(Sender: TObject);
    procedure dbdtRecebimentoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grpMesCobrancaExit(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure qryAlteradoresBeforePost(DataSet: TDataSet);
    procedure rgrpTipoAlteradorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolbarButton971Click(Sender: TObject);
    procedure dbedCodDocPrevKeyPress(Sender: TObject; var Key: Char);
    procedure rdgrpatrasodevolChange(Sender: TObject);
    procedure dbrgrpFormaChange(Sender: TObject);
  private
    { Private declarations }
    flg_Movimentacao : integer;
    procedure CarregaAlterador();
              
  public
     function ExisteNaTmpDesc(qry: TwwQuery) : Boolean;
    { Public declarations }

    
  end;

var
  frmCadHstContribuicaoBeneficiario: TfrmCadHstContribuicaoBeneficiario;

implementation

uses UAdmPrev, UMensErro, UDataBase, DAPrev, UContribuicaoPrev, DBaseDados,
  UFuncoesUteis, USistema, UModulo;

{$R *.DFM}

procedure TfrmCadHstContribuicaoBeneficiario.CmeCadastroFind(Sender: TObject);
begin

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     qry.Close;
     qry.ParamByName('IDNUCLEOFAMILIAR').Value  := StrToInt(MontaSelect.ValoresChave[7]);
     qry.ParamByName('IDRESPNUCLEO').Value      := StrToInt(MontaSelect.ValoresChave[5]);
     qry.ParamByName('IDTITULAR').Value         := StrToInt(MontaSelect.ValoresChave[2]);
     qry.ParamByName('IDPESSOA').Value          := StrToInt(MontaSelect.ValoresChave[3]);
     qry.ParamByName('IDCONTRIBUICAO').Value    := StrToInt(MontaSelect.ValoresChave[6]);
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('IdPessJur').Value      := StrToInt(MontaSelect.ValoresChave[0]);
     qryDet.ParamByName('IdPlanoPrev').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     //BRUNO AZEVEDO SOL 134803 KINTANA 798368
     qryDet.ParamByName('IdPessoa').Value       := StrToInt(MontaSelect.ValoresChave[3]);
     //qryDet.ParamByName('IdPessoa').Value       := StrToInt(MontaSelect.ValoresChave[5]); // IDRESPNUCLEO
     //BRUNO AZEVEDO SOL 134803 KINTANA 798368
     qryDet.ParamByName('SeqProposta').Value    := StrToInt(MontaSelect.ValoresChave[4]);
     //SOL 148115 KINTANA 1033744 add filtro por idtitular
     qryDet.ParamByName('IDTITULAR').Value      := StrToInt(MontaSelect.ValoresChave[2]);

     qryDet.ParamByName('IdContribuicao').Value := StrToInt(MontaSelect.ValoresChave[6]);
     qryDet.Open;
  end;
end;

procedure TfrmCadHstContribuicaoBeneficiario.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  //BRUNO AZEVEDO SOL 123570 KINTANA 628853
  if (pgctrlDetalhe.ActivePage = tbsDet) then begin
    edAnoRef.Text                                   := '';
    edMesRef.Text                                   := '';
    edAnoCob.Text                                   := '';
    edMesCob.Text                                   := '';

    dbrgrpSitRecebimento.ItemIndex                  :=  0;
    dbrgrpForma.ItemIndex                           := -1;
    rdgrpatrasodevol.ItemIndex                      := -1;
    qryDet.FieldByName('SITRECEBIMENTO').Value      :=  0;
    qryDet.FieldByName('FLGDESCFOLHA').Value        :=  1;
    qryDet.FieldByName('VALORESPERADO').AsFloat     :=  0;
    qryDet.FieldByName('VALORRECEBIDO').AsFloat     :=  0;
    qryDet.FieldByName('DATAPREVISAORECE').AsString := '';
    qryDet.FieldByName('DATARECEBIMENTO').AsString  := '';
    qryDet.FieldByName('FLGDEVOLUCAO').Value        :=  0;
    qryDet.FieldByName('FLGMANUAL').Value        :=  1;

    memobs.visible := false;
  end else begin
    rgrpTipoAlterador.itemindex := 0;
    edValorAlterador.Text       := '';
    dblkpcmbTipoAlterador.Text  := '';
    CmeDetalhe.RepetirInsert    := False;
  end;
end;

procedure TfrmCadHstContribuicaoBeneficiario.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  //BRUNO AZEVEDO SOL 123570 KINTANA 628853
  if (pgctrlDetalhe.ActivePage = tbsDet) then begin
    edAnoRef.Text := Copy(qryDet.FieldByName('MesReferencia').AsString,1,4);
    edMesRef.Text := Copy(qryDet.FieldByName('MesReferencia').AsString,6,2);
    edAnoCob.Text := Copy(qryDet.FieldByName('MesCobranca').AsString,1,4);
    edMesCob.Text := Copy(qryDet.FieldByName('MesCobranca').AsString,6,2);

    memobs.visible := false;
  end else begin
    if (qryAlteradores.FieldByName('FLGTIPO').AsString = 'A') then begin
      rgrpTipoAlterador.itemindex := 0;
    end else begin
      rgrpTipoAlterador.itemindex := 1;                                                                                
    end;
    edValorAlterador.Text := qryAlteradores.FieldByName('VALOR').AsString;
    if qryTipoAlterador.Locate('CodAlterador',qryAlteradores.FieldByName('CodAlterador').AsInteger,[loCaseInsensitive]) then begin
      dblkpcmbTipoAlterador.Text := qryTipoAlterador.FieldByName('Descricao').AsString;
    end;
  end;
end; // CmeDetalhe.Edit(Self)

procedure TfrmCadHstContribuicaoBeneficiario.CmeCadastroConfirma(Sender: TObject);
begin

   inherited;

   try
      //BRUNO AZEVEDO SOL 123570 KINTANA 628853
      AplicaAlteracoes([qryAlteradores]);
      AplicaAlteracoes([qryDet]);

    Try
      //BRUNO AZEVEDO SOL 141073 Kintana 141073
      If Not Sistema.GravaLogOperacoes(Self.Caption, True) Then
       raise exception.Create('Erro ao gravar Log.')
    Except
    End;
   except
      raise;
   end;

end; // CmeCadastro.Confirma(Self)

procedure TfrmCadHstContribuicaoBeneficiario.CmeDetalheConfirma(Sender: TObject);
begin
   {}
   inherited;
end; // CmeDetalhe.Confirma(Self)


procedure TfrmCadHstContribuicaoBeneficiario.sbtnInserirClick(Sender: TObject);
begin
  MsgDlg('Esta tela NÃO permite a inclusão de contribuições no histórico. ','Atenção',mterror,[mbOK],0);
  sbtnInserir.Down := False;
  Abort;
  inherited;
end;

procedure TfrmCadHstContribuicaoBeneficiario.sbtnApagarClick(Sender: TObject);
begin
  MsgDlg('Esta tela permite apenas a exclusão de linhas do histórico. Utilize o botão "Alterar". ','Atenção',mterror,[mbOK],0);
  sbtnApagar.Down := False;
  Abort;
  inherited;

end;

procedure TfrmCadHstContribuicaoBeneficiario.FormActivate(Sender: TObject);
begin
  inherited;

  qry.Close;
  qry.ParamByName('IDNUCLEOFAMILIAR').Value  := 0;
  qry.ParamByName('IDRESPNUCLEO').Value      := 0;
  qry.ParamByName('IDTITULAR').Value         := 0;
  qry.ParamByName('IDPESSOA').Value          := 0;
  qry.ParamByName('IDCONTRIBUICAO').Value    := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IdPessJur').Value      := 0;
  qryDet.ParamByName('IdPlanoPrev').Value    := 0;
  qryDet.ParamByName('IdPessoa').Value       := 0;
  qryDet.ParamByName('IDTITULAR').Value      := 0;  //SOL 148115 KINTANA 1033744 add filtro por idtitular
  qryDet.ParamByName('SeqProposta').Value    := 0;
  qryDet.ParamByName('IdContribuicao').Value := 0;
  qryDet.Open;

  qryMotivo.Close;
  qryMotivo.Open;

  qryFormaPagto.close;
  qryFormaPagto.open;

  qryLote.Close;
  qryLote.ParamByName('MESREFERENCIA').AsString := Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2); // SOL 175146 KINTANA 1594215   SIG 99100
  qryLote.Open;
end;

procedure TfrmCadHstContribuicaoBeneficiario.qryDetBeforePost(DataSet: TDataSet);
begin
  // fernando xavier   141073/3661  KINTANA 1128912
  //Upd.ModifySQL.Clear;//William Moreira da Silva - SOL 263499 - PPM 1124000
  if Qry.state in [DsEdit] then
     Qry.CancelUpdates;
  // fernando xavier    141073/3661  KINTANA 1128912

  If (edAnoRef.Text = '') Or
     (edMesRef.Text = '') Or
     (edAnoCob.Text = '') Or
     (edMesCob.Text = '')
  Then Begin
    MsgDlg('Mês de Cobrança ou Referência não preenchido.Verifique. ','Atenção',mterror,[mbOK],0);
    Abort;
  End;

  if (dblkpcmbMotivo.Text = '')
  then begin
    MsgDlg('Motivo não preenchido. Verifique.','Informação',mtError,[mbOK],0);
    Abort;
  end;

  inherited;

  if qryDet.State = dsInsert
  then begin
     qryDet.FieldByName('NumRecebimento').AsInteger := LeUltRegistro(dtmAPrev.qryAux,'HSTCONTRIBPREV');
//     qryDet.FieldByName('IdMotivo').AsInteger       := prmIdMotivoContrib;
     qryDet.FieldByName('IdPessJur').AsInteger      := qry.FieldByName('IdPessJur').AsInteger;
     qryDet.FieldByName('IdPlanoPrev').AsInteger    := qry.FieldByName('IdPlanoPrev').AsInteger;
     //BRUNO AZEVEDO SOL 134803 KINTANA 798368
     qryDet.FieldByName('IdPessoa').AsInteger       := qry.FieldByName('IdPessoa').AsInteger;
     //qryDet.FieldByName('IdPessoa').AsInteger       := qry.FieldByName('IDRESPNUCLEO').AsInteger;
     //BRUNO AZEVEDO SOL 134803 KINTANA 798368
     qryDet.FieldByName('IdContribuicao').AsInteger := qry.FieldByName('IdContribuicao').AsInteger;
     qryDet.FieldByName('SeqProposta').AsInteger    := qry.FieldByName('SeqProposta').AsInteger;

     //Ejrb - Ewerton Beltramini - SIG 61677 (Se o valor for alterado em tela... já vai vir carregado)
     if qryDet.FieldByName('ValorOp1').AsFloat <=0 then
        qryDet.FieldByName('ValorOp1').AsFloat         := qry.FieldByName('ValorBase1').AsFloat;

     qryDet.FieldByName('ValorOp2').AsFloat         := qry.FieldByName('ValorBase2').AsFloat;
     qryDet.FieldByName('ValorOp3').AsFloat         := qry.FieldByName('ValorBase3').AsFloat;

     // Andre Imakawa - SIG 46976 - Inicio
     //qryDet.FieldByName('Idtitular').asString       := RetornaIdTitular(Qry.FieldbyName('IDRESPNUCLEO').AsString,Qry.FieldbyName('IDPLANOPREV').AsString,-1, -1, Qry.FieldbyName('MATRICULA').AsString); //henrique Sol 108902
     qryDet.FieldByName('Idtitular').AsInteger      := qry.FieldByName('IdTitular').AsInteger;
     // Andre Imakawa - SIG 46976 - Fim

  end;

  qryDet.FieldByName('FlgDivergente').AsInteger     := 0;
  qryDet.FieldByName('FlgConcessao').AsInteger      := 0;
  qryDet.FieldByName('FlgEvento').AsInteger         := 0;
  qryDet.FieldByName('FlgCalcReserva').AsInteger    := 0;
  qryDet.FieldByName('FlgAporte').AsInteger         := 0;
  qryDet.FieldByName('FlgSitFundacao').AsString     := qry.FieldByName('FlgInterno').AsString;

  qryDet.FieldByName('MesReferencia').AsString      := Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text);
  qryDet.FieldByName('MesCobranca').AsString        := Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text);
  qryDet.FieldByName('DataInicio').AsString         := qry.FieldByName('DataInicio').AsString;
  qryDet.FieldByName('DataFinal').AsString          := qry.FieldByName('DataFinal').AsString;
  qryDet.FieldByName('IdRegraCalculo').AsInteger    := qry.FieldByName('IdRegraCalculo').AsInteger;
  qryDet.FieldByName('Tipo').AsString               := 'F';
  qryDet.FieldByName('Descricao').AsString          := qryMotivo.FieldByName('DESCRICAO').AsString;
  qryDet.FieldByName('VALORCALCULADO').AsFloat      := qryDet.FieldbyName('VALORESPERADO').AsFloat;
  qryDet.FieldByName('IDPLANPREVCONTAB').AsInteger  := qry.FieldByName('IDPLANPREVCONTAB').AsInteger; //SIG90704
  qryDet.FieldByName('FLGMANUAL').AsFloat      := 1;
   //Peterson Victor SIG23387 Inicio

   //  if uppercase(qry.FieldByName('FlgInterno').AsString) = 'AS' then
   //  qryDet.FieldByName('FOLHAORIGEM').AsString := 'B';

   //  if dbrgrpForma.itemindex = 0
   //  then qryDet.FieldByName('FLGDESCFOLHA').AsInteger := 1
   //  else qryDet.FieldByName('FLGDESCFOLHA').AsInteger := 0;

   If (UpperCase(qry.FieldByName('FlgInterno').AsString) = 'AS') and
      (qryDet.FieldByName('FOLHAORIGEM').AsString <> 'B') Then
      if MsgDlg('ATENÇÃO !'+#13+#10+
              'A situação do participante obriga a forma de cobrança para a'+#13+#10+
              'FOLHA DE BENEFÍCIOS. '+#13+#10+''+#13+#10+
              'Deseja realmente mudar esta opção ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
         qryDet.FieldByName('FOLHAORIGEM').AsString := 'B';

  if dbrgrpForma.itemindex = 0 then
    qryDet.FieldByName('FLGDESCFOLHA').AsInteger := 1
  else if dbrgrpForma.itemindex = 1 then
    qryDet.FieldByName('FLGDESCFOLHA').AsInteger := 1
  else if dbrgrpForma.itemindex = 2 then
    qryDet.FieldByName('FLGDESCFOLHA').AsInteger := 0;
  //Peterson Victor SIG23387 FIM

  //atualiza ultmespreparo na CONTRIBPREVNUCLEO
  //se o ano/mes da entrada manual for maior que
  // atual
  dtmaprev.qryaux.close;
  dtmaprev.qryaux.sql.text := ' SELECT ULTMESPREPARO FROM CONTRIBPREVNUCLEO '+
                              ' WHERE  IDNUCLEOFAMILIAR = '+qry.FieldByName('IdPessJur').AsString+
                              ' AND    IDCONTRIBUICAO   = '+qry.FieldByName('IdContribuicao').AsString;
  dtmaprev.qryaux.open;

  if Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text) > dtmaprev.qryaux.fieldbyname('ULTMESPREPARO').AsString   then
  begin
     dtmaprev.qryaux.close;
     dtmaprev.qryaux.sql.text := ' UPDATE CONTRIBPREVNUCLEO SET ULTMESPREPARO = '''+Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text)+''' '+
                                 ' WHERE  IDNUCLEOFAMILIAR = '+qry.FieldByName('IdPessJur').AsString+
                                 ' AND    IDCONTRIBUICAO   = '+qry.FieldByName('IdContribuicao').AsString;
     dtmaprev.qryaux.execsql;
  end;

  if qryDet.State = dsEdit
  then begin
     dtmAPrev.qryAux.Close;
     dtmAPrev.qryAux.sql.Text :=  ' UPDATE TMPDESC SET  '+
                                  ' VALOR               = '+oranumero(qryDet.FieldbyName('VALORESPERADO').AsString)+',  '+
                                  ' VALORRECEBIDO       = '+oranumero(qryDet.FieldbyName('VALORRECEBIDO').AsString)+'  '+
                                  ' WHERE MESREFERENCIA = '''+qryDet.FieldByName('MESREFERENCIA').AsString+''' '+
                                  ' AND   MESCOBRANCA   = '''+qryDet.FieldByName('MESCOBRANCA').AsString+''' '+
                                  ' AND   IDPESSJUR     = '+qryDet.FieldByName('IDPESSJUR').AsString+' '+
                                  ' AND   IDPLANOPREV   = '+qryDet.FieldByName('IDPLANOPREV').AsString+' '+
                                  ' AND   IDPESSOA      = '+qryDet.FieldByName('IDPESSOA').AsString+' '+
                                  ' AND   IDDESCONTO    = '+qryDet.FieldByName('IDCONTRIBUICAO').AsString+' '+
                                  ' AND   NVL(SITENVIO,''0'') = ''0'' ';
     dtmAPrev.qryAux.ExecSql;
  end;
end;

procedure TfrmCadHstContribuicaoBeneficiario.sbtnAltDetClick(Sender: TObject);
begin

  if (pgctrlDetalhe.ActivePage <> tbsAlteradores) then begin

    if ExisteNaTmpDesc(qryDet) then
    begin
       MsgDlg('Esta contribuição já foi cobrada, não podendo mais ser alterada.','Atenção',mtError,[mbOK],0);
       Exit;
    end;

    if qryDet.FieldByName('FlgCalcReserva').AsInteger = 1
    then begin
       MsgDlg('Esta contribuição já foi alimentada na reserva do participante e não pode ser alterada. '+#13+
              'Caso seja necessário, utilize a opção de "Estorno" no Controle Individual de Contribuição para '+
              'retirá-la da reserva.','Atenção',mtError,[mbOK],0);
       Exit;
    end;

    if trim(qryDet.FieldByName('CODDOCUMENTOPREV').AsString) <> ''
    then begin
       MsgDlg('Esta contribuição já foi enviada para o sistema de Contas e Receber não podendo ser alterada. '+#13+
              'Caso seja necessário, utilize a opção de "Cancelar" no Controle Individual de Contribuição para '+#13+
              'desfazer o envio.','Atenção',mtError,[mbOK],0);
       Exit;
    end;

    // Peterson Victor SIG23387 I
    if qryDet.FieldByName('FLGDEVOLUCAO').AsInteger = 0 then
       dbrgrpForma.Caption := 'Forma de Cobrança'
    else
       dbrgrpForma.Caption := 'Forma de Devolução';
    // Peterson Victor SIG23387 F

    inherited;

    flg_Movimentacao := 2;
  end else begin
    //BRUNO AZEVEDO SOL 123570 KINTANA 628853
    CarregaAlterador();

    inherited;
  end;
end;

procedure TfrmCadHstContribuicaoBeneficiario.sbtnExcluiDetClick(Sender: TObject);
Var
  sSQL:String;
begin

  if (pgctrlDetalhe.ActivePage <> tbsAlteradores) then begin
    if ExisteNaTmpDesc(qryDet) then
    begin
       MsgDlg('Esta contribuição já foi cobrada, não podendo mais ser excluída.','Atenção',mtError,[mbOK],0);
       Exit;
    end;

    if qryDet.FieldByName('FlgCalcReserva').AsInteger = 1
    then begin
       MsgDlg('Esta contribuição já foi alimentada na reserva do participante e não pode ser excluída. '+#13+
              'Caso seja necessário, utilize a opção de "Estorno" no Controle Individual de Contribuição para '+
              'retirá-la da reserva.','Atenção',mtError,[mbOK],0);
       Exit;
    end;

    if trim(qryDet.FieldByName('CODDOCUMENTOPREV').AsString) <> ''
    then begin
       MsgDlg('Esta contribuição já foi enviada para o sistema de Contas e Receber não podendo ser excluída. '+#13+
              'Caso seja necessário, utilize a opção de "Cancelar" no Controle Individual de Contribuição para '+#13+
              'desfazer o envio.','Atenção',mtError,[mbOK],0);
       Exit;
    end;

    if qryDet.FieldByName('SitRecebimento').AsInteger = 1 // enviada e não recebida
    then begin
       if MsgDlg('Esta contribuição já foi enviada para cobrança. Deseja excluí-la ? . ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
       then Exit;
    end;

    //BRUNO AZEVEDO SOL 123570 KINTANA 628853
    //sSQL := 'DELETE FROM HSTATRASOCONTRIB WHERE NUMRECEBIMENTO = '+
    //        qryDet.FieldByName('NUMRECEBIMENTO').AsString;
    //ExecutarQuery(dtmAPrev.qryAux, sSQL);
    //BRUNO AZEVEDO SOL 150473/3481 KINTANA 1092606
    if not(qryAlteradores.IsEmpty) then begin
      qryAlteradores.Delete();
    end;

    //William Moreira da Silva - SOL 263499 - PPM 1124000
    //inherited;
    //William Moreira da Silva - SOL 263499 - PPM 1124000

    dtmAPrev.qryAux.Close;
    dtmAPrev.qryAux.sql.Text :=  ' DELETE TMPDESC '+
                                 ' WHERE MESREFERENCIA = '''+qryDet.FieldByName('MESREFERENCIA').AsString+''' '+
                                 ' AND MESCOBRANCA = '''+qryDet.FieldByName('MESCOBRANCA').AsString+''' '+
                                 ' AND IDPESSJUR = '+qryDet.FieldByName('IDPESSJUR').AsString+' '+
                                 ' AND IDPLANOPREV = '+qryDet.FieldByName('IDPLANOPREV').AsString+' '+
                                 ' AND IDPESSOA = '+qryDet.FieldByName('IDPESSOA').AsString+' '+
                                 ' AND IDDESCONTO = '+qryDet.FieldByName('IDCONTRIBUICAO').AsString+' '+
                                 ' AND NVL(SITENVIO,''0'') = ''0'' ';
    dtmAPrev.qryAux.ExecSql;

    //William Moreira da Silva - SOL 263499 - PPM 1124000
    inherited;
    //William Moreira da Silva - SOL 263499 - PPM 1124000
  end else begin
    inherited;
  end;
end;

procedure TfrmCadHstContribuicaoBeneficiario.dbedEsperadoExit(Sender: TObject);
begin
  inherited;

  if (dbedRecebido.datasource.dataset.state <> dsEdit)
     and (not memobs.visible) Then
     dbedRecebido.Text := dbedEsperado.Text;
end;

procedure TfrmCadHstContribuicaoBeneficiario.dbdtPrevisaoExit(Sender: TObject);
begin
  inherited;
  dbdtRecebimento.Text := dbdtPrevisao.Text;
end;

procedure TfrmCadHstContribuicaoBeneficiario.grpMesAnoRefExit(Sender: TObject);
var sValorRegra,
    sDataRef,
    sSQL : string;
    bErro : boolean;
    dDiferenca : double;
begin
  inherited;

  memobs.visible := false;
  rdgrpatrasodevol.visible   := True;
  rdgrpatrasodevol.itemindex := 0;

  if not (qryDet.State = dsInsert) then Exit;

  if (Trim(edAnoRef.Text) = '') or (Trim(edMesRef.Text) = '')
  then Exit;

  if (StrToInt(edMesRef.Text) = 2)
  then sDataRef := '28/'+ Trim(edMesRef.Text)+'/'+Trim(edAnoRef.Text)
  else if edMesRef.Text = '13'
       then sDataRef := '30/12/'+Trim(edAnoRef.Text)
  else sDataRef := '30/'+Trim(edMesRef.Text)+'/'+Trim(edAnoRef.Text);

  // Calcular contribuicao e colocar como valor esperado
  sSQL := MontaSQLContribNOVA( qry.FieldByName('IdPessJur').AsInteger,
                               qry.FieldByName('IdPlanoPrev').AsInteger,
                               qry.FieldByName('IdPessoa').AsInteger,
                               qry.FieldByName('SeqProposta').AsInteger,
                               qry.FieldByName('IdContribuicao').AsInteger,
                               prmIdMotivoContrib,
                               qry.FieldByName('FlgInternoContrib').AsString,
                               Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text),
                               sDataRef,
                               '0',
                               qry.FieldByName('InscricaoData').AsString,
                               qry.FieldByName('DataNasc').AsString,
                               'N',
                               'HSTCONTRIBPREV','VALORESPERADO',
                               '0' ,
                               qry.FieldByName('IdSitPart').AsString,
                               '01/'+Trim(edMesRef.Text)+'/'+Trim(edAnoRef.Text), 
                               IntToStr(TrazUltDiaMes(StrToInt(edMesRef.Text), StrToInt(edAnoRef.Text)))+'/'+Trim(edMesRef.Text)+'/'+Trim(edAnoRef.Text),
                               0,-1,Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text),-1);
  try
     if (edMesRef.Text <> '13') or (qry.FieldByName('IdRegraCalculo').AsString = '') 
     then sValorRegra := RegraNumerica(qry.FieldByName('IdRegraCalculo').AsString, sSQL, bErro,iIdCalculoGeral)
     else sValorRegra := RegraNumerica(qry.FieldByName('IdRegraCalculo13').AsString, sSQL, bErro,iIdCalculoGeral);
  except
     if (edMesRef.Text <> '13') or (qry.FieldByName('IdRegraCalculo').AsString = '') 
     then MsgDlg('Erro na Regra de Cálculo da Contribuição - Regra Nº '+qry.FieldByName('IdRegraCalculo').AsString,'Erro',mtError,[mbOk, mbHelp],0)
     else MsgDlg('Erro na Regra de Cálculo da Contribuição - Regra Nº '+qry.FieldByName('IdRegraCalculo13').AsString,'Erro',mtError,[mbOk, mbHelp],0);

     Exit;
  end;

  If StrToFloat(ClienteNumero(sValorRegra)) < 0
   Then Begin
     MsgDlg('Valor Inválido !! Cancele esta operação !!','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
   End;

  dbedEsperado.Text := FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))) ;

  //edilaine SIG104014 : inicio
  //dbdtPrevisao.Text := sDataRef;
  //qryDet.FieldByName('DATAPREVISAORECE').AsString  := sDataRef;
  //edilaine SIG104014 : fim


  qryDet.FieldByName('ValorEsperado').AsString  := ClienteNumero(sValorRegra);
  qryDet.FieldByName('ValorCalculado').AsString := ClienteNumero(sValorRegra);

  //verifica se há contribuições já recebidas neste mês
  //de referência e avisa ao usuário para auxliliar os
  //casos de acerto por motivo de mudança no valor

  dtmAPrev.qryaux.close;
  dtmAPrev.qryaux.sql.text := ' SELECT SUM(DECODE(FLGDEVOLUCAO,1,-1*NVL(VALORRECEBIDO,0),NVL(VALORRECEBIDO,0))) VALOR FROM HSTCONTRIBPREV WHERE '+ 
                     ' IDPESSJUR = '+IntToStr(qry.FieldByName('IdPessJur').AsInteger)+' '+
                     ' AND IDPLANOPREV =  '+IntToStr(qry.FieldByName('IdPlanoPrev').AsInteger)+' '+
                     ' AND IDPESSOA = '+IntToStr(qry.FieldByName('IdPessoa').AsInteger)+' '+
                     ' AND SEQPROPOSTA =  '+IntToStr(qry.FieldByName('SeqProposta').AsInteger)+' '+
                     ' AND IDCONTRIBUICAO =  '+IntToStr(qry.FieldByName('IdContribuicao').AsInteger)+'  '+
                     ' AND MESREFERENCIA = '''+Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text)+''' ';
  try
     dtmAPrev.qryaux.open;
  except
  end;

  if not dtmAPrev.qryaux.isempty
  then
     if dtmAPrev.qryaux.fieldbyname('valor').AsFloat > 0
     then begin
        dDiferenca := StrToFloat(ClienteNumero(sValorRegra)) - dtmAPrev.qryaux.fieldbyname('valor').AsFloat;
        dDiferenca := StrToFloat(FormatFloat('#0.00',dDiferenca));
        qryDet.FieldByName('ValorEsperado').AsFloat  := Abs(dDiferenca);
        qryDet.FieldByName('ValorCalculado').AsFloat := Abs(dDiferenca);
        memobs.lines.Text := 'ATENÇÃO: Neste mês já existe R$ '+dtmAPrev.qryaux.fieldbyname('valor').AsString+' recebidos '+
                             ' desta contribuição. O valor esperado total é de R$ '+ClienteNumero(sValorRegra)+'.'+#13+
                             ' Calculado : R$'+ClienteNumero(sValorRegra)+'. Já Cobrado : R$ '+dtmAPrev.qryaux.fieldbyname('valor').AsString+
                             '. A Cobrar : R$ '+FloatToStr(dDiferenca);

        //trata para não mostrar valores negativos
        if dDiferenca < 0 then
        begin
           rdgrpatrasodevol.visible := true;
           rdgrpatrasodevol.itemindex := 1;
           dDiferenca := -1*dDiferenca;
        end;

        dbedEsperado.Text := FormatFloat('#0.00',dDiferenca);

        dbedRecebido.Text := '';
        memobs.visible := true;
     end;


  if not memobs.visible then
  begin
     dbedRecebido.Text  := FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra)));
     qryDet.FieldByName('ValorRecebido').AsString  := ClienteNumero(sValorRegra);
  end;
end;



procedure TfrmCadHstContribuicaoBeneficiario.edMesRefExit(Sender: TObject);
begin
  inherited;

  if (Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text) <>
     Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text))
     and (length(Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text)) = 7 )
     and (length(Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text)) = 7 ) then
  begin
     rdgrpatrasodevol.Visible := true;
  end
  else
     rdgrpatrasodevol.Visible := True;
end;



procedure TfrmCadHstContribuicaoBeneficiario.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  if (Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text) <>
     Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text))
     and (length(Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text)) = 7 )
     and (length(Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text)) = 7 ) then
  begin
     rdgrpatrasodevol.Visible := true;
     rdgrpatrasodevol.ItemIndex := 0;
     qryDet.FieldByName('flgdevolucao').AsInteger     := 0;
  end
  else
     rdgrpatrasodevol.Visible := True;
end;



function TfrmCadHstContribuicaoBeneficiario.ExisteNaTmpDesc(qry: TwwQuery) : Boolean;
begin

   Result := False;

   dtmAPrev.qryAux.Close;
   dtmAPrev.qryAux.sql.Text :=  ' SELECT 1 FROM TMPDESC '+
                                ' WHERE MESREFERENCIA = '''+qrydet.FieldByName('MESREFERENCIA').AsString+''' '+
                                ' AND MESCOBRANCA = '''+qrydet.FieldByName('MESCOBRANCA').AsString+''' '+
                                ' AND IDPESSJUR = '+qrydet.FieldByName('IDPESSJUR').AsString+' '+
                                ' AND IDPLANOPREV = '+qrydet.FieldByName('IDPLANOPREV').AsString+' '+
                                ' AND IDPESSOA = '+qrydet.FieldByName('IDPESSOA').AsString+' '+
                                ' AND IDDESCONTO = '+qrydet.FieldByName('IDCONTRIBUICAO').AsString+' '+
                                ' AND NVL(SITENVIO,''0'') <> ''0'' ';
   dtmAPrev.qryAux.open;

   if not dtmAPrev.qryAux.isempty then
      Result := True;


end;


procedure TfrmCadHstContribuicaoBeneficiario.bbtnOkDetClick(Sender: TObject);
var
MESCOBRANCA : String;
begin
     (*  Critica retirada a pedido do usuario solicitante do chamado 61677.
     //Ewerton Beltramini - 19/07/2020 - SIG 61677 - Inicio... (66,74)
     QryDetAux.Close;
     QryDetAux.ParamByName('IdPessJur').Value      :=  qryDet.ParamByName('IdPessJur').Value     ;
     QryDetAux.ParamByName('IdPlanoPrev').Value    :=  qryDet.ParamByName('IdPlanoPrev').Value   ;
     QryDetAux.ParamByName('IdPessoa').Value       :=  qryDet.ParamByName('IdPessoa').Value      ;
     QryDetAux.ParamByName('SeqProposta').Value    :=  qryDet.ParamByName('SeqProposta').Value   ;
     QryDetAux.ParamByName('IDTITULAR').Value      :=  qryDet.ParamByName('IDTITULAR').Value     ;
     QryDetAux.ParamByName('IdContribuicao').Value :=  qryDet.ParamByName('IdContribuicao').Value;
     QryDetAux.Open;

     if ((QryDetAux.FieldByName('IDPLANOPREV').AsInteger = 66) or (QryDetAux.FieldByName('IDPLANOPREV').AsInteger = 74))
     or ((qryDet.ParamByName('IdPlanoPrev').AsInteger = 66) or (qryDet.ParamByName('IdPlanoPrev').AsInteger = 74)) then
     begin
          if (qryDetSALCONTRIB.AsFloat <=0 ) or (qryDetVALOROP1.AsFloat <= 0 ) then
          begin
               MsgDlg( 'O Salário e o Percentual de Contribuição, ' + #13 + 'são de preenchimento obrigatório para o plano selecionado.',
                       'Informação', mtWarning, [mbOK], 0);
               Exit;
            end;
     end;
    //Ewerton Beltramini - 19/07/2020 - SIG 61677 - Fim.
    *)
  inherited;

  
end;

procedure TfrmCadHstContribuicaoBeneficiario.dbedRecebidoExit(Sender: TObject);
begin
  inherited;

  try
     if (StrToFloat(dbedRecebido.Text) > 0) and
        (dbedRecebido.Text = dbedEsperado.Text)  and
        (dbdtRecebimento.text <> '') then
     begin
        dbrgrpSitRecebimento.ItemIndex := 2;
        qryDet.FieldByName('SITRECEBIMENTO').AsString      :=  '2' ;
     end
     else if (dbedRecebido.Text <> dbedEsperado.Text)  and
             (dbdtRecebimento.text <> '') then
     begin
        dbrgrpSitRecebimento.ItemIndex := 3;
        qryDet.FieldByName('SITRECEBIMENTO').AsString      :=  '3' ;
     end
  except
    //caso o text esteja vazio
  end;
end;



procedure TfrmCadHstContribuicaoBeneficiario.dbdtRecebimentoExit(Sender: TObject);
begin
  inherited;

  try
     if (StrToFloat(dbedRecebido.Text) > 0)   and
        (dbedRecebido.Text = dbedEsperado.Text)  and
        (dbdtRecebimento.text <> '') then
     begin
        dbrgrpSitRecebimento.ItemIndex := 2;
        qryDet.FieldByName('SITRECEBIMENTO').AsString      :=  '2' ;
     end
     else if (dbedRecebido.Text <> dbedEsperado.Text)  and
             (dbdtRecebimento.text <> '') then
     begin
        dbrgrpSitRecebimento.ItemIndex := 3;
        qryDet.FieldByName('SITRECEBIMENTO').AsString      :=  '3' ;
     end
  except
    //caso o text esteja vazio
  end;
end;



procedure TfrmCadHstContribuicaoBeneficiario.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.UsaDistinct := True;
  MontaSelect.Filtro.Add('BTIT.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;

procedure TfrmCadHstContribuicaoBeneficiario.grpMesCobrancaExit(Sender: TObject);
begin
  inherited;
  qryLote.Close;
  qryLote.ParamByName('MESREFERENCIA').AsString := Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text); // SOL 175146 KINTANA 1594215   SIG 99100
  qryLote.Open;

  //edilaine SIG104014 : inicio
  if (StrToInt(edMesCob.Text) = 2) then
     dbdtPrevisao.Text := '28/'+ Trim(edMesCob.Text)+'/'+Trim(edAnoCob.Text)
  else
     dbdtPrevisao.Text := '30/'+ Trim(edMesCob.Text)+'/'+Trim(edAnoCob.Text);

  qryDet.FieldByName('DATAPREVISAORECE').AsString  := dbdtPrevisao.text;
  //edilaine SIG104014 : fim

end;

procedure TfrmCadHstContribuicaoBeneficiario.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryLote.Close;
  qryLote.ParamByName('MESREFERENCIA').AsString := qryDet.FieldByName('MESCOBRANCA').AsString; // SOL 175146 KINTANA 1594215   SIG 99100
  qryLote.Open;
end;

procedure TfrmCadHstContribuicaoBeneficiario.bbtnConfirmarClick(Sender: TObject);
VAR
 MESCOBRANCA  : STRING;
begin
  inherited;

  //BRUNO AZEVEDO SOL 141073 Kintana 141073
  try
    if not(dtmBaseDados.dbBaseDados.InTransaction) Then Begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;

   if QRYMAIORMES.Active  then
       QRYMAIORMES.Close;
   QRYMAIORMES.ParamByName('idpessoa').AsInteger :=
      StrToInt(MontaSelect.ValoresChave[2]);
   QRYMAIORMES.ParamByName('idplanoprev').AsInteger :=
      StrToInt(MontaSelect.ValoresChave[1]);
   QRYMAIORMES.ParamByName('idpessjur').AsInteger :=
      StrToInt(MontaSelect.ValoresChave[0]);
   QRYMAIORMES.ParamByName('idcontribuicao').AsInteger :=
      StrToInt(MontaSelect.ValoresChave[4]);

    QRYMAIORMES.open;
    MESCOBRANCA :=
        QRYMAIORMES.FieldByName('cobranca').AsString;
   if not QRYMAIORMES.eof then
      begin
        UPDMAIORMES.ParamByName('idpessoa').AsInteger :=
               StrToInt(MontaSelect.ValoresChave[2]);
        UPDMAIORMES.ParamByName('idplanoprev').AsInteger :=
               StrToInt(MontaSelect.ValoresChave[1]);
        UPDMAIORMES.ParamByName('idpessjur').AsInteger :=
               StrToInt(MontaSelect.ValoresChave[0]);
        UPDMAIORMES.ParamByName('idcontribuicao').AsInteger :=
               StrToInt(MontaSelect.ValoresChave[4]);
        UPDMAIORMES.ParamByName('ultmespreparo').AsString :=
               QRYMAIORMES.FieldByName('cobranca').AsString;
        UPDMAIORMES.ExecSQL;
      end;
      //fim pendência.

      if flg_Movimentacao = 1 then
        begin
           if not GravaLogTOTALPREV ('Inclusão Manual de Contribuição - Mês '+edAnoCob.Text+'-Benef. '+copy(qry.fieldbyname('NOMEDEPENDENTE').AsString,1,20)+'Contr.'+
              copy(qry.fieldbyname('NOMECONTRIB').AsString,1,20))
                 then begin
                  MsgDlg('Erro ao Gravar o Log.','Atenção',mtError,[mbOK],0);
             end;
       end;

       if flg_Movimentacao = 2 then
        begin
           if not GravaLogTOTALPREV ('Alteração Manual de Contribuição  - Mês '+edAnoCob.Text+'-Benef. '+qry.fieldbyname('NOMEDEPENDENTE').AsString+'Contr.'+
              copy(qry.fieldbyname('NOMECONTRIB').AsString,1,20))
                 then begin
                  MsgDlg('Erro ao Gravar o Log.','Atenção',mtError,[mbOK],0);
             end;
       end;

        flg_Movimentacao := 0;
     //Fim Pendência

    //BRUNO AZEVEDO SOL 123570 KINTANA 628853
    if (pgctrlDetalhe.ActivePage = tbsAlteradores) then begin
      qryAlteradores.Close;
      qryAlteradores.ParamByName('NumRecebimento').AsInteger := qryDet.FieldByName('NumRecebimento').AsInteger;
      qryAlteradores.Open;
    end;

    dtmBaseDados.dbBaseDados.Commit;
  except
    if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
      dtmBaseDados.dbBaseDados.Rollback;

    end;
  end;
  //BRUNO AZEVEDO SOL 141073 Kintana 141073
end;

procedure TfrmCadHstContribuicaoBeneficiario.FormCreate(Sender: TObject);

begin
inherited;
  flg_Movimentacao := 0;
end;
procedure TfrmCadHstContribuicaoBeneficiario.sbtnInsDetClick(Sender: TObject);
begin
  //BRUNO AZEVEDO SOL 123570 KINTANA 628853
  if (pgctrlDetalhe.ActivePage = tbsAlteradores) then begin
    pnlAlteradores.SetFocus();
  end;
  
  inherited;
  flg_Movimentacao := 1;

  CarregaAlterador();
  //BRUNO AZEVEDO SOL 123570 KINTANA 628853
  if (pgctrlDetalhe.ActivePage = tbsAlteradores) then begin
    if (qryAlteradores.State <> dsInsert) then begin
      qryAlteradores.Insert;
    end;
  end;
end;

procedure TfrmCadHstContribuicaoBeneficiario.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
 flg_Movimentacao := 0;
end;

procedure TfrmCadHstContribuicaoBeneficiario.bbtnSairClick(Sender: TObject);
begin
  inherited;
 flg_Movimentacao := 0;
end;                

procedure TfrmCadHstContribuicaoBeneficiario.tbcDetalheChange(
  Sender: TObject);
begin
  inherited;
  //BRUNO AZEVEDO SOL 123570 KINTANA 628853
  qryAlteradores.Close;
  qryAlteradores.ParamByName('NumRecebimento').AsInteger := qryDet.FieldByName('NumRecebimento').AsInteger;
  qryAlteradores.Open;
end;

procedure TfrmCadHstContribuicaoBeneficiario.qryAlteradoresBeforePost(
  DataSet: TDataSet);
var
  sTipo: String;
begin
  If (edValorAlterador.Text = '') Then Begin
    MsgDlg('Preencha o valor do alterador. ','Atenção',mterror,[mbOK],0);
    Abort;
  End;

  If (dblkpcmbTipoAlterador.Text = '') Then Begin
    MsgDlg('Preencha o tipo do alterador. ','Atenção',mterror,[mbOK],0);
    Abort;
  End;
  
  inherited;

  if rgrpTipoAlterador.ItemIndex = 0
  then sTipo := 'A'
  else sTipo := 'D';

  qryAlteradores.FieldByName('MESREFERENCIA').AsString   := qryDet.FieldByName('MesReferencia').AsString;
  qryAlteradores.FieldByName('MESCOBRANCA').AsString     := qryDet.FieldByName('MesCobranca').AsString;
  qryAlteradores.FieldByName('NUMRECEBIMENTO').AsString  := qryDet.FieldByName('NumRecebimento').AsString;
  qryAlteradores.FieldByName('IDMOTIVO').AsString        := qryDet.FieldByName('IdMotivo').AsString;
  qryAlteradores.FieldByName('VALOR').AsString           := edValorAlterador.Text;
  qryAlteradores.FieldByName('CODALTERADOR').AsString    := qryTipoAlterador.FieldByName('CodAlterador').AsString;
  qryAlteradores.FieldByName('DESCRICAO').AsString       := qryTipoAlterador.FieldByName('DESCRICAO').AsString;
  qryAlteradores.FieldByName('FLGTIPO').AsString         := sTipo;
  qryAlteradores.FieldByName('FLGRETROATIVO').AsString   := '0';
  qryAlteradores.FieldByName('FLGEVENTO').AsString       := qryDet.FieldByName('FlgEvento').AsString;
end;

procedure TfrmCadHstContribuicaoBeneficiario.CarregaAlterador();
begin
  //BRUNO AZEVEDO SOL 123570 KINTANA 628853
  qrytipoalterador.close;
  if rgrpTipoAlterador.itemindex = 0 then
  qrytipoalterador.parambyname('recpag').AsString := 'R'
  else  qrytipoalterador.parambyname('recpag').AsString := 'P';

  qrytipoalterador.parambyname('idplanoprev').AsString := qry.FieldByName('idplanoprev').AsString;
  qrytipoalterador.parambyname('idcontribuicao').AsString := qry.FieldByName('idcontribuicao').AsString;
  qrytipoalterador.open;
  //BRUNO AZEVEDO SOL 123570 KINTANA 628853
end;

procedure TfrmCadHstContribuicaoBeneficiario.rgrpTipoAlteradorClick(
  Sender: TObject);
begin
  inherited;
  //BRUNO AZEVEDO SOL 123570 KINTANA 628853
  CarregaAlterador();
end;

procedure TfrmCadHstContribuicaoBeneficiario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //BRUNO AZEVEDO SOL 141073 Kintana 141073
  if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    dtmBaseDados.dbBaseDados.Rollback;
  end;
end;



procedure TfrmCadHstContribuicaoBeneficiario.ToolbarButton971Click(
  Sender: TObject);
  var sCobDev : string;
begin
   //Peterson Victor - SIG23387 I
   if rdgrpatrasodevol.ItemIndex = 0 then
      sCobDev := 'R'
   else
      sCobDev := 'P';

   MontaSelectDOC.Filtro.Clear;

   MontaSelectDOC.Filtro.Add('PESSOA.IDPESSOA          = DOCUMENTO.IDFORCLI ');
   MontaSelectDOC.Filtro.Add('(TIPODOCRECPAG.DEBCRE = LANCTODOCUM.DEBCRE) OR (DOCUMENTO.OPERACAO = ' + QuotedStr('15') + ')');
   MontaSelectDOC.Filtro.Add('TIPODOCRECPAG.CODTIPDOC  = DOCUMENTO.CODTIPDOC ');
   MontaSelectDOC.Filtro.Add('LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO ');
   MontaSelectDOC.Filtro.Add('LANCTODOCUM.OPERACAO     = DOCUMENTO.OPERACAO      ');
   MontaSelectDOC.Filtro.Add('DOCUMENTO.CODPORTFORMA   = PORTADORFORMA.CODPORTFORMA(+) ');
   MontaSelectDOC.Filtro.Add('DOCUMENTO.IDMODULO       = MODULO.IDMODULO(+)            ');
   MontaSelectDOC.Filtro.Add('DOCUMENTO.MOECODIGO      = MOEDA.MOECODIGO(+)            ');
   MontaSelectDOC.Filtro.Add('LANCTODOCUM.CODDOCUMENTO = RECBTOPAGTO.CODDOCUMENTO(+)   ');
   MontaSelectDOC.Filtro.Add('LANCTODOCUM.NUMLANCTO    = RECBTOPAGTO.NUMLANCTO(+)      ');
   MontaSelectDOC.Filtro.Add('DOCUMENTO.IDUSUARIOINCLUSAO=USUARIOSISTEMA.IDUSUARIO(+)  ');


   MontaSelectDOC.Filtro.Add('DOCUMENTO.RECPAG = ' + QuotedStr(sCobDev));
   MontaSelectDOC.Filtro.Add('DOCUMENTO.IDPESSOA = '+IntToStr(Sistema.idempresa));
   MontaSelectDOC.Filtro.Add('TIPODOCRECPAG.CODTIPDOC In (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ' +
                          QuotedStr(sCobDev) + ' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + QuotedStr(sCobDev) + ' and b.idusuario=' +
                          Inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ' +
                          QuotedStr(sCobDev) + '  and exists (select 1 from UsuarioxTpdocto b where recpag=' + QuotedStr(sCobDev) + ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                          Inttostr(sistema.idusuario)+'))');
   MontaSelectDOC.Filtro.Add('TIPODOCRECPAG.RECPAG = ' + QuotedStr(sCobDev));
   MontaSelectDOC.Filtro.Add('DOCUMENTO.OPERACAO = ''1'' OR DOCUMENTO.OPERACAO = ''2'' OR DOCUMENTO.OPERACAO = ''10''');

   MontaSelectDOC.Executar;


   if MontaSelectDOC.RetornouValor then
   begin
      dbedCodDocPrev.Text := MontaSelectDOC.ValoresChave[0];
      qryDet.FieldByName('CODDOCUMENTOPREV').AsString := MontaSelectDOC.ValoresChave[0];
   end;
   //Peterson Victor - SIG23387 F
end;

procedure TfrmCadHstContribuicaoBeneficiario.dbedCodDocPrevKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;

  Key:= #0;
  
end;

procedure TfrmCadHstContribuicaoBeneficiario.rdgrpatrasodevolChange(
  Sender: TObject);
begin
  inherited;

    // Peterson Victor SIG23387 I
    if rdgrpatrasodevol.ItemIndex = 0 then
       dbrgrpForma.Caption := 'Forma de Cobrança'
    else
       dbrgrpForma.Caption := 'Forma de Devolução';
    // Peterson Victor SIG23387 F

end;

procedure TfrmCadHstContribuicaoBeneficiario.dbrgrpFormaChange(
  Sender: TObject);
begin
  inherited;
  {
  if dbrgrpForma.ItemIndex = 0 then

  else
  if dbrgrpForma.ItemIndex = 0 then

  else
  }

end;

End.
