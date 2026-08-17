unit FCadBlqEntDadosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlPadroes, uCtrlBlqEntDados, TREdit, ComCtrls, Grids, Wwdbigrd,
  Wwdbgrid, DBGrids, DBCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  uCMTypes, uMensErro, DBTables, Wwquery, wwdblook;

type
  TFrmCadBlqEntDadosMT = class(TFrmCadastroMT)
    pnlDetalhe: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    PageControl: TPageControl;
    tbsCenarios: TTabSheet;
    tbsAreas: TTabSheet;
    GridCenarios: TwwDBGrid;
    Panel1: TPanel;
    btSelTodosCen: TBitBtn;
    btInverteCen: TBitBtn;
    Panel2: TPanel;
    btSelTodosArea: TBitBtn;
    btInverteArea: TBitBtn;
    PgcAreas: TPageControl;
    tbsCResp: TTabSheet;
    tbsUsuarios: TTabSheet;
    CdsDet: TCMClientDataSet;
    cboPeriodo: TwwDBComboBox;
    CdsCenarios: TCMClientDataSet;
    dsCenarios: TDataSource;
    GridCResp: TwwDBGrid;
    GridUsuarios: TwwDBGrid;
    CdsCResp: TCMClientDataSet;
    CdsUsuarios: TCMClientDataSet;
    dsCRespon: TDataSource;
    dsUsuarios: TDataSource;
    cboExercicio: TwwDBLookupCombo;
    qryExercicio: TwwQuery;
    qryExercicioEXERCICIO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridCenariosRowChanged(Sender: TObject);
    procedure GridCenariosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridCenariosTopRowChanged(Sender: TObject);
    procedure PgcAreasChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure btSelTodosCenClick(Sender: TObject);
    procedure btInverteCenClick(Sender: TObject);
    procedure btSelTodosAreaClick(Sender: TObject);
    procedure btInverteAreaClick(Sender: TObject);
    procedure GridCenariosExit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure cboPeriodoExit(Sender: TObject);
  private
    { Private declarations }
    CtrlBlqEntDados : TCtrlBlqEntDados;

    procedure HabilitaCheckBox(bHabilitar: boolean);
    procedure SelMutilpla(var aCds: TCMClientDataSet; const bInverte: boolean);
    function TestaUsuxCResponSel(ovDados: OleVariant; sCodCentroRespon: string): boolean;



  public
    { Public declarations }
  end;

var
  FrmCadBlqEntDadosMT: TFrmCadBlqEntDadosMT;

implementation

{$R *.DFM}




procedure TFrmCadBlqEntDadosMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlBlqEntDados := TCtrlBlqEntDados.Create;
  CtrlBlqEntDados.InitializeAs(Padroes);

  CtrlBlqEntDados.Cds         := Cds;
  CtrlBlqEntDados.CdsDet      := CdsDet;
  CtrlBlqEntDados.CdsCenarios := CdsCenarios;
  CtrlBlqEntDados.CdsCRespon  := CdsCResp;
  CtrlBlqEntDados.CdsUsuarios := CdsUsuarios;
  PageControl.ActivePageIndex := 0;
  PgcAreas.ActivePageIndex    := 0;
  CtrlBlqEntDados.Seleciona(0);
  CtrlBlqEntDados.SelecionaUsuxCRespon(0);
end;




procedure TFrmCadBlqEntDadosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlBlqEntDados);
  inherited;
end;




procedure TFrmCadBlqEntDadosMT.GridCenariosRowChanged(Sender: TObject);
begin
  inherited;
  // Controle para evitar que o usuário fique inserindo registro no grid
  HabilitaCheckBox((TCMClientDataSet((sender as TwwDBGrid).DataSource.DataSet).FieldByName('VALIDA').AsString = 'S') and
                   (CmeCadastro.Operacao in [opInserir,opAlterar]));
end;




procedure TFrmCadBlqEntDadosMT.GridCenariosCalcCellColors(Sender: TObject;
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
         ABrush.color := clwhite
       else
         ABrush.Color := $00C0FFFF; //Amarelo Bebê
     end;
   end
   else
   begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
   end;
end;




procedure TFrmCadBlqEntDadosMT.GridCenariosTopRowChanged(Sender: TObject);
begin
  inherited;
  (Sender as TwwDBGrid).Invalidate;
end;




procedure TFrmCadBlqEntDadosMT.HabilitaCheckBox(bHabilitar: boolean);
begin
   if CdsCenarios.Active then
      TStringField(CdsCenarios.FieldByName('SELECIONA')).ReadOnly := not bHabilitar;

   if CdsCResp.Active then
      TStringField(CdsCResp.FieldByName('SELECIONA')).ReadOnly := not bHabilitar;

   if CdsUsuarios.Active then
      TStringField(CdsUsuarios.FieldByName('SELECIONA')).ReadOnly := not bHabilitar;

   TStringField(CdsCenarios.FieldByName('NOMECENARIO')).ReadOnly     := true;
   TStringField(CdsCResp.FieldByName('CODCENTRORESPON')).ReadOnly    := true;
   TStringField(CdsCResp.FieldByName('NOME')).ReadOnly               := true;
   TStringField(CdsUsuarios.FieldByName('CODCENTRORESPON')).ReadOnly := true;
   TStringField(CdsUsuarios.FieldByName('NOME')).ReadOnly            := true;
end;




procedure TFrmCadBlqEntDadosMT.PgcAreasChange(Sender: TObject);
begin
  inherited;

  case PgcAreas.ActivePageIndex of
     // Aba C.Respon
     0: begin
           if CmeCadastro.Operacao in [opInserir,opAlterar] then
           begin
              // Se existir algum usuário desmarcado, desmarcar a seleção do C.Respo
              if not TestaUsuxCResponSel(CdsUsuarios.Data,CdsCResp.FieldByName('CODCENTRORESPON').AsString) then
              begin
                 CdsCResp.Edit;
                 CdsCResp.FieldByName('SELECIONA').AsString := 'N';
                 CdsCResp.Post;
              end
              else
              begin
                 // Se a selecção do C.Respon estiver desmarcada e TODOS os usuários
                 //estiverem selecionados, marcar a seleção do C.Respon
                 if CdsCResp.FieldByName('SELECIONA').AsString = 'N' then
                 begin
                    CdsCResp.Edit;
                    CdsCResp.FieldByName('SELECIONA').AsString := 'S';
                    CdsCResp.Post;
                 end;
              end;
           end;
        end;

     // Aba Usuários x C.Respon
     1: begin
           CdsUsuarios.Filtered := false;
           CdsUsuarios.Filter   := 'CODCENTRORESPON = ' + QuotedStr(CdsCResp.FieldByName('CODCENTRORESPON').AsString);
           CdsUsuarios.Filtered := true;

           HabilitaCheckBox(true);
           // Se o usuário estiver selecionado com um C.Respon que esteja marcado,
           //marcar TODOS os usuários que fazem parte do C.Respon pois se ele deseja bloquear um
           //C.Respon, logo todos os usuários devem ser selecionados também.
           if CdsCResp.FieldByName('SELECIONA').AsString = 'S' then
              btSelTodosArea.Click;

           // Mantém a edição do CheckBox conforme o estado do cadastro
           HabilitaCheckBox((CmeCadastro.Operacao in [opInserir,opAlterar]));
        end;
  end;
end;




procedure TFrmCadBlqEntDadosMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := false;
  CtrlBlqEntDados.Seleciona(0);
  CtrlBlqEntDados.SelecionaUsuxCRespon(0);
  PageControl.ActivePageIndex := 0;
  PgcAreas.ActivePageIndex    := 0;
end;








procedure TFrmCadBlqEntDadosMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  PageControl.ActivePageIndex := 0;
  PgcAreas.ActivePageIndex    := 0;
  CtrlBlqEntDados.Seleciona(0);
  CtrlBlqEntDados.SelecionaUsuxCRespon(0);
end;




procedure TFrmCadBlqEntDadosMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  PageControl.ActivePageIndex := 0;
  PgcAreas.ActivePageIndex    := 0;
  HabilitaCheckBox(true);
end;




procedure TFrmCadBlqEntDadosMT.SelMutilpla(var aCds: TCMClientDataSet;
  const bInverte: boolean);
begin
   try
      aCds.DisableControls;

      aCds.First;
      while not aCds.Eof do
      begin
         aCds.Edit;
         if not bInverte then
            aCds.FieldByName('SELECIONA').AsString := 'S'
         else
         begin
            if aCds.FieldByName('SELECIONA').AsString = 'S' then
               aCds.FieldByName('SELECIONA').AsString := 'N'
            else
               aCds.FieldByName('SELECIONA').AsString := 'S';
         end;
         aCds.Post;

         aCds.Next;
      end;


   finally
      aCds.First;
      aCds.EnableControls;
   end;
end;




procedure TFrmCadBlqEntDadosMT.btSelTodosCenClick(Sender: TObject);
begin
  inherited;
  SelMutilpla(CdsCenarios,false); 
end;




procedure TFrmCadBlqEntDadosMT.btInverteCenClick(Sender: TObject);
begin
  inherited;
  SelMutilpla(CdsCenarios,true);
end;




procedure TFrmCadBlqEntDadosMT.btSelTodosAreaClick(Sender: TObject);
begin
  inherited;
  case PgcAreas.ActivePageIndex of
    0: SelMutilpla(CdsCResp,false);
    1: SelMutilpla(CdsUsuarios,false);
  end;
end;



procedure TFrmCadBlqEntDadosMT.btInverteAreaClick(Sender: TObject);
begin
  inherited;
  case PgcAreas.ActivePageIndex of
    0: SelMutilpla(CdsCResp,true);
    1: SelMutilpla(CdsUsuarios,true);
  end;
end;




procedure TFrmCadBlqEntDadosMT.GridCenariosExit(Sender: TObject);
begin
  inherited;
  if TCMClientDataSet((sender as TwwDBGrid).DataSource.DataSet).State in [dsEdit,dsInsert] then
     TCMClientDataSet((sender as TwwDBGrid).DataSource.DataSet).Post;
end;




function TFrmCadBlqEntDadosMT.TestaUsuxCResponSel(ovDados: OleVariant;
  sCodCentroRespon: string): boolean;
begin
   with TCMClientDataSet.Create(nil) do
   try
      Data     := ovDados;
      Filter   := 'CODCENTRORESPON = ' + QuotedStr(sCodCentroRespon);
      Filtered := true;

      while not Eof do
      begin
         Result := (FieldByName('SELECIONA').AsString = 'S');
         if not Result then
           Break;

         Next;
      end;
   finally
      Free;
   end;
end;




procedure TFrmCadBlqEntDadosMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlBlqEntDados.AplicaAlteracoes;
  if not Accept then
     MsgDlg('Houve um erro ao gravar os dados. ' +
            'Motivo: ' + CtrlBlqEntDados.MessageInfo,'Erro',mtError,[mbOk],0)
  else
  begin
     PageControl.ActivePageIndex := 0;
     PgcAreas.ActivePageIndex    := 0;
  end;           
end;




procedure TFrmCadBlqEntDadosMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     CtrlBlqEntDados.Seleciona(StrToIntDef(MontaSelect.ValoresChave[0],0));
     CtrlBlqEntDados.SelecionaUsuxCRespon(StrToIntDef(MontaSelect.ValoresChave[0],0));
     HabilitaCheckBox(false);
     PageControl.ActivePageIndex := 0;
     PgcAreas.ActivePageIndex    := 0;
  end;
end;




procedure TFrmCadBlqEntDadosMT.MontaSelectBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
var
 slQry: TStringList;
begin
  inherited;
  try
     // Corrige o "order by"
     slQry := TStringList.Create;
     slQry.Text := sqlText;
     slQry[slQry.Count - 1] := 'ORDER BY B.EXERCICIO, B.PERIODO';
     sqlText := slQry.Text;

  finally
     FreeAndNil(slQry);
  end;
end;




procedure TFrmCadBlqEntDadosMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlBlqEntDados.ExcluirRegistros;
  if not Accept then
     MsgDlg('Houve um erro ao excluir o registro.' + #13 +
            'Mensagem: ' + CtrlBlqEntDados.MessageInfo,'Erro',mtError,[mbOk],0)
  else          
  begin
     PageControl.ActivePageIndex := 0;
     PgcAreas.ActivePageIndex    := 0;
  end;
end;





procedure TFrmCadBlqEntDadosMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := true;

  if trim(cboPeriodo.Text) = ''  then
  begin
     MsgDlg('Informe o período','Aviso',mtWarning,[mbOk],0);
     cboPeriodo.SetFocus;
     Accept := false;
     Exit;
  end;

  if trim(cboExercicio.Text) = '' then
  begin
     MsgDlg('Informe o exercício','Aviso',mtWarning,[mbOk],0);
     cboExercicio.SetFocus;
     Accept := false;
     Exit;
  end;
end;

procedure TFrmCadBlqEntDadosMT.cboPeriodoExit(Sender: TObject);
begin
  inherited;
  //ERALDO LUIS DA SILVA SOL 108817 KINTANA 495509 
  qryExercicio.close;
  qryExercicio.Params.ParamByName('PERIODO').AsString:= cboPeriodo.Value;
  qryExercicio.open;
end;

end.
