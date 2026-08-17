unit fCadClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ComCtrls, CMTree, Mask, wwdbedit, CmEventosCadastro, ImgList
  {$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmCadClasse = class(TfrmCadastroCS)
    pnlArvore: TPanel;
    pnlTitulo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbeCodigo: TwwDBEdit;
    pnlAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    qryClasse: TwwQuery;
    dsClasse: TwwDataSource;
    qryAux: TwwQuery;
    treeClasse: TCMTreeView;
    dbeDescricao: TwwDBEdit;
    qryClasseIDCLASSEBEM: TFloatField;
    qryClasseCODHIERARQ: TStringField;
    qryClasseANASINT: TStringField;
    qryClasseDESCRICAO: TStringField;
    qryClasseIDGRUPO: TFloatField;
    dbeMaskIdOpc: TwwDBEdit;
    Label4: TLabel;
    qryIDCLASSEBEM: TFloatField;
    qryCODHIERARQ: TStringField;
    qryANASINT: TStringField;
    qryDESCRICAO: TStringField;
    qryMASCARAIDOPCIONAL: TStringField;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label5: TLabel;
    SrcList: TListBox;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    DstList: TListBox;
    Label6: TLabel;
    Label3: TLabel;
    qryGrupo: TwwQuery;
    qryClassexGrupo: TwwQuery;
    qryInsClassexGrupo: TwwQuery;
    FloatField3: TFloatField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    qryRemClassexGrupo: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    qryClassexGrupoIDCLASSEBEM: TFloatField;
    qryClassexGrupoIDGRUPO: TFloatField;
    qryClassexGrupoDESCGRUPO: TStringField;
    qryGrupoIDGRUPO: TFloatField;
    qryGrupoCLASSE: TStringField;
    qryGrupoNOME: TStringField;
    qryGrupoTIPO: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbeCodigoExit(Sender: TObject);
    procedure treeClasseClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure treeClasseChange(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iSoma,ind,iTamMascGrupoBem  : Integer;
    lNivel     : Array [0..20] of Integer;
    sMascPict, sClasseBem, sMascaraClasseBem, sMascaraGrupoBem : String;
    bCorrompido, bMovimento : Boolean;
    bAtualizando : Boolean;
    //------------------------------------------------------------------------------------
    procedure MoveSelected(MyList: TCustomListBox; MyItems: TStrings);
    procedure SetItem(MyList: TListBox; MyIndex: Integer);
    function  GetFirstSelection(MyList: TCustomListBox): Integer;
    procedure SetButtons;
    procedure CarregaListaClassexGrupo;
    procedure GravaListaClassexGrupo(iIdClasseBem : Integer);
    //------------------------------------------------------------------------------------
    procedure AtualizaTree;
    function  MascaraOK(sMascara : String; var sMascPict : String;
                              var lNivel  : Array of Integer;
                              var iSoma : Integer; var ind : Integer) : Boolean;
    function  CalcGrau(sNoAnterior : String;lNivel : Array of Integer;
                       ind : Integer; var sPai : String) : Integer;
    function  Verifica_Node(sNode : String; bNovo : Boolean; Var iGrau : Integer) : boolean;
    function  Tem_Filhos(sNode : String) : boolean;
  end;

var
  frmCadClasse: TfrmCadClasse;

implementation

{$R *.DFM}

uses uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema;

//========================================================================================
procedure TfrmCadClasse.FormCreate(Sender: TObject);
var
   iGrau : Integer;
   sClasseC : String;
begin
   inherited;
   qryClassexGrupo.Prepare;
   qryInsClassexGrupo.Prepare;
   qryRemClassexGrupo.Prepare;
   qryGrupo.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryGrupo.Open;
   //-------------------------------------------------------------------------------------
   with qryAux do
   begin
      Close;
      Sql.Clear;
      Sql.Text := 'SELECT MASCARACLASSE,MASCCODGRUPO,IDPESSOA FROM PARAMETROSCAFMANUT '+
                  'WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);
      Open;
   end;
   //-------------------------------------------------------------------------------------
   sMascaraGrupoBem := qryAux.FieldByName('MASCCODGRUPO').AsString;
   sMascPict := '';
   if not MascaraOK(sMascaraGrupoBem,sMascPict,lNivel,iSoma,ind) then
   begin
      MessageBeep(0);
      ShowMessage('Máscara de Grupo Inválida');
      bbtnSairClick(Self);
      exit;
   end;
   iTamMascGrupoBem := length(trim(sMascaraGrupoBem));
   //-------------------------------------------------------------------------------------
   sMascaraClasseBem := qryAux.FieldByName('MASCARACLASSE').AsString;
   iSoma     := 0;
   ind       := 0;
   sMascPict := '';
   if not MascaraOK(sMascaraClasseBem,sMascPict,lNivel,iSoma,ind) then
   begin
      MessageBeep(0);
      ShowMessage('Máscara de Classe Inválida');
      bbtnSairClick(Self);
      exit;
   end;
   bMovimento := False;
   //-------------------------------------------------------------------------------------
   // Confere se estrutura da árvore está OK
   //-------------------------------------------------------------------------------------
   bCorrompido := False;
   qryClasse.Prepare;
   qryClasse.Open;
   while not qryClasse.EOF do
   begin
      if not Verifica_Node(trim(qryClasseCODHIERARQ.AsString),False,iGrau) then
      begin
         sClasseC := qryClasseCODHIERARQ.AsString;
         bCorrompido := True;
      end;
      qryClasse.Next;
   end;
   //-------------------------------------------------------------------------------------
   if bCorrompido then
   begin
      MsgDlg('A Árvore de Classes está corrompida ('+sClasseC+')','Erro',mtError,[mbOk],0);
      pnlArvore.Enabled := False;
   end;
   //-------------------------------------------------------------------------------------
   qryCODHIERARQ.EditMask := sMascaraClasseBem + ';0; ';
   qry.Prepare;
   qry.Open;
   //-------------------------------------------------------------------------------------
   if not bCorrompido then
   begin
      treeClasse.Mascara := sMascaraClasseBem;
      treeClasse.MontaArvore;
   end;   
   bAtualizando := False;
end;
//========================================================================================
procedure TfrmCadClasse.FormActivate(Sender: TObject);
begin
   inherited;
   Toolbar971.SetFocus;
end;
//========================================================================================
Procedure TfrmCadClasse.AtualizaTree;
begin
   if bbtnSair.Focused then exit;
   //-------------------------------------------------------------------------------------
   bAtualizando := True;
   //-------------------------------------------------------------------------------------
   if not bCorrompido then
   begin
      qryClasse.DisableControls;
      qryClasse.Close;
      qryClasse.Open;
      treeClasse.MontaArvore;
      qryClasse.EnableControls;
   end;   
   //-------------------------------------------------------------------------------------
   if qry.FieldByName('ANASINT').AsString = 'A' then
      sbtnAnalitico.down := True
   else
      sbtnSintetico.down := True;
   //-------------------------------------------------------------------------------------
   CarregaListaClassexGrupo;
   //-------------------------------------------------------------------------------------
   bAtualizando := False;
   sbtnAlterar.Enabled := False;
   sbtnApagar.Enabled := False;
end;
//========================================================================================
procedure TfrmCadClasse.bbtnConfirmarClick(Sender: TObject);
var
   iIdClasseBem : Integer;
   bInsert      : Boolean;
   
begin
   if trim(dbeCodigo.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher o Código da Classe de Bens','Erro',mtError,[mbOk],0);
      dbeCodigo.SetFocus;
      exit;
   {end else
   begin
      if not Verifica_Node(trim(dbeCodigo.Text),True,iGrau) then
      begin
         dbeCodigo.SetFocus;
         exit;
      end;}
   end;
   //-------------------------------------------------------------------------------------
   if trim(dbeDescricao.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher a Descrição.','Erro',mtError,[mbOk],0);
      dbeDescricao.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sbtnAnalitico.down = false) and (sbtnSintetico.down = false) then
   begin
      MsgDlg('Obrigatório Selecionar o Tipo da Classe de Bens','Erro',mtError,[mbOk],0);
      pnlAnaSint.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if qry.FieldByName('IDCLASSEBEM').AsInteger <= 0 then
   begin
      iIdClasseBem := LeUltRegistro(nil,'CLASSEDEBEM');
      qry.FieldByName('IDCLASSEBEM').AsInteger := iIdClasseBem;
   end else
   begin
      iIdClasseBem := qry.FieldByName('IDCLASSEBEM').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   if sbtnAnalitico.down then
      qry.FieldByName('ANASINT').AsString := 'A';
   if sbtnSintetico.down then
      qry.FieldByName('ANASINT').AsString := 'S';
   //-------------------------------------------------------------------------------------
   //pnlAnaSint.Enabled := False;
   //dbeCodigo.Enabled  := False;
   //-------------------------------------------------------------------------------------
   //inherited;
   //-------------------------------------------------------------------------------------
   bInsert := CmeCadastro.RepetirInsert and (CmeCadastro.Operacao = opInserir);
   CmeCadastro.Confirma(Self);
   if CmeCadastro.ConfirmaCadastro then
   begin
       if qry.IsEmpty then
          CmeCadastro.Operacao := opVazio
       else
          CmeCadastro.Operacao := opIdle;
       //---------------------------------------------------------------------------------
       GravaListaClassexGrupo(iIdClasseBem);
       //---------------------------------------------------------------------------------
       if bInsert then
          sbtnInserir.Click
       else
          CmeCadastro.AtualizaBotoes(Self);
   end;
   //-------------------------------------------------------------------------------------
   AtualizaTree;
   bMovimento := sbtnInserir.Down;
end;
//========================================================================================
procedure TfrmCadClasse.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   bMovimento := False;
   AtualizaTree;
end;
//========================================================================================
procedure TfrmCadClasse.qryAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if (bAtualizando) then Exit;
   //-------------------------------------------------------------------------------------
   if qryANASINT.AsString = 'A' then
      sbtnAnalitico.down := True
   else
      sbtnSintetico.down := True;
   //-------------------------------------------------------------------------------------
   CarregaListaClassexGrupo;
end;
//========================================================================================
procedure TfrmCadClasse.dbeCodigoExit(Sender: TObject);
Var
   bOk   : Boolean;
   iGrau : Integer;

begin
   if (bbtnCancelar.focused) then
      exit;
   if (treeClasse.focused) then
   begin
      bbtnCancelar.Click;
      exit;
   end;   
   //-------------------------------------------------------------------------------------
   inherited;
   pnlAnaSint.Enabled := True;
   if trim(dbeCodigo.Text) <> '' then
   begin
      bOk := Verifica_Node(trim(dbeCodigo.Text),True,iGrau);
      if not bOk then
      begin
         dbeCodigo.SetFocus;
         exit;
      end;
      //-------------------------------------------------------------------------------
      if ((iGrau = 1) and ((ind + 1) > 1)) then
      begin
         sbtnSintetico.Down := True;
         sbtnAnalitico.Down := False;
         qry.FieldByName('ANASINT').AsString := 'S';
         pnlAnaSint.Enabled := False;
      end;
      //-------------------------------------------------------------------------------
      if (iGrau = (ind + 1)) then
      begin
         sbtnSintetico.Down := False;
         sbtnAnalitico.Down := True;
         qry.FieldByName('ANASINT').AsString := 'A';
         pnlAnaSint.Enabled := False;
      end;
      //-------------------------------------------------------------------------------
   end;
end;
//========================================================================================
function TfrmCadClasse.Verifica_Node(sNode : String; bNovo : Boolean; Var iGrau : Integer) : boolean;
var
   sPai : String;

begin
   Result := True;
   //-------------------------------------------------------------------------------------
   iGrau := CalcGrau(sNode,lNivel,ind,sPai);
   if iGrau = 0 then
   begin
      MsgDlg('Máscara de Classe Inválida','Erro',mtError,[mbOk],0);
      Result := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if bNovo then
   begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := 'SELECT CODHIERARQ,ANASINT FROM CLASSEDEBEM WHERE CODHIERARQ = ' +
                         qryCODHIERARQ.AsString;
      qryAux.Open;
      if not qryAux.IsEmpty then
      begin
         MsgDlg('Classe ' + qryCODHIERARQ.AsString + ' já Cadastrada',
                'Erro',mtError,[mbOk],0);
         Result := False;
         Exit;
      end;
      qryAux.Close;
   end;
   //-------------------------------------------------------------------------------------
   if (iGrau > 1) then
   begin
      // Verifica se Conta Pai é Sintética
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := 'SELECT CODHIERARQ,ANASINT FROM CLASSEDEBEM WHERE CODHIERARQ = ' + trim(sPai);
      qryAux.Open;
      //----------------------------------------------------------------------------------
      if qryAux.IsEmpty then
      begin // não tem pai
         MsgDlg('A Classe ' + sNode + ' não tem Pai','Erro',mtError,[mbOk],0);
         Result := False;
      end else
      begin
         if qryAux.FieldByName('ANASINT').AsString = 'A' then
         begin // pai é analítico
            MsgDlg('Classe Pai é analítica','Erro',mtError,[mbOk],0);
            Result := False;
         end;
      end;
      qryAux.Close;
   end;
end;
//========================================================================================
function TfrmCadClasse.Tem_Filhos(sNode : String) : boolean;
begin
   if qryANASINT.AsString = 'S' then
   begin
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := ' SELECT CODHIERARQ,ANASINT FROM CLASSEDEBEM ' +
                         ' WHERE (CODHIERARQ LIKE ' + #39 + trim(sNode) + '%' + #39 + ')';
      qryAux.Open;
      //----------------------------------------------------------------------------------
      if qryAux.RecordCount > 1 then
      begin
         Result := True;
      end else
      begin
         Result := False;
      end;
      //----------------------------------------------------------------------------------
      qryAux.Close;
   end else
   begin
      Result := False;
   end;
end;
//========================================================================================
function TfrmCadClasse.MascaraOK(sMascara : String; var sMascPict : String;
                              var lNivel  : Array of Integer;
                              var iSoma : Integer; var ind : Integer) : Boolean;
var
   i : Integer;
begin
   MascaraOK := True;
   lNivel[0] := 1;
   iSoma     := 0;
   sMascPict := copy(sMascara, 1, 1);
   //-------------------------------------------------------------------------------------
   for i := 1 to Length(sMascara) do
   begin
      if i > 1 then
         sMascPict := sMascPict + copy(sMascara,i,1);
      //----------------------------------------------------------------------------------
      if copy(sMascara, i, 1) = '.' then
      begin
         ind := ind + 1;
         lNivel[ind] := i - ind - iSoma;
         iSoma := iSoma + lNivel[ind];
      end;
   end;
   //-------------------------------------------------------------------------------------
   if (ind = 0) and (length(sMascara) > 0) then
   begin
      lNivel[1] := length(sMascara);
      ind := 1;
   end;
   //-------------------------------------------------------------------------------------
   if ind = 0 then
      MascaraOK := False;
   lNivel[ind + 1] := Length(sMascara) - ind - iSoma;
end;
//========================================================================================
function TfrmCadClasse.CalcGrau(sNoAnterior: String; lNivel: Array of Integer;
                              ind: Integer; var sPai: String) : Integer;
var
   i    : Integer;
   iAux : Integer;
   sAux : String;
   lAux : Boolean;
begin
   iAux := 0;
   sAux := '';
   lAux := false;
   Result := 0;
   for i := 1 to (ind + 1) do
   begin
      inc(Result);
      iAux := iAux + lNivel[i];
      if length(sNoAnterior) = iAux then
      begin
         lAux :=True;
         sPai := Copy(sNoAnterior,1,(iAux - lNivel[i]));
         break;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if not lAux then
      CalcGrau := 0;
end;
//========================================================================================
procedure TfrmCadClasse.treeClasseChange(Sender: TObject);
begin
   inherited;
   if not bMovimento then                        //(CmeCadastro.Operacao in [opIdle, opVazio])
   begin
      qry.Locate('IDCLASSEBEM', qryClasseIDCLASSEBEM.AsInteger, []);
      sbtnAlterar.Enabled  := True;
      sbtnApagar.Enabled   := True;
      CmeCadastro.Operacao := opIdle;
   end;
end;
//========================================================================================
procedure TfrmCadClasse.treeClasseClick(Sender: TObject);
begin
   inherited;
   if not bMovimento then                        //(CmeCadastro.Operacao in [opIdle, opVazio])
   begin
      qry.Locate('IDCLASSEBEM', qryClasseIDCLASSEBEM.AsInteger, []);
      sbtnAlterar.Enabled := True;
      sbtnApagar.Enabled  := True;
      CmeCadastro.Operacao    := opIdle;
   end;
end;
//========================================================================================
procedure TfrmCadClasse.CmeCadastroFind(Sender: TObject);
begin
   if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
   begin
      sClasseBem := MontaSelect.ValoresChave[0];
      qryClasse.Locate('IDCLASSEBEM', StrToInt(sClasseBem), []);
      qry.Locate('IDCLASSEBEM', StrToInt(sClasseBem), []);
   end;
end;
//========================================================================================
procedure TfrmCadClasse.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   bMovimento := True;
   dbeCodigo.Enabled := True;
   dbeCodigo.SetFocus;
end;
//========================================================================================
procedure TfrmCadClasse.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   bMovimento := True;
   dbeDescricao.SetFocus;
end;
//========================================================================================
procedure TfrmCadClasse.sbtnApagarClick(Sender: TObject);
begin
   bMovimento := True;
   if not Tem_Filhos(qryCODHIERARQ.AsString) then
   begin
      qryRemClassexGrupo.ParamByName('PIDCLASSEBEM').AsInteger := qryIDCLASSEBEM.AsInteger;
      qryRemClassexGrupo.ExecSQL;
      inherited;
      AtualizaTree;
   end else
   begin
      MsgDlg('Esta classe possui filhos','Erro',mtError,[mbOk],0);
      CmeCadastro.Operacao := opIdle;
      CmeCadastro.AtualizaBotoes(Self);
   end;
   bMovimento := False;
end;
//========================================================================================
procedure TfrmCadClasse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qry.UnPrepare;
   qryClasse.Close;
   qryClasse.UnPrepare;
   qryGrupo.Close;
   qryGrupo.UnPrepare;
   qryClassexGrupo.Close;
   qryClassexGrupo.UnPrepare;
   qryInsClassexGrupo.UnPrepare;
   qryRemClassexGrupo.UnPrepare;
end;
//========================================================================================
// Manipulação da Dual List Box
//========================================================================================
procedure TfrmCadClasse.CarregaListaClassexGrupo;
var
   iPos : Integer;
   sCodGrupo,sDescGrupo, sIdGrupo : String;

begin
   inherited;
   SrcList.Clear;
   DstList.Clear;
   //-------------------------------------------------------------------------------------
   qryClassexGrupo.Close;
   qryClassexGrupo.ParamByName('PIDCLASSEBEM').AsInteger := qryIDCLASSEBEM.AsInteger;
   qryClassexGrupo.Open;
   qryGrupo.First;
   while not qryGrupo.EOF do
   begin
      sCodGrupo := '';
      for iPos := 1 to iTamMascGrupoBem do
      begin
         if iPos <= length(qryGrupoCLASSE.AsString) then
            sCodGrupo := sCodGrupo + copy(qryGrupo.FieldByName('CLASSE').AsString, iPos, 1)
         else
            sCodGrupo := sCodGrupo + ' ';
      end;
      //----------------------------------------------------------------------------------
      sDescGrupo := '';
      for iPos := 1 to 40 do
      begin
         if iPos <= length(qryGrupoNOME.AsString) then
            sDescGrupo := sDescGrupo + copy(qryGrupo.FieldByName('NOME').AsString, iPos, 1)
         else
            sDescGrupo := sDescGrupo + ' ';
      end;
      //----------------------------------------------------------------------------------
      sIdGrupo := '';
      for iPos := 1 to 38 do
      begin
         if iPos <= length(qryGrupoIDGRUPO.AsString) then
            sIdGrupo := sIdGrupo + copy(qryGrupo.FieldByName('IDGRUPO').AsString, iPos, 1)
         else
            sIdGrupo := sIdGrupo + ' ';
      end;
      //----------------------------------------------------------------------------------
      if qryClassexGrupo.Locate('IDGRUPO', qryGrupoIDGRUPO.AsInteger, []) then
         DstList.Items.Add(sCodGrupo + ' ' + sDescGrupo + ' ' + sIdGrupo)
      else
         SrcList.Items.Add(sCodGrupo + ' ' + sDescGrupo + ' ' + sIdGrupo);
      //----------------------------------------------------------------------------------
      qryGrupo.Next;
   end;
   SetItem(SrcList,0);
   SetItem(DstList,0);
end;
//========================================================================================
procedure TfrmCadClasse.GravaListaClassexGrupo(iIdClasseBem : Integer);
var
   iListPos   : Integer;
   bTransacao : Boolean;

begin
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
   begin
      bTransacao := False;
   end;
   //-------------------------------------------------------------------------------------
   try
      qryClassexGrupo.Close;
      qryClassexGrupo.ParamByName('PIDCLASSEBEM').AsInteger := iIdClasseBem;
      qryClassexGrupo.Open;
      //----------------------------------------------------------------------------------
      if not qryClassexGrupo.IsEmpty then
      begin
         qryRemClassexGrupo.ParamByName('PIDCLASSEBEM').AsInteger := iIdClasseBem;
         qryRemClassexGrupo.ExecSQL;
      end;
      //----------------------------------------------------------------------------------
      iListPos := 0;
      while (iListPos <= (DstList.Items.Count - 1)) do
      begin
         qryInsClassexGrupo.ParamByName('PIDCLASSEBEM').AsInteger := iIdClasseBem;
         qryInsClassexGrupo.ParamByName('PIDGRUPO').AsString      := trim(copy(DstList.Items.Strings[iListPos],iTamMascGrupoBem + 42,38));
         qryInsClassexGrupo.ExecSQL;
         iListPos := iListPos + 1;
      end;
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
   except
      if bTransacao then
         RollBackTransacao;
   end;
end;
//========================================================================================
procedure TfrmCadClasse.IncludeBtnClick(Sender: TObject);
var
   Index: Integer;

begin
   inherited;
   Index := GetFirstSelection(SrcList);
   MoveSelected(SrcList, DstList.Items);
   SetItem(SrcList, Index);
end;
//========================================================================================
function TfrmCadClasse.GetFirstSelection(MyList: TCustomListBox): Integer;
begin
   for Result := 0 to MyList.Items.Count - 1 do
     if MyList.Selected[Result] then Exit;
   Result := LB_ERR;
end;
//========================================================================================
procedure TfrmCadClasse.MoveSelected(MyList: TCustomListBox; MyItems: TStrings);
var
   I: Integer;
begin
   for I := MyList.Items.Count - 1 downto 0 do
      if MyList.Selected[I] then
      begin
         MyItems.AddObject(MyList.Items[I], MyList.Items.Objects[I]);
         MyList.Items.Delete(I);
      end;
end;
//========================================================================================
procedure TfrmCadClasse.SetItem(MyList: TListBox; MyIndex: Integer);
var
   MaxIndex: Integer;
begin
   with MyList do
   begin
      if CanFocus then SetFocus;
      MaxIndex := Items.Count - 1;
      if MyIndex = LB_ERR then MyIndex := 0
      else if MyIndex > MaxIndex then MyIndex := MaxIndex;
      Selected[MyIndex] := True;
   end;
   SetButtons;
end;
//========================================================================================
procedure TfrmCadClasse.ExcludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   inherited;
   Index := GetFirstSelection(DstList);
   MoveSelected(DstList, SrcList.Items);
   SetItem(DstList, Index);
end;
//========================================================================================
procedure TfrmCadClasse.IncAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   inherited;
   for I := 0 to SrcList.Items.Count - 1 do
     DstList.Items.AddObject(SrcList.Items[I], SrcList.Items.Objects[I]);
   SrcList.Items.Clear;
   SetItem(SrcList, 0);
end;
//========================================================================================
procedure TfrmCadClasse.ExAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   inherited;
   for I := 0 to DstList.Items.Count - 1 do
      SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
   DstList.Items.Clear;
   SetItem(DstList, 0);
end;
//========================================================================================
procedure TfrmCadClasse.SetButtons;
var
   SrcEmpty, DstEmpty: Boolean;
begin
   SrcEmpty := SrcList.Items.Count = 0;
   DstEmpty := DstList.Items.Count = 0;
   IncludeBtn.Enabled := not SrcEmpty;
   IncAllBtn.Enabled := not SrcEmpty;
   ExcludeBtn.Enabled := not DstEmpty;
   ExAllBtn.Enabled := not DstEmpty;
end;
//========================================================================================
procedure TfrmCadClasse.sbtnProcurarClick(Sender: TObject);
var
   sClasse : String;

begin
   inherited;
   if (MontaSelect.RetornouValor) then
   begin
      sClasse := MontaSelect.ValoresChave[0];
      if qryClasse.Locate('IDCLASSEBEM', sClasse, []) then
         qry.Locate('IDCLASSEBEM', sClasse, []);
      CarregaListaClassexGrupo;
   end;
end;

procedure TfrmCadClasse.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   case CmeCadastro.Operacao of
      opInserir :
         if not Sistema.GravaLogOperacoes('Inclusão de Classes de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opAlterar :
         if not Sistema.GravaLogOperacoes('Alteração de Classes de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opApagar :
         if not Sistema.GravaLogOperacoes('Remoção de Classes de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
   end;
end;

end.
