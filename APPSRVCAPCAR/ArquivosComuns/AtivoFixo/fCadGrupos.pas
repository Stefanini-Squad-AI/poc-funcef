unit fCadGrupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ComCtrls, CMTree, DBCtrls, TREdit, Mask, wwdbedit,
  CmEventosCadastro, ImgList{$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmCadGrupos = class(TfrmCadastroCS)
    pnlArvore: TPanel;
    pnlTitulo: TPanel;
    Label4: TLabel;
    updGrupoEmpresa: TUpdateSQL;
    qryGrupoEmpresa: TwwQuery;
    qryAux: TwwQuery;
    qryMoeda: TwwQuery;
    Label1: TLabel;
    dbedCod: TwwDBEdit;
    dbeDescricao: TwwDBEdit;
    Label2: TLabel;
    pnlAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    qrpParametros: TGroupBox;
    Label3: TLabel;
    Label7: TLabel;
    dbedaprec: TDBRealEdit;
    rdgrpstatus: TDBRadioGroup;
    rdgrpControle: TDBRadioGroup;
    qryMoedaMOECODIGO: TFloatField;
    qryMoedaMOEDESC: TStringField;
    qryGrupoEmpresaIDGRUPO: TFloatField;
    qryGrupoEmpresaIDPESSOA: TFloatField;
    qryGrupos: TwwQuery;
    dsGrupos: TwwDataSource;
    treeGrupos: TCMTreeView;
    qryGrupoBem: TwwQuery;
    qryGrupoBemBENSNOGRUPO: TFloatField;
    qryIDGRUPO: TFloatField;
    qryCLASSE: TStringField;
    qryNOME: TStringField;
    qryTIPO: TStringField;
    qrySTATUS: TStringField;
    qryDEPRECIACAO: TFloatField;
    qryDATAULTDEP: TDateTimeField;
    qryFLGIMOVEL: TFloatField;
    grpboxPlacaOpcional: TGroupBox;
    dbckbSemPlaca: TDBCheckBox;
    qryFLGSEMPLACA: TFloatField;
    Label5: TLabel;
    SrcList: TListBox;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    Label6: TLabel;
    DstList: TListBox;
    qryCentroCusto: TwwQuery;
    qryCentroCustoCODCENTROCUSTO: TStringField;
    qryCentroCustoNOME: TStringField;
    qryCentroCustoSTATUSGRUPOCDC: TStringField;
    qryCentroCustoIDEMPRESA: TFloatField;
    qryGrupoxCC: TwwQuery;
    qryGrupoxCCIDGRUPO: TFloatField;
    qryGrupoxCCCODCENTROCUSTO: TStringField;
    qryGrupoxCCIDEMPRESA: TFloatField;
    qryGrupoxCCDESCGRUPO: TStringField;
    qryGrupoxCCDESCCCUSTO: TStringField;
    qryInsGrupoxCC: TwwQuery;
    FloatField3: TFloatField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    qryRemGrupoxCC: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    qryGruposIDGRUPO: TFloatField;
    qryGruposCLASSE: TStringField;
    qryGruposNOME: TStringField;
    qryGruposTIPO: TStringField;
    qryGruposSTATUS: TStringField;
    qryGruposDEPRECIACAO: TFloatField;
    qryGruposDATAULTDEP: TDateTimeField;
    qryGruposFLGIMOVEL: TFloatField;
    qryGruposIDPESSOA: TFloatField;
    qryIDPESSOA: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure dbedCodExit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure treeGruposClick(Sender: TObject);
    procedure treeGruposChange(Sender: TObject);
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
    iSoma, ind, iLen : Integer;
    lNivel    : Array [0..20] of Integer;
    sMascPict, sMascaraGrupo : String;
    bCorrompido : Boolean;
    bAtualizando : Boolean;
    //------------------------------------------------------------------------------------

    procedure AtualizaTree;
    function  MascaraOK(sMascara : String; var sMascPict : String;
                        var lNivel  : Array of Integer;
                        var iSoma : Integer; var ind : Integer) : Boolean;
    function  CalcGrau(sNoAnterior : String;lNivel : Array of Integer;
                       ind : Integer; var sPai : String) : Integer;
    function  Verifica_Node(sNode : String; bNovo : Boolean; Var iGrau : Integer) : boolean;
    function  Tem_Filhos(sNode : String) : boolean;
    //------------------------------------------------------------------------------------
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function  GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure CarregaListaGrupoxCC;
    procedure GravaListaGrupoxCC(iIdGrupo : Integer);
  end;

var
  frmCadGrupos: TfrmCadGrupos;

implementation

{$R *.DFM}

uses uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema;

//========================================================================================
procedure TfrmCadGrupos.FormCreate(Sender: TObject);
var
   iGrau : Integer;
begin
   inherited;
   //-------------------------------------------------------------------------------------
   qryCentroCusto.Prepare;
   qryGrupoxCC.Prepare;
   qryInsGrupoxCC.Prepare;
   qryRemGrupoxCC.Prepare;
   //-------------------------------------------------------------------------------------
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MASCCODGRUPO,IDPESSOA ' +
                  'FROM PARAMETROSCAFMANUT WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa);
      Open;
   end;
   //-------------------------------------------------------------------------------------
   sMascaraGrupo := qryAux.FieldByName('MASCCODGRUPO').AsString;
   sMascPict := '';
   if not MascaraOK(sMascaraGrupo,sMascPict,lNivel,iSoma,ind) then
   begin
      MessageBeep(0);
      ShowMessage('Máscara de Grupo Inválida');
      bbtnSairClick(Self);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   MontaSelect.Tabelas.Add('PLANOGRUPO');
   MontaSelect.Filtro.Add('PLANOGRUPO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   MontaSelect.Filtro.Add('PLANOGRUPO.IDGRUPO = GRUPO.IDGRUPO');
   //-------------------------------------------------------------------------------------
   // Confere se estrutura da árvore está OK
   //-------------------------------------------------------------------------------------
   bCorrompido := False;
   qryGrupos.Prepare;
   qryGrupos.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryGrupos.Open;
   while not qryGrupos.EOF do
   begin
      if not Verifica_Node(trim(qryGruposCLASSE.AsString),False,iGrau) then
      begin
         bCorrompido := True;
      end;
      qryGrupos.next;
   end;
   //-------------------------------------------------------------------------------------
   if bCorrompido then
   begin
      MsgDlg('A Árvore de Grupos está corrompida','Erro',mtError,[mbOk],0);
      pnlArvore.Enabled := False;
   end;
   //-------------------------------------------------------------------------------------
   qry.Prepare;
   qry.FieldByName('CLASSE').EditMask    := sMascaraGrupo + ';0; ';
   qry.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qry.Open;
   //-------------------------------------------------------------------------------------
   qryGrupoEmpresa.Prepare;
   qryMoeda.Prepare;
   qryMoeda.Open;
   treeGrupos.Mascara := sMascaraGrupo;
   treeGrupos.MontaArvore;
   bAtualizando := False;
end;
//========================================================================================
procedure TfrmCadGrupos.FormActivate(Sender: TObject);
begin
   inherited;
   CarregaListaGrupoxCC;
   Toolbar971.SetFocus;
end;
//========================================================================================
Procedure TfrmCadGrupos.AtualizaTree;
begin
   if bbtnSair.Focused then exit;
   //-------------------------------------------------------------------------------------
   bAtualizando := True;
   qryGrupos.DisableControls;
   qryGrupos.Close;
   qryGrupos.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryGrupos.Open;
   treeGrupos.MontaArvore;
   qryGrupos.EnableControls;
   //-------------------------------------------------------------------------------------
   if qry.FieldByName('TIPO').AsString = 'A' then
      sbtnAnalitico.down := True
   else
      sbtnSintetico.down := True;
   //-------------------------------------------------------------------------------------
   CarregaListaGrupoxCC;
   //-------------------------------------------------------------------------------------
   bAtualizando := False;
   sbtnAlterar.Enabled := False;
   sbtnApagar.Enabled := False;
end;
//========================================================================================
procedure TfrmCadGrupos.bbtnConfirmarClick(Sender: TObject);
var
   iIdGrupo : Integer;
   bInsert : Boolean;
begin
   if trim(dbedCod.Text)='' then
   begin
      MsgDlg('Obrigatório Preencher o Código do Grupo',LerMensagem(2),mtError,[mbOk],0);
      dbedCod.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sbtnAnalitico.down = false) and (sbtnSintetico.down = false) then
   begin
      MsgDlg('Obrigatório Selecionar o Tipo do Grupo',LerMensagem(2),mtError,[mbOk],0);
      pnlAnaSint.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if trim(dbeDescricao.Text)='' then
   begin
      MsgDlg('Obrigatório Preencher a Descrição.',LerMensagem(2),mtError,[mbOk],0);
      dbeDescricao.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if sbtnAnalitico.down then
      qry.FieldByName('Tipo').AsString := 'A';
   if sbtnSintetico.down then
      qry.FieldByName('Tipo').AsString := 'S';
   //-------------------------------------------------------------------------------------
   if qry.FieldByName('IDGRUPO').AsInteger <= 0 then
   begin
      iIdGrupo := LeUltRegistro(nil,'GRUPO');
      qry.FieldByName('IDGRUPO').AsInteger := iIdGrupo;
   end else
   begin
      iIdGrupo := qry.FieldByName('IDGRUPO').AsInteger;
   end;
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
       qryGrupoEmpresa.Close;
       qryGrupoEmpresa.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
       qryGrupoEmpresa.ParamByName('PIDGRUPO').AsInteger  := iIdGrupo;
       qryGrupoEmpresa.Open;
       //---------------------------------------------------------------------------------
       if qryGrupoEmpresa.IsEmpty then
       begin
          qryGrupoEmpresa.Insert;
          qryGrupoEmpresaIDPESSOA.AsInteger := Sistema.IdEmpresa;
          qryGrupoEmpresaIDGRUPO.AsInteger  := iIdGrupo;
          qryGrupoEmpresa.Post;
          qryGrupoEmpresa.ApplyUpdates;
       end;
       //---------------------------------------------------------------------------------
       GravaListaGrupoxCC(iIdGrupo);
       //---------------------------------------------------------------------------------
       if bInsert then
          sbtnInserir.Click
       else
          CmeCadastro.AtualizaBotoes(Self);
   end;
   //-------------------------------------------------------------------------------------
   AtualizaTree;
end;
//========================================================================================
procedure TfrmCadGrupos.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   AtualizaTree;
end;
//========================================================================================
procedure TfrmCadGrupos.qryAfterScroll(DataSet: TDataSet);
begin
   inherited;
   {if bAtualizando then Exit;
   //-------------------------------------------------------------------------------------
   if qryTIPO.AsString = 'A' then
      sbtnAnalitico.down := True
   else
      sbtnSintetico.down := True;
   //-------------------------------------------------------------------------------------
   CarregaListaGrupoxCC;}
end;
//========================================================================================
procedure TfrmCadGrupos.dbedCodExit(Sender: TObject);
var
   bOk   : Boolean;
   iGrau : Integer;

begin
   if bbtnCancelar.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   try
      inherited;
      pnlAnaSint.Enabled := True;
      //----------------------------------------------------------------------------------
      if trim(dbedCod.Text) <> '' then
      begin
         bOk := Verifica_Node(trim(dbedCod.Text),True,iGrau);
         if not bOk then
         begin
            dbedCod.Text := '';
            dbedCod.EditText := '';
            qry.FieldValues['CLASSE'] := '';
            dbedCod.SetFocus;
            exit;
         end;
         //-------------------------------------------------------------------------------
         if (iGrau = 1) and ((Ind + 1) > 1) then
            if pos('.',sMascaraGrupo) <> 0 then
            begin
               sbtnSintetico.Down := True;
               sbtnAnalitico.Down := False;
               qry.FieldByName('TIPO').AsString := 'S';
               pnlAnaSint.Enabled := False;
            end else
            begin
               sbtnSintetico.Down := False;
               sbtnAnalitico.Down := True;
               qry.FieldByName('TIPO').AsString := 'A';
               pnlAnaSint.Enabled := False;
            end;
         //-------------------------------------------------------------------------------
         if iGrau = (Ind + 1) then
         begin
            sbtnSintetico.Down := False;
            sbtnAnalitico.Down := True;
            qry.FieldByName('TIPO').AsString := 'A';
            pnlAnaSint.Enabled := False;
         end;
      end;
   except
      Raise;
   end;
end;
//========================================================================================
function TfrmCadGrupos.Verifica_Node(sNode : String; bNovo : Boolean; Var iGrau : Integer) : boolean;
var
   sPai : String;

begin
   Result := True;
   //-------------------------------------------------------------------------------------
   iGrau := CalcGrau(sNode,lNivel,ind,sPai);
   if iGrau = 0 then
   begin
      MsgDlg('Máscara de Grupo Inválida','Erro',mtError,[mbOk],0);
      Result := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if bNovo then
   begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := ' SELECT G.CLASSE, G.TIPO '+
                         ' FROM GRUPO G, '+
                         '      PLANOGRUPO PG '+
                         ' WHERE (G.CLASSE = ' + qryCLASSE.AsString + ')' +
                         '   AND (PG.IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')' +
                         '   AND (G.IDGRUPO = PG.IDGRUPO)';
      qryAux.Open;
      if not qryAux.IsEmpty then
      begin
         MsgDlg('Codigo de Grupo já Cadastrado','Erro',mtError,[mbOk],0);
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
      qryAux.SQL.Text := ' SELECT G.CLASSE, G.TIPO '+
                         ' FROM GRUPO G, '+
                         '      PLANOGRUPO PG '+
                         ' WHERE (G.CLASSE = ' + trim(sPai) + ')' +
                         '   AND (PG.IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')' +
                         '   AND (G.IDGRUPO = PG.IDGRUPO)';
      qryAux.Open;
      //----------------------------------------------------------------------------------
      if qryAux.IsEmpty then
      begin
         MsgDlg('O Grupo ' + sNode + ' não tem Pai','Erro',mtError,[mbOk],0);
         Result := False;
      end else
      begin
         if qryAux.FieldByName('TIPO').AsString = 'A' then
         begin // pai é analítico
            MsgDlg('Grupo Pai é analítico','Erro',mtError,[mbOk],0);
            Result := False;
         end;
      end;
      qryAux.Close;
   end;
end;
//========================================================================================
function TfrmCadGrupos.MascaraOK(sMascara : String; var sMascPict : String;
                                 var lNivel  : Array  of Integer;
                                 var iSoma : Integer;var ind : Integer) : Boolean;
var
  i         : Integer;
begin
  Result    := true;
  lNivel[0] := 1;
  iSoma     := 0;
  sMascPict := copy(sMascara,1,1);
  for i := 1 to Length(sMascara) do
  begin
     if i > 1
     then sMascPict := sMascPict + copy(sMascara,i,1);
     if copy(sMascara,i,1) ='.' then
     begin
        ind := ind + 1;
        lnivel[ind] := i - ind - iSoma;
        iSoma := iSoma + lNivel[ind];
     end;
  end;
  if (ind = 0) and (length(sMascara) > 0) then
  begin
     lnivel[1] := length(sMascara);
     ind := 1;
  end;
  if ind = 0 then
     Result := false;
  lNivel[ind+1] := Length(sMascara) - ind - iSoma;
end;
//========================================================================================
function  TfrmCadGrupos.CalcGrau(sNoAnterior: String; lNivel: Array of Integer;
                                 ind: Integer; var sPai: String) : Integer;
var
   i    : Integer;
   iAux : Integer;
   sAux : String;
   lAux : Boolean;
begin
   iAux   := 0;
   Result := 0;
   sAux   := '';
   lAux   := false;
   for i:= 1 to ind+1 do
       begin
          inc(Result);
          iAux:=iAux+lNivel[i];
          if length(sNoAnterior)=iAux then
             begin
                lAux:=True;
                sPai := Copy(sNoAnterior,1,iAux-lNivel[i]);
                break;
             end;
       end;
       if not lAux then
          Result:=0;
end;
//========================================================================================
procedure TfrmCadGrupos.treeGruposClick(Sender: TObject);
begin
   inherited;
   if CmeCadastro.Operacao in [opIdle, opVazio] then
   begin
      qry.Locate('IDGRUPO', qryGrupos.FieldByName('IDGRUPO').AsInteger, []);
      //----------------------------------------------------------------------------------
      if qry.FieldByName('TIPO').AsString = 'A' then
         sbtnAnalitico.down := True
      else
         sbtnSintetico.down := True;
      //----------------------------------------------------------------------------------
      CarregaListaGrupoxCC;
      //----------------------------------------------------------------------------------
      sbtnAlterar.Enabled := True;
      sbtnApagar.Enabled  := True;
      CmeCadastro.Operacao := opIdle;
   end;
end;
//========================================================================================
procedure TfrmCadGrupos.treeGruposChange(Sender: TObject);
begin
   inherited;
   if CmeCadastro.Operacao in [opIdle, opVazio] then
   begin
      qry.Locate('IDGRUPO', qryGrupos.FieldByName('IDGRUPO').AsInteger, []);
      //----------------------------------------------------------------------------------
      if qry.FieldByName('TIPO').AsString = 'A' then
         sbtnAnalitico.down := True
      else
         sbtnSintetico.down := True;
      //----------------------------------------------------------------------------------
      CarregaListaGrupoxCC;
      //----------------------------------------------------------------------------------
      sbtnAlterar.Enabled := True;
      sbtnApagar.Enabled  := True;
      CmeCadastro.Operacao := opIdle;
   end;
end;
//========================================================================================
procedure TfrmCadGrupos.sbtnProcurarClick(Sender: TObject);
Var
   sGrupo  : String;

begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      sGrupo := MontaSelect.ValoresChave[0];
      if qryGrupos.Locate('IDGRUPO', sGrupo, []) then
         qry.Locate('IDGRUPO', sGrupo, []);
      //----------------------------------------------------------------------------------
      if qry.FieldByName('TIPO').AsString = 'A' then
         sbtnAnalitico.down := True
      else
         sbtnSintetico.down := True;
      //----------------------------------------------------------------------------------
      CarregaListaGrupoxCC;
   end;
end;
//========================================================================================
procedure TfrmCadGrupos.CmeCadastroFind(Sender: TObject);
begin
end;
//========================================================================================
procedure TfrmCadGrupos.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   dbedCod.Enabled    := True;
   pnlAnaSint.Enabled := True;
   dbedCod.SetFocus;
   //-------------------------------------------------------------------------------------
   rdGrpControle.ItemIndex := 0;
   rdGrpStatus.ItemIndex   := 0;
   dbckbSemPlaca.Checked   := False;
   //-------------------------------------------------------------------------------------
   ExAllBtn.Click;
end;
//========================================================================================
procedure TfrmCadGrupos.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   dbedCod.Enabled := False;
   //-------------------------------------------------------------------------------------
   if Tem_Filhos(qry.FieldByName('CLASSE').AsString) then
      pnlAnaSint.Enabled := False
   else
      pnlAnaSint.Enabled := True;
   //-------------------------------------------------------------------------------------
   dbeDescricao.SetFocus;
end;
//========================================================================================
procedure TfrmCadGrupos.sbtnApagarClick(Sender: TObject);
begin
   qryGrupoBem.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryGrupoBem.ParamByName('PIDGRUPO').AsInteger := qry.FieldByName('IDGRUPO').AsInteger;
   qryGrupoBem.Open;
   if qryGrupoBem.FieldByName('BENSNOGRUPO').AsInteger = 0 then
   begin
      if not Tem_Filhos(qry.FieldByName('CLASSE').AsString) then
      begin
         qryGrupoEmpresa.Close;
         qryGrupoEmpresa.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qryGrupoEmpresa.ParamByName('PIDGRUPO').AsInteger  := qry.FieldByName('IDGRUPO').AsInteger;
         qryGrupoEmpresa.Open;
         //-------------------------------------------------------------------------------
         while not qryGrupoEmpresa.Eof do
         begin
            qryGrupoEmpresa.Delete;
         end;
         qryGrupoEmpresa.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryRemGrupoxCC.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
         qryRemGrupoxCC.ParamByName('PIDGRUPO').AsInteger := qry.FieldByName('IDGRUPO').AsInteger;
         qryRemGrupoxCC.ExecSQL;
         //-------------------------------------------------------------------------------
         inherited;
         AtualizaTree;
      end else
      begin
         MsgDlg('Este grupo possui filhos!','Erro',mtError,[mbOk],0);
         CmeCadastro.Operacao := opIdle;
         CmeCadastro.AtualizaBotoes(Self);
      end;
   end else
   begin
      MsgDlg('Existem bens cadastrados neste grupo !','Erro',mtError,[mbOk],0);
      CmeCadastro.Operacao := opIdle;
      CmeCadastro.AtualizaBotoes(Self);
   end;
   qryGrupoBem.Close;
end;
//========================================================================================
function TfrmCadGrupos.Tem_Filhos(sNode : String) : boolean;
begin
   if qryTIPO.AsString = 'S' then
   begin
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := ' SELECT G.CLASSE, G.TIPO ' +
                         ' FROM GRUPO G, ' +
                         '      PLANOGRUPO PG ' +
                         ' WHERE (G.CLASSE LIKE ' + #39 + trim(sNode) + '%' + #39 + ')' +
                         '   AND (PG.IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')' +
                         '   AND (G.IDGRUPO = PG.IDGRUPO)';
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
procedure TfrmCadGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qryGrupoEmpresa.Close;
   qryMoeda.Close;
   qryGrupos.Close;
   qry.UnPrepare;
   qryGrupoEmpresa.Unprepare;
   qryMoeda.UnPrepare;
   qryGrupos.UnPrepare;
   //-------------------------------------------------------------------------------------
   qryCentroCusto.Close;
   qryGrupoxCC.Close;
   qryCentroCusto.UnPrepare;
   qryGrupoxCC.UnPrepare;
   qryInsGrupoxCC.UnPrepare;
   qryRemGrupoxCC.UnPrepare;
end;
//========================================================================================
// Manipulação da Dual List Box
//========================================================================================
procedure TfrmCadGrupos.CarregaListaGrupoxCC;
var
   iPos   : Integer;
   sCodCC : String;

begin
   inherited;
   SrcList.Clear;
   DstList.Clear;
   //-------------------------------------------------------------------------------------
   qryGrupoxCC.Close;
   qryGrupoxCC.ParamByName('PIDGRUPO').AsInteger := qry.FieldByName('IDGRUPO').AsInteger;
   qryGrupoxCC.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryGrupoxCC.Open;
   qryCentroCusto.Close;
   qryCentroCusto.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryCentroCusto.Open;
   while not qryCentroCusto.EOF do
   begin
      sCodCC := '';
      for iPos := 1 to 10 do
      begin
         if iPos <= length(qryCentroCustoCODCENTROCUSTO.AsString) then
            sCodCC := sCodCC + copy(qryCentroCustoCODCENTROCUSTO.AsString,iPos,1)
         else
            sCodCC := sCodCC + ' ';
      end;
      //----------------------------------------------------------------------------------
      if qryGrupoxCC.Locate('CODCENTROCUSTO', qryCentroCustoCODCENTROCUSTO.AsString, []) then
         DstList.Items.Add(sCodCC + ' ' + qryCentroCustoNOME.AsString)
      else
         SrcList.Items.Add(sCodCC + ' ' + qryCentroCustoNOME.AsString);
      //----------------------------------------------------------------------------------
      qryCentroCusto.Next;
   end;
   SetItem(SrcList,0);
   SetItem(DstList,0);
end;
//========================================================================================
procedure TfrmCadGrupos.GravaListaGrupoxCC(iIdGrupo : Integer);
var
   iListPos : Integer;
begin
   qryGrupoxCC.Close;
   qryGrupoxCC.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryGrupoxCC.ParamByName('PIDGRUPO').AsInteger := iIdGrupo;
   qryGrupoxCC.Open;
   //----------------------------------------------------------------------------------
   if not qryGrupoxCC.IsEmpty then
   begin
      qryRemGrupoxCC.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryRemGrupoxCC.ParamByName('PIDGRUPO').AsInteger := iIdGrupo;
      qryRemGrupoxCC.ExecSQL;
   end;
   //----------------------------------------------------------------------------------
   iListPos := 0;
   while iListPos <= (DstList.Items.Count - 1) do
   begin
      qryInsGrupoxCC.ParamByName('PIDGRUPO').AsInteger       := iIdGrupo;
      qryInsGrupoxCC.ParamByName('PIDEMPRESA').AsInteger     := Sistema.IdEmpresa;
      qryInsGrupoxCC.ParamByName('PCODCENTROCUSTO').AsString := trim(copy(DstList.Items.Strings[iListPos],1,10));
      qryInsGrupoxCC.ExecSQL;
      iListPos := iListPos + 1;
   end;
end;
//========================================================================================
procedure TfrmCadGrupos.IncludeBtnClick(Sender: TObject);
var
   Index: Integer;

begin
   inherited;
   Index := GetFirstSelection(SrcList);
   MoveSelected(SrcList, DstList.Items);
   SetItem(SrcList, Index);
end;
//========================================================================================
function TfrmCadGrupos.GetFirstSelection(List: TCustomListBox): Integer;
begin
   for Result := 0 to List.Items.Count - 1 do
     if List.Selected[Result] then Exit;
   Result := LB_ERR;
end;
//========================================================================================
procedure TfrmCadGrupos.MoveSelected(List: TCustomListBox; Items: TStrings);
var
   I: Integer;
begin
   for I := List.Items.Count - 1 downto 0 do
      if List.Selected[I] then
      begin
         Items.AddObject(List.Items[I], List.Items.Objects[I]);
         List.Items.Delete(I);
      end;
end;
//========================================================================================
procedure TfrmCadGrupos.SetItem(List: TListBox; Index: Integer);
var
   MaxIndex: Integer;
begin
   with List do
   begin
      if CanFocus then SetFocus;
      MaxIndex := List.Items.Count - 1;
      if Index = LB_ERR then Index := 0
      else if Index > MaxIndex then Index := MaxIndex;
      Selected[Index] := True;
   end;
   SetButtons;
end;
//========================================================================================
procedure TfrmCadGrupos.ExcludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   inherited;
   Index := GetFirstSelection(DstList);
   MoveSelected(DstList, SrcList.Items);
   SetItem(DstList, Index);
end;
//========================================================================================
procedure TfrmCadGrupos.IncAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   inherited;
   for I := 0 to SrcList.Items.Count - 1 do
     DstList.Items.AddObject(SrcList.Items[I],
       SrcList.Items.Objects[I]);
   SrcList.Items.Clear;
   SetItem(SrcList, 0);
end;
//========================================================================================
procedure TfrmCadGrupos.ExAllBtnClick(Sender: TObject);
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
procedure TfrmCadGrupos.SetButtons;
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
procedure TfrmCadGrupos.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   case CmeCadastro.Operacao of
      opInserir :
         if not Sistema.GravaLogOperacoes('Inclusão de Grupo Contábil de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opAlterar :
         if not Sistema.GravaLogOperacoes('Alteração de Grupo Contábil de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opApagar :
         if not Sistema.GravaLogOperacoes('Remoção de Grupo Contábil de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
   end;
end;

end.
