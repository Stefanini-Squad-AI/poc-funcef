{ --------------------------------------------------------------------------------------------------
// Alterações:
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 172385/10082
Nº KINTANA..: 1690505
Data........: 01/08/2012
Responsável.: Vander Campos
Descrição...: EF - RN010 - Validação do Centro de Responsabilidade do usuário com o Grupo Orçamentário
Rotina......: CmeCadastroApplyInsert
-------------------------------------------------------------------------------------------------------
Rotina......: GridCalcCellColors
Nº SOL......: 241969
Nº PPM......: 564261
Data........: 03/07/2013
Responsável.: Marcio Sanches Spinosa SOL 241969 PPM 564261
Descrição...: Ajuste para validação das contas que ja foram inseridas.
--------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 210712
Nº KINTANA..: 2029487
Data........: 03/07/2013
Responsável.: Fernando Xavier
Descrição...: Na inclusão de linhas para uma nova sub-despesa, as linha referentes aos meses 1,2,3
              está vindo desabilitada.
--------------------------------------------------------------------------------------------------
Rotina......: CmeCadastroApplyInsert
Nº SOL......: 193936
Nº KINTANA..: 1852777
Data........: 09/11/2012
Responsável.: Edilaine Ferraresi
Descrição...: após inserir/alterar carregar dados recuperando os filtros usados na seleção
{--------------------------------------------------------------------------------------------------
Rotina......: GridCalcCellColors
Nº SOL......: 187127
Nº KINTANA..: 1761657
Data........: 08/08/2012
Responsável.: Edilaine Ferraresi
Descrição...: permitir rateio de valores negativos (não pintar linha apenas qdo vlrorcado = 0)
{--------------------------------------------------------------------------------------------------
Rotina......: cboPlanoOrcChange
Nº SOL......: 185017
Nº KINTANA..: 1733391
Data........: 13/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: alterar exercicio de acordo com o plano selecionado
{--------------------------------------------------------------------------------------------------
// Autor.........: Edilaine Ferraresi
// Data..........: 08/06/2012
// Nº SOL........: 172384-10064
// Nº KINTANA....: 1690080
// Rotina........: MontaSelectBeforeOpenCds
// Descrição.....: correção da busca de contas para período anual 
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Edilaine Ferraresi
// Data..........: 29/02/2012
// Nº SOL........: 172383-7763
// Nº KINTANA....: 1557030
// Rotina........: *.DFM
// Descrição.....: Adicionado parâmetro de Plano orçamentario, Fornecedore/Sub-Despesa e Centro
//                 de Custo. Seletor de Contas para rateio e habilitar botão ALTERAR
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 22/11/2011
// Nº SOL........: 166069
// Nº KINTANA....: 1468025
// Rotina........: *.DFM
// Descrição.....: Adicionado parâmetro de Atividade de Projeto
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 04/11/2011
// Nº SOL........: 167901
// Nº KINTANA....: 1476693
// Rotina........: MontaSelect (.DFM)
// Descrição.....: Adicionado JOIN com a tabela PLANOORCAMENTARIO para melhorar performance da consulta
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: DFM
Nº SOL......: 166066
Nº KINTANA..: 1461858
Data........: 20/10/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Permitir informar valores negativos.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor.........: Ricardo de Freitas Araújo Silva
Data..........: 22/08/2011
Nº SOL........: 159248
Nº KINTANA....: 1337823
Rotina........: PesquisaCriterio
Descrição.....: Adicionado parâmetros de Programa de Tipo de Despesa
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btCalcularRatClick
Nº SOL......: 122291
Nº KINTANA..: 597829
Data........: 23/03/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Ao calcular rateio verificar se valor é maior que zera.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: CmeCadastroApplyInsert,CmeCadastroApplyEdit
Nº SOL......: 154956
Nº KINTANA..: 1193268
Data........: 23/03/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Após realizar a inserção\edição, na consulta de contas orçamentárias
              deverá informar o parâmetro de unidade de negócio como "0";
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btSelContasClick
Nº SOL......: 151660
Nº KINTANA..: 1115295
Data........: 27/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para trazer apenas os centros de custos ativos na inclusão
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btCalcularRatClick
Nº SOL......: 150140
Nº KINTANA..: 1087554
Data........: 12/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do Plano e Patro no Critério de Rateio.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 150137
Nº KINTANA..: 1087555
Data........: 12/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção da Entrada de Dados para o período anual e alteração da busca para
              trazer os resultados agrupado por Grupo/Periodo/Exercício.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 149003
Nº KINTANA..: 1074595
Data........: 24/12/2010
Responsável.: Thaise Amaral Martins
Descrição...: Em Selecionar contas orçamentarias, criar uma rotina para trazer todos os meses caso a escolha seja ANUAL.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btSelContasClick
Nº SOL......: 148185
Nº KINTANA..: 1037408
Data........: 23/11/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Retirada a obrigatoriedade do plano de trabalho.
---------------------------------------------------------------------------------------------------}
{*******************************************************
Rotina..........: btBuscGrupoClick
N. Sol..........: 61185
N. Kintana......: 523479
Data............: 26/10/2009
Responsável.....: Henrique Massão
Descrição.......: Quando o usuário não tiver permissão para inserir ou
                  visualizar o grupo escolhido, o sistema irá apresentar
                  mensagem informando a restrição.
*******************************************************
Rotina..........: CmeCadastroApplyInsert, edtExercicioClick
N. Sol..........: 124422
N. Kintana......: 631745
Data............: 05/10/2009
Responsável.....: Ricardo Alves
Descrição.......: Corrigido erro no cálculo de rateio e na entrada de dados quando
  período diferente de ANUAL na janela de entrada de dados especial.
*******************************************************
Rotina..........: CtrlTransacoesPorGrupo.ListaPlanoTrab
N. Sol..........: 110247
N. Kintana......: 502307
Data............: 19/03/2009
Responsável.....: Marilza Colpani
Descrição.......: Quando o Exercício for alterado, as informações pertinentes
                  ao Plano de Trabalho serão mostradas.
                  As disposições de alguns componentes no form sofreram alterações.
*******************************************************}
unit FEntDadosPorGrupoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, CMDBLookupCombo, TREdit,
  uCtrlTransacoesPorGrupo, uCtrlPadroes, uSistema, uMensErro,
  uCtrlPlanPrevContabPatro, uCtrlPlanPrevContabil, uCtrlPatro, uModulo, uCMTypes,
  FProgressoDuplo, FProgresso,
  uCtrlGrupoOrcamen,
  uCtrlBlqEntdados, Mask, wwdbedit, Wwdotdot, Wwdbcomb, DBTables, DBGrids, fTelaAut;

type
  TFrmEntDadosPorGrupoMT = class(TFrmCadastroMT)
    Grid: TwwDBGrid;
    CdsPatro: TCMClientDataSet;
    CdsPlano: TCMClientDataSet;
    cdsPlanoTrab: TCMClientDataSet;
    msGrupo: TMontaSelect;
    Label1: TLabel;
    edtDescGrupo: TEdit;
    Label4: TLabel;
    cboPatro: TCMDBLookupCombo;
    Label3: TLabel;
    cboPlano: TCMDBLookupCombo;
    btBuscGrupo: TSpeedButton;
    Label2: TLabel;
    cboCCusto: TCMDBLookupCombo;
    btSelContas: TBitBtn;
    edtExercicio: TDBRealEdit;
    Label5: TLabel;
    Label6: TLabel;
    pnlBottom: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    btCalcularRat: TSpeedButton;
    cboRatCriter: TCMDBLookupCombo;
    edtVlrRateio: TDBRealEdit;
    CdsRatCriter: TCMClientDataSet;
    Shape1: TShape;
    Label9: TLabel;
    pnlTotalContas: TPanel;
    chkSobrescreve: TCheckBox;
    cboPeriodo: TwwDBComboBox;
    qryAcesso: TQuery;
    cboPrograma: TCMDBLookupCombo;
    cboTipoDespesa: TCMDBLookupCombo;
    Label10: TLabel;
    Label11: TLabel;
    cdsPrograma: TCMClientDataSet;
    cdsTipoDespesa: TCMClientDataSet;
    cboAtividadeProjeto: TCMDBLookupCombo;
    lbl1: TLabel;
    cdsAtividadeProj: TCMClientDataSet;
    Label12: TLabel;
    cboPlanoOrc: TCMDBLookupCombo;
    Label13: TLabel;
    cdsPlanoOrc: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    edtFornDesp: TEdit;
    btBuscFornecedor: TSpeedButton;
    msDespesa: TMontaSelect;
    procedure btBuscGrupoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSelContasClick(Sender: TObject);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridTopRowChanged(Sender: TObject);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure GridRowChanged(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure GridUpdateFooter(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure btCalcularRatClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure GridTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure edtExercicioClick(Sender: TObject);
    procedure btBuscFornecedorClick(Sender: TObject);
    procedure cboCCustoChange(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure cboPlanoOrcChange(Sender: TObject);
  private
    { Private declarations }
    CtrlTransacoesPorGrupo  : TCtrlTransacoesPorGrupo;
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlPlanPrevContabil    : TCtrlPlanPrevContabil;
    CtrlPatro               : TCtrlPatro;
    CtrlBlqEntDados         : TCtrlBlqEntDados;

    rParamsEnt              : tParametros;   // Edilaine - SOL 193936 / KTN 1852777

    procedure CarregaFiltros;                // Edilaine - SOL 193936 / KTN 1852777

    procedure LimpaFiltrosTela(bTudo: Boolean = True);
    procedure HabilitaControles(bFlgHab : boolean); // Edilaine - SOL 172383-7763 / KTN 1557030

  public
    { Public declarations }
    procedure Progresso(vParam: array of Variant);
  end;




var
  FrmEntDadosPorGrupoMT: TFrmEntDadosPorGrupoMT;

implementation

uses FCadBlqEntDadosMT;

{$R *.DFM}

procedure TFrmEntDadosPorGrupoMT.btBuscGrupoClick(Sender: TObject);
Var
  IDGrupoOrcamen : Integer;
begin
  inherited;
  msGrupo.Executar;

  //VANDER - SOL 172385/10082 - Kintana - 1690505
  if msGrupo.RetornouValor then
  begin
     Try
       IDGrupoOrcamen := StrToIntDef(msGrupo.ValoresChave[0],0);

       //VANDER - SOL 172385/10082 - Kintana - 1690505
       TCtrlGrupoOrcamen.ValidaAcesso(Padroes, Sistema.IdUsuario, IDGrupoOrcamen);

       edtDescGrupo.Text := msGrupo.ValoresChave[2] + '-' + msGrupo.ValoresChave[1];

    //VANDER - SOL 172385/10082 - Kintana - 1690505 - comentado
    {qryAcesso.close;  //Henrique Massão - SOL 61185 KTN 523479
    qryAcesso.ParamByName('idusuario').AsInteger := Sistema.IdUsuario;
    qryAcesso.ParamByName('idgrupo').AsString  := msGrupo.ValoresChave[0] ;
    qryAcesso.open;
    if qryAcesso.isEmpty then
      begin
        MsgDlg('Usuário sem permissão para este Grupo Orçamentário.', 'Erro',mtError,[mbOk],0);
        edtDescGrupo.text :='';
      end
    Else
    begin
      edtDescGrupo.Text := msGrupo.ValoresChave[2] + '-' + msGrupo.ValoresChave[1];
    }//VANDER - SOL 172385/10082 - Kintana - 1690505 - comentado

      // Edilaine - SOL 172383-7763 / KTN 1557030
      cdsPlanoOrc.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( msGrupo.ValoresChave[2] );
      cboPlanoOrc.LookupValue := msGrupo.ValoresChave[3];
      if cdsPlanoOrc.FieldByName('ANO').AsString <> '' then
         edtExercicio.Text := cdsPlanoOrc.FieldByName('ANO').AsString;
      edtFornDesp.text := '';
      // Edilaine - SOL 172383-7763 / KTN 1557030 - fim

       //VANDER - SOL 172385/10082 - Kintana - 1690505
       cdsCCusto.Data := CtrlTransacoesPorGrupo.ListaCentroCusto(Sistema.IdUsuario, IDGrupoOrcamen);
     Except
       On ErroAcesso : EGrupoOrcamen_Acesso do
       Begin
         edtDescGrupo.Text := '';
         MsgDlg(ErroAcesso.Message, 'Erro',mtError,[mbOk],0);
       End;

       On E : Exception do RAISE;
     End;
  end;
end;

procedure TFrmEntDadosPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(Padroes);
  CtrlPlanPrevContabil    := TCtrlPlanPrevContabil.Create;
  CtrlPlanPrevContabil.InitializeAs(Padroes);
  CtrlPatro               := TCtrlPatro.Create;
  CtrlPatro.InitializeAs(Padroes);

  CtrlBlqEntDados := TCtrlBlqEntDados.Create;
  CtrlBlqEntDados.InitializeAs(Padroes);

  CtrlTransacoesPorGrupo.Progresso := Progresso;

  Cds.Data          := CtrlTransacoesPorGrupo.ListaContasEntDados(-1,-1,-1,-1,-1,-1,-1);

  CdsPlano.Data     := CtrlTransacoesPorGrupo.ListaPlano;
  CdsPatro.Data     := CtrlTransacoesPorGrupo.ListaPatro;

  //Ricardo SOL 159248 KTN 1337823
  cdsPrograma.Data     := CtrlTransacoesPorGrupo.ListaPrograma;
  cdsTipoDespesa.Data  := CtrlTransacoesPorGrupo.ListaTipoDespesa;
  //Ricardo SOL 159248 KTN 1337823 - fim

  //Ricardo Freitas SOL 166069 KTN 1468025
  cdsAtividadeProj.Data := CtrlTransacoesPorGrupo.ListaAtividadeProj;

  // Arnaldo V. Scarin - Pendencia 27744 - 19/06/2008
  CdsPlanoTrab.Data := CtrlTransacoesPorGrupo.ListaPlanoTrab(Sistema.IdUsuario, Sistema.IdEmpresa, Date);
  CdsRatCriter.Data := CtrlTransacoesPorGrupo.ListaReservaRatCriter(Sistema.IdEmpresa);


  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
  cdsPlanoOrc.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento('-1');
  cdsCCusto.Data   := CtrlTransacoesPorGrupo.ListaCentroCusto;

  { comentado o trecho abaixo
    // Alterado por FHBS - SOL: 150137 KTN: 1087555
    // Alterei o filtro de G.IDPLANOORCAMEN para C.IDPLANOORCAMEN
    msGrupo.Filtro.Add('C.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
    MontaSelect.Filtro.Add('C.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
    // Fim - Alterado por FHBS - SOL: 150137 KTN: 1087555
  }
  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - fim

  cboPeriodo.ItemIndex := 0;
  edtExercicio.Text    := FormatDateTime('yyyy',date);

  // Edilaine - SOL 172383-7763 / KTN 1557030 - comentada a linha abaixo
  //Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(0,0,0,0,0,0,0);

end;

procedure TFrmEntDadosPorGrupoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlPlanPrevContabil);
  FreeAndNil(CtrlPatro);
  FreeAndNil(CtrlTransacoesPorGrupo);
  FreeAndNil(CtrlBlqEntDados);
  inherited;
end;

procedure TFrmEntDadosPorGrupoMT.btSelContasClick(Sender: TObject);
var
   iUnidNegoc,iIdPlano,iIdPatro: integer;
   iIdPlanoOrc, iIdSubDespesa  : integer;  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
   //Ricardo SOL 159248 KTN 1337823
   iIdPrograma,iIdTIpoDespesa:integer;
   sCodCentRespon, sFiltro: string;
   sCodCCusto : string;   // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
begin
  inherited;

  Cds.Filtered := false;

  if not CtrlBlqEntDados.TestaEntDadosBlq(Sistema.IdUsuario,Sistema.IdEmpresa,cboPeriodo.ItemIndex,Trunc(edtExercicio.Value)) then
  begin
     MsgDlg(CtrlBlqEntDados.MessageInfo,'Aviso',mtWarning,[mbOk],0);
     Exit;
  end;

  case CmeCadastro.Operacao of
     opInserir: begin
                   if Trim(edtDescGrupo.Text) = '' then
                   begin
                      MsgDlg('Informe um grupo de contas orçamentárias!','Aviso',mtWarning,[mbOK],0);
                      Exit;
                   end;

                   // Alterado por FHBS - SOL: 148185 KTN: 1037408
                   //if Trim(cboPlanoTrab.Text) = '' then
                   //begin
                   //   MsgDlg('Informe um plano de trabalho!','Aviso',mtWarning,[mbOK],0);
                   //   Exit;
                   //end;

                   // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - comentado
                   // exclusão plano de trablho e apenas grupo orcam obrigatorio
                   {
                   if StrToIntDef(edtExercicio.Text,0) = 0 then
                   begin
                      MsgDlg('Informe o exercício!','Aviso',mtWarning,[mbOk],0);
                      Exit;
                   end;

                   if (Trim(cboPlanoTrab.Text) <> '') and // Alterado por FHBS - SOL: 148185 KTN: 1037408
                      not CtrlTransacoesPorGrupo.ValidaPlanoTrab(CdsPlanoTrab.FieldByName('IDPLANOTRABALHO').AsInteger,
                                                                 Trunc(edtExercicio.Value)) then
                   begin
                      MsgDlg(CtrlTransacoesPorGrupo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
                      Exit;
                   end;

                   if Trim(cboPlanoTrab.Text) <> '' then
                   begin
                      iUnidNegoc     := CdsPlanoTrab.FieldByName('UNIDNEGOC').AsInteger;
                      sCodCentRespon := CdsPlanoTrab.FieldByName('CODCENTRORESPON').AsString;
                   end
                   else
                   begin
                      iUnidNegoc     := 0;
                      sCodCentRespon := '';
                   end;

                   if Trim(cboPlano.Text) <> '' then
                      iIdPlano := StrToInt(cboPlano.LookupValue)
                   else
                      iIdPlano := -1;
                   }
                   // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - fim comentado

                   // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
                   iUnidNegoc     := 0;
                   sCodCentRespon := '';
                   iIdPlano       := -1;
                   iIdPatro       := -1;
                   sCodCCusto     := '';
                   iIdSubDespesa  := -1;

                   if Trim(cboPlano.Text) <> '' then
                      iIdPlano := StrToInt(cboPlano.LookupValue);

                   if cboPlanoOrc.Text <> '' then
                      iIdPlanoOrc := StrToInt(cboPlanoOrc.LookupValue);

                   if cboCCusto.Text <> '' then
                      sCodCCusto := cboCCusto.LookupValue;

                   if edtFornDesp.Text <> '' then
                      iIdSubDespesa := StrToInt(msDespesa.ValoresChave[0]);

                   // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - fim


                   if Trim(cboPatro.Text) <> '' then
                      iIdPatro := StrToInt(cboPatro.LookupValue)
                   else
                      iIdPatro := -1;

                   if (iIdPlano <> -1) and (iIdPatro <> -1) then
                     if not CtrlPlanPrevContabPatro.ValidaPlanoPatro (iIdPatro, iIdPlano) then begin
                       MsgDlg (CtrlPlanPrevContabPatro.MessageInfo, 'Relacionamento Inválido', mtWarning, [mbok], 0);
                       exit;
                     end;

                    //Ricardo SOL 159248 KTN 1337823
                    if Trim(cboPrograma.Text) <> '' then
                      iIdPrograma := StrToInt(cboPrograma.LookupValue)
                    else
                      iIdPrograma := -1;

                    if Trim(cboTipoDespesa.Text) <> '' then
                      iIdTIpoDespesa := StrToInt(cboTipoDespesa.LookupValue)
                    else
                      iIdTIpoDespesa := -1;
                    //Ricardo SOL 159248 KTN 1337823

                    //Ricardo Freitas SOL 166069 KTN 1468025
                    if (TRIM(cboAtividadeProjeto.Text) <> '')  then
                       iUnidNegoc  := cdsAtividadeProj.Fieldbyname('UNIDNEGOC').Asinteger
                    else
                       iUnidNegoc := 0; //-1 é atividade de projeto "Padrão"
                    //Ricardo Freitas SOL 166069 KTN 1468025 - fim

                    Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados((cboPeriodo.ItemIndex),
                                                                           Trunc(edtExercicio.Value),
                                                                           Sistema.IdEmpresa,
                                                                           iIdPlanoOrc, {Modulo.iPlanoOrc}  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - comentei
                                                                           StrToInt(msGrupo.ValoresChave[0]),
                                                                           Sistema.IdUsuario,
                                                                           iUnidNegoc,
                                                                           sCodCentRespon,
                                                                           iIdPlano,
                                                                           iIdPatro,
                                                                           //Ricardo SOL 159248 KTN 1337823
                                                                           iIdPrograma,
                                                                           iIdTIpoDespesa,
                                                                           //Ricardo SOL 159248 KTN 1337823 - fim
                                                                           // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
                                                                           iIdSubDespesa,
                                                                           sCodCCusto,
                                                                           CmeCadastro.Operacao,
                                                                           // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - fim
                                                                           False,
                                                                           True); // Alterado por FHBS - SOL: 151660 KTN: 1115295

//                   try
//                      Cds.DisableControls;
//                      while not Cds.Eof do
//                      begin
//                         if ((Cds.FieldByName('VLRORCADO').AsFloat <> 0) and (cboPeriodo.ItemIndex = 0)) then
//                         begin
//                            MsgDlg('Já foram feitas dotações neste exercício para este grupo orçamentário, logo, ' +
//                                   'não será possível efetuar a opção "Anual". Para que tal operação possa ser ' +
//                                   'realizada é necessário selecionar período a período.','Aviso',mtWarning,[mbOk],0);
//                            Cds.EmptyDataSet;
//                            Break;
//                         end;
//                         Cds.Next;
//                      end;
//
//                   finally
//                      Cds.EnableControls;
//                   end;

                end;

   opAlterar: begin
                  if (Cds.RecordCount = 0) then
                     Exit;

                  if Trim(cboPatro.Text) <> '' then
                     sFiltro := 'IDPATRO = ' + cboPatro.LookupValue;

                  if Trim(cboPlano.Text) <> '' then
                  begin
                     if sFiltro <> '' then
                        sFiltro := sFiltro + ' AND IDPLANOPREV = ' + cboplano.LookupValue
                     else
                        sFiltro := 'IDPLANOPREV = ' + cboplano.LookupValue;
                  end;

                  if cboPeriodo.ItemIndex <> 0 then
                  begin
                      if Trim(sFiltro) <> '' then
                         sFiltro := sFiltro + ' AND PERIODO = ' + IntToStr(cboPeriodo.ItemIndex)
                      else
                         sFiltro := ' PERIODO = ' + IntToStr(cboPeriodo.ItemIndex);
                  end;

                  Cds.Filter   := sFiltro;
                  Cds.Filtered := (sFiltro <> '');
              end;
  end;
end;

procedure TFrmEntDadosPorGrupoMT.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;

   // Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
     if not(Highlight) then
     begin
       if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
       begin
         ABrush.color := clwhite
       end
       else
       begin
         ABrush.Color := $00C0FFFF; //Amarelo Bebê
       end;

       // Para as contas com dotação já efetuada, pintar a linha de vermelho
       if ((Cds.RecordCount <> 0) and
//           (Cds.FieldByName('VALIDAR').AsString = 'N') ) then // SOL 210712 KINTANA 2029487
           (Cds.FieldByName('LANC_NEW').AsString = 'N')
           and (CmeCadastro.Operacao in [opInserir]) //Marcio Sanches Spinosa SOL 241969 PPM 564261
           ) then  // SOL 210712 KINTANA 2029487
          ABrush.Color := $00594DF9;

       // Para as contas com dotação já efetuada, pintar a linha de vermelho
       if ((Cds.RecordCount <> 0) and
           //(Cds.FieldByName('VALIDAR').AsString = 'N') ) then // SOL 210712 KINTANA 2029487
           ((Cds.FieldByName('VLRTRANSF').AsFloat > 0) OR (Cds.FieldByName('VLRAJUSTE').AsFloat > 0)) and
           not(CmeCadastro.Operacao in [opInserir])
           ) then  // SOL 210712 KINTANA 2029487
          ABrush.Color := $00594DF9;


       // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
       // Para as contas com valores > 0, pintar a linha de azul 
       if (Cds.RecordCount <> 0) and (Cds.FieldByName('VLRORCADO').Asfloat <> 0) then  // Edilaine - SOL 187127 / KTN 1761657
          ABrush.Color := $00E4D2C2;
       // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - fim

     end;
   end
   else
   begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
   end;
end;

procedure TFrmEntDadosPorGrupoMT.GridTopRowChanged(Sender: TObject);
begin
  inherited;
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TFrmEntDadosPorGrupoMT.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(CDs.FieldByName('VALOR')).DisplayFormat        := '#,##0.00;-#,##0.00';
  TFloatField(CDs.FieldByName('VLRORCADO')).DisplayFormat    := '#,##0.00;-#,##0.00';
  TFloatField(CDs.FieldByName('VLRORCADO')).ReadOnly         := True;
  TStringField(CDs.FieldByName('IDCONTAORCAMEN')).ReadOnly   := True;
  TIntegerField(CDs.FieldByName('PERIODO')).ReadOnly         := True;
  TIntegerField(CDs.FieldByName('EXERCICIO')).ReadOnly       := True;
  TStringField(CDs.FieldByName('CENTRORESPON')).ReadOnly     := True;
  TStringField(CDs.FieldByName('CENTROCUSTO')).ReadOnly      := True;
  TStringField(CDs.FieldByName('PLANO')).ReadOnly            := True;
  TStringField(CDs.FieldByName('PATRO')).ReadOnly            := True;
  TStringField(CDs.FieldByName('ATIVPROJ')).ReadOnly         := True;

  if Cds.IsEmpty then
     pnlTotalContas.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' relacionamento(s)'
  else
     pnlTotalContas.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' relacionamento(s) para o grupo ' + Cds.FieldByName('CODGRUPOORC').AsString + ' - ' + Cds.FieldByName('NOMEGRUPOORCAMEN').AsString;

end;

procedure TFrmEntDadosPorGrupoMT.GridRowChanged(Sender: TObject);
begin
  inherited;
  // Controle para evitar que o usuário fique inserindo registro no grid
  //if ((Cds.FieldByName('VALIDAR').AsString = 'S') and (CmeCadastro.Operacao in [opInserir,opAlterar])) then  //  SOL 210712 KINTANA 2029487
  if (CmeCadastro.Operacao in [opInserir]) then
  begin
       if ((Cds.FieldByName('LANC_NEW').AsString = 'S') ) then // SOL 210712 KINTANA 2029487
          TFloatField(CDs.FieldByName('VALOR')).ReadOnly  := False
       else
          TFloatField(CDs.FieldByName('VALOR')).ReadOnly  := True;
  end
  else
  begin
       if (((Cds.FieldByName('VLRTRANSF').AsFloat > 0) OR (Cds.FieldByName('VLRAJUSTE').AsFloat > 0)) ) then // SOL 210712 KINTANA 2029487
           TFloatField(CDs.FieldByName('VALOR')).ReadOnly  := True
       else
           TFloatField(CDs.FieldByName('VALOR')).ReadOnly  := False;
  end;

  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
  if (Not Cds.IsEmpty) and (CDs.FieldByName('VLRORCADO').AsFloat > 0) then
     TStringField(CDs.FieldByName('SELECIONADO')).ReadOnly := false
  else
     TStringField(CDs.FieldByName('SELECIONADO')).ReadOnly := true;
  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - fim
end;

procedure TFrmEntDadosPorGrupoMT.GridExit(Sender: TObject);
begin
  inherited;
  case Cds.State of
     dsInsert: Cds.Cancel;
     dsEdit  : Cds.Post;
  end;
end;

procedure TFrmEntDadosPorGrupoMT.GridUpdateFooter(Sender: TObject);
var
   CdsAux: TClientDataSet;
   rVlrTotal,rVlrOrc: double;
   sFiltro: string;
begin
  inherited;
  try
    sFiltro         := Cds.Filter;
    if Trim(sFiltro) <> '' then
       sFiltro := sFiltro + ' AND VALIDAR = ''S'''
    else
       sFiltro := ' VALIDAR = ''S''';

    CdsAux          := TClientDataSet.Create(nil);
    CdsAux.Data     := Cds.Data;
    CdsAux.Filter   := sFiltro;
    CdsAux.Filtered := True;
    rVlrTotal       := 0;
    rVlrOrc         := 0;

    // Soma o valor de transação
    while not CdsAux.Eof do
    begin
       rVlrTotal := rVlrTotal + CdsAux.FieldByName('VALOR').AsFloat;
       CdsAux.Next;
    end;
    Grid.ColumnByName('VALOR').FooterValue := FormatFloat('#,##0.00;-#,##0.00',rVlrTotal);

    // Soma o valor já efetuado
    CdsAux.Filtered := False;
    CdsAux.First;
    while not CdsAux.Eof do
    begin
       rVlrOrc := rVlrOrc + CdsAux.FieldByName('VLRORCADO').AsFloat;
       CdsAux.Next;
    end;
    Grid.ColumnByName('VLRORCADO').FooterValue := FormatFloat('#,##0.00;-#,##0.00',rVlrOrc);

  finally
     FreeAndNil(CdsAux);
  end;
end;

procedure TFrmEntDadosPorGrupoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
var
  iIdPlanoOrc, iIdDespesa : integer;  // Edilaine - SOL 172383-7763 / KTN 1557030
begin
  inherited;

  // Edilaine - SOL 172383-7763 / KTN 1557030
  iIdDespesa  := -1;
  iIdPlanoOrc := -1;

  if edtFornDesp.text <> '' then
     iIdDespesa := StrToInt(msDespesa.ValoresChave[0]);

  if cboPlanoOrc.Text <> '' then
     iIdPlanoOrc := StrToInt(cboPlanoOrc.LookupValue);
  // Edilaine - SOL 172383-7763 / KTN 1557030 - fim

  Accept := CtrlTransacoesPorGrupo.CriaSaldoContas(Cds.Data,
                                                   cboPeriodo.ItemIndex, Sistema.IdEmpresa,
                                                   chkSobrescreve.Checked,
                                                   iIdDespesa, true); // Edilaine - SOL 172383-7763 / KTN 1557030

  if not Accept then
     MsgDlg('Não foi possível inserir dotações orçamentárias para as contas' + #13 +
            'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0)
  else
  begin
     // Edilaine - SOL 193936 / KTN 1852777 - passagem dos parametros de rParamsEnt para busca pós-inclusão
     Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(cboPeriodo.ItemIndex,              //iPeriodo
                                                            Trunc(edtExercicio.Value),         //iExercicio
                                                            Sistema.IdEmpresa,                 //idEmpresa
                                                            iIdPlanoOrc, {Modulo.iPlanoOrc}  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - comentei
                                                            StrToInt(msGrupo.ValoresChave[0]), //iIdGrupoOrc
                                                            Sistema.IdUsuario,                 //iIdUsuario
                                                            //Ricardo de Freitas SOL 154956 KINTANA  1193268
                                                            //-1,                              //iUnidNegoc
                                                            //Ricardo de Freitas SOL 154956 KINTANA  1193268
                                                            rParamsEnt.iUnidNegoc,             //iUnidNegoc
                                                            rParamsEnt.sCodCentRespon,         //sCodCentroRespon
                                                            rParamsEnt.iIdPlano,               //iIdPlanoPrev
                                                            rParamsEnt.iIdPatro,               //iIdPatro
                                                            //Ricardo SOL 159248 KTN 1337823
                                                            rParamsEnt.iIdPrograma,            //iIdPrograma
                                                            rParamsEnt.iIdTIpoDespesa,         //iIdTipoDespesa
                                                            //Ricardo SOL 159248 KTN 1337823 - fim
                                                            // Edilaine - SOL 172383-7763 / KTN 1557030
                                                            iIdDespesa,  // Edilaine - SOL 193936 / KTN 1852777                              // iIdSubDespesa
                                                            rParamsEnt.sCodCCusto,            // sCodCentroCusto
                                                            CmeCadastro.Operacao,
                                                            // Edilaine - SOL 172383-7763 / KTN 1557030 - fim
                                                            True);                             //bProcura
     // Edilaine - SOL 193936 / KTN 1852777 - fim

     LimpaFiltrosTela(False);
  end;
end;

procedure TFrmEntDadosPorGrupoMT.CmeCadastroFind(Sender: TObject);
var
  iPeriodo: integer;
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin
     edtExercicio.Value      := StrToInt(MontaSelect.ValoresChave[2]);
     cboPeriodo.ItemIndex    := StrToInt(MontaSelect.ValoresChave[1]);
     edtDescGrupo.Text       := MontaSelect.ValoresChave[3]+'-'+MontaSelect.ValoresChave[4];

     // Edilaine - SOL 172383-7763 / KTN 1557030
     cdsPlanoOrc.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( MontaSelect.ValoresChave[3] );
     cboPlanoOrc.LookupValue := MontaSelect.ValoresChave[5];
     edtFornDesp.text := CtrlTransacoesPorGrupo.GetFornecedorSubDespesa( StrToInt(MontaSelect.ValoresChave[6]) );
     // Edilaine - SOL 172383-7763 / KTN 1557030 - fim

     //VANDER - SOL 172385/10082 - Kintana - 1690505
     cdsCCusto.Data := CtrlTransacoesPorGrupo.ListaCentroCusto(Sistema.IdUsuario, StrToIntDef(MontaSelect.ValoresChave[0],0));


     Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(StrToInt(MontaSelect.ValoresChave[1]),
                                                             StrToInt(MontaSelect.ValoresChave[2]),
                                                             Sistema.IdEmpresa,
                                                             StrToInt(MontaSelect.ValoresChave[5]), {Modulo.iPlanoOrc}  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
                                                             StrToInt(MontaSelect.ValoresChave[0]),
                                                             Sistema.IdUsuario,
                                                             0, //Ricardo SOL 159248 KTN 1337823
                                                             '',
                                                             -1,
                                                             -1,
                                                             //Ricardo SOL 159248 KTN 1337823
                                                             -1,
                                                             -1,
                                                             //Ricardo SOL 159248 KTN 1337823
                                                            // Edilaine - SOL 172383-7763 / KTN 1557030
                                                            StrToInt(MontaSelect.ValoresChave[6]),
                                                            '',
                                                            CmeCadastro.Operacao,
                                                            // Edilaine - SOL 172383-7763 / KTN 1557030 - fim
                                                             True);

     sbtnApagar.enabled := (not cds.IsEmpty); // Edilaine - SOL 172383-7763 / KTN 1557030 - fim
  end;
end;

procedure TFrmEntDadosPorGrupoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTransacoesPorGrupo.DeletaSaldos(Cds.Data, Sistema.IdEmpresa);

  if not Accept then
     MsgDlg('Houve um erro ao tentar excluir as dotações efetuadas. ' + #13 +
            'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0)
  else
     Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(-1,-1,-1,-1,-1,-1,-1);

  LimpaFiltrosTela;
end;

procedure TFrmEntDadosPorGrupoMT.btCalcularRatClick(Sender: TObject);
var
  sValor: string;
  //Ricardo SOL 159248 KTN 1337823
  sPrograma,sTipoDespesa:string;
  //Ricardo Freitas SOL 166069 KTN 1468025
  sAtividadeProj:string;
begin
  inherited;

  sAtividadeProj := '';

  //Ricardo SOL 122291 KINTANA 597829
  if (edtVlrRateio.Value = 0) then
  begin
     Application.MessageBox('Favor informar o valor total de rateio.','Atenção',48);
     Exit;
  end;


  if CmeCadastro.Operacao in [opInserir, opAlterar] then
  begin
    // Força a habilitação do campo para a escrita
    TFloatField(CDs.FieldByName('VALOR')).ReadOnly := False;


    //Ricardo SOL 159248 KTN 1337823
    if (TRIM(cboPrograma.Text) <> '')  then
       sPrograma     := cdsPrograma.Fieldbyname('IDPROGRAMAORCAMEN').AsString
    else
       sPrograma     := '';

    if (TRIM(cboTipoDespesa.Text) <> '')  then
       sTipoDespesa  := cdsTipoDespesa.Fieldbyname('IDTIPO_DEPESAORCAMEN').AsString
    else
       sTipoDespesa  := '';
    //Ricardo SOL 159248 KTN 1337823 - fim

    //Ricardo Freitas SOL 166069 KTN 1468025
    if (TRIM(cboAtividadeProjeto.Text) <> '')  then
       sAtividadeProj  := cdsAtividadeProj.Fieldbyname('UNIDNEGOC').AsString
    else
       sAtividadeProj  := '';

    if not CtrlTransacoesPorGrupo.CalcularRateio(Cds,
                                                 StrToIntDef(cboRatCriter.LookupValue,-1),
                                                 Sistema.IdEmpresa,
                                                 edtVlrRateio.Value,
                                                 cboRatCriter.Text,
                                                 StrToIntDef(cboPlano.LookupValue,-1),
                                                 StrToIntDef(cboPatro.LookupValue,-1),
                                                 //CdsPlanoTrab.FieldByName('UNIDNEGOC').AsString,
                                                 //Ricardo Freitas SOL 166069 KTN 1468025
                                                  sAtividadeProj,
                                                 CdsPlanoTrab.FieldByName('CODCENTRORESPON').AsString,
                                                 //Ricardo SOL 159248 KTN 1337823
                                                 sPrograma, //Programa
                                                 sTipoDespesa, //Tipo de Despesa
                                                 //Ricardo SOL 159248 KTN 1337823 - fim 
                                                 True,
                                                 cboPeriodo.ItemIndex,
                                                 StrToIntDef(edtExercicio.Text, 0)) then
       MsgDlg('Não foi possível efetuar o rateio. ' + #13 +
              'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0)
    else
    begin
      // É necessário fazer isto somente para
      //atualizar o valor totalizador do grid
      Cds.Edit;
      Cds.Post;

// Alterado por FHBS - SOL: 150140 KTN: 1087554 - Agora o arredondamento é feito no rateio.
//      // Ajusta os centavos divergentes devido ao rateio
//      if Grid.ColumnByName('VALOR').FooterValue <> edtVlrRateio.Text then
//      begin
//         sValor := StringReplace(Grid.ColumnByName('VALOR').FooterValue,'.','',[rfReplaceAll]);
//         Cds.Filter   := 'VALIDAR = ''S''';
//         Cds.Filtered := True;
//         Cds.Edit;
//         Cds.FieldByName('VALOR').AsFloat := (Cds.FieldByName('VALOR').AsFloat + (edtVlrRateio.Value - StrToFloat(sValor)));
//         Cds.Post;
//         Cds.Filtered := False;
//      end;
    end;
  end;
  
end;

procedure TFrmEntDadosPorGrupoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var
  rParams : tParametros;   // Edilaine - SOL 172383-7763 / KTN 1557030
begin
  inherited;
  Accept := not (Cds.IsEmpty);
  if not Accept then
     MsgDlg('Não há nenhum grupo orçamentário selecionado!','Aviso',mtWarning,[mbOk],0);

  // Edilaine - SOL 172383-7763 / KTN 1557030
  if CmeCadastro.Operacao = opInserir then
  begin
    CarregaFiltros();    // Edilaine - SOL 193936 / KTN 1852777

    // Edilaine - SOL 193936 / KTN 1852777 - comentado
    {
    rParams.iIdPlanoOrc    := StrToInt(cboPlanoOrc.LookupValue);
    rParams.iExercicio     := Trunc(edtExercicio.Value);
    rParams.iPeriodo       := cboPeriodo.ItemIndex;
    rParams.iUnidNegoc     := 0;
    rParams.sCodCentRespon := '';
    rParams.iIdPlano       := -1;
    rParams.iIdPatro       := -1;
    rParams.sCodCCusto     := '';
    rParams.iIdSubDespesa  := -1;
    rParams.iIdPrograma    := -1;
    rParams.iIdTIpoDespesa := -1;

    if Trim(cboPlano.Text) <> '' then
       rParams.iIdPlano := StrToInt(cboPlano.LookupValue);

    if cboCCusto.Text <> '' then
       rParams.sCodCCusto := cboCCusto.LookupValue;

    if edtFornDesp.Text <> '' then
       rParams.iIdSubDespesa := StrToInt(msDespesa.ValoresChave[0]);

    if Trim(cboPatro.Text) <> '' then
       rParams.iIdPatro := StrToInt(cboPatro.LookupValue);

    if Trim(cboPrograma.Text) <> '' then
       rParams.iIdPrograma := StrToInt(cboPrograma.LookupValue);

    if Trim(cboTipoDespesa.Text) <> '' then
       rParams.iIdTIpoDespesa := StrToInt(cboTipoDespesa.LookupValue);

    if (TRIM(cboAtividadeProjeto.Text) <> '')  then
       rParams.iUnidNegoc  := cdsAtividadeProj.Fieldbyname('UNIDNEGOC').Asinteger;
    }
    // Edilaine - SOL 193936 / KTN 1852777 - fim

    // testa se sub-despesa selecionada faz parte do grupo orçamentario
    if not CtrlTransacoesPorGrupo.ValidaSubDespesa(StrToInt(msGrupo.ValoresChave[0]), rParamsEnt) then   // Edilaine - SOL 193936 / KTN 1852777
    begin
       MsgDlg(CtrlTransacoesPorGrupo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
       Accept := false;
    end;
  end;
  // Edilaine - SOL 172383-7763 / KTN 1557030

end;

procedure TFrmEntDadosPorGrupoMT.Progresso(vParam: array of Variant);
//  Legenda do FormProgresso
//   vParam[0] :  Progresso Duplo  : Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)
//                Progresso Simples: Tipo da operação (3 = mostra, 4 = anda, 5 = esconde)
//    Acima
//-------------------------------------
//   vParam[1]  :  Mínimo de Registros
//   vParam[2]  :  Total de Registros
//   vParam[3]  :  Registro Atual
//   vParam[4]  :  Legenda

//    Abaixo
//-------------------------------------
//   vParam[5]  :  Mínimo de Registros
//   vParam[6]  :  Total de Registros
//   vParam[7]  :  Registro Atual
//   vParam[8]  :  Legenda

begin

   case vParam[0] of
      // Progresso Duplo
      0: begin
            frmProgressoDuplo.Min  := 0;
            frmProgressoDuplo.Min2 := 0;
            frmProgressoDuplo.Max  := 100;
            frmProgressoDuplo.Max2 := 100;
            frmProgressoDuplo.MostraFormProgressoDuplo(vParam[4],vParam[8],vParam[1],vParam[5],vParam[2],vParam[6],False,False);
         end;
      1: begin
            frmProgressoDuplo.Legenda  := vParam[4];
            frmProgressoDuplo.Legenda2 := vParam[8];
            frmProgressoDuplo.AndaFormProgressoDuplo(vParam[3],vParam[7]);
         end;
      2: begin
            frmProgressoDuplo.EscondeFormProgressoDuplo;
         end;


      // Progresso Simples
      3: begin
            frmProgresso.Min := 0;
            frmProgresso.Max := 100;
            frmProgresso.MostraFormProgresso(vParam[4],False,False,False,vParam[1],vParam[2]);
         end;

      4: begin
            frmProgresso.Legenda := vParam[4];
            frmProgresso.AndaFormProgresso(vParam[3]);
         end;

      5: begin
            frmProgresso.EscondeFormProgresso;
         end;
   end;


   Application.ProcessMessages;
   Repaint;
end;

procedure TFrmEntDadosPorGrupoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(-1,-1,-1,-1,-1,-1,-1);
  LimpaFiltrosTela;
end;

procedure TFrmEntDadosPorGrupoMT.LimpaFiltrosTela(bTudo: Boolean);
begin
   if bTudo then
   begin
     edtDescGrupo.Clear;
     cboPeriodo.ItemIndex := 0;
   end;

   cboPatro.Clear;
   cboPlano.Clear;
   // Edilaine - SOL 172383-7763 / KTN 1557030
   //cboPlanoTrab.Clear;
   cboCCusto.clear;
   cboPlanoOrc.clear;
   edtFornDesp.text := '';
   // Edilaine - SOL 172383-7763 / KTN 1557030 - fim

   cboPrograma.clear;           // Edilaine - SOL 193936 / KTN 1852777
   cboTipoDespesa.Clear;        // Edilaine - SOL 193936 / KTN 1852777
   cboAtividadeProjeto.clear;   // Edilaine - SOL 193936 / KTN 1852777

   cboRatCriter.Clear;
   edtVlrRateio.Value := 0;
   chkSobrescreve.Checked := False;
end;

procedure TFrmEntDadosPorGrupoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
var
  iIdDespesa, iIdGrupoOrc : integer; // Edilaine - SOL 172383-7763 / KTN 1557030
begin
  inherited;
  // Edilaine - SOL 172383-7763 / KTN 1557030
  iIdGrupoOrc := StrToInt(MontaSelect.ValoresChave[0]);
  iIdDespesa  := StrToInt(MontaSelect.ValoresChave[6]);
  Accept := CtrlTransacoesPorGrupo.CriaSaldoContas(Cds.Data,
                                                   cboPeriodo.ItemIndex, Sistema.IdEmpresa,
                                                   chkSobrescreve.Checked,
                                                   iIdDespesa, false); // Edilaine - SOL 172383-7763 / KTN 1557030
  // Edilaine - SOL 172383-7763 / KTN 1557030 - fim

  //Accept := CtrlTransacoesPorGrupo.AlteraSaldos(Cds.Data,Sistema.IdEmpresa); // Edilaine - SOL 172383-7763 / KTN 1557030 - comentado
  if not Accept then
     MsgDlg('Houve um erro ao tentar alterar as dotações efetuadas. ' + #13 +
            'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0)
  else
  begin
     //Ricardo de Freitas SOL 154956 KINTANA  1193268
     //Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(-1,-1,-1,-1,-1,-1,0); // Edilaine - SOL 172383-7763 / KTN 1557030 - comentado

     // Edilaine - SOL 172383-7763 / KTN 1557030
     Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(cboPeriodo.ItemIndex,              //iPeriodo
                                                            Trunc(edtExercicio.Value),         //iExercicio
                                                            Sistema.IdEmpresa,                 //idEmpresa
                                                            StrToInt(cboPlanoOrc.LookupValue), {Modulo.iPlanoOrc}  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - comentei
                                                            iIdGrupoOrc,
                                                            Sistema.IdUsuario,                 //iIdUsuario
                                                            //Ricardo de Freitas SOL 154956 KINTANA  1193268
                                                            //-1,                              //iUnidNegoc
                                                            //Ricardo de Freitas SOL 154956 KINTANA  1193268
                                                            0,                                 //iUnidNegoc
                                                            '',                                //sCodCentroRespon
                                                            -1,                                //iIdPlanoPrev
                                                            -1,                                //iIdPatro
                                                            //Ricardo SOL 159248 KTN 1337823
                                                            -1,                                //iIdPrograma
                                                            -1,                                //iIdTipoDespesa
                                                            //Ricardo SOL 159248 KTN 1337823 - fim
                                                            // Edilaine - SOL 172383-7763 / KTN 1557030
                                                            iIdDespesa,                      // iIdSubDespesa
                                                            '',                              // sCodCentroCusto
                                                            CmeCadastro.Operacao,            // Operacao
                                                            // Edilaine - SOL 172383-7763 / KTN 1557030 - fim
                                                            True);                             //bProcura

  end;

  //LimpaFiltrosTela;  // Edilaine - SOL 172383-7763 / KTN 1557030 - comentado
end;

procedure TFrmEntDadosPorGrupoMT.MontaSelectBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
var
  sSQL,sSQLUnion: TStrings;
  iOrderBy: integer;
  iIndex  : integer;  // Edilaine - SOL 172383-7763 / KTN 1557030
begin
  inherited;
  try

     sSQL      := TStringList.Create;
     sSQLUnion := TStringList.Create;

     sSQL.Text      := sqlText;
     sSQLUnion.Text := sqlText;

     // Edilaine - SOL 172383-7763 / KTN 1557030
     //sSQLUnion.Strings[3]  := 'G.NOMEGRUPOORCAMEN || '' - Anual'' AS C1,';
     //sSQLUnion.Strings[4]  := '0 AS C2,';
     //sSQLUnion.Strings[7]  := '0 AS C5,';

     for iIndex := 0 to sSQLUnion.Count-1 do
     begin
       if Pos('C1,', sSQLUnion.Strings[iIndex]) > 0 then
          sSQLUnion.Strings[iIndex]  := 'G.NOMEGRUPOORCAMEN || '' - Anual'' AS C1,'
       else if Pos('C2,', sSQLUnion.Strings[iIndex]) > 0 then
          sSQLUnion.Strings[iIndex]  := '0 AS C2,'
       else if Pos('C4,', sSQLUnion.Strings[iIndex]) > 0 then
          sSQLUnion.Strings[iIndex]  := ''''' AS C4,'
       //else if Pos('C5,', sSQLUnion.Strings[iIndex]) > 0 then  // Edilaine - SOL 172384-10064 / KTN 1690080 - comentada a linha
       //   sSQLUnion.Strings[iIndex]  := '0 AS C5,'             // Edilaine - SOL 172384-10064 / KTN 1690080 - comentada a linha
       else if Pos('C6,', sSQLUnion.Strings[iIndex]) > 0 then
          sSQLUnion.Strings[iIndex]  := '0 AS C6,'
       else if Pos('C11', sSQLUnion.Strings[iIndex]) > 0 then
          sSQLUnion.Strings[iIndex]  := '-1 AS C11';
     end;
     // Edilaine - SOL 172383-7763 / KTN 1557030 - fim


     iOrderBy := (sSQL.Count - 1);

     sSQL.Strings[iOrderBy] := '';
     sSQLUnion.Strings[iOrderBy] := ' ORDER BY C0 ASC, C3, C2';

     sqlText := sSQL.Text + ' UNION ' + #13#10 + sSQLUnion.Text;

     //Ricardo SOL 167901 KINTANA 1476693
     //Retirar comando LOWER
     sqlText := StringReplace(sqlText,'LOWER','',[rfReplaceAll]);

  finally
     FreeAndNil(sSQL);
     FreeAndNil(sSQLUnion);
  end;
end;

procedure TFrmEntDadosPorGrupoMT.GridTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

procedure TFrmEntDadosPorGrupoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  HabilitaControles(true);  // Edilaine - SOL 172383-7763 / KTN 1557030

  Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(-1,-1,-1,-1,-1,-1,-1);

  LimpaFiltrosTela;

  CmeCadastro.RepetirInsert := False;
end;

procedure TFrmEntDadosPorGrupoMT.edtExercicioClick(Sender: TObject);
begin
  inherited;
  //Marilza Colpani 19/03/2009 N.Sol 110247/N.Kintana 503094
  // Ricardo A. SOL 124422 KTN 631745
  if cboPeriodo.ItemIndex = 0 then
    CdsPlanoTrab.Data := CtrlTransacoesPorGrupo.ListaPlanoTrab(
        Sistema.IdUsuario,
        Sistema.IdEmpresa,
        StrToDate('01/01/' + edtExercicio.Text),
        True
    )  //Marilza
  else
    if cboPeriodo.Text <> '' then
      CdsPlanoTrab.Data := CtrlTransacoesPorGrupo.ListaPlanoTrab(
        Sistema.IdUsuario,
        Sistema.IdEmpresa,
        StrToDate('01/' + cboPeriodo.Value+ '/' +edtExercicio.Text)
      );  //Marilza
end;

procedure TFrmEntDadosPorGrupoMT.btBuscFornecedorClick(Sender: TObject);
begin
  // Edilaine - SOL 172383-7763 / KTN 1557030
  MsDespesa.Filtro.Clear;
  MsDespesa.Filtro.Add('D.IDFORNECEDOR = P.IDPESSOA(+) ');
  if Trim(edtDescGrupo.text) <> '' then
     MsDespesa.Filtro.Add('D.IDGRUPOORCAMEN = '+Quotedstr( msGrupo.ValoresChave[0]) );
  if cboCCusto.LookupValue <> '' then   // listando despesas que tenham o c. custo selecionado
     MsDespesa.Filtro.Add('(D.IDDESPESAORC in (SELECT DC.IDDESPESAORC FROM DESPESAORCXCCUSTO DC WHERE DC.CODCENTROCUSTO = '+QuotedStr(cboCCusto.LookupValue)+') )');

  MsDespesa.Executar;
  Repaint;

  edtFornDesp.text := '';
  If MsDespesa.RetornouValor Then
  begin
    if MsDespesa.ValoresChave[3] <> '' then
       edtFornDesp.text := MsDespesa.ValoresChave[3] + '/';
    edtFornDesp.text := edtFornDesp.text + MsDespesa.ValoresChave[2];

    if not cds.IsEmpty then
       Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(-1,-1,-1,-1,-1,-1,-1);

  end;
 // Edilaine - SOL 172383-7763 / KTN 1557030 - fim
end;

procedure TFrmEntDadosPorGrupoMT.cboCCustoChange(Sender: TObject);
begin
  inherited;
  if edtFornDesp.text <> '' then
     edtFornDesp.text := ''; 
end;


procedure TFrmEntDadosPorGrupoMT.HabilitaControles(bFlgHab : boolean);
begin
  // Edilaine - SOL 172383-7763 / KTN 1557030
  btBuscGrupo.Enabled         := bFlgHab;
  cboPlanoOrc.Enabled         := bFlgHab;
  cboPeriodo.Enabled          := bFlgHab;
  edtExercicio.Enabled        := bFlgHab;
  cboPlano.Enabled            := bFlgHab;
  cboPatro.Enabled            := bFlgHab;
  cboCCusto.Enabled           := bFlgHab;
  cboAtividadeProjeto.Enabled := bFlgHab;
  cboPrograma.Enabled         := bFlgHab;
  cboTipoDespesa.Enabled      := bFlgHab;
  btBuscFornecedor.Enabled    := bFlgHab;
  btSelContas.Enabled         := bFlgHab;
  // Edilaine - SOL 172383-7763 / KTN 1557030 - fim
end;


procedure TFrmEntDadosPorGrupoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  HabilitaControles(false);  // Edilaine - SOL 172383-7763 / KTN 1557030
end;

procedure TFrmEntDadosPorGrupoMT.cboPlanoOrcChange(Sender: TObject);
begin
  // Edilaine - SOL 185017 / KTN 1733391
  if cdsPlanoOrc.FieldByName('ANO').AsString <> '' then
     edtExercicio.Text := cdsPlanoOrc.FieldByName('ANO').AsString;
end;

// Edilaine - SOL 193936 / KTN 1852777
procedure TFrmEntDadosPorGrupoMT.CarregaFiltros;
begin
  rParamsEnt.iIdPlanoOrc    := StrToInt(cboPlanoOrc.LookupValue);
  rParamsEnt.iExercicio     := Trunc(edtExercicio.Value);
  rParamsEnt.iPeriodo       := cboPeriodo.ItemIndex;
  rParamsEnt.iUnidNegoc     := 0;
  rParamsEnt.sCodCentRespon := '';
  rParamsEnt.iIdPlano       := -1;
  rParamsEnt.iIdPatro       := -1;
  rParamsEnt.sCodCCusto     := '';
  rParamsEnt.iIdSubDespesa  := -1;
  rParamsEnt.iIdPrograma    := -1;
  rParamsEnt.iIdTIpoDespesa := -1;

  if Trim(cboPlano.Text) <> '' then
     rParamsEnt.iIdPlano := StrToInt(cboPlano.LookupValue);

  if cboCCusto.Text <> '' then
     rParamsEnt.sCodCCusto := cboCCusto.LookupValue;

  if edtFornDesp.Text <> '' then
     rParamsEnt.iIdSubDespesa := StrToInt(msDespesa.ValoresChave[0]);

  if Trim(cboPatro.Text) <> '' then
     rParamsEnt.iIdPatro := StrToInt(cboPatro.LookupValue);

  if Trim(cboPrograma.Text) <> '' then
     rParamsEnt.iIdPrograma := StrToInt(cboPrograma.LookupValue);

  if Trim(cboTipoDespesa.Text) <> '' then
     rParamsEnt.iIdTIpoDespesa := StrToInt(cboTipoDespesa.LookupValue);

  if (TRIM(cboAtividadeProjeto.Text) <> '')  then
     rParamsEnt.iUnidNegoc  := cdsAtividadeProj.Fieldbyname('UNIDNEGOC').Asinteger;
end;
// Edilaine - SOL 193936 / KTN 1852777 - fim


end.


