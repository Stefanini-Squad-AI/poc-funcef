unit FImpFidelioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, StdCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Buttons, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, TB97, ExtCtrls, uCtrlProcessaContab,uCtrlContab,
  Db, DBClient, uCMClientDataSet, BfDialogs,uCtrlPeriodo,Halcn6DB, halcn4ip,
  BrowseFolder, uProcuraDir, DBTables, Wwtable, uCmSqlParams,
  {$IFDEF VERSAO0505} uComum, {$ELSE} uCMTypes {$ENDIF};


type
  TfrmImpFidelioMT = class(TfrmSairAjuda)
    pnlDatas: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblStatus: TLabel;
    Label3: TLabel;
    spbPath: TSpeedButton;
    lblHotel: TLabel;
    prgBarBuscaFidelio: TProgressBar;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    edPath: TEdit;
    dblcHotel: TwwDBLookupCombo;
    pnlComentario: TPanel;
    mmComentario: TMemo;
    Anim: TAnimate;
    bbtnBuscaFid: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Dlg: TProcuraDirDlg;
    cdsHotel: TCMClientDataSet;
    hdsDiarias: TwwHalcyonDataSet;
    hdsLancamentos: TwwHalcyonDataSet;
    cdsDiarias: TCMClientDataSet;
    cdsLancamentos: TCMClientDataSet;
    sqlDiarias: TCMSqlParams;
    sqlLancamen: TCMSqlParams;
    procedure spbPathClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnBuscaFidClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlProcessaContab:TCtrlProcessaContab;
    CtrlContab        :TCtrlContab;
    CtrlPeriodo       :TCtrlPeriodo;
    Function  CompletaZero(sNome: String; iTam : integer):String;
  public
    { Public declarations }
   procedure ProcMensRM(msg: String);
   procedure MontaCdsDiarias;
   procedure MontaCdsLanc;

  end;

var
  frmImpFidelioMT: TfrmImpFidelioMT;



implementation

uses uMensErro,uDataBase, DBaseDados,uSistema,uString;

{$R *.DFM}

procedure TfrmImpFidelioMT.spbPathClick(Sender: TObject);
begin
  inherited;
   If Dlg.Execute Then
   Begin
      edPath.Text := Dlg.Directory;
   End;

end;

procedure TfrmImpFidelioMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe processa contabil ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensRM);


  CtrlProcessaContab.cdsLancamentosDBF := cdsLancamentos;
  CtrlProcessaContab.cdsDiariasDBF     := cdsDiarias;

  cdsHotel.Data := CtrlProcessaContab.ListHotel(Sistema.idEmpresa);

  // *** instancia a classe periodo ***
  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   edPath.Text := CtrlContab.CaminhoFidelio;
end;

procedure TfrmImpFidelioMT.FormShow(Sender: TObject);
begin
  inherited;
  bbtnBuscaFid.Enabled := True;
  deDataIni.SetFocus;
end;

procedure TfrmImpFidelioMT.bbtnBuscaFidClick(Sender: TObject);
var
  PerIni,ExerIni,PerFim,ExerFim :Integer;
begin
   inherited;
   If Not CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.idEmpresa, deDataIni.Text) Then
   Begin
      MsgDlg(CtrlPeriodo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
      deDataIni.SetFocus;
      Exit;
   End Else
   Begin
     PerIni  := CtrlPeriodo.Periodo;
     ExerIni := CtrlPeriodo.Exercicio;
   End;

   If Not CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.idEmpresa, deDataFim.Text) Then
   Begin
      MsgDlg(CtrlPeriodo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
      deDataFim.SetFocus;
      Exit;
   End Else
   Begin
     PerFim  := CtrlPeriodo.Periodo;
     ExerFim := CtrlPeriodo.Exercicio;
   End;

   If (ExerIni <> ExerFim) or (PerIni <> PerFim) Then
   Begin
     MsgDlg('Faixa de datas deve pertencer somente a um período contábil.','Erro',mtError,[mbOk],0);
     deDataIni.SetFocus;
     Exit;
   End;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active  := True;
     lblStatus.Visible  := False;
     prgBarBuscaFidelio.Visible := False;
   End Else
   Begin
     prgBarBuscaFidelio.Visible := True;
     lblStatus.Visible          := True;
   End;
   bbtnBuscaFid.Enabled       := False;


   hdsDiarias.Active       := False;
   hdsDiarias.DatabaseName := Trim(edPath.Text);
   hdsDiarias.Active       := True;
   hdsDiarias.IndexOn(trim(edPath.Text)+'\CM_REVSTAT.NTX','','DTOS(DATUM)+MARKET','',Duplicates,Ascending);
   hdsDiarias.Index(trim(edPath.Text)+'\CM_REVSTAT.NTX','CM_REVSTAT');

   MontaCdsDiarias;

   hdsLancamentos.Active        := False;
   hdsLancamentos.DatabaseName  := Trim(edPath.Text);
   hdsLancamentos.Active        := True;
   hdsLancamentos.Index(trim(edPath.Text)+'\GLTAG.NTX','GLTAG');
   MontaCdsLanc;

  If CtrlProcessaContab.ImportaFidelio(Sistema.IdEmpresa, StrToFloat(dblcHotel.LookupValue),CtrlContab.PlanoParam,Sistema.IdUsuario,
                       edPath.Text,deDataIni.Date,deDataFim.Date,Sistema.UsaPlanoPatro) Then
  Begin
    MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk],0);
  End Else
  Begin
    MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
  End;

  bbtnBuscaFid.Enabled       := True;


end;

procedure TfrmImpFidelioMT.ProcMensRM(msg: String);
begin
   If Sistema.ConnectionSide <> CnsClient Then
   Begin
      If msg <> '*' then
        lblStatus.Caption := CtrlProcessaContab.LabelMensTela;

      prgBarBuscaFidelio.Max      := CtrlProcessaContab.MaxProgresso;
      prgBarBuscaFidelio.Position := CtrlProcessaContab.Progresso;
      Application.ProcessMessages;
   End;

end;

procedure TfrmImpFidelioMT.MontaCdsDiarias;
var sDataInv : String;
    iAno,iMes,iDia : Word;
begin
   sqlDiarias.Open;
   DecodeDate(deDataIni.Date,iAno,iMes,iDia);
   sDataInv   := CompletaZero(IntToStr(iAno),4)+CompletaZero(IntToStr(iMes),2)+CompletaZero(IntToStr(iDia),2);
   hdsDiarias.Find(sDataInv,True,True);
   While (not hdsDiarias.EOF) and
         (hdsDiarias.FieldByName('DATUM').AsDateTime >= deDataIni.Date) and
         (hdsDiarias.FieldByName('DATUM').AsDateTime <= deDataFim.Date) do
   Begin
      cdsDiarias.Insert;
      cdsDiarias.FieldByName('DATUM').AsDateTime := hdsDiarias.FieldByName('DATUM').AsDateTime;
      cdsDiarias.FieldByName('UTAG').AsFloat := hdsDiarias.FieldByName('UTAG').AsFloat;
      cdsDiarias.FieldByName('MARKET').AsString := hdsDiarias.FieldByName('MARKET').AsString;
      cdsDiarias.Post;
      hdsDiarias.Next;
   End;
end;

procedure TfrmImpFidelioMT.MontaCdsLanc;
var sDataInv : String;
    iAno,iMes,iDia : Word;
begin
   sqlLancamen.Open;
   DecodeDate(deDataIni.Date,iAno,iMes,iDia);
   sDataInv := CompletaZero(IntToStr(iAno),4)+CompletaZero(IntToStr(iMes),2)+CompletaZero(IntToStr(iDia),2);
   //
   hdsLancamentos.Find(sDataInv,True,True);
   While (not hdsLancamentos.EOF) and
         (hdsLancamentos.FieldByName('DATUM').AsDateTime >= deDataIni.Date) and
         (hdsLancamentos.FieldByName('DATUM').AsDateTime <= deDataFim.Date) do
   Begin
      cdsLancamentos.Insert;
      cdsLancamentos.FieldByName('DATUM').AsDateTime := hdsLancamentos.FieldByName('DATUM').AsDateTime;
      cdsLancamentos.FieldByName('UTAG').AsFloat := hdsLancamentos.FieldByName('UTAG').AsFloat;
      cdsLancamentos.FieldByName('LNR').AsString := hdsLancamentos.FieldByName('LNR').AsString;
      cdsLancamentos.Post;
      hdsLancamentos.Next;
   End;
end;

procedure TfrmImpFidelioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlProcessaContab.free;
  CtrlContab.free;
  CtrlPeriodo.free;
end;

function TfrmImpFidelioMT.CompletaZero(sNome: String;
  iTam: integer): String;
var i, k : integer;
begin
   sNome  := trim(sNome);
   i      := length(sNome);
   Result := '';
   for k := 1 to (iTam - i) do
      Result := Result + '0';
   Result := Result + sNome;
end;

end.
