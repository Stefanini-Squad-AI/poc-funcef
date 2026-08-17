unit FImportaOrcadoExcelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97,uCtrlContab, Db, DBClient, uCtrlPeriodo,
  uCMClientDataSet,uCtrlProcessaContab,  Excel97, OleServer, Gauges,
  uCmSqlParams, DdeMan, Spin, uCMTypes;

type
  TfrmImportaOrcExcelMT = class(TfrmSairAjuda)
    dlg: TOpenDialog;
    btnImportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    cdsExercicio: TCMClientDataSet;
    Bevel1: TBevel;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    dblkExercicio: TwwDBLookupCombo;
    edtPath: TEdit;
    btnSelecionar: TBitBtn;
    Label1: TLabel;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    Bevel2: TBevel;
    prgBar: TProgressBar;
    Anim: TAnimate;
    Label2: TLabel;
    Panel1: TPanel;
    mmLog: TRichEdit;
    sqlPlanilha: TCMSqlParams;
    cdsPlanilha: TCMClientDataSet;
    Label4: TLabel;
    spnLinhaFim: TSpinEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CtrlContab     :TCtrlContab;
    CtrlPeriodo    : TCtrlPeriodo;
    CtrlProcessaContab :TCtrlProcessaContab;
    procedure ProcMensImp(msg: String);

  public
    { Public declarations }
  end;

var
  frmImportaOrcExcelMT: TfrmImportaOrcExcelMT;

implementation

uses  UMensErro, uDatabase, DBaseDados,
     uSistema, uModulo, uData, uExcel;

var
  Excel     :TExcel;
  Area      :Trect;
  StlArqTexto :TStringList;

{$R *.DFM}

procedure TfrmImportaOrcExcelMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe lancamento ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensImp);


  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.Idempresa,False);


  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   Excel := TExcel.create(self);
   Excel.Connect;
   StlArqTexto := TStringList.Create;


end;

procedure TfrmImportaOrcExcelMT.btnSelecionarClick(Sender: TObject);
begin
  inherited;
   mmLog.Clear;
   StlArqTexto.Clear;

   prgBar.Max          := 0;
   prgBar.Position := 0;

   If spnLinhaFim.Value < 2 Then
   Begin
      MsgDlg('A Linha Final não deve ser menor que 2 (dois).','Aviso',mtError,[mbOk],0);
      spnLinhaFim.SetFocus;
      Exit;
   End;

   area.top    := 2;
   area.Bottom := StrToInt(spnLinhaFim.text);

   area.left   := 2;
   area.right  := 18;

   Try
      If Dlg.execute Then
      Begin
         Excel.Exec('[OPEN("'+Dlg.FileName+'")]');
         Excel.GetRange(area, StlArqTexto);
      End;

      edtPath.Text := Dlg.FileName;
      Application.ProcessMessages;
   Except
       on E:Exception Do
       Begin
          MsgDlg('Houve um Erro na Abertura da Planilha Excel.' + chr(13) + E.Message,'Aviso',mtError,[mbOk],0);
       End;

   End;

   if StlArqTexto.Count < 1 then
   begin
     MsgDlg('Planilha sem Dados para Processar.','Atenção',mtError,[mbOk],0);
     Exit;
   end;

   prgBar.Max := StlArqTexto.Count;

end;

procedure TfrmImportaOrcExcelMT.btnImportarClick(Sender: TObject);
var
  sMensLog :string;
begin
   if edtPath.Text = '' then
   begin
      MsgDlg('O Arquivo a ser importado deve ser selecionado.','Aviso',mtWarning,[mbOk], 0);
      Exit;
   end;

   Application.ProcessMessages;

   If dblkExercicio.Text = '' Then
   Begin
     MsgDlg('O Exercício deve ser Preenchido.','Atenção',mtError,[mbOk],0);
     dblkExercicio.Setfocus;
     Exit;
   End;

   if Sistema.UsaPlanoPatro then
   begin
     If dblcPlanoPrevC.Text = '' Then
     Begin
       MsgDlg('Plano Previdenciário não Preenchido.','Atenção',mtError,[mbOk],0);
       Exit;
     End;
     If dblcPatroC.Text = '' Then
     Begin
       MsgDlg('Patrocinadora não Preenchida.','Atenção',mtError,[mbOk],0);
       Exit;
     End;
   end;


   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;


   mmLog.Lines.Clear;
   mmLog.Lines.Add('---------------------------------------------------------------');
   mmLog.Lines.Add('******** Importação de Orçamentos ***********');
   mmLog.Lines.Add('---------------------------------------------------------------');
   mmLog.Lines.Add(' ');


   If CtrlProcessaContab.ImportaValoresOrcadoExcel(StlArqTexto,Sistema.idEmpresa,Sistema.IdUsuario,
                                                   StrToIntDef(dblcPlanoPrevC.LookupValue,0),
                                                   StrToIntDef(dblcPatroC.LookupValue,0),CtrlContab.PlanoParam,
                                                   StrToInt(dblkExercicio.LookupValue),Sistema.UsaPlanoPatro) Then
   Begin
        sMensLog := CtrlProcessaContab.MessageInfo + chr(13) + 'Importação dos Valores Orçados efetuada com sucesso!';
        MsgDlg(CtrlProcessaContab.MessageInfo + chr(13) + 'Importação dos Valores Orçados efetuada com sucesso!','Aviso',mtInformation,[mbOk],0);
        mmLog.Lines.Add(sMensLog);
   End Else
   Begin
     If  (Sistema.ConnectionSide = CnsClient) Then
     Begin
        MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
     End Else
     Begin
        sMensLog := 'Houve erros na importação.' + CHR(13) +
                    'Linha da Planilha: '+ IntToStr(CtrlProcessaContab.ContaLinhaTexto) + ' - '  + CtrlProcessaContab.MessageInfo  + CHR(13) + CHR(13) +
                    'O estado anterior do Banco de Dados foi retornado.';

        MsgDlg('Houve erros na importação.' + CHR(13) +
               'Linha da Planilha: '+ IntToStr(CtrlProcessaContab.ContaLinhaTexto) + ' - '  + CtrlProcessaContab.MessageInfo  + CHR(13) + CHR(13) +
               'O estado anterior do Banco de Dados foi retornado. ','Erro',mtError,[mbOk],0);

        mmLog.Lines.Add(sMensLog);
     End;
   End;

   If Anim.Active Then Anim.Active := False;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     mmLog.Lines.Add(CtrlProcessaContab.sMensAdd);
   End;

   mmLog.Lines.Add(CtrlProcessaContab.MessageInfo);
   edtPath.Text := '';

end;

procedure TfrmImportaOrcExcelMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlPeriodo.free;
  CtrlProcessaContab.free;
  StlArqTexto.free;
end;

procedure TfrmImportaOrcExcelMT.ProcMensImp(msg: String);
begin
   If Sistema.ConnectionSide <> CnsClient Then
   Begin
     if  msg <> '*' then
         mmLog.Lines.Add(msg);
     prgBar.Position := CtrlProcessaContab._Progresso;
     prgBar.Max      := CtrlProcessaContab.MaxProgresso;
     Application.ProcessMessages;
   End;
end;

procedure TfrmImportaOrcExcelMT.FormShow(Sender: TObject);
begin
  inherited;
  pnlPlanoPatroC.Enabled := Sistema.UsaPlanoPatro;

end;



end.
