unit FCadCorrecoesContratuaisMT;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. Sol......: 218909/16724
PPM.........: 588170
Data........: 19/03/2015
Responsável.: Felipe A. Santos
Descrição...: controle de parcelas para medição.
--------------------------------------------------------------------------------}

// Alterações
// Vinicius - 10/01/2005 - Retirada as opções de Procedimento de Calculo e Abatimento,
//            pois não existe função/utilidade para a previdencia.

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, DBCtrls,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, TREdit, uCmSqlParams,
  uCtrlCorrecoesContratuais, uCtrlServProdxItemContr, uCtrlContratos,
  uCtrlAditamento, uCtrlParamAditamento, uCtrlReferenciaContr, FOrdenaCorrecoesMT,
  uCtrlCtrlParcelaMedicao{ // Felipe A. Santos - SOL218909/16724 PPM 588170 };

const
   WM_EDITAR = WM_User+1;
   WM_EDITARDET = WM_User+2;
   WM_CANCELARDET = WM_User+3;

type
  TLookAditamento = Record
    sNomeLookup  : String;
    sVlrAnterior : String;
end;

type
  TfrmCadCorrecoesContratuaisMT = class(TFrmCadastroMestreDetMT)
    pgcDadosCorrecao: TPageControl;
    tbsDadosIII: TTabSheet;
    dbrgTipoCorrecao: TDBRadioGroup;
    gbFaixa: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    edrFaixaFinal: TDBRealEdit;
    lblValorCorrecao: TLabel;
    dbeVlrCorrecao: TDBRealEdit;
    lblMoedaCorrecao: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    Label2: TLabel;
    dbeNomeContrato: TwwDBEdit;
    cdsSrvProd: TCMClientDataSet;
    spTeste: TCMSqlParams;
    edrFaixaInicial: TDBRealEdit;
    cdsDet: TCMClientDataSet;
    cdsMoeda: TCMClientDataSet;
    sbtnOrdenar: TToolbarButton97;
    cdsAditamento: TCMClientDataSet;
    dsAditamento: TwwDataSource;
    tbsDadosI: TTabSheet;
    dbmObsAditamento: TDBMemo;
    cdsItemContratual: TCMClientDataSet;
    cdsSrvProdAbatido: TCMClientDataSet;
    cdsItemContratualAbatido: TCMClientDataSet;
    Panel1: TPanel;
    Label6: TLabel;
    dbeDescricao: TwwDBEdit;
    Label8: TLabel;
    tbsDadosIV: TTabSheet;
    lblTituloData: TLabel;
    edDataBase: TCMDateTimePicker;
    dbrgFrequencia: TDBRadioGroup;
    Label1: TLabel;
    edrIntervalo: TDBRealEdit;
    cdsObjetoxItemContratual: TCMClientDataSet;
    dsObjetoxItemContratual: TwwDataSource;
    dbeCodAditamentoCorr: TwwDBEdit;
    Label4: TLabel;
    cdsValoresReferencia: TCMClientDataSet;
    rgAbrangencia: TRadioGroup;
    tbsDadosII: TTabSheet;
    rgValorBaseCalculo: TRadioGroup;
    lblReferencia: TLabel;
    dblcReferencia: TwwDBLookupCombo;
    Panel3: TPanel;
    pgcMestre: TPageControl;
    tbsObjetoCalcAtuacao: TTabSheet;
    lblProdutoServ: TLabel;
    lblX: TLabel;
    lblItemContratual: TLabel;
    dbrgAtuacao: TDBRadioGroup;
    dblcServProd: TwwDBLookupCombo;
    dblcItemContratual: TwwDBLookupCombo;
    tbsAbatimento: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    dblcServProdAbatido: TwwDBLookupCombo;
    dblcItemContratualAbatido: TwwDBLookupCombo;
    dbcbPermResMenor: TDBCheckBox;
    dbcbAfetaOutrasCorrecoes: TDBCheckBox;
    Bevel3: TBevel;
    dbrgTipoFaixa: TDBRadioGroup;
    cdsLogAditamento: TCMClientDataSet;
    dblcMoedaProj: TwwDBLookupCombo;
    Label7: TLabel;
    cdsCtrlParcelaMedicao: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbrgTipoCorrecaoClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dblcServProdItemContratoChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dblcServProdContratoAbatidoChange(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure sbtnOrdenarClick(Sender: TObject);
    procedure rgAbrangenciaClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure cdsDetAfterScroll(DataSet: TDataSet);
    procedure rgValorBaseCalculoClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure edDataBaseCloseUp(Sender: TObject);
    procedure dbrgFrequenciaChange(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure pgcDadosCorrecaoDrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure sbtnAltDetClick(Sender: TObject);
  private
    { Private declarations }
    CtrlCorrecoes           : TCtrlCorrecoesContratuais;
    CtrlAditamento          : TCtrlAditamento;
    CtrlParamAditamento     : TCtrlParamAditamento;
    CtrlServProdxItem       : TCtrlServProdxItemContr;
    CtrlContratos           : TCtrlContratos;
    CtrlReferenciaContr     : TCtrlReferenciaContr;
    CtrlCtrlparcelaMedicao  : TCtrlCtrlParcelaMedicao; // Felipe A. Santos - SOL218909/16724 PPM 588170
    iNumCorrecoes           : Integer;
    rOrdem                  : Double;
    bDesAtivando            : Boolean;
    rIDObjetoTodoContr      : Double;
    rIDItemTodoContr        : Double;
    rIDCorrecao             : Double;

    vLookAditamento     : array of TLookAditamento;

    procedure ModoEdicao(var msg: TMessage); message WM_EDITAR;
    procedure ModoEdicaoDet(var msg: TMessage); message WM_EDITARDET;
    procedure CancelarDet(var msg: TMessage); message WM_CANCELARDET;
    procedure CarregaLookAditamento;
    function  EfetuaAditamento: Boolean;
    // Pendência 23289 - Marcos Topini em 13/09/2006
    function  VerificaPreenchimento : boolean;
    // Fim Pendência 23289
  public

    { Public declarations }
  end;

var
  frmCadCorrecoesContratuaisMT: TfrmCadCorrecoesContratuaisMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro, FCadAditamentoMT, uVerificaPreenchimento;

procedure TfrmCadCorrecoesContratuaisMT.FormCreate(Sender: TObject);
begin
   inherited;
   bDesAtivando  := False;
   iNumCorrecoes := 0;
   rOrdem        := 0;

   //Acrescenta filtro ao MontaSelect
   MontaSelect.Filtro.Add('(CONTRATOCONTR.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+') ');
   MontaSelect.Filtro.Add('(CONTRATOCONTR.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                          'WHERE (IDUSUARIO = '+FloatToStr(Sistema.IDUsuario)+')))');
   MontaSelect.Filtro.Add('EXISTS(SELECT OB.IDOBJETO FROM OBJETOSXITEMCONTR OB '+
                                 'WHERE (CONTRATOCONTR.IDCONTRATO = OB.IDCONTRATO))');

   //Inicializa CtrlServProdxItemContr
   CtrlServProdxItem:=TCtrlServProdxItemContr.Create;
   CtrlServProdxItem.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlCorrecoes
   CtrlCorrecoes:=TCtrlCorrecoesContratuais.Create;
   CtrlCorrecoes.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlAditamentos
   CtrlAditamento:=TCtrlAditamento.Create;
   CtrlAditamento.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlAditamentos
   CtrlParamAditamento:=TCtrlParamAditamento.Create;
   CtrlParamAditamento.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlContratos
   CtrlContratos:=TCtrlContratos.Create(Sistema.IdEmpresa, Sistema.IdUsuario);
   CtrlContratos.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlContratos
   CtrlReferenciaContr:=TCtrlReferenciaContr.Create;
   CtrlReferenciaContr.Initialize(dtmBaseDados.dbBaseDados,True);

   // Felipe A. Santos - SOL218909/16724 PPM 588170 - início
   // Inicializa CtrlCtrlParcelaMedicao
   CtrlCtrlparcelaMedicao  := TCtrlCtrlParcelaMedicao.Create;
   CtrlCtrlparcelaMedicao.Initialize(dtmBaseDados.dbBaseDados,True);
   // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim

   //Carrega cds
   cds.Data:=CtrlContratos.ListContratos(-1); //vazio

   //Carrega cdsDet
   cdsDet.Data:=CtrlCorrecoes.ListCorrecoes(-1,-1,False); //vazio

   //Carrega cdsAditamento
   cdsAditamento.Data := CtrlAditamento.ListAditamento(-1,-1); //vazio
   cdsLogAditamento.Data := CtrlAditamento.ListLogAditamento(-1); //vazio

   //Carrega cdsObjetoxItemContratual
   cdsObjetoxItemContratual.Data:=CtrlServProdxItem.ListProdServXItem(-1,0,0,False); //vazio

   // carrega CdsCtrlParcelaMedicao
   cdsCtrlParcelaMedicao.Data := CtrlCtrlParcelaMedicao.ListCtrlParcelaMedicao(-1);

   //Carrega combos de Serviços/Produtos e Itens Contratuais
   cdsSrvProd.Data:=CtrlServProdxItem.ListProdServXItem(-1,0,0,False); //vazio
   cdsSrvProdAbatido.Data:=cdsSrvProd.Data;
   cdsItemContratual.Data:=CtrlCorrecoes.ListItemContratual(-1); //vazio
   cdsItemContratualAbatido.Data:=cdsItemContratual.Data;

   //Carrega combos de Valores de Referência
   cdsValoresReferencia.Data := CtrlReferenciaContr.ListReferenciaContr(0);

   //Carrega cdsMoeda
   cdsMoeda.Data := CtrlCorrecoes.ListMoeda;

   //Associa cds das Ctrls
   CtrlCorrecoes.CdsCorrecaoContr       := cdsDet;
   CtrlCorrecoes.CdsAditamento          := cdsAditamento;
   CtrlCorrecoes.CdsLogAditamento       := cdsLogAditamento;
   CtrlCorrecoes.CdsObjetosxItemContr   := cdsObjetoxItemContratual;
   CtrlCorrecoes.CdsCtrlParcelaMedicao  := cdsCtrlParcelaMedicao;  // Felipe A. Santos - SOL218909/16724 PPM 588170

   //Inicializa Ambiente
   sbtnExcluiDet.Hint         := 'Excluir/Desativar';
   pgcMestre.ActivePageIndex  := 0;
   tbsAbatimento.TabVisible   := False;

   pgcDadosCorrecao.OwnerDraw := True;
end;

procedure TfrmCadCorrecoesContratuaisMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlCorrecoes.Free;
   CtrlAditamento.Free;
   CtrlParamAditamento.Free;
   CtrlServProdxItem.Free;
   CtrlContratos.Free;
   CtrlReferenciaContr.Free;
   CtrlCtrlparcelaMedicao.Free; // Felipe A. Santos - SOL218909/16724 PPM 588170
   inherited;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then begin
       //Carrega cds mestre
       cds.Close;
       cds.Data := CtrlContratos.ListContratos(StrToFloat(MontaSelect.ValoresChave[0]));

       //Carrega cds detalhe
       cdsDet.Filtered := False;
       cdsDet.Close;
       cdsDet.Data := CtrlCorrecoes.ListCorrecoes(StrToFloat(MontaSelect.ValoresChave[0]),
                                                  Sistema.IdEmpresa,False);
       //Carrega cdsObjetoxItemContratual
       cdsObjetoxItemContratual.Filtered := False;
       cdsObjetoxItemContratual.Data := CtrlServProdxItem.ListProdServXItem(StrToFloat(MontaSelect.ValoresChave[0]),0,0,False);

       //Carrega IDObjeto e IDItem para contratos com uma única correção
       CtrlServProdxItem.TestaProdServXItem(StrToFloat(MontaSelect.ValoresChave[0]),
                                            rIDObjetoTodoContr, rIDItemTodoContr);

       //Carrega Combos de Produtos/Serviços
       cdsSrvProd.Data := CtrlCorrecoes.ListServProd(StrToFloat(MontaSelect.ValoresChave[0]));
       cdsSrvProdAbatido.Data := cdsSrvProd.Data;

       //Carrega Combos de Item Contratual
       cdsItemContratual.Data := CtrlCorrecoes.ListItemContratual(StrToFloat(MontaSelect.ValoresChave[0]));
       cdsItemContratualAbatido.Data := cdsItemContratual.Data;

       //Guarda número de correções já cadastradas
       iNumCorrecoes := cdsDet.RecordCount;

       //Gera número de Ordem das Correções
       if cdsDet.IsEmpty then begin
          rOrdem := 1;
       end else begin
          cdsDet.Last;
          rOrdem := cdsDet.FieldByName('ORDEM').AsFloat + 1;
       end;

       //Habilita/Desabilita Abrangência
       rgAbrangencia.Enabled := cdsDet.IsEmpty;

       //Habilita/Desabilita Combos Serv./Prod e Item. Associa Abrangência
       dblcServProd.Clear;
       dblcItemContratual.Clear;
       if CtrlCorrecoes.VerifAbrangTodoContrato(StrToFloat(MontaSelect.ValoresChave[0])) or
          cdsDet.IsEmpty then begin
          rgAbrangencia.ItemIndex     := 0;
          dblcServProd.Enabled        := False;
          dblcItemContratual.Enabled  := False;
          dblcServProdAbatido.Enabled := False;
          dblcItemContratualAbatido.Enabled := False;
          dbcbPermResMenor.Enabled    := False;
          tbsAbatimento.TabVisible    := False;
          lblProdutoServ.Enabled      := False;
          lblX.Enabled                := False;
          lblItemContratual.Enabled   := False;
       end else begin
          rgAbrangencia.ItemIndex     := 1;
          dblcServProd.Enabled        := True;
          dblcItemContratual.Enabled  := True;
          dblcServProdAbatido.Enabled := True;
          dblcItemContratualAbatido.Enabled := True;
          dbcbPermResMenor.Enabled    := True;

          // Vinicius - 10/05/2005 - Desabilitado o Abatimento
          lblProdutoServ.Enabled      := True;
          lblX.Enabled                := True;
          lblItemContratual.Enabled   := True;
       end;

       // Se existir apenas um objetoxitemContratual, mostra o conteúdo,
       // senão mostra em branco
       if (rgAbrangencia.ItemIndex = 1) then begin
          if cdsObjetoxItemContratual.RecordCount = 1 then begin
             dblcServProd.LookupValue       := cdsObjetoxItemContratual.FieldByName('IDOBJETO').AsString;
             dblcItemContratual.LookupValue := cdsObjetoxItemContratual.FieldByName('IDITEM').AsString;
          end else begin
             cdsObjetoxItemContratual.Filter   := '(IDOBJETO = 0) and (IDITEM = 0)';
             cdsObjetoxItemContratual.Filtered := True;
             cdsDet.Filter   := '(IDOBJETO = 0) and (IDITEM = 0)'; //vazio
             cdsDet.Filtered := True;
          end;
       end;

       //Carrega o Hint com o nome completo do Contrato
       dbeNomeContrato.Hint:='('+FloatToStr(Cds.FieldByName('IDCONTRATO').AsFloat)+
                             ') --> '+Cds.FieldByName('NOMECONTRATO').AsString;

       //Prepara Ambiente
       tbcDetalhe.TabIndex              := 0;
       pgcDadosCorrecao.ActivePageIndex := 0;
       rgValorBaseCalculo.ItemIndex     := 0;
    end;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   sbtnOrdenar.Enabled := ( (Trim(dbeNomeContrato.Text)<>'') and
                            (iNumCorrecoes<>0) and
                            (sbtnAlterar.Down) );
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeCadastroConfirma(Sender: TObject);
var bFiltrado: Boolean;
begin
   bFiltrado := cdsDet.Filtered;
   cdsDet.Filtered := False;
   cdsObjetoxItemContratual.Filtered := False;

   if (cdsObjetoxItemContratual.State in [dsEdit]) then cdsObjetoxItemContratual.Post;

   //Corrige Ordem das Correções/Procedimentos
   CtrlCorrecoes.CorrigeOrdem;

   if not(CtrlCorrecoes.AplicaAtualCorrContr) then begin
     MsgDlg(CtrlCorrecoes.MessageInfo,'Erro',mtError,[mbOK],0);
     Abort;
   end else begin
     cdsDet.Close;
     cdsDet.Data:=CtrlCorrecoes.ListCorrecoes(StrToFloat(MontaSelect.ValoresChave[0]),
                                              Sistema.IdEmpresa, False);

     cdsObjetoxItemContratual.Close;
     cdsObjetoxItemContratual.Data:=
               CtrlServProdxItem.ListProdServXItem(StrToFloat(MontaSelect.ValoresChave[0]),0,0,False);
     cdsDet.Filtered := bFiltrado;
     cdsObjetoxItemContratual.Filtered := bFiltrado;

     cdsObjetoxItemContratual.Edit;
     cdsAditamento.EmptyDataSet;
     cdsLogAditamento.EmptyDataSet;

     inherited;
   end;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   cdsObjetoxItemContratual.Cancel;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheInsert(Sender: TObject);
begin

   // Pendência 23289 - Marcos Topini em 13/09/2006
   If not VerificaPreenchimento then exit;
   // Fim Pendência 23289

   inherited;
   //Prepara o form para a nova inclusão
   pgcDadosCorrecao.ActivePageIndex := 0;
   gbFaixa.Enabled := False;
   lblMoedaCorrecao.Enabled := False;
   dblcMoeda.Enabled := False;
   dblcMoedaProj.Enabled := False;
   edDataBase.Date := cdsObjetoxItemContratual.FieldByName('DataBaseItem').AsDateTime;

   cdsDet.FieldByName('IDContrato').AsFloat  := cds.FieldByName('IDContrato').AsFloat;
   cdsDet.FieldByName('DataBase').AsDateTime :=
                                  cdsObjetoxItemContratual.FieldByName('DataBaseItem').AsDateTime;

   if (rgAbrangencia.ItemIndex = 0) then begin
      cdsDet.FieldByName('IDObjeto').AsFloat := rIDObjetoTodoContr;
      cdsDet.FieldByName('IDItem').AsFloat   := rIDItemTodoContr;
   end else begin
      cdsDet.FieldByName('IDObjeto').AsFloat := StrToFloat(dblcServProd.LookupValue);
      cdsDet.FieldByName('IDItem').AsFloat   := StrToFloat(dblcItemContratual.LookupValue);
   end;

   cdsDet.FieldByName('Frequencia').AsString     := 'D';
   cdsDet.FieldByName('TipoCorrecao').AsString   := 'PC';
   cdsDet.FieldByName('FLGAFETACORR').AsString   := 'N';
   cdsDet.FieldByName('FLGFAIXARATACU').AsString := 'N';
   cdsDet.FieldByName('FLGATIVO').AsString       := 'S';
   cdsDet.FieldByName('ORDEM').AsFloat           := rOrdem;

   //Inicializa Descrição de acordo com a abrangência escolhida
   if rgAbrangencia.ItemIndex = 0 then begin
      cdsDet.FieldByName('ABRANGENCIA').AsString := 'C';
      cdsDet.FieldByName('DESCRICAO').AsString   := 'Correção Contratual';
   end else begin
      cdsDet.FieldByName('ABRANGENCIA').AsString := 'I';
   end;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   pgcDadosCorrecao.ActivePageIndex := 0;
   rgValorBaseCalculoClick(nil);
   dbrgFrequenciaChange(nil);
   dbrgTipoCorrecaoClick(nil);

   // Carrega conteudo atual dos lookups e radio groups da correção selecionada
   if cdsDet.FieldByName('IDCORRECAO').AsFloat <> rIDCorrecao then
      CarregaLookAditamento;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheCancel(Sender: TObject);
begin
   cdsAditamento.Cancel;
   cdsLogAditamento.Cancel;
   inherited;
end;


procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheConfirma(Sender: TObject);
var
   bErro : Boolean;
   iPagina : Integer;
   sMensagem: String;
   Componente : TWinControl;
   frmAux : TfrmCadAditamentoMT;
begin
   bErro      := False;
   sMensagem  := '';
   iPagina    := 0;
   Componente := nil;

   if cdsDet.State = dsBrowse then Exit;

   if (tbcDetalhe.TabIndex=0) then begin
       //Componentes da página 1
       iPagina:=0;

       if (Trim(dbeDescricao.Text)='') and not(bErro) then begin
          bErro      := True;
          sMensagem  := 'A Descrição da Correção não pode ser deixada em Branco';
          Componente := dbeDescricao;
       end;

       if (Trim(dbeCodAditamentoCorr.Text)='') and not(bErro) then begin
          bErro      := True;
          sMensagem  := 'O Código de Aditamento da Correção não pode ser deixado em Branco';
          Componente := dbeCodAditamentoCorr;
       end;

       if (Trim(dbmObsAditamento.Lines.Text)='') and not(bErro) then begin
          bErro      := True;
          sMensagem  := 'A Observação de aditamento não pode ser deixada em Branco';
          Componente := dbmObsAditamento;
       end;

       //Componentes da página 2
       if not(bErro) then iPagina := 1;

       if (Trim(dblcReferencia.Text) = '') and (dblcReferencia.Enabled) and
          not(bErro) then begin
          bErro      := True;
          sMensagem  := 'A Referência de Cálculo não pode ser deixada em branco';
          Componente := dblcReferencia;
       end;

       //Componentes da página 3
       if not(bErro) then iPagina := 2;

       if (gbFaixa.Enabled) and ((edrFaixaFinal.Value=0) or
          (edrFaixaFinal.Value<edrFaixaInicial.Value)) and not(bErro) then begin
          bErro      := True;
          sMensagem  := 'O Valor Final da Faixa não pode ser deixado em Branco/Zerado ou '+#10#13+
                        'ser menor que o valor Inicial';
          Componente := edrFaixaFinal;
       end;

       if (dbeVlrCorrecao.Enabled) and (dbeVlrCorrecao.Value=0) and not(bErro) then begin
          bErro      := True;
          sMensagem  := 'O Valor/Percentual de Correção não pode ser deixada em Branco/Zerado';
          Componente := dbeVlrCorrecao;
       end;

       if (dblcMoeda.Enabled) and (Trim(dblcMoeda.Text)='') and not(bErro) then begin
          bErro      := True;
          sMensagem  := 'A Moeda de Correção não pode ser deixada em Branco';
          Componente := dblcMoeda;
       end;

       if (dblcMoeda.Enabled) and (dblcMoedaProj.Enabled) and (Trim(dblcMoedaProj.Text)='') and not(bErro) then begin
          bErro      := True;
          sMensagem  := 'A Moeda de Correção Projetada não pode ser deixada em Branco';
          Componente := dblcMoedaProj;
       end;


       //Componentes da página 4
       if not(bErro) then iPagina := 3;

       if (Trim(edDataBase.Text) = '') and not(bErro) then begin
          bErro      := True;
          sMensagem  := 'A Data Base não pode ser deixada em Branco';
          Componente := edDataBase;
       end;
   end;

   if (tbcDetalhe.TabIndex = 1) then begin
      iPagina := 0;
      //Componentes da página 1 de Abatimentos
      if (Trim(dblcServProdAbatido.Text)<>'') and
         (dblcServProdAbatido.LookupValue=dblcServProd.LookupValue) and
         (Trim(dblcItemContratualAbatido.Text)<>'') and
         (dblcItemContratualAbatido.LookupValue=dblcItemContratual.LookupValue) and not(bErro) then begin
         bErro      := True;
         sMensagem  := '"Serviço/Produto e Item Contratual de abatimento" '+#10#13+
                       'não podem  ser iguais a da correção em questão';
         Componente := dblcServProdAbatido;
      end;
   end;

   //Testa se houve erro
   if bErro then begin
      MsgDlg(sMensagem,'Erro',mtError,[mbOK],0);
      if (tbcDetalhe.TabIndex=0) then pgcDadosCorrecao.ActivePageIndex := iPagina;
      Componente.SetFocus;
      Abort;
   end;

   // Verifica e registra o log de aditamento
   if CdsDet.State in [dsEdit] then begin
      if EfetuaAditamento then begin
         if MsgDlg('Registra um Aditamento para esta alteração ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
            frmAux := TfrmCadAditamentoMT.Create(Self);
            try
               cdsCtrlParcelaMedicao.EmptyDataSet; // Felipe A. Santos SOL 218909/16724 PPM 588170
               frmAux.cdsAditamento.Data := cdsAditamento.Data;
               
               // Felipe A. Santos SOL 218909/16724 PPM 588170 - início

               frmAux.cdsCtrlParcelaMedicao.Data := cdsCtrlParcelaMedicao.Data;
               frmAux.cdsServProdxItemContr.Data  := cdsObjetoxItemContratual.Data;

               // se o item e o objeto estiver selecionado e então filtra o cds que irá inserir na CTRLPARCELAMEDICAO
               // isso para reiniciar a parcela somente daquele objeto e item selecionado.
               if (Trim(dblcServProd.Text)<>'') and (Trim(dblcItemContratual.Text)<>'') then
               begin
                  frmAux.cdsServProdxItemContr.Filtered := False;
                  frmAux.cdsServProdxItemContr.Filter   := '(IDOBJETO = '+dblcServProd.LookupValue+') AND '+
                                                       '(IDITEM = '+dblcItemContratual.LookupValue+')';
                  frmAux.cdsServProdxItemContr.Filtered := True;
               end;
               // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

               frmAux.rIdContrato := CdsDet.FieldByName('IDCONTRATO').AsFloat;
               frmAux.rIdCorrecao := CdsDet.FieldByName('IDCORRECAO').AsFloat;
               frmAux.dData       := Date;
               frmAux.Caption     := 'Aditamento da Correção do Contrato '+dbeNomeContrato.Text;

               if (frmAux.ShowModal = mrOk) then begin
                  cdsAditamento.Data := frmAux.cdsAditamento.Data;
                  
                  // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
                  frmAux.cdsServProdxItemContr.Filtered := False;
                  cdsCtrlParcelaMedicao.Data := frmAux.cdsCtrlParcelaMedicao.Data;
                  cdsObjetoxItemContratual.Data := frmAux.cdsServProdxItemContr.Data;
                  // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim
               end else begin
                  MsgDlg('Operação Cancelada.'+#10#13+'Os dados não foram Gravados.','Atenção',mtWarning,[mbOk],0);
                  Abort;
               end;
            finally
               frmAux.Free;
            end;
         end else begin
            // Apaga os Logs já registrados anteriormente para a mesma correção
            cdsLogAditamento.First;
            while not cdsLogAditamento.Eof do begin
               if cdsLogAditamento.FieldByName('ID_TEMP').AsInteger =
                  cdsDet.FieldByName('IDCORRECAO').AsInteger then begin
                 cdsLogAditamento.Delete;
               end else begin
                 cdsLogAditamento.Next;
               end;
            end;
         end;
      end;
   end;

   if (cdsDet.State in [dsInsert]) and (tbcDetalhe.TabIndex=0) then begin
      Inc(iNumCorrecoes);
      rOrdem := rOrdem + 1;
      rgAbrangencia.Enabled := False;
      inherited;
      //Interrompe o ciclo de inclusões caso seja uma correção de Todo o Contrato
      if (rgAbrangencia.ItemIndex=0) then PostMessage(Handle,WM_CANCELARDET,0,0);
   end else begin
      inherited;
      cdsDetAfterScroll(nil);
   end;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
   inherited;
   if (cdsDet.Active) then edDataBase.Enabled := cdsDet.FieldByName('DATAULTIMACORR').IsNull;

   pnlMestre.Enabled := not(cdsDet.State in [dsInsert,dsEdit]);
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheDelete(Sender: TObject);
var bAlterado : Boolean;
    frmAux : TfrmCadAditamentoMT;
begin
   bAlterado := False;
   if cdsDet.FieldByName('DATAULTIMACORR').IsNull then begin
      inherited;
      Dec(iNumCorrecoes);
      rgAbrangencia.Enabled := (iNumCorrecoes = 0);
   end else begin
      if (cdsDet.FieldByName('FLGATIVO').AsString = 'N') then begin
         bDesAtivando := True;

         // Altera o Flag do registro
         bAlterado := True;
         cdsDet.Edit;
         cdsDet.FieldByName('FLGATIVO').AsString  := 'S';
         cdsDet.FieldByName('DSC_ATIVO').AsString := 'Ativo';
         cdsDet.Post;
      end else begin
         if MsgDlg( 'Esta correção não pode ser Excluída.'+#13#10+
                    'Deseja Desativá-la ?','Atenção', mtWarning, [mbYes, mbNo],0) = mrYes then begin
            bDesAtivando := True;
            // Altera o Flag do registro
            bAlterado := True;
            cdsDet.Edit;
            cdsDet.FieldByName('FLGATIVO').AsString  := 'N';
            cdsDet.FieldByName('DSC_ATIVO').AsString := 'Inativo';
            cdsDet.Post;
         end;
      end;
   end;

   // Registra o Aditamento
   if bAlterado then begin
      if EfetuaAditamento then begin
         if MsgDlg('Registra um Aditamento para esta alteração ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
            frmAux := TfrmCadAditamentoMT.Create(Self);
            try
               frmAux.cdsAditamento.Data := cdsAditamento.Data;
               frmAux.rIdContrato := CdsDet.FieldByName('IDCONTRATO').AsFloat;
               frmAux.rIdCorrecao := CdsDet.FieldByName('IDCORRECAO').AsFloat;
               frmAux.dData       := Date;
               frmAux.Caption     := 'Aditamento da Correção do Contrato '+dbeNomeContrato.Text;

               if (frmAux.ShowModal = mrOk) then begin
                  cdsAditamento.Data := frmAux.cdsAditamento.Data
               end else begin
                  MsgDlg('Operação Cancelada.'+#10#13+'Os dados não foram Gravados.','Atenção',mtWarning,[mbOk],0);
                  Abort;
               end;
            finally
               frmAux.Free;
            end;
         end else begin
            // Apaga os Logs já registrados anteriormente para a mesma correção
            cdsLogAditamento.First;
            while not cdsLogAditamento.Eof do begin
               if cdsLogAditamento.FieldByName('ID_TEMP').AsInteger =
                  cdsDet.FieldByName('IDCORRECAO').AsInteger then begin
                 cdsLogAditamento.Delete;
               end else begin
                 cdsLogAditamento.Next;
               end;
            end;
         end;
      end;
   end;
end;

procedure TfrmCadCorrecoesContratuaisMT.sbtnOrdenarClick(Sender: TObject);
begin
   inherited;
   with TfrmOrdenaCorrecoesMT.Create(Self) do
   try
      cdsDet.Filtered:=False;
      cdsCorrecoes.Data:=cdsDet.Data;
      ShowModal;
      cdsDet.Close;
      cdsDet.Data:=cdsCorrecoes.Data;
      cdsDet.Filtered:=True;
   finally
      Free;
   end;
   sbtnOrdenar.Down:=False;
end;

procedure TfrmCadCorrecoesContratuaisMT.rgAbrangenciaClick(Sender: TObject);
begin
   inherited;
   if rgAbrangencia.ItemIndex = 0 then begin
      dblcServProd.Clear;
      dblcItemContratual.Clear;
   end;
   dblcServProd.Enabled:=(rgAbrangencia.ItemIndex=1);
   dblcItemContratual.Enabled:=(rgAbrangencia.ItemIndex=1);
   dblcServProdAbatido.Enabled:=(rgAbrangencia.ItemIndex=1);
   dblcItemContratualAbatido.Enabled:=(rgAbrangencia.ItemIndex=1);
   dbcbAfetaOutrasCorrecoes.Enabled:=(rgAbrangencia.ItemIndex=1);
   lblProdutoServ.Enabled:=(rgAbrangencia.ItemIndex=1);
   lblX.Enabled:=(rgAbrangencia.ItemIndex=1);
   lblItemContratual.Enabled:=(rgAbrangencia.ItemIndex=1);
   CmeDetalheAtualizaBotoes(nil);
end;

procedure TfrmCadCorrecoesContratuaisMT.dblcServProdItemContratoChange(Sender: TObject);
var
   sIDObjeto : String;
begin
   inherited;
   if not(cds.State in [dsEdit]) then Exit;

   if (cdsObjetoxItemContratual.State in [dsEdit]) then cdsObjetoxItemContratual.Post;

   if (TwwDBLookupCombo(Sender).Name='dblcServProd') then
    begin
       dblcItemContratual.Clear;
       if (Trim(dblcServProd.Text)<>'') then
          sIDObjeto:=dblcServProd.LookupValue
       else
          sIDObjeto:='0';

       if trim(sIDObjeto) <> '' then begin
         cdsItemContratual.Filtered:=False;
         cdsItemContratual.Filter:='(IDOBJETO = '+sIDObjeto+') ';
         cdsItemContratual.Filtered:=True;
       end
    end;

   //Filtra cds detalhe
   cdsDet.Filtered:=False;
   if (Trim(dblcServProd.Text)<>'') and (Trim(dblcItemContratual.Text)<>'') then
       cdsDet.Filter:='(IDOBJETO = '+dblcServProd.LookupValue+') AND '+
                      '(IDITEM = '+dblcItemContratual.LookupValue+')'
   else
       cdsDet.Filter:='(IDOBJETO = 0) and (IDITEM = 0)'; //vazio

   cdsDet.Filtered:=True;

   if (Trim(dblcServProd.Text)<>'') and (Trim(dblcItemContratual.Text)<>'') then begin
      cdsObjetoxItemContratual.Filtered := False;
      cdsObjetoxItemContratual.Filter   := '(IDOBJETO = '+dblcServProd.LookupValue+') AND '+
                                           '(IDITEM = '+dblcItemContratual.LookupValue+')';
      cdsObjetoxItemContratual.Filtered := True;
      cdsObjetoxItemContratual.Edit;

      // Vinicius - 10/01/2005 - Desabilitado o Procedimento de calculo
         dbrgAtuacao.ItemIndex := 0;
         cdsObjetoxItemContratual.FieldByName('ATUACAO').AsString := 'C';
   end;

   dblcServProd.Hint:='';
   if (Trim(dblcServProd.Text)<>'') then
      dblcServProd.Hint:=cdsSrvProd.FieldByName('NOMEOBJETO').AsString;

   dblcItemContratual.Hint:='';
   if (Trim(dblcItemContratual.Text)<>'') then
      dblcItemContratual.Hint:=cdsItemContratual.FieldByName('NOME_ITEM').AsString;

   CmeCadastro.AtualizaBotoes(nil);
   CmeDetalhe.AtualizaBotoes(nil);
end;

procedure TfrmCadCorrecoesContratuaisMT.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   CmeDetalheAtualizaBotoes(nil);
end;

procedure TfrmCadCorrecoesContratuaisMT.rgValorBaseCalculoClick(Sender: TObject);
begin
   lblReferencia.Enabled:=(rgValorBaseCalculo.ItemIndex=1);
   dblcReferencia.Enabled:=(rgValorBaseCalculo.ItemIndex=1);
end;

procedure TfrmCadCorrecoesContratuaisMT.dbrgFrequenciaChange(
  Sender: TObject);
begin
   case dbrgFrequencia.ItemIndex of
      0  : lblTituloData.Caption:='Data Inicial';
      1,2: lblTituloData.Caption:='Data Base/Inicial';
   end;
end;

procedure TfrmCadCorrecoesContratuaisMT.edDataBaseCloseUp(Sender: TObject);
var
   iDia,iMes,iAno: Word;
begin
   if (cdsDet.State in [dsInsert]) then
    begin
       //Impede cadastro de Data Base/Inicial < Data Base do Prod./Serv. x Item Contratual
       if (edDataBase.Date<cdsObjetoxItemContratual.FieldByName('DataBaseItem').AsDateTime) then
        begin
           MsgDlg('A Data Base/Inicial não pode ser menor que: '+
            FormatDateTime('dd/mm/yyyy',
            cdsObjetoxItemContratual.FieldByName('DataBaseItem').AsDateTime),'Erro',mtError,[mbOK],0);
           cdsDet.FieldByName('DATABASE').AsDateTime:=Now;
        end;
    end;
end;

procedure TfrmCadCorrecoesContratuaisMT.dbrgTipoCorrecaoClick(Sender: TObject);
begin
   gbFaixa.Enabled:=((dbrgTipoCorrecao.ItemIndex=2) or (dbrgTipoCorrecao.ItemIndex=3));

   lblMoedaCorrecao.Enabled:=(dbrgTipoCorrecao.ItemIndex=4);
   dblcMoeda.Enabled:=(dbrgTipoCorrecao.ItemIndex=4);
   dblcMoedaProj.Enabled := dblcMoeda.Enabled;

   lblValorCorrecao.Enabled:=not(lblMoedaCorrecao.Enabled);
   dbeVlrCorrecao.Enabled:=not(lblMoedaCorrecao.Enabled);

   case dbrgTipoCorrecao.ItemIndex of
      0,2: lblValorCorrecao.Caption:='Percentual de Correção';
      1,3: lblValorCorrecao.Caption:='Valor de Correção';
   end;

   if (rgAbrangencia.ItemIndex=0) then
    begin
       cdsObjetoxItemContratual.DisableControls;
       try
          if (cdsObjetoxItemContratual.State in [dsEdit]) then
              cdsObjetoxItemContratual.Post;
          cdsObjetoxItemContratual.First;
          while not(cdsObjetoxItemContratual.Eof) do
          begin
             cdsObjetoxItemContratual.Edit;
             case dbrgAtuacao.ItemIndex of
                0: cdsObjetoxItemContratual.FieldByName('ATUACAO').AsString:='C';
                1: cdsObjetoxItemContratual.FieldByName('ATUACAO').AsString:='P';
             end;
             cdsObjetoxItemContratual.Post;
             cdsObjetoxItemContratual.Next;
          end;
          cdsObjetoxItemContratual.First;
          cdsObjetoxItemContratual.Edit;
       finally
          cdsObjetoxItemContratual.EnableControls;
       end;
    end;
end;

procedure TfrmCadCorrecoesContratuaisMT.dblcServProdContratoAbatidoChange(Sender: TObject);
var
   sIDObjeto: String;
begin

   if not(cdsObjetoxItemContratual.State in [dsEdit]) then Exit;

   dblcServProdAbatido.Hint:='';
   if (Trim(dblcServProdAbatido.Text)<>'') then
      dblcServProdAbatido.Hint:=cdsSrvProd.FieldByName('NOMEOBJETO').AsString;

   dblcItemContratualAbatido.Hint:='';
   if (Trim(dblcItemContratualAbatido.Text)<>'') then
      dblcItemContratualAbatido.Hint:=cdsItemContratualAbatido.FieldByName('NOME_ITEM').AsString;

   if (TwwDBLookupCombo(Sender).Name='dblcServProdAbatido') and
      (cdsObjetoxItemContratual.State in [dsInsert,dsEdit]) then
    begin
       dblcItemContratualAbatido.Clear;
       if (Trim(dblcServProdAbatido.Text)<>'') then
          sIDObjeto:=dblcServProdAbatido.LookupValue
       else
          sIDObjeto:='0';
          
       cdsItemContratualAbatido.Filtered:=False;
       cdsItemContratualAbatido.Filter:='(IDOBJETO = '+sIDObjeto+') ';
       cdsItemContratualAbatido.Filtered:=True;
    end;
   dbcbPermResMenor.Enabled:=(Trim(dblcServProdAbatido.Text)<>'') and
                             (Trim(dblcItemContratualAbatido.Text)<>'');
end;

procedure TfrmCadCorrecoesContratuaisMT.ModoEdicao(var msg: TMessage);
begin
   sbtnAlterar.Click;
end;

procedure TfrmCadCorrecoesContratuaisMT.ModoEdicaoDet(var msg: TMessage);
begin
   sbtnAltDet.Click;
end;

procedure TfrmCadCorrecoesContratuaisMT.CancelarDet(var msg: TMessage);
begin
   bbtnCancelarDet.Click;
end;

procedure TfrmCadCorrecoesContratuaisMT.cdsDetAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if not(cdsDet.Active) then Exit;
   if (cdsDet.FieldByName('FLGATIVO').AsString='S') or (cdsDet.RecordCount=0) then
    begin
       sbtnExcluiDet.imageIndex:=2;
       sbtnExcluiDet.Hint:='Excluir/Desativar';
    end
   else
    begin
       sbtnExcluiDet.imageIndex:=4;
       sbtnExcluiDet.Hint:='Ativar';
    end;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if cdsDet.FieldByName('IDREFCONTR').AsFloat >0 then
        rgValorBaseCalculo.ItemIndex := 1
   else rgValorBaseCalculo.ItemIndex := 0;

   if not cdsObjetoxItemContratual.IsEmpty then
      cdsObjetoxItemContratual.Edit;
   if dbrgAtuacao.ItemIndex = -1 then begin
      dbrgAtuacao.ItemIndex := 0;
      if cdsObjetoxItemContratual.State in dsEditModes then
        cdsObjetoxItemContratual.FieldByName('ATUACAO').AsString := 'C';
   end;
end;

procedure TfrmCadCorrecoesContratuaisMT.pgcDadosCorrecaoDrawTab(
  Control: TCustomTabControl; TabIndex: Integer; const Rect: TRect;
  Active: Boolean);
begin
   inherited;
   Control.Canvas.Font.Color:=clWindowText;

   case TabIndex of
      0: Control.Canvas.TextRect(Rect,Rect.Left+4,Rect.Top+2,tbsDadosI.Caption);
      1: Control.Canvas.TextRect(Rect,Rect.Left+4,Rect.Top+2,tbsDadosII.Caption);
      2: Control.Canvas.TextRect(Rect,Rect.Left+4,Rect.Top+2,tbsDadosIII.Caption);
      3: Control.Canvas.TextRect(Rect,Rect.Left+4,Rect.Top+2,tbsDadosIV.Caption);
   end;
end;

procedure TfrmCadCorrecoesContratuaisMT.CarregaLookAditamento;
var i,y : Integer;
begin
  vLookAditamento := nil;
  y := 0;
  rIdCorrecao := cdsDet.FieldByName('IDCORRECAO').AsFloat;
  // Busca o texto original de todos os combos da tela
  for i := 0 to (ComponentCount - 1) do begin
    // DBLookupCombo
    if TObject(Components[i]).ClassType = TwwDBLookupCombo then begin
      SetLength(vLookAditamento, y+1);
      vLookAditamento[y].sNomeLookup  := TwwDBLookupCombo(Components[i]).Name;
      vLookAditamento[y].sVlrAnterior := TwwDBLookupCombo(Components[i]).Text;
      Inc(y);
    end;
    // DBRadioGroup
    if TObject(Components[i]).ClassType = TDBRadioGroup then begin
      if TDBRadioGroup(Components[i]).ItemIndex >= 0 then begin
        SetLength(vLookAditamento, y+1);
        vLookAditamento[y].sNomeLookup  := TDBRadioGroup(Components[i]).Name;
        vLookAditamento[y].sVlrAnterior := TDBRadioGroup(Components[i]).Items.Strings[TDBRadioGroup(Components[i]).ItemIndex];
        Inc(y);
      end;
    end;
  end;
end;

function TfrmCadCorrecoesContratuaisMT.EfetuaAditamento: Boolean;
var cdsRegistra,cdsAntigo : TCMClientDataSet;
    sCampo, sAnterior, sAtual : String;
    i,y : Integer;
begin
  Result := False;
  try
    cdsRegistra := TCmClientDataSet.Create( nil );
    cdsAntigo   := TCmClientDataSet.Create( nil );
    cdsRegistra.Data := CtrlParamAditamento.ListParamAditamento('CORRECAOCONTR', True);
    if not cdsRegistra.IsEmpty then begin

      // Abre contrato anterior
      cdsAntigo.Data := CtrlCorrecoes.ListCorrecoes(cdsDet.FieldByName('IDCONTRATO').AsInteger,
                                                    Sistema.IdEmpresa, False,
                                                    cdsDet.FieldByName('IDCORRECAO').AsInteger);
      if cdsAntigo.IsEmpty then Exit;

      // Apaga os Logs já registrados anteriormente para a mesma correção
      cdsLogAditamento.First;
      while not cdsLogAditamento.Eof do begin
         if cdsLogAditamento.FieldByName('ID_TEMP').AsInteger =
            cdsDet.FieldByName('IDCORRECAO').AsInteger then begin
           cdsLogAditamento.Delete;
         end else begin
           cdsLogAditamento.Next;
         end;
      end;

      // Verifica se houve alteração em algum campo parametrizado
      while not cdsRegistra.Eof do begin
        sCampo    := cdsRegistra.FieldByName('FIELDNAME').AsString;
        sAnterior := cdsAntigo.FieldByName(sCampo).AsString;
        sAtual    := cdsDet.FieldByName(sCampo).AsString;

        if sAnterior <> sAtual then begin

          // Busca o texto do combo quando o campo for assiciado a este componente
          for i := 0 to (ComponentCount - 1) do begin
             // verifica campos lookups
             if ( (TObject(Components[i]).ClassType = TwwDBLookupCombo) and (TwwDBLookupCombo(Components[i]).DataField = sCampo) ) then begin

                // altera o id anterior pelo texto armazenado no lookup
                for y := 0 to Length(vLookAditamento) - 1 do begin
                  if vLookAditamento[y].sNomeLookup = TwwDBLookupCombo(Components[i]).Name then begin
                    sAnterior := vLookAditamento[y].sVlrAnterior;
                    Break;
                  end;
                end;
                // altera o id atual pelo texto do lookup
                sAtual := TwwDBLookupCombo(Components[i]).Text;
             end;
             // verifica campos radio group
             if ( (TObject(Components[i]).ClassType = TDBRadioGroup) and (TDBRadioGroup(Components[i]).DataField = sCampo) ) then begin

                // altera o id anterior pelo texto armazenado no lookup
                for y := 0 to Length(vLookAditamento) - 1 do begin
                  if vLookAditamento[y].sNomeLookup = TDBRadioGroup(Components[i]).Name then begin
                    sAnterior := vLookAditamento[y].sVlrAnterior;
                    Break;
                  end;
                end;
                // altera o id atual pelo texto do lookup
                sAtual := TDBRadioGroup(Components[i]).Items.Strings[TDBRadioGroup(Components[i]).ItemIndex];
             end;
          end;

          Result := True;
          cdsLogAditamento.Insert;
          cdsLogAditamento.FieldByName('IDCONTRATO').AsInteger := cdsDet.FieldByName('IDCONTRATO').AsInteger;
          cdsLogAditamento.FieldByName('ID_TEMP').AsInteger    := cdsDet.FieldByName('IDCORRECAO').AsInteger;
          cdsLogAditamento.FieldByName('IDOBJETO').AsInteger   := cdsDet.FieldByName('IDOBJETO').AsInteger;
          cdsLogAditamento.FieldByName('IDITEM').AsInteger     := cdsDet.FieldByName('IDITEM').AsInteger;
          cdsLogAditamento.FieldByName('IDDDFIELD').AsInteger  := cdsRegistra.FieldByName('IDDDFIELD').AsInteger;
          cdsLogAditamento.FieldByName('VLRANTERIOR').AsString := sAnterior;
          cdsLogAditamento.FieldByName('VLRATUAL').AsString    := sAtual;
          cdsLogAditamento.Post;
        end;
        cdsRegistra.Next;
      end;
    end;
  finally
    FreeAndNil( cdsRegistra );
    FreeAndNil( cdsAntigo );
  end;
end;

procedure TfrmCadCorrecoesContratuaisMT.sbtnAltDetClick(Sender: TObject);
begin
  if cdsDet.FieldByName('FLGATIVO').AsString = 'N' then begin
    MsgDlg('Esta Correção precisa ser Reativada para poder ser Alterada','Erro',mtError,[mbOK],0);
    sbtnAltDet.Down := False;
  end else begin
    inherited;
  end;
end;

// Pendência 23289 - Marcos Topini em 13/09/2006
function TfrmCadCorrecoesContratuaisMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if trim(dblcServProd.Text) = '' then
      raise EValidacao.CreateVal('Informe o Serviço/Produto', dblcServProd);

    if trim(dblcItemContratual.Text) = '' then
      raise EValidacao.CreateVal('Informe o Item Contratual', dblcItemContratual);
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;



end.



