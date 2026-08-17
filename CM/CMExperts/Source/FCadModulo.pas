unit FCadModulo;
                              
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, Mask, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  CMDBLookupCombo, CmEventosCadastro, ImgList, uCMListDialog, uCMTypes,
  Machklb;

const
     USA_CMBACK      = 001;
     USA_COBRCM      = 010;
     USA_REGRA       = 100;
     USA_CMUTILFRONT = 'U';
     USA_CMRETSFRONT = 'R';
     USA_CMOBJFRONT  = 'O';
     USA_TRANSTELWIN = 'T';
     USA_INTSQ       = 'I';
     USA_SISTV       = 'S';

type
  TFrmCadModulo = class(Tform)
    updObjEscolhido: TUpdateSQL;
    dsObjEscolhido: TwwDataSource;
    qryObjEscolhido: TwwQuery;
    qryObjEscolhidoNOMEOBJETO: TStringField;
    qryObjEscolhidoTIPOOBJETO: TStringField;
    qryObjEscolhidoIDMODULO: TFloatField;
    qryObj: TwwQuery;
    dsObj: TwwDataSource;
    QryUsu: TwwQuery;
    MontaSelect: TMontaSelect;
    ds: TwwDataSource;
    qry: TwwQuery;
    qryIDMODULO: TFloatField;
    qryNOMEMODULO: TStringField;
    qryNOMEPROJETO: TStringField;
    qryDIRFONTES: TMemoField;
    qryPATHFONTES: TStringField;
    qryDPL: TFloatField;
    qryUSADPL: TFloatField;
    qryFLGGRUPODESENV: TStringField;
    qryEMAIL: TStringField;
    qryEMAILGERENTE: TStringField;
    qryUSURESPONSAVEL: TStringField;
    qryGERENTEPROJETO: TStringField;
    qryDPLFRONT: TStringField;
    upd: TUpdateSQL;
    CmeCadastro: TCmEventosCadastro;
    ImlPadrao: TImageList;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    pnlFundo: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit8: TDBEdit;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Panel1: TPanel;
    dbgObjEscolhido: TwwDBGrid;
    Panel5: TPanel;
    dbgObj: TwwDBGrid;
    rdgTipo: TRadioGroup;
    Panel2: TPanel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    sep3: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    BtnPath: TSpeedButton;
    DbRgTipoProjeto: TDBRadioGroup;
    LstDlgPath: TCMListDialog;
    QryBpl: TwwQuery;
    qryLISTABPL: TMemoField;
    GroupBox1: TGroupBox;
    ChkBpl: TCMchklistbox;
    procedure DBEdit2Change(Sender: TObject);
    procedure dbgObjDblClick(Sender: TObject);
    procedure dbgObjDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgObjDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgObjMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgObjEscolhidoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgObjEscolhidoDblClick(Sender: TObject);
    procedure dbgObjEscolhidoDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure dbgObjEscolhidoDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure rdgTipoClick(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtnPathClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    procedure PoeObjeto;
    procedure TiraObjeto;
    procedure AtuUsaDPL;
    function TemAlteracaoPendente: Boolean;
    procedure AtuListaBPL;
  public
    { Public declarations }
  end;

var
  FrmCadModulo: TFrmCadModulo;

implementation

{$R *.DFM}

uses fAguarde, uDataBase, uMensErro, uSad;

procedure TFrmCadModulo.rdgTipoClick(Sender: TObject);
begin
  inherited;
  case rdgTipo.ItemIndex of
       0: qryObj.Filter := 'OBJECT_TYPE = ''TABLE''';
       1: qryObj.Filter := 'OBJECT_TYPE = ''SEQUENCE''';
       2: qryObj.Filter := 'OBJECT_TYPE = ''PROCEDURE''';
       3: qryObj.Filter := 'OBJECT_TYPE = ''FUNCTION''';
       4: qryObj.Filter := '';
  end;
end;


procedure TFrmCadModulo.dbgObjDblClick(Sender: TObject);
begin
     inherited;
     PoeObjeto;
end;

procedure TFrmCadModulo.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Open;
  
  pnlFundo.Enabled := false;
  CmeCadastro.RepetirInsert   := False;

  if qry.IsEmpty then
     CmeCadastro.Operacao := opVazio
  else
     CmeCadastro.Operacao := opIdle;

  CmeCadastro.AtualizaBotoes(Self);

  try
     frmAguarde.Mostra('Abrindo tabelas...');
     qryObj.Open;
     qryObjEscolhido.ParamByName('IdModulo').Value := qryIdModulo.AsInteger;
     qryObjEscolhido.Open;
     AtuUsaDPL;
  finally
         frmAguarde.Apaga;
  end;
end;

procedure TFrmCadModulo.PoeObjeto;
begin
     if (qry.State in [dsInsert,dsEdit]) and
        (not qryObjEscolhido.Locate('NOMEOBJETO', qryObj.FieldByName('OBJECT_NAME').AsString,[])) then
     begin
        qryObjEscolhido.Insert;
        qryObjEscolhido.FieldByName('NOMEOBJETO').Value := qryObj.FieldByName('OBJECT_NAME').AsString;
        qryObjEscolhido.FieldByName('IDMODULO').Value   := qry.FieldByName('IDMODULO').AsString;
        qryObjEscolhido.FieldByName('TIPOOBJETO').Value := Copy(qryObj.FieldByName('OBJECT_TYPE').AsString,1,1);
        qryObjEscolhido.Post;
     end;
end;

procedure TFrmCadModulo.TiraObjeto;
begin
     if qry.State in [dsInsert,dsEdit] then
        qryObjEscolhido.Delete;
end;

procedure TFrmCadModulo.dbgObjMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
     if Button = mbLeft then	{ drag only if left button pressed }
     with Sender as TwwDBGrid do
          BeginDrag(false);
end;

procedure TFrmCadModulo.dbgObjEscolhidoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
     inherited;
     if (Source is TwwDBGrid) and
        (UPPERCASE(TwwDBGrid(Source).Name)='DBGOBJ') then
        Accept := true;
end;

procedure TFrmCadModulo.dbgObjEscolhidoDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  PoeObjeto;
end;

procedure TFrmCadModulo.dbgObjEscolhidoDblClick(Sender: TObject);
begin
  inherited;
  TiraObjeto;
end;

procedure TFrmCadModulo.dbgObjEscolhidoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
     if Button = mbLeft then	{ drag only if left button pressed }
     with Sender as TwwDBGrid do
          BeginDrag(false);
end;

procedure TFrmCadModulo.dbgObjDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
     if (Source is TwwDBGrid) and
        (UPPERCASE(TwwDBGrid(Source).Name)='DBGOBJESCOLHIDO') then
        Accept := true;
end;

procedure TFrmCadModulo.dbgObjDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  TiraObjeto;
end;

procedure TFrmCadModulo.DBEdit2Change(Sender: TObject);
begin
  inherited;
     if qry.State in ([dsEdit,dsInsert]) then
        qry.FieldByName('DirFontes').Value := 'C:\ProjetosComDPL\'+DBEDIT2.TEXT+'\Fontes';
end;

procedure TFrmCadModulo.AtuUsaDPL;
Var
  iIndice: Integer;
begin
  If QryBpl.Active Then QryBpl.Close;
  QryBpl.Open;

  ChkBpl.Items.Clear;

  While Not QryBpl.Eof Do
  Begin
     iIndice := ChkBpl.Items.Add(QryBpl.Fields[0].AsString);

     If Qry.Active Then
        ChkBpl.Selected[iIndice] := (Pos(QryBpl.Fields[0].AsString,LowerCase(Qry.FieldByName('LISTABPL').AsString)) > 0);

     QryBpl.Next;
  End;
end;

procedure TFrmCadModulo.AtuListaBPL;
Var
  X: Integer;
  sListaBpl: String;
begin
  sListaBpl := '';

  For x := 0 To (ChkBpl.Items.Count - 1) Do
     If ChkBpl.Selected[X] Then
        If sListaBpl = '' Then
          sListaBpl := ChkBpl.Items[x]
        Else
          sListaBpl := sListaBpl + ';' + ChkBpl.Items[x];

  Qry.FieldByName('LISTABPL').AsString := sListaBpl;
end;


procedure TFrmCadModulo.CmeCadastroInsert(Sender: TObject);
var i : integer;
begin
     inherited;
     i := LeUltRegistroSAD('MODULO','IDMODULO');
     QRY.Insert;
     AtuUsaDPL;
     QRY.FieldByName('IdModulo').AsInteger := i;
     QRY.FieldByName('DirFontes').Value := 'C:\ProjetosComDPL\'+DBEDIT2.TEXT+'\Fontes';
     QRYFLGGRUPODESENV.AsString := 'B';
     QryDpl.AsFloat := 0;
     If DBEdit1.CanFocus Then DBEdit1.SetFocus;
End;

procedure TFrmCadModulo.CmeCadastroCancel(Sender: TObject);
Begin
   inherited;
   AtuUsaDPL;
   qry.CancelUpdates;   
End;

procedure TFrmCadModulo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  qry.Edit;  
  If DBEdit1.CanFocus Then DBEdit1.SetFocus;
End;

procedure TFrmCadModulo.CmeCadastroDelete(Sender: TObject);
begin
  if MsgDlg('Todas as informações relacionadas com o módulo '+UPPERCASE(QRY.FieldByName('NOMEMODULO').AsString)+' serão apagados.'+#10#13+'Deseja realmente excluir este módulo?', 'Exclusão', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
     qryObjEscolhido.First;
     While Not qryObjEscolhido.Eof Do
           qryObjEscolhido.Delete;
     qry.Delete;
     CmeCadastro.Confirma(Self);
     inherited;
  end;
End;

procedure TFrmCadModulo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     Qry.Close;
     Qry.Params[0].AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     Qry.Open;

     qryObjEscolhido.Close;
     qryObjEscolhido.ParamByName('IdModulo').Value := QRY.FieldByName('IdModulo').AsInteger;
     qryObjEscolhido.Open;
     AtuUsaDPL;
  End;
End;

procedure TFrmCadModulo.CmeCadastroConfirma(Sender: TObject);
begin
  If CmeCadastro.Operacao =  opApagar  Then
     ConfirmaSad([qry,qryObjEscolhido])
  Else
     ConfirmaSad([qryObjEscolhido,qry]);
     
  inherited;
End;

procedure TFrmCadModulo.sbtnInserirClick(Sender: TObject);
begin
   if not (CmeCadastro.Operacao in [opIdle, opVazio]) then
      CmeCadastro.Cancel(self);

   CmeCadastro.Operacao := opInserir;
   CmeCadastro.RepetirInsert := True;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Insert(Self);
   CmeCadastro.AtualizaBotoes(Self);

end;

procedure TFrmCadModulo.sbtnAlterarClick(Sender: TObject);
begin
   if not (CmeCadastro.Operacao in [opIdle, opVazio]) then
      CmeCadastro.Cancel(self);

   CmeCadastro.Operacao := opAlterar;
   CmeCadastro.RepetirInsert := False;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Edit(Self);
   CmeCadastro.AtualizaBotoes(Self);

end;

procedure TFrmCadModulo.sbtnProcurarClick(Sender: TObject);
begin
   CmeCadastro.Operacao := opProcurar;
   MontaSelect.Executar;

   CmeCadastro.Find(Self);

   if qry.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
      CmeCadastro.Operacao := opIdle;
      
   CmeCadastro.AtualizaBotoes(Self);

end;

procedure TFrmCadModulo.sbtnApagarClick(Sender: TObject);
begin
   if CmeCadastro.Operacao = opIdle then
   begin
        Try
          CmeCadastro.Operacao := opApagar;

          if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
              CmeCadastro.Delete(Self);

          if qry.IsEmpty then
             CmeCadastro.Operacao := opVazio
          else
              CmeCadastro.Operacao := opIdle;

          CmeCadastro.AtualizaBotoes(Self);
        Except
          CmeCadastro.Operacao := opIdle;
          sbtnApagar.Down := False;
          Qry.DisableControls;
          Qry.Close;
          Qry.Open;
          Qry.EnableControls;
          Raise;
        End;
   end;

end;

procedure TFrmCadModulo.bbtnConfirmarClick(Sender: TObject);
var
  bInsert : boolean;
begin
  inherited;
  bInsert := CmeCadastro.RepetirInsert and (CmeCadastro.Operacao = opInserir);

  CmeCadastro.Confirma(Self);

  If CmeCadastro.ConfirmaCadastro Then
  Begin
      if qry.IsEmpty then
         CmeCadastro.Operacao := opVazio
      else
          CmeCadastro.Operacao := opIdle;

      if bInsert then
         sbtnInserir.Click
      else
         CmeCadastro.AtualizaBotoes(Self);

      If CmeCadastro.RepetirInsert Then sbtnInserir.Click;
  End;
end;

procedure TFrmCadModulo.bbtnCancelarClick(Sender: TObject);
begin
     CmeCadastro.RepetirInsert := False;
     if qry.Active then
        CmeCadastro.Cancel(self);
     if qry.IsEmpty then
        CmeCadastro.Operacao := opVazio
     else
         CmeCadastro.Operacao := opIdle;
     CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadModulo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ds.State in ([dsInsert, dsEdit]) then
     begin
     if TemAlteracaoPendente then
        if MsgDlg( 'Alguns dados informados ainda não foram gravados.'+#13+#10+'Deseja realmente sair da tela?',
                   'Alterações pendentes', mtWarning, [mbYes, mbNo],0) = mrNo then
           CanClose := false;
     end;
   if CanClose then
   Begin
     bbtnCancelar.Click;
     ModalResult := MrOk;
   End;
end;

procedure TFrmCadModulo.CmeCadastroAtualizaBotoes(Sender: TObject);
var
   ConfirmaVisible : Boolean;
begin
   inherited;
   { Configura o estado dos botões }

   sbtnInserir.Enabled := false;
   sbtnAlterar.Enabled := false;
   sbtnApagar.Enabled := false;
   sbtnProcurar.Enabled := false;
   case CmeCadastro.Operacao of
   opVazio :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;
               sbtnProcurar.Down := false;
               sbtnInserir.Enabled := true;
               sbtnAlterar.Enabled := false;
               sbtnApagar.Enabled := false;
               sbtnProcurar.Enabled := true;

               ConfirmaVisible := false;
          end;
   opIdle :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;
               sbtnProcurar.Down := false;
               sbtnInserir.Enabled := true;
               sbtnProcurar.Enabled := true;

               if (qry.Active) and (not qry.IsEmpty) then
               begin
                  sbtnAlterar.Enabled := true;
                  sbtnApagar.Enabled := true;
               end
               else begin
                    sbtnAlterar.Enabled := false;
                    sbtnApagar.Enabled := false;
               end;
               ConfirmaVisible := false;
          end;
   opInserir :
             begin
                  sbtnInserir.Down := true;
                  sbtnInserir.Enabled := true;
                  ConfirmaVisible := true;
             end;
   opAlterar :
          begin
               sbtnAlterar.Down := true;
               sbtnAlterar.Enabled := true;
               ConfirmaVisible := true;
          end;
   opProcurar :
               begin
                    sbtnProcurar.Down := true;
                    sbtnProcurar.Enabled := true;
                    ConfirmaVisible := false;
               end;
   opApagar :
            begin
                 sbtnApagar.Down  := false;
                 sbtnApagar.Enabled := true;
                 ConfirmaVisible := false;
            end;
   else
       ConfirmaVisible := false;
   end;

   bbtnConfirmar.Enabled := ConfirmaVisible;
   bbtnCancelar.Enabled := ConfirmaVisible;
   if pnlfundo.Visible then
      pnlfundo.enabled := ConfirmaVisible;

end;

function TFrmCadModulo.TemAlteracaoPendente:Boolean ;
var i:integer;

begin
     Result := false;
     i := 0;
     while (i < ComponentCount) and (not Result) do begin
           if (TObject(Components[i]).ClassNameIs('TwwQuery')) and
              (TwwQuery(Components[i]).Active) and
              (TwwQuery(Components[i]).CachedUpdates) and
              (TwwQuery(Components[i]).UpdatesPending) then
              Result := true;
           Inc(i);
     end;
end;


procedure TFrmCadModulo.FormPaint(Sender: TObject);
begin
   if tb97Fundo <> nil then
      tb97Fundo.DockPos := width;

  if tb97OkCancelar <> nil then
     tb97OkCancelar.DockPos := width-tb97Fundo.width-10;
end;

procedure TFrmCadModulo.bbtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadModulo.BtnPathClick(Sender: TObject);
begin
   LstDlgPath.Content := qryDIRFONTES.AsString;;
   If LstDlgPath.Execute Then
      qryDIRFONTES.AsString := LstDlgPath.Content;
end;

procedure TFrmCadModulo.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  AtuListaBPL;
end;

end.
