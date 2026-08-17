unit FImportaExcelMT;

interface

(*==============================================================================
Analista : Alex Pereira
Data     : 11/02/04
Pendência: 14451 Nova estrutura para segregação IDSEGREGACRITER
==============================================================================*)

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97,uCtrlContab,uCtrlListTerceiros, Db, DBClient,
  uCMClientDataSet,uCtrlProcessaContab, uCMTypes,
  Mask, wwdbedit, Wwdbspin, ComObj;

type
  TfrmImportaExcelMT = class(TfrmSairAjuda)
    Panel3: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    btnSelecionar: TBitBtn;
    edtPath: TEdit;
    dblkTipoOper: TwwDBLookupCombo;
    edData: TCMDateTimePicker;
    cdsTipoOper: TCMClientDataSet;
    opdlgtxt: TOpenDialog;
    btnImportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    prbImportar: TProgressBar;
    Anim: TAnimate;
    edtLinhaFinal: TwwDBSpinEdit;
    Label2: TLabel;
    Bevel2: TBevel;
    Panel1: TPanel;
    mmLog: TRichEdit;
    Label4: TLabel;
    edtColIni: TEdit;
    edtColFinal: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlContab     :TCtrlContab;
    ListTerceiros  :TCtrlListTerceiros;
    CtrlProcessaContab :TCtrlProcessaContab;
    procedure ProcMensImp(msg: String);

  public
    { Public declarations }
  end;

var
  frmImportaExcelMT: TfrmImportaExcelMT;

implementation

uses  UMensErro, uDatabase, DBaseDados,
     uSistema, uModulo, uData, uExcel;

{$R *.DFM}

var
  Excel   : TExcel;
  cSistOri:string;

procedure TfrmImportaExcelMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe lancamento ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensImp);

  // *** Instancia a classe Terceiros ***
  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsTipoOper.Data := ListTerceiros.ListTipoOper(false);

  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


end;

procedure TfrmImportaExcelMT.btnSelecionarClick(Sender: TObject);
begin
  inherited;
   prbImportar.Max := 0;

   prbImportar.Position := 0;
   mmLog.Clear;

   OpDlgTxt.execute;
   Try


      edtPath.Text := OpDlgTxt.FileName;
      Application.ProcessMessages;
   Except
       on E:Exception Do
       Begin
          MsgDlg('Houve um Erro na Abertura da Planilha Excel.' + chr(13) + E.Message,'Aviso',mtError,[mbOk],0);
       End;

   End;
   prbImportar.Max := trunc(edtLinhaFinal.value);

end;

procedure TfrmImportaExcelMT.btnImportarClick(Sender: TObject);
var
  sMensLog :string;
begin

   If (edtLinhaFinal.text = '') or (edtLinhaFinal.Value <= 0) Then
   Begin
      MsgDlg('A Linha Final deve ser Preenchida.','Aviso',mtError,[mbOk],0);
      edtLinhaFinal.SetFocus;
      Exit;
   End;

   If dblkTipoOper.Text = '' Then
   Begin
     MsgDlg('Tipo de Operação não Preenchida.','Atenção',mtError,[mbOk],0);
     dblkTipoOper.Setfocus;
     Exit;
   End;


   If edtLinhaFinal.Text = '' Then
   Begin
      MsgDlg('Linha Final não Preenchida.','Atenção',mtError,[mbOk],0);
      edtLinhaFinal.Setfocus;
      Exit;
   End;

   If edData.Text = '' Then
   Begin
      MsgDlg('Data não Preenchida.','Atenção',mtError,[mbOk],0);
      Exit;
   End;

   If MsgDlg('Deseja que os dados sejam importados e INTEGRADOS com a Contabilidade?','Atenção',mtConfirmation,[mbYes, mbNo],0) = mrYes Then
      cSistOri := '1'
   Else
      cSistOri := '2';

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;


   mmLog.Lines.Clear;
   mmLog.Lines.Add('----------------------------------------------------');
   mmLog.Lines.Add('******** Planilhas Lançadas ***********');
   mmLog.Lines.Add('----------------------------------------------------');
   mmLog.Lines.Add(' ');

   if not CtrlProcessaContab.ImportaPlanilha(sistema.idempresa, edtPath.Text, 1, trunc(edtLinhaFinal.value),
                                             CtrlContab.PlanoParam, sistema.idmodulo, sistema.idusuario, edData.text, dblkTipoOper.LookupValue) then
   Begin
     If  (Sistema.ConnectionSide = CnsClient) Then
     Begin
        MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
        mmLog.Lines.Add('Erro: ' + CtrlProcessaContab.MessageInfo + chr(13));
     End Else
     Begin
        sMensLog := 'Houve erros na importação.' + CHR(13) +
                    'Linha da Planilha: '+ IntToStr(CtrlProcessaContab.ContaLinhaTexto) + ' - '  + CtrlProcessaContab.MessageInfo  + CHR(13) + CHR(13) +
                    'O estado anterior do Banco de Dados foi retornado. ' + CHR(13) +
                    'Verifique os Lançamentos com inconsistências.';

        MsgDlg('Houve erros na importação.' + CHR(13) +
               'Linha da Planilha: '+ IntToStr(CtrlProcessaContab.ContaLinhaTexto) + ' - '  + CtrlProcessaContab.MessageInfo  + CHR(13) + CHR(13) +
               'O estado anterior do Banco de Dados foi retornado. ' + CHR(13) +
               'Verifique os Lançamentos com inconsistências.','Erro',mtError,[mbOk],0);

        mmLog.Lines.Add(sMensLog);
     End;
     mmLog.Lines.Add('Lançamentos NÃO efetuados!');
   End;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     mmLog.Lines.Add(CtrlProcessaContab.sMensAdd);
   End;

   If Anim.Active Then Anim.Active := False;

   mmLog.Lines.Add(CtrlProcessaContab.MessageInfo);
   edtPath.Text := '';

end;

procedure TfrmImportaExcelMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CtrlContab.free;
  ListTerceiros.free;
  CtrlProcessaContab.free;
  inherited;
end;

procedure TfrmImportaExcelMT.ProcMensImp(msg: String);
begin
   If Not (Sistema.ConnectionSide = CnsClient) Then
   Begin
      If CtrlProcessaContab.Error Then
      Begin
        If msg <> '*' then
           mmLog.Lines.Add(msg);
      End;
      prbImportar.Position := CtrlProcessaContab._Progresso;
      Application.ProcessMessages;
   End;
end;



end.
