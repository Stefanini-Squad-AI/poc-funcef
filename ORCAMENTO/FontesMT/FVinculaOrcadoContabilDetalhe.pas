{--------------------------------------------------------------------------------------------------
Rotina......: ListarContabCentroCusto
Nº SOL......: 172384-10142
Nº KINTANA..: 1696873
Data........: 18/06/2012
Responsável.: Higor Nayde Ferreira
Descrição...: criação de variavel para passar como paramentro.
{--------------------------------------------------------------------------------------------------
Rotina......: ListarContaContabilGruposOrcamen
Nº SOL......: 172383-9201
Nº KINTANA..: 1640405
Data........: 23/04/2012
Responsável.: Edilaine Ferraresi
Descrição...: inclusão do parâmetro Plano Orçamentário
{ --------------------------------------------------------------------------------------------------
// Autor.........: Edilaine Ferraresi
// Data..........: 23/03/2012
// Nº SOL........: 172383-7764
// Nº KINTANA....: 1556975
// Rotina........: VincularContaContabGrupo
// Descrição.....: troca de Modulo.iPlanoOrc por IdPlanoOrcamen
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: Todo o Formulário
Nº SOL......: 159242/6041
Nº KINTANA..: 1385831
Data........: 31/06/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: TELA DE VINCULAÇÃO DE CONTAS CONTÁBEIS COM GRUPO ORCAMENTARIO
----------------------------------------------------------------------------------------------------}

unit FVinculaOrcadoContabilDetalhe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  Gauges, ComCtrls, ToolWin, ImgList, Db, DBClient, uCMClientDataSet,
  DBaseDados,uCtrlCadContasOrcPorGrupo,USistema, uModulo,uCMTypes,uCtrlParamOrcamento,
  BfDialogs, BrowseFolder, uProcuraDir,uCMFileUtils, DBTables,FProgresso,
  Wwquery, Mask, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook;

type
  TFrmVinculaOrcadoDetalhe = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblCodGrupo: TLabel;
    lblNomeGrupo: TLabel;
    pnlVinculacao: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    pnlContasContbDisp: TLabel;
    pnlContasContbSel: TLabel;
    GridContabDisp: TwwDBGrid;
    R: TwwDBGrid;
    gProgresso: TGauge;
    Label6: TLabel;
    imgBotoes: TImageList;
    ToolBar1: TToolBar;
    btnCCDisponiveis: TToolButton;
    btnCCSelecionados: TToolButton;
    btnCCDisponiveisTodos: TToolButton;
    btnCCSelecionadosTodos: TToolButton;
    BtnCCRefresh: TToolButton;
    cdsContabDisp: TCMClientDataSet;
    cdsContabSel: TCMClientDataSet;
    dsContabDisp: TDataSource;
    dsContabSel: TDataSource;
    CoolBar1: TCoolBar;
    Panel5: TPanel;
    cboContaDisp: TComboBox;
    edtContaDisp: TEdit;
    Image1: TImage;
    CoolBar2: TCoolBar;
    Panel6: TPanel;
    Image2: TImage;
    cboContaSel: TComboBox;
    edtContaSel: TEdit;
    cdsCCusto: TClientDataSet;
    cdsPlano: TClientDataSet;
    cdsPatro: TClientDataSet;
    cdsAtividadeProjeto: TClientDataSet;
    chkVisualizaParametros: TCheckBox;
    pnlSintetico: TPanel;
    Label4: TLabel;
    pnlAnalitico: TPanel;
    Label5: TLabel;
    cdsPrograma: TClientDataSet;
    cdsTipoDespesa: TClientDataSet;
    chkAnaliseContaOrcamen: TCheckBox;
    cdsParamOrc: TClientDataSet;
    pnlPasta: TPanel;
    lblDiretorio: TLabel;
    lbl1: TLabel;
    btnEscolheDir: TBitBtn;
    dlgCaminho: TProcuraDirDlg;
    qryAux: TwwQuery;
    CdsCentroRespon: TCMClientDataSet;
    lbl2: TLabel;
    dblkpcmbCODCENTRORESPON: TwwDBLookupCombo;
    lbl3: TLabel;
    dbcboTipoCalcOrc: TwwDBComboBox;
    lbl4: TLabel;
    dbcboTipoCalcReal: TwwDBComboBox;
    lbl5: TLabel;
    dbcboCalcValor: TwwDBComboBox;
    bvl1: TBevel;
    lblPlanoContabil: TLabel;
    lbl6: TLabel;
    cdsContasOrcamen: TCMClientDataSet;
    dsContasOrcamen: TDataSource;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure GridContabDispCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure RCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormShow(Sender: TObject);
    procedure BtnCCRefreshClick(Sender: TObject);
    procedure btnCCSelecionadosTodosClick(Sender: TObject);
    procedure btnCCDisponiveisTodosClick(Sender: TObject);
    procedure btnCCSelecionadosClick(Sender: TObject);
    procedure btnCCDisponiveisClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edtContaDispChange(Sender: TObject);
    procedure cboContaDispClick(Sender: TObject);
    procedure cboContaSelClick(Sender: TObject);
    procedure edtContaSelChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEscolheDirClick(Sender: TObject);
  private
    vCusto :string;
    { Private declarations }

  public
    { Public declarations }

    //Propriedades
    idPlanoOrcamen:integer;                //Id do Plano Orçamentário
    DescrPlanoOrcamen:string;              //Descrição do plano orçamentário
    iAnoPlanoOrcamen:integer;              //Ano vigente do plano orçamentário
    IdGrupoOrcamen:integer;                //Id do Grupo Orçamentário
    CodGrupoOrcamen:string;                //Código do Grupo Orçamentário
    DescrGrupoOrcamen:string;              //Descrição do Grupo orçamentário
    idPlanoContasVigente:string;           //Código de plano de contas vigente da contabilidade
    PlanoContasVigenteDescricao:string;    //Descrição do plano de cotnas vigentes(contabilidade)
    bPerguntarVisualiazarLog:Boolean;      //Exibir pergunta de visualização de log de cotnas orçamentárias
    bExibirProgressoCOntasOrcamen:Boolean; //Exibir barra de progresso do cadastro de contas orçamentárias
    lstContasContab:TStringList;           //Listagem das Contas Contábeis Selecionadas

    //Substituir na Composição das Contas Orçamentárias
    bSubstCC        : Boolean; {Centro de Custo}
    bSubstAP        : Boolean; {Atividade Projetos}
    bSubstPP        : Boolean; {Plano}
    bSubstPT        : Boolean; {Patrocinador}
    bSubstPR        : Boolean; {Programa}
    bSubstTP        : Boolean; {Tipo de Despesa}

    //Método de inicialização da Tela
    procedure Inicializa;
    //Exibe totais de parâmetros disponíveis e selecionados em tela.
    procedure Totaliza;
    //Realiza consulta aproximada de um clientdataset
    procedure ConsultaAproximada(strvalor:string;iTipoConsulta:integer;cds:TClientDataSet);
    //Carrega parâmetros (plano,patro,centro de custo e etc.) conforme contas contábeis selecionadas
    function  CarregarParametros:Boolean;
    //Método Principal de Vinculação de COntas
    function  VincularContaContabGrupo:Boolean;
    //Criar Contas Espelhos
    function  CriarContaEspelho:Boolean;
    //Progresso utilizado internamente na método de gravar grupos
    procedure Progresso(vParam : Array of Variant);


  end;

var
  FrmVinculaOrcadoDetalhe    : TFrmVinculaOrcadoDetalhe;
  CtrlCadContasOrcPorGrupo   : TCtrlCadContasOrcPorGrupo;
  CtrlParamorcamento         : TCtrlParamorcamento;

implementation

uses FVinculaOrcadoContabilParametros, uCtrlVinculaOrcadoContabil,
  FVinculaOrcadoContabil;

{$R *.DFM}

procedure TFrmVinculaOrcadoDetalhe.bbtnCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmVinculaOrcadoDetalhe.GridContabDispCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if State <> [gdSelected] then
  begin
     if not Highlight then
     begin
          //Negrita a Linha para Grupos SIntéticos
          if trim(cdsContabDisp.Fieldbyname('PLATIPO').AsString) = 'A' then
             ABrush.Color := pnlAnalitico.Color
          else
              ABrush.Color := pnlSintetico.Color;
     end;
  end
  else
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TFrmVinculaOrcadoDetalhe.RCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if State <> [gdSelected] then
  begin
     if not Highlight then
     begin
          //Negrita a Linha para Grupos SIntéticos
          if trim(cdsContabSel.Fieldbyname('PLATIPO').AsString) = 'A' then
             ABrush.Color := pnlAnalitico.Color
          else
              ABrush.Color := pnlSintetico.Color;
     end;
  end
  else
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TFrmVinculaOrcadoDetalhe.FormShow(Sender: TObject);
begin
     Inicializa();
end;

procedure TFrmVinculaOrcadoDetalhe.Inicializa;
begin
     lblCodGrupo.Caption  := IntToStr(IdGrupoOrcamen);
     lblCodGrupo.Caption  := CodGrupoOrcamen;
     lblNomeGrupo.Caption := DescrGrupoOrcamen;

     TRY

        //Contas Contábeis
        lstContasContab := TStringList.Create;

        //Lista Parâmetros Principais da Contas Orçamentária
        cdsContasOrcamen.Data := CtrlVinculaOrcadoContabil.ListarContasOrcamenParam(IntToStr(idPlanoOrcamen),IntToStr(IdGrupoOrcamen));

        //Lista Centro de Responsabilidade
        CdsCentroRespon.Data := CtrlVinculaOrcadoContabil.ListarCentroResponsabilidade(Sistema.IdEmpresa);

        //Preenche contas contábeis
        Screen.Cursor := crHourGlass;
        cdsContabSel.Data := CtrlVinculaOrcadoContabil.ListarContaContabilGruposOrcamen(IntToStr(idPlanoOrcamen),IntToStr(IdGrupoOrcamen)); // Edilaine - SOL 172383-9201 / KTN 1640405
        cdsContabDisp.Data  := CtrlVinculaOrcadoContabil.ListarContaContabilGruposOrcamenDisponivel(IntToStr(IdGrupoOrcamen));
        Totaliza();

        //Plano Contábil Vigente
        CtrlVinculaOrcadoContabil.RetornarPlanoContabilVigente(idPlanoContasVigente,PlanoContasVigenteDescricao);
        lblPlanoContabil.Caption := idPlanoContasVigente + ' - ' + PlanoContasVigenteDescricao;

        //Higor Nayde  SOL - 172384 KTN - 1696873 INICIO
           if(not cdsContabSel.IsEmpty)then
                vCusto := IntToStr(IdGrupoOrcamen);
        //Higor Nayde  SOL - 172384 KTN - 1696873 Fim

        //Acerta Controles
        cboContaDisp.ItemIndex := 0;
        cboContaSel.ItemIndex  := 0;
        edtContaDisp.Clear;
        edtContaSel.Clear;

        pnlPasta.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

        //Perguntar se deseja visualizar Log logo após do operação 
        bPerguntarVisualiazarLog := true;

        //Exibir barra de progresso do cadastro de contas orçamentárias
        bExibirProgressoCOntasOrcamen := true;

     FINALLY
        Screen.Cursor := crDefault;
     END;
     Application.ProcessMessages;
end;

procedure TFrmVinculaOrcadoDetalhe.Totaliza;
begin

     pnlContasContbDisp.Caption := 'Contas Contábeis Disponíveis (0)';
     pnlContasContbSel.Caption := 'Contas Contábeis Vinculadas (0)';

     if cdsContabDisp.Active then
        pnlContasContbDisp.Caption := 'Contas Contábeis Disponíveis (' + IntToStr(cdsContabDisp.recordcount) + ')';

     if cdsContabSel.Active then
        pnlContasContbSel.Caption := 'Contas Contábeis Vinculadas (' + IntToStr(cdsContabSel.recordcount) + ')';

     Application.ProcessMessages;

end;

procedure TFrmVinculaOrcadoDetalhe.BtnCCRefreshClick(Sender: TObject);
begin
     //Preenche contas contábeis
     TRY
        Screen.Cursor := crHourGlass;
        cdsContabSel.Data := CtrlVinculaOrcadoContabil.ListarContaContabilGruposOrcamen(IntToStr(idPlanoOrcamen), IntToStr(IdGrupoOrcamen));  // Edilaine - SOL 172383-9201 / KTN 1640405
        cdsContabDisp.Data  := CtrlVinculaOrcadoContabil.ListarContaContabilGruposOrcamenDisponivel(IntToStr(IdGrupoOrcamen));
        Totaliza();
     FINALLY
        Screen.Cursor := crDefault;
        Application.ProcessMessages;
     END;

end;

procedure TFrmVinculaOrcadoDetalhe.btnCCSelecionadosTodosClick(
  Sender: TObject);
begin
     if cdsContabSel.IsEmpty then
        exit;

     TRY

       Screen.Cursor := crHourGlass;
       
       gProgresso.Progress := 0;
       gProgresso.MinValue := 0;
       gProgresso.MaxValue := cdsContabSel.RecordCount;

       cdsContabSel.first;
       while not cdsContabSel.eof Do
       begin
            cdsContabDisp.Append;
            cdsContabDisp.FieldByName('DESCPLANO').AsString := cdsContabSel.FieldByName('DESCPLANO').AsString;
            cdsContabDisp.FieldByName('PLANO').AsString     := cdsContabSel.FieldByName('PLANO').AsString;
            cdsContabDisp.FieldByName('PLACONTA').AsString  := cdsContabSel.FieldByName('PLACONTA').AsString;
            cdsContabDisp.FieldByName('PLANOME').AsString   := cdsContabSel.FieldByName('PLANOME').AsString;
            cdsContabDisp.FieldByName('PLATIPO').AsString   := cdsContabSel.FieldByName('PLATIPO').AsString;
            cdsContabDisp.Post;

            gProgresso.Progress :=  gProgresso.Progress + 1;
            cdsContabSel.Next;
       end;

       cdsContabSel.EmptyDataSet;

       Totaliza();
     FINALLY
        Screen.Cursor := crDefault;
        gProgresso.Progress := 0;
        Application.ProcessMessages;
     END;    
end;

procedure TFrmVinculaOrcadoDetalhe.btnCCDisponiveisTodosClick(
  Sender: TObject);
begin

     if cdsContabDisp.IsEmpty then
        exit;

     TRY

       Screen.Cursor := crHourGlass;


       gProgresso.Progress := 0;
       gProgresso.MinValue := 0;
       gProgresso.MaxValue := cdsContabDisp.RecordCount;

       
       cdsContabDisp.first;
       while not cdsContabDisp.eof Do
       begin
            cdsContabSel.Append;
            cdsContabSel.FieldByName('DESCPLANO').AsString := cdsContabDisp.FieldByName('DESCPLANO').AsString;
            cdsContabSel.FieldByName('PLANO').AsString     := cdsContabDisp.FieldByName('PLANO').AsString;
            cdsContabSel.FieldByName('PLACONTA').AsString  := cdsContabDisp.FieldByName('PLACONTA').AsString;
            cdsContabSel.FieldByName('PLANOME').AsString   := cdsContabDisp.FieldByName('PLANOME').AsString;
            cdsContabSel.FieldByName('PLATIPO').AsString   := cdsContabDisp.FieldByName('PLATIPO').AsString;
            cdsContabSel.Post;

            gProgresso.Progress :=  gProgresso.Progress + 1;
            cdsContabDisp.Next;
       end;


       cdsContabDisp.EmptyDataSet;

       Totaliza();
     FINALLY
        Screen.Cursor := crDefault;
        gProgresso.Progress := 0;
        Application.ProcessMessages;
     END;
end;

procedure TFrmVinculaOrcadoDetalhe.btnCCSelecionadosClick(Sender: TObject);
begin

     if cdsContabSel.IsEmpty then
        exit;

     TRY

       Screen.Cursor := crHourGlass;
       cdsContabDisp.Append;
       cdsContabDisp.FieldByName('DESCPLANO').AsString := cdsContabSel.FieldByName('DESCPLANO').AsString;
       cdsContabDisp.FieldByName('PLANO').AsString     := cdsContabSel.FieldByName('PLANO').AsString;
       cdsContabDisp.FieldByName('PLACONTA').AsString  := cdsContabSel.FieldByName('PLACONTA').AsString;
       cdsContabDisp.FieldByName('PLANOME').AsString   := cdsContabSel.FieldByName('PLANOME').AsString;
       cdsContabDisp.FieldByName('PLATIPO').AsString   := cdsContabSel.FieldByName('PLATIPO').AsString;
       cdsContabDisp.Post;

       cdsContabSel.Delete;

       Totaliza();
     FINALLY
        Screen.Cursor := crDefault;
        Application.ProcessMessages;
     END; 
end;

procedure TFrmVinculaOrcadoDetalhe.btnCCDisponiveisClick(Sender: TObject);
begin

     if cdsContabDisp.IsEmpty then
        exit;

     TRY
       Screen.Cursor := crHourGlass;
       cdsContabSel.Append;
       cdsContabSel.FieldByName('DESCPLANO').AsString := cdsContabDisp.FieldByName('DESCPLANO').AsString;
       cdsContabSel.FieldByName('PLANO').AsString     := cdsContabDisp.FieldByName('PLANO').AsString;
       cdsContabSel.FieldByName('PLACONTA').AsString  := cdsContabDisp.FieldByName('PLACONTA').AsString;
       cdsContabSel.FieldByName('PLANOME').AsString   := cdsContabDisp.FieldByName('PLANOME').AsString;
       cdsContabSel.FieldByName('PLATIPO').AsString   := cdsContabDisp.FieldByName('PLATIPO').AsString;
       cdsContabSel.Post;
       cdsContabDisp.Delete;

       Totaliza();
     FINALLY
        Screen.Cursor := crDefault;
        Application.ProcessMessages;
     END; 
end;

procedure TFrmVinculaOrcadoDetalhe.bbtnConfirmarClick(Sender: TObject);
var
   Msg:string;
begin

   //Consistências

   //Centro de Responsabilidade
   if Trim(dblkpcmbCODCENTRORESPON.Text) = '' then
   begin
        Application.MessageBox('Favor informar o centro de responsabilidade.','Atenção',48);
        dblkpcmbCODCENTRORESPON.SetFocus();
        ModalResult := mrNone;
        Exit;
   end;

   //Tipo de Calculo Realizado
   if Trim(dbcboTipoCalcReal.Text) = '' then
   begin
        Application.MessageBox('Favor informar o tipo de cálculo realizado.','Atenção',48);
        dbcboTipoCalcReal.SetFocus();
        ModalResult := mrNone;
        Exit;
   end;

   //Tipo de Calculo orçado
   if Trim(dbcboTipoCalcOrc.Text) = '' then
   begin
        Application.MessageBox('Favor informar o tipo de cálculo orçado.','Atenção',48);
        dbcboTipoCalcOrc.SetFocus();
        ModalResult := mrNone;
        Exit;
   end;

   //Tipo de Calculo Valor Acumulado
   if Trim(dbcboCalcValor.Text) = '' then
   begin
        Application.MessageBox('Favor informar o tipo de cálculo valor acumulado.','Atenção',48);
        dbcboCalcValor.SetFocus();
        ModalResult := mrNone;
        Exit;
   end;

   //Mensagem de Confirmação
   Msg := 'Deseja realmente atualizar ' + IntToStr(cdsContabSel.recordcount) + ' conta(s) contábeis para o grupo: "' + DescrGrupoOrcamen + '"?' + #13 +
           #13 +
           'Este processo poderá desvincular ou criar novas contas orçamentárias à este grupo dependendendo das contas contábeis selecionados,' + #13 +
           'devidos aos parâmetros de plano\patrocinador\atividade de projeto\ centro de custa\ programa \ tipo de despesa das mesmas.' + #13 +
           #13 +
           'Deseja realmente continuar a operação?';

   if Application.MessageBox(pchar(Msg),'Atenção',36) <> 6 then
   begin
        ModalResult := mrNone;
        Exit;
   end;
   
   //Verifica Ano do Plano Orçamentário
   if (iAnoPlanoOrcamen = 0) then
   begin
        Msg := 'O grupo orçamentário "' + Trim(DescrGrupoOrcamen) + '" está associado ao Plano Orçamentário "' + Trim(DescrPlanoOrcamen) + '", porém ' + #13 +
               'para este plano orçamentario não foi definido o ano de vigência. ' + #13 + #13 +
               'Favor verificar o cadastro de plano orçamentário em Tela Principal -> Cadastros -> Plano Orçamentário.' + #13 + #13 +
               'O processo será abortado.';
        Application.MessageBox(pchar(Msg),'Atenção',48);

        ModalResult := mrNone;
        Exit;
   end;

   VincularContaContabGrupo();

   ModalResult := mrOk;

end;

procedure TFrmVinculaOrcadoDetalhe.ConsultaAproximada(strvalor: string;
  iTipoConsulta: integer; cds: TClientDataSet);
var
   strcampo:string;
begin

   if not cds.Active then
      Exit;

   if cds.IsEmpty then
      Exit;

   strcampo := '';

   case iTipoConsulta of
        0: strcampo := 'PLACONTA'; //Código da Conta
        1: strcampo := 'PLANOME';  //Descrição da Conta
   end;


   if (strcampo = '') then
      Exit;

   cds.IndexFieldNames := strcampo;
   cds.FindNearest([strvalor]);
end;

procedure TFrmVinculaOrcadoDetalhe.edtContaDispChange(Sender: TObject);
begin
     ConsultaAproximada(edtContaDisp.Text, cboCOntaDisp.itemindex,cdsContabDisp);
end;

procedure TFrmVinculaOrcadoDetalhe.cboContaDispClick(Sender: TObject);
begin
     edtContaDisp.Setfocus;
end;

procedure TFrmVinculaOrcadoDetalhe.cboContaSelClick(Sender: TObject);
begin
     edtContaSel.SetFocus;
end;

procedure TFrmVinculaOrcadoDetalhe.edtContaSelChange(Sender: TObject);
begin
     ConsultaAproximada(edtContaSel.Text, cboContaSel.itemindex,cdsContabSel);
end;

function TFrmVinculaOrcadoDetalhe.VincularContaContabGrupo: Boolean;
var
  sNomeArq:string;
begin

   Result := false;
   TRY

       //Carregar parâmetros
       CarregarParametros();

       //Instância Control de Cadastro de Grupo Orçamentário
       CtrlCadContasOrcPorGrupo   := TCtrlCadContasOrcPorGrupo.Create;
       CtrlCadContasOrcPorGrupo.Initialize(DtmBaseDados.dbBaseDados,
                                           True,
                                           Sistema.ConnectionType,
                                           Sistema.ConnectionSide,
                                           Sistema.AppRemoteServer,
                                           True, nil, nil, False);

       //Instância Control de Parâmetro Orçamentário
       CtrlParamOrcamento         := TCtrlParamOrcamento.Create;
       CtrlParamOrcamento.InitializeAs(CtrlCadContasOrcPorGrupo);
       cdsParamOrc.Data           := CtrlParamorcamento.ListaParamOrcamento(Sistema.IDEmpresa);

       //Propriedades
       CtrlCadContasOrcPorGrupo.IdGrupoOrcamen             := IdGrupoOrcamen;
       CtrlCadContasOrcPorGrupo.CodGrupoOrcamen            := CodGrupoOrcamen;
       CtrlCadContasOrcPorGrupo.DescrGrupoOrcamen          := DescrGrupoOrcamen;
       CtrlCadContasOrcPorGrupo.idPlanoOrcamento           := idPlanoOrcamen;
       CtrlCadContasOrcPorGrupo.idAnoOrcamento             := iAnoPlanoOrcamen;
       CtrlCadContasOrcPorGrupo.idPlanoContas              := StrToInt(idPlanoContasVigente);
       CtrlCadContasOrcPorGrupo.lstContasContab            := lstContasContab;
       CtrlCadContasOrcPorGrupo.UtilizarRotinaVincContabil := true;
       CtrlCadContasOrcPorGrupo.AtualizaNaInsercao         := true;
       CtrlCadContasOrcPorGrupo.pIdEmpresa                 := Sistema.IdEmpresa;
       CtrlCadContasOrcPorGrupo.pPlano                     := idPlanoOrcamen; {Modulo.iPlanoOrc;} // Edilaine - SOL 172383-7764 / KTN 1556975

       if bExibirProgressoCOntasOrcamen then
         CtrlCadContasOrcPorGrupo.Progresso          := Progresso;

       //Parâmetros
       CtrlCadContasOrcPorGrupo.CdsCentroDeCusto := cdscCusto;
       CtrlCadContasOrcPorGrupo.CdsAtivProj      := cdsAtividadeProjeto;
       CtrlCadContasOrcPorGrupo.CdsPlanoPrev     := CdsPlano;
       CtrlCadContasOrcPorGrupo.CdsPatro         := CdsPatro;

       //Parâmetros Selecionáveis
       CtrlCadContasOrcPorGrupo.CdsCCSel         := cdscCusto;
       CtrlCadContasOrcPorGrupo.CdsAPSel         := cdsAtividadeProjeto;
       CtrlCadContasOrcPorGrupo.CdsPPSel         := CdsPlano;
       CtrlCadContasOrcPorGrupo.CdsPTSel         := CdsPatro;
       CtrlCadContasOrcPorGrupo.CdsProgramaSel   := cdsPrograma;
       CtrlCadContasOrcPorGrupo.CdsTipoDespesaSel:= cdsTipoDespesa;
       CtrlCadContasOrcPorGrupo.CdsParamOrc      := CdsParamOrc;
       {CtrlCadContasOrcPorGrupo.CdsCampoSel      := CdsCampoSel;}

       CtrlCadContasOrcPorGrupo.CreateThreadProgresso;
       CtrlCadContasOrcPorGrupo.AnalisaContasorcamen := (chkAnaliseContaOrcamen.Checked);

       //Cria COntas Espelhos
       Result :=  CriarContaEspelho();

       if not Result then
       begin
          Raise Exception.Create('ORC08FR - Não foi possível cirar as contas espelho das contas orçamentárias.' + #13 +
                                 'Processo será abortado.');
          Exit;
       end;

       //Método que Grava os Grupos
       Result :=
              CtrlCadContasOrcPorGrupo.GravarGrupoOrc( IdGrupoOrcamen,                        //const IDGrupoOrcamen  : Extended;
                                                       CodGrupoOrcamen,                       //const CodGrupoOrcamen : String;
                                                       '-1',                                  //const IDContaOrcamen  : String;
                                                       pnlPasta.Caption,                      //const sPath           : String;
                                                       bSubstCC,                              //const bSubstCC        : Boolean;
                                                       bSubstAP,                              //const bSubstAP        : Boolean;
                                                       bSubstPP,                              //const bSubstPP        : Boolean;
                                                       bSubstPT,                              //const bSubstPT        : Boolean;
                                                       bSubstPR,                              //const bSubstPR        : Boolean; {Programa}
                                                       bSubstTP,                              //const bSubstTP        : Boolean; {Tipo de Despesa}
                                                       '',                                    //const sNomeBilhete    : String;
                                                       opInserir                              //Operacao : TOperacao
                                                    );
                                                    
       CtrlCadContasOrcPorGrupo.FreeThreadProgresso;
       

       //Visualização de Log
       if bPerguntarVisualiazarLog then
       begin
         if  Application.MessageBox('Processo concluído. Deseja visualizar o arquivo de log?', 'Orçamento', 36) = 6 then
         begin
              Repaint;
              sNomeArq := pnlPasta.Caption + 'ContasOrcamen' + 'INSERINDO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt';
              CopyFile(Pchar(sNomeArq), PChar(ExtractFilePath(sNomeArq) + 'Visualiza.Txt'), False);
              ShellExecuteFile(ExtractFilePath(sNomeArq) + 'Visualiza.Txt', '', '', SW_SHOW);
         end;
       end;

   FINALLY
       CtrlCadContasOrcPorGrupo.ExcluiContaEspelho;
       CtrlCadContasOrcPorGrupo.Free;
       FreeAndNil(CtrlParamorcamento);
   end;


   Result := true;
end;

procedure TFrmVinculaOrcadoDetalhe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //Centro de Custa
     cdscCusto.Close;
     //Plano Previdenciário
     cdsPlano.Close;
     //Patrocinador
     cdsPatro.Close;
     //Ativida de Projeto
     cdsAtividadeProjeto.Close;
     //Programa
     cdsPrograma.Close;
     //Tipo Despesa
     cdsTipoDespesa.Close;
     //Parâmetro Orçamentário
     cdsParamOrc.Close;

     FreeAndNil(lstContasContab);
end;

function TFrmVinculaOrcadoDetalhe.CarregarParametros: Boolean;
begin

     Result := false;

     TRY
       TRY
         lstContasContab.Clear;
         cdsContabSel.First;
         while not cdsContabSel.eof Do
         begin
              lstContasContab.Add(cdsContabSel.FieldByName('PLACONTA').AsString);
              cdsContabSel.Next;
         end;


         //Informar Código de Grupo
         CtrlVinculaOrcadoContabil.CodGrupoorcamen := CodGrupoOrcamen;

         //Substituir na Composição das Contas Orçamentárias
         bSubstCC        := true;
         bSubstAP        := true;
         bSubstPP        := true;
         bSubstPT        := true;
         bSubstPR        := true;
         bSubstTP        := true;

         //Centro de Custo


         cdscCusto.Data := CtrlVinculaOrcadoContabil.ListarContabCentroCusto(vCusto,IntToStr(idPlanoOrcamen),IntToStr(iAnoPlanoOrcamen),idPlanoContasVigente,lstContasContab); //Higor Nayde  SOL - 172384 KTN - 1696873

         if cdscCusto.IsEmpty then
         begin
              cdscCusto.Append;
              cdscCusto.FieldByName('NOME').AsString              := 'Conta Generica';
              cdscCusto.FieldByName('CODEXTERNO').AsString        := 'X';
              cdscCusto.FieldByName('CODCENTROCUSTO').AsString    := 'X';
              cdscCusto.Post;
              bSubstCC := False;
         end;

         //Plano Previdenciário
         cdsPlano.Data            := CtrlVinculaOrcadoContabil.ListarContabPlano(IntToStr(iAnoPlanoOrcamen),idPlanoContasVigente,lstContasContab);

         if cdsPlano.IsEmpty then
         begin
               cdsPlano.Append;
               cdsPlano.FieldByName('NOME').AsString           := 'Conta Generica';
               cdsPlano.FieldByName('CODORCAMENTO').AsString   := 'X';
               cdsPlano.FieldByName('IDPLANOPREV').AsString    := '0';
               cdsPlano.Post;
               bSubstPP := False;
         end;

         //Patrocinador
         cdsPatro.Data            := CtrlVinculaOrcadoContabil.ListarContabPatro(IntToStr(iAnoPlanoOrcamen),idPlanoContasVigente,lstContasContab);

         if cdsPatro.IsEmpty then
         begin
               cdsPatro.Append;
               cdsPatro.FieldByName('NOME').AsString           := 'Conta Generica';
               cdsPatro.FieldByName('CODORCAMENTO').AsString   := 'X';
               cdsPatro.FieldByName('IDPESSOA').AsString       := '0';
               cdsPatro.Post;
               bSubstPT := False;
         end;

         //Ativida de Projeto
         cdsAtividadeProjeto.Data := CtrlVinculaOrcadoContabil.ListarContabAtividadeProjeto(IntToStr(iAnoPlanoOrcamen),idPlanoContasVigente,lstContasContab);

         if cdsAtividadeProjeto.IsEmpty then
         begin
               cdsAtividadeProjeto.Append;
               cdsAtividadeProjeto.FieldByName('NOME').AsString        := 'Conta Generica';
               cdsAtividadeProjeto.FieldByName('UNECODIGO').AsString   := '';
               cdsAtividadeProjeto.FieldByName('UNIDNEGOC').AsString   := '';
               cdsAtividadeProjeto.Post;
               bSubstAP := false;
         end;

         //Programa
         cdsPrograma.Data         :=  CtrlVinculaOrcadoContabil.ListarContabPrograma(IntToStr(iAnoPlanoOrcamen),idPlanoContasVigente,lstContasContab);

         if cdsPrograma.IsEmpty then
         begin
               cdsPrograma.Append;
               cdsPrograma.FieldByName('NOME').AsString                := 'Conta Generica';
               cdsPrograma.FieldByName('IDPROGRAMAORCAMEN').AsInteger  := 0;
               //cdsPrograma.FieldByName('IDPESSOA').AsString            := 'X';
               cdsPrograma.Post;
               bSubstPR := false;
         end;


         //Tipo Despesa
         cdsTipoDespesa.Data      :=  CtrlVinculaOrcadoContabil.ListarContabTipoDespesa(IntToStr(iAnoPlanoOrcamen),idPlanoContasVigente,lstContasContab);

         if cdsTipoDespesa.IsEmpty then
         begin
              cdsTipoDespesa.Append;
              cdsTipoDespesa.FieldByName('NOME').AsString                  := 'Conta Generica';
              cdsTipoDespesa.FieldByName('IDTIPO_DEPESAORCAMEN').AsInteger := 0;
              //cdsPrograma.FieldByName('IDPESSOA').AsString            := 'X';
              cdsTipoDespesa.Post;
              bSubstTP := False;
         end;

         //Visualizar parâmetros
         if chkVisualizaParametros.Checked then
         begin
              FrmVinculaOrcadoContabilparamatros := TFrmVinculaOrcadoContabilparamatros.Create(Application);
              FrmVinculaOrcadoContabilparamatros.ShowModal;
              FreeAndNil(FrmVinculaOrcadoContabilparamatros);
         end;
       except
         on E:Exception do
         begin
           Beep;
           Application.MessageBox(pchar(
                                        'Ocorreu um erro ao carregar parâmetros orçamentários. ' + #13 +
                                        'Favor contatar o suporte. '     + #13 +
                                        ' Tipo:  ORC83AE -  '+ E.Classname + #13 +
                                        E.Message),'Atenção',48);
         end;
       end;

     finally
       
     end;
end;

procedure TFrmVinculaOrcadoDetalhe.btnEscolheDirClick(Sender: TObject);
begin
 dlgCaminho.Directory := pnlPasta.Caption;
   if dlgCaminho.Execute then pnlPasta.Caption := dlgCaminho.Directory;
end;

function TFrmVinculaOrcadoDetalhe.CriarContaEspelho: Boolean;
begin

     Result := false;

     TRY
       with qryAux Do
       begin
            //Contas Orçamentárias
            Sql.Clear;
            Sql.Text := ' DELETE FROM CONTASORCAMEN WHERE IDCONTAORCAMEN = ' + QuotedStr('-1');
            ExecSQL;

            Sql.Clear;
            Sql.Text := 'INSERT INTO CONTASORCAMEN (   ' +
                                  ' IDCONTAORCAMEN,    ' +
                                  ' IDGRUPOORCAMEN,    ' +
                                  ' IDPLANOORCAMEN,    ' +
                                  ' IDPESSOA,          ' +
                                  ' NOMECONTAORCAMEN,  ' +
                                  ' FLGSINALCONTA,     ' + //Sinal da Conta
                                  ' FLGATIVA,          ' + //Ativo
                                  ' CODCENTRORESPON,   ' + //Centro de Responsabilidade
                                  ' TIPOCALCORCADO,    ' + //Tipo Cálculo orcado
                                  ' TIPOCALCREALIZADO, ' + //Tipo Cálculo Realizado
                                  ' FLGACUMULADO,      ' + //Tipo Cálculo Acumulado
                                  ' OBSERVACAO) ' +
                        '(' +
                             ' SELECT ' +
                                      QuotedStr('-1') + ' AS IDCONTAORCAMEN, ' +
                                      ' IDGRUPOORCAMEN, ' +
                                      ' IDPLANOORCAMEN, ' +
                                      IntToStr(Sistema.IdEmpresa) + ',' +
                                      ' NOMEGRUPOORCAMEN AS NOMECONTAORCAMEN, ' +
                                      ' FLGSINALGRUPO AS FLGSINALCONTA, ' + //Sinal da Conta
                                      QuotedStr('A') + ' AS FLGATIVA, ' + //Ativo
                                      QuotedStr(dblkpcmbCODCENTRORESPON.LookupValue) +  ' AS CODCENTRORESPON,   ' + //Centro de Responsabilidade
                                      QuotedStr(dbcboTipoCalcOrc.Value) + ' AS TIPOCALCORCADO,    ' + //Tipo Cálculo orcado
                                      QuotedStr(dbcboTipoCalcReal.Value) + ' AS TIPOCALCREALIZADO, ' + //Tipo Cálculo Realizado
                                      QuotedStr(dbcboCalcValor.Value) + ' AS FLGACUMULADO,      ' + //Tipo Cálculo Acumulado
                                      QuotedStr('Gerado na vinculacao de contas contabeis por grupo') + ' AS OBSERVACAO ' +
                                      ' FROM GRUPOORCAMEN ' +
                                      ' WHERE IDGRUPOORCAMEN = ' + IntToStr(IdGrupoOrcamen) +
                        ')';

            ExecSQL;

            //Composição de Contas Orçamentárias
            Sql.Clear;
            Sql.Text := ' DELETE FROM COMPCONTASORCAMEN WHERE IDCONTAORCAMEN = ' + QuotedStr('-1');
            ExecSQL;


            cdsContabSel.First;

            while not cdsContabSel.eof Do
            begin
                Sql.Clear;
                Sql.Text := ' INSERT INTO COMPCONTASORCAMEN  ' +
                            '        (IDCOMPCONTASORC,IDCONTAORCAMEN,IDPLANOORCAMEN,PLANO,PLACONTA) ' +
                            ' VALUES(' +
                                      QuotedStr('-' + IntToStr(cdsContabSel.RecNo)) + ',' +
                                      QuotedStr('-1') + ',' +
                                      IntToStr(idPlanoOrcamen) + ',' +
                                      cdsContabSel.FieldByName('PLANO').AsString + ',' +
                                      QuotedStr(cdsContabSel.FieldByName('PLACONTA').AsString) +
                            ')';
                ExecSQL;
                cdsContabSel.Next;
            end;
       end;

       Result := true;

     except
         on E:Exception do
         begin
           Beep;
           Application.MessageBox(pchar(
                                        'Ocorreu um erro ao criar contas espelho. ' + #13 +
                                        'Favor contatar o suporte. '     + #13 +
                                        ' Tipo:  ORC83HL -  '+ E.Classname + #13 +
                                        E.Message),'Atenção',48);
         end;

     end;
end;

procedure TFrmVinculaOrcadoDetalhe.Progresso(vParam: array of Variant);
begin
   case vParam[1] of
      0: frmProgresso.MostraFormProgresso(vParam[5],  // Legenda
                                          False,      // Botão Visivel
                                          False,      // Botão Habilitado
                                          True,       // Barra Visível
                                          vParam[2],  // Mínimo
                                          vParam[3]   // Máximo
                                         );
      1: frmProgresso.AndaFormProgresso(vParam[4]);
      2: frmProgresso.EscondeFormProgresso;
   end;

   Application.ProcessMessages;
   Repaint;
end;

end.
