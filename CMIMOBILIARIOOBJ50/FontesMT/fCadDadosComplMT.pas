{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                            CM Soluções Informática

                     CADASTRO DE DADOS COMPLEMENTARES  (MT)

Módulo       : AdminImob ( Administração Imobiliária )
Responsável  : Daniel Simões
Data Término : 11/12/2006

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadDadosComplMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  ComCtrls, uCMTreeViewMT, DBCtrls, Mask, wwdbedit,

  CMTree, DBTables, uCtrlPadroes, uCmTypes, CMProcura, uCtrlParamImovel,
  uCtrlModuloImobiliario, uCtrlOutroDado, uComunsImobiliario, uCmSqlParams,
  Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, TabControlDetalhe;

type
  {TItem - Responsável por criar os registros em tempo de execução a serem
           carregados para dentro da árvore...}
  TItem = record
    CodCompl   : string;
    Descricao  : string;
    FlgAnaSint : string;
    TipoDado   : string;
    Opcoes     : string;
  end;

  pItem = ^TItem;

  TfrmCadDadosComplMT = class(TFrmCadastroMT)
    pnlArvore: TPanel;
    pnlDadosCompl: TPanel;
    pnlTitulo: TPanel;
    LbLDadosComplemento: TLabel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    dbedCod: TwwDBEdit;
    dbedDescricao: TDBEdit;
    pnAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    DBrdgTipoDado: TDBRadioGroup;
    dbmOpcoes: TDBMemo;
    lblOpcoes: TLabel;
    TreeTipoComplemento: TTreeView;
    CMSqlParams1: TCMSqlParams;
    CdsIDOUTRODADO: TFloatField;
    CdsODODESCRICAO: TStringField;
    CdsANASINT: TStringField;
    CdsCODCOMPL: TStringField;
    CdsTIPODADO: TStringField;
    CdsOPCOES: TMemoField;
    imgTreeView: TImageList;
    tbcDetalhe: TTabControlDetalhe;
    pnlControlesDet: TPanel;
    Label1: TLabel;
    cmpTipoImovel: TCMProcura;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    CmeDetalhe: TCmEventosCadastro;
    dsDet: TwwDataSource;
    MS_TipoImovel: TMontaSelect;
    CdsDet: TCMClientDataSet;
    CdsFLGORIGEM: TStringField;
    dbgrdDet: TwwDBGrid;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure TreeTipoComplementoChange(Sender: TObject; Node: TTreeNode);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure sbtnAnaliticoClick(Sender: TObject);
    procedure sbtnSinteticoClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBrdgTipoDadoChange(Sender: TObject);
  private
    { Private declarations }

    CtrlModuloImobiliario : TCtrlModuloImobiliario;
    CtrlOutroDado         : TCtrlOutroDado;

    sMascara        : String;
    sFiltro         : String;
    bMontandoArvore : Boolean;
    fComplemento    : Extended;

    procedure MontaArvore(iIdEmpresa:Integer; fIdOutroDado:Double; sMascara:String);
    procedure InserePapel(Arvore:TTreeView; NoDestino:TTreeNode; pDesc:pItem);
    procedure FazerVoltarDet;
    procedure MudaDadosArvore;

    function RetornaCod(sCod:String): String;
    function InserePasta(bEumaPasta:Boolean; Arvore:TTreeView; NoDestino:TTreeNode; pDesc:pItem): TTreeNode;
    function AcharNo(sCod:String): Boolean;
    function VerificaMestre: Boolean;

  public
    { Public declarations }
    FlgOrigem : String;
  end;

var
  frmCadDadosComplMT: TfrmCadDadosComplMT;

implementation

uses uSistema, uMensErro, uAutorizacao, DBaseDados, uCtrlParamIntegra, uString,
     uDataBase, DImobiliario, uModuloImobiliario;

{$R *.DFM}

procedure TfrmCadDadosComplMT.MudaDadosArvore;
begin
  if not (bMontandoArvore) then
    Cds.Locate('CODCOMPL',pItem(TreeTipoComplemento.Selected.Data)^.CodCompl,[]);
    CdsDet.Data := CtrlOutroDado.LookupOutroDadoXTipoImo(CdsIDOUTRODADO.AsInteger);
  begin
    if (Cds.FieldByName('ANASINT').AsString='A') then begin
      sbtnAnalitico.Down := True;
      tbcDetalhe.Enabled := True;
    end else begin
      if (Cds.FieldByName('ANASINT').AsString='S') then begin
        sbtnSintetico.Down    := True;
        tbcDetalhe.Enabled    := False;
      end;
    end;
  end;

  if (TreeTipoComplemento.Items.Count>0) then begin
    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := True;
    sbtnApagar.Enabled  := True;
  end else begin
    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := False;
    sbtnApagar.Enabled  := False;
  end;

  if (CdsDet.RecordCount>0) then begin
    sbtnInsDet.Enabled    := True;
    sbtnAltDet.Enabled    := True;
    sbtnExcluiDet.Enabled := True;
  end else begin
    sbtnInsDet.Enabled    := True;
    sbtnAltDet.Enabled    := False;
    sbtnExcluiDet.Enabled := False;
  end;
end;

procedure TfrmCadDadosComplMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;
  CtrlOutroDado         := TCtrlOutroDado.Create;

  CtrlModuloImobiliario.InitializeAs(Padroes);
  CtrlOutroDado.InitializeAs(Padroes);

  CtrlOutroDado.CdsOutroDado         := Cds;
  CtrlOutroDado.CdsOutroDadoXTipoImo := CdsDet;

  dtmImobiliario.qryParamImob.Close;
  dtmImobiliario.qryParamImob.Prepare;
  dtmImobiliario.qryParamImob.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
  dtmImobiliario.qryParamImob.Open;

  sMascara := ModuloImobiliario.AdminImob.MascaraCompl;

  dtmImobiliario.qryParamImob.Close;
end;

procedure TfrmCadDadosComplMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  if not (bMontandoArvore) then begin
    if (sbtnAnalitico.Down=True) then
      Cds.FieldByName('ANASINT').AsString := 'A'
    else
      if (sbtnSintetico.Down=True) then
        Cds.FieldByName('ANASINT').AsString := 'S';
  end;

  Accept := CtrlOutroDado.GravaOutroDado;

  if (Accept) then
    MontaArvore(Sistema.IdEmpresa,CdsIDOUTRODADO.AsInteger,'');

end;

procedure TfrmCadDadosComplMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;

  MsgDlg(CtrlOutroDado.MessageInfo,'Erro',mtError,[mbOK],0);
  Repaint;
end;

procedure TfrmCadDadosComplMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if (Cds.State in dsEditModes) then begin
     pnlFundo.Enabled      := True;
     pnlArvore.Enabled     := False;
     pnlDadosCompl.Enabled := True;

     sbtnInserir.Enabled   := False;
     sbtnAlterar.Enabled   := False;
     sbtnApagar.Enabled    := False;
  end else begin
     pnlFundo.Enabled      := True;
     pnlArvore.Enabled     := True;
     pnlDadosCompl.Enabled := False;
  end;
end;

procedure TfrmCadDadosComplMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  if (dbedDescricao.CanFocus) then
    dbedDescricao.SetFocus;

end;

procedure TfrmCadDadosComplMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if (MontaSelect.RetornouValor) then begin
    Cds.Locate('IDOUTRODADO',MontaSelect.ValoresChave[0],[loPartialKey]);
    AcharNo(Cds.FieldByName('CODCOMPL').AsString);
  end;

  Repaint;
end;

procedure TfrmCadDadosComplMT.MontaArvore(iIdEmpresa:Integer; fIdOutroDado:Double; sMascara:String);
var ItemNo      : pItem;
    No          : TTreeNode;
    sCodPaiGrup : string;
begin

   Cds.Data := CtrlOutroDado.LookupOutroDado('',-1,FlgOrigem);

   try
     TreeTipoComplemento.Items.Clear;
     No              := TreeTipoComplemento.Items.GetFirstNode;
     bMontandoArvore := True;

     Cds.DisableControls;
     Cds.First;

     sCodPaiGrup := Cds.FieldByName('CODCOMPL').AsString;

     while not Cds.Eof do begin
       New(ItemNo);
       ItemNo.CodCompl   := Cds.FieldByName('CODCOMPL').AsString;
       ItemNo.Descricao  := RetornaCod(Cds.FieldByName('CODCOMPL').DisplayText)+' - '+Cds.FieldByName('ODODESCRICAO').AsString;
       ItemNo.FlgAnaSint := Cds.FieldByName('ANASINT').AsString;


       if ( No<>nil ) then begin
         while pItem(No.Data)^.CodCompl<>Copy(Cds.FieldByName('CODCOMPL').AsString,1,Length(pItem(No.Data)^.CodCompl)) do
         begin
           if ( sCodPaiGrup=Copy(Cds.FieldByName('CODCOMPL').AsString,1,Length(sCodPaiGrup)) ) then
             No := No.Parent
           else begin
             sCodPaiGrup := Cds.FieldByName('CODCOMPL').AsString;
             No          := nil;
             Break;
           end;
         end;
       end;

       if ( ItemNo.FlgAnaSint='S' ) then
         No := InserePasta(False,TreeTipoComplemento,No,ItemNo)
       else
         InserePapel(TreeTipoComplemento,No,ItemNo);

       Cds.Next;
     end;

   finally
      bMontandoArvore := False;
      ItemNo          := nil;

      Cds.EnableControls;
   end;
end;

function TfrmCadDadosComplMT.RetornaCod(sCod: String): String;
var i: Integer;
begin
   for i := Length(sCod) downto 1 do begin
     if sCod[i] in ['0'..'9'] then begin
       Result := Copy(sCod,1,i);
       Break
     end;
   end;
end;

procedure TfrmCadDadosComplMT.InserePapel(Arvore:TTreeView; NoDestino:TTreeNode; pDesc:pItem);
var No: TTreeNode;
begin
  No               := Arvore.Items.AddChildObject(NoDestino,pDesc.Descricao,pDesc);
  No.ImageIndex    := 2;
  No.SelectedIndex := 3;
end;

function TfrmCadDadosComplMT.InserePasta(bEumaPasta:Boolean; Arvore:TTreeView; NoDestino:TTreeNode; pDesc:pItem): TTreeNode;
var No: TTreeNode;
begin
  if ( bEumaPasta ) then
    No := Arvore.Items.AddObject(NoDestino,pDesc.Descricao,pDesc)
  else
    No := Arvore.Items.AddChildObject(NoDestino,pDesc.Descricao,pDesc);

  No.ImageIndex    := 0;
  No.SelectedIndex := 1;

  Result           := No;
end;

function TfrmCadDadosComplMT.AcharNo(sCod: String): Boolean;
var No: TTreeNode;
begin
  No := TreeTipoComplemento.Items.GetFirstNode;

  if ( No<>nil ) then begin
    while (Trim(pItem(No.Data)^.CodCompl)<>Trim(sCod)) do begin
      if Trim(pItem(No.Data)^.CodCompl)=Copy(sCod,1,Length(pItem(No.Data)^.CodCompl)) then
        No := No.GetNext
      else
        No := No.GetNextSibling;

      if (No=nil) then
        Break;
    end;
  end;

  Result := (No<>nil);
end;

function TfrmCadDadosComplMT.VerificaMestre: Boolean;
begin
  if (Cds.Active) then begin
    if (Cds.State in ([dsInsert,dsEdit]) ) then
      Result := True
    else
      if (Cds.IsEmpty) then
        Result := False
      else
        Result := True;
  end else
    Result := False;
end;

procedure TfrmCadDadosComplMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlModuloImobiliario);
  FreeAndNil(CtrlOutroDado);

  inherited;
end;

procedure TfrmCadDadosComplMT.TreeTipoComplementoChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;

  MudaDadosArvore;
end;

procedure TfrmCadDadosComplMT.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  if (CdsDet.State in [dsInsert,dsEdit]) then begin
    CdsDet.FieldByName('CODTIPIMOVEL').AsString := cmpTipoImovel.Text;

  end;
end;

procedure TfrmCadDadosComplMT.CmeDetalheAtualizaBotoes(Sender: TObject);
var lTemReg : Boolean;
begin
  inherited;

  if (CdsDet<>nil) then begin
    sbtnInsDet.Down := (CdsDet.State = dsInsert);
    sbtnAltDet.Down := (CdsDet.State = dsEdit);
  end;

  if (CmeCadastro.Operacao in [opInserir,opAlterar]) and (VerificaMestre) then begin
    if (CdsDet<>nil) and (not CdsDet.IsEmpty) then
      lTemReg := True
    else
      lTemReg := False;

    sbtnInsDet.Enabled    := (not sbtnAltDet.Down);
    sbtnAltDet.Enabled    := lTemReg and (not sbtnInsDet.Down);
    sbtnExcluiDet.Enabled := lTemReg and (not sbtnInsDet.Down) and (not sbtnAltDet.Down);
  end else begin
    sbtnInsDet.Enabled    := False;
    sbtnAltDet.Enabled    := False;
    sbtnExcluiDet.Enabled := False;
  end;

  AutorizarForm(afSoDesabilitar);
end;

procedure TfrmCadDadosComplMT.CmeDetalheCancel(Sender: TObject);
begin
  inherited;

  if (CdsDet<>nil) then begin
    CdsDet.Cancel;
    dbgrdDet.BringToFront;
  end;

  tb97Detalhe.Visible := False;
  CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadDadosComplMT.CmeDetalheConfirma(Sender: TObject);
var bRepete : Boolean;
begin
  //inherited;

  if (CdsDet<>nil) and (CdsDet.State in [dsInsert,dsEdit]) then begin
    bRepete := (CmeDetalhe.RepetirInsert) and (cdsDet.State=dsInsert);

    try
      if cdsDet.State = dsInsert then
        CdsDet.FieldByName('IDOUTRODADO').AsInteger := cds.FieldByName('IDOUTRODADO').AsInteger;

      CdsDet.Post;

      if (bRepete) then
        CmeDetalhe.Insert(Self)
      else
        FazerVoltarDet;
    except end;

    CmeDetalhe.Atualizabotoes(Self);
  end;
end;

procedure TfrmCadDadosComplMT.FazerVoltarDet;
begin
  if (CdsDet<>nil) and (CdsDet.State in [dsEdit,dsInsert]) then
    CdsDet.Cancel;

  tb97Detalhe.Visible := False;

  if (dbgrdDet<>nil) then
    dbgrdDet.BringToFront;

  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadDadosComplMT.CmeDetalheDelete(Sender: TObject);
begin
  inherited;

  CdsDet.Delete;
  bbtnOkDetClick(Self);
end;

procedure TfrmCadDadosComplMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;

  CdsDet.Edit;
end;

procedure TfrmCadDadosComplMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  CdsDet.Insert;
end;

procedure TfrmCadDadosComplMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;

  if (sbtnInsDet.Down) then begin
    dbgrdDet.SendToBack;
    tb97Detalhe.Visible := True;

    CmeDetalhe.Insert(Self);
    CmeDetalhe.Atualizabotoes(Self);
    CmeDetalhe.Operacao := OpInserir;
  end else
    sbtnInsDet.Down := True;
end;

procedure TfrmCadDadosComplMT.sbtnAltDetClick(Sender: TObject);
begin
  inherited;

  if (sbtnAltDet.Down) then begin
    dbgrdDet.SendToBack;
    tb97Detalhe.Visible := True;

    CmeDetalhe.Edit(Self);
    CmeDetalhe.Atualizabotoes(Self);
    CmeDetalhe.Operacao := OpAlterar;
  end else
    sbtnAltDet.Down := True;
end;

procedure TfrmCadDadosComplMT.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;

  CmeDetalhe.Operacao := OpApagar;
  CmeDetalhe.Delete(Self);
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadDadosComplMT.bbtnOkDetClick(Sender: TObject);
begin
  inherited;

  CmeDetalhe.Confirma(Self);
end;

procedure TfrmCadDadosComplMT.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;

  CmeDetalhe.Cancel(Self);
end;

procedure TfrmCadDadosComplMT.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;

  FazerVoltarDet;
end;

procedure TfrmCadDadosComplMT.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;

  if (CmeCadastro.Operacao in [OpInserir,OpAlterar]) then
    if (dbgrdDet.DataSource.DataSet.IsEmpty) then
      sbtnInsDet.Click
    else
      sbtnAltDet.Click;
end;

procedure TfrmCadDadosComplMT.tbcDetalheChange(Sender: TObject);
begin
  inherited;

  if (tbcDetalhe.detdbGrids.Count>0) then begin
    dbgrdDet := TwwDBGrid(TComponent(Sender).Owner.FindComponent(tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex]));

    if (dbgrdDet<>nil) then
      CdsDet := TCMClientDataSet(dbgrdDet.DataSource.DataSet)
    else
      CdsDet := nil;

    if (tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex]='') then
      tb97BotoesDetalhe.Visible := False
    else
      tb97BotoesDetalhe.Visible := True;

    bbtnVoltarDetClick(Self);
  end;
end;

procedure TfrmCadDadosComplMT.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
var mResult                 : TModalResult;
    sEstado, sEstadoCaption : String;
begin
  inherited;

  if (CdsDet<>nil) and (CdsDet.State in [dsInsert,dsEdit]) then begin
    if (CdsDet.State in [dsInsert]) then begin
      sEstado        := 'inclusão';
      sEstadoCaption := 'Inclusão';
    end else begin
      sEstado        := 'alteração';
      sEstadoCaption := 'Alteração';
    end;

    mResult := MsgDlg('Você está tentando mudar de pasta sem confirmar a '+sEstado+' de '+tbcDetalhe.Tabs[tbcDetalhe.TabIndex]+'.'+#13+#10+
                      'Confirma a '+sEstado+' de '+tbcDetalhe.Tabs[tbcDetalhe.TabIndex]+'?',sEstadoCaption+
                      ' não confirmada',mtConfirmation,[mbYes,mbNo,mbCancel],0);
    try
      if (mResult=mrYes) then begin
        CmeDetalhe.RepetirInsert := False;
        bbtnOkDet.Click;
        CmeDetalhe.RepetirInsert := True;
      end else
        if (mResult=mrNo) then
          bbtnCancelarDet.Click
        else
          if (mResult=mrCancel) then
            AllowChange := False;
    except end;
  end;
end;

procedure TfrmCadDadosComplMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

  FazerVoltarDet;
  inherited;
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadDadosComplMT.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if not (bMontandoArvore) then begin
    if (Cds.FieldByName('ANASINT').AsString='A') then begin
      sbtnAnalitico.Down := True;
    end else begin
      if (Cds.FieldByName('ANASINT').AsString='S') then begin
        sbtnSintetico.Down := True;
      end;
    end;
  end;
end;

procedure TfrmCadDadosComplMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  CdsDet.Data                              := CtrlOutroDado.LookupOutroDadoXTipoImo(-1);
  Cds.FieldByName('IDOUTRODADO').AsInteger := CtrlOutroDado.GetNextID;
  Cds.FieldByName('FLGORIGEM').AsString    := FlgOrigem;
  Cds.FieldByName('TIPODADO').AsString     := 'C';
  DBrdgTipoDado.ItemIndex := 0;   
end;

procedure TfrmCadDadosComplMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlOutroDado.ExcluiOutroDado;

  if Accept then begin
     TreeTipoComplemento.Selected.Delete;
     MontaArvore(Sistema.IdEmpresa,CdsIDOUTRODADO.AsInteger,'');
  end;
end;

procedure TfrmCadDadosComplMT.FormShow(Sender: TObject);
 begin
  inherited;

  case FlgOrigem[1] of
    'I': Caption := 'Cadastro de Dados Complementares de Imóveis';
    'C': Caption := 'Cadastro de Dados Complementares de Contratos';
    'U': Caption := 'Cadastro de Dados Complementares de Unidades';
  end;

  bMontandoArvore := False;
    
  pnlControlesDet.SendToBack;

  if (FlgOrigem='C') then
    tbcDetalhe.Visible := False;

  try
    Cds.Data                             := CtrlOutroDado.LookupOutroDado('',-1,FlgOrigem);
    Cds.FieldByName('CODCOMPL').EditMask := sMascara+';0;';
    MontaArvore(Sistema.IdEmpresa,CdsIDOUTRODADO.AsInteger,sMascara);

    if not Cds.IsEmpty then CmeCadastro.Operacao := OpIdle;
  except
    raise;
  end;
end;

procedure TfrmCadDadosComplMT.sbtnAnaliticoClick(Sender: TObject);
begin
  inherited;

  tbcDetalhe.Enabled := True;
end;

procedure TfrmCadDadosComplMT.sbtnSinteticoClick(Sender: TObject);
begin
  inherited;

  tbcDetalhe.Enabled := False;
end;

procedure TfrmCadDadosComplMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;

  if (sbtnSintetico.Down=True) then
     tbcDetalhe.Enabled := False
  else
     tbcDetalhe.Enabled := True;
end;

procedure TfrmCadDadosComplMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  if (Cds.State in dsEditModes) then
    MudaDadosArvore;
end;

procedure TfrmCadDadosComplMT.DBrdgTipoDadoChange(Sender: TObject);
var sConteudo : String;
begin
  inherited;

  if (DBrdgTipoDado.ItemIndex=3) then
    dbmOpcoes.Enabled := True
  else
    dbmOpcoes.Enabled := False;
end;

end.
