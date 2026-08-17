unit fCadGrupoContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdblook, CMDBLookupCombo, Spin, TREdit, CMTree, wwdbedit,
  wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, ImgList;

type
  TfrmCadGrupoContab = class(TfrmCadMestreDetalheCS)
    Label3: TLabel;
    qryIDGRUPO: TFloatField;
    qryCLASSE: TStringField;
    qryNOME: TStringField;
    qryTIPO: TStringField;
    qrySTATUS: TStringField;
    qryDEPRECIACAO: TFloatField;
    qryDATAULTDEP: TDateTimeField;
    qryFLGIMOVEL: TFloatField;
    qryFLGSEMPLACA: TFloatField;
    qryGrupoEmpresa: TwwQuery;
    qryGrupoEmpresaIDGRUPO: TFloatField;
    qryGrupoEmpresaIDPESSOA: TFloatField;
    updGrupoEmpresa: TUpdateSQL;
    qryGrupoBem: TwwQuery;
    qryGrupoBemBENSNOGRUPO: TFloatField;
    qryAux: TwwQuery;
    qryMoeda: TwwQuery;
    qryMoedaMOECODIGO: TFloatField;
    qryMoedaMOEDESC: TStringField;
    Label1: TLabel;
    dbedCod: TwwDBEdit;
    Label2: TLabel;
    dbeDescricao: TwwDBEdit;
    pnlAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    rdgrpControle: TDBRadioGroup;
    rdgrpstatus: TDBRadioGroup;
    GroupBox1: TGroupBox;
    dbckbSemPlaca: TDBCheckBox;
    TabDetCCusto: TTabSheet;
    pnlDetCCusto: TPanel;
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
    Label7: TLabel;
    SrcList: TListBox;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    DstList: TListBox;
    Label8: TLabel;
    dbeTaxaDep: TDBRealEdit;
    dbeDescTaxaDep: TwwDBEdit;
    qryGrupos: TwwQuery;
    qryGruposIDGRUPO: TFloatField;
    qryGruposCLASSE: TStringField;
    qryGruposNOME: TStringField;
    qryGruposTIPO: TStringField;
    qryGruposSTATUS: TStringField;
    qryGruposDEPRECIACAO: TFloatField;
    qryGruposDATAULTDEP: TDateTimeField;
    qryGruposFLGIMOVEL: TFloatField;
    dsGrupos: TwwDataSource;
    qryDetIDGRUPO: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDTAXADEP: TFloatField;
    qryDetTAXADEP: TFloatField;
    qryDetDESCTAXADEP: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure dbedCodExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iSoma, ind, iLen, iIdGrupo : Integer;
    lNivel    : Array [0..20] of Integer;
    sMascPict, sMascaraGrupo : String;
    bTstConf, bCorrompido, bAtualizando, bInsert : Boolean;
    iNumTaxaDep, iProxTaxaDep : Integer;
    //------------------------------------------------------------------------------------
    Procedure SelMestreDet( n : LongInt );
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
  frmCadGrupoContab : TfrmCadGrupoContab;

implementation

{$R *.DFM}

uses uMensErro, uSistema, uDataBase, dBaseDados;

procedure TfrmCadGrupoContab.FormCreate(Sender: TObject);
var
   iGrau : Integer;

begin
   inherited;
   qryCentroCusto.Prepare;
   qryGrupoxCC.Prepare;
   qryInsGrupoxCC.Prepare;
   qryRemGrupoxCC.Prepare;
   //-------------------------------------------------------------------------------------
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MASCCODGRUPO,IDPESSOA,NUMTAXADEP ' +
                  'FROM PARAMETROSCAFMANUT WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa);
      Open;
   end;
   //-------------------------------------------------------------------------------------
   iNumTaxaDep := qryAux.FieldByName('NUMTAXADEP').AsInteger;
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
   // Confere se a estrutura de grupos
   //-------------------------------------------------------------------------------------
   bCorrompido := False;
   qryGrupos.Prepare;
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
      MsgDlg('A Estrutura de Grupos está corrompida','Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   qryCLASSE.EditMask := sMascaraGrupo + ';0; ';
   qry.Prepare;
   qryGrupoEmpresa.Prepare;
   qryMoeda.Prepare;
   qryMoeda.Open;
   SelMestreDet(-1);
   //-------------------------------------------------------------------------------------
   bAtualizando := False;
   pnlDetCCusto.Enabled := False;
end;
//========================================================================================
procedure TfrmCadGrupoContab.SelMestreDet(n : LongInt);
begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Open;
   //-------------------------------------------------------------------------------------
   qryDet.Close;
   qryDet.ParamByName('PIDPESSOA').Value := Sistema.IdEmpresa;
   qryDet.ParamByName('PIDGRUPO').Value  := n;
   qryDet.Open;
   //-------------------------------------------------------------------------------------
   iProxTaxaDep := qryDet.RecordCount;
   //-------------------------------------------------------------------------------------
   CarregaListaGrupoxCC;
end;
//========================================================================================
procedure TfrmCadGrupoContab.CmeCadastroInsert(Sender: TObject);
begin
   bInsert := True;
   SelMestreDet(-1);
   pnlDetCCusto.Enabled := True;
   inherited;
end;
//========================================================================================
procedure TfrmCadGrupoContab.CmeCadastroEdit(Sender: TObject);
begin
   bInsert := False;
   pnlDetCCusto.Enabled := True;
   inherited;
end;
//========================================================================================
procedure TfrmCadGrupoContab.CmeCadastroDelete(Sender: TObject);
begin
   qryDet.First;
   while Not qryDet.EOF Do
   begin
      qryDet.Delete;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmCadGrupoContab.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
   end;
end;
//========================================================================================
procedure TfrmCadGrupoContab.CmeDetalheDelete(Sender: TObject);
begin
   if MsgDlg('Confirma a Remoção da Taxa de Depreciação do Grupo Contábil','Remoção',
              mtConfirmation,[mbYes,mbNo],0) = mrYes then
      inherited;
end;
//========================================================================================
procedure TfrmCadGrupoContab.CmeDetalheConfirma(Sender: TObject);
begin
   if qryDet.State in [dsInsert,dsEdit] then
   begin
      if trim(dbeTaxaDep.Text) = '' then
      begin
         MsgDlg('Informe um valor para taxa de depreciação','Erro',mtError,[mbOK],0);
         dbeTaxaDep.SetFocus;
      end else
      if trim(dbeDescTaxaDep.Text) = '' then
      begin
          MsgDlg('Informe uma descrição para a taxa de depreciação','Erro',mtError,[mbOK],0);
          dbeDescTaxaDep.SetFocus;
      end else
      begin
         if qryDet.State = dsInsert then
         begin
            iProxTaxaDep := iProxTaxaDep + 1;
            qryDetIDTAXADEP.AsInteger  := iProxTaxaDep;
            qryDetTAXADEP.AsFloat      := dbeTaxaDep.Value;
            qryDetDESCTAXADEP.AsString := dbeDescTaxaDep.Text;
         end;
         inherited;
      end;
   end else
   begin
      inherited;
   end;
end;
//========================================================================================
Procedure TfrmCadGrupoContab.CmeCadastroBeforeConfirma(Sender: TObject;  var Accept: Boolean);
begin
   Accept := False;
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
   if qryDet.RecordCount <> iNumTaxaDep then
   begin
      MsgDlg('Obrigatório informar todas as Taxas de Depreciações'+#13+
             'definidas nos Parâmetros do Sistema.',LerMensagem(2),mtError,[mbOk],0);
      dbeDescricao.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if sbtnAnalitico.down then
      qry.FieldByName('TIPO').AsString := 'A';
   if sbtnSintetico.down then
      qry.FieldByName('TIPO').AsString := 'S';
   //-------------------------------------------------------------------------------------
   if qry.FieldByName('IDGRUPO').AsInteger <= 0 then
   begin
      iIdGrupo := LeUltRegistro(nil,'GRUPO');
      qry.FieldByName('IDGRUPO').AsInteger := iIdGrupo;
   end else
   begin
      iIdGrupo := qry.FieldByName('IDGRUPO').AsInteger;
   end;
   Accept := True;
   //-------------------------------------------------------------------------------------
   bTstConf := Accept;
end;
//========================================================================================
procedure TfrmCadGrupoContab.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   pnlDetCCusto.Enabled := False;
   SelMestreDet(qryIDGRUPO.AsInteger);
end;
//========================================================================================
procedure TfrmCadGrupoContab.bbtnConfirmarClick(Sender: TObject);
Var
   bResult : Boolean;
begin
   CmeCadastro.BeforeConfirma(Self,bResult);
   if bResult then
   begin
      inherited;
      if ( bInsert ) And ( bTstConf ) Then
         SelMestreDet(-1);
   end;
   pnlDetCCusto.Enabled := False;
end;
//========================================================================================
procedure TfrmCadGrupoContab.CmeCadastroConfirma(Sender: TObject);
begin
   if (qry.State in [dsInsert,dsEdit]) then
   begin
      try
         StartTransacao;
         //-------------------------------------------------------------------------------
         if qry.State = dsInsert then
            qry.FieldByName('IDGRUPO').AsInteger := LeUltRegistro(nil,'GRUPO');
         //-------------------------------------------------------------------------------
         qryDet.First;
         while not qryDet.EOF do
         begin
            if qryDetIDTAXADEP.AsInteger = 1 then
               qryDEPRECIACAO.AsFloat := qryDetTAXADEP.AsFloat;
            qryDet.Next;
         end;
         //-------------------------------------------------------------------------------
         qry.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryGrupoEmpresa.Close;
         qryGrupoEmpresa.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qryGrupoEmpresa.ParamByName('PIDGRUPO').AsInteger  := qry.FieldByName('IDGRUPO').AsInteger;
         qryGrupoEmpresa.Open;
         //-------------------------------------------------------------------------------
         if qryGrupoEmpresa.IsEmpty then
         begin
            qryGrupoEmpresa.Insert;
            qryGrupoEmpresaIDPESSOA.AsInteger := Sistema.IdEmpresa;
            qryGrupoEmpresaIDGRUPO.AsInteger  := qry.FieldByName('IDGRUPO').AsInteger;
            qryGrupoEmpresa.Post;
            qryGrupoEmpresa.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         qryDet.First;
         while not qryDet.EOF do
         begin
            qryDet.Edit;
            qryDetIDGRUPO.AsInteger  := qry.FieldByName('IDGRUPO').asInteger;
            qryDetIDPESSOA.AsInteger := Sistema.IdEmpresa;
            qryDet.Next;
         end;
         qryDet.ApplyUpdates;
         //-------------------------------------------------------------------------------
         GravaListaGrupoxCC(qry.FieldByName('IDGRUPO').asInteger);
         //-------------------------------------------------------------------------------
         CommitTransacao;
      except
         RollbackTransacao;
         Abort;
      end;
   end else
   begin
      qryDet.ApplyUpdates;
      qry.ApplyUpdates;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmCadGrupoContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qryDet.Close;
   qryGrupoEmpresa.Close;
   qryMoeda.Close;
   qryGrupos.Close;
   qryCentroCusto.Close;
   qryGrupoxCC.Close;
   qry.UnPrepare;
   qryGrupoEmpresa.Unprepare;
   qryMoeda.UnPrepare;
   qryGrupos.UnPrepare;
   qry.UnPrepare;
   qryDet.UnPrepare;
   qryCentroCusto.UnPrepare;
   qryGrupoxCC.UnPrepare;
   qryInsGrupoxCC.UnPrepare;
   qryRemGrupoxCC.UnPrepare;
end;
//========================================================================================
procedure TfrmCadGrupoContab.sbtnInsDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   inherited;
end;
//========================================================================================
procedure TfrmCadGrupoContab.sbtnAltDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   inherited;
end;
//========================================================================================
procedure TfrmCadGrupoContab.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadGrupoContab.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadGrupoContab.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadGrupoContab.dbedCodExit(Sender: TObject);
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
function TfrmCadGrupoContab.Verifica_Node(sNode : String; bNovo : Boolean; Var iGrau : Integer) : boolean;
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
      qryAux.SQL.Text := 'SELECT CLASSE,TIPO FROM GRUPO WHERE CLASSE = ' +
                         qryCLASSE.AsString;
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
      qryAux.SQL.Text := 'SELECT CLASSE,TIPO FROM GRUPO WHERE CLASSE = ' + trim(sPai);
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
function TfrmCadGrupoContab.MascaraOK(sMascara : String; var sMascPict : String;
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
function  TfrmCadGrupoContab.CalcGrau(sNoAnterior: String; lNivel: Array of Integer;
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
procedure TfrmCadGrupoContab.sbtnApagarClick(Sender: TObject);
begin
   qryGrupoBem.Close;
   qryGrupoBem.ParamByName('PIDGRUPO').AsInteger := qry.FieldByName('IDGRUPO').AsInteger;
   qryGrupoBem.Open;
   if qryGrupoBemBENSNOGRUPO.AsInteger = 0 then
   begin
      if not Tem_Filhos(qryCLASSE.AsString) then
      begin
         qryDet.First;
         while not qryDet.Eof do
         begin
            qryDet.Delete;
         end;
         qryDet.ApplyUpdates;
         //-------------------------------------------------------------------------------
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
         qryRemGrupoxCC.ParamByName('PIDGRUPO').AsInteger := qry.FieldByName('IDGRUPO').AsInteger;
         qryRemGrupoxCC.ExecSQL;
         //-------------------------------------------------------------------------------
         inherited;
         SelMestreDet(-1);
      end else
      begin
         MsgDlg('Este grupo possui filhos !','Erro',mtError,[mbOk],0);
         CmeCadastro.Operacao := opIdle;
         CmeCadastro.AtualizaBotoes(Self);
      end;
   end else
   begin
      MsgDlg('Existem bens cadastrados neste grupo !','Erro',mtError,[mbOk],0);
      CmeCadastro.Operacao := opIdle;
      CmeCadastro.AtualizaBotoes(Self);
   end;
end;
//========================================================================================
function TfrmCadGrupoContab.Tem_Filhos(sNode : String) : boolean;
begin
   if qryTIPO.AsString = 'S' then
   begin
      //-------------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := ' SELECT CLASSE,TIPO FROM GRUPO ' +
                         ' WHERE (CLASSE LIKE ' + #39 + trim(sNode) + '%' + #39 + ')';
      qryAux.Open;
      //-------------------------------------------------------------------------------------
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
// Manipulação da Dual List Box
//========================================================================================
procedure TfrmCadGrupoContab.CarregaListaGrupoxCC;
var
   iPos   : Integer;
   sCodCC : String;

begin
   inherited;
   SrcList.Clear;
   DstList.Clear;
   //-------------------------------------------------------------------------------------
   qryGrupoxCC.Close;
   qryGrupoxCC.ParamByName('PIDGRUPO').AsInteger := qryIDGRUPO.AsInteger;
   qryGrupoxCC.Open;
   qryCentroCusto.Close;
   qryCentroCusto.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryCentroCusto.Open;
   while (not qryCentroCusto.EOF) do
   begin
      sCodCC := '';
      for iPos := 1 to 10 do
      begin
         if (iPos <= length(qryCentroCustoCODCENTROCUSTO.AsString)) then
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
procedure TfrmCadGrupoContab.GravaListaGrupoxCC(iIdGrupo : Integer);
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
      qryGrupoxCC.Close;
      qryGrupoxCC.ParamByName('PIDGRUPO').AsInteger := iIdGrupo;
      qryGrupoxCC.Open;
      //----------------------------------------------------------------------------------
      if not qryGrupoxCC.IsEmpty then
      begin
         qryRemGrupoxCC.ParamByName('PIDGRUPO').AsInteger := iIdGrupo;
         qryRemGrupoxCC.ExecSQL;
      end;
      //----------------------------------------------------------------------------------
      iListPos := 0;
      while (iListPos <= (DstList.Items.Count - 1)) do
      begin
         qryInsGrupoxCC.ParamByName('PIDGRUPO').AsInteger       := iIdGrupo;
         qryInsGrupoxCC.ParamByName('PIDEMPRESA').AsInteger     := Sistema.IdEmpresa;
         qryInsGrupoxCC.ParamByName('PCODCENTROCUSTO').AsString := trim(copy(DstList.Items.Strings[iListPos],1,10));
         qryInsGrupoxCC.ExecSQL;
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
procedure TfrmCadGrupoContab.IncludeBtnClick(Sender: TObject);
var
   Index: Integer;

begin
   inherited;
   Index := GetFirstSelection(SrcList);
   MoveSelected(SrcList, DstList.Items);
   SetItem(SrcList, Index);
end;
//========================================================================================
function TfrmCadGrupoContab.GetFirstSelection(List: TCustomListBox): Integer;
begin
   for Result := 0 to List.Items.Count - 1 do
     if List.Selected[Result] then Exit;
   Result := LB_ERR;
end;
//========================================================================================
procedure TfrmCadGrupoContab.MoveSelected(List: TCustomListBox; Items: TStrings);
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
procedure TfrmCadGrupoContab.SetItem(List: TListBox; Index: Integer);
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
procedure TfrmCadGrupoContab.ExcludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   inherited;
   Index := GetFirstSelection(DstList);
   MoveSelected(DstList, SrcList.Items);
   SetItem(DstList, Index);
end;
//========================================================================================
procedure TfrmCadGrupoContab.IncAllBtnClick(Sender: TObject);
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
procedure TfrmCadGrupoContab.ExAllBtnClick(Sender: TObject);
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
procedure TfrmCadGrupoContab.SetButtons;
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
procedure TfrmCadGrupoContab.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   dbedCod.SetFocus;
end;

procedure TfrmCadGrupoContab.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
   if bAtualizando then Exit;
   //-------------------------------------------------------------------------------------
   if (qryTIPO.AsString = 'A') then
      sbtnAnalitico.down := True
   else
      sbtnSintetico.down := True;
end;

end.
